
SELECT * FROM "meteorites_temp"
WHERE "nametype" = 'Relict'
LIMIT  10;
---
DELETE FROM "meteorites_temp" WHERE "nametype" = 'Relict';


DELETE FROM "collections" WHERE "title" = 'Spring outing';
