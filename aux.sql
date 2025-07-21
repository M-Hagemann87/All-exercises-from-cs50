#### 1
CREATE VIEW "rural" AS
SELECT * FROM "census"
WHERE "locality" LIKE '%rural%';
#Test
SELECT * FROM "rural";

####2
CREATE VIEW "total" AS
SELECT SUM("families") AS "families", SUM("households") AS "households",
SUM("population") AS "population", SUM("male") AS "male",  SUM("female") AS "female" FROM "census";
#test
SELECT * FROM "total";
#####3
CREATE VIEW "by_district" AS
SELECT "district", SUM("families"), SUM("households"), SUM("population"), SUM("male"), SUM("female") FROM "census"
GROUP BY "district";
####Test
SELECT * FROM "by_district";
#####4
CREATE VIEW "most_populated" AS
SELECT "district", "families", "households", "population", "male", "female" FROM "census"
GROUP BY "district"
ORDER BY "district" DESC;
#Test
SELECT * FROM "most_populated";
#########









-- Find maximum rating
SELECT MAX("rating") FROM "longlist";

-- Find minimum rating
SELECT MIN("rating") FROM "longlist";

-- Find total number of votes
SELECT SUM("votes") FROM "longlist";

-- Find total number of books
SELECT COUNT(*) FROM "longlist";

-- Find total number of translators
SELECT COUNT("translator") FROM "longlist";

-- Incorrectly count publishers
SELECT COUNT("publisher") FROM "longlist";

-- Correctly count publishers
SELECT COUNT(DISTINCT "publisher") FROM "longlist";

CREATE VIEW "longlist" AS
SELECT "name", "title" FROM "authors"
JOIN "authored" ON "authors"."id" = "authored"."author_id"
JOIN "books" ON "books"."id" = "authored"."book_id";


######
SELECT * FROM "census"
GROUP BY "district"
LIMIT 50;

-- Find all books with "love" in the title
SELECT "title" FROM "longlist" WHERE "title" LIKE '%love%';
