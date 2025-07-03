CREATE TABlE "passagers"(
    "id",
    "first_name", TEXT
    "last_name", TEXT
    "age"  INTEGER
);

CREATE TABLE "chech_ins" (
    "date_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight" NOT NULL
);

CREATE TABLE "airlines" (
    "id",
    "name",
    "concourse" TEXT NOT NULL CHECK ("concourse" IN ('A','B','C','D','E','F','T'))
);

CREATE TABLE "flights"(
    "flight_number"  NUMERIC,
    "passagers_id",
    "airlines_id",
    "departing",
    "heading",
    "departure_time" NUMERIC NOT NULL,
    "arrival_time" NUMERIC NOT NULL,
    FOREIGN KEY "passagers_id" REFERENCES"passagers"("id"),
    FOREIGN  KEY "airlines_id" REFERENCES "airlines"("id")
);