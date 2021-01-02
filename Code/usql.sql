-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: db_music
-- ------------------------------------------------------
-- Server version	5.6.45-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_bin NOT NULL,
  `comment` varchar(150) COLLATE utf8_bin NOT NULL,
  `showTime` bigint(15) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'admin','hello world',1609490652039),(2,'发giao','我系发糕，欢迎大家来砍我',1609491969257),(3,'娘屁屁','一柄长剑，一袭白衣，是在下无敌了',1609492045725),(4,'admin','for(int i = 0; i < 3; i++)\nprint(\"666\")',1609492131749),(5,'admin','',1609492132006),(6,'admin','飙升榜最高纪录被一次又一次刷新.【火星人来过】1059％ 【高尚】1592％ 【动物世界】1709％ 【暧昧】1798％让我们一起期待薛之谦的下一首新歌',1609492246308),(7,'admin','这个榜单不错哟',1609493162604),(8,'admin','world',1609493211156),(9,'admin','hello',1609493213993),(10,'admin','郭顶太顶啦，，，，啊，，，，',1609494266736),(11,'汤giao','大爱jj',1609550472188),(12,'宋文','哇喔！！！！！',1609553108781);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(100) COLLATE utf8_bin NOT NULL,
  `playcount` int(11) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES (1,'Alex Goot - Apologize.mp3',3),(2,'Conor Maynard - 7 Years.mp3',35),(3,'Gamper & Dadoni,Ember Island - Creep.mp3',25),(4,'KnightAe - 专业团队（You Know I\'ll Go Get）.mp3',13),(5,'KOKIA - ありがとう···.mp3',17),(6,'MADILYN,MAX,Kurt Hugo Schneider - Love Me Like You Do.mp3',12),(7,'Matte,Ember Island - Umbrella (Matte Remix).mp3',3),(8,'Natasha Thomas - Let Me Show You The Way.mp3',2),(9,'The Glitch Mob,Mako,The Word Alive - RISE.mp3',56),(10,'The Morning After - So You.mp3',2),(11,'丁芙妮 - Perfect (翻自 Ed Sheeran).mp3',1),(12,'不才 - 化身孤岛的鲸.mp3',1),(13,'不才 - 如果有来生.mp3',2),(14,'倪金威 - 一次就好(电影《夏洛特烦恼》暖水曲).mp3',1),(15,'刘昊霖,kidult. - Landing Guy.mp3',1),(16,'星华 - 烟火人间（完整版）（翻自 添儿呗）.mp3',4),(17,'杨搏 - 独白.mp3',2),(18,'林俊杰 - 她说.mp3',9),(19,'沈虫虫,丫蛋蛋 - 遇见 (Cover ：孙燕姿).mp3',1),(20,'清水淳一 - Bloom of Youth.mp3',6),(21,'满汉全席 - 干物女.mp3',1),(22,'薛之谦 - 天外来物.mp3',1),(23,'薛之谦,郭聪明 - 耗尽.mp3',2),(24,'袁小葳 - 我的名字（翻自 焦迈奇）.mp3',1),(25,'许天昱,陈旭辉nn,单子玹 - 串烧.mp3',7),(26,'郭顶 - 我们俩.mp3',2),(27,'陈小黄 - 恨幸福来过.mp3',1),(28,'鸣小明 - 太阳（翻自 邱振哲）.mp3',2),(40,'Dark Moon - 柴可夫斯基 - 天鹅湖.mp3',1),(41,'David Hoffman - Minuet in G.mp3',1),(42,'Edward Elgar - Salut D’amour Op. 12.mp3',1),(43,'Frédéric François Chopin - 夜曲.mp3',1),(44,'Johannes Brahms - 匈牙利圆舞曲.mp3',1),(45,'John H. Clarke - Spanish Romance by Anonymous.mp3',1),(46,'Wolfgang Amadeus Mozart - Menuet D major.mp3',1),(63,'BIGBANG - IF YOU (Live).mp3',2),(64,'DIA - 안녕.mp3',3),(65,'iKON - MY TYPE (취향저격).mp3',2),(66,'KCM,Soul Dive - 죽도록 사랑해.mp3',3),(67,'Tiger JK,Jinsil - Reset.mp3',3),(68,'V.A. - 죽도록 사랑해.mp3',1),(69,'VERIVERY - My Beauty.mp3',2),(70,'七公主 - 우유쏭.mp3',2),(71,'乌龟组合 - 빙 고.mp3',2),(72,'殷嘉恩,Kidstep - Never Say Goodbye.mp3',1),(73,'레게 강 같은 평화 (RGP),权正烈 - Beautiful Girl.mp3',1),(97,'3LAU,Carly Paige - Touch.mp3',2),(98,'Adam Danial,Torine - Play.mp3',1),(99,'Adieu - Holy Grail (Adieu Remix).mp3',1),(100,'Alan Walker - The Spectre.mp3',1),(101,'Alan Walker,Noah Cyrus,Digital Farm Animals - All Falls Down.mp3',1),(102,'BEAUZ,Nevve,Kastilione - Count The Hours.mp3',1),(103,'Blanks - Better Now.mp3',1),(104,'Calvin Harris,Ellie Goulding - Outside.mp3',2),(105,'Danny Avila - End Of The Night.mp3',1),(106,'Dash Berlin,Bo Bruce - Coming Home.mp3',1),(107,'FrogMonster - Remember Our Summer.mp3',1),(108,'J. Lisk - Where Is Your Love.mp3',1),(109,'Slushii - Past Lives.mp3',1),(110,'Higher Brothers - 嘻哈帝国 (Empire).mp3',2),(111,'KEY.L刘聪,$CC731 - Hey KONG.mp3',1),(112,'KEY.L刘聪,$CC731 - MY BOO.mp3',1),(113,'KEY.L刘聪,Kafe.Hu - 经济舱.mp3',1),(114,'Lambert,十七草 - young boss 2.0.mp3',1),(115,'YTH Chopie,YOUNG13DBABY - Best Friend.mp3',1),(116,'于贞 - 飞奔向你.mp3',1),(117,'姜云升,阿达娃 - 起点.mp3',1),(118,'杨和苏KeyNG - 小丑女.mp3',1),(119,'杨和苏KeyNG,张杰 - 下一段旅程.mp3',1),(120,'法老 - 百变酒精.mp3',1),(121,'鬼卞,银临 - 弦外知音.mp3',1),(122,'Mr.16罗隽永 - 处处吻( 复 古 蒸 汽 波 改 编 )（翻自 杨千嬅）.mp3',1),(123,'Sasha Sloan - Dancing With Your Ghost.mp3',2),(124,'三块木头 - 海底.mp3',3),(125,'傲七爷 - 是想你的声音啊（DJ完整版）.mp3',1),(126,'张可可 - 不能说的夏天.mp3',1),(127,'是七叔呢 - 踏山河.mp3',1),(128,'李润祺 - 茫.mp3',1),(129,'杨陆 - 爱笑的女孩.mp3',1),(130,'王嘉尔,林俊杰 - 过.mp3',1),(131,'璐爷 - 大天蓬 (抖音版).mp3',2),(132,'范丞丞 - Can’t Slow Down.mp3',1),(133,'蓝心羽 - 阿拉斯加海湾.mp3',1),(134,'薛明媛 - 爱情派对.mp3',1),(135,'阎其儿Jill - 心恋.mp3',1),(136,'陈奕迅 - 是但求其爱.mp3',1),(137,'DJCZ,李尧音 - Guidance.mp3',1),(138,'HUAOH,OneCandy,Aou - 只对你倾心Feat.汪川（HuaoH Remix）.mp3',1),(139,'Infinite Mask - 不甘平庸.mp3',1),(140,'JINGYAN - Prypyat.mp3',1),(141,'JWoods - Outburster.mp3',1),(142,'Krbread,Miracle,TY nice - Stories.mp3',1),(143,'KUROMI - Kuromi - Fade Away.mp3',1),(144,'Rux - 魁.mp3',1),(145,'Spaceport Records,Aou,ClearYxY - Airplane Mode.mp3',1),(146,'Spaceport Records,Reggie Yang,夏璃夜 - So What.mp3',1),(147,'Spaceport Records,S70S,阳绫欣 - Craving For Love.mp3',1),(148,'The Shanghai Restoration Project - Night Odyssey.mp3',1),(149,'万花筒Artascope,UNKTIU - FHIRST.mp3',1),(150,'左卓,KUROMI - Golden Girl (Remix版).mp3',1),(151,'蛙腩 - 再靠近一点点好吗.mp3',1),(175,'AJ Tracey,Mabel - West Ten.mp3',1),(176,'AJ Tracey,MoStack - Dinner Guest (feat. MoStack).mp3',1),(177,'Billie Eilish - my future.mp3',1),(178,'DaBaby,Roddy Ricch - ROCKSTAR.mp3',1),(179,'Harry Styles - Watermelon Sugar.mp3',1),(180,'Headie One,Drake - Only You Freestyle.mp3',1),(181,'Jack Harlow,DaBaby,Lil Wayne - WHATS POPPIN (feat. DaBaby, Tory Lanez & Lil Wayne) [Remix].mp3',1),(182,'Joel Corry,MNEK - Head & Heart (feat. MNEK).mp3',1),(183,'Megan thee Stallion - Savage.mp3',1),(184,'Miranda Lambert - Bluebird.mp3',1),(185,'Nathan Dawe,KSI - Lighter (feat. KSI).mp3',1),(186,'Pop Smoke,50 Cent,Roddy Ricch - The Woo.mp3',1),(187,'Regard,Raye - Secrets.mp3',1),(188,'SAINt JHN - Roses.mp3',1),(189,'The Weeknd - Blinding Lights.mp3',1),(190,'Andy Williams - It\'s The Most Wonderful Time Of The Year.mp3',1),(191,'Band Aid - Do They Know It\'s Christmas.mp3',1),(192,'Carrie Underwood - Favorite Time Of Year.mp3',1),(193,'Chris Rea - Driving Home For Christmas.mp3',1),(194,'Elton John - Step into Christmas.mp3',1),(195,'Justin Fletcher - Rockin\' Around the Christmas Tree.mp3',1),(196,'LadBaby - Don\'t Stop Me Eatin\'.mp3',1),(197,'Leona Lewis - One More Sleep.mp3',1),(198,'Mariah Carey - All I Want For Christmas Is You.mp3',1),(199,'Michael Bublé - It\'s Beginning to Look a Lot like Christmas.mp3',1),(200,'Shakin\' Stevens - Merry Christmas Everyone.mp3',1),(201,'The Kunts - Boris Johnson Is a ＊＊＊＊ing Cunt.mp3',1),(202,'The Pogues,Kirsty MacColl - Fairytale of New York.mp3',1),(203,'The Ronettes - Sleigh Ride.mp3',1),(204,'Wham! - Last Christmas.mp3',1),(218,'24kGoldn,iann dior - Mood.mp3',1),(219,'Bad Bunny,Jhay Cortez - Dakiti.mp3',1),(220,'Bobby Helms - Jingle Bell Rock.mp3',1),(221,'Brenda Lee - Rockin\' Around The Christmas Tree.mp3',1),(222,'Burl Ives - A Holly Jolly Christmas.mp3',1),(223,'Chris Brown,Young Thug - Go Crazy.mp3',1),(224,'Dean Martin - Let It Snow, Let It Snow, Let It Snow.mp3',1),(225,'Drake,Lil Durk - Laugh Now Cry Later.mp3',1),(226,'Gabby Barrett,Charlie Puth - I Hope (feat. Charlie Puth).mp3',1),(227,'Internet Money,Gunna,Don Toliver - Lemonade.mp3',1),(228,'José Feliciano - Feliz Navidad.mp3',1),(229,'Justin Bieber,Chance the Rapper - Holy.mp3',1),(230,'Megan thee Stallion - Body.mp3',1),(231,'Nat King Cole - The Christmas Song (Merry Christmas To You).mp3',1),(232,'Pop Smoke,Lil Baby,DaBaby - For The Night.mp3',1),(233,'Doul - The Golden Path.mp3',1),(234,'Hannah Grace - 幻日.mp3',1),(235,'KOCHO - 明鏡肆水.mp3',1),(236,'RAISE A SUILEN - Sacred world.mp3',1),(237,'やなぎなぎ - Goodbye Seven Seas.mp3',1),(238,'やなぎなぎ - 君という神話.mp3',1),(239,'坂本真綾 - 独白.mp3',1),(240,'暖暖 - 许个愿吧.mp3',1),(241,'陈致逸,HOYO_MiX - Liyue 璃月.mp3',1),(242,'陈致逸,HOYO_MiX - Moon in One\'s Cup 杯中明月.mp3',1),(243,'陈致逸,HOYO_MiX - Peaceful Hike (Qingce Daytime) 山风拂萝衣 (轻策昼间).mp3',1),(244,'陈致逸,HOYO_MiX - Rapid as Wildfires 疾如猛火.mp3',1),(245,'麻枝准,やなぎなぎ - 夏凪ぎ.mp3',1),(246,'麻枝准,やなぎなぎ - 宝物になった日.mp3',1);
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_type`
--

DROP TABLE IF EXISTS `music_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music_type` (
  `tname` varchar(45) COLLATE utf8_bin NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`tname`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_type`
--

LOCK TABLES `music_type` WRITE;
/*!40000 ALTER TABLE `music_type` DISABLE KEYS */;
INSERT INTO `music_type` VALUES ('UK排行榜',190),('UK排行榜',191),('UK排行榜',192),('UK排行榜',193),('UK排行榜',194),('UK排行榜',195),('UK排行榜',196),('UK排行榜',197),('UK排行榜',198),('UK排行榜',199),('UK排行榜',200),('UK排行榜',201),('UK排行榜',202),('UK排行榜',203),('UK排行榜',204),('U音乐ACG音乐榜',233),('U音乐ACG音乐榜',234),('U音乐ACG音乐榜',235),('U音乐ACG音乐榜',236),('U音乐ACG音乐榜',237),('U音乐ACG音乐榜',238),('U音乐ACG音乐榜',239),('U音乐ACG音乐榜',240),('U音乐ACG音乐榜',241),('U音乐ACG音乐榜',242),('U音乐ACG音乐榜',243),('U音乐ACG音乐榜',244),('U音乐ACG音乐榜',245),('U音乐ACG音乐榜',246),('U音乐古典音乐榜',40),('U音乐古典音乐榜',41),('U音乐古典音乐榜',42),('U音乐古典音乐榜',43),('U音乐古典音乐榜',44),('U音乐古典音乐榜',45),('U音乐古典音乐榜',46),('U音乐国电榜',137),('U音乐国电榜',138),('U音乐国电榜',139),('U音乐国电榜',140),('U音乐国电榜',141),('U音乐国电榜',142),('U音乐国电榜',143),('U音乐国电榜',144),('U音乐国电榜',145),('U音乐国电榜',146),('U音乐国电榜',147),('U音乐国电榜',148),('U音乐国电榜',149),('U音乐国电榜',150),('U音乐国电榜',151),('U音乐电音榜',97),('U音乐电音榜',98),('U音乐电音榜',99),('U音乐电音榜',100),('U音乐电音榜',101),('U音乐电音榜',102),('U音乐电音榜',103),('U音乐电音榜',104),('U音乐电音榜',105),('U音乐电音榜',106),('U音乐电音榜',107),('U音乐电音榜',108),('U音乐电音榜',109),('U音乐说唱榜',110),('U音乐说唱榜',111),('U音乐说唱榜',112),('U音乐说唱榜',113),('U音乐说唱榜',114),('U音乐说唱榜',115),('U音乐说唱榜',116),('U音乐说唱榜',117),('U音乐说唱榜',118),('U音乐说唱榜',119),('U音乐说唱榜',120),('U音乐说唱榜',121),('U音乐韩语榜',63),('U音乐韩语榜',64),('U音乐韩语榜',65),('U音乐韩语榜',66),('U音乐韩语榜',67),('U音乐韩语榜',68),('U音乐韩语榜',69),('U音乐韩语榜',70),('U音乐韩语榜',71),('U音乐韩语榜',72),('U音乐韩语榜',73),('原创榜',1),('原创榜',2),('原创榜',6),('原创榜',7),('原创榜',8),('原创榜',9),('原创榜',11),('原创榜',14),('原创榜',15),('原创榜',18),('原创榜',20),('原创榜',22),('原创榜',23),('原创榜',25),('原创榜',26),('抖音排行榜',122),('抖音排行榜',123),('抖音排行榜',124),('抖音排行榜',125),('抖音排行榜',126),('抖音排行榜',127),('抖音排行榜',128),('抖音排行榜',129),('抖音排行榜',130),('抖音排行榜',131),('抖音排行榜',132),('抖音排行榜',133),('抖音排行榜',134),('抖音排行榜',135),('抖音排行榜',136),('新歌榜',5),('新歌榜',6),('新歌榜',8),('新歌榜',9),('新歌榜',10),('新歌榜',11),('新歌榜',13),('新歌榜',14),('新歌榜',15),('新歌榜',16),('新歌榜',18),('新歌榜',20),('新歌榜',23),('新歌榜',25),('新歌榜',28),('热歌榜',2),('热歌榜',3),('热歌榜',4),('热歌榜',5),('热歌榜',7),('热歌榜',10),('热歌榜',13),('热歌榜',14),('热歌榜',16),('热歌榜',19),('热歌榜',21),('热歌榜',23),('热歌榜',24),('热歌榜',26),('热歌榜',27),('美国Billboard榜',218),('美国Billboard榜',219),('美国Billboard榜',220),('美国Billboard榜',221),('美国Billboard榜',222),('美国Billboard榜',223),('美国Billboard榜',224),('美国Billboard榜',225),('美国Billboard榜',226),('美国Billboard榜',227),('美国Billboard榜',228),('美国Billboard榜',229),('美国Billboard榜',230),('美国Billboard榜',231),('美国Billboard榜',232),('英国Q杂志榜',175),('英国Q杂志榜',176),('英国Q杂志榜',177),('英国Q杂志榜',178),('英国Q杂志榜',179),('英国Q杂志榜',180),('英国Q杂志榜',181),('英国Q杂志榜',182),('英国Q杂志榜',183),('英国Q杂志榜',184),('英国Q杂志榜',185),('英国Q杂志榜',186),('英国Q杂志榜',187),('英国Q杂志榜',188),('英国Q杂志榜',189),('飙升榜',2),('飙升榜',3),('飙升榜',4),('飙升榜',5),('飙升榜',6),('飙升榜',9),('飙升榜',13),('飙升榜',14),('飙升榜',16),('飙升榜',17),('飙升榜',18),('飙升榜',20),('飙升榜',23),('飙升榜',25),('飙升榜',26);
/*!40000 ALTER TABLE `music_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `lname` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,1,'我喜欢的音乐'),(2,2,'我喜欢的音乐'),(3,1,'听'),(4,1,'listen'),(5,2,'听'),(6,2,'listen'),(7,1,'alt'),(8,3,'我喜欢的音乐'),(9,4,'我喜欢的音乐'),(10,1,'list'),(11,1,'my'),(12,1,'我'),(13,1,'love'),(14,1,'哎'),(15,1,'look'),(16,1,'oh'),(17,1,'哎哟不错'),(18,1,'pent'),(19,1,'dj'),(20,5,'我喜欢的音乐'),(21,5,'listen'),(22,6,'我喜欢的音乐'),(23,6,'听');
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_comment`
--

DROP TABLE IF EXISTS `playlist_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_comment` (
  `tname` varchar(45) COLLATE utf8_bin NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`tname`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_comment`
--

LOCK TABLES `playlist_comment` WRITE;
/*!40000 ALTER TABLE `playlist_comment` DISABLE KEYS */;
INSERT INTO `playlist_comment` VALUES ('新歌榜',7),('新歌榜',8),('新歌榜',9),('飙升榜',1),('飙升榜',2),('飙升榜',3),('飙升榜',4),('飙升榜',5),('飙升榜',6),('飙升榜',10),('飙升榜',11),('飙升榜',12);
/*!40000 ALTER TABLE `playlist_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_music`
--

DROP TABLE IF EXISTS `playlist_music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_music` (
  `pid` int(11) NOT NULL,
  `mid` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`pid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_music`
--

LOCK TABLES `playlist_music` WRITE;
/*!40000 ALTER TABLE `playlist_music` DISABLE KEYS */;
INSERT INTO `playlist_music` VALUES (1,'10'),(1,'2'),(1,'3'),(1,'7'),(2,'10'),(2,'14'),(2,'15'),(2,'16'),(2,'17'),(2,'18'),(2,'2'),(2,'20'),(2,'25'),(2,'9'),(3,'10'),(3,'4'),(3,'9'),(4,'13'),(4,'16'),(4,'18'),(5,'11'),(5,'13'),(5,'144'),(5,'15'),(5,'176'),(5,'180'),(5,'182'),(5,'2'),(5,'218'),(5,'219'),(5,'220'),(5,'222'),(5,'223'),(5,'224'),(5,'225'),(5,'227'),(5,'229'),(5,'231'),(5,'28'),(5,'63'),(5,'64'),(5,'9'),(20,'2'),(20,'5'),(20,'9'),(22,'2'),(22,'9');
/*!40000 ALTER TABLE `playlist_music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_bin NOT NULL,
  `password` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin'),(2,'1','1'),(3,'发giao','fagiao'),(4,'娘屁屁','npp'),(5,'汤giao','tanggiao'),(6,'宋文','sonwen');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_music'
--

--
-- Dumping routines for database 'db_music'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-02 11:50:29
