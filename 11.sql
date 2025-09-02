SELECT title FROM people, stars, movies, ratings
WHERE movies.id = stars.movie_id
AND people.id = stars.person_id
AND ratings.movie_id = movies.id
AND people.name = 'Chadwick Boseman'
GROUP BY movies.title
ORDER  BY ratings.rating DESC
LIMIT 5;
