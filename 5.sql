SELECT "teams"."name" FROM "teams"
JOIN "salaries" ON "salaries"."team_id" = "teams"."id"
JOIN "players" ON "players"."id" = "salaries"."player_id"
WHERE "players"."first_name" = 'Satchel'
AND "players"."last_name" = 'Paige';

---
---SELECT "teams"."name" FROM "salaries"
---JOIN "teams" ON "teams"."id" = "salaries"."team_id"
---JOIN "players" ON "players"."id" = "salaries"."player_id"
---WHERE "players"."first_name" = 'Satchel';
--AND "players"."last_name" = 'Paige';


---SELECT * FROM "players"
---WHERE "last_name" = 'Paige';
-- Satchel Paige
--id =   14190
--  is not this one: 14189

---SELECT * FROM "salaries"
---WHERE "player_id" = '14190'
---LIMIT 10;

-- team_id =
---7265
--Ken Griffey
--id =  7266
---SELECT * FROM "players"
---WHERE "last_name" = 'Griffey';










