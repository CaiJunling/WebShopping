SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS clothes;
DROP TABLE IF EXISTS users;




/* Create Tables */

CREATE TABLE clothes
(
	clothes_Id int NOT NULL AUTO_INCREMENT,
	clothes_class varchar(10) NOT NULL,
	clothes_brand varchar(10) NOT NULL,
	clothes_name varchar(20) NOT NULL,
	clothes_price float DEFAULT 0 NOT NULL,
	clothes_store int DEFAULT 0 NOT NULL,
	clothes_des text,
	clothes_imgId varchar(100),
	clothes_person int NOT NULL,
	PRIMARY KEY (clothes_Id),
	UNIQUE (clothes_Id)
);


CREATE TABLE users
(
	userID int NOT NULL AUTO_INCREMENT,
	userName varchar(20) NOT NULL,
	nickName varchar(10),
	passWord varchar(20) DEFAULT '111111' NOT NULL,
	tel varchar(11),
	imageId varchar(30),
	birthday varchar(10),
	sex int,
	PRIMARY KEY (userID),
	UNIQUE (userID),
	UNIQUE (tel)
);

ALTER TABLE users MODIFY COLUMN imageId varchar(100);  
