substr( string, start, length )

SELECT substr(1,1,1) FROM "sentences";

SELECT substr("sentence",1,2) FROM "sentences";

SELECT substr("sentence",4,8) FROM "sentences"
WHERE "id" = "14"
LIMIT 10;


SELECT substr(2,4,2) FROM "sentences"
LIMIT 10;

###############

CREATE VIEW "message" AS
SELECT "phrase" FROM  "message";

#########

SELECT * FROM "sentences"
WHERE "id" = "14"
LIMIT 10;
######################
SELECT substr("sentence",98,4) FROM "sentences"
WHERE "id" = "14";



################## Test VIEW
CREATE VIEW "message" AS
SELECT substr("sentence",)

######
-- Adds a new item to the collections
INSERT INTO "collections" ("id", "title", "accession_number", "acquired")
VALUES (1, 'Profusion of flowers', '56.257', '1956-04-12');


INSERT INTO "message" ("message")
VALUES ("find me in the place you least expect. behind the books");
###########
CREATE TABLE "riders" (
    "id",
    "name"
);


CREATE TABLE "message" (
    "phrase"
);
