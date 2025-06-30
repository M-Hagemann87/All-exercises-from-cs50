SELECT "players"."first_name", "players"."last_name", "salaries"."salary"
FROM "players"
FULL JOIN "salaries" ON "salaries"."player_id" = "players"."id"
WHERE "first_name" != 'NULL' AND "salary" != 
ORDER BY "salary", "first_name", "last_name", "player_id"
LIMIT 50;
