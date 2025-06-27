SELECT "name" FROM "districts"
FULL JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
WHERE "pupils" IS NOT NULL
ORDER BY "pupils"
LIMIT 1;
