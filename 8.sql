SELECT ROUND(AVG("height"), 2) AS "Average Height", ROUND(AVG("weight"), 2) AS "Average Weight" FROM "players"
WHERE "debut" BETWEEN date('2000-01-01') AND ('2025-12-31');
