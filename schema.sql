CREATE TABlE "passengers"(
    "first_name" TEXT,
    "last_name" TEXT,
    "age"  INTEGER,
    PRIMARY KEY ("last_name")
);

CREATE TABLE "check_ins" (
    "date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_id" INTEGER,
    "passenger_last_name" TEXT,
    FOREIGN KEY "flight_id" REFERENCES "flights"("id"),
    FOREIGN KEY "passenger_last_name" REFERENCES "passengers"("last_name"),
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK ("concourse" IN ('A','B','C','D','E','F','T')),
    PRIMARY KEY ("id")
);

CREATE TABLE "flights"(
    "id" INTEGER,
    "passenger_last_name" TEXT,
    "flight_number" INTEGER,
    "airlines_id"  INTEGER,
    "departing" TEXT NOT NULL CHECK ("departing" IN ('ATL','BOS')),
    "heading" TEXT,
    "departure_time" NUMERIC,
    "arrival_time" NUMERIC,
    PRIMARY KEY ("id"),
    FOREIGN KEY "passenger_last_name" REFERENCES "passengers"("last_name"),
    FOREIGN  KEY "airlines_id" REFERENCES "airlines"("id")
);
