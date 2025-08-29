---SELECT name FROM people, directors, movies
---WHERE people.id = directors.person_id
---AND movies.id = directors.movie_id
---AND title = 'Toy Story';

SELECT name FROM stars, movies, people
WHERE movies.id = stars.movie_id
AND people.id = stars.person_id
AND title = 'Toy Story';

