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

INSERT INTO clothes VALUES (1,'风衣','李宁','A系列',744.72,102,'Mauris sapien dictum mattis diam iaculis Nunc augue Cum suscipit','images/1.png',1);
INSERT INTO clothes VALUES (2,'风衣','爱马仕','E系列',379.71,409,'ligula enim mollis euismod consequat purus per egestas lacus Vestibulum','images/9.png',0);
INSERT INTO clothes VALUES (3,'背心','鳄鱼','E系列',458.17,537,'Nunc dapibus quis Ut diam vel diam montes faucibus dis','images/6.png',2);
INSERT INTO clothes VALUES (4,'运动裤','鳄鱼','C系列',901.61,364,'sociosqu nibh nec nec euismod libero facilisis facilisis eros magnis','images/6.png',2);
INSERT INTO clothes VALUES (5,'长袖T恤','鳄鱼','F系列',842.68,43,'Nunc Curae Nam netus Aliquam Pellentesque dignissim sapien odio ad','images/4.png',1);
INSERT INTO clothes VALUES (6,'风衣','阿玛尼','D系列',446.59,42,'sem diam volutpat molestie neque rhoncus suscipit massa risus massa','images/7.png',2);
INSERT INTO clothes VALUES (7,'休闲裤','匹克','A系列',364.75,398,'Phasellus elit senectus a Duis scelerisque Etiam pellentesque convallis scelerisque','images/9.png',1);
INSERT INTO clothes VALUES (8,'风衣','安踏','F系列',638.17,534,'sem eleifend nunc elementum eleifend dolor nascetur Ut imperdiet dignissim','images/2.png',0);
INSERT INTO clothes VALUES (9,'牛仔外套','森马','A系列',313.92,570,'varius vitae id ut posuere Vestibulum Suspendisse taciti Donec id','images/8.png',2);
INSERT INTO clothes VALUES (10,'卫衣','唐狮','B系列',466.59,536,'morbi justo elit pharetra Sed mattis quam facilisi urna leo','images/8.png',2);
INSERT INTO clothes VALUES (11,'运动裤','匹克','D系列',367.66,677,'venenatis augue montes mollis gravida magnis sagittis velit Integer Ut','images/6.png',0);
INSERT INTO clothes VALUES (12,'背心','匹克','F系列',75.86,52,'posuere aliquet arcu molestie sed Nullam volutpat semper est iaculis','images/7.png',0);
INSERT INTO clothes VALUES (13,'休闲裤','匹克','C系列',999.62,429,'taciti feugiat sagittis pellentesque ullamcorper ornare Praesent Lorem mattis Nulla','images/0.png',2);
INSERT INTO clothes VALUES (14,'休闲裤','美特斯邦威','B系列',570.65,517,'per Proin In pellentesque eros varius mattis aptent dis natoque','images/5.png',0);
INSERT INTO clothes VALUES (15,'长袖T恤','阿迪达斯','C系列',781.72,670,'vitae quis aptent eleifend Nunc pulvinar fermentum purus Vestibulum nulla','images/4.png',1);
INSERT INTO clothes VALUES (16,'衬衫','优衣库','D系列',633.62,184,'Aliquam per turpis Nunc euismod dignissim quam sed Morbi nascetur','images/2.png',0);
INSERT INTO clothes VALUES (17,'夹克','爱马仕','A系列',362.03,798,'Pellentesque eleifend neque montes eros Phasellus habitant ridiculus lorem natoque','images/8.png',0);
INSERT INTO clothes VALUES (18,'背心','优衣库','F系列',309.41,927,'hendrerit dictum viverra bibendum egestas cubilia inceptos sollicitudin et faucibus','images/8.png',0);
INSERT INTO clothes VALUES (19,'卫衣','安踏','C系列',957.64,524,'hendrerit fermentum Duis lacinia iaculis lobortis adipiscing massa hendrerit porttitor','images/3.png',0);
INSERT INTO clothes VALUES (20,'背心','安踏','A系列',46.70,922,'eros ut nascetur metus tincidunt facilisis convallis cubilia consectetuer netus','images/0.png',0);
INSERT INTO clothes VALUES (21,'风衣','匹克','D系列',303.05,712,'fermentum ad lectus Aenean tortor venenatis ac sed Ut Mauris','images/1.png',0);
INSERT INTO clothes VALUES (22,'休闲裤','爱马仕','C系列',875.74,278,'dapibus dis odio imperdiet vestibulum Aliquam molestie torquent sed arcu','images/1.png',0);
INSERT INTO clothes VALUES (23,'风衣','鳄鱼','A系列',425.30,390,'tempor ullamcorper iaculis Praesent lacinia ultricies gravida posuere pede elementum','images/1.png',2);
INSERT INTO clothes VALUES (24,'牛仔外套','鳄鱼','B系列',596.61,629,'ullamcorper litora mollis Suspendisse venenatis imperdiet volutpat erat Integer at','images/0.png',2);
INSERT INTO clothes VALUES (25,'衬衫','李宁','E系列',305.40,902,'gravida dis venenatis pharetra malesuada laoreet lectus tortor et ut','images/8.png',1);
INSERT INTO clothes VALUES (26,'牛仔外套','安踏','F系列',695.74,94,'Nunc porttitor pulvinar adipiscing dis ultrices tempor Integer laoreet malesuada','images/5.png',0);
INSERT INTO clothes VALUES (27,'背心','美特斯邦威','C系列',235.95,66,'eros Pellentesque viverra tristique Nunc scelerisque convallis consequat justo orci','images/2.png',0);
INSERT INTO clothes VALUES (28,'衬衫','唐狮','F系列',575.49,821,'Proin fames dolor Duis Quisque posuere facilisi tempus imperdiet nulla','images/1.png',2);
INSERT INTO clothes VALUES (29,'羽绒服','阿迪达斯','D系列',351.18,428,'lacus semper Curae Praesent sociis semper sed fringilla elementum lacinia','images/8.png',1);
INSERT INTO clothes VALUES (30,'风衣','阿玛尼','B系列',777.56,470,'habitant Proin mauris eros tristique fermentum et justo aliquet sit','images/3.png',2);
INSERT INTO clothes VALUES (31,'背心','唐狮','A系列',145.95,37,'senectus pellentesque non quis semper suscipit ridiculus ipsum magnis neque','images/3.png',2);
INSERT INTO clothes VALUES (32,'羽绒服','美特斯邦威','C系列',780.78,432,'velit enim accumsan egestas vel per tristique Etiam Sed blandit','images/9.png',0);
INSERT INTO clothes VALUES (33,'羽绒服','优衣库','A系列',837.83,102,'Vivamus blandit enim volutpat Cum Curae porta metus dignissim laoreet','images/9.png',0);
INSERT INTO clothes VALUES (34,'衬衫','阿迪达斯','A系列',137.12,696,'amet ultrices tortor hendrerit odio suscipit ridiculus eros ornare tempor','images/7.png',1);
INSERT INTO clothes VALUES (35,'牛仔外套','阿迪达斯','E系列',471.01,650,'at primis Quisque sagittis feugiat turpis hendrerit condimentum pretium est','images/6.png',0);
INSERT INTO clothes VALUES (36,'风衣','爱马仕','A系列',765.69,411,'sed Vestibulum sociis vitae Pellentesque ridiculus Lorem augue Nullam amet','images/7.png',1);
INSERT INTO clothes VALUES (37,'牛仔裤','李宁','B系列',47.85,993,'euismod Aenean morbi conubia pretium nulla cubilia Integer ligula in','images/7.png',0);
INSERT INTO clothes VALUES (38,'背心','阿玛尼','A系列',676.56,36,'Class Pellentesque tristique Aenean pede dolor Phasellus ornare tempus dis','images/2.png',2);
INSERT INTO clothes VALUES (39,'牛仔裤','安踏','E系列',311.91,711,'sollicitudin sociis nisi Nunc tristique diam dictum sollicitudin justo risus','images/1.png',0);
INSERT INTO clothes VALUES (40,'运动裤','安踏','C系列',159.39,43,'sed vestibulum dis Fusce est Duis ullamcorper primis lectus mi','images/2.png',1);
INSERT INTO clothes VALUES (41,'夹克','唐狮','A系列',320.54,5,'Class Mauris mauris Suspendisse sollicitudin habitant senectus commodo nonummy vitae','images/8.png',1);
INSERT INTO clothes VALUES (42,'卫衣','阿迪达斯','D系列',576.20,616,'Proin ultricies urna conubia pharetra felis ultricies fames egestas litora','images/8.png',1);
INSERT INTO clothes VALUES (43,'短袖T恤','鳄鱼','B系列',255.73,101,'dictum Morbi a hendrerit justo libero Nunc diam quis erat','images/4.png',0);
INSERT INTO clothes VALUES (44,'牛仔外套','匹克','B系列',185.57,225,'penatibus Nulla blandit pulvinar viverra litora habitant tristique lobortis primis','images/0.png',0);
INSERT INTO clothes VALUES (45,'运动裤','阿玛尼','B系列',119.27,138,'sollicitudin Integer iaculis ultrices interdum hymenaeos Nulla Lorem In sociosqu','images/8.png',0);
INSERT INTO clothes VALUES (46,'牛仔外套','美特斯邦威','E系列',829.30,478,'mollis varius tempus mus Nullam metus suscipit imperdiet lacus Nullam','images/5.png',0);
INSERT INTO clothes VALUES (47,'衬衫','森马','B系列',20.48,614,'ornare taciti Aenean Nam massa Nam porttitor magnis dis nisi','images/3.png',0);
INSERT INTO clothes VALUES (48,'衬衫','森马','C系列',850.61,140,'libero suscipit dolor litora Mauris erat pretium ultrices Quisque urna','images/5.png',0);
INSERT INTO clothes VALUES (49,'长袖T恤','阿玛尼','A系列',771.12,742,'nec gravida facilisis parturient Vivamus magnis eleifend enim vehicula eros','images/7.png',1);
INSERT INTO clothes VALUES (50,'衬衫','爱马仕','D系列',843.74,596,'tempus dignissim dictum tempus nec faucibus montes id accumsan mi','images/4.png',2);
INSERT INTO clothes VALUES (51,'牛仔裤','爱马仕','F系列',762.65,342,'nec vulputate conubia ad magna rhoncus magnis porttitor bibendum commodo','images/8.png',0);
INSERT INTO clothes VALUES (52,'短袖T恤','安踏','B系列',780.59,886,'ligula urna mollis dis pellentesque dui luctus condimentum vehicula dapibus','images/5.png',0);
INSERT INTO clothes VALUES (53,'羽绒服','阿玛尼','B系列',776.67,287,'tristique Nullam taciti Maecenas pellentesque Curae Curae ipsum Fusce porta','images/7.png',1);
INSERT INTO clothes VALUES (54,'运动裤','森马','E系列',723.18,610,'morbi vitae aliquam Phasellus per eu amet Aliquam neque Cum','images/7.png',0);
INSERT INTO clothes VALUES (55,'衬衫','优衣库','C系列',12.66,856,'ornare laoreet commodo facilisi blandit Praesent a mollis consectetuer neque','images/1.png',1);
INSERT INTO clothes VALUES (56,'长袖T恤','美邦','E系列',263.04,191,'magnis pellentesque nisi penatibus consectetuer Maecenas placerat sapien dictum torquent','images/5.png',1);
INSERT INTO clothes VALUES (57,'短袖T恤','阿迪达斯','F系列',63.24,771,'eget sodales lacus vestibulum ornare parturient senectus euismod nunc penatibus','images/5.png',1);
INSERT INTO clothes VALUES (58,'风衣','安踏','F系列',755.28,919,'aliquam purus enim pharetra ridiculus orci justo Etiam pulvinar vel','images/8.png',1);
INSERT INTO clothes VALUES (59,'牛仔裤','爱马仕','D系列',515.25,342,'magnis Vestibulum mus lacinia interdum massa Nulla congue morbi ligula','images/0.png',2);
INSERT INTO clothes VALUES (60,'卫衣','阿玛尼','E系列',304.37,412,'Ut Cum mollis elit magnis Curabitur varius Vestibulum Donec id','images/0.png',1);
INSERT INTO clothes VALUES (61,'休闲裤','唐狮','B系列',319.51,808,'nibh Nulla magna sapien consectetuer vestibulum erat augue sit nisl','images/2.png',2);
INSERT INTO clothes VALUES (62,'背心','安踏','E系列',705.50,764,'Curabitur taciti mi lacinia tincidunt egestas tempor scelerisque posuere porta','images/0.png',0);
INSERT INTO clothes VALUES (63,'衬衫','安踏','C系列',288.17,38,'justo elit faucibus mus augue nulla sit tellus turpis libero','images/5.png',2);
INSERT INTO clothes VALUES (64,'牛仔裤','鳄鱼','C系列',39.02,848,'Ut Proin Praesent Cras Etiam libero Ut pede Vivamus pede','images/1.png',2);
INSERT INTO clothes VALUES (65,'衬衫','美邦','C系列',227.79,580,'nisi ut rhoncus vehicula quam libero orci pulvinar Aliquam commodo','images/0.png',0);
INSERT INTO clothes VALUES (66,'休闲裤','美邦','A系列',24.65,241,'vel Donec vitae Lorem Donec lorem Integer fames Integer eget','images/8.png',2);
INSERT INTO clothes VALUES (67,'休闲裤','阿玛尼','A系列',416.56,708,'aptent Integer Nunc est amet posuere magnis magna pulvinar egestas','images/2.png',0);
INSERT INTO clothes VALUES (68,'牛仔外套','阿玛尼','F系列',905.17,138,'hymenaeos aptent bibendum ullamcorper interdum nec ornare Cras sagittis ultricies','images/7.png',1);
INSERT INTO clothes VALUES (69,'背心','森马','C系列',818.23,793,'Cum augue odio vehicula tortor dignissim Quisque Donec sit hymenaeos','images/4.png',2);
INSERT INTO clothes VALUES (70,'夹克','爱马仕','A系列',371.36,674,'lorem ornare massa ad sollicitudin egestas interdum per Morbi Quisque','images/5.png',0);
INSERT INTO clothes VALUES (71,'长袖T恤','爱马仕','E系列',958.84,138,'parturient dis mauris nunc ornare sociis Lorem Fusce non Quisque','images/2.png',2);
INSERT INTO clothes VALUES (72,'背心','唐狮','F系列',730.97,948,'lobortis elementum magna egestas aliquam Fusce aliquet lorem risus purus','images/2.png',1);
INSERT INTO clothes VALUES (73,'牛仔外套','森马','B系列',589.97,93,'euismod nisi Fusce quis sagittis mauris Duis viverra risus mauris','images/7.png',1);
INSERT INTO clothes VALUES (74,'卫衣','匹克','D系列',732.02,36,'augue felis tempor molestie Class elit elementum Lorem placerat In','images/7.png',2);
INSERT INTO clothes VALUES (75,'羽绒服','鳄鱼','E系列',847.60,925,'dolor laoreet Mauris quam tempus Quisque lectus sed sociosqu Pellentesque','images/9.png',2);
INSERT INTO clothes VALUES (76,'羽绒服','阿玛尼','C系列',851.15,463,'vel euismod volutpat senectus hymenaeos Vivamus lobortis suscipit volutpat habitant','images/9.png',0);
INSERT INTO clothes VALUES (77,'夹克','唐狮','F系列',428.93,367,'dis ut non tincidunt senectus scelerisque neque auctor arcu Suspendisse','images/3.png',0);
INSERT INTO clothes VALUES (78,'夹克','匹克','D系列',312.59,43,'tellus tempus pede lectus tortor nisi condimentum eros semper at','images/1.png',1);
INSERT INTO clothes VALUES (79,'羽绒服','鳄鱼','D系列',279.64,329,'turpis Nulla ultricies lacinia semper a Aliquam risus posuere luctus','images/5.png',2);
INSERT INTO clothes VALUES (80,'牛仔裤','优衣库','C系列',355.76,511,'ac fringilla dapibus justo viverra neque laoreet Ut ornare taciti','images/8.png',0);
INSERT INTO clothes VALUES (81,'风衣','爱马仕','E系列',295.75,378,'fames pulvinar quis scelerisque Duis Vestibulum tristique vel varius justo','images/4.png',1);
INSERT INTO clothes VALUES (82,'休闲裤','优衣库','E系列',502.92,258,'facilisi Suspendisse sagittis nec amet diam Mauris mi ornare quam','images/8.png',1);
INSERT INTO clothes VALUES (83,'短袖T恤','美邦','A系列',572.98,609,'hendrerit Sed pharetra egestas mollis litora Nulla parturient Aenean tempus','images/1.png',1);
INSERT INTO clothes VALUES (84,'休闲裤','阿玛尼','E系列',198.95,28,'hymenaeos diam suscipit porta adipiscing Nullam urna morbi porttitor Nam','images/8.png',1);
INSERT INTO clothes VALUES (85,'短袖T恤','安踏','C系列',732.12,747,'senectus odio eget dis interdum tincidunt purus semper Lorem cursus','images/3.png',2);
INSERT INTO clothes VALUES (86,'牛仔外套','唐狮','E系列',36.64,710,'nulla Curabitur congue odio purus Pellentesque ultricies ornare felis Cras','images/7.png',2);
INSERT INTO clothes VALUES (87,'风衣','安踏','B系列',262.06,909,'natoque luctus In a primis nisl fermentum fames netus Mauris','images/6.png',1);
INSERT INTO clothes VALUES (88,'背心','优衣库','D系列',991.63,546,'blandit venenatis porttitor Nullam risus rutrum aptent molestie adipiscing taciti','images/2.png',2);
INSERT INTO clothes VALUES (89,'牛仔裤','优衣库','D系列',156.84,555,'ridiculus penatibus Etiam Suspendisse fringilla consectetuer purus id lacus eleifend','images/7.png',2);
INSERT INTO clothes VALUES (90,'长袖T恤','唐狮','A系列',555.31,112,'eget Aliquam odio egestas interdum penatibus sem blandit vel natoque','images/8.png',0);
INSERT INTO clothes VALUES (91,'卫衣','唐狮','C系列',128.42,569,'Etiam euismod parturient ac scelerisque ultricies Pellentesque id cubilia aptent','images/9.png',1);
INSERT INTO clothes VALUES (92,'衬衫','阿玛尼','C系列',259.08,937,'Nullam commodo lorem pretium velit sapien purus urna dis mi','images/6.png',2);
INSERT INTO clothes VALUES (93,'长袖T恤','唐狮','E系列',613.70,965,'tellus Aenean velit nunc nunc interdum dis nunc tellus Lorem','images/8.png',1);
INSERT INTO clothes VALUES (94,'运动裤','爱马仕','D系列',888.29,483,'placerat nonummy pellentesque tortor Class accumsan facilisi lectus placerat Fusce','images/6.png',0);
INSERT INTO clothes VALUES (95,'短袖T恤','爱马仕','C系列',820.28,383,'inceptos eros Cum ac per est cubilia Nam fames inceptos','images/1.png',2);
INSERT INTO clothes VALUES (96,'长袖T恤','唐狮','A系列',908.48,409,'nunc sed turpis Class viverra ultrices massa malesuada Proin dignissim','images/9.png',1);
INSERT INTO clothes VALUES (97,'长袖T恤','安踏','B系列',470.32,847,'habitant nulla conubia nisl eleifend mattis sapien porta Cum Cum','images/5.png',2);
INSERT INTO clothes VALUES (98,'衬衫','鳄鱼','A系列',98.94,578,'Duis varius dignissim nec erat ac turpis mauris Suspendisse ullamcorper','images/8.png',1);
INSERT INTO clothes VALUES (99,'衬衫','爱马仕','D系列',667.04,845,'at amet tortor Integer sociis pretium consequat mauris torquent dis','images/2.png',1);

