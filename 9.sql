SELECT "first_name", "last_name" FROM "players"
WHERE "final_game" BETWEEN date('2022-01-01') and date('2022-12-31')
ORDER BY  "first_name", "last_name";
