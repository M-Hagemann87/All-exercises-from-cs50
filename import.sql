-- Create the final table with exact column names and order
CREATE TABLE "meteorites" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT,
    "nametype" TEXT,
    "mass" REAL,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

-- Create a temp table with extra columns for the CSV import
CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

-- Import the CSV, skipping the header row
.import --csv --skip 1 meteorites.csv meteorites_temp

-- Replace empty strings with NULL
UPDATE "meteorites_temp" SET "mass" = NULL WHERE "mass" = '';
UPDATE "meteorites_temp" SET "year" = NULL WHERE "year" = '';
UPDATE "meteorites_temp" SET "lat" = NULL WHERE "lat" = '';
UPDATE "meteorites_temp" SET "long" = NULL WHERE "long" = '';

-- Round decimals to two places
UPDATE "meteorites_temp" SET "mass" = ROUND("mass", 2);
UPDATE "meteorites_temp" SET "lat" = ROUND("lat", 2);
UPDATE "meteorites_temp" SET "long" = ROUND("long", 2);

-- Remove meteorites with nametype = 'Relict'
DELETE FROM "meteorites_temp" WHERE "nametype" = 'Relict';

-- Insert cleaned, sorted, and renumbered data into final table
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

-- Clean up
DROP TABLE IF EXISTS "meteorites_temp";
