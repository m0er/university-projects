CREATE DATABASE IF NOT EXISTS meetup DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON meetup.* TO 'meetup'@'%' IDENTIFIED BY 'admin';
FLUSH PRIVILEGES;

create table user (
	email varchar(100) not null,
	password varchar(50) not null,
	primary key(email)
);

create table meeting (
	id int auto_increment,
	title varchar(100) not null,
	limit_attendee int not null,
	create_timestamp timestamp default now(),
	open_timestamp timestamp not null,
	close_timestamp timestamp not null,
	owner varchar(100) not null,
	description varchar(100) not null,
	location varchar(100) not null,
	primary key(id),
	foreign key (owner) references user(email)
);

create table attendee (
	id int auto_increment,
	meeting_id int not null,
	user_id varchar(100) not null,
	primary key(id),
	foreign key (meeting_id) references meeting(id),
	foreign key (user_id) references user(email)
);

create table calendar (
	id varchar(100) not null,
	summary varchar(100) not null,
	timezone varchar(50) not null,
	primary key(id)
);

create table event (
	id varchar(100) not null,
	meeting_id int not null,
	primary key(id),
	foreign key (meeting_id) references meeting(id)
);

