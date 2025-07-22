SELECT "username" FROM "users"
ORDER BY
    (SELECT COUNT("picture") FROM "messages"
    GROUP  BY "to_user_id")
    DESC
LIMIT 1;
