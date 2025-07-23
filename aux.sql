#####4
SELECT "username" FROM "users"
WHERE "id" IN (
    SELECT "to_user_id" ,COUNT("to_user_id") FROM "messages"
    GROUP BY "to_user_id"
    ORDER BY "to_user_id" DESC
    )
LIMIT 1;


SELECT "to_user_id" ,COUNT("to_user_id") FROM "messages"
    GROUP BY "to_user_id"
    ORDER BY "to_user_id" DESC
    Limit 25;

SELECT "to_user_id" ,COUNT("to_user_id") FROM "messages"
    GROUP BY "to_user_id"
    ORDER BY "to_user_id" DESC
    Limit 25;



SELECT "username" FROM "users"
WHERE "id" = "2500"
LIMIT 10;


SELECT * FROM "users"
WHERE "username" = "impressivecommitment918"
LIMIT 1;




#####3
SELECT "users"."id" FROM "users"
JOIN "messages" ON "messages"."from_user_id" = "users"."id"
WHERE "from_user_id" = (
    SELECT "messages"."from_user_id" FROM "users"
    JOIN "messages" ON "messages"."from_user_id" = "users"."id"
    WHERE "username" = "creativewisdom377"
    GROUP BY "from_user_id";
    )
ORDER BY "from_user_id" DESC
LIMIT 3;



SELECT "from_user_id" FROM "messages"
WHERE "from_user_id" IN
    (SELECT "id" FROM "users"
    WHERE "username" = "creativewisdom377"
    )
GROUP BY "from_user_id"
ORDER BY "from_user_id" DESC
LIMIT 3;
###
SELECT "from_user_id" FROM "messages"
WHERE "from_user_id" = "2318"
GROUP BY "from_user_id"
ORDER BY "from_user_id" DESC
LIMIT 3;

#####
SELECT "to_user_id" FROM "messages"
WHERE "from_user_id" IN (
    SELECT "id" FROM "users"
    WHERE "username" = "creativewisdom377"
)
GROUP BY "to_user_id"
ORDER BY "from_user_id" DESC
LIMIT 3;

######
SELECT "to_user_id" FROM "messages"
WHERE "from_user_id" = "2318"
LIMIT 3;


##########


SELECT "id" FROM "users"
WHERE "username" = "creativewisdom377";

#######
EXPLAIN QUERY PLAN
SELECT "title" FROM "movies" WHERE "id" IN (
    SELECT "movie_id" FROM "stars" WHERE "person_id" = (
        SELECT "id" FROM "people" WHERE "name" = 'Tom Hanks'
    )
);

-- Make person_index a covering index for the above query
CREATE INDEX "person_index" ON "stars" ("person_id", "movie_id");

EXPLAIN QUERY PLAN
SELECT "title" FROM "movies" WHERE "id" IN (
    SELECT "movie_id" FROM "stars" WHERE "person_id" = (
        SELECT "id" FROM "people" WHERE "name" = 'Tom Hanks'
    )
);
