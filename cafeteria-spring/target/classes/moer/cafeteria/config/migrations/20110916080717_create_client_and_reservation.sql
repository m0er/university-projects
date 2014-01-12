DROP TABLE IF EXISTS rate;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS menu;

CREATE TABLE client (
	id VARCHAR(20) NOT NULL,
	pw VARCHAR(20) NOT NULL,
	name VARCHAR(20) NOT NULL,
	department VARCHAR(30) NOT NULL,
	type ENUM('USER', 'ADMIN') NOT NULL,
	PRIMARY KEY(id)
);

INSERT INTO client VALUES
('20046326', 'test', '최윤석', '정보통신학부', 'USER'),
('20015286', 'test', '이재학', '정보통신학부', 'USER'),
('20063307', 'test', '김송이', '정보통신학부', 'USER'),
('20046741', 'test', '한상민', '정보통신학부', 'USER'),
('20093342', 'test', '이재관', '정보통신학부', 'USER'),
('admin1', 'test', '김운영', '본부동', 'ADMIN'),
('admin2', 'test', '박운영', '본부동', 'ADMIN');

CREATE TABLE menu (
	id INT AUTO_INCREMENT,
	price INT NOT NULL,
	title VARCHAR(20) NOT NULL,
	building VARCHAR(20) NOT NULL,
	provide_date DATE NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE reservation (
	id INT AUTO_INCREMENT,
	client_id VARCHAR(20) NOT NULL,
	menu_id INT NOT NULL,
	reserve_date DATE NOT NULL,
	type ENUM('NORMAL', 'LUNCH') NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (client_id) REFERENCES client(id),
	FOREIGN KEY (menu_id) REFERENCES menu(id)
);