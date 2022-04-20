ALTER TABLE peeps
ADD created_at VARCHAR(60) DEFAULT to_char(NOW(), 'On dd-MM-yyyy at HH24:MI');