CREATE TABLE "users" (
    "id" INTEGER NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "user_name" TEXT NOT NULL,
    "password" NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "schools" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL CHECK ("type" IN ('Elementary School', 'Middle School',
    'High School', 'Lower School', 'Upper School', 'College', 'University')),
    "location" TEXT NOT NULL,
    "year_founded" NOT NULL,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "type_degree" TEXT,
    "user_id" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id")
);

CREATE TABLE "companies" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "industry" TEXT,
    "location" TEXT,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "title" TEXT,
    "user_id" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id")
);

