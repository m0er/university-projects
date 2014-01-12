CREATE TABLE rate (
	id INT AUTO_INCREMENT,
	client_id VARCHAR(20) NOT NULL,
	reservation_id INT NOT NULL,
	comment VARCHAR(100) NOT NULL,
	rate_value INT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (client_id) REFERENCES client(id),
	FOREIGN KEY (reservation_id) REFERENCES reservation(id)
);