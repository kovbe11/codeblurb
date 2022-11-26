CREATE
DATABASE  IF NOT EXISTS `codeblurb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE
`codeblurb`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: codeblurb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `coding_content`
--

DROP TABLE IF EXISTS `coding_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coding_content`
(
    `coding_content_type` int NOT NULL,
    `description`         varchar(255) DEFAULT NULL,
    `id`                  int NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `FK49lm5m3nyg7kfvpcvg011b4gv` FOREIGN KEY (`id`) REFERENCES `content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coding_content`
--

LOCK
TABLES `coding_content` WRITE;
/*!40000 ALTER TABLE `coding_content` DISABLE KEYS */;
INSERT INTO `coding_content`
VALUES (1, 'This is a hello world example', 1);
/*!40000 ALTER TABLE `coding_content` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `coding_content_code_skeleton`
--

DROP TABLE IF EXISTS `coding_content_code_skeleton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coding_content_code_skeleton`
(
    `coding_content_id` int NOT NULL,
    `code_skeleton`     varchar(255) DEFAULT NULL,
    KEY                 `FK5f1c6r2guddeteae9iqcp94yk` (`coding_content_id`),
    CONSTRAINT `FK5f1c6r2guddeteae9iqcp94yk` FOREIGN KEY (`coding_content_id`) REFERENCES `coding_content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coding_content_code_skeleton`
--

LOCK
TABLES `coding_content_code_skeleton` WRITE;
/*!40000 ALTER TABLE `coding_content_code_skeleton` DISABLE KEYS */;
INSERT INTO `coding_content_code_skeleton`
VALUES (1, 'public class CodeSolution {'),
       (1, 'public static void main(String[] args) {'),
       (1, '}'),
       (1, '}');
/*!40000 ALTER TABLE `coding_content_code_skeleton` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `coding_content_code_snippets`
--

DROP TABLE IF EXISTS `coding_content_code_snippets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coding_content_code_snippets`
(
    `coding_content_id` int NOT NULL,
    `code_snippets`     varchar(255) DEFAULT NULL,
    KEY                 `FKi99gpnb839s32326kv1b8bays` (`coding_content_id`),
    CONSTRAINT `FKi99gpnb839s32326kv1b8bays` FOREIGN KEY (`coding_content_id`) REFERENCES `coding_content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coding_content_code_snippets`
--

LOCK
TABLES `coding_content_code_snippets` WRITE;
/*!40000 ALTER TABLE `coding_content_code_snippets` DISABLE KEYS */;
INSERT INTO `coding_content_code_snippets`
VALUES (1, 'System.out.println(\"Hello CodeBlurb!\");');
/*!40000 ALTER TABLE `coding_content_code_snippets` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content`
(
    `id`           int          NOT NULL,
    `content_type` int          NOT NULL,
    `name`         varchar(255) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_rjsbh4mgvigalpmpuitjf7b7e` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK
TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content`
VALUES (1, 0, 'Hello CodeBlurb'),
       (2, 1, 'Introduction to java'),
       (3, 2, 'Java hello world quiz');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `content_bundle`
--

DROP TABLE IF EXISTS `content_bundle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_bundle`
(
    `id`    int          NOT NULL,
    `title` varchar(255) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_7drn2krvqbytriig13fkse19n` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_bundle`
--

LOCK
TABLES `content_bundle` WRITE;
/*!40000 ALTER TABLE `content_bundle` DISABLE KEYS */;
INSERT INTO `content_bundle`
VALUES (1, 'bundle1'),
       (2, 'bundle2');
/*!40000 ALTER TABLE `content_bundle` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `content_bundles_bought_with_payment`
--

DROP TABLE IF EXISTS `content_bundles_bought_with_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_bundles_bought_with_payment`
(
    `payment_id`        int NOT NULL,
    `content_bundle_id` int NOT NULL,
    PRIMARY KEY (`payment_id`, `content_bundle_id`),
    KEY                 `FKihxl581g4cjme1mbd38cqdqyt` (`content_bundle_id`),
    CONSTRAINT `FKhfoxrhgsajik9t8topywnjje4` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
    CONSTRAINT `FKihxl581g4cjme1mbd38cqdqyt` FOREIGN KEY (`content_bundle_id`) REFERENCES `content_bundle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_bundles_bought_with_payment`
--

LOCK
TABLES `content_bundles_bought_with_payment` WRITE;
/*!40000 ALTER TABLE `content_bundles_bought_with_payment` DISABLE KEYS */;
INSERT INTO `content_bundles_bought_with_payment`
VALUES (1, 1);
/*!40000 ALTER TABLE `content_bundles_bought_with_payment` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `content_included_in_bundles`
--

DROP TABLE IF EXISTS `content_included_in_bundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_included_in_bundles`
(
    `content_bundle_id` int NOT NULL,
    `content_id`        int NOT NULL,
    PRIMARY KEY (`content_bundle_id`, `content_id`),
    KEY                 `FK3asp1huis9l6ux8odxqjhr6y` (`content_id`),
    CONSTRAINT `FK3asp1huis9l6ux8odxqjhr6y` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`),
    CONSTRAINT `FKo8tkbuat9v0hi13tv7dg71x1t` FOREIGN KEY (`content_bundle_id`) REFERENCES `content_bundle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_included_in_bundles`
--

LOCK
TABLES `content_included_in_bundles` WRITE;
/*!40000 ALTER TABLE `content_included_in_bundles` DISABLE KEYS */;
INSERT INTO `content_included_in_bundles`
VALUES (1, 1),
       (2, 2),
       (1, 3);
/*!40000 ALTER TABLE `content_included_in_bundles` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer`
(
    `id`       int          NOT NULL,
    `password` varchar(255) NOT NULL,
    `username` varchar(255) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_irnrrncatp2fvw52vp45j7rlw` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK
TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer`
VALUES (1, '$2a$10$N7A/FKxepuVUeDErvVOJOeG7XD4nNNWRhlGoeMr0tZXhVgyzKulRS', 'testUser');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence`
(
    `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK
TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence`
VALUES (1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `issued_token`
--

DROP TABLE IF EXISTS `issued_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issued_token`
(
    `jti`              varchar(36) NOT NULL,
    `access_token_jti` varchar(36) DEFAULT NULL,
    `customer_id`      int         DEFAULT NULL,
    `expiration_date`  datetime    NOT NULL,
    PRIMARY KEY (`jti`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issued_token`
--

LOCK
TABLES `issued_token` WRITE;
/*!40000 ALTER TABLE `issued_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `issued_token` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `logged_out_token`
--

DROP TABLE IF EXISTS `logged_out_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logged_out_token`
(
    `jti`             varchar(36) NOT NULL,
    `expiration_date` datetime    NOT NULL,
    PRIMARY KEY (`jti`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logged_out_token`
--

LOCK
TABLES `logged_out_token` WRITE;
/*!40000 ALTER TABLE `logged_out_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `logged_out_token` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment`
(
    `id`          int NOT NULL,
    `price_payed` double DEFAULT NULL,
    `customer_id` int    DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY           `FKby2skjf3ov608yb6nm16b49lg` (`customer_id`),
    CONSTRAINT `FKby2skjf3ov608yb6nm16b49lg` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK
TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment`
VALUES (1, 0, 1);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `quiz_content`
--

DROP TABLE IF EXISTS `quiz_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_content`
(
    `id` int NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `FKa9fjhuvdg0evfa32fg54aell7` FOREIGN KEY (`id`) REFERENCES `content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_content`
--

LOCK
TABLES `quiz_content` WRITE;
/*!40000 ALTER TABLE `quiz_content` DISABLE KEYS */;
INSERT INTO `quiz_content`
VALUES (3);
/*!40000 ALTER TABLE `quiz_content` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `quiz_question`
--

DROP TABLE IF EXISTS `quiz_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_question`
(
    `id`             int NOT NULL,
    `question`       varchar(255) DEFAULT NULL,
    `solution_index` int NOT NULL,
    `quiz_id`        int          DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY              `FKqgvkx8bij4ri5wrwxc1jeml28` (`quiz_id`),
    CONSTRAINT `FKqgvkx8bij4ri5wrwxc1jeml28` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_question`
--

LOCK
TABLES `quiz_question` WRITE;
/*!40000 ALTER TABLE `quiz_question` DISABLE KEYS */;
INSERT INTO `quiz_question`
VALUES (1, 'How to print hello world?', 1, 3);
/*!40000 ALTER TABLE `quiz_question` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `quiz_question_answers`
--

DROP TABLE IF EXISTS `quiz_question_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_question_answers`
(
    `quiz_question_id` int NOT NULL,
    `answers`          varchar(255) DEFAULT NULL,
    KEY                `FKraj83bxsrgw4mbbvoa3ods6g6` (`quiz_question_id`),
    CONSTRAINT `FKraj83bxsrgw4mbbvoa3ods6g6` FOREIGN KEY (`quiz_question_id`) REFERENCES `quiz_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_question_answers`
--

LOCK
TABLES `quiz_question_answers` WRITE;
/*!40000 ALTER TABLE `quiz_question_answers` DISABLE KEYS */;
INSERT INTO `quiz_question_answers`
VALUES (1, 'hello world'),
       (1, 'System.out.println(\"hello world\");'),
       (1, 'console.log(\"hello world\")');
/*!40000 ALTER TABLE `quiz_question_answers` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart`
(
    `id`          int NOT NULL,
    `customer_id` int DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY           `FKh7db6pdgs2ol2t6k73wn3xj75` (`customer_id`),
    CONSTRAINT `FKh7db6pdgs2ol2t6k73wn3xj75` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK
TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `shopping_item`
--

DROP TABLE IF EXISTS `shopping_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_item`
(
    `id`                int NOT NULL,
    `price`             double DEFAULT NULL,
    `content_bundle_id` int    DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY                 `FKoiyox2jds9km1am87xoiiwtn6` (`content_bundle_id`),
    CONSTRAINT `FKoiyox2jds9km1am87xoiiwtn6` FOREIGN KEY (`content_bundle_id`) REFERENCES `content_bundle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_item`
--

LOCK
TABLES `shopping_item` WRITE;
/*!40000 ALTER TABLE `shopping_item` DISABLE KEYS */;
INSERT INTO `shopping_item`
VALUES (1, 0, 1),
       (2, 0, 2);
/*!40000 ALTER TABLE `shopping_item` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `shopping_items_in_carts`
--

DROP TABLE IF EXISTS `shopping_items_in_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_items_in_carts`
(
    `shopping_cart_id` int NOT NULL,
    `shopping_item_id` int NOT NULL,
    KEY                `FK51eion2uxx092gu1pk0uh75co` (`shopping_item_id`),
    KEY                `FK45x4ihvn5ssbse6m6mxm9ms1o` (`shopping_cart_id`),
    CONSTRAINT `FK45x4ihvn5ssbse6m6mxm9ms1o` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_cart` (`id`),
    CONSTRAINT `FK51eion2uxx092gu1pk0uh75co` FOREIGN KEY (`shopping_item_id`) REFERENCES `shopping_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_items_in_carts`
--

LOCK
TABLES `shopping_items_in_carts` WRITE;
/*!40000 ALTER TABLE `shopping_items_in_carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_items_in_carts` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `test_case`
--

DROP TABLE IF EXISTS `test_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_case`
(
    `id`                int    NOT NULL,
    `example_test_case` bit(1) NOT NULL,
    `expected_output`   varchar(255) DEFAULT NULL,
    `input`             varchar(255) DEFAULT NULL,
    `coding_content_id` int          DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY                 `FKi7l9x0fbp2whjjjepohfmj3ls` (`coding_content_id`),
    CONSTRAINT `FKi7l9x0fbp2whjjjepohfmj3ls` FOREIGN KEY (`coding_content_id`) REFERENCES `coding_content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_case`
--

LOCK
TABLES `test_case` WRITE;
/*!40000 ALTER TABLE `test_case` DISABLE KEYS */;
INSERT INTO `test_case`
VALUES (1, _binary '', 'Hello CodeBlurb!', '', 1);
/*!40000 ALTER TABLE `test_case` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `test_case_hints`
--

DROP TABLE IF EXISTS `test_case_hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_case_hints`
(
    `test_case_id` int NOT NULL,
    `hints`        varchar(255) DEFAULT NULL,
    KEY            `FK5xn4ragil8mts4m843nfd1mou` (`test_case_id`),
    CONSTRAINT `FK5xn4ragil8mts4m843nfd1mou` FOREIGN KEY (`test_case_id`) REFERENCES `test_case` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_case_hints`
--

LOCK
TABLES `test_case_hints` WRITE;
/*!40000 ALTER TABLE `test_case_hints` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_case_hints` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `video_content`
--

DROP TABLE IF EXISTS `video_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_content`
(
    `description`  varchar(255) DEFAULT NULL,
    `resource_url` varchar(255) DEFAULT NULL,
    `id`           int NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `FKi2r3ogdbb6kbyhet8f9ibj7oe` FOREIGN KEY (`id`) REFERENCES `content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_content`
--

LOCK
TABLES `video_content` WRITE;
/*!40000 ALTER TABLE `video_content` DISABLE KEYS */;
INSERT INTO `video_content`
VALUES ('This video will introduce the basic concepts of java', 'resourceUrl', 2);
/*!40000 ALTER TABLE `video_content` ENABLE KEYS */;
UNLOCK
TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-15 21:41:04
