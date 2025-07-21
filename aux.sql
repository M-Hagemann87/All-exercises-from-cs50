SELECT * FROM "listings" LIMIT 5;
######1
CREATE  VIEW "no_descriptions" AS
SELECT "id", "property_type", "host_name", "accommodates", "bedrooms" FROM "listings";
##test:
SELECT * FROM "no_descriptions" LIMIT 5;
#######2
CREATE VIEW "one_bedrooms" AS
SELECT "id", "property_type", "host_name", "accommodates" FROM "listings"
WHERE "bedrooms" = "1";
###test:
SELECT * FROM "one_bedrooms"
WHERE "accommodates" = "4";

SELECT COUNT("id") FROM "one_bedrooms";

#######3
CREATE VIEW "available" AS
SELECT "listings"."id", "listings"."property_type", "listings"."host_name", "availabilities"."date" FROM "listings"
JOIN "availabilities" ON "availabilities"."listing_id" = "listings"."id";
###test
SELECT COUNT("id") FROM "available"
WHERE "date" = "2023-12-31";
#########4
CREATE VIEW "frequently_reviewed" AS
SELECT "listings"."id", "listings"."property_type", "listings"."host_name", COUNT(DISTINCT "reviews"."comments") AS "reviews"
FROM "listings"
JOIN "reviews" ON "reviews"."listing_id" = "listings"."id"
GROUP BY "listings"."id"
ORDER BY "reviews" DESC, "property_type",  "host_name"
LIMIT 100;
#########5
CREATE VIEW "june_vacancies"
SELECT "listings"."id", "listings"."property_type", "listings"."host_name",
COUNT(DISTINCT "availabilities"."date") AS "days_vacant"
FROM "listings"
JOIN "availabilities" ON "availabilities"."listing_id" = "listings"."id"
GROUP BY "listings"."id"
BETWEEN date('2023-06-01') AND date('2023-06-30');

WHERE "availabilities"."date" >= '2023-06-01' AND <= '2023-06-30';



BETWEEN date('2023-06-01') AND date('2023-06-31');


-- Rewrite prior query with a range condition
SELECT "title", "year" FROM "longlist" WHERE "year" >= 2019 AND "year" <= 2022;

-- Rewrite with a BETWEEN condition
SELECT "title", "year" FROM "longlist" WHERE "year" BETWEEN 2019 AND 2022;

BETWEEN date('2022-05-01') AND date('2022-08-01');


#########
, COUNT(DISTINCT "reviews"."listing_id") AS "reviews"
SELECT COUNT(DISTINCT "publisher") FROM "longlist";


#############
-- Find total number of translators
SELECT COUNT("translator") FROM "longlist";


SELECT * FROM "sea_lions"
JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";


SELECT "teams"."name", ROUND(AVG("salaries"."salary"), 2) AS "average salary" FROM "salaries"
JOIN "teams" ON "teams"."id" = "salaries"."team_id"
WHERE "salaries"."year" = '2001'
GROUP BY "teams"."id"
ORDER BY "average salary"
LIMIT 5;
