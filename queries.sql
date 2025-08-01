-- Check for all wise account from Olliver Brown:
SELECT "wise"."balance" FROM "wise"
JOIN "wise" ON "wise"."id" = "wallet"("wise_id")
JOIN "worker" ON "worker"."id" = "wallet"("worker_id")
WHERE "worker"."first_name" = 'Olliver'
AND "worker"."last_name" = 'Brown'
;

-- Check for all  the deposits and draw made in euro on 21/10/1987:
SELECT "deposit", "draw", "transfer_date" FROM "euro"
JOIN "euro_id" ON "wallet" = "wise"("id")
WHERE "wise"."date" = '1987-10-21';

-- Check for all money invested in Cryptocurrency in 2021 ('YYYY-MM-DD'):
SELECT COUNT("deposit") FROM "crypto"
WHERE "transfer_date" BETWEEN date('2021-01-01') AND date('2021-12-31');

-- Check the top 10 accounts that hold more money in wise in dollars:
SELECT * FROM "wise"
GROUP BY "id"
WHERE "currency" = 'dollar'
ORDER BY "balance" DESC;


-- Adding some cash to the id 101 account:
INSERT INTO "wise" ("id","currency", "balance")
VALUES ('101','dollar','250.00');

-- ATM withdraws:
UPDATE "wise" SET "balance" = "balance" - 12 WHERE "id" = '101';
UPDATE "wise" SET "balance" = "balance" - 100 WHERE "id" = '21';


-- Now Check for this transection (transection above):
SELECT "balance" FROM "wise"
WHERE "id" = '101'
;

-- Check for New Zealand Account after 3 deposits:
SELECT * FROM "nz_dollar"
WHERE "id" = '21'
;

-- Adding new person/worker:
INSERT INTO "worker" ("id" ,"first_name", "last_name")
VALUES ('1', 'Olliver', 'Brown');
-- To Check:
SELECT * FROM "worker";

-- Adding an id to the wise table:
INSERT INTO "wise" ("id","currency", "balance")
VALUES ('1','dollar','100.00');
SELECT *  FROM "wise";

-- Adding money from his wage in his Wallet bank account:
INSERT INTO "wallet" ("id","worker_id", "wise_id", "balance")
VALUES ('1','1','1','1000.00');
-- To Check:
SELECT *  FROM "wallet";

-- Adding money in New Zealand account (for future travel, may God help 🙏🏻🙏🏻🙏🏻!!!
INSERT INTO "nz_dollar" ("id" ,"balance")
VALUES ('21', '150');
-- To check:
SELECT *  FROM "nz_dollar";
