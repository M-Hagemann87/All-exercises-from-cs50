----SELECT name from songs
--WHERE artist_id =
--    (SELECT id FROM artists
--    WHERE name LIKE 'Post Malone%')
--;

SELECT name from songs
WHERE artist_id =
    (SELECT id FROM artists
    WHERE name = 'Post Malone')
;



---SELECT "title" FROM "longlist" WHERE "title" LIKE 'The %';
