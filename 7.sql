SELECT COUNT("first_name") FROM "players"
WHERE ("bats" = 'R' AND "trows" = 'L')
AND ("bats" = 'L' AND "trows" = 'R');
