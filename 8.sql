SELECT "salary" FROM "salaries"
JOIN "performances" ON "performances"."player_id" = "salaries"."player_id"
WHERE "performances"."year" = '2001'
ORDER BY "H" DESC;
LIMIT 1;

SELECT * FROM "salaries"
WHERE "player_id" = 17288;
LIMIT 50;


SELECT * FROM "performances"
ORDER BY "H" DESC
LIMIT 50;
