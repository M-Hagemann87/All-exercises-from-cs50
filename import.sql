-- 1. Final table: must match CS50 check50 spec
CREATE TABLE "meteorites" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT,
    "nametype" TEXT,
    "mass" REAL,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

-- 2. Temporary table for importing your CSV structure
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

-- 3. Import data (ensure meteorites.csv is present and correct)
.import --csv --skip 1 meteorites.csv meteorites_temp

-- 4. Normalize empty strings to NULLs
UPDATE meteorites_temp SET mass = NULL WHERE TRIM(mass) = '';
UPDATE meteorites_temp SET year = NULL WHERE TRIM(year) = '';
UPDATE meteorites_temp SET lat = NULL WHERE TRIM(lat) = '';
UPDATE meteorites_temp SET long = NULL WHERE TRIM(long) = '';

-- 5. Remove rows with nametype = 'Relict'
DELETE FROM meteorites_temp WHERE LOWER(nametype) = 'relict';

-- 6. Insert cleaned and sorted data into final table
WITH cleaned AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY CAST(year AS INTEGER), name) AS id,
        name,
        nametype,
        ROUND(CAST(mass AS REAL), 2) AS mass,
        CAST(year AS INTEGER) AS year,
        ROUND(CAST(lat AS REAL), 2) AS lat,
        ROUND(CAST(long AS REAL), 2) AS long
    FROM meteorites_temp
)
INSERT INTO meteorites (id, name, nametype, mass, year, lat, long)
SELECT id, name, nametype, mass, year, lat, long FROM cleaned;

-- 7. Drop temp table
DROP TABLE IF EXISTS meteorites_temp;
