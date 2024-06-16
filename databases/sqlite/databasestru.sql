CREATE TABLE "products" (
	"id" INTEGER NOT NULL,
	"name" TEXT NULL,
	"details" TEXT NULL,
	"price" REAL NULL,
	"inCart" TINYINT NULL,
	"isFavorite" TINYINT NULL,
	"category_id" INTEGER NULL,
	"status" INTEGER NULL,
	"created_at" DATETIME NULL,
	"updated_at" DATETIME NULL,
	"image" TEXT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "0" FOREIGN KEY ("category_id") REFERENCES "categories" ("id") ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE "categories" (
	"id" INTEGER NOT NULL,
	"name" TEXT NULL,
	"created_at" DATETIME NULL,
	"updated_at" DATETIME NULL,
	PRIMARY KEY ("id")
);