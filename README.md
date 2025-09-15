# Movies & Shows Suggester
#### Video Demo:  <https://www.youtube.com/watch?v=HjSyOWvcPe8>
#### Description: This project is a Flask application that query for the best movies and shows from Netflix (up to 2025), from two different databases (shows.db, movies.db). It also has a API from openAI that assist with questions related to movies and shows (e.g. "bests shows in 2021", "movies with x,y,z actors", etc..).


#### Goal of this project:
- Have you ever felt stuck in front of your television trying to peak a good movie or tv show to watch, it usually happening yours Friday night correct ;), when you are already tired to make decisions from all your working week right? Well,  this program can help you narrowing the best movies and tv show so you can pick one easily and watch it.
The goal of this project it to assist people (you! :) to find the best movies and shows for your entertainment. Have fun!!!

## CS50 Requirements:
Your project’s title: Movies & Shows Suggester
Your name: Matheus Norberto Hagemann
GitHub username: M-Hagemann87
edX usernames: M_2505_9Z7C
Your city and country:  Campo Alegre, Brazil
Date you have recorded this video: 15/09/2025

=====
Need to learn for this project:
1 - python library: pandas (for create_db_movies.py and create_db_shows.py, to convert csv  file to database).
2 - AI API => [client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))]

========
Solution of problems:
- Change "cast" table column name to "cast_name", due to CAST being a SQL function (to convert a value of one data type to another).


# Explaining each file:
## app.py
- This file is the main logic of the Flask website. It interact with the databases (movies.db, and shows.db) and appresent the queries in the website accordingly with the "check box" that are selected.

## create_db_movies.py
This is a show python program exclusively tasked to convert the "netflix2025.csv" that is a Comma-Separated Values text file format to a Database "movies.db"

## create_db_shows.py
This is a show python program exclusively tasked to convert the "netflix_shows2025.csv" that is a Comma-Separated Values text file format to a Database "shows.db"

## netflix_shows2025.csv
The file "netflix_shows2025.csv" is the csv file for shows; CSV (Comma-Separated Values) file that is a plain text file format for storing tabular data. It stores the data from Netflix.

## netflix2025.csv
The file "netflix2025.csv" is; CSV (Comma-Separated Values) file that is a plain text file format for storing tabular data. It stores the data from Netflix.

## requirements.txt
Is the requirements for the program to run. Follow the requirements:
CS50
Flask
Flask-Session
pytz
requests
openai
python-dotenv

## movies.db
Database release_year from 2010 to 2025.
SELECT date_added, release_year FROM movies ORDER BY release_year DESC LIMIT 5;
SELECT date_added, release_year FROM movies ORDER BY release_year LIMIT 5;

## shows.db
Database release_year from 2010 to 2025.
SELECT date_added, release_year FROM shows ORDER BY release_year DESC LIMIT 5;
SELECT date_added, release_year FROM shows ORDER BY release_year LIMIT 5;

## specifications.txt
In the specifications folder is listed the PIP that need to be installed:
=======> Installation needed to run the program:
pip install openai
pip install pandas
pip install python-dotenv

## static/styles.css
Is the file program of the style of the website.

## templates/index.html
It is the html program that defines the interaction of the website (buttons, checkboxes, etc..)

## code .env
It is a hidden configuration file used to store sensitive information (API key from open AI), they are not hard-coded in the program.
Example:
OPENAI_API_KEY= exampleexamplexyz111111111111

## Flask program:

### Columns:
[ ] Add Cast -> To add the cast name column, and project to the table the name of the cast for that movie/show in the specific row.
[ ] Add Genres -> To add the genres column, and project to the table the genres of that movie/show in it's specific row.
[ ] Add Director -> To add the director column, and project to the table the director of that movie/show in it's specific row.
[ ] Add Language -> To add the language column, and project to the table the language of that movie/show in it's specific row.

### Ordering of the table (Order by):
[ ] Order by Rating -> It is the checkbox to order the whole table by Rating.
[ ] Order by Popularity -> It is the checkbox to order the whole table by Popularity.
[ ] Order by Vote Count -> It is the checkbox to order the whole table by Vote Count.
Note 1: if for example it wants to order by rating, vote count and popularity, the one that is checked first will be the priority follow the others evaluations.
Note 2: Title, Rating, Popularity and Vote_count are standard shown in the table.

###  Filter by cast name // Apply

It is a text box that the user can write down a specific star name to check for (order by) their movies/shows.

### Example 1:
If the user wants to check the best movies from Gina Carano, and want to order by popularity, and also show her name, it the Flask website it would be like:

(o) Movies
[x] Order by Popularity
[x] Add Cast
{Gina Carno} Apply

So the result in order would be the movies: Deadpool, Heist, Haywire...

And this would be same as the SQL query:
(Access database; sqlite3 movies.db)

SELECT title, rating, popularity, vote_count, cast_name FROM movies
WHERE cast_name LIKE "%Gina Carano%"
ORDER BY popularity DESC
LIMIT 10;

### schema movies.db:
CREATE TABLE IF NOT EXISTS "movies" (
"show_id" INTEGER,
  "type" TEXT,
  "title" TEXT,
  "director" TEXT,
  "cast_name" TEXT,
  "country" TEXT,
  "date_added" TEXT,
  "release_year" INTEGER,
  "rating" REAL,
  "duration" REAL,
  "genres" TEXT,
  "language" TEXT,
  "description" TEXT,
  "popularity" REAL,
  "vote_count" INTEGER,
  "vote_average" REAL,
  "budget" INTEGER,
  "revenue" INTEGER
);

### schema shows.db
CREATE TABLE IF NOT EXISTS "shows" (
"show_id" INTEGER,
  "type" TEXT,
  "title" TEXT,
  "director" TEXT,
  "cast_name" TEXT,
  "country" TEXT,
  "date_added" TEXT,
  "release_year" INTEGER,
  "rating" REAL,
  "duration" TEXT,
  "genres" TEXT,
  "language" TEXT,
  "description" TEXT,
  "popularity" REAL,
  "vote_count" INTEGER,
  "vote_average" REAL
);

# Ask AI

- In the text box + button Ask AI, it is an API program using the open AI base to suggest movies and series for the user, depending on the questions written down.

For example(1): For a query: "2021"
It might appear the suggestions:

no	Title	                                    Platform	Type
1	Squid Game	                                Netflix	    Show
2	The White Lotus	                            HBO Max	    Show
3	Ted Lasso	                                Apple TV+	Show
4	Dune	                                    HBO Max	    Movie
5	Shang-Chi and the Legend of the Ten Rings	Disney+	    Movie

Or, another example(2): "Natalie Portman as teenager"
We might have:

no	Title	                                    Platform	    Type
1	Léon: The Professional	                    Prime Video	    Movie
2	Star Wars: Episode I - The Phantom Menace	Disney+	        Movie
3	Anywhere But Here	                        Disney+	        Movie
4	Where the Heart Is	                        Prime Video	    Movie
5	Beautiful Girls	                            Amazon Prime    Movie

