SELECT "column" FROM "table"
WHERE "column" > (
    SELECT AVG("column")
    FROM "table"
);
