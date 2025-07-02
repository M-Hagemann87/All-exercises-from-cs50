SELECT "teams"."name" FROM "performances"
LEFT JOIN "teams" ON "teams"."id" = "performances"."team_id"
RIGHT JOIN "players" ON "players"."id" = "performances"."player_id"
WHERE "players"."first_name" = 'Satchel'
AND "players"."last_name" = 'Paige';
