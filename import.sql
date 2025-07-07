--1
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

--2
.import --csv --skip 1 meteorites.csv meteorites_temp

--3 (1)
UPDATE "meteorites_temp" SET "mass" = NULL
WHERE "mass" = '';

UPDATE "meteorites_temp" SET "year" = NULL
WHERE "year" = '';

UPDATE "meteorites_temp" SET "lat" = NULL
WHERE "lat" = '';

UPDATE "meteorites_temp" SET "long" = NULL
WHERE "long" = '';
--4 (2)
UPDATE "meteorites_temp" SET "lat" = ROUND("lat",2);

UPDATE "meteorites_temp" SET "long" = ROUND("long",2);

UPDATE "meteorites_temp" SET "mass" = ROUND("mass",2);
--5 (3)
DELETE FROM "meteorites_temp" WHERE "nametype" = 'Relict';
--6

---
INSERT INTO "meteorites" ("id", "name", "nametype", "mass", "year", "lat", "long")
SELECT "id", "name", "nametype", "mass", "year", "lat", "long" FROM "meteorites_temp"
ORDER BY "year", "name";

DROP TABLE IF EXISTS "meteorites_temp";
