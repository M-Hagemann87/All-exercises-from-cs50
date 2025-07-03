CREATE TABlE "passengers"(
    "first_name" TEXT,
    "last_name" TEXT,
    "age"  INTEGER,
    "check_id" INTEGER,
    FOREIGN KEY "check_id" REFERENCES "check"("id")
);

CREATE TABLE "check" (
    "id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_id" INTEGER,
    PRIMARY KEY ("id")
    FOREIGN KEY "flight_id" REFERENCES "flights"("id"),
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK ("concourse" IN ('A','B','C','D','E','F','T')),
    PRIMARY KEY ("id")
);

CREATE TABLE "flights"(
    "id" INTEGER,
    "flight_number" INTEGER,
    "airlines_id"  INTEGER,
    "departing" TEXT NOT NULL CHECK ("departing" IN ('ATL','BOS')),
    "heading" TEXT,
    "departure_time" NUMERIC,
    "arrival_time" NUMERIC,
    "check_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY "check_id" REFERENCES "check"("id")
    FOREIGN  KEY "airlines_id" REFERENCES "airlines"("id")
);
