SELECT "teams"."name", ROUND(AVG("salaries"."salary"), 2) AS "average salary" FROM "salaries"
JOIN "teams" ON "teams"."id" = "salaries"."team_id"
GROUP BY "teams"."id"
ORDER BY "average salary"
LIMIT 5;



---SELECT * FROM "salaries"
---JOIN "teams" ON "teams"."id" = "salaries"."team_id"
---GROUP BY "teams"."name"
---ORDER BY "average salary"
---LIMIT 50;
