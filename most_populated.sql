CREATE VIEW "most_populated" AS
SELECT "district", SUM("families"), SUM("households"), SUM("population") AS "total_population",
SUM("male"), SUM("female") FROM "census"
GROUP BY "district"
ORDER BY "total_population" DESC;
