DROP TABLE IF EXISTS "public"."recipes";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS recipes_id_seq;

-- Table Definition
CREATE TABLE "public"."recipes" (
    "id" SERIAL,
    "name" text,
    "cooking_time" int,
    "rating" int,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."recipes" ("id", "name", "cooking_time", "rating") VALUES
(1, 'carbonara', 8, 5),
(2, 'lasagna', 22, 5),
(3, 'fried rice', 6, 4),
(4, 'katsu curry', 17, 5),
(5, 'feijoaa', 120, 5);
