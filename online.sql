-- MySQL dump 10.13  Distrib 5.5.56, for Win32 (AMD64)
--
-- Host: localhost    Database: online2.1
-- ------------------------------------------------------
-- Server version	5.5.56

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can add permission',3,'add_permission'),(9,'Can change permission',3,'change_permission'),(10,'Can delete permission',3,'delete_permission'),(11,'Can view group',2,'view_group'),(12,'Can view permission',3,'view_permission'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add 章节',6,'add_chapter'),(22,'Can change 章节',6,'change_chapter'),(23,'Can delete 章节',6,'delete_chapter'),(24,'Can add 视频',7,'add_video'),(25,'Can change 视频',7,'change_video'),(26,'Can delete 视频',7,'delete_video'),(27,'Can add 课程资源',8,'add_resources'),(28,'Can change 课程资源',8,'change_resources'),(29,'Can delete 课程资源',8,'delete_resources'),(30,'Can add 课程类别',9,'add_coursetab'),(31,'Can change 课程类别',9,'change_coursetab'),(32,'Can delete 课程类别',9,'delete_coursetab'),(33,'Can add 课程',10,'add_course'),(34,'Can change 课程',10,'change_course'),(35,'Can delete 课程',10,'delete_course'),(36,'Can view 章节',6,'view_chapter'),(37,'Can view 课程',10,'view_course'),(38,'Can view 课程类别',9,'view_coursetab'),(39,'Can view 课程资源',8,'view_resources'),(40,'Can view 视频',7,'view_video'),(41,'Can add 邮箱验证码',11,'add_emailverifyrecord'),(42,'Can change 邮箱验证码',11,'change_emailverifyrecord'),(43,'Can delete 邮箱验证码',11,'delete_emailverifyrecord'),(44,'Can add 用户信息',12,'add_userinfo'),(45,'Can change 用户信息',12,'change_userinfo'),(46,'Can delete 用户信息',12,'delete_userinfo'),(47,'Can add 轮播图',13,'add_banner'),(48,'Can change 轮播图',13,'change_banner'),(49,'Can delete 轮播图',13,'delete_banner'),(50,'Can view 轮播图',13,'view_banner'),(51,'Can view 邮箱验证码',11,'view_emailverifyrecord'),(52,'Can view 用户信息',12,'view_userinfo'),(53,'Can add 教学机构',14,'add_org'),(54,'Can change 教学机构',14,'change_org'),(55,'Can delete 教学机构',14,'delete_org'),(56,'Can add 讲师信息',15,'add_teacher'),(57,'Can change 讲师信息',15,'change_teacher'),(58,'Can delete 讲师信息',15,'delete_teacher'),(59,'Can add 城市信息',16,'add_city'),(60,'Can change 城市信息',16,'change_city'),(61,'Can delete 城市信息',16,'delete_city'),(62,'Can view 城市信息',16,'view_city'),(63,'Can view 教学机构',14,'view_org'),(64,'Can view 讲师信息',15,'view_teacher'),(65,'Can add 用户学习课程',17,'add_studycourse'),(66,'Can change 用户学习课程',17,'change_studycourse'),(67,'Can delete 用户学习课程',17,'delete_studycourse'),(68,'Can add 用户咨询',18,'add_userconsult'),(69,'Can change 用户咨询',18,'change_userconsult'),(70,'Can delete 用户咨询',18,'delete_userconsult'),(71,'Can add 用户收藏',19,'add_usercollection'),(72,'Can change 用户收藏',19,'change_usercollection'),(73,'Can delete 用户收藏',19,'delete_usercollection'),(74,'Can add 用户消息',20,'add_usermessage'),(75,'Can change 用户消息',20,'change_usermessage'),(76,'Can delete 用户消息',20,'delete_usermessage'),(77,'Can add 讲师的课程',21,'add_teachercourse'),(78,'Can change 讲师的课程',21,'change_teachercourse'),(79,'Can delete 讲师的课程',21,'delete_teachercourse'),(80,'Can add 用户评论',22,'add_usercomment'),(81,'Can change 用户评论',22,'change_usercomment'),(82,'Can delete 用户评论',22,'delete_usercomment'),(83,'Can view 用户学习课程',17,'view_studycourse'),(84,'Can view 讲师的课程',21,'view_teachercourse'),(85,'Can view 用户收藏',19,'view_usercollection'),(86,'Can view 用户评论',22,'view_usercomment'),(87,'Can view 用户咨询',18,'view_userconsult'),(88,'Can view 用户消息',20,'view_usermessage'),(89,'Can add User Widget',23,'add_userwidget'),(90,'Can change User Widget',23,'change_userwidget'),(91,'Can delete User Widget',23,'delete_userwidget'),(92,'Can add User Setting',24,'add_usersettings'),(93,'Can change User Setting',24,'change_usersettings'),(94,'Can delete User Setting',24,'delete_usersettings'),(95,'Can add Bookmark',25,'add_bookmark'),(96,'Can change Bookmark',25,'change_bookmark'),(97,'Can delete Bookmark',25,'delete_bookmark'),(98,'Can add log entry',26,'add_log'),(99,'Can change log entry',26,'change_log'),(100,'Can delete log entry',26,'delete_log'),(101,'Can view Bookmark',25,'view_bookmark'),(102,'Can view log entry',26,'view_log'),(103,'Can view User Setting',24,'view_usersettings'),(104,'Can view User Widget',23,'view_userwidget'),(105,'Can add captcha store',27,'add_captchastore'),(106,'Can change captcha store',27,'change_captchastore'),(107,'Can delete captcha store',27,'delete_captchastore'),(108,'Can view captcha store',27,'view_captchastore'),(109,'Can add 系统消息',28,'add_publicmessage'),(110,'Can change 系统消息',28,'change_publicmessage'),(111,'Can delete 系统消息',28,'delete_publicmessage'),(112,'Can view 系统消息',28,'view_publicmessage');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (265,'YGYH','ygyh','c6b04f45360078ce3970e7657f4d3ef9dc0857d5','2017-12-04 17:21:32'),(266,'IIMW','iimw','df5bd8dce52428d06074d53f52ba197b44420a89','2017-12-04 17:21:34'),(269,'UOBC','uobc','142ac36968e4196e82b8e11e1fc92450109bd53d','2017-12-04 17:23:01'),(270,'GKZK','gkzk','ae53b702ecdb37dcbd979cbe62c17d19b6d9183f','2017-12-04 17:24:11'),(272,'CNLI','cnli','b5045989324e851087c984fe81cab5b15245a446','2017-12-04 17:25:13'),(273,'WQUT','wqut','511c59c6e0fe5c8c887d572cfbd85afdb929feeb','2017-12-06 08:52:09'),(274,'CHYP','chyp','318ffc46fcd358afde7c151f3c267da81f6ab975','2017-12-06 08:58:14'),(275,'IWWZ','iwwz','d089fc59fd68580c6a247ec27d6e697fff9a1825','2017-12-06 09:01:03');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_chapter`
--

DROP TABLE IF EXISTS `course_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `add_time` date NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_chapter_course_id_96835b42_fk_course_course_id` (`course_id`),
  CONSTRAINT `course_chapter_course_id_96835b42_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_chapter`
--

LOCK TABLES `course_chapter` WRITE;
/*!40000 ALTER TABLE `course_chapter` DISABLE KEYS */;
INSERT INTO `course_chapter` VALUES (1,'第一章 hello world','2018-01-17',1),(2,'第二章 数据类型','2018-01-17',1),(3,'第三章 函数','2018-01-17',1);
/*!40000 ALTER TABLE `course_chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_course`
--

DROP TABLE IF EXISTS `course_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `time` int(11) NOT NULL,
  `desc` varchar(100) NOT NULL,
  `introduce` longtext NOT NULL,
  `level` int(11) NOT NULL,
  `click` int(11) NOT NULL,
  `collection_num` int(11) NOT NULL,
  `study_num` int(11) NOT NULL,
  `add_time` date NOT NULL,
  `tab_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `tips1` varchar(30),
  `tips2` varchar(30),
  `public_text` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_course_tab_id_dfddadb6_fk_course_coursetab_id` (`tab_id`),
  KEY `course_course_teacher_id_f04a37b5_fk_school_teacher_id` (`teacher_id`),
  CONSTRAINT `course_course_tab_id_dfddadb6_fk_course_coursetab_id` FOREIGN KEY (`tab_id`) REFERENCES `course_coursetab` (`id`),
  CONSTRAINT `course_course_teacher_id_f04a37b5_fk_school_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `school_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_course`
--

LOCK TABLES `course_course` WRITE;
/*!40000 ALTER TABLE `course_course` DISABLE KEYS */;
INSERT INTO `course_course` VALUES (1,'python入门','course/2018/01/540e57300001d6d906000338-240-135_9q6Yxqf.jpg',50,'python入门','<p>python入门python入门python入门</p>\r\n\r\n<hr />\r\n<ol>\r\n	<li><img alt=\"smiley\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/regular_smile.png\" style=\"height:23px; width:23px\" title=\"smiley\" /></li>\r\n	<li><img alt=\"indecision\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/whatchutalkingabout_smile.png\" style=\"height:23px; width:23px\" title=\"indecision\" />​​​​​​​​​​​​​​</li>\r\n</ol>',1,2,1,1,'2018-01-10',1,1,'认真学习','python基础','努力学习'),(2,'python进阶','course/2018/01/540e57300001d6d906000338-240-135_49uRs1H.jpg',40,'python进阶','<p>python进阶python进阶python进阶</p>',2,1,1,0,'2018-01-10',1,1,'努力学习','python进阶','努力学习'),(3,'django入门','course/2018/01/540e57300001d6d906000338-240-135_il8BpZV.jpg',45,'django入门','<h2><span style=\"background-color:#ecf0f1\">django入门django入门django入门</span></h2>\r\n\r\n<hr />\r\n<p><img alt=\"smiley\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/regular_smile.png\" style=\"height:23px; width:23px\" title=\"smiley\" /></p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>1</td>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>3</td>\r\n			<td>4</td>\r\n		</tr>\r\n		<tr>\r\n			<td>5</td>\r\n			<td>6</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>',3,3,1,1,'2018-01-10',1,2,'努力学习','django','努力学习'),(4,'mysql','course/2018/01/mysql_d3eEBFw.jpg',20,'mysqlmysql','<p>mysqlmysql</p>',1,4,1,0,'2018-01-10',2,2,'努力学习','mysql','努力学习'),(5,'django rest framwork','course/2018/01/python文件处理_jdqg4Hz.jpg',30,'django reat framwork','<p>django reat framworkdjango reat framworkdjango reat framwork<img alt=\"smiley\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/regular_smile.png\" style=\"height:23px; width:23px\" title=\"smiley\" /></p>',3,4,3,3,'2018-01-17',1,5,'daydayup','django api','gooodgoodstudy'),(6,'爬虫入门','course/2017/11/python错误和异常.jpg',50,'爬虫入门','<p>爬虫入门爬虫入门爬虫入门<img alt=\"\" src=\"/media/article_files/2017/11/25/python.jpg\" style=\"height:135px; width:240px\" /></p>',1,6,1,1,'2017-11-25',1,1,'爬虫入门','爬虫入门','爬虫入门爬虫入门'),(7,'html+css','course/2017/11/57035ff200014b8a06000338-240-135_dHfj8Nq.jpg',50,'前端入门','<p>html+csshtml+css</p>\r\n\r\n<hr />\r\n<p><img alt=\"\" src=\"/media/article_files/2017/11/25/57035ff200014b8a06000338-240-135_dhfj8nq.jpg\" style=\"height:135px; width:240px\" /></p>',1,3,0,1,'2017-11-25',3,4,'html+css','html+css','html+css'),(8,'jquery','course/python面向对象.jpg',20,'jquery','jqueryjqueryjquery',1,0,0,0,'2017-11-25',3,1,'jquery','jquery','jqueryjquery');
/*!40000 ALTER TABLE `course_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_coursetab`
--

DROP TABLE IF EXISTS `course_coursetab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_coursetab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `add_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_coursetab`
--

LOCK TABLES `course_coursetab` WRITE;
/*!40000 ALTER TABLE `course_coursetab` DISABLE KEYS */;
INSERT INTO `course_coursetab` VALUES (1,'python','2018-01-08'),(2,'数据库','2018-01-10'),(3,'前端','2017-11-25');
/*!40000 ALTER TABLE `course_coursetab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_resources`
--

DROP TABLE IF EXISTS `course_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` date NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_resources_course_id_1faea2eb_fk_course_course_id` (`course_id`),
  CONSTRAINT `course_resources_course_id_1faea2eb_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_resources`
--

LOCK TABLES `course_resources` WRITE;
/*!40000 ALTER TABLE `course_resources` DISABLE KEYS */;
INSERT INTO `course_resources` VALUES (1,'python学习资料','resources/2018/01/部署课件.rar','2018-01-17',1),(2,'django学习资料','resources/2018/01/django-simple-captcha-master.zip','2018-01-17',3);
/*!40000 ALTER TABLE `course_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_video`
--

DROP TABLE IF EXISTS `course_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `url` varchar(200) NOT NULL,
  `add_time` date NOT NULL,
  `chapter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_video_chapter_id_5b67ff6a_fk_course_chapter_id` (`chapter_id`),
  CONSTRAINT `course_video_chapter_id_5b67ff6a_fk_course_chapter_id` FOREIGN KEY (`chapter_id`) REFERENCES `course_chapter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_video`
--

LOCK TABLES `course_video` WRITE;
/*!40000 ALTER TABLE `course_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_userinfo_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(27,'captcha','captchastore'),(4,'contenttypes','contenttype'),(6,'course','chapter'),(10,'course','course'),(9,'course','coursetab'),(8,'course','resources'),(7,'course','video'),(16,'school','city'),(14,'school','org'),(15,'school','teacher'),(5,'sessions','session'),(13,'user','banner'),(11,'user','emailverifyrecord'),(12,'user','userinfo'),(28,'user_operation','publicmessage'),(17,'user_operation','studycourse'),(21,'user_operation','teachercourse'),(19,'user_operation','usercollection'),(22,'user_operation','usercomment'),(18,'user_operation','userconsult'),(20,'user_operation','usermessage'),(25,'xadmin','bookmark'),(26,'xadmin','log'),(24,'xadmin','usersettings'),(23,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-01-08 11:21:45'),(2,'contenttypes','0002_remove_content_type_name','2018-01-08 11:21:46'),(3,'auth','0001_initial','2018-01-08 11:21:50'),(4,'auth','0002_alter_permission_name_max_length','2018-01-08 11:21:50'),(5,'auth','0003_alter_user_email_max_length','2018-01-08 11:21:50'),(6,'auth','0004_alter_user_username_opts','2018-01-08 11:21:50'),(7,'auth','0005_alter_user_last_login_null','2018-01-08 11:21:50'),(8,'auth','0006_require_contenttypes_0002','2018-01-08 11:21:50'),(9,'auth','0007_alter_validators_add_error_messages','2018-01-08 11:21:50'),(10,'auth','0008_alter_user_username_max_length','2018-01-08 11:21:50'),(11,'user','0001_initial','2018-01-08 11:21:53'),(12,'admin','0001_initial','2018-01-08 11:21:55'),(13,'admin','0002_logentry_remove_auto_add','2018-01-08 11:21:55'),(14,'captcha','0001_initial','2018-01-08 11:21:56'),(15,'course','0001_initial','2018-01-08 11:21:57'),(16,'school','0001_initial','2018-01-08 11:21:59'),(17,'course','0002_auto_20180108_1121','2018-01-08 11:21:59'),(18,'sessions','0001_initial','2018-01-08 11:22:00'),(19,'user_operation','0001_initial','2018-01-08 11:22:02'),(20,'xadmin','0001_initial','2018-01-08 11:22:04'),(21,'xadmin','0002_log','2018-01-08 11:22:04'),(22,'xadmin','0003_auto_20160715_0100','2018-01-08 11:22:05'),(23,'user_operation','0002_auto_20180110_0917','2018-01-10 09:17:47'),(24,'course','0003_auto_20180116_1549','2018-01-16 15:49:51'),(25,'school','0002_auto_20180117_0957','2018-01-17 09:57:56'),(26,'course','0004_auto_20180117_1118','2018-01-17 11:18:28'),(27,'course','0005_auto_20180117_1433','2018-01-17 14:33:56'),(28,'school','0003_auto_20180117_1741','2018-01-17 17:42:00'),(29,'course','0006_auto_20180117_1741','2018-01-17 17:42:24'),(30,'user_operation','0003_auto_20180120_0922','2018-01-20 09:22:16'),(31,'course','0007_auto_20180120_0933','2018-01-20 09:33:53'),(32,'user','0002_auto_20180120_0933','2018-01-20 09:33:53'),(33,'user_operation','0004_auto_20171122_1041','2017-11-22 10:41:31'),(34,'user_operation','0005_auto_20171124_1119','2017-11-24 11:19:37'),(35,'user_operation','0006_auto_20171124_1407','2017-11-24 14:07:53');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('kyh3jq7q5fctcu399akp91xki5ac21w6','Y2NmZWZhZWRlNjBmNWE3ZDVmOWZhM2NmZGFkNDQxZDFiMWQzZjZhMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTUzNTRkYTE2NGY1ZjlmZjJjNzEzZWI0NTFjYzhlZmI3NDEzOTE0MCIsIkxJU1RfUVVFUlkiOltbImNvdXJzZSIsImNvdXJzZXRhYiJdLCIiXSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlci52aWV3cy5Vc2VyTG9naW5DaGVjayJ9','2017-12-20 09:12:38'),('lmejhrxygknhczg3thndrk5o91s8rjgw','MzY0ZGYyYTFiZmM4OWUxZGI0OWExODU4YTc2YWY4MDM0OTIxNWJlZTp7fQ==','2017-12-18 11:51:08');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_city`
--

DROP TABLE IF EXISTS `school_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_city`
--

LOCK TABLES `school_city` WRITE;
/*!40000 ALTER TABLE `school_city` DISABLE KEYS */;
INSERT INTO `school_city` VALUES (1,'北京','2018-01-08'),(2,'青岛','2018-01-08'),(3,'济南','2018-01-08'),(4,'华盛顿','2017-11-25'),(5,'伦敦','2017-11-25'),(6,'长沙','2017-11-25'),(7,'武汉','2017-11-25'),(8,'上海','2017-11-25');
/*!40000 ALTER TABLE `school_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_org`
--

DROP TABLE IF EXISTS `school_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `tab` int(11) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `introduce` longtext NOT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `click` int(11) NOT NULL,
  `collection_num` int(11) NOT NULL,
  `course_num` int(11) NOT NULL,
  `add_time` date DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `main_course_1_id` int(11) DEFAULT NULL,
  `main_course_2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_org_city_id_98e2fbae_fk_school_city_id` (`city_id`),
  KEY `school_org_main_course_1_id_0110dbf0_fk_course_course_id` (`main_course_1_id`),
  KEY `school_org_main_course_2_id_a96eff45_fk_course_course_id` (`main_course_2_id`),
  CONSTRAINT `school_org_city_id_98e2fbae_fk_school_city_id` FOREIGN KEY (`city_id`) REFERENCES `school_city` (`id`),
  CONSTRAINT `school_org_main_course_1_id_0110dbf0_fk_course_course_id` FOREIGN KEY (`main_course_1_id`) REFERENCES `course_course` (`id`),
  CONSTRAINT `school_org_main_course_2_id_a96eff45_fk_course_course_id` FOREIGN KEY (`main_course_2_id`) REFERENCES `course_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_org`
--

LOCK TABLES `school_org` WRITE;
/*!40000 ALTER TABLE `school_org` DISABLE KEYS */;
INSERT INTO `school_org` VALUES (1,'廖雪峰',3,'school/2018/01/index_17.jpg','全国知名','廖雪峰','廖雪峰',109,1,0,'2018-01-08',1,NULL,NULL),(2,'北京大学',2,'school/2018/01/bjdx.jpg','全国知名','北京大学北京大学','北京大学',2,0,0,'2018-01-08',1,NULL,NULL),(3,'清华大学',2,'school/2018/01/bjdx_MGG7BGb.jpg','全国知名','清华大学清华大学','清华大学',19,0,0,'2018-01-08',1,NULL,NULL),(4,'山东大学',2,'school/2018/01/njdx_49nZ25D.jpg','全国知名','<p><img alt=\"\" src=\"/media/article_files/2018/01/17/57a801860001c34b12000460.jpg\" style=\"height:460px; width:1200px\" />山东大学山东大学</p>','山东大学',1,0,0,'2018-01-08',3,NULL,NULL),(5,'青岛大学',2,'school/2018/01/njdx_VbDFTrW.jpg','全国知名','青岛大学青岛大学','青岛大学',44,0,0,'2018-01-08',2,NULL,NULL),(6,'慕课网',1,'school/2018/01/imooc.png','全国知名','慕课网','慕课网',1,1,0,'2018-01-08',1,NULL,NULL),(7,'黑马程序员',1,'school/2018/01/imooc_Gn1sRjp.png','全国知名','黑马程序员','黑马程序员',9,0,0,'2018-01-08',3,NULL,NULL),(8,'在线学习平台',1,'school/2018/01/57a801860001c34b12000460_z4Vb8zl_20161210233313_629.jpg','在线学习平台','<p>在线学习平台</p>','在线学习平台',9,0,0,'2018-01-17',2,NULL,NULL),(9,'耶鲁大学',2,'school/2017/11/bjdx.jpg','全国知名','<p><img alt=\"\" src=\"/media/article_files/2017/11/25/bjdx.jpg\" style=\"height:219px; width:650px\" /></p>\r\n\r\n<hr />\r\n<p><a href=\"http://www.baidu.com\">http://www.baidu.com</a></p>\r\n<div style=\'width:100px;height:100px;background-color:pink;\'></div>','耶鲁大学',1,0,0,'2017-11-25',4,1,2),(10,'剑桥大学',2,'school/2017/11/njdx.jpg','全国知名','<p>剑桥大学剑桥大学<img alt=\"\" src=\"/media/article_files/2017/11/25/njdx.jpg\" style=\"height:268px; width:268px\" /></p>','剑桥大学',1,0,0,'2017-11-25',5,7,5),(11,'东南大学',2,'school/2017/11/qhdx-logo.png','全国知名','<p>东南大学东南大学<img alt=\"\" src=\"/media/article_files/2017/11/25/njdx_LrXTuor.jpg\" style=\"border-style:solid; border-width:1px; float:left; height:400px; margin:10px; width:400px\" /></p>','东南大学',0,0,0,'2017-11-25',7,1,2),(12,'复旦大学',2,'school/2017/11/qhdx-logo_HTP9NPA.png','全国知名','<p>复旦大学复旦大学复旦大学<img alt=\"\" src=\"/media/article_files/2017/11/25/qhdx-logo.png\" style=\"height:273px; width:278px\" /></p>','复旦大学',0,0,0,'2017-11-25',8,1,2),(13,'自强学堂',3,'school/2017/11/imooc_klgAUn5.png','全国知名','<p>自强学堂自强学堂自强学堂</p>','自强学堂',0,0,0,'2017-11-25',1,3,6),(14,'w3cschool',3,'school/2017/11/njdx_9OfKwPt.jpg','全国知名','<p>w3cschoolw3cschoolw3cschool</p>','w3cschool',0,0,0,'2017-11-25',4,7,8),(15,'火星时代',1,'school/2017/11/57035ff200014b8a06000338-240-135_0nFiBSI.jpg','全国知名','<p>火星时代火星时代</p>','火星时代',0,0,0,'2017-11-25',8,NULL,NULL);
/*!40000 ALTER TABLE `school_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_teacher`
--

DROP TABLE IF EXISTS `school_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `job` varchar(50) NOT NULL,
  `worked_year` varchar(20) DEFAULT NULL,
  `pointer` varchar(100) NOT NULL,
  `collection_num` int(11) NOT NULL,
  `click` int(11) NOT NULL,
  `add_time` date NOT NULL,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_teacher_school_id_1acfb0f5_fk_school_org_id` (`school_id`),
  CONSTRAINT `school_teacher_school_id_1acfb0f5_fk_school_org_id` FOREIGN KEY (`school_id`) REFERENCES `school_org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_teacher`
--

LOCK TABLES `school_teacher` WRITE;
/*!40000 ALTER TABLE `school_teacher` DISABLE KEYS */;
INSERT INTO `school_teacher` VALUES (1,'廖雪峰','teacher/2018/01/default_middile_14_20161113173158_261.png','高级教师','1','严格',1,90,'2018-01-10',1),(2,'廖雪峰2','teacher/2018/01/default_middile_14_20161113173158_261_8L4rWTR.png','教师','1','严格',0,0,'2018-01-10',1),(3,'廖雪峰3','teacher/2018/01/default_middile_1_20161113172604_856.png','总统','1','严格',0,1,'2018-01-10',1),(4,'廖雪峰4','teacher/2018/01/default_middile_1_20161113172604_856_hWmh9nV.png','教师','1','严格',0,0,'2018-01-10',1),(5,'bobby','teacher/default_middile_2_WZ1559E.png','高级讲师','1','细心',12,13,'2018-01-17',6);
/*!40000 ALTER TABLE `school_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_banner`
--

DROP TABLE IF EXISTS `user_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_banner`
--

LOCK TABLES `user_banner` WRITE;
/*!40000 ALTER TABLE `user_banner` DISABLE KEYS */;
INSERT INTO `user_banner` VALUES (1,'1','banner/201711/57a801860001c34b12000460.jpg','http://baidu.com',1,'2017-11-25'),(2,'2','banner/201711/57a801860001c34b12000460_z4Vb8zl.jpg','http://www.baidu.com',2,'2017-11-25'),(3,'3','banner/201711/57aa86a0000145c512000460.jpg','http://www.baidu.com',3,'2017-11-25'),(4,'4','banner/201711/57aa86a0000145c512000460_GXIBATC.jpg','http://www.baidu.com',4,'2017-11-25'),(5,'5','banner/201711/57aa86a0000145c512000460_nMwvoQD.jpg','http://www.baidu.com',5,'2017-11-25');
/*!40000 ALTER TABLE `user_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_emailverifyrecord`
--

DROP TABLE IF EXISTS `user_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` int(11) NOT NULL,
  `send_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_emailverifyrecord`
--

LOCK TABLES `user_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `user_emailverifyrecord` DISABLE KEYS */;
INSERT INTO `user_emailverifyrecord` VALUES (1,'664323','1028195694@qq.com',1,'2017-12-04 11:50:27'),(2,'910598','1021111111@qq.com',1,'2017-12-04 17:20:41');
/*!40000 ALTER TABLE `user_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operation_publicmessage`
--

DROP TABLE IF EXISTS `user_operation_publicmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_operation_publicmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `add_time` datetime NOT NULL,
  `recv_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operation_publicmessage`
--

LOCK TABLES `user_operation_publicmessage` WRITE;
/*!40000 ALTER TABLE `user_operation_publicmessage` DISABLE KEYS */;
INSERT INTO `user_operation_publicmessage` VALUES (1,'欢迎注册','2017-11-24 14:17:06',0);
/*!40000 ALTER TABLE `user_operation_publicmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operation_publicmessage_has_read`
--

DROP TABLE IF EXISTS `user_operation_publicmessage_has_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_operation_publicmessage_has_read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publicmessage_id` int(11) NOT NULL,
  `userinfo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_operation_publicmes_publicmessage_id_userinf_979b92f6_uniq` (`publicmessage_id`,`userinfo_id`),
  KEY `user_operation_publi_userinfo_id_80ac1b6b_fk_user_user` (`userinfo_id`),
  CONSTRAINT `user_operation_publi_publicmessage_id_e977f5a2_fk_user_oper` FOREIGN KEY (`publicmessage_id`) REFERENCES `user_operation_publicmessage` (`id`),
  CONSTRAINT `user_operation_publi_userinfo_id_80ac1b6b_fk_user_user` FOREIGN KEY (`userinfo_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operation_publicmessage_has_read`
--

LOCK TABLES `user_operation_publicmessage_has_read` WRITE;
/*!40000 ALTER TABLE `user_operation_publicmessage_has_read` DISABLE KEYS */;
INSERT INTO `user_operation_publicmessage_has_read` VALUES (3,1,1),(2,1,2);
/*!40000 ALTER TABLE `user_operation_publicmessage_has_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operation_studycourse`
--

DROP TABLE IF EXISTS `user_operation_studycourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_operation_studycourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` date NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_study_course_id_ed19d413_fk_course_co` (`course_id`),
  KEY `user_operation_studycourse_user_id_1961b040_fk_user_userinfo_id` (`user_id`),
  CONSTRAINT `user_operation_studycourse_user_id_1961b040_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`),
  CONSTRAINT `user_operation_study_course_id_ed19d413_fk_course_co` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operation_studycourse`
--

LOCK TABLES `user_operation_studycourse` WRITE;
/*!40000 ALTER TABLE `user_operation_studycourse` DISABLE KEYS */;
INSERT INTO `user_operation_studycourse` VALUES (1,'2018-01-18',3,1),(2,'2018-01-20',1,1),(3,'2017-11-30',7,1),(4,'2017-12-06',5,1),(5,'2017-12-06',6,1);
/*!40000 ALTER TABLE `user_operation_studycourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operation_teachercourse`
--

DROP TABLE IF EXISTS `user_operation_teachercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_operation_teachercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` date NOT NULL,
  `course_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_teach_course_id_bd144a24_fk_course_co` (`course_id`),
  KEY `user_operation_teach_teacher_id_fd6e9f4d_fk_school_te` (`teacher_id`),
  CONSTRAINT `user_operation_teach_course_id_bd144a24_fk_course_co` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`),
  CONSTRAINT `user_operation_teach_teacher_id_fd6e9f4d_fk_school_te` FOREIGN KEY (`teacher_id`) REFERENCES `school_teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operation_teachercourse`
--

LOCK TABLES `user_operation_teachercourse` WRITE;
/*!40000 ALTER TABLE `user_operation_teachercourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_operation_teachercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operation_usercollection`
--

DROP TABLE IF EXISTS `user_operation_usercollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_operation_usercollection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `collet_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_userc_user_id_cd1753eb_fk_user_user` (`user_id`),
  CONSTRAINT `user_operation_userc_user_id_cd1753eb_fk_user_user` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operation_usercollection`
--

LOCK TABLES `user_operation_usercollection` WRITE;
/*!40000 ALTER TABLE `user_operation_usercollection` DISABLE KEYS */;
INSERT INTO `user_operation_usercollection` VALUES (60,'2017-11-23',1,2,3),(61,'2017-11-23',1,3,3),(62,'2017-11-23',1,4,3),(64,'2017-11-23',1,5,3),(65,'2017-11-23',1,6,1),(66,'2017-11-25',1,1,3),(67,'2017-11-30',1,6,3),(68,'2017-12-06',1,1,2),(69,'2017-12-06',1,1,1);
/*!40000 ALTER TABLE `user_operation_usercollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operation_usercomment`
--

DROP TABLE IF EXISTS `user_operation_usercomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_operation_usercomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_userc_course_id_28f68689_fk_course_co` (`course_id`),
  KEY `user_operation_usercomment_user_id_09be35d5_fk_user_userinfo_id` (`user_id`),
  CONSTRAINT `user_operation_usercomment_user_id_09be35d5_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`),
  CONSTRAINT `user_operation_userc_course_id_28f68689_fk_course_co` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operation_usercomment`
--

LOCK TABLES `user_operation_usercomment` WRITE;
/*!40000 ALTER TABLE `user_operation_usercomment` DISABLE KEYS */;
INSERT INTO `user_operation_usercomment` VALUES (1,'gggggggggggggg','2018-01-19 00:00:00',3,1),(2,'fffffffffff','2018-01-20 00:00:00',3,1),(3,'ggggg','2018-01-20 00:00:00',3,1),(4,'ggggg','2018-01-20 00:00:00',3,1),(5,'ggggg','2018-01-20 00:00:00',3,1),(6,'ggggg','2018-01-20 00:00:00',3,1),(7,'ggggg','2018-01-20 00:00:00',3,1),(8,'gggggee','2018-01-20 00:00:00',3,1),(9,'gggggee','2018-01-20 00:00:00',3,1),(10,'hhhhh','2018-01-20 09:24:01',1,1),(11,'hhhhhfffff','2018-01-20 09:24:12',1,1),(12,'你好     ','2017-11-23 11:56:02',1,1),(13,'ceshi','2017-11-23 16:25:06',1,1),(14,'ceshi2','2017-11-23 16:25:26',1,1),(15,'hhhhhhhhhhhh','2017-11-30 11:27:59',7,1),(16,'gggggggggg','2017-12-06 09:00:31',5,1),(17,'gggrr','2017-12-06 09:00:42',5,1),(18,'hhhhhhhhhhhhhhhh','2017-12-06 09:07:29',6,1);
/*!40000 ALTER TABLE `user_operation_usercomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operation_userconsult`
--

DROP TABLE IF EXISTS `user_operation_userconsult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_operation_userconsult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tell` varchar(11) NOT NULL,
  `course` varchar(100) NOT NULL,
  `add_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operation_userconsult`
--

LOCK TABLES `user_operation_userconsult` WRITE;
/*!40000 ALTER TABLE `user_operation_userconsult` DISABLE KEYS */;
INSERT INTO `user_operation_userconsult` VALUES (1,'ddd','15153321583','ssss','2018-01-10'),(2,'ddd','15153321583','1111','2018-01-10'),(3,'ddd','15153321583','1111','2018-01-10'),(4,'ddd','15153321583','1111','2018-01-10'),(5,'dddd','111111111','dddd','2018-01-10'),(6,'dddd','111111111','dddd','2018-01-10'),(7,'fff','1111111111','dddd','2018-01-10'),(8,'fff','1111111111','dddd','2018-01-10'),(9,'fff','1111111111','dddd','2018-01-10'),(10,'fff','1111111111','dddd','2018-01-10'),(11,'fff','1111111111','dddd','2018-01-10'),(12,'fff','1111111111','dddd','2018-01-10'),(13,'fff','1111111111','dddd','2018-01-10'),(14,'fff','1111111111','dddd','2018-01-10'),(15,'fff','1111111111','dddd','2018-01-10'),(16,'fff','1111111111','dddd','2018-01-10'),(17,'fff','1111111111','dddd','2018-01-10'),(18,'fff','1111111111','dddd','2018-01-10'),(19,'fff','1111111111','dddd','2018-01-10'),(20,'fff','1111111111','dddd','2018-01-10'),(21,'fff','1111111111','dddd','2018-01-10'),(22,'fff','1111111111','dddd','2018-01-10'),(23,'fff','1111111111','dddd','2018-01-10'),(24,'fff','1111111111','dddd','2018-01-10'),(25,'fff','1111111111','dddd','2018-01-10'),(26,'fff','1111111111','dddd','2018-01-10'),(27,'fff','1111111111','dddd','2018-01-10'),(28,'fff','1111111111','dddd','2018-01-10'),(29,'fff','1111111111','dddd','2018-01-10'),(30,'fff','1111111111','dddd','2018-01-10'),(31,'fff','1111111111','dddd','2018-01-10'),(32,'fff','1111111111','dddd','2018-01-10'),(33,'fff','1111111111','dddd','2018-01-10'),(34,'ddd','1111111','aaa','2018-01-10'),(35,'ddd','1111111','aaa','2018-01-10'),(36,'ddd','1111111','aaa','2018-01-10'),(37,'ddd','1111111','aaa','2018-01-10'),(38,'ddd','1111111','aaa','2018-01-10'),(39,'ddd','1111111','aaa','2018-01-10'),(40,'ddd','11111','ddd','2018-01-10'),(41,'ddd','1111111','fff','2018-01-10'),(42,'ddd','111111111','ggg','2018-01-10'),(43,'ddd','111111111','ggg','2018-01-10'),(44,'ddd','111111111','ggg','2018-01-10'),(45,'ddd','111111111','ggg','2018-01-10'),(46,'ddd','111111111','ggg','2018-01-10'),(47,'ddd','111111111','ggg','2018-01-10'),(48,'ddd','111111111','ggg','2018-01-10'),(49,'ssssss','11111','dddd','2018-01-10'),(50,'ssssss','11111','dddd','2018-01-10'),(51,'ssssss','11111','dddd','2018-01-10'),(52,'ddd','1111111','fffff','2018-01-10'),(53,'ddd','11111','fff','2018-01-10'),(54,'sdsfds','111111111','sfdfg','2017-11-25'),(55,'sdsfds','111111111','sfdfg','2017-11-25');
/*!40000 ALTER TABLE `user_operation_userconsult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operation_usermessage`
--

DROP TABLE IF EXISTS `user_operation_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime NOT NULL,
  `recv_user_id` int(11) NOT NULL,
  `send_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_userm_recv_user_id_f45f3c25_fk_user_user` (`recv_user_id`),
  KEY `user_operation_userm_send_user_id_1dca14d2_fk_user_user` (`send_user_id`),
  CONSTRAINT `user_operation_userm_recv_user_id_f45f3c25_fk_user_user` FOREIGN KEY (`recv_user_id`) REFERENCES `user_userinfo` (`id`),
  CONSTRAINT `user_operation_userm_send_user_id_1dca14d2_fk_user_user` FOREIGN KEY (`send_user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operation_usermessage`
--

LOCK TABLES `user_operation_usermessage` WRITE;
/*!40000 ALTER TABLE `user_operation_usermessage` DISABLE KEYS */;
INSERT INTO `user_operation_usermessage` VALUES (3,'你好',1,'2017-11-24 14:18:52',1,2);
/*!40000 ALTER TABLE `user_operation_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userinfo`
--

DROP TABLE IF EXISTS `user_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `tell` varchar(11) NOT NULL,
  `pic` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userinfo`
--

LOCK TABLES `user_userinfo` WRITE;
/*!40000 ALTER TABLE `user_userinfo` DISABLE KEYS */;
INSERT INTO `user_userinfo` VALUES (1,'pbkdf2_sha256$36000$S4R9hMFASANa$LuR925swfJRh4fuyAkYBC3ISdIQ0yIW6Ise/BLxgve8=','2017-12-06 08:59:33',1,'dfvbdf','','','',1,1,'2018-01-17 17:36:00','butterfly','1994-12-24',1,'山东省','123456789','user_head_pic/2018/01/default_big_14.png'),(2,'pbkdf2_sha256$36000$t2gVYLwn5UKj$TWoiJVl/kh8TpX2gUrEAVQMmryiStPAsotfOF5qh3w0=',NULL,0,'butterfly','','','',0,1,'2018-01-18 08:50:27','',NULL,1,'','','user_head_pic/default_middile_2.png'),(3,'pbkdf2_sha256$36000$cyTgsc7JkkUL$D70A7DSNkG8Ote8JvSFPQ9ADjCDzBMoWUD5XGIshXZI=',NULL,0,'syx','','','',0,1,'2017-11-24 16:54:00','butterfly',NULL,1,'山东省淄博市','123456789','user_head_pic/2017/11/default_big_14.png'),(4,'pbkdf2_sha256$36000$XmDohvasBWo9$XeyEtr2DyDAkjj+03GQ0Hiq5O4v/yxJHl3HYf6pV0/E=','2017-12-04 11:53:22',0,'dfvbdf11','','','1028195694@qq.com',0,0,'2017-12-04 11:50:27','',NULL,1,'','','user_head_pic/default_middile_2.png'),(5,'pbkdf2_sha256$36000$LTr5BPz1mNwK$pWsiFLb/KX0pKyMQkeR0K7gvyWFfK7+YtGbBbu69S7w=',NULL,0,'dfvbdf19','','','1021111111@qq.com',0,0,'2017-12-04 17:20:40','',NULL,1,'','','user_head_pic/default_middile_2.png');
/*!40000 ALTER TABLE `user_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userinfo_groups`
--

DROP TABLE IF EXISTS `user_userinfo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userinfo_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_userinfo_groups_userinfo_id_group_id_427ab23f_uniq` (`userinfo_id`,`group_id`),
  KEY `user_userinfo_groups_group_id_660e8d76_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_userinfo_groups_group_id_660e8d76_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_userinfo_groups_userinfo_id_80ed863e_fk_user_userinfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userinfo_groups`
--

LOCK TABLES `user_userinfo_groups` WRITE;
/*!40000 ALTER TABLE `user_userinfo_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_userinfo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userinfo_user_permissions`
--

DROP TABLE IF EXISTS `user_userinfo_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userinfo_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_userinfo_user_permi_userinfo_id_permission_i_8245f325_uniq` (`userinfo_id`,`permission_id`),
  KEY `user_userinfo_user_p_permission_id_a994ee6a_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_userinfo_user_p_permission_id_a994ee6a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_userinfo_user_p_userinfo_id_76f2e887_fk_user_user` FOREIGN KEY (`userinfo_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userinfo_user_permissions`
--

LOCK TABLES `user_userinfo_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_userinfo_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_userinfo_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_user_userinfo_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_user_userinfo_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2018-01-08 11:24:48','127.0.0.1','1','python','create','已添加。',9,1),(2,'2018-01-08 11:25:32','127.0.0.1','1','北京','create','已添加。',16,1),(3,'2018-01-08 11:25:58','127.0.0.1','1','廖雪峰','create','已添加。',14,1),(4,'2018-01-08 11:28:06','127.0.0.1','1','廖雪峰','change','修改 pic',14,1),(5,'2018-01-08 11:28:20','127.0.0.1','1','廖雪峰','change','修改 pic',14,1),(6,'2018-01-08 11:28:36','127.0.0.1','1','廖雪峰','change','修改 pic',14,1),(7,'2018-01-08 11:29:07','127.0.0.1','1','廖雪峰','change','修改 pic',14,1),(8,'2018-01-08 11:32:32','127.0.0.1','1','廖雪峰','change','修改 pic',14,1),(9,'2018-01-08 11:50:14','127.0.0.1','1','廖雪峰','change','修改 pic',14,1),(10,'2018-01-08 11:52:41','127.0.0.1','2','青岛','create','已添加。',16,1),(11,'2018-01-08 11:52:45','127.0.0.1','3','济南','create','已添加。',16,1),(12,'2018-01-08 11:54:40','127.0.0.1','2','北京大学','create','已添加。',14,1),(13,'2018-01-08 11:54:57','127.0.0.1','3','清华大学','create','已添加。',14,1),(14,'2018-01-08 11:55:14','127.0.0.1','4','山东大学','create','已添加。',14,1),(15,'2018-01-08 13:49:21','127.0.0.1','5','青岛大学','create','已添加。',14,1),(16,'2018-01-08 13:50:29','127.0.0.1','6','慕课网','create','已添加。',14,1),(17,'2018-01-08 13:50:51','127.0.0.1','7','黑马程序员','create','已添加。',14,1),(18,'2018-01-10 14:51:14','127.0.0.1','1','廖雪峰','create','已添加。',15,1),(19,'2018-01-10 14:51:36','127.0.0.1','2','廖雪峰2','create','已添加。',15,1),(20,'2018-01-10 14:51:53','127.0.0.1','3','廖雪峰3','create','已添加。',15,1),(21,'2018-01-10 14:52:12','127.0.0.1','4','廖雪峰4','create','已添加。',15,1),(22,'2018-01-10 14:53:07','127.0.0.1','1','python入门','create','已添加。',10,1),(23,'2018-01-10 14:53:36','127.0.0.1','2','python进阶','create','已添加。',10,1),(24,'2018-01-10 14:54:00','127.0.0.1','3','django入门','create','已添加。',10,1),(25,'2018-01-10 14:54:42','127.0.0.1','2','数据库','create','已添加。',9,1),(26,'2018-01-10 14:54:50','127.0.0.1','4','mysql','create','已添加。',10,1),(27,'2018-01-17 10:51:59','127.0.0.1','3','django入门','change','修改 teacher，pic 和 introduce',10,1),(28,'2018-01-17 10:52:40','127.0.0.1','1','python入门','change','修改 pic，introduce，tips1 和 tips2',10,1),(29,'2018-01-17 11:00:56','127.0.0.1','8','在线学习平台','create','已添加。',14,1),(30,'2018-01-17 11:20:26','127.0.0.1','4','mysql','change','修改 pic，introduce，public_text，tips1 和 tips2',10,1),(31,'2018-01-17 11:20:53','127.0.0.1','1','python入门','change','修改 pic 和 public_text',10,1),(32,'2018-01-17 11:21:20','127.0.0.1','2','python进阶','change','修改 pic，introduce，public_text，tips1 和 tips2',10,1),(33,'2018-01-17 11:21:38','127.0.0.1','3','django入门','change','修改 pic，public_text，tips1 和 tips2',10,1),(34,'2018-01-17 14:05:04','127.0.0.1','1','学习资料','create','已添加。',8,1),(35,'2018-01-17 14:06:10','127.0.0.1','1','第一章 hello world','create','已添加。',6,1),(36,'2018-01-17 14:06:25','127.0.0.1','2','第二章 数据类型','create','已添加。',6,1),(37,'2018-01-17 14:06:36','127.0.0.1','3','第三章 函数','create','已添加。',6,1),(38,'2018-01-17 14:40:05','127.0.0.1','2','学习资料','create','已添加。',8,1),(39,'2018-01-17 14:40:23','127.0.0.1','2','dajngo学习资料','change','修改 name',8,1),(40,'2018-01-17 14:40:30','127.0.0.1','1','python学习资料','change','修改 name',8,1),(41,'2018-01-17 14:41:49','127.0.0.1','2','django学习资料','change','修改 name',8,1),(42,'2018-01-17 16:02:13','127.0.0.1','3','django入门','change','修改 pic 和 introduce',10,1),(43,'2018-01-17 16:02:53','127.0.0.1','1','python入门','change','修改 pic 和 introduce',10,1),(44,'2018-01-17 16:55:58','127.0.0.1','5','bobby','create','已添加。',15,1),(45,'2018-01-17 16:58:17','127.0.0.1','5','django reat framwork','create','已添加。',10,1),(46,'2018-01-17 17:04:12','127.0.0.1','5','django rest framwork','change','修改 name 和 pic',10,1),(47,'2018-01-17 17:36:30','127.0.0.1','1','dfvbdf','change','修改 last_login，date_joined，nickname，birthday，address，tell 和 pic',12,1),(48,'2018-01-17 17:46:01','127.0.0.1','4','山东大学','change','修改 pic 和 introduce',14,1),(49,'2018-01-18 08:50:27','127.0.0.1','2','butterfly','create','已添加。',12,1),(50,'2017-11-23 16:58:14','127.0.0.1','1','UserMessage object','create','已添加。',20,1),(51,'2017-11-23 17:17:44','127.0.0.1','2','UserMessage object','create','已添加。',20,1),(52,'2017-11-24 11:10:34','127.0.0.1',NULL,'','delete','批量删除 2 个 用户消息',NULL,1),(53,'2017-11-24 14:17:06','127.0.0.1','1','PublicMessage object','create','已添加。',28,1),(54,'2017-11-24 14:18:52','127.0.0.1','3','UserMessage object','create','已添加。',20,1),(55,'2017-11-24 14:22:14','127.0.0.1','1','PublicMessage object','change','修改 has_read',28,1),(56,'2017-11-25 09:24:00','127.0.0.1','1','Banner object','create','已添加。',13,1),(57,'2017-11-25 09:25:20','127.0.0.1','2','Banner object','create','已添加。',13,1),(58,'2017-11-25 09:25:30','127.0.0.1','3','Banner object','create','已添加。',13,1),(59,'2017-11-25 09:25:41','127.0.0.1','4','Banner object','create','已添加。',13,1),(60,'2017-11-25 09:25:50','127.0.0.1','5','Banner object','create','已添加。',13,1),(61,'2017-11-25 10:41:23','127.0.0.1','6','爬虫入门','create','已添加。',10,1),(62,'2017-11-25 10:42:05','127.0.0.1','3','前端','create','已添加。',9,1),(63,'2017-11-25 10:42:44','127.0.0.1','7','html+css','create','已添加。',10,1),(64,'2017-11-25 10:46:07','127.0.0.1','4','华盛顿','create','已添加。',16,1),(65,'2017-11-25 10:46:35','127.0.0.1','9','耶鲁大学','create','已添加。',14,1),(66,'2017-11-25 10:47:27','127.0.0.1','5','伦敦','create','已添加。',16,1),(67,'2017-11-25 10:47:35','127.0.0.1','10','剑桥大学','create','已添加。',14,1),(68,'2017-11-25 10:48:47','127.0.0.1','6','长沙','create','已添加。',16,1),(69,'2017-11-25 10:48:57','127.0.0.1','7','武汉','create','已添加。',16,1),(70,'2017-11-25 10:49:05','127.0.0.1','11','东南大学','create','已添加。',14,1),(71,'2017-11-25 10:49:51','127.0.0.1','8','上海','create','已添加。',16,1),(72,'2017-11-25 10:49:57','127.0.0.1','12','复旦大学','create','已添加。',14,1),(73,'2017-11-25 10:54:29','127.0.0.1','13','自强学堂','create','已添加。',14,1),(74,'2017-11-25 10:56:20','127.0.0.1','8','jquery','create','已添加。',10,1),(75,'2017-11-25 10:56:24','127.0.0.1','14','w3cschool','create','已添加。',14,1),(76,'2017-11-25 10:57:40','127.0.0.1','15','火星时代','create','已添加。',14,1),(77,'2017-11-25 11:08:31','127.0.0.1','3','syx','change','修改 username 和 pic',12,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_user_userinfo_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','2,4',1),(2,'site-theme','https://bootswatch.com/3/cerulean/bootstrap.min.css',1);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_user_userinfo_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
INSERT INTO `xadmin_userwidget` VALUES (2,'home','html','{\"content\": \"<h1>Hello Xadmin</h1>\", \"title\": \"hello xadmin\"}',1),(4,'home','chart','{\"title\": \"course\", \"model\": \"course.course\"}',1);
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-08 13:56:57
