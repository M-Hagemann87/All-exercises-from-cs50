SELECT "districts"."name", "expenditures"."per_pupil_expenditure"  FROM "districts"
LEFT JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
RIGHT JOIN "schools" ON "schools"."district_id" = "districts"."id"
WHERE "schools"."type" = 'Public School'
ORDER BY "expenditures"."per_pupil_expenditure" DESC
LIMIT 10;

--WHERE "schools"."type" = 'Public School' AND "schools"."state" = 'MA'
