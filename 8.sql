SELECT "name", "pupils" FROM "districts"
FULL JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
WHERE NOT "name" LIKE '%(non-op)%'
AND "pupils" != 'NULL';
