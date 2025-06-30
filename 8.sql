SELECT "salary" FROM "salaries"
JOIN "performances" ON "performances"."player_id" = "salaries"."player_id"
WHERE "performances"."year" = '2001'
ORDER BY "H" DESC
LIMIT 1;
