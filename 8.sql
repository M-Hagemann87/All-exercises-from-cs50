SELECT ROUND(AVG("height"), 2) AS "Average Height", ROUND(AVG("weigth"), 2) AS "Average Weight" FROM "players"
WHERE "debuted" <= date('2000-01-01');
