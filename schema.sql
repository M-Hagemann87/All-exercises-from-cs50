CREATE TABLE "passengers" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL
);

CREATE TABLE "airlines" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL
);

-- Airline can operate in multiple concourses
CREATE TABLE "airline_concourses" (
    "airline_id" INTEGER,
    "concourse" TEXT CHECK ("concourse" IN ('A','B','C','D','E','F','T')),
    FOREIGN KEY ("airline_id") REFERENCES "airlines"("id")
);

CREATE TABLE "flights" (
    "id" INTEGER PRIMARY KEY,
    "flight_number" INTEGER NOT NULL,
    "airlines_id" INTEGER NOT NULL,
    "departing" TEXT NOT NULL CHECK ("departing" IN ('ATL','BOS')),
    "heading" TEXT NOT NULL,
    "departure_time" NUMERIC NOT NULL,
    "arrival_time" NUMERIC NOT NULL,
    FOREIGN KEY ("airlines_id") REFERENCES "airlines"("id")
);

CREATE TABLE "check_ins" (
    "id" INTEGER PRIMARY KEY,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_id" INTEGER NOT NULL,
    "passenger_id" INTEGER NOT NULL,
    FOREIGN KEY ("flight_id") REFERENCES "flights"("id"),
    FOREIGN KEY ("passenger_id") REFERENCES "passengers"("id")
);
