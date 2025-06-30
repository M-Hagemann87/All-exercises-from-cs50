SELECT "schools"."name", "expenditures"."per_pupil_expenditure", "graduation_rates"."graduated"
FROM "districts"
LEFT JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
LEFT JOIN "schools" ON "schools"."district_id" = "districts"."id"
LEFT JOIN "graduation_rates" ON "graduation_rates"."school_id" = "schools"."id"
WHERE "graduation_rates"."graduated" != 'NULL' and "expenditures"."per_pupil_expenditure" != 'NULL'
ORDER BY "expenditures"."per_pupil_expenditure" DESC, "schools"."name";
