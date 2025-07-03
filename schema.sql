CREATE TABLE "passengers"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age"  INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "check_ins" (
    "id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_id" INTEGER NOT NULL,
    "passenger_id" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY "passenger_id" REFERENCES "passenger"("id"),
    FOREIGN KEY "flight_id" REFERENCES "flights"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK ("concourse" IN ('A','B','C','D','E','F','T')),
    "flight_id" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY "flight_id" REFERENCES "flights"("id")
);

CREATE TABLE "flights"(
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airlines_id"  INTEGER NOT NULL,
    "departing" TEXT NOT NULL CHECK ("departing" IN ('ATL','BOS')),
    "heading" TEXT NOT NULL,
    "departure_time" NUMERIC,
    "arrival_time" NUMERIC,
    "passenger_id" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY "passenger_id" REFERENCES "passenger"("id"),
    FOREIGN  KEY "airlines_id" REFERENCES "airlines"("id")
);
