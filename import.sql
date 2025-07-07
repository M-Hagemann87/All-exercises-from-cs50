-- 1. Create the final table with the exact schema required by CS50
CREATE TABLE "meteorites" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT,
    "nametype" TEXT,
    "mass" REAL,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

-- 2. Create a temporary table matching your CSV structure
CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" TEXT,
    "discovery" TEXT,
    "year" TEXT,
    "lat" TEXT,
    "long" TEXT
);

-- 3. Import the data from meteorites.csv (must be in same folder)
.import --csv --skip 1 meteorites.csv meteorites_temp

-- 4. Convert empty strings to NULL using NULLIF
UPDATE meteorites_temp
SET
    mass = NULLIF(mass, ''),
    year = NULLIF(year, ''),
    lat = NULLIF(lat, ''),
    "long" = NULLIF("long", '');

-- 5. Delete all rows with nametype = 'Relict'
DELETE FROM meteorites_temp WHERE LOWER(nametype) = 'relict';

-- 6. Insert cleaned, casted, rounded, and sorted data into final table
WITH cleaned AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY CAST(year AS INTEGER), name) AS id,
        name,
        nametype,
        ROUND(CAST(mass AS REAL), 2) AS mass,
        CAST(year AS INTEGER) AS year,
        ROUND(CAST(lat AS REAL), 2) AS lat,
        ROUND(CAST("long" AS REAL), 2) AS "long"
    FROM meteorites_temp
)
INSERT INTO meteorites (id, name, nametype, mass, year, lat, "long")
SELECT id, name, nametype, mass, year, lat, "long" FROM cleaned;

-- 7. Drop the temporary table
DROP TABLE IF EXISTS meteorites_temp;

