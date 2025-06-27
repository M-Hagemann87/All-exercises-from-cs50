
-- *** The Lost Letter ***
SELECT * FROM  "addresses"
WHERE "address" LIKE '%Fin%';

SELECT * FROM  "addresses"
WHERE  "address" = '900 Somerville Avenue';

SELECT * FROM "scans"
FULL JOIN "packages" ON "packages"."id" = "scans"."package_id"
WHERE "address_id" = '854' OR "address_id" = '432'
;

SELECT * FROM "scans"
FULL JOIN "addresses" ON "addresses"."id" = "scans"."address_id"
WHERE "address_id" = '854' OR "address_id" = '432'
;

-- *** The Devious Delivery ***

SELECT * FROM "packages"
WHERE "from_address_id" IS NULL;

SELECT * FROM "scans"
FULL JOIN "addresses" ON "addresses"."id" = "scans"."address_id"
WHERE "package_id" = '5098';


-- *** The Forgotten Gift ***

SELECT * FROM  "addresses"
WHERE "address" LIKE '109 Tileston Street';

SELECT * FROM  "addresses"
WHERE  "address" = '728 Maple Place';

SELECT * FROM "scans"
FULL JOIN "packages" ON "packages"."id" = "scans"."package_id"
WHERE "address_id" = '9873' OR "address_id" = '4983'
;

SELECT * FROM "scans"
FULL JOIN "addresses" ON "addresses"."id" = "scans"."address_id"
WHERE "address_id" = '9873' OR "address_id" = '4983'
;

SELECT * FROM "scans"
FULL JOIN "addresses" ON "addresses"."id" = "scans"."address_id"
WHERE "package_id" = '9523'
;

SELECT * FROM "scans"
FULL JOIN "drivers" ON "drivers"."id" = "scans"."driver_id"
WHERE "driver_id" = '17' AND "package_id" = '9523'
;
