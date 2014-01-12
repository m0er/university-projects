CREATE DATABASE IF NOT EXISTS food_system;

GRANT USAGE ON *.* TO bu@localhost IDENTIFIED BY "food";
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON food_system.* TO bu@localhost;
FLUSH PRIVILEGES;

CREATE TABLE client (
	id VARCHAR(20) NOT NULL,
	pw VARCHAR(20) NOT NULL,
	name VARCHAR(20) NOT NULL,
	department VARCHAR(30) NOT NULL,
	type ENUM('USER', 'ADMIN') NOT NULL,
	PRIMARY KEY(id)
);

INSERT INTO client VALUES
('20046326', 'test', '최윤석', '소프트웨어', 'USER'),
('20015286', 'test', '이재학', '소프트웨어', 'USER'),
('20063307', 'test', '김송이', '소프트웨어', 'USER'),
('20046741', 'test', '한상민', '소프트웨어', 'USER'),
('20093342', 'test', '이재관', '정보보호', 'USER'),
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

INSERT INTO menu (price, title, building, provide_date) VALUES
(2000, '돈까스', '본부동', '2010-05-04');

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

SELECT * FROM reservation;

ALTER TABLE reservation ADD COLUMN type ENUM('NORMAL', 'LUNCH') NOT NULL;

INSERT INTO reservation (client_id, menu_id, reserve_date) VALUES
('20046326', 1, '2010-05-08');

INSERT INTO reservation (client_id, menu_id, reserve_date) VALUES
('20046741', 1, '2010-05-08'),
('20063307', 3, '2010-05-08');



SELECT menu.title, menu.price, menu.building, reservation.id
FROM menu, reservation
WHERE menu.id = reservation.menu_id;

SELECT id, price, title, building, provide_date
FROM menu;

CREATE TABLE date_test (
	date DATE,
	datetime DATETIME
);

DESC date_test;

SELECT * FROM date_test;
SELECT * FROM menu;
DELETE FROM menu WHERE building = 'bonbu';

INSERT INTO menu (title, building, price, provide_date) VALUES
('테스트 메뉴1', '본부동', 2000, '2010-05-16'),
('테스트 메뉴2', '본부동', 2600, '2010-05-16'),
('테스트 메뉴3', '본부동', 3000, '2010-05-16'),
('테스트 메뉴4', '본부동', 3500, '2010-05-16');

SELECT date date, datetime dateTime FROM date_test;

SELECT id, price, title, building, provide_date provideDate
FROM menu
WHERE provide_date = '2010-05-25';

SELECT * FROM menu WHERE provide_date = '2010-05-16';
SELECT * FROM reservation;
SELECT * FROM client;

SELECT reservation.id id, client.id clientID, client.name, client.department, menu.id menuID, menu.title, reservation.reserve_date reserveDate, reservation.type
FROM reservation, client, menu
WHERE reserve_date = '2010-05-16'
AND client.id = reservation.client_id
AND menu.id = reservation.menu_id
AND menu.building = '본부동';

show tables;

DESC reservation;

SELECT reservation.id id, client.id clientID, client.name, client.department, menu.title, menu.id 
menuID, reservation.reserve_date reserveDate, reservation.type FROM reservation, client, menu 
WHERE reserve_date = '2010-05-16' AND menu.building = '본부동' AND client.id = reservation.client_id
AND menu.id = reservation.menu_id;

SELECT id, price, title, building, provide_date provideDate FROM menu WHERE provide_date = 
'2010-05-21';

SELECT id, price, title, building, provide_date provideDate
FROM menu
WHERE provide_date = '2010-05-21'
AND building = '교수회관';

DELETE FROM reservation
WHERE id = '4';







