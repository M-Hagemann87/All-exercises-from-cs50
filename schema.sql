-- The worker id:
CREATE TABLE "worker"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

-- Their currency "bank" statement (balance):
CREATE TABLE "wallet"(
    "id" INTEGER,
    "worker_id" INTEGER,
    "wise_id" INTEGER,
    "balance" REAL,
    "transfer_date" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("wise_id") REFERENCES "wise"("id"),
    FOREIGN KEY ("worker_id") REFERENCES "worker"("id")
);

-- Transferwise balance:
CREATE TABLE "wise"(
    "id" INTEGER,
    "currency" TEXT NOT NULL,
    "coin_prices" REAL,
    "transfer_fee" REAL,
    "deposit" REAL,
    "draw" REAL,
    "balance" REAL,
    "date" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "euro_id" INTEGER,
    "dollar_id" INTEGER,
    "nz_dollar_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("euro_id") REFERENCES "euro"("id"),
    FOREIGN KEY ("dollar_id") REFERENCES "dollar"("id"),
    FOREIGN KEY ("nz_dollar_id") REFERENCES "nz_dollar"("id")
);

-- Euro balance (in a different bank, e.g. Europe bank):
CREATE TABLE "euro"(
    "id" INTEGER,
    "balance" REAL,
    "transfer_date" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
);

-- Dollar balance (in a different bank, e.g. US bank):
CREATE TABLE "dollar"(
    "id" INTEGER,
    "balance" REAL,
    "transfer_date" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "crypto_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("crypto_id") REFERENCES "crypto"("id")
);

-- New Zealand Dollar balance (in a different bank, e.g. NZ bank):
CREATE TABLE "nz_dollar"(
    "id" INTEGER,
    "balance" REAL,
    "transfer_date" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY ("id")
);

-- Crypto balance (in a different bank) OBS. In this project consider that
-- investment cryptocurrency is possible only thorugh US dollar:
CREATE TABLE "crypto"(
    "id" INTEGER,
    "deposit" REAL,
    "draw" REAL,
    "balance" REAL,
    "return" REAL,
    "transfer_date" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY ("id")
);

-- Create indexes to speed common searches
CREATE INDEX "worker_id_search" ON "wallet" ("worker_id");
CREATE INDEX "euro_id_search" ON "wise" ("euro_id");
CREATE INDEX "dollar_id_search" ON "wise" ("dollar_id");
CREATE INDEX "nz_dollar_id" ON "wise" ("nz_dollar_id");


