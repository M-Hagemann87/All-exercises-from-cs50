SELECT people.name FROM movies, people, stars
WHERE movies.id = stars.movie_id
AND people.id = stars.person_id
--AND NOT name = 'Kevin Bacon'
AND stars.movie_id = (SELECT movies.id FROM movies, people, stars
    WHERE movies.id = stars.movie_id
    AND people.id = stars.person_id
    AND people.name = 'Kevin Bacon'
    AND people.birth = 1958
);

