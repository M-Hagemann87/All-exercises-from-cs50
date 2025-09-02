SELECT AVG(rating) FROM ratings, movies
WHERE ratings.movie_id = movies.id
AND year = 2012;

--WHERE  shows.id = stars.show_id
