-- 1. Create final cleaned table with exactly the required columns
CREATE TABLE "meteorites" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT,
    "nametype" TEXT,
    "mass" REAL,
    "year" INTEGER,
    "reclat" REAL,
    "reclong" REAL
);

-- 2. Create a temporary table matching the CSV file structure
CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "recclass" TEXT,
    "mass" REAL,
    "fall" TEXT,
    "year" INTEGER,
    "reclat" REAL,
    "reclong" REAL,
    "GeoLocation" TEXT
);

-- 3. Import the data from CSV
.import --csv --skip 1 meteorites.csv meteorites_temp

-- 4. Clean empty values and convert them to NULL
UPDATE "meteorites_temp" SET "mass" = NULL WHERE "mass" = '';
UPDATE "meteorites_temp" SET "year" = NULL WHERE "year" = '';
UPDATE "meteorites_temp" SET "reclat" = NULL WHERE "reclat" = '';
UPDATE "meteorites_temp" SET "reclong" = NULL WHERE "reclong" = '';

-- 5. Round decimal fields to 2 decimal places
UPDATE "meteorites_temp" SET "mass" = ROUND("mass", 2);
UPDATE "meteorites_temp" SET "reclat" = ROUND("reclat", 2);
UPDATE "meteorites_temp" SET "reclong" = ROUND("reclong", 2);

-- 6. Remove "Relict" entries
DELETE FROM "meteorites_temp" WHERE "nametype" = 'Relict';

-- 7. Transfer cleaned and ordered data into final table with new IDs
WITH ordered AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY "year", "name") AS "id",
        "name",
        "nametype",
        "mass",
        "year",
        "reclat",
        "reclong"
    FROM "meteorites_temp"
)
INSERT INTO "meteorites" (
    "id", "name", "nametype", "mass", "year", "reclat", "reclong"
)
SELECT "id", "name", "nametype", "mass", "year", "reclat", "reclong"
FROM ordered;

-- 8. Drop the temp table
DROP TABLE IF EXISTS "meteorites_temp";
