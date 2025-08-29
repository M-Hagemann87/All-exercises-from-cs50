SELECT name FROM people, directors, movies
WHERE people.id = directors.person_id
AND movies.id = directors.movie_id
AND movies.title = 'Toy Story';
