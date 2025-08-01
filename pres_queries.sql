-- Adding new person/worker:
INSERT INTO "worker" ("id" ,"first_name", "last_name")
VALUES ('1', 'Olliver', 'Brown');
-- To Check:
SELECT * FROM "worker";

-- Adding money from his wage in his Wallet bank account:
INSERT INTO "wallet" ("id","worker_id", "wise_id", "balance")
VALUES ('1','1','1','1000.00');
-- To Check:
SELECT *  FROM "wallet";

-- Adding some cash to the id 101 account:
INSERT INTO "wise" ("id","currency", "balance")
VALUES ('101','dollar','250.00');

-- Simulate ATM withdraws:
UPDATE "wise" SET "balance" = "balance" - 12 WHERE "id" = '101';
UPDATE "wise" SET "balance" = "balance" - 100 WHERE "id" = '21';

-- Now Check for this transection (transection above):
SELECT "balance" FROM "wise"
WHERE "id" = '101'
;









-- Adding an id to the wise table:
INSERT INTO "wise" ("id","currency", "balance")
VALUES ('1','dollar','100.00');
