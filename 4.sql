SELECT "first_name", "last_name", "birth_country" FROM "players"
WHERE "birth_country" != 'USA' OR 'United States' OR 'US'
ORDER BY "first_name", "last_name" LIMIT 20;
