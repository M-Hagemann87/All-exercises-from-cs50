SELECT "first_name", "last_name" FROM "players"
WHERE "birth_country" != 'USA' OR "birth_country" != 'United States' OR "birth_country" != 'US'
ORDER BY "first_name", "last_name";
