SELECT "first_name", "last_name", "birth_country" FROM "players"
WHERE "birth_country" != 'USA' OR "birth_country" != 'United States' OR "birth_country" != 'US'
ORDER BY "first_name", "last_name";
