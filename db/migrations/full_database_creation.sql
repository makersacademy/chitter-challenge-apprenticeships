-- -------------------------------------------------------------
-- TablePlus 4.0.0(370)
--
-- https://tableplus.com/
--
-- Database: chitter_test
-- Generation Time: 2021-06-27 15:29:08.1780
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."peeps";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;

-- Table Definition
CREATE TABLE "public"."peeps" (
    "id" int4 NOT NULL DEFAULT nextval('peeps_id_seq'::regclass),
    "message" varchar(60),
    "date" varchar(60),
    "username" varchar(60),
    "date_time" varchar(60),
    "user_id" int4,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."peeps" ("id", "message", "date", "username", "date_time", "user_id") VALUES
(1, 'This is a peep!', '06/25/2021 at 10:11', 'test_user', '06/25/2021 at 11:30:18:958:958560000', 1),
(2, 'hello, world!', '06/25/2021 at 10:14', 'aroax', '06/26/2021 at 11:30:18:958:958560000', 2);

DROP TABLE IF EXISTS "public"."users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "id" int4 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    "username" varchar(60),
    "password" varchar(140),
    PRIMARY KEY ("id")
);

INSERT INTO "public"."users" ("id", "username", "password") VALUES
(1, 'test_user', '$2a$12$5Q7bC9eq57VH./eHlj.aze7qN.GljTw9RhKGQWDml9WkRm08uo37a'),
(2, 'aroax', '$2a$12$5Q7bC9eq57VH./eHlj.aze7qN.GljTw9RhKGQWDml9WkRm08uo37a');

ALTER TABLE "public"."peeps" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users"("id");
