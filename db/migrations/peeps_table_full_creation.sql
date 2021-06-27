CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;

-- Table Definition
CREATE TABLE "public"."peeps" (
    "id" int4 NOT NULL DEFAULT nextval('peeps_id_seq'::regclass),
    "message" varchar(60),
    "date" varchar(60),
    "username" varchar(30),
    PRIMARY KEY ("id")
);

INSERT INTO "public"."peeps" ("id", "message", "date", "username") VALUES
(1, 'This is a peep!', '06/25/2021 at 10:11', 'First'),
(2, 'hello, world!', '06/25/2021 at 10:14', 'aroax'),
(3, 'hello I am third', '06/25/2021 at 10:21', 'Mr Third');
