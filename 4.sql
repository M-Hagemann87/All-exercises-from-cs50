SELECT "username" FROM "users"
WHERE "id" IN (
    SELECT "to_user_id"."messages" FROM "messages"
    GROUP BY "to_user_id"."messages"
    ORDER BY COUNT("id")."messages" DESC
    )
LIMIT 1;
