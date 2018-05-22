SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS clothes;
DROP TABLE IF EXISTS users;

SELECT DISTINCT clothes_name FROM clothes;



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
	userName varchar(20) DEFAULT '用户' NOT NULL,
	nickName varchar(20) DEFAULT '用户',
	passWord varchar(100) DEFAULT '111111' NOT NULL,
	tel varchar(11),
	imageId varchar(100) DEFAULT 'images/t1.png',
	birthday int DEFAULT '1',
	sex int DEFAULT 1,
	PRIMARY KEY (userID),
	UNIQUE (userID),
	UNIQUE (tel)
);

INSERT INTO users VALUES (1,'caicai','蔡蔡','123456','18827553083','images/t1.png',20,0);
INSERT INTO users VALUES (2,'lele','乐乐','123456','18827551111','images/t2.png',15,1);
INSERT INTO users VALUES (3,'xiaohua','小花','123456','18827552222','images/t1.png',18,0);
INSERT INTO users VALUES (4,'wangle','小王','123456','18827553333','images/t1.png',32,1);


