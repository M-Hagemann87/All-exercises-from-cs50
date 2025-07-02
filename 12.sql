SELECT "players"."first_name", "players"."last_name",
"salaries"."salary" / "RBI" AS "salary_per_rbi"
FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "performances"."player_id" = "salaries"."player_id"
WHERE "salaries"."year" = '2001'
GROUP BY "salary_per_rbi"
ORDER BY "salaries"."player_id"
LIMIT 10;
