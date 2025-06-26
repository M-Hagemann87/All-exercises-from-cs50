SELECT COUNT("first_name") FROM "players"
WHERE ("bats" = 'R' AND "trows" = 'L')
OR ("bats" = 'L' AND "trows" = 'R');
