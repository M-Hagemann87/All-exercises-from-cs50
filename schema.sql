CREATE TABlE "passagers"(
    "id",
    "first_name" TEXT,
    "last_name" TEXT,
    "age"  INTEGER,
    PRIMARY KEY ("id")
);

CREATE TABLE "chech_ins" (
    "date_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight"
);

CREATE TABLE "airlines" (
    "id",
    "name" NOT NULL,
    "concourse" TEXT NOT NULL CHECK ("concourse" IN ('A','B','C','D','E','F','T')),
    PRIMARY KEY ("id")
);

CREATE TABLE "flights"(
    "id",
    "flight_number",
    "passagers_id",
    "airlines_id",
    "departing",
    "heading",
    "departure_time",
    "arrival_time",
    PRIMARY KEY ("id"),
    FOREIGN KEY "passagers_id" REFERENCES "passagers"("id"),
    FOREIGN  KEY "airlines_id" REFERENCES "airlines"("id")
);
