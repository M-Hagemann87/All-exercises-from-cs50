SELECT title FROM movies, stars, people
WHERE movies.id = stars.movie_id
AND people.id = stars.person_id
AND people.name = 'Bradley Cooper'
AND people.name = 'Jennifer Lawrence';
