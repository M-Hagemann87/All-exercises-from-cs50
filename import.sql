--1 Create final and temp tables
CREATE TABLE "meteorites"(
    "name" TEXT,
    "id" INTEGER NOT NULL,
    "nametype" TEXT,
    "mass" REAL,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY ("id")
);

CREATE TABLE "meteorites_temp"(
    "name" TEXT,
    "id" INTEGER NOT NULL,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY ("id")
);

--2 Import data
.import --csv --skip 1 meteorites.csv meteorites_temp

--3 Replace empty values with NULL
UPDATE "meteorites_temp" SET "mass" = NULL WHERE "mass" = '';
UPDATE "meteorites_temp" SET "year" = NULL WHERE "year" = '';
UPDATE "meteorites_temp" SET "lat" = NULL WHERE "lat" = '';
UPDATE "meteorites_temp" SET "long" = NULL WHERE "long" = '';

--4 Round decimal values
UPDATE "meteorites_temp" SET "mass" = ROUND("mass", 2);
UPDATE "meteorites_temp" SET "lat" = ROUND("lat", 2);
UPDATE "meteorites_temp" SET "long" = ROUND("long", 2);

--5 Remove Relict rows
DELETE FROM "meteorites_temp" WHERE "nametype" = 'Relict';

--6 Insert into final table with reordered and renumbered IDs
WITH ordered AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY "year", "name") AS "id",
        "name",
        "nametype",
        "mass",
        "year",
        "lat",
        "long"
    FROM "meteorites_temp"
)
INSERT INTO "meteorites" ("id", "name", "nametype", "mass", "year", "lat", "long")
SELECT "id", "name", "nametype", "mass", "year", "lat", "long"
FROM ordered;

--7 Drop temp table
DROP TABLE IF EXISTS "meteorites_temp";
