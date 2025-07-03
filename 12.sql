SELECT "players"."first_name", "players"."last_name"
FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "performances"."player_id" = "salaries"."player_id"
WHERE "performances"."H" != '0'
AND "salaries"."year" = '2001'
AND "performances"."year" = '2001'
GROUP BY "salaries"."player_id", "performances"."player_id"
ORDER BY "salaries"."player_id",
    (SELECT "salaries"."salary" / "performances"."RBI" AS "salary_per_rbi"
    FROM "salaries"
    JOIN "players" ON "players"."id" = "salaries"."player_id"
    JOIN "performances" ON "performances"."player_id" = "salaries"."player_id"
    ORDER BY "salary_per_rbi"),
    (SELECT "salaries"."salary" / "performances"."H" AS "dollars per hit" FROM "salaries"
    JOIN "players" ON "players"."id" = "salaries"."player_id"
    JOIN "performances" ON "performances"."player_id" = "salaries"."player_id"
    ORDER BY "dollars per hit")
LIMIT 10;
