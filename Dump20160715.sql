-- MySQL dump 10.13  Distrib 5.7.13, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: flarum
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.14-MariaDB

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
-- Table structure for table `access_tokens`
--

DROP TABLE IF EXISTS `access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_tokens` (
  `id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `last_activity` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_tokens`
--

LOCK TABLES `access_tokens` WRITE;
/*!40000 ALTER TABLE `access_tokens` DISABLE KEYS */;
INSERT INTO `access_tokens` VALUES ('Cc56S6fkqolyN7xzBK9FLxnc2FKKKSgwANlASQpv',1,1468581754,1209600),('JvrkJoTHCQ54HAxVmvyVGi9LBSnJPQSqQxvArcn8',2,1468478598,1209600);
/*!40000 ALTER TABLE `access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_keys` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_keys`
--

LOCK TABLES `api_keys` WRITE;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_tokens`
--

DROP TABLE IF EXISTS `auth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_tokens`
--

LOCK TABLES `auth_tokens` WRITE;
/*!40000 ALTER TABLE `auth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussions`
--

DROP TABLE IF EXISTS `discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments_count` int(10) unsigned NOT NULL DEFAULT '0',
  `participants_count` int(10) unsigned NOT NULL DEFAULT '0',
  `number_index` int(10) unsigned NOT NULL DEFAULT '0',
  `start_time` datetime NOT NULL,
  `start_user_id` int(10) unsigned DEFAULT NULL,
  `start_post_id` int(10) unsigned DEFAULT NULL,
  `last_time` datetime DEFAULT NULL,
  `last_user_id` int(10) unsigned DEFAULT NULL,
  `last_post_id` int(10) unsigned DEFAULT NULL,
  `last_post_number` int(10) unsigned DEFAULT NULL,
  `hide_time` datetime DEFAULT NULL,
  `hide_user_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '1',
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `is_sticky` tinyint(1) NOT NULL DEFAULT '0',
  `is_article` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussions`
--

LOCK TABLES `discussions` WRITE;
/*!40000 ALTER TABLE `discussions` DISABLE KEYS */;
INSERT INTO `discussions` VALUES (2,'API使用技巧',3,1,6,'2016-06-17 06:41:49',1,3,'2016-06-17 08:03:51',1,14,5,NULL,NULL,'api',1,0,0,0),(9,'微信公众号报错：跨号支付怎么解决？',1,1,3,'2016-06-17 08:12:16',1,18,'2016-06-17 08:12:16',1,18,1,NULL,NULL,'-',1,0,1,0),(10,'Ping++ 服务器常见问题',1,1,4,'2016-06-17 08:12:38',1,19,'2016-06-17 08:12:38',1,19,1,NULL,NULL,'ping',1,0,0,0),(11,'微信内嵌浏览器如何调用支付宝手机网页支付？',1,1,1,'2016-06-17 08:12:58',1,20,'2016-06-17 08:12:58',1,20,1,NULL,NULL,'-',1,0,0,0),(12,'如何填写微信公众平台上的授权目录？',1,1,1,'2016-06-17 08:13:16',1,21,'2016-06-17 08:13:16',1,21,1,NULL,NULL,'-',1,0,0,0),(13,'charge 对于相同订单号的生成规则',1,1,3,'2016-06-17 08:13:43',1,22,'2016-06-17 08:13:43',1,22,1,NULL,NULL,'charge',1,0,0,0),(14,'什么时候需要使用 Publishable Key 呢？',1,1,18,'2016-06-17 08:14:04',1,23,'2016-06-17 08:14:04',1,23,1,NULL,NULL,'publishable-key',1,0,1,0),(15,'接入ping++',1,1,4,'2016-06-20 07:33:15',1,46,'2016-06-20 07:33:15',1,46,1,NULL,NULL,'ping',1,0,1,0),(48,'测试内容',1,1,1,'2016-07-14 10:46:02',1,94,'2016-07-14 10:46:02',1,94,1,NULL,NULL,'-',1,0,0,1);
/*!40000 ALTER TABLE `discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussions_tags`
--

DROP TABLE IF EXISTS `discussions_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussions_tags` (
  `discussion_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`discussion_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussions_tags`
--

LOCK TABLES `discussions_tags` WRITE;
/*!40000 ALTER TABLE `discussions_tags` DISABLE KEYS */;
INSERT INTO `discussions_tags` VALUES (2,2),(7,3),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,4),(48,12);
/*!40000 ALTER TABLE `discussions_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_tokens`
--

DROP TABLE IF EXISTS `email_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_tokens`
--

LOCK TABLES `email_tokens` WRITE;
/*!40000 ALTER TABLE `email_tokens` DISABLE KEYS */;
INSERT INTO `email_tokens` VALUES ('ABIa09iB9SJ8B9ZrV2iCiCRXsKrSFYsdTfyGcrAM','worby.wang@pingxx.com',3,'2016-07-14 17:37:11'),('FWJOm6nQuUqKyrf5RayKB9Yfr4w4SWjVUGTyNqJH','worby.wang@pingxx.com',3,'2016-07-14 17:37:37'),('Ki61B3S2e8yLkWGxP1qVhFcWTnFxHjhptcT6ijdN','worby.wang@pingxx.com',3,'2016-07-14 20:03:09');
/*!40000 ALTER TABLE `email_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flagrow_images`
--

DROP TABLE IF EXISTS `flagrow_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flagrow_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `file_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flagrow_images`
--

LOCK TABLES `flagrow_images` WRITE;
/*!40000 ALTER TABLE `flagrow_images` DISABLE KEYS */;
INSERT INTO `flagrow_images` VALUES (1,1,'1-iRIWynMLu7KESRt8.png','local','2016-07-14 23:05:40','http://192.168.24.43:1237/assets/images/1-iRIWynMLu7KESRt8.png',108897),(2,1,'1-OzkDDurOmGLwX5Sl.jpeg','local','2016-07-14 23:13:48','http://192.168.24.43:1237/assets/images/1-OzkDDurOmGLwX5Sl.jpeg',38959),(3,1,'1-gkjMQSAIM2nk5L4u.png','local','2016-07-14 23:14:39','http://192.168.24.43:1237/assets/images/1-gkjMQSAIM2nk5L4u.png',108897),(4,1,'1-Cg56Tc9Wipv8JuAQ.jpeg','local','2016-07-14 23:14:51','http://192.168.24.43:1237/assets/images/1-Cg56Tc9Wipv8JuAQ.jpeg',38959);
/*!40000 ALTER TABLE `flagrow_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flags`
--

DROP TABLE IF EXISTS `flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flags`
--

LOCK TABLES `flags` WRITE;
/*!40000 ALTER TABLE `flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_singular` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_plural` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Admin','Admins','#B72A2A','wrench'),(2,'Guest','Guests',NULL,NULL),(3,'Member','Members',NULL,NULL),(4,'Mod','Mods','#80349E','bolt');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentions_posts`
--

DROP TABLE IF EXISTS `mentions_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentions_posts` (
  `post_id` int(10) unsigned NOT NULL,
  `mentions_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`mentions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentions_posts`
--

LOCK TABLES `mentions_posts` WRITE;
/*!40000 ALTER TABLE `mentions_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mentions_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentions_users`
--

DROP TABLE IF EXISTS `mentions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentions_users` (
  `post_id` int(10) unsigned NOT NULL,
  `mentions_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`mentions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentions_users`
--

LOCK TABLES `mentions_users` WRITE;
/*!40000 ALTER TABLE `mentions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mentions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2015_02_24_000000_create_access_tokens_table',NULL),('2015_02_24_000000_create_api_keys_table',NULL),('2015_02_24_000000_create_config_table',NULL),('2015_02_24_000000_create_discussions_table',NULL),('2015_02_24_000000_create_email_tokens_table',NULL),('2015_02_24_000000_create_groups_table',NULL),('2015_02_24_000000_create_notifications_table',NULL),('2015_02_24_000000_create_password_tokens_table',NULL),('2015_02_24_000000_create_permissions_table',NULL),('2015_02_24_000000_create_posts_table',NULL),('2015_02_24_000000_create_users_discussions_table',NULL),('2015_02_24_000000_create_users_groups_table',NULL),('2015_02_24_000000_create_users_table',NULL),('2015_09_15_000000_create_auth_tokens_table',NULL),('2015_09_20_224327_add_hide_to_discussions',NULL),('2015_09_22_030432_rename_notification_read_time',NULL),('2015_10_07_130531_rename_config_to_settings',NULL),('2015_10_24_194000_add_ip_address_to_posts',NULL),('2015_12_05_042721_change_access_tokens_columns',NULL),('2015_12_17_194247_change_settings_value_column_to_text',NULL),('2016_02_04_095452_add_slug_to_discussions',NULL),('2015_09_21_011527_add_is_approved_to_discussions','flarum-approval'),('2015_09_21_011706_add_is_approved_to_posts','flarum-approval'),('2015_09_02_000000_add_flags_read_time_to_users_table','flarum-flags'),('2015_09_02_000000_create_flags_table','flarum-flags'),('2015_05_11_000000_create_posts_likes_table','flarum-likes'),('2015_09_04_000000_add_default_like_permissions','flarum-likes'),('2015_02_24_000000_add_locked_to_discussions','flarum-lock'),('2015_05_11_000000_create_mentions_posts_table','flarum-mentions'),('2015_05_11_000000_create_mentions_users_table','flarum-mentions'),('2015_02_24_000000_add_sticky_to_discussions','flarum-sticky'),('2015_05_11_000000_add_subscription_to_users_discussions_table','flarum-subscriptions'),('2015_05_11_000000_add_suspended_until_to_users_table','flarum-suspend'),('2015_09_14_000000_rename_suspended_until_column','flarum-suspend'),('2015_02_24_000000_create_discussions_tags_table','flarum-tags'),('2015_02_24_000000_create_tags_table','flarum-tags'),('2015_02_24_000000_create_users_tags_table','flarum-tags'),('2015_02_24_000000_set_default_settings','flarum-tags'),('2015_10_19_061223_make_slug_unique','flarum-tags'),('2016_04_11_182821__create_pages_table','sijad-pages'),('2015_10_31_040129_add_is_spam_to_posts','flarum-akismet'),('2015_09_15_000000_add_twitter_id_to_users_table','flarum-auth-twitter'),('2016_07_12_000000_add_locked_to_discussions','asyou-search'),('2016_07_12_000000_add_article','asyou-search'),('2016_07_12_000000_add_article_to_discussions','asyou-search'),('2016_07_01_102930_add_user_createfrom','go-wyvern-pingxx-account'),('2016_07_12_000000_add_article_to_tags','flarum-tags'),('2016_01_11_000000_create_flagrow_images_table','flagrow-image-upload'),('2016_01_13_000000_alter_flagrow_images_table','flagrow-image-upload');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `sender_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` int(10) unsigned DEFAULT NULL,
  `data` blob,
  `time` datetime NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` datetime NOT NULL,
  `edit_time` datetime DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'测试标题','-','2016-06-17 03:21:33','2016-06-17 03:21:54','<t><p>未达到</p></t>',1);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_tokens`
--

DROP TABLE IF EXISTS `password_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_tokens`
--

LOCK TABLES `password_tokens` WRITE;
/*!40000 ALTER TABLE `password_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `group_id` int(10) unsigned NOT NULL,
  `permission` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`group_id`,`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (2,'viewDiscussions'),(3,'discussion.likePosts'),(3,'discussion.reply'),(3,'startDiscussion'),(4,'discussion.delete'),(4,'discussion.deletePosts'),(4,'discussion.editPosts'),(4,'discussion.rename'),(4,'tag12.discussion.approvePosts'),(4,'tag12.discussion.flagPosts'),(4,'tag12.discussion.likePosts'),(4,'tag12.discussion.reply'),(4,'tag12.discussion.replyWithoutApproval'),(4,'tag12.startDiscussion'),(4,'tag12.viewDiscussions');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discussion_id` int(10) unsigned NOT NULL,
  `number` int(10) unsigned DEFAULT NULL,
  `time` datetime NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `edit_time` datetime DEFAULT NULL,
  `edit_user_id` int(10) unsigned DEFAULT NULL,
  `hide_time` datetime DEFAULT NULL,
  `hide_user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '1',
  `is_spam` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_discussion_id_number_unique` (`discussion_id`,`number`),
  FULLTEXT KEY `content` (`content`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (3,2,1,'2016-06-17 06:41:49',1,'comment','<t><p>这个时什么好玩的小标签</p></t>','2016-06-17 07:25:21',1,NULL,NULL,NULL,1,0),(8,2,2,'2016-06-17 07:13:57',1,'discussionStickied','{\"sticky\":true}',NULL,NULL,NULL,NULL,NULL,1,0),(13,2,4,'2016-06-17 08:03:36',1,'comment','<t><p>好吧 我是小白</p></t>',NULL,NULL,NULL,NULL,'192.168.24.43',1,0),(14,2,5,'2016-06-17 08:03:51',1,'comment','<t><p>这是什么</p></t>',NULL,NULL,NULL,NULL,'192.168.24.43',1,0),(16,2,6,'2016-06-17 08:10:34',1,'discussionStickied','{\"sticky\":false}',NULL,NULL,NULL,NULL,NULL,1,0),(18,9,1,'2016-06-17 08:12:16',1,'comment','<t>\n<p>报错原因：</p>\n\n<p>微信不允许在未认证的订阅号内进行微信支付。</p>\n\n\n\n<p>解决方案：</p>\n\n<p>将该订阅号进行认证即可。</p></t>',NULL,NULL,NULL,NULL,NULL,1,0),(19,10,1,'2016-06-17 08:12:38',1,'comment','<t><p>Ping++ 后台的带宽是多大，会不会影响我们支付的时间？</p></t>',NULL,NULL,NULL,NULL,NULL,1,0),(20,11,1,'2016-06-17 08:12:58',1,'comment','<t><p>微信内嵌浏览器内无法直接调用支付宝手机网页支付，需要跳转外置浏览器来完成支付宝的支付流程。</p></t>',NULL,NULL,NULL,NULL,NULL,1,0),(21,12,1,'2016-06-17 08:13:16',1,'comment','<r><p>如何填写微信公众平台上的授权目录？</p>\n\n\n\n<p>登录微信公众平台 =&gt; 微信支付 =&gt; 开发配置 =&gt; 支付授权目录 或 测试目录 以及测试白名单 正确填写；</p>\n\n<p>授权目录示例：配置你支付页面所在地址的当前目录，若我的支付页面的地址是<URL url=\"http://pingxx.com/pay/xxxxx%EF%BC%8C%E9%82%A3%E4%B9%88%E8%BF%99%E9%87%8C%E7%9A%84%E6%8E%88%E6%9D%83%E7%9B%AE%E5%BD%95%E5%B0%B1%E5%86%99http://pingxx.com/pay/%E5%8D%B3%E5%8F%AF\">http://pingxx.com/pay/xxxxx，那么这里的授权目录就写http://pingxx.com/pay/即可</URL>。</p>\n\n\n\n<p>注意：授权目录中不要出现 # ，微信方不支持。</p></r>','2016-06-20 10:01:17',1,NULL,NULL,NULL,1,0),(22,13,1,'2016-06-17 08:13:43',1,'comment','<t><p>1.非微信类渠道：</p>\n\n<p>首次请求 Ping++ 返回的 charge 对象，在接下来的 1 分钟内如果请求上来还是相同的订单信息（ 6 要素不要变更，order_no,channel,amount,subject,body,appid ） 那么 Ping++ 还是返回首次请求的 charge ;</p> \n\n<p>如果超过 1 分钟，再次请求 Ping++ 则返回全新的 charge 。</p></t>',NULL,NULL,NULL,NULL,NULL,1,0),(23,14,1,'2016-06-17 08:14:04',1,'comment','<t><p>Publishable Key 仅限于 应用内快捷支付，非应用内快捷支付请忽略 Publishable Key ，仅需使用 Secret Key 于服务端请求即可。</p></t>',NULL,NULL,NULL,NULL,NULL,1,0),(41,14,11,'2016-06-18 03:10:19',1,'discussionStickied','{\"sticky\":true}',NULL,NULL,NULL,NULL,NULL,1,0),(46,15,1,'2016-06-20 07:33:15',1,'comment','<t><p>为什么我不会接入ping++？</p></t>',NULL,NULL,NULL,NULL,NULL,1,0),(55,9,2,'2016-07-12 09:27:06',1,'discussionStickied','{\"sticky\":true}',NULL,NULL,NULL,NULL,NULL,1,0),(58,15,3,'2016-07-12 09:29:03',1,'discussionStickied','{\"sticky\":true}',NULL,NULL,NULL,NULL,NULL,1,0),(94,48,1,'2016-07-14 10:46:02',1,'comment','<t><p>这是一篇文章</p></t>',NULL,NULL,NULL,NULL,NULL,1,0);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_likes`
--

DROP TABLE IF EXISTS `posts_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_likes` (
  `post_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_likes`
--

LOCK TABLES `posts_likes` WRITE;
/*!40000 ALTER TABLE `posts_likes` DISABLE KEYS */;
INSERT INTO `posts_likes` VALUES (3,1),(13,1);
/*!40000 ALTER TABLE `posts_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('allow_post_editing','reply'),('allow_renaming','10'),('allow_sign_up','1'),('custom_less','@media (min-width: 768px) {\n    .App {\n        padding-top: 84px\n    }\n\n    .App::before {\n        height: 84px\n    }\n\n    .App-header {\n        height: 84px;\n        padding: 24px 8px\n    }\n\n    .Header-title {\n        background: url(https://www.pingxx.com/assets/img/logo-black.svg) 0 no-repeat;\n        height: 36px;\n        width: 120px\n    }\n\n    .Header-title a {\n        text-indent: 15em;\n        display: block;\n        width: 130px;\n        overflow: hidden\n    }\n\n    .App-nav {\n        top: 84px\n    }\n\n    .DiscussionPage-list {\n        top: 84px\n    }\n\n    #header-primary-custom a {\n        padding: 8px 6px;\n        font-size: 14px;\n        color: rgba(0,0,0,.6);\n    } \n}\n.item-locale{\n    display:none !important;\n}\n@media (max-width: 1099px) and (min-width: 992px), (min-width: 1100px){\n    .App-nav {box-shadow:none;border-right: 1px solid #e8ecf3;z-index: 1;}\n}\n'),('default_locale','zh'),('default_route','/all'),('extensions_enabled','[\"flarum-approval\",\"flarum-bbcode\",\"flarum-emoji\",\"flarum-english\",\"flarum-flags\",\"flarum-likes\",\"flarum-lock\",\"flarum-mentions\",\"flarum-sticky\",\"flarum-subscriptions\",\"flarum-markdown\",\"flarum-suspend\",\"asyou-search\",\"flagrow-image-upload\",\"jsthon-simplified-chinese\",\"flarum-tags\"]'),('flagrow.image-upload.availableUploadMethods','Array'),('flagrow.image-upload.mustResize','1'),('flagrow.image-upload.resizeMaxWidth','1000'),('flarum-tags.max_primary_tags','2'),('flarum-tags.max_secondary_tags','3'),('flarum-tags.min_primary_tags','0'),('flarum-tags.min_secondary_tags','0'),('forum_description',''),('forum_title','PING++'),('mail_driver','mail'),('mail_from','noreply@192.168.24.43'),('theme_colored_header','0'),('theme_dark_mode','0'),('theme_primary_color','#4D698E'),('theme_secondary_color','#4D698E'),('version','0.1.0-beta.5'),('welcome_message','This is beta software and you should not use it in production.'),('welcome_title','Welcome to PING++');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_mode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `default_sort` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `discussions_count` int(10) unsigned NOT NULL DEFAULT '0',
  `last_time` datetime DEFAULT NULL,
  `last_discussion_id` int(10) unsigned DEFAULT NULL,
  `is_article` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (2,'API','api','','#212121',NULL,NULL,0,13,NULL,0,0,9,'2016-06-17 08:14:04',14,0),(3,'DashBoard','dashboard','','#1b4a1d',NULL,NULL,NULL,NULL,NULL,0,0,0,'2016-07-13 07:43:13',20,0),(4,'SDK','sdk','','#4d698e',NULL,NULL,NULL,NULL,NULL,0,0,3,'2016-06-20 07:33:15',15,0),(5,'渠道申请','channel_apply','','#e89100',NULL,NULL,NULL,NULL,NULL,0,0,0,'2016-07-15 07:14:54',51,0),(7,'BUG','bug','','#bf0000',NULL,NULL,1,13,NULL,0,0,0,'2016-07-11 08:43:49',17,0),(8,'运营','cs','','#007484',NULL,NULL,2,13,NULL,0,0,1,'2016-07-11 08:43:49',17,0),(12,'文章类型','wenzhang','阿达的','',NULL,NULL,NULL,NULL,NULL,1,0,1,'2016-07-14 10:46:02',48,1),(13,'渠道','-','','',NULL,NULL,0,NULL,NULL,0,0,0,'2016-07-14 09:31:04',46,0);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `avatar_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferences` blob,
  `join_time` datetime DEFAULT NULL,
  `last_seen_time` datetime DEFAULT NULL,
  `read_time` datetime DEFAULT NULL,
  `notifications_read_time` datetime DEFAULT NULL,
  `discussions_count` int(10) unsigned NOT NULL DEFAULT '0',
  `comments_count` int(10) unsigned NOT NULL DEFAULT '0',
  `flags_read_time` datetime DEFAULT NULL,
  `suspend_until` datetime DEFAULT NULL,
  `twitter_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'root','test@qq.com',1,'$2y$10$iqzFj.OON4qLp07KSgM0Qus8LfF2R.haFcTWTPBykxbviAFtAOwHK','我是小白 小白的白','xfxjmr6nc6nauosm.jpg','{\"notify_discussionRenamed_alert\":true,\"notify_postLiked_alert\":true,\"notify_discussionLocked_alert\":true,\"notify_postMentioned_alert\":true,\"notify_postMentioned_email\":false,\"notify_userMentioned_alert\":true,\"notify_userMentioned_email\":false,\"notify_newPost_alert\":true,\"notify_newPost_email\":true,\"followAfterReply\":false,\"discloseOnline\":true,\"indexProfile\":true,\"locale\":\"zh\"}','2016-06-17 03:18:11','2016-07-15 11:22:34','2016-06-17 05:38:50','2016-07-14 06:01:01',9,0,'2016-06-18 07:22:38',NULL,NULL,'来自社区账号系统'),(2,'xiaobai','xiaobai@qq.com',0,'$2y$10$oN036SJlIHe.juk3U0x4A.ahnmT4tQbg.D/u5BeYgoZUUx4rhM8OW','我是小白 小白的白','xfxjmr6nc6nauosm.jpg',NULL,'2016-06-17 06:38:17','2016-07-14 06:43:18','2016-06-17 10:49:53',NULL,0,0,NULL,NULL,NULL,'来自社区账号系统'),(3,'worby','worby.wang@pingxx.com',0,'$2y$10$LIcTtpDsX09xpodi8AkEauhvvOv4FGsk659v4VWvpIGYl3vQ7DocK',NULL,NULL,NULL,'2016-07-15 01:37:11','2016-07-15 05:40:37',NULL,NULL,0,0,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_discussions`
--

DROP TABLE IF EXISTS `users_discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_discussions` (
  `user_id` int(10) unsigned NOT NULL,
  `discussion_id` int(10) unsigned NOT NULL,
  `read_time` datetime DEFAULT NULL,
  `read_number` int(10) unsigned DEFAULT NULL,
  `subscription` enum('follow','ignore') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`,`discussion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_discussions`
--

LOCK TABLES `users_discussions` WRITE;
/*!40000 ALTER TABLE `users_discussions` DISABLE KEYS */;
INSERT INTO `users_discussions` VALUES (1,2,'2016-06-18 07:27:09',6,NULL),(1,9,'2016-07-13 01:47:52',3,NULL),(1,10,'2016-06-20 02:21:07',4,NULL),(1,11,'2016-06-17 08:12:58',1,NULL),(1,12,'2016-06-17 08:13:16',1,NULL),(1,13,'2016-06-17 08:13:43',1,NULL),(1,14,'2016-07-15 06:45:17',18,NULL),(1,15,'2016-07-13 01:48:11',4,NULL),(1,48,'2016-07-14 10:46:02',1,NULL),(2,2,'2016-06-17 07:33:00',3,NULL),(2,9,'2016-07-14 05:55:06',3,NULL),(2,10,'2016-07-14 05:55:13',3,NULL),(2,14,'2016-07-14 05:55:29',14,NULL),(2,15,'2016-07-14 05:48:22',4,NULL),(3,2,'2016-06-17 07:31:40',3,NULL);
/*!40000 ALTER TABLE `users_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (1,1);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_tags`
--

DROP TABLE IF EXISTS `users_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_tags` (
  `user_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `read_time` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_tags`
--

LOCK TABLES `users_tags` WRITE;
/*!40000 ALTER TABLE `users_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-15 19:27:40
