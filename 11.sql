SELECT "players"."first_name", "players"."last_name",
"salaries"."salary" / "performances"."H" AS "dollars per hit"
FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "performances"."player_id" = "salaries"."player_id"
WHERE "performances"."H" != '0'
AND "salaries"."year" = '2001'
GROUP BY "dollars per hit"
ORDER BY "dollars per hit", "players"."first_name", "players"."last_name"
LIMIT 10;
