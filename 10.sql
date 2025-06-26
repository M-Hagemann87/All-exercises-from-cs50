SELECT "artist" AS "Number of Prints", "english_title", "brightness" FROM "views"
WHERE "brightness" > 0.5 ORDER BY "brightness" AND "artist";
