CREATE VIEW "june_vacancies"
SELECT "listings"."id", "listings"."property_type", "listings"."host_name",
COUNT(DISTINCT "availabilities"."date") AS "days_vacant"
FROM "listings"
JOIN "availabilities" ON "availabilities"."listing_id" = "listings"."id"
GROUP BY "listings"."id"
BETWEEN date('2023-06-01') AND date('2023-06-30');
