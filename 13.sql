SELECT "name", "graduated" FROM "schools"
FULL JOIN "graduation_rates" ON "graduation_rates"."school_id" = "schools"."id"
WHERE "graduated" != 'NULL'
ORDER BY "graduated" DESC, "name"
LIMIT 25;

