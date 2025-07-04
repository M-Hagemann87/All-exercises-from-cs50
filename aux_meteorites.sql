-----
SELECT * FROM "meteorites_temp"
LIMIT  100;
---------
DROP TABLE IF EXISTS "meteorites_temp";
---------

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
-----
CREATE TABLE "meteorites" IF NOT EXISTS (
    "year" INTEGER,
);


--====
--- BIN

UPDATE "meteorites_temp" SET "year"
WHERE "year" INTEGER;
-----

UPDATE "meteorites_temp" SET "mass" = NULL
WHERE "mass" = NULL;


UPDATE "votes" SET "title" = 'FARMERS WORKING AT DAWN'
WHERE "title" = 'FARMERS WORKING';
