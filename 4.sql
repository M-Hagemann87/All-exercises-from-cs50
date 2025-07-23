SELECT "username" FROM "users"
WHERE "id" IN (
    SELECT "to_user_id"."messages" FROM "messages"
    GROUP BY COUNT("to_user_id")."messages"
    ORDER BY COUNT("to_user_id")."messages" DESC
    )
LIMIT 1;
