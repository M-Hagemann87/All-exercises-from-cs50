SELECT * FROM "meteorites_temp"
LIMIT  100;

SELECT * FROM "meteorites"
LIMIT  500;

-----
SELECT * FROM "meteorites_temp"
WHERE "year" IS NULL
LIMIT  10;
---------
SELECT * FROM "meteorites_temp"
WHERE "lat" IS NULL
LIMIT  10;
---- RESTART::
DROP TABLE IF EXISTS "meteorites_temp";
DROP TABLE IF EXISTS "meteorites";

CREATE TABLE "meteorites_temp"(
    "name" TEXT,
    "id" INTEGER NOT NULL,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

--.import --csv --skip 1 meteorites.csv meteorites_temp








---------
UPDATE "meteorites_temp" SET "mass" = NULL
WHERE "mass" = '';

UPDATE "meteorites_temp" SET "year" = NULL
WHERE "year" = '';


UPDATE "meteorites_temp" SET "mass" = (
    SELECT "mass" FROM "meteorites_temp"
    WHERE "mass" IS NULL
)

UPDATE "created" SET "artist_id" = (
    SELECT "id" FROM "artists"
    WHERE "name" = 'Li Yin'
);
