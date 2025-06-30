SELECT "year", "salary" FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id"
WHERE "players"."first_name" = 'Cal'
AND "players"."last_name" = 'Ripken'
GROUP BY "year"
ORDER BY "year" DESC;

--SELECT * FROM "players"
--WHERE "last_name" = 'Ripken';
--Cal Ripken Jr.
--id =  15726
