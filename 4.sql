SELECT u.username
FROM users u
JOIN (
    SELECT to_user_id
    FROM messages
    GROUP BY to_user_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
) AS top_user ON u.id = top_user.to_user_id;
