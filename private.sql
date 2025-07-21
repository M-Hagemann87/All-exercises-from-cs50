CREATE TABLE "message" (
    "phrase"
);

INSERT INTO "message" ("phrase")
VALUES ("find me in the place you least expect. behind the books");

CREATE VIEW "message_phrase" AS
SELECT "phrase" FROM  "message";

SELECT * FROM "message_phrase";
