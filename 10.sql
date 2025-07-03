SELECT "players"."first_name", "players"."last_name",
"salaries"."salary", "performances"."HR", "salaries"."year"
FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "performances"."player_id" = "salaries"."player_id"
WHERE "salaries"."year" = "performances"."year"
ORDER BY "players"."id",
"salaries"."year" DESC,
"performances"."H" DESC,
"salaries"."salary" DESC;
