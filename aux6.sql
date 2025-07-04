SELECT * FROM "meteorites"
LIMIT  100;

CREATE TABLE "meteorites"(
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

---

INSERT INTO "meteorites"
SELECT * FROM "meteorites_temp"
ORDER BY "year", "name";
