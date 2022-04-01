alter table peeps add column created_at timestamp without time zone;

ALTER TABLE peeps ALTER COLUMN created_at SET DEFAULT now();

