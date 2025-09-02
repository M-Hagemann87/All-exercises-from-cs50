SELECT title FROM movies, stars, people
WHERE movies.id = stars.movie_id
AND people.id = stars.person_id
AND people.name IN ('Jennifer Lawrence', 'Bradley Cooper')
GROUP BY title
HAVING COUNT(DISTINCT people.name) = 2;
