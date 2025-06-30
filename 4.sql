SELECT "players"."first_name", "players"."last_name", "salaries"."salary"
FROM "players"
FULL JOIN "salaries" ON "salaries"."player_id" = "players"."id"
WHERE "players"."first_name" != 'NULL'
AND "salaries"."salary" != 'NULL'
AND "salaries"."year" = '2001'
ORDER BY "salaries"."salary", "players"."first_name", "players"."last_name", "players"."id"
LIMIT 50;
