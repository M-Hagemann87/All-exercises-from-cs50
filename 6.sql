SELECT "H" AS "total hits", "teams"."name" FROM  "performances"
FULL JOIN "teams" ON "teams"."id" = "performances"."team_id"
WHERE "teams"."year" = '2001'
ORDER BY "H" DESC
LIMIT 5;
