SELECT * FROM "meteorites_temp"
LIMIT  50;
---
UPDATE "meteorites_temp" SET "year" = (
    SELECT "year" FROM "meteorites_temp"
    ORDER BY "year", "name"
);


UPDATE "meteorites_temp" SET "year" = ORDER BY ("year", "name");

trim("title");
