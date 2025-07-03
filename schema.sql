CREATE TABlE "passagers"(
    "first_name" TEXT,
    "last_name" TEXT,
    "age"  INTEGER,
    PRIMARY KEY ("last_name")
);

CREATE TABLE "chech_ins" (
    "date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_id",
    "passager_last_name",
    "passager_first_name",
    FOREIGN KEY "flight_id" REFERENCES "flights"("id"),
    FOREIGN KEY "passager_last_name" REFERENCES "passagers"("last_name"),
);

CREATE TABLE "airlines" (
    "id",
    "name" NOT NULL,
    "concourse" TEXT NOT NULL CHECK ("concourse" IN ('A','B','C','D','E','F','T')),
    PRIMARY KEY ("id")
);

CREATE TABLE "flights"(
    "id",
    "passager_last_name",
    "passager_first_name",
    "flight_number" INTEGER,
    "passagers_id",
    "airlines_id",
    "departing" TEXT NOT NULL CHECK ("departing" IN ('ATL,'BOS')),
    "heading",
    "departure_time",
    "arrival_time",
    PRIMARY KEY ("id"),
    FOREIGN KEY "passagers_id" REFERENCES "passagers"("id"),
    FOREIGN  KEY "airlines_id" REFERENCES "airlines"("id"),
    FOREIGN KEY "passager_last_name" REFERENCES "passagers"("last_name"),
);
