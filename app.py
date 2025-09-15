import os

from cs50 import SQL
from flask import Flask, flash, redirect, render_template, request, session
from flask_session import Session
from werkzeug.security import check_password_hash, generate_password_hash

from helpers import apology, login_required, lookup, usd
app = Flask(__name__)
app.jinja_env.filters["usd"] = usd

app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

db = SQL("sqlite:///finance.db")


@app.after_request
def after_request(response):

    """Ensure responses aren't cached"""
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Expires"] = 0
    response.headers["Pragma"] = "no-cache"

    return response

@app.route("/")

@login_required
def index():
    """Show portfolio of stocks"""
    user_id = session["user_id"]


    rows = db.execute("""
        SELECT symbol, SUM(shares) AS total_shares
        FROM accounts
        WHERE user_id = ?
        GROUP BY symbol
        HAVING total_shares > 0
    """, user_id)

    holdings = []
    portfolio_total = 0.0

    for row in rows:
        quote = lookup(row["symbol"])
        if not quote:
            return apology("lookup failed")


        shares = row["total_shares"]
        price = quote["price"]
        total = shares * price
        portfolio_total += total

        holdings.append({
            "symbol": quote["symbol"],
            "name": quote["name"],
            "shares": shares,
            "price": price,
            "total": total
        })

    cash = db.execute("SELECT cash FROM users WHERE id = ?", user_id)[0]["cash"]
    grand_total = cash + portfolio_total


    return render_template("index.html", holdings=holdings, cash=cash, grand_total=grand_total)


@app.route("/buy", methods=["GET", "POST"])
@login_required
def buy():
    """Buy shares of stock"""

    if request.method == "POST":
        symbol = request.form.get("symbol")
        shares_raw = request.form.get("shares")

        quote = lookup(symbol) if symbol else None
        if not symbol or not quote:
            return apology("invalid symbol")
        if not shares_raw or not shares_raw.isdigit():
            return apology("shares must be a positive integer")

        shares = int(shares_raw)
        if shares <= 0:
            return apology("shares must be > 0")

        price = quote["price"]
        cost = shares * price

        user_id = session["user_id"]
        cash_row = db.execute("SELECT cash FROM users WHERE id = ?", user_id)
        cash = cash_row[0]["cash"]

        if cost > cash:
            return apology("can't afford")

        db.execute("INSERT INTO accounts (user_id, symbol, shares, price) VALUES (?, ?, ?, ?)",
                   user_id, quote["symbol"], shares, price)
        db.execute("UPDATE users SET cash = ? WHERE id = ?", cash - cost, user_id)

        flash("Bought!")
        return redirect("/")
    else:
        return render_template("buy.html")




@app.route("/history")
@login_required
def history():
    """Show history of accounts"""
    user_id = session["user_id"]
    rows = db.execute("""
        SELECT symbol, shares, price, transacted
        FROM accounts
        WHERE user_id = ?
        ORDER BY transacted DESC, id DESC
    """, user_id)
    return render_template("history.html", rows=rows)


@app.route("/login", methods=["GET", "POST"])
def login():
    """Log user in"""

    session.clear()
    if request.method == "POST":
        if not request.form.get("username"):
            return apology("must provide username", 403)
        elif not request.form.get("password"):
            return apology("must provide password", 403)

        rows = db.execute(
            "SELECT * FROM users WHERE username = ?", request.form.get("username")
        )

        if len(rows) != 1 or not check_password_hash(
            rows[0]["hash"], request.form.get("password")
        ):
            return apology("invalid username and/or password", 403)
        session["user_id"] = rows[0]["id"]
        return redirect("/")
    else:
        return render_template("login.html")


@app.route("/logout")
def logout():
    """Log user out"""
    session.clear()
    return redirect("/")


@app.route("/quote", methods=["GET", "POST"])
@login_required
def quote():
    """Get stock quote."""
    if request.method == "POST":
            symbol = request.form.get("symbol")
            if not symbol:
                return apology("must provide symbol")
            quote = lookup(symbol)
            if not quote:
                return apology("invalid symbol")
            return render_template("quoted.html", quote=quote)
    else:
        return render_template("quote.html")


@app.route("/register", methods=["GET", "POST"])
def register():
    """Register user"""
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password")
        confirmation = request.form.get("confirmation")

        if not username:
            return apology("must provide username")
        if not password:
            return apology("must provide password")
        if password != confirmation:
            return apology("passwords must match")
        hash_ = generate_password_hash(password)

        try:
            new_id = db.execute(
                "INSERT INTO users (username, hash) VALUES (?, ?)",
                username, hash_
            )
        except Exception:
            return apology("username taken")

        session["user_id"] = new_id
        flash("Registered!")
        return redirect("/")
    else:
        return render_template("register.html")


@app.route("/sell", methods=["GET", "POST"])
@login_required
def sell():
    """Sell shares of stock"""
    user_id = session["user_id"]

    if request.method == "POST":
        symbol = request.form.get("symbol")
        shares_raw = request.form.get("shares")

        if not symbol:
            return apology("must choose symbol")
        if not shares_raw or not shares_raw.isdigit():
            return apology("shares must be a positive integer")

        shares = int(shares_raw)
        if shares <= 0:
            return apology("shares must be > 0")

        owned_row = db.execute("""
            SELECT COALESCE(SUM(shares), 0) AS total
            FROM accounts
            WHERE user_id = ? AND symbol = ?
        """, user_id, symbol)[0]
        owned = owned_row["total"]

        if shares > owned:
            return apology("too many shares")

        quote = lookup(symbol)
        if not quote:
            return apology("invalid symbol")

        price = quote["price"]
        proceeds = shares * price

        db.execute("INSERT INTO accounts (user_id, symbol, shares, price) VALUES (?, ?, ?, ?)",
                   user_id, symbol, -shares, price)
        cash = db.execute("SELECT cash FROM users WHERE id = ?", user_id)[0]["cash"]
        db.execute("UPDATE users SET cash = ? WHERE id = ?", cash + proceeds, user_id)

        flash("Sold!")
        return redirect("/")
    else:

        rows = db.execute("""
            SELECT symbol
            FROM accounts
            WHERE user_id = ?
            GROUP BY symbol
            HAVING SUM(shares) > 0
        """, user_id)

        return render_template("sell.html", symbols=rows)

