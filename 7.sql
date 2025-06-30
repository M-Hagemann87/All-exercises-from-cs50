SELECT ("schools"."name") FROM "districts"
FULL JOIN "schools" ON "schools"."district_id" = "districts"."id"
WHERE ("districts"."name") = 'Cambridge';
