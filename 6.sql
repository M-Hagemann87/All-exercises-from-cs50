SELECT "performances"."AB" AS "total hits", "teams"."name" FROM  "performances"
FULL JOIN "teams" ON "teams"."id" = "performances"."team_id"
WHERE "performances"."year" = '2001'
ORDER BY "total hits" DESC
LIMIT 5;
