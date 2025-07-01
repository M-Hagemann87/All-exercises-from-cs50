SELECT "teams"."name" FROM "salaries"
JOIN "teams" ON "teams"."id" = "salaries"."team_id"
JOIN "players" ON "players"."id" = "salaries"."player_id"
WHERE "players"."first_name" = 'Satchel'
AND "players"."last_name" = 'Paige';
