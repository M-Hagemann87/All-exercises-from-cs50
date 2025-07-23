SELECT "username" FROM "users"
WHERE "id" IN (
    SELECT COUNT("to_user_id") FROM "messages"
    GROUP BY "to_user_id"
    ORDER BY "to_user_id" DESC
    )
LIMIT 10;
