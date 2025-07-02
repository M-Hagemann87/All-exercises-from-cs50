SELECT "players"."first_name", "players"."last_name",
"salaries"."salary" / "performances"."H" AS "dollars per hit", "salaries"."player_id"
FROM "salaries"
LEFT JOIN "players" ON "players"."id" = "salaries"."player_id"
RIGHT JOIN "performances" ON "performances"."player_id" = "salaries"."player_id"
WHERE "performances"."H" != '0'
AND "salaries"."year" = '2001'
GROUP BY "salaries"."player_id"
ORDER BY "dollars per hit", "players"."first_name", "players"."last_name"
LIMIT 10;

