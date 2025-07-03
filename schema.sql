CREATE TABLE "ingredients" (
    "id" INTEGER,
    "ingredient" TEXT,
    "price" REAL,
    PRIMARY KEY ("id")
);

CREATE TABLE "donuts" (
    "selection" TEXT,
    "name" TEXT,
    "has_gluten" TEXT,
    "price" REAL,
    "ingredient_id",
    PRIMARY KEY ("selection"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "orders" (
    "order_number" INTEGER NOT NULL,
    "donuts_order" TEXT NOT NULL,
    "customer_id" TEXT NOT NULL,
    "donuts_selection" TEXT,
    PRIMARY KEY ("order_number"),
    FOREIGN KEY ("donuts_selection") REFERENCES "donuts"("selection")
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "history_order" TEXT,
    PRIMARY KEY ("id")
);
