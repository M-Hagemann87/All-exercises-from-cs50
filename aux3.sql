SELECT * FROM "meteorites_temp"
LIMIT  100;
---
UPDATE "meteorites_temp" SET "lat" = (
    SELECT ROUND("lat", 2) FROM "meteorites_temp"
)
    WHERE "lat" = "meteorites_temp"."lat"
;
---
UPDATE "meteorites_temp" SET "long" = (
    SELECT ROUND("long", 2) FROM "meteorites_temp"
);

UPDATE "meteorites_temp" SET "lat" = ROUND("lat",2);

UPDATE "meteorites_temp" SET "long" = ROUND("long",2);

UPDATE "meteorites_temp" SET "mass" = ROUND("mass",2);
