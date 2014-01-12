CREATE DATABASE moerog;

CREATE TABLE moerogAdmin (
	admin_id VARCHAR(20),
	admin_password VARCHAR(100) NOT NULL,
	admin_nickname VARCHAR(10) NOT NULL,
	admin_email VARCHAR(30) NOT NULL,
	CONSTRAINT admin_id_pk PRIMARY KEY(admin_id),
	CONSTRAINT admin_nickname_uk UNIQUE(admin_nickname),
	CONSTRAINT admin_email_uk UNIQUE(admin_email)
);

ALTER TABLE moerogAdmin MODIFY admin_email VARCHAR(100) NOT NULL;
ALTER TABLE moerogAdmin MODIFY admin_nickname VARCHAR(50) NOT NULL;

INSERT INTO moerogAdmin(admin_id, admin_password, admin_nickname, admin_email) VALUES ('admin', 'test', 'mOer', 'ethdemoer@gmail.com');
SELECT * FROM moerogAdmin;

CREATE TABLE moerogUser (
	user_id VARCHAR(20),
	user_password VARCHAR(100) NOT NULL,
	user_nickname VARCHAR(10) NOT NULL,
	user_email VARCHAR(20) NOT NULL,
	CONSTRAINT user_id_pk PRIMARY KEY(user_id),
	CONSTRAINT user_nickname_uk UNIQUE(user_nickname),
	CONSTRAINT user_email_uk UNIQUE(user_email)
);

ALTER TABLE moerogUser MODIFY user_email VARCHAR(100) NOT NULL;
ALTER TABLE moerogUser MODIFY user_nickname VARCHAR(50) NOT NULL;

ALTER TABLE

CREATE TABLE moerogPost (
	post_id INT NOT NULL AUTO_INCREMENT,
	post_category INT NOT NULL,
	post_title VARCHAR(30) NOT NULL,
	post_datetime TIMESTAMP DEFAULT now(),
	post_content TEXT NOT NULL,
	admin_nickname VARCHAR(10) NOT NULL,
	CONSTRAINT post_id_pk PRIMARY KEY(post_id),
	CONSTRAINT post_admin_nickname_fk
		FOREIGN KEY(admin_nickname)
		REFERENCES moerogAdmin(admin_nickname)
);

ALTER TABLE moerogPost MODIFY post_title VARCHAR(100) NOT NULL;

CREATE TABLE moerogComment (
	comment_id INT NOT NULL AUTO_INCREMENT,
	comment_datetime TIMESTAMP DEFAULT now(),
	comment_writer VARCHAR(10) NOT NULL,
	comment_content TEXT NOT NULL,
	post_id INT NOT NULL,
	CONSTRAINT comment_id_pk PRIMARY KEY(comment_id),
	CONSTRAINT comment_post_id_fk
		FOREIGN KEY(post_id)
		REFERENCES moerogPost(post_id)
);

CREATE TABLE moerogGuestbook (
	gbook_id INT NOT NULL AUTO_INCREMENT,
	gbook_datetime TIMESTAMP DEFAULT now(),
	gbook_writer VARCHAR(10) NOT NULL,
	gbook_content TEXT NOT NULL,
	CONSTRAINT gbook_id_pk PRIMARY KEY(gbook_id)
);

SELECT * FROM moerogGuestbook;
DELETE FROM moerogGuestbook;

create table test (i int, d timestamp default now());
INSERT INTO test(i) VALUES(100);
SELECT * FROM test;
DROP table test;

show tables;

SELECT count(*) FROM moerogGuestBook;
SELECT * FROM moerogComment;
SELECT * FROM moerogUser;