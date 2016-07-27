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
INSERT INTO `access_tokens` VALUES ('35TFFP4IwC1rNsIotnzq9DBZ9sevs5nVgARsSCnM',18,1469079761,1209600),('7dsrMhowdgcbivuDjtzSImosefgMLdumz7ZAl0pw',22,1469081413,1209600),('96ylPEK5DKN8NEyBrcf8h6q6d0xmbvd3vsxp0Kvu',16,1469079512,1209600),('p8VQA0obBYg1hbZNSw7HwSMMlVEeWRXFZatZpuJz',19,1469077801,1209600),('qfTGs5m3ydWubJgv3NoBBYVUMgxwg657C3MibM8T',21,1469081187,1209600),('QnIeJQ4JlErEZfvERkwcA9U6xIGoxrWAvnu0XIrp',23,1469080562,1209600),('S1zOiUtMlRQ6dcsaDh3PdEDIO2VQuXz2NR0vTWPm',17,1469080249,1209600),('T6hucqa6tO4IJw8807DzBBewTj8JWoKtMmy7qYXU',15,1469586922,1209600);
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
  `best_id` tinyint(1) DEFAULT NULL,
  `praise_count` int(10) unsigned NOT NULL DEFAULT '0',
  `questions_count` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussions`
--

LOCK TABLES `discussions` WRITE;
/*!40000 ALTER TABLE `discussions` DISABLE KEYS */;
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
INSERT INTO `discussions_tags` VALUES (77,52),(78,32),(78,34),(79,2),(79,13),(80,47),(80,49),(83,2),(83,13),(84,32),(84,36),(84,37),(84,38),(84,39),(85,32),(85,36),(85,37),(85,38),(85,39),(87,51),(91,3),(91,5),(91,13),(91,49),(92,13),(92,57),(93,4),(93,5),(94,2),(94,13),(95,2),(95,13),(96,51),(97,51),(100,47),(101,2),(101,13),(102,51),(103,4),(103,5),(104,52),(104,53),(106,52),(106,53),(107,54),(108,4),(108,5),(109,3),(109,5),(110,49),(111,48),(112,52),(113,4),(113,5),(114,51),(118,32),(118,35),(120,51),(122,51),(123,4),(123,5),(124,2),(124,13),(125,48),(126,32),(126,34),(126,35),(126,36);
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
/*!40000 ALTER TABLE `email_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` int(10) unsigned NOT NULL,
  `user_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_mail` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flagrow_images`
--

LOCK TABLES `flagrow_images` WRITE;
/*!40000 ALTER TABLE `flagrow_images` DISABLE KEYS */;
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
INSERT INTO `groups` VALUES (1,'管理员','管理员','#B72A2A','wrench'),(2,'Guest','Guests',NULL,NULL),(3,'Member','Members',NULL,NULL),(4,'Mod','Mods','#80349E','bolt');
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
INSERT INTO `mentions_posts` VALUES (159,157),(160,159),(167,166),(171,163),(181,177),(183,181),(228,197),(232,209),(237,196),(238,196),(240,235),(241,234),(244,243),(247,236),(248,231),(248,243),(248,244),(248,245),(249,248),(265,259),(275,272),(276,237),(314,311);
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
INSERT INTO `migrations` VALUES ('2015_02_24_000000_create_access_tokens_table',NULL),('2015_02_24_000000_create_api_keys_table',NULL),('2015_02_24_000000_create_config_table',NULL),('2015_02_24_000000_create_discussions_table',NULL),('2015_02_24_000000_create_email_tokens_table',NULL),('2015_02_24_000000_create_groups_table',NULL),('2015_02_24_000000_create_notifications_table',NULL),('2015_02_24_000000_create_password_tokens_table',NULL),('2015_02_24_000000_create_permissions_table',NULL),('2015_02_24_000000_create_posts_table',NULL),('2015_02_24_000000_create_users_discussions_table',NULL),('2015_02_24_000000_create_users_groups_table',NULL),('2015_02_24_000000_create_users_table',NULL),('2015_09_15_000000_create_auth_tokens_table',NULL),('2015_09_20_224327_add_hide_to_discussions',NULL),('2015_09_22_030432_rename_notification_read_time',NULL),('2015_10_07_130531_rename_config_to_settings',NULL),('2015_10_24_194000_add_ip_address_to_posts',NULL),('2015_12_05_042721_change_access_tokens_columns',NULL),('2015_12_17_194247_change_settings_value_column_to_text',NULL),('2016_02_04_095452_add_slug_to_discussions',NULL),('2015_09_21_011527_add_is_approved_to_discussions','flarum-approval'),('2015_09_21_011706_add_is_approved_to_posts','flarum-approval'),('2015_09_02_000000_add_flags_read_time_to_users_table','flarum-flags'),('2015_09_02_000000_create_flags_table','flarum-flags'),('2015_05_11_000000_create_posts_likes_table','flarum-likes'),('2015_09_04_000000_add_default_like_permissions','flarum-likes'),('2015_02_24_000000_add_locked_to_discussions','flarum-lock'),('2015_05_11_000000_create_mentions_posts_table','flarum-mentions'),('2015_05_11_000000_create_mentions_users_table','flarum-mentions'),('2015_02_24_000000_add_sticky_to_discussions','flarum-sticky'),('2015_05_11_000000_add_subscription_to_users_discussions_table','flarum-subscriptions'),('2015_05_11_000000_add_suspended_until_to_users_table','flarum-suspend'),('2015_09_14_000000_rename_suspended_until_column','flarum-suspend'),('2015_02_24_000000_create_discussions_tags_table','flarum-tags'),('2015_02_24_000000_create_tags_table','flarum-tags'),('2015_02_24_000000_create_users_tags_table','flarum-tags'),('2015_02_24_000000_set_default_settings','flarum-tags'),('2015_10_19_061223_make_slug_unique','flarum-tags'),('2016_04_11_182821__create_pages_table','sijad-pages'),('2015_10_31_040129_add_is_spam_to_posts','flarum-akismet'),('2015_09_15_000000_add_twitter_id_to_users_table','flarum-auth-twitter'),('2016_07_12_000000_add_locked_to_discussions','asyou-search'),('2016_07_12_000000_add_article','asyou-search'),('2016_07_12_000000_add_article_to_discussions','asyou-search'),('2016_07_01_102930_add_user_createfrom','go-wyvern-pingxx-account'),('2016_07_12_000000_add_article_to_tags','flarum-tags'),('2016_01_11_000000_create_flagrow_images_table','flagrow-image-upload'),('2016_01_13_000000_alter_flagrow_images_table','flagrow-image-upload'),('2016_07_17_000000_add_best_to_descussions','flarum-tags'),('2016_07_18_000000_add_isStart','flarum-tags'),('2016_07_18_000001_add_isStart','flarum-tags'),('2016_07_17_000000_add_isbest_to_posts','flarum-tags'),('2016_07_17_000000_add_is_best_to_posts','flarum-tags'),('2016_07_18_000000_add_best_id_to_discussions','flarum-tags'),('2016_07_18_000001_create_feedbak','flarum-tags'),('2016_07_19_000001_create_feedbak','flarum-tags'),('2016_07_17_155140_add_user_count','go-wyvern-pingxx-account'),('2016_07_17_165140_add_user_counts','go-wyvern-pingxx-account'),('2016_07_18_200000_add_discuss','go-wyvern-pingxx-account'),('2016_07_20_090000_add_same_question','go-wyvern-pingxx-account'),('2016_07_23_171200_add_some_quest','go-wyvern-pingxx-account');
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,1,4,'postLiked',NULL,46,NULL,'2016-07-18 03:12:06',1,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
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
INSERT INTO `permissions` VALUES (2,'tag51.viewDiscussions'),(2,'tag52.viewDiscussions'),(2,'tag53.viewDiscussions'),(2,'tag54.viewDiscussions'),(2,'viewDiscussions'),(3,'discussion.flagPosts'),(3,'discussion.likePosts'),(3,'discussion.reply'),(3,'discussion.replyWithoutApproval'),(3,'flagrow.image.upload'),(3,'startDiscussion'),(3,'tag51.discussion.approvePosts'),(3,'tag51.discussion.delete'),(3,'tag51.discussion.flagPosts'),(3,'tag51.discussion.hide'),(3,'tag51.discussion.likePosts'),(3,'tag51.discussion.reply'),(3,'tag51.startDiscussion'),(3,'tag52.discussion.likePosts'),(3,'tag52.discussion.reply'),(3,'tag52.discussion.replyWithoutApproval'),(3,'tag53.discussion.likePosts'),(3,'tag53.discussion.reply'),(3,'tag53.discussion.replyWithoutApproval'),(3,'tag54.discussion.likePosts'),(3,'tag54.discussion.reply'),(3,'tag54.discussion.replyWithoutApproval'),(4,'discussion.delete'),(4,'discussion.deletePosts'),(4,'discussion.editPosts'),(4,'discussion.rename');
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
  `is_start` tinyint(1) NOT NULL DEFAULT '0',
  `is_best` tinyint(1) NOT NULL DEFAULT '0',
  `best_id` int(11) NOT NULL DEFAULT '0',
  `agree_count` int(10) unsigned NOT NULL DEFAULT '0',
  `praise_count` int(10) unsigned DEFAULT NULL,
  `same_question_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_discussion_id_number_unique` (`discussion_id`,`number`),
  FULLTEXT KEY `content` (`content`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
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
INSERT INTO `settings` VALUES ('allow_post_editing','reply'),('allow_renaming','10'),('allow_sign_up','1'),('custom_less','@media (min-width: 768px) {\n    .App {\n        padding-top: 84px\n    }\n\n    .App::before {\n        height: 84px\n    }\n\n    .App-header {\n        height: 84px;\n        padding: 24px 8px\n    }\n\n    .Header-title {\n        background: url(https://www.pingxx.com/assets/img/logo-black.svg) 0 no-repeat;\n        height: 36px;\n        width: 120px\n    }\n\n    .Header-title a {\n        text-indent: 15em;\n        display: block;\n        width: 130px;\n        height: 36px;\n        overflow: hidden\n    }\n\n    .App-nav {\n        top: 84px\n    }\n\n    .DiscussionPage-list {\n        top: 84px\n    }\n\n    #header-primary-custom a {\n        padding: 8px 6px;\n        font-size: 14px;\n        color: rgba(0,0,0,.6);\n    } \n}\n.item-locale{\n    display:none !important;\n}\n@media (max-width: 1099px) and (min-width: 992px), (min-width: 1100px){\n    .App-nav {box-shadow:none;border-right: 1px solid #e8ecf3;z-index: 1;}\n}\n\n@media (min-width: 992px){\n.IndexPage-nav .item-newArticle .Button {\n    display: block;\n    width: 100%;\n    overflow: hidden;\n    text-overflow: ellipsis;\n}\n}\n\n'),('default_locale','zh'),('default_route','/all'),('extensions_enabled','[\"flarum-approval\",\"flarum-bbcode\",\"flarum-emoji\",\"flarum-flags\",\"flarum-likes\",\"flarum-lock\",\"flarum-mentions\",\"flarum-sticky\",\"flarum-subscriptions\",\"flarum-markdown\",\"flarum-suspend\",\"flarum-tags\",\"asyou-search\",\"jsthon-simplified-chinese\",\"go-wyvern-pingxx-account\",\"flagrow-image-upload\"]'),('flagrow.image-upload.availableUploadMethods','Array'),('flagrow.image-upload.maxFileSize','2048'),('flagrow.image-upload.mustResize','0'),('flagrow.image-upload.resizeMaxHeight','1000'),('flagrow.image-upload.resizeMaxWidth','1000'),('flarum-tags.max_primary_tags','2'),('flarum-tags.max_secondary_tags','8'),('flarum-tags.min_primary_tags','0'),('flarum-tags.min_secondary_tags','1'),('forum_description',''),('forum_title','Ping++社区'),('mail_driver','smtp'),('mail_encryption','ssl'),('mail_from','code@jxspy.com'),('mail_host','smtp.exmail.qq.com'),('mail_password','Jx2015'),('mail_port','465'),('mail_username','code@jxspy.com'),('theme_colored_header','0'),('theme_dark_mode','0'),('theme_primary_color','#111'),('theme_secondary_color','#dadada'),('version','0.1.0-beta.5'),('welcome_message','来呀，躁起来吧，咱都是一群乐于助人的技术牛，哞～哞～'),('welcome_title','恭喜你找到组织');
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
  `questions_count` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (2,'支付宝','alipay','','#212121',NULL,NULL,0,13,NULL,0,0,0,'2016-07-26 10:37:26',124,0,5),(3,'iOS','ios','','#1b4a1d',NULL,NULL,1,5,NULL,0,0,0,'2016-07-26 03:06:13',109,0,2),(4,'Android','android','','#4d698e',NULL,NULL,0,5,NULL,0,0,0,'2016-07-26 10:36:40',123,0,5),(5,'平台相关','platform','','#e89100',NULL,NULL,0,NULL,NULL,0,0,0,'2016-07-26 10:36:40',123,0,7),(7,'微信支付','wx','','#bf0000',NULL,NULL,1,13,NULL,0,0,0,'2016-07-19 06:46:15',66,0,0),(8,'银联支付','upacp','','#007484',NULL,NULL,2,13,NULL,0,0,0,'2016-07-18 08:02:22',56,0,0),(13,'渠道相关','-','','#8C8C8C',NULL,NULL,2,NULL,NULL,0,0,0,'2016-07-26 10:37:26',124,0,7),(31,'H5','h5','','#5F9EA0',NULL,NULL,2,5,NULL,0,0,0,'2016-07-20 08:55:09',69,0,0),(32,'语言相关','language','','',NULL,NULL,1,NULL,NULL,0,0,0,'2016-07-27 01:40:28',126,0,5),(34,'PHP','php','','#71C671',NULL,NULL,1,32,NULL,0,0,0,'2016-07-27 01:40:28',126,0,2),(35,'Java','java','','#CD96CD',NULL,NULL,0,32,NULL,0,0,0,'2016-07-27 01:40:28',126,0,2),(36,'Node.js','node-js','','#6CA6CD',NULL,NULL,2,32,NULL,0,0,0,'2016-07-27 01:40:28',126,0,3),(37,'Python','python','','#FF7F00',NULL,NULL,5,32,NULL,0,0,0,'2016-07-21 05:25:49',85,0,2),(38,'Ruby','ruby','','#6E7B8B',NULL,NULL,4,32,NULL,0,0,0,'2016-07-21 05:25:49',85,0,2),(39,'Go','go','','#BDB76B',NULL,NULL,6,32,NULL,0,0,0,'2016-07-21 05:25:49',85,0,2),(40,'C#','c-sharp','','#7171C6',NULL,NULL,3,32,NULL,0,0,0,'2016-07-20 07:36:32',60,0,0),(41,'Apple Pay','apple-pay','','#CD6090',NULL,NULL,6,13,NULL,0,0,0,NULL,NULL,0,0),(42,'百度钱包','bfb','','#00B2EE',NULL,NULL,3,13,NULL,0,0,0,'2016-07-19 06:46:15',66,0,0),(43,'易宝支付','yeepay','','#CD69C9',NULL,NULL,5,13,NULL,0,0,0,NULL,NULL,0,0),(44,'京东支付','jdpay','','#00CED1',NULL,NULL,4,13,NULL,0,0,0,NULL,NULL,0,0),(45,'内卡支付','cnp_u','','#CD919E',NULL,NULL,7,13,NULL,0,0,0,NULL,NULL,0,0),(46,'外卡支付','cnp_f','','#CD9B1D',NULL,NULL,8,13,NULL,0,0,0,NULL,NULL,0,0),(47,'app支付','app','','#8B864E',NULL,NULL,NULL,NULL,NULL,0,0,0,'2016-07-21 08:29:54',100,0,2),(48,'pc支付','pc','','#668B8B',NULL,NULL,NULL,NULL,NULL,0,0,0,'2016-07-26 10:37:53',125,0,2),(49,'wap支付','wap','','#2E2E2E',NULL,NULL,NULL,NULL,NULL,0,0,0,'2016-07-26 03:07:14',110,0,3),(50,'扫码支付','qr','','#D15FEE',NULL,NULL,NULL,NULL,NULL,0,0,0,'2016-07-25 06:45:12',105,0,0),(51,'用户分享','user-share','','#FF6EB4',NULL,NULL,NULL,NULL,NULL,1,0,6,'2016-07-26 09:28:31',122,1,0),(52,'系统公告','system-notice','','#FF7F50',NULL,NULL,NULL,NULL,NULL,1,0,4,'2016-07-26 03:35:42',112,1,0),(53,'市场活动','market-activity','','#EEA9B8',NULL,NULL,NULL,NULL,NULL,1,0,2,'2016-07-25 06:02:08',106,1,0),(54,'新产品','new-product','','#EE9572',NULL,NULL,NULL,NULL,NULL,1,0,1,'2016-07-25 07:27:49',107,1,0),(55,'量化派支付','qgbc','','#EE3A8C',NULL,NULL,9,13,NULL,0,0,0,NULL,NULL,0,0),(56,'分期乐支付','fqlpay','','#CD853F',NULL,NULL,10,13,NULL,0,0,0,NULL,NULL,0,0),(57,'招行一网通','cmb','','#0000CD',NULL,NULL,11,13,NULL,0,0,0,'2016-07-21 05:46:42',92,0,1);
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
  `ask_count` int(10) unsigned NOT NULL DEFAULT '0',
  `answer_count` int(10) unsigned NOT NULL DEFAULT '0',
  `praise_count` int(10) unsigned DEFAULT NULL,
  `agree_count` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `questions_count` int(10) unsigned DEFAULT NULL,
  `same_question_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'root','test@qq.com',1,'$2y$10$iqzFj.OON4qLp07KSgM0Qus8LfF2R.haFcTWTPBykxbviAFtAOwHK','社区管理员',NULL,'{\"notify_discussionRenamed_alert\":true,\"notify_postLiked_alert\":true,\"notify_discussionLocked_alert\":true,\"notify_postMentioned_alert\":true,\"notify_postMentioned_email\":false,\"notify_userMentioned_alert\":true,\"notify_userMentioned_email\":false,\"notify_newPost_alert\":true,\"notify_newPost_email\":false,\"followAfterReply\":false,\"discloseOnline\":true,\"indexProfile\":true,\"locale\":\"zh\"}','2016-06-17 03:18:11','2016-07-27 02:47:52','2016-07-21 06:46:04','2016-07-26 09:12:07',1,1,'2016-07-25 05:43:09',NULL,NULL,'来自社区账号系统',5,8,11,'2',NULL,1);
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
INSERT INTO `users_discussions` VALUES (1,77,'2016-07-25 05:32:48',6,NULL),(1,78,'2016-07-26 03:05:46',13,'follow'),(1,79,'2016-07-21 06:09:52',6,'follow'),(1,80,'2016-07-21 05:17:29',2,NULL),(1,84,'2016-07-21 05:21:34',1,NULL),(1,85,'2016-07-21 05:21:31',1,NULL),(1,91,'2016-07-21 08:36:40',5,NULL),(1,92,'2016-07-21 06:09:34',6,NULL),(1,96,'2016-07-21 05:57:40',2,NULL),(1,97,'2016-07-22 03:35:07',8,NULL),(1,100,'2016-07-21 08:29:54',1,NULL),(1,101,'2016-07-25 02:34:29',2,NULL),(1,102,'2016-07-25 05:41:30',2,'follow'),(1,103,'2016-07-25 03:45:28',6,NULL),(1,104,'2016-07-25 05:38:50',4,NULL),(1,106,'2016-07-25 06:02:08',1,NULL),(1,108,'2016-07-26 03:05:43',1,NULL),(1,109,'2016-07-26 03:06:13',1,NULL),(1,110,'2016-07-26 03:07:14',1,NULL),(1,112,'2016-07-26 03:35:56',2,NULL),(1,113,'2016-07-26 03:59:02',1,NULL),(1,114,'2016-07-26 05:12:10',1,NULL),(1,122,'2016-07-26 09:29:46',1,NULL),(1,126,'2016-07-27 01:40:50',4,NULL),(15,77,'2016-07-21 05:59:46',6,NULL),(15,78,'2016-07-26 02:53:45',13,NULL),(15,79,'2016-07-21 05:25:02',3,NULL),(15,80,'2016-07-22 06:35:37',4,NULL),(15,83,'2016-07-26 07:57:30',2,NULL),(15,91,'2016-07-26 08:40:17',6,'follow'),(15,92,'2016-07-26 01:53:25',3,NULL),(15,93,'2016-07-21 05:57:18',3,NULL),(15,95,'2016-07-26 10:36:12',1,NULL),(15,96,'2016-07-21 06:00:01',2,NULL),(15,97,'2016-07-26 06:13:08',8,NULL),(15,100,'2016-07-21 08:36:08',1,NULL),(15,101,'2016-07-26 08:13:21',2,NULL),(15,102,'2016-07-26 09:52:28',2,NULL),(15,103,'2016-07-25 09:09:55',2,NULL),(15,104,'2016-07-27 02:35:22',4,NULL),(15,106,'2016-07-26 06:13:03',1,NULL),(15,108,'2016-07-26 02:56:34',1,NULL),(15,109,'2016-07-26 03:22:46',1,NULL),(15,110,'2016-07-26 03:22:43',1,NULL),(15,111,'2016-07-26 03:31:47',1,NULL),(15,112,'2016-07-26 06:13:01',2,NULL),(15,113,'2016-07-26 06:13:47',2,NULL),(15,114,'2016-07-26 08:40:37',2,NULL),(15,118,'2016-07-26 09:56:55',2,NULL),(15,122,'2016-07-26 09:28:31',1,NULL),(15,123,'2016-07-26 10:36:40',1,NULL),(15,124,'2016-07-26 10:37:26',1,NULL),(15,125,'2016-07-26 10:37:53',1,NULL),(15,126,'2016-07-27 02:08:14',3,NULL),(16,77,'2016-07-21 05:16:29',5,'follow'),(16,78,'2016-07-21 05:19:11',3,NULL),(16,79,'2016-07-21 05:16:05',3,'follow'),(16,80,'2016-07-21 05:14:58',2,'follow'),(16,84,'2016-07-21 05:20:32',1,'follow'),(16,85,'2016-07-21 05:27:09',2,'follow'),(17,77,'2016-07-21 05:34:56',5,NULL),(17,78,'2016-07-21 05:36:07',8,NULL),(17,79,'2016-07-21 05:37:15',5,NULL),(17,80,'2016-07-21 05:14:27',1,NULL),(17,83,'2016-07-21 05:38:42',2,NULL),(17,85,'2016-07-21 05:30:21',3,NULL),(18,77,'2016-07-21 05:12:52',4,NULL),(18,78,'2016-07-21 05:31:09',6,NULL),(18,79,'2016-07-21 05:38:52',6,'follow'),(18,83,'2016-07-21 05:20:13',1,NULL),(18,93,'2016-07-21 05:40:18',2,NULL),(18,95,'2016-07-21 05:42:41',1,NULL),(19,77,'2016-07-21 05:10:02',1,NULL),(20,77,'2016-07-21 05:57:44',4,NULL),(20,78,'2016-07-25 06:23:41',12,NULL),(20,79,'2016-07-21 05:32:45',4,NULL),(20,80,'2016-07-21 05:21:51',2,NULL),(20,83,'2016-07-21 05:32:17',1,NULL),(20,84,'2016-07-21 05:32:09',1,NULL),(20,85,'2016-07-21 05:32:22',3,NULL),(20,91,'2016-07-21 06:00:27',3,NULL),(20,92,'2016-07-21 05:41:46',3,NULL),(20,93,'2016-07-21 05:44:06',3,NULL),(20,97,'2016-07-22 07:50:38',8,NULL),(20,101,'2016-07-25 03:19:01',2,NULL),(20,103,'2016-07-25 03:18:52',4,'follow'),(20,112,'2016-07-26 09:34:05',2,NULL),(20,114,'2016-07-26 09:29:26',2,NULL),(20,118,'2016-07-26 09:29:10',1,NULL),(20,122,'2016-07-26 09:33:59',1,NULL),(20,126,'2016-07-27 01:41:34',4,'follow'),(21,77,'2016-07-21 05:21:06',5,NULL),(21,78,'2016-07-21 05:35:07',8,NULL),(21,79,'2016-07-21 05:17:36',3,NULL),(21,80,'2016-07-21 05:39:13',4,NULL),(21,83,'2016-07-21 05:27:05',1,NULL),(21,85,'2016-07-21 05:29:50',3,NULL),(21,92,'2016-07-21 05:46:42',5,NULL),(21,93,'2016-07-21 05:41:35',2,NULL),(21,97,'2016-07-21 06:06:27',5,NULL),(22,77,'2016-07-21 05:54:07',6,NULL),(22,85,'2016-07-21 05:29:41',3,NULL),(22,91,'2016-07-21 05:58:13',4,NULL),(22,92,'2016-07-21 05:51:08',6,NULL),(22,96,'2016-07-21 06:03:32',2,NULL),(22,97,'2016-07-21 06:03:18',2,NULL),(23,79,'2016-07-21 05:51:15',6,'follow'),(23,80,'2016-07-21 05:51:24',4,'follow'),(23,83,'2016-07-21 05:35:51',1,NULL),(23,91,'2016-07-21 05:33:16',3,'follow'),(23,92,'2016-07-21 05:35:45',1,NULL),(23,96,'2016-07-21 05:54:28',2,'follow'),(24,77,'2016-07-22 03:24:53',6,NULL),(24,78,'2016-07-22 03:25:08',2,NULL),(24,91,'2016-07-22 03:27:36',5,'follow'),(24,92,'2016-07-22 03:28:27',6,NULL),(24,93,'2016-07-22 03:27:53',3,'follow'),(24,97,'2016-07-22 03:26:11',8,'follow'),(24,101,'2016-07-22 03:31:15',1,NULL);
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

--
-- Dumping events for database 'flarum'
--

--
-- Dumping routines for database 'flarum'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-27 11:06:45
