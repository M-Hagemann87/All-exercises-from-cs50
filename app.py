import os
from cs50 import SQL
from flask import Flask, render_template, request
from dotenv import load_dotenv
from openai import OpenAI
import markdown2

app = Flask(__name__)
app.config["TEMPLATES_AUTO_RELOAD"] = True

load_dotenv()
client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

db_movies = SQL("sqlite:///movies.db")
db_shows = SQL("sqlite:///shows.db")

ALLOWED_ORDER_COLS = ["rating", "popularity", "vote_count"]
DEFAULT_ORDER_COLS = ["vote_count", "popularity"]

EXTRA_COLUMNS = {"cast": "cast_name", "genres": "genres", "director": "director", "language": "language"}

@app.route("/", methods=["GET", "POST"])
def index():
    ### AI movies tips:
    ai_response_html = ""
    user_prompt = ""
    if request.method == "POST" and request.form.get("action") == "ask_ai":
        user_prompt = request.form.get("user_prompt", "").strip()
        if not user_prompt:
            user_prompt = "movies and series"

        system_prompt = f"""
        You are a movie and TV recommendation assistant.

        === RULES ===
        - Suggest only popular and highly rated movies or shows.
        - Never include adult (18+) content.
        - The table must have these columns: no | Title | Platform | Type
        - The "no" column must always be sequential numbers starting from 1.

        === DEFAULT BEHAVIOR ===
        - Recommend 5 items (expand up to 10 only if explicitly requested).
        - Prefer content released in the last 30 days.
        - Always output exactly one Markdown table and nothing else.
        - If no results are possible, explain why.

        === OUTPUT FORMAT ===
        - Always that possible return only a valid Markdown table (priority), return a text explanation if the Markdown table cannot be developed (but avoid it).
        - Avoid as much as possible to include any explanations, comments, or text outside the table.

        === EXAMPLE OUTPUT ===
        | no | Title                          | Platform      | Type  |
        |----|--------------------------------|---------------|-------|
        | 1  | The Åre Murders                | Netflix       | Show  |
        | 2  | Toxic Town                     | Netflix       | Show  |
        | 3  | Missing You                    | Netflix       | Show  |
        | 4  | All Quiet on the Western Front | Netflix       | Movie |
        | 5  | Air                            | Amazon Prime  | Movie |

        === USER QUERY CONTEXT ===
        {user_prompt}
        """
        ###
        try:
            chat_completion = client.chat.completions.create(
                model="gpt-4o",
                messages=[
                    {"role": "system", "content": system_prompt},
                    {"role": "user", "content": user_prompt},
                ]
            )
            ai_response = chat_completion.choices[0].message.content
            ai_response_html = markdown2.markdown(ai_response, extras=["tables"])
        except Exception as e:
            ai_response_html = f"<p style='color:red;'>Error getting AI response: {e}</p>"

    ###
    limit = 10
    select_table = request.form.get("table", "movies")
    db = db_movies if select_table == "movies" else db_shows

    cast_name = request.form.get("cast_name", "").strip()
    order_sequence = request.form.get("order_sequence", "").strip()
    order_cols = [c for c in order_sequence.split(",") if c in ALLOWED_ORDER_COLS] if order_sequence else DEFAULT_ORDER_COLS

    ### Columns
    selected_columns_display = ["title", "rating", "popularity", "vote_count"]
    selected_columns_sql = ["title", "rating", "popularity", "vote_count"]
    for col, db_col in EXTRA_COLUMNS.items():
        if request.form.get(col) == "on":
            selected_columns_display.append(col)
            selected_columns_sql.append(db_col)

    ### Query
    query = f'SELECT {", ".join(selected_columns_sql)} FROM {select_table}'
    params = {}
    if cast_name:
        query += ' WHERE cast_name LIKE :cast_name'
        params["cast_name"] = f"%{cast_name}%"

    if order_cols:
        query += " ORDER BY " + ", ".join(f"{c} DESC" for c in order_cols)

    query += f" LIMIT {limit};"
    results = db.execute(query, **params)

    return render_template(
        "index.html",
        results=results,
        table=select_table,
        cast_name=cast_name,
        order_cols=order_cols,
        order_sequence=",".join(order_cols),
        selected_columns=selected_columns_display,
        ai_response=ai_response_html,
        user_prompt=user_prompt
    )

if __name__ == "__main__":
    app.run(debug=True)
