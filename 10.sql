SELECT "players"."first_name", "players"."last_name",
"salaries"."salary", "performances"."HR", "salaries"."year" , "performances"."H"
FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "performances"."player_id" = "salaries"."player_id"
GROUP BY "salaries"."year"
ORDER BY "salaries"."player_id",
"salaries"."year" DESC,
"performances"."H" DESC,
"salaries"."salary" DESC
LIMIT 50;
