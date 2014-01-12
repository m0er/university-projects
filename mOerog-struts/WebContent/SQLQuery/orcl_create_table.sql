CREATE TABLE moerogAdmin (
	admin_id VARCHAR2(20),
	admin_password VARCHAR2(20) NOT NULL,
	admin_nickname VARCHAR2(10) NOT NULL,
	admin_email VARCHAR2(30) NOT NULL,
	CONSTRAINT admin_id_pk PRIMARY KEY(admin_id),
	CONSTRAINT admin_nickname_uk UNIQUE(admin_nickname),
	CONSTRAINT admin_email_uk UNIQUE(admin_email)
);

ALTER TABLE moerogAdmin MODIFY (
	admin_password VARCHAR2(100)
);

CREATE TABLE moerogUser (
	user_id VARCHAR2(20),
	user_password VARCHAR2(20) NOT NULL,
	user_nickname VARCHAR2(10) NOT NULL,
	user_email VARCHAR2(20) NOT NULL,
	CONSTRAINT user_id_pk PRIMARY KEY(user_id),
	CONSTRAINT user_nickname_uk UNIQUE(user_nickname),
	CONSTRAINT user_email_uk UNIQUE(user_email)
);

ALTER TABLE moerogUser MODIFY (
	user_password VARCHAR2(100)
);

CREATE TABLE moerogPost (
	post_id NUMBER,
	post_category NUMBER NOT NULL,
	post_title VARCHAR2(30) NOT NULL,
	post_datetime DATE DEFAULT CURRENT_DATE,
	post_content NCLOB NOT NULL,
	admin_nickname VARCHAR2(10) NOT NULL,
	CONSTRAINT post_id_pk PRIMARY KEY(post_id),
	CONSTRAINT post_admin_nickname_fk
		FOREIGN KEY(admin_nickname)
		REFERENCES moerogAdmin(admin_nickname)
);

CREATE SEQUENCE seq_post_id
START WITH 1
INCREMENT BY 1;

CREATE TABLE moerogComment (
	comment_id NUMBER,
	comment_datetime DATE DEFAULT CURRENT_DATE,
	comment_content NCLOB NOT NULL,
	admin_nickname VARCHAR2(10) NULL,
	user_nickname VARCHAR2(10) NULL,
	post_id NUMBER NOT NULL,		
	CONSTRAINT comment_id_pk PRIMARY KEY(comment_id),
	CONSTRAINT comment_admin_nickname_fk
		FOREIGN KEY(admin_nickname)
		REFERENCES moerogAdmin(admin_nickname),
	CONSTRAINT comment_user_nickname_fk
		FOREIGN KEY(user_nickname)
		REFERENCES moerogUser(user_nickname),
	CONSTRAINT comment_post_id_fk
		FOREIGN KEY(post_id)
		REFERENCES moerogPost(post_id)
);

ALTER TABLE moerogComment DROP (
	admin_nickname, user_nickname
);

ALTER TABLE moerogComment ADD (
	writer VARCHAR2(10)
);

CREATE SEQUENCE seq_comment_id
START WITH 1
INCREMENT BY 1;

CREATE TABLE moerogGuestbook (
	gbook_id NUMBER,
	gbook_datetime DATE DEFAULT CURRENT_DATE,
	gbook_content NCLOB NOT NULL,
	admin_nickname VARCHAR2(10),
	user_nickname VARCHAR2(10),
	CONSTRAINT gbook_id_pk PRIMARY KEY(gbook_id),
	CONSTRAINT gbook_admin_nickname_fk
		FOREIGN KEY(admin_nickname)
		REFERENCES moerogAdmin(admin_nickname),
	CONSTRAINT gbook_user_nickname_fk
		FOREIGN KEY(user_nickname)
		REFERENCES moerogUser(user_nickname)
)

ALTER TABLE moerogGuestBook DROP (
	admin_nickname, user_nickname
);

ALTER TABLE moerogGuestBook ADD (
	writer VARCHAR2(10)
);

CREATE SEQUENCE seq_gbook_id
START WITH 1
INCREMENT BY 1;