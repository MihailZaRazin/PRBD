-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: univer
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `iddir` int NOT NULL,
  `dirname` varchar(25) NOT NULL,
  `podr` varchar(10) NOT NULL,
  PRIMARY KEY (`iddir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Агавенян','ИД'),(2,'Котионов','ИИГСО'),(3,'Булыгина','ИФМИП'),(4,'Гейбука','ИФМИТО'),(5,'Кандалинцева','ИЕСЕН'),(6,'Архипова','ИМиСК'),(7,'Турыгин','ФФК');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emploee`
--

DROP TABLE IF EXISTS `emploee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emploee` (
  `#emp` int NOT NULL,
  `empname` varchar(25) NOT NULL,
  `director_iddir` int NOT NULL,
  `post_postname1` varchar(21) NOT NULL,
  PRIMARY KEY (`#emp`),
  KEY `fk_emploee_director1_idx` (`director_iddir`),
  KEY `fk_emploee_post2_idx` (`post_postname1`),
  CONSTRAINT `fk_emploee_director1` FOREIGN KEY (`director_iddir`) REFERENCES `director` (`iddir`),
  CONSTRAINT `fk_emploee_post2` FOREIGN KEY (`post_postname1`) REFERENCES `post` (`postname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emploee`
--

LOCK TABLES `emploee` WRITE;
/*!40000 ALTER TABLE `emploee` DISABLE KEYS */;
INSERT INTO `emploee` VALUES (1,'Чупин',5,'Доцент'),(2,'Крашенниников',5,'Доцент'),(3,'Верещагин',5,'Старший преподаватель'),(4,'Верещагина',5,'Доцент'),(5,'Петров',5,'Старший преподаватель'),(6,'Адамова',3,'Старший преподаватель'),(7,'Савватеев',5,'Старший преподаватель'),(8,'Шестаев',7,'Старший преподаватель'),(9,'Классов',5,'Доцент'),(10,'Некрасова',5,'Доцент');
/*!40000 ALTER TABLE `emploee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `#gr` char(10) NOT NULL,
  `code` char(12) NOT NULL,
  `napr` mediumtext NOT NULL,
  `prof` mediumtext,
  PRIMARY KEY (`#gr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES ('1','3.124.2.21','ИСИТ','ОвСАиНТ'),('2','3.124.2.22','ИСИТ','ОвСАиНТ'),('3','3.008.2.21','ИСИТ','ИСИТвО'),('4','3.008.2.22','ИСИТ','ИСИТвО'),('5','3.054.2.21','ПО','МИ');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `#week` varchar(45) NOT NULL,
  `day` varchar(3) NOT NULL,
  `group_#gr` char(10) NOT NULL,
  `subject_#subj` int NOT NULL,
  `lessontype_lessonname` varchar(12) NOT NULL,
  `#room` varchar(45) NOT NULL,
  PRIMARY KEY (`#week`,`day`,`group_#gr`,`subject_#subj`,`lessontype_lessonname`),
  KEY `fk_group_has_subject_subject1_idx` (`subject_#subj`),
  KEY `fk_group_has_subject_group1_idx` (`group_#gr`),
  KEY `fk_group_has_subject_lessontype1_idx` (`lessontype_lessonname`),
  CONSTRAINT `fk_group_has_subject_group1` FOREIGN KEY (`group_#gr`) REFERENCES `group` (`#gr`),
  CONSTRAINT `fk_group_has_subject_lessontype1` FOREIGN KEY (`lessontype_lessonname`) REFERENCES `lessontype` (`lessonname`),
  CONSTRAINT `fk_group_has_subject_subject1` FOREIGN KEY (`subject_#subj`) REFERENCES `subject` (`#subj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES ('1','вт','1',1,'Семинар','210'),('1','вт','2',1,'Лекция','115'),('1','вт','3',8,'Лекция','110'),('1','вт','4',5,'Семинар','103'),('1','вт','5',9,'Семинар','415'),('1','пн','1',3,'Лекция','14'),('1','пн','1',7,'Лекция','308'),('1','пн','2',2,'Лекция','216'),('1','пн','2',7,'Лекция','211'),('1','пн','4',1,'Лекция','12'),('1','пт','1',6,'Семинар','18'),('1','пт','5',5,'Лекция','16'),('1','ср','1',3,'Лекция','401'),('1','ср','3',7,'Лекция','12'),('1','ср','5',1,'Семинар','411'),('1','чт','4',2,'Семинар','14');
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessontype`
--

DROP TABLE IF EXISTS `lessontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessontype` (
  `lessonname` varchar(12) NOT NULL,
  PRIMARY KEY (`lessonname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessontype`
--

LOCK TABLES `lessontype` WRITE;
/*!40000 ALTER TABLE `lessontype` DISABLE KEYS */;
INSERT INTO `lessontype` VALUES ('Лабораторная'),('Лекция'),('Семинар');
/*!40000 ALTER TABLE `lessontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `postname` varchar(21) NOT NULL,
  PRIMARY KEY (`postname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES ('Ассистент'),('Доцент'),('Профессор'),('Старший преподаватель');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `idstudent` int NOT NULL AUTO_INCREMENT,
  `studname` varchar(25) NOT NULL,
  `director_iddir` int NOT NULL,
  `group_#gr` char(10) NOT NULL,
  PRIMARY KEY (`idstudent`),
  KEY `fk_student_director_idx` (`director_iddir`),
  KEY `fk_student_group1_idx` (`group_#gr`),
  CONSTRAINT `fk_student_director` FOREIGN KEY (`director_iddir`) REFERENCES `director` (`iddir`),
  CONSTRAINT `fk_student_group1` FOREIGN KEY (`group_#gr`) REFERENCES `group` (`#gr`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Разин',5,'1'),(2,'Судницын',5,'1'),(3,'Вебер',5,'1'),(4,'Яхонтов',5,'1'),(5,'Дубинин',5,'1'),(6,'Соболев',5,'1'),(7,'Гребе',5,'1'),(8,'Барбарин',5,'1'),(9,'Иванов',5,'2'),(10,'Петров',5,'2'),(11,'Сидоров',5,'2'),(12,'Лимонов',5,'3'),(13,'Абрикосов',5,'3'),(14,'Перцов',5,'3'),(15,'Винцов',5,'4'),(16,'Шрайнер',5,'4'),(17,'Карашенниников',5,'4'),(18,'Верещагин',5,'5'),(19,'Верещагина',5,'5'),(20,'Жигарев',5,'5'),(21,'Чупин',5,'5'),(22,'Шестаев',5,'5'),(23,'Адамова',5,'5'),(24,'Некрасова',5,'5');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_emploee`
--

DROP TABLE IF EXISTS `student_has_emploee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_has_emploee` (
  `student_idstudent` int NOT NULL,
  `emploee_#emp` int NOT NULL,
  `subject_#subj` int NOT NULL,
  `date` date NOT NULL,
  `marks` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`student_idstudent`,`emploee_#emp`,`subject_#subj`,`date`),
  KEY `fk_student_has_emploee_emploee1_idx` (`emploee_#emp`),
  KEY `fk_student_has_emploee_student1_idx` (`student_idstudent`),
  KEY `fk_student_has_emploee_subject1_idx` (`subject_#subj`),
  CONSTRAINT `fk_student_has_emploee_emploee1` FOREIGN KEY (`emploee_#emp`) REFERENCES `emploee` (`#emp`),
  CONSTRAINT `fk_student_has_emploee_student1` FOREIGN KEY (`student_idstudent`) REFERENCES `student` (`idstudent`),
  CONSTRAINT `fk_student_has_emploee_subject1` FOREIGN KEY (`subject_#subj`) REFERENCES `subject` (`#subj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_emploee`
--

LOCK TABLES `student_has_emploee` WRITE;
/*!40000 ALTER TABLE `student_has_emploee` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_has_emploee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `#subj` int NOT NULL AUTO_INCREMENT,
  `subjname` varchar(45) NOT NULL,
  `subjinfo` mediumtext,
  PRIMARY KEY (`#subj`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'ПрБД','База данных'),(2,'ККС','Комуникация и сети'),(3,'ИБ','Информационная безопасность'),(4,'ОС','Операцеонные системы'),(5,'МПТО','Методы проектирования технологической оснастки'),(6,'САПТП','Моделирование'),(7,'ФК','Физкультура'),(8,'СНТ','Современные наукоемкие технологии'),(9,'ФИЗ','Физика'),(10,'РТ','Робототехника'),(11,'АП','Аддитивные приборы');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_has_emploee`
--

DROP TABLE IF EXISTS `subject_has_emploee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_has_emploee` (
  `subject_#subj` int NOT NULL,
  `emploee_#emp` int NOT NULL,
  PRIMARY KEY (`subject_#subj`,`emploee_#emp`),
  KEY `fk_subject_has_emploee_emploee1_idx` (`emploee_#emp`),
  KEY `fk_subject_has_emploee_subject1_idx` (`subject_#subj`),
  CONSTRAINT `fk_subject_has_emploee_emploee1` FOREIGN KEY (`emploee_#emp`) REFERENCES `emploee` (`#emp`),
  CONSTRAINT `fk_subject_has_emploee_subject1` FOREIGN KEY (`subject_#subj`) REFERENCES `subject` (`#subj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_has_emploee`
--

LOCK TABLES `subject_has_emploee` WRITE;
/*!40000 ALTER TABLE `subject_has_emploee` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_has_emploee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `препол`
--

DROP TABLE IF EXISTS `препол`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `препол` (
  `#emp` int DEFAULT NULL,
  `empname` text,
  `director_iddir` int DEFAULT NULL,
  `post_postname1` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `препол`
--

LOCK TABLES `препол` WRITE;
/*!40000 ALTER TABLE `препол` DISABLE KEYS */;
INSERT INTO `препол` VALUES (1,'Р§СѓРїРёРЅ',5,'Р”РѕС†РµРЅС‚'),(2,'РџРµС‚СЂРѕРІ',5,'РЎС‚Р°СЂС€РёР№ РїСЂРµРїРѕРґР°РІР°С‚РµР»СЊ'),(3,'Р’РµСЂРµС‰Р°РіРёРЅ',5,'РЎС‚Р°СЂС€РёР№ РїСЂРµРїРѕРґР°РІР°С‚РµР»СЊ'),(4,'Р’РµСЂРµС‰Р°РіРёРЅР°',5,'Р”РѕС†РµРЅС‚'),(5,'РЎР°РІРІР°С‚РµРµРІ',5,'РЎС‚Р°СЂС€РёР№ РїСЂРµРїРѕРґР°РІР°С‚РµР»СЊ'),(6,'РљСЂР°С€РµРЅРЅРёРЅРёРєРѕРІ',5,'Р”РѕС†РµРЅС‚'),(7,'Р‘Р°Р»РѕС€РѕРІ',5,'Р”РѕС†РµРЅС‚'),(8,'РђРґР°РјРѕРІР°',5,'РЎС‚Р°СЂС€РёР№ РїСЂРµРїРѕРґР°РІР°С‚РµР»СЊ'),(9,'РќРµРєСЂР°СЃРѕРІР°',5,'Р”РѕС†РµРЅС‚'),(10,'РЁРµСЃС‚Р°РµРІ',7,'РЎС‚Р°СЂС€РёР№ РїСЂРµРїРѕРґР°РІР°С‚РµР»СЊ'),(11,'РљР»Р°СЃСЃРѕРІ',5,'Р”РѕС†РµРЅС‚');
/*!40000 ALTER TABLE `препол` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-25  9:54:14
