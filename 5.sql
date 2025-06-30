SELECT "city", COUNT("name") AS "Count Public School" FROM "schools"
WHERE "type" = 'Public School'
GROUP BY  "city"
HAVING "Count Public School" < 4
ORDER BY "Count Public School" DESC, "city";
