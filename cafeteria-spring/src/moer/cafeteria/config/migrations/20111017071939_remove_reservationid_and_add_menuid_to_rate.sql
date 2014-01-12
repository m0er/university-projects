DELETE FROM rate;

ALTER TABLE rate
ADD menu_id INT NOT NULL,
ADD FOREIGN KEY (menu_id) REFERENCES menu(id);

ALTER TABLE rate
DROP FOREIGN KEY rate_ibfk_2,
DROP COLUMN reservation_id;