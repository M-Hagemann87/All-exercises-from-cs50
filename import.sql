-- 1. Create the final table with the correct schema
CREATE TABLE "meteorites" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT,
    "nametype" TEXT,
    "mass" REAL,
    "year" INTEGER,
    "reclat" REAL,
    "reclong" REAL
);

-- 2. Create a temporary table to match the CSV file structure
CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "recclass" TEXT,
    "mass" TEXT,
    "fall" TEXT,
    "year" TEXT,
    "reclat" TEXT,
    "reclong" TEXT,
    "GeoLocation" TEXT
);

-- 3. Import the CSV data, skipping the header
.import --csv --skip 1 meteorites.csv meteorites_temp

-- 4. Normalize empty strings to NULL
UPDATE meteorites_temp SET mass = NULL WHERE TRIM(mass) = '';
UPDATE meteorites_temp SET year = NULL WHERE TRIM(year) = '';
UPDATE meteorites_temp SET reclat = NULL WHERE TRIM(reclat) = '';
UPDATE meteorites_temp SET reclong = NULL WHERE TRIM(reclong) = '';

-- 5. Remove rows with nametype = 'Relict'
DELETE FROM meteorites_temp WHERE LOWER(nametype) = 'relict';

-- 6. Insert cleaned, sorted, and converted data into final table
WITH cleaned AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY CAST(year AS INTEGER), name) AS id,
        name,
        nametype,
        ROUND(CAST(mass AS REAL), 2) AS mass,
        CAST(year AS INTEGER) AS year,
        ROUND(CAST(reclat AS REAL), 2) AS reclat,
        ROUND(CAST(reclong AS REAL), 2) AS reclong
    FROM meteorites_temp
)
INSERT INTO meteorites (id, name, nametype, mass, year, reclat, reclong)
SELECT id, name, nametype, mass, year, reclat, reclong FROM cleaned;

-- 7. Drop the temporary table
DROP TABLE IF EXISTS meteorites_temp;
