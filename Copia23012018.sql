-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 35.194.9.226    Database: entremente
-- ------------------------------------------------------
-- Server version	5.7.14-google-log

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED='883ab55e-ef53-11e7-afe7-42010a8002a3:1-1888105';

--
-- Table structure for table `ENFERMEDAD`
--

DROP TABLE IF EXISTS `ENFERMEDAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ENFERMEDAD` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENFERMEDAD`
--

LOCK TABLES `ENFERMEDAD` WRITE;
/*!40000 ALTER TABLE `ENFERMEDAD` DISABLE KEYS */;
INSERT INTO `ENFERMEDAD` VALUES (1,'Alzheimer Nivel 1','ALZ1'),(2,'Alzheimer Nivel 2','ALZ2'),(3,'Alzheimer Nivel 3','ALZ3');
/*!40000 ALTER TABLE `ENFERMEDAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FAMILIAR`
--

DROP TABLE IF EXISTS `FAMILIAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FAMILIAR` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(40) DEFAULT NULL,
  `apellidos` varchar(40) DEFAULT NULL,
  `documentoIdentidad` varchar(15) DEFAULT NULL,
  `nombreUsuario` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `tipoDocumento` char(1) DEFAULT NULL,
  `correo` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FAMILIAR`
--

LOCK TABLES `FAMILIAR` WRITE;
/*!40000 ALTER TABLE `FAMILIAR` DISABLE KEYS */;
INSERT INTO `FAMILIAR` VALUES (1,'Juan Pablo','Arevalo Merchan Familiar','12312','juanFamiliar','juanFamiliar','T','juan@juan.com');
/*!40000 ALTER TABLE `FAMILIAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HISTORIALMEDICO`
--

DROP TABLE IF EXISTS `HISTORIALMEDICO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HISTORIALMEDICO` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `idPaciente` int(10) unsigned NOT NULL,
  `idEnfermedad` int(10) unsigned NOT NULL,
  `idPersonalSalud` int(10) unsigned NOT NULL,
  `fecha` date DEFAULT NULL,
  `ROL` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_HMPac_idx` (`idPaciente`),
  KEY `FK_HMEnf_idx` (`idEnfermedad`),
  KEY `FK_HMPS` (`idPersonalSalud`),
  CONSTRAINT `FK_HMEnf` FOREIGN KEY (`idEnfermedad`) REFERENCES `ENFERMEDAD` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_HMPS` FOREIGN KEY (`idPersonalSalud`) REFERENCES `PERSONALSALUD` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_HMPac` FOREIGN KEY (`idPaciente`) REFERENCES `PACIENTE` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HISTORIALMEDICO`
--

LOCK TABLES `HISTORIALMEDICO` WRITE;
/*!40000 ALTER TABLE `HISTORIALMEDICO` DISABLE KEYS */;
INSERT INTO `HISTORIALMEDICO` VALUES (3,1,2,1,'2018-01-21',' Neurólogo');
/*!40000 ALTER TABLE `HISTORIALMEDICO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JUEGOATENCIONPACIENTE`
--

DROP TABLE IF EXISTS `JUEGOATENCIONPACIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JUEGOATENCIONPACIENTE` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `idPaciente` int(10) unsigned NOT NULL,
  `idPreguntaAtencion` int(10) unsigned NOT NULL,
  `nivelPersonalizado` int(5) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_JGPPac_idx` (`idPaciente`),
  KEY `FK_JGPPAt_idx` (`idPreguntaAtencion`),
  KEY `FK_JAPPac_idx` (`idPaciente`),
  KEY `FK_JAPPAt_idx` (`idPreguntaAtencion`),
  CONSTRAINT `FK_JAPPAt` FOREIGN KEY (`idPreguntaAtencion`) REFERENCES `PREGUNTAATENCION` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_JAPPa` FOREIGN KEY (`idPaciente`) REFERENCES `PACIENTE` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JUEGOATENCIONPACIENTE`
--

LOCK TABLES `JUEGOATENCIONPACIENTE` WRITE;
/*!40000 ALTER TABLE `JUEGOATENCIONPACIENTE` DISABLE KEYS */;
INSERT INTO `JUEGOATENCIONPACIENTE` VALUES (1,1,1,1,'A'),(2,1,2,1,'A'),(3,1,3,1,'A'),(4,1,4,1,'A'),(5,1,5,1,'A'),(6,1,6,1,'A'),(7,1,7,1,'A'),(8,1,8,1,'A'),(9,1,9,1,'A'),(10,1,10,2,'A'),(11,1,11,2,'A'),(12,1,12,2,'A'),(13,1,13,2,'A'),(14,1,14,2,'A'),(15,1,15,2,'A'),(16,1,16,2,'A'),(17,1,17,2,'A'),(18,1,18,2,'A'),(19,1,19,3,'A'),(20,1,20,3,'A'),(21,1,21,3,'A'),(22,1,22,3,'A'),(23,1,23,3,'A'),(24,1,24,3,'A'),(25,1,25,3,'A'),(26,1,26,3,'A'),(27,1,27,4,'A'),(28,1,28,4,'A'),(29,1,29,4,'A'),(30,1,30,4,'A'),(31,1,31,4,'A'),(32,1,32,4,'A'),(33,1,33,4,'A'),(34,1,34,4,'A'),(35,2,1,1,'A'),(36,2,2,1,'A'),(37,2,3,1,'A'),(38,2,4,1,'A'),(39,2,5,1,'A'),(40,2,6,1,'A'),(41,2,7,1,'A'),(42,2,8,1,'A'),(43,2,9,1,'A'),(44,2,10,2,'A'),(45,2,11,2,'A'),(46,2,12,2,'A'),(47,2,13,2,'A'),(48,2,14,2,'A'),(49,2,15,2,'A'),(50,2,16,2,'A'),(51,2,17,2,'A'),(52,2,18,2,'A'),(53,2,19,3,'A'),(54,2,20,3,'A'),(55,2,21,3,'A'),(56,2,22,3,'A'),(57,2,23,3,'A'),(58,2,24,3,'A'),(59,2,25,3,'A'),(60,2,26,3,'A'),(61,2,27,4,'A'),(62,2,28,4,'A'),(63,2,29,4,'A'),(64,2,30,4,'A'),(65,2,31,4,'A'),(66,2,32,4,'A'),(67,2,33,4,'A'),(68,2,34,4,'A'),(69,3,1,1,'A'),(70,3,2,1,'A'),(71,3,3,1,'A'),(72,3,4,1,'A'),(73,3,5,1,'A'),(74,3,6,1,'A'),(75,3,7,1,'A'),(76,3,8,1,'A'),(77,3,9,1,'A'),(78,3,10,2,'A'),(79,3,11,2,'A'),(80,3,12,2,'A'),(81,3,13,2,'A'),(82,3,14,2,'A'),(83,3,15,2,'A'),(84,3,16,2,'A'),(85,3,17,2,'A'),(86,3,18,2,'A'),(87,3,19,3,'A'),(88,3,20,3,'A'),(89,3,21,3,'A'),(90,3,22,3,'A'),(91,3,23,3,'A'),(92,3,24,3,'A'),(93,3,25,3,'A'),(94,3,26,3,'A'),(95,3,27,4,'A'),(96,3,28,4,'A'),(97,3,29,4,'A'),(98,3,30,4,'A'),(99,3,31,4,'A'),(100,3,32,4,'A'),(101,3,33,4,'A'),(102,3,34,4,'A');
/*!40000 ALTER TABLE `JUEGOATENCIONPACIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JUEGOCALCULOPACIENTE`
--

DROP TABLE IF EXISTS `JUEGOCALCULOPACIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JUEGOCALCULOPACIENTE` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `idPaciente` int(10) unsigned NOT NULL,
  `idPreguntaCalculo` int(10) unsigned NOT NULL,
  `nivelPersonalizado` int(5) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_JCPPac_idx` (`idPaciente`),
  KEY `FK_JCPPG_idx` (`idPreguntaCalculo`),
  CONSTRAINT `FK_JCPPG` FOREIGN KEY (`idPreguntaCalculo`) REFERENCES `PREGUNTACALCULO` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_JCPPa` FOREIGN KEY (`idPaciente`) REFERENCES `PACIENTE` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JUEGOCALCULOPACIENTE`
--

LOCK TABLES `JUEGOCALCULOPACIENTE` WRITE;
/*!40000 ALTER TABLE `JUEGOCALCULOPACIENTE` DISABLE KEYS */;
INSERT INTO `JUEGOCALCULOPACIENTE` VALUES (1,1,1,1,'A'),(2,1,2,1,'A'),(3,1,3,1,'A'),(4,1,4,1,'A'),(5,1,5,1,'A'),(6,1,6,1,'A'),(7,1,7,1,'A'),(8,1,8,1,'A'),(9,1,9,1,'A'),(10,1,10,1,'A'),(11,1,11,2,'A'),(12,1,12,2,'A'),(13,1,13,2,'A'),(14,1,14,2,'A'),(15,1,15,2,'A'),(16,1,16,2,'A'),(17,1,17,2,'A'),(18,1,18,2,'A'),(19,1,19,2,'A'),(20,1,20,2,'A'),(21,1,21,2,'A'),(22,1,22,3,'A'),(23,1,23,3,'A'),(24,1,24,3,'A'),(25,1,25,3,'A'),(26,1,26,3,'A'),(27,1,27,3,'A'),(28,1,28,3,'A'),(29,1,29,3,'A'),(30,1,30,3,'A'),(31,1,31,3,'A'),(32,1,32,4,'A'),(33,1,33,4,'A'),(34,1,34,4,'A'),(35,1,35,4,'A'),(36,1,36,4,'A'),(37,1,37,4,'A'),(38,1,38,4,'A'),(39,1,39,4,'A'),(40,1,40,4,'A'),(41,1,41,4,'A'),(42,2,1,1,'A'),(43,2,2,1,'A'),(44,2,3,1,'A'),(45,2,4,1,'A'),(46,2,5,1,'A'),(47,2,6,1,'A'),(48,2,7,1,'A'),(49,2,8,1,'A'),(50,2,9,1,'A'),(51,2,10,1,'A'),(52,2,11,2,'A'),(53,2,12,2,'A'),(54,2,13,2,'A'),(55,2,14,2,'A'),(56,2,15,2,'A'),(57,2,16,2,'A'),(58,2,17,2,'A'),(59,2,18,2,'A'),(60,2,19,2,'A'),(61,2,20,2,'A'),(62,2,21,2,'A'),(63,2,22,3,'A'),(64,2,23,3,'A'),(65,2,24,3,'A'),(66,2,25,3,'A'),(67,2,26,3,'A'),(68,2,27,3,'A'),(69,2,28,3,'A'),(70,2,29,3,'A'),(71,2,30,3,'A'),(72,2,31,3,'A'),(73,2,32,4,'A'),(74,2,33,4,'A'),(75,2,34,4,'A'),(76,2,35,4,'A'),(77,2,36,4,'A'),(78,2,37,4,'A'),(79,2,38,4,'A'),(80,2,39,4,'A'),(81,2,40,4,'A'),(82,2,41,4,'A'),(83,3,1,1,'A'),(84,3,2,1,'A'),(85,3,3,1,'A'),(86,3,4,1,'A'),(87,3,5,1,'A'),(88,3,6,1,'A'),(89,3,7,1,'A'),(90,3,8,1,'A'),(91,3,9,1,'A'),(92,3,10,1,'A'),(93,3,11,2,'A'),(94,3,12,2,'A'),(95,3,13,2,'A'),(96,3,14,2,'A'),(97,3,15,2,'A'),(98,3,16,2,'A'),(99,3,17,2,'A'),(100,3,18,2,'A'),(101,3,19,2,'A'),(102,3,20,2,'A'),(103,3,21,2,'A'),(104,3,22,3,'A'),(105,3,23,3,'A'),(106,3,24,3,'A'),(107,3,25,3,'A'),(108,3,26,3,'A'),(109,3,27,3,'A'),(110,3,28,3,'A'),(111,3,29,3,'A'),(112,3,30,3,'A'),(113,3,31,3,'A'),(114,3,32,4,'A'),(115,3,33,4,'A'),(116,3,34,4,'A'),(117,3,35,4,'A'),(118,3,36,4,'A'),(119,3,37,4,'A'),(120,3,38,4,'A'),(121,3,39,4,'A'),(122,3,40,4,'A'),(123,3,41,4,'A');
/*!40000 ALTER TABLE `JUEGOCALCULOPACIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JUEGOFORMASPACIENTE`
--

DROP TABLE IF EXISTS `JUEGOFORMASPACIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JUEGOFORMASPACIENTE` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `idPaciente` int(10) unsigned NOT NULL,
  `idPreguntaFormas` int(10) unsigned NOT NULL,
  `nivelPersonalizado` int(5) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_JFPPac_idx` (`idPaciente`),
  KEY `FK_JFPPG_idx` (`idPreguntaFormas`),
  CONSTRAINT `FK_JFPPG` FOREIGN KEY (`idPreguntaFormas`) REFERENCES `PREGUNTAFORMAS` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_JFPPa` FOREIGN KEY (`idPaciente`) REFERENCES `PACIENTE` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JUEGOFORMASPACIENTE`
--

LOCK TABLES `JUEGOFORMASPACIENTE` WRITE;
/*!40000 ALTER TABLE `JUEGOFORMASPACIENTE` DISABLE KEYS */;
INSERT INTO `JUEGOFORMASPACIENTE` VALUES (1,1,1,1,'A'),(2,1,2,1,'A'),(3,1,3,1,'A'),(4,1,4,1,'A'),(5,1,5,1,'A'),(6,1,6,1,'A'),(7,1,7,1,'A'),(8,1,8,1,'A'),(9,1,9,2,'A'),(10,1,10,2,'A'),(11,1,11,2,'A'),(12,1,12,2,'A'),(13,1,13,2,'A'),(14,1,14,2,'A'),(15,1,15,2,'A'),(16,1,16,2,'A'),(17,1,17,2,'A'),(18,1,18,3,'A'),(19,1,19,3,'A'),(20,1,20,3,'A'),(21,1,21,3,'A'),(22,1,22,3,'A'),(23,1,23,3,'A'),(24,1,24,3,'A'),(25,1,25,3,'A'),(26,1,26,4,'A'),(27,1,27,4,'A'),(28,1,28,4,'A'),(29,1,29,4,'A'),(30,1,30,4,'A'),(31,1,31,4,'A'),(32,1,32,4,'A'),(33,1,33,4,'A'),(34,2,1,1,'A'),(35,2,2,1,'A'),(36,2,3,1,'A'),(37,2,4,1,'A'),(38,2,5,1,'A'),(39,2,6,1,'A'),(40,2,7,1,'A'),(41,2,8,1,'A'),(42,2,9,2,'A'),(43,2,10,2,'A'),(44,2,11,2,'A'),(45,2,12,2,'A'),(46,2,13,2,'A'),(47,2,14,2,'A'),(48,2,15,2,'A'),(49,2,16,2,'A'),(50,2,17,2,'A'),(51,2,18,3,'A'),(52,2,19,3,'A'),(53,2,20,3,'A'),(54,2,21,3,'A'),(55,2,22,3,'A'),(56,2,23,3,'A'),(57,2,24,3,'A'),(58,2,25,3,'A'),(59,2,26,4,'A'),(60,2,27,4,'A'),(61,2,28,4,'A'),(62,2,29,4,'A'),(63,2,30,4,'A'),(64,2,31,4,'A'),(65,2,32,4,'A'),(66,2,33,4,'A'),(67,3,1,1,'A'),(68,3,2,1,'A'),(69,3,3,1,'A'),(70,3,4,1,'A'),(71,3,5,1,'A'),(72,3,6,1,'A'),(73,3,7,1,'A'),(74,3,8,1,'A'),(75,3,9,2,'A'),(76,3,10,2,'A'),(77,3,11,2,'A'),(78,3,12,2,'A'),(79,3,13,2,'A'),(80,3,14,2,'A'),(81,3,15,2,'A'),(82,3,16,2,'A'),(83,3,17,2,'A'),(84,3,18,3,'A'),(85,3,19,3,'A'),(86,3,20,3,'A'),(87,3,21,3,'A'),(88,3,22,3,'A'),(89,3,23,3,'A'),(90,3,24,3,'A'),(91,3,25,3,'A'),(92,3,26,4,'A'),(93,3,27,4,'A'),(94,3,28,4,'A'),(95,3,29,4,'A'),(96,3,30,4,'A'),(97,3,31,4,'A'),(98,3,32,4,'A'),(99,3,33,4,'A');
/*!40000 ALTER TABLE `JUEGOFORMASPACIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JUEGOGALERIAPACIENTE`
--

DROP TABLE IF EXISTS `JUEGOGALERIAPACIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JUEGOGALERIAPACIENTE` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `idPaciente` int(10) unsigned NOT NULL,
  `idPreguntaGaleria` int(10) unsigned NOT NULL,
  `nivelPersonalizado` int(5) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_JGPPac_idx` (`idPaciente`),
  KEY `FK_JGPPG_idx` (`idPreguntaGaleria`),
  CONSTRAINT `FK_JGPPG` FOREIGN KEY (`idPreguntaGaleria`) REFERENCES `PREGUNTAGALERIA` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_JGPPa` FOREIGN KEY (`idPaciente`) REFERENCES `PACIENTE` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JUEGOGALERIAPACIENTE`
--

LOCK TABLES `JUEGOGALERIAPACIENTE` WRITE;
/*!40000 ALTER TABLE `JUEGOGALERIAPACIENTE` DISABLE KEYS */;
INSERT INTO `JUEGOGALERIAPACIENTE` VALUES (1,1,1,1,'A'),(2,1,2,1,'A'),(3,1,3,1,'A'),(4,1,4,1,'A'),(5,1,5,1,'A'),(6,1,6,1,'A'),(7,1,7,1,'A'),(8,1,8,1,'A'),(9,1,9,1,'A'),(10,2,1,1,'A'),(11,2,2,1,'A'),(12,2,3,1,'A'),(13,2,4,1,'A'),(14,2,5,1,'A'),(15,2,6,1,'A'),(16,2,7,1,'A'),(17,2,8,1,'A'),(18,2,9,1,'A'),(19,3,1,1,'A'),(20,3,2,1,'A'),(21,3,3,1,'A'),(22,3,4,1,'A'),(23,3,5,1,'A'),(24,3,6,1,'A'),(25,3,7,1,'A'),(26,3,8,1,'A'),(27,3,9,1,'A'),(28,1,10,2,'A'),(54,1,11,2,'A'),(55,1,12,2,'A'),(56,1,13,2,'A'),(57,1,14,2,'A'),(58,1,15,2,'A'),(59,1,16,2,'A'),(60,1,17,2,'A'),(61,1,18,2,'A'),(62,1,19,2,'A'),(63,1,20,2,'A'),(64,1,21,3,'A'),(65,1,22,3,'A'),(66,1,23,3,'A'),(67,1,24,3,'A'),(68,1,25,3,'A'),(69,1,26,3,'A'),(70,1,27,3,'A'),(71,1,28,3,'A'),(72,1,29,3,'A'),(73,1,30,4,'A'),(74,1,31,4,'A'),(75,1,32,4,'A'),(76,1,33,4,'A'),(77,1,34,4,'A'),(78,1,35,4,'A'),(79,1,36,4,'A'),(80,1,37,4,'A'),(81,1,38,4,'A'),(82,2,10,2,'A'),(83,2,11,2,'A'),(84,2,12,2,'A'),(85,2,13,2,'A'),(86,2,14,2,'A'),(87,2,15,2,'A'),(88,2,16,2,'A'),(89,2,17,2,'A'),(90,2,18,2,'A'),(91,2,19,2,'A'),(92,2,20,2,'A'),(93,2,21,3,'A'),(94,2,22,3,'A'),(95,2,23,3,'A'),(96,2,24,3,'A'),(97,2,25,3,'A'),(98,2,26,3,'A'),(99,2,27,3,'A'),(100,2,28,3,'A'),(101,2,29,3,'A'),(102,2,30,4,'A'),(103,2,31,4,'A'),(104,2,32,4,'A'),(105,2,33,4,'A'),(106,2,34,4,'A'),(107,2,35,4,'A'),(108,2,36,4,'A'),(109,2,37,4,'A'),(110,2,38,4,'A'),(111,3,10,2,'A'),(112,3,11,2,'A'),(113,3,12,2,'A'),(114,3,13,2,'A'),(115,3,14,2,'A'),(116,3,15,2,'A'),(117,3,16,2,'A'),(118,3,17,2,'A'),(119,3,18,2,'A'),(120,3,19,2,'A'),(121,3,20,2,'A'),(122,3,21,3,'A'),(123,3,22,3,'A'),(124,3,23,3,'A'),(125,3,24,3,'A'),(126,3,25,3,'A'),(127,3,26,3,'A'),(128,3,27,3,'A'),(129,3,28,3,'A'),(130,3,29,3,'A'),(131,3,30,4,'A'),(132,3,31,4,'A'),(133,3,32,4,'A'),(134,3,33,4,'A'),(135,3,34,4,'A'),(136,3,35,4,'A'),(137,3,36,4,'A'),(138,3,37,4,'A'),(139,3,38,4,'A');
/*!40000 ALTER TABLE `JUEGOGALERIAPACIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JUEGOPERCEPCIONPACIENTE`
--

DROP TABLE IF EXISTS `JUEGOPERCEPCIONPACIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JUEGOPERCEPCIONPACIENTE` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `idPaciente` int(10) unsigned NOT NULL,
  `idPreguntaPercepcion` int(10) unsigned NOT NULL,
  `nivelPersonalizado` int(5) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_JPPPac_idx` (`idPaciente`),
  KEY `FK_JPPPG_idx` (`idPreguntaPercepcion`),
  CONSTRAINT `FK_JPPPG` FOREIGN KEY (`idPreguntaPercepcion`) REFERENCES `PREGUNTAPERCEPCION` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_JPPPa` FOREIGN KEY (`idPaciente`) REFERENCES `PACIENTE` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JUEGOPERCEPCIONPACIENTE`
--

LOCK TABLES `JUEGOPERCEPCIONPACIENTE` WRITE;
/*!40000 ALTER TABLE `JUEGOPERCEPCIONPACIENTE` DISABLE KEYS */;
INSERT INTO `JUEGOPERCEPCIONPACIENTE` VALUES (1,1,1,1,'A'),(2,1,2,1,'A'),(3,1,3,1,'A'),(4,1,4,1,'A'),(5,1,5,1,'A'),(6,1,6,1,'A'),(7,1,7,1,'A'),(8,1,8,1,'A'),(9,1,9,2,'A'),(10,1,10,2,'A'),(11,1,11,2,'A'),(12,1,12,2,'A'),(13,1,13,2,'A'),(14,1,14,2,'A'),(15,1,15,2,'A'),(16,1,16,2,'A'),(17,1,17,3,'A'),(18,1,18,3,'A'),(19,1,19,3,'A'),(20,1,20,3,'A'),(21,1,21,3,'A'),(22,1,22,3,'A'),(23,1,23,3,'A'),(24,1,24,3,'A'),(25,2,1,1,'A'),(26,2,2,1,'A'),(27,2,3,1,'A'),(28,2,4,1,'A'),(29,2,5,1,'A'),(30,2,6,1,'A'),(31,2,7,1,'A'),(32,2,8,1,'A'),(33,2,9,2,'A'),(34,2,10,2,'A'),(35,2,11,2,'A'),(36,2,12,2,'A'),(37,2,13,2,'A'),(38,2,14,2,'A'),(39,2,15,2,'A'),(40,2,16,2,'A'),(41,2,17,3,'A'),(42,2,18,3,'A'),(43,2,19,3,'A'),(44,2,20,3,'A'),(45,2,21,3,'A'),(46,2,22,3,'A'),(47,2,23,3,'A'),(48,2,24,3,'A'),(49,3,1,1,'A'),(50,3,2,1,'A'),(51,3,3,1,'A'),(52,3,4,1,'A'),(53,3,5,1,'A'),(54,3,6,1,'A'),(55,3,7,1,'A'),(56,3,8,1,'A'),(57,3,9,2,'A'),(58,3,10,2,'A'),(59,3,11,2,'A'),(60,3,12,2,'A'),(61,3,13,2,'A'),(62,3,14,2,'A'),(63,3,15,2,'A'),(64,3,16,2,'A'),(65,3,17,3,'A'),(66,3,18,3,'A'),(67,3,19,3,'A'),(68,3,20,3,'A'),(69,3,21,3,'A'),(70,3,22,3,'A'),(71,3,23,3,'A'),(72,3,24,3,'A');
/*!40000 ALTER TABLE `JUEGOPERCEPCIONPACIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MENSAJES`
--

DROP TABLE IF EXISTS `MENSAJES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MENSAJES` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `idPaciente` int(10) unsigned NOT NULL,
  `idPersonalSalud` int(10) unsigned DEFAULT NULL,
  `idFamiliar` int(10) unsigned DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `mensaje` varchar(2000) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `puedeVerPac` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_MenPac_idx` (`idFamiliar`),
  KEY `FK_MenPS_idx` (`idPersonalSalud`),
  CONSTRAINT `FK_MenFam` FOREIGN KEY (`idFamiliar`) REFERENCES `FAMILIAR` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MenPS` FOREIGN KEY (`idPersonalSalud`) REFERENCES `PACIENTESALUD` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MenPac` FOREIGN KEY (`idFamiliar`) REFERENCES `FAMILIAR` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MENSAJES`
--

LOCK TABLES `MENSAJES` WRITE;
/*!40000 ALTER TABLE `MENSAJES` DISABLE KEYS */;
INSERT INTO `MENSAJES` VALUES (1,1,1,1,'2005-05-12','Tienes que trabajar mucho mas','Personal Salud','Medico General','S'),(2,1,1,NULL,'2018-01-11','Hola','Personal Salud',' Neurólogo','N'),(3,1,1,NULL,'2018-01-01','Este mensaje lo envia un médico. En enero','Personal Salud',' Neurólogo','S'),(4,1,1,NULL,'2018-01-13','adasd','Personal Salud',' Neurólogo','N'),(5,1,NULL,1,'2018-01-19','hola','Familiar',' Padres','S'),(6,1,NULL,1,'2018-01-12','Enero 12','Familiar',' Padres','S');
/*!40000 ALTER TABLE `MENSAJES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PACIENTE`
--

DROP TABLE IF EXISTS `PACIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PACIENTE` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(40) DEFAULT NULL,
  `apellidos` varchar(40) DEFAULT NULL,
  `documentoIdentidad` varchar(15) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `pais` varchar(15) DEFAULT NULL,
  `ciudad` varchar(15) DEFAULT NULL,
  `nombreUsuario` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `tipoDocumento` char(1) DEFAULT NULL,
  `correo` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PACIENTE`
--

LOCK TABLES `PACIENTE` WRITE;
/*!40000 ALTER TABLE `PACIENTE` DISABLE KEYS */;
INSERT INTO `PACIENTE` VALUES (1,'Juan Pablo','Arevalo Merchan Paciente','1010111010','1992-05-30','H','Colombia','Bogota','juanPaciente','juanPaciente','Carrera 21 # 39A-22','C','juan.arevalo.merchan@gmail.com'),(2,'Juan Pablo','Arevalo','1','2018-01-10','H','Col','Bog','a','a','Cll','T','a@a.a'),(3,'Pablo Juan','Merchan Arevalo Paciente 2','3','2018-01-05','H','C','B','juanPaciente2','juanPaciente2','C','T','ab@a.a');
/*!40000 ALTER TABLE `PACIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PACIENTEFAMILIAR`
--

DROP TABLE IF EXISTS `PACIENTEFAMILIAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PACIENTEFAMILIAR` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `idPaciente` int(10) unsigned NOT NULL,
  `idFamiliar` int(10) unsigned NOT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `relacion` varchar(20) DEFAULT NULL,
  `enviado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idPaciente` (`idPaciente`),
  KEY `idFamiliar` (`idFamiliar`),
  CONSTRAINT `PACIENTEFAMILIAR_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `PACIENTE` (`id`),
  CONSTRAINT `PACIENTEFAMILIAR_ibfk_2` FOREIGN KEY (`idFamiliar`) REFERENCES `FAMILIAR` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PACIENTEFAMILIAR`
--

LOCK TABLES `PACIENTEFAMILIAR` WRITE;
/*!40000 ALTER TABLE `PACIENTEFAMILIAR` DISABLE KEYS */;
INSERT INTO `PACIENTEFAMILIAR` VALUES (1,2,1,'P','Tios','O'),(2,1,1,'A','Padres','O'),(3,3,1,'A','Hermanos','P');
/*!40000 ALTER TABLE `PACIENTEFAMILIAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PACIENTESALUD`
--

DROP TABLE IF EXISTS `PACIENTESALUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PACIENTESALUD` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `idPaciente` int(10) unsigned NOT NULL,
  `idPersonalSalud` int(10) unsigned NOT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `relacion` varchar(20) DEFAULT NULL,
  `enviado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idPaciente` (`idPaciente`),
  KEY `idPersonalSalud` (`idPersonalSalud`),
  CONSTRAINT `PACIENTESALUD_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `PACIENTE` (`id`),
  CONSTRAINT `PACIENTESALUD_ibfk_2` FOREIGN KEY (`idPersonalSalud`) REFERENCES `PERSONALSALUD` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PACIENTESALUD`
--

LOCK TABLES `PACIENTESALUD` WRITE;
/*!40000 ALTER TABLE `PACIENTESALUD` DISABLE KEYS */;
INSERT INTO `PACIENTESALUD` VALUES (1,1,1,'A','Neurólogo','O');
/*!40000 ALTER TABLE `PACIENTESALUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSONALSALUD`
--

DROP TABLE IF EXISTS `PERSONALSALUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSONALSALUD` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(40) DEFAULT NULL,
  `apellidos` varchar(40) DEFAULT NULL,
  `documentoIdentidad` varchar(15) DEFAULT NULL,
  `nombreUsuario` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `tipoDocumento` char(1) DEFAULT NULL,
  `correo` varchar(80) DEFAULT NULL,
  `rol` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSONALSALUD`
--

LOCK TABLES `PERSONALSALUD` WRITE;
/*!40000 ALTER TABLE `PERSONALSALUD` DISABLE KEYS */;
INSERT INTO `PERSONALSALUD` VALUES (1,'Juan Pablo','Arevalo Medico','1111','juanMedico','juanMedico','T','juan.arevalo.merchan@gmail.com','N');
/*!40000 ALTER TABLE `PERSONALSALUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PREGUNTAATENCION`
--

DROP TABLE IF EXISTS `PREGUNTAATENCION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PREGUNTAATENCION` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(500) DEFAULT NULL,
  `imagen` varchar(1500) DEFAULT NULL,
  `palabraClave` varchar(50) DEFAULT NULL,
  `opcionA` varchar(1500) DEFAULT NULL,
  `opcionB` varchar(1500) DEFAULT NULL,
  `opcionC` varchar(1500) DEFAULT NULL,
  `opcionD` varchar(1500) DEFAULT NULL,
  `nivelPredeterminado` int(5) DEFAULT NULL,
  `personalizado` varchar(1) DEFAULT NULL,
  `correctaA` varchar(1) DEFAULT NULL,
  `correctaB` varchar(1) DEFAULT NULL,
  `correctaC` varchar(1) DEFAULT NULL,
  `correctaD` varchar(1) DEFAULT NULL,
  `palabraClaveA` varchar(50) DEFAULT NULL,
  `palabraClaveB` varchar(50) DEFAULT NULL,
  `palabraClaveC` varchar(50) DEFAULT NULL,
  `palabraClaveD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PREGUNTAATENCION`
--

LOCK TABLES `PREGUNTAATENCION` WRITE;
/*!40000 ALTER TABLE `PREGUNTAATENCION` DISABLE KEYS */;
INSERT INTO `PREGUNTAATENCION` VALUES (1,'Seleccione todos los animales que sean de la misma especie al de la imagen superior','image\\\\Atencion\\\\perro1.png','perro','image\\\\Atencion\\\\perro2.png','image\\\\Atencion\\\\perro3.png','image\\\\Atencion\\\\caballo1.png','image\\\\Atencion\\\\gato1.png',1,'N','S','S','N','N','perro','perro','caballo','gato'),(2,'Seleccione todos los perros que sean de la misma raza al de la imagen superior','image\\\\Atencion\\\\dalmata1.png','dalmata','image\\\\Atencion\\\\dalmata2.png','image\\\\Atencion\\\\dalmata3.png','image\\\\Atencion\\\\abeja1.png','image\\\\Atencion\\\\perro4.png',1,'N','S','S','N','N','dalmata','dalmata','abeja','perro'),(3,'Seleccione todos los animales que se desplazan de igual forma al de la imagen superior','image\\\\Atencion\\\\aguila1.png','aereo','image\\\\Atencion\\\\pajaro1.png','image\\\\Atencion\\\\mariposa1.png','image\\\\Atencion\\\\tortuga1.png','image\\\\Atencion\\\\raton1.png',1,'N','S','S','N','N','aereo','aereo','terrestre','terrestre'),(4,'Seleccione todos los animales que tienen la misma cantidad de patas al de la imagen superior','image\\\\Atencion\\\\pato1.png','plumas','image\\\\Atencion\\\\avestruz1.png','image\\\\Atencion\\\\ganso1.png','image\\\\Atencion\\\\cerdo1.png','image\\\\Atencion\\\\dinosaurio1.png',1,'N','S','S','N','N','plumas','plumas','otro','otro'),(5,'Seleccione todos los elementos que NO pertenecen a la imagen superior (Baño)','image\\\\Atencion\\\\bano1.jpg','otro','image\\\\Atencion\\\\cuaderno1.png','image\\\\Atencion\\\\balon3.png','image\\\\Atencion\\\\papelHiguienico1.png','image\\\\Atencion\\\\cepilloDientes1.png',1,'N','S','S','N','N','otro','otro','bano','bano'),(6,'Seleccione todos los elementos que puedas encontrar en el sitio de la fotografia superior (Cocina)','image\\\\Atencion\\\\cocina1.jpg','cocina','image\\\\Atencion\\\\olla1.png','image\\\\Atencion\\\\plato1.png','image\\\\Atencion\\\\carro1.png','image\\\\Atencion\\\\bici.png',1,'N','S','S','N','N','cocina','cocina','otro','otro'),(7,'Seleccione todos los elementos que puedas encontrar en el sitio de la fotografia superior (Habitación)','image\\\\Atencion\\\\dormitorio1.png','dormitorio','image\\\\Atencion\\\\mesaNoche1.png','image\\\\Atencion\\\\cama1.png','image\\\\Atencion\\\\tina1.png','image\\\\Atencion\\\\olla1.png',1,'N','S','S','N','N','dormitorio','dormitorio','otro','otro'),(8,'Seleccione las balones que tienen relacion a los de la imagen superior','image\\\\Atencion\\\\balon2.png','futbol','image\\\\Atencion\\\\balon1.png','image\\\\Atencion\\\\balon3.png','image\\\\Atencion\\\\balon4.png','image\\\\Atencion\\\\balon5.png',1,'N','S','S','N','N','futbol','futbol','otro','otro'),(9,'Seleccione las flores que aparecen en la imagen superior','image\\\\Atencion\\\\flores1.jpg','flor','image\\\\Atencion\\\\flores2.jpg','image\\\\Atencion\\\\flores3.jpg','image\\\\Atencion\\\\flores4.png','image\\\\Atencion\\\\flores5.png',1,'N','S','S','N','N','flor','flor','otro','otro'),(10,'Seleccione los números que aparecen en la imagen superior, pero en orden inverso. Ejemplo 123 ->321','image\\\\Atencion\\\\numeros1.png','a','image\\\\Atencion\\\\numeros1Bien.png','image\\\\Atencion\\\\numeros1Bien2.png','image\\\\Atencion\\\\numeros1Mal1.png','image\\\\Atencion\\\\numeros1Mal2.png',2,'N','S','S','N','N','a','a','b','b'),(11,'Seleccione los números que aparecen en la imagen superior, pero en orden inverso. Ejemplo 123 ->321','image\\\\Atencion\\\\numeros2.png','a','image\\\\Atencion\\\\numeros2Bien.png','image\\\\Atencion\\\\numeros2Bien2.png','image\\\\Atencion\\\\numeros2Mal1.png','image\\\\Atencion\\\\numeros2Mal2.png',2,'N','S','S','N','N','a','a','b','b'),(12,'En la imagen superior se muestra asociaciones color-número. Seleccione las dos imagenes con asociaciones correctas.','image\\\\Atencion\\\\numeroColores1.png','a','image\\\\Atencion\\\\numeroColores1Bien1.png','image\\\\Atencion\\\\numeroColores1Bien2.png','image\\\\Atencion\\\\numeroColores1Mal1.png','image\\\\Atencion\\\\numeroColores1Mal2.png',2,'N','S','S','N','N','a','a','b','b'),(13,'En la imagen superior se muestra asociaciones color-número. Seleccione las dos imagenes con asociaciones correctas.','image\\\\Atencion\\\\numeroColores2.png','a','image\\\\Atencion\\\\numeroColores2Bien1.png','image\\\\Atencion\\\\numeroColores2Bien2.png','image\\\\Atencion\\\\numeroColores2Mal1.png','image\\\\Atencion\\\\numeroColores2Mal2.png',2,'N','S','S','N','N','a','a','b','b'),(14,'De los números del 1 al 8 cuales faltan en la imagen superior?','image\\\\Atencion\\\\numeros3.png','a','image\\\\Atencion\\\\numeros3Bien1.png','image\\\\Atencion\\\\numeros3Bien2.png','image\\\\Atencion\\\\numeros3Mal1.png','image\\\\Atencion\\\\numeros3Mal2.png',2,'N','S','S','N','N','a','a','b','b'),(15,'De los números del 0 al 9 cuales faltan en la imagen superior?','image\\\\Atencion\\\\numeros4.png','a','image\\\\Atencion\\\\numero0.png','image\\\\Atencion\\\\numero4.png','image\\\\Atencion\\\\numero9.png','image\\\\Atencion\\\\numero7.png',2,'N','S','S','N','N','a','a','b','b'),(16,'De los números del 0 al 9 cuales faltan en la imagen superior?','image\\\\Atencion\\\\numeros5.png','a','image\\\\Atencion\\\\numero1.png','image\\\\Atencion\\\\numero6.png','image\\\\Atencion\\\\numero0.png','image\\\\Atencion\\\\numero5.png',2,'N','S','S','N','N','a','a','b','b'),(17,'De los números del 0 al 9 cuales faltan en la imagen superior?','image\\\\Atencion\\\\numeros6.png','a','image\\\\Atencion\\\\numero2.png','image\\\\Atencion\\\\numero9.png','image\\\\Atencion\\\\numero1.png','image\\\\Atencion\\\\numero0.png',2,'N','S','S','N','N','a','a','b','b'),(18,'De los números del 0 al 9 cuales faltan en la imagen superior?','image\\\\Atencion\\\\numeros7.png','a','image\\\\Atencion\\\\numero5.png','image\\\\Atencion\\\\numero8.png','image\\\\Atencion\\\\numero0.png','image\\\\Atencion\\\\numero7.png',2,'N','S','S','N','N','a','a','b','b'),(19,'Seleccione los personajes que aparecen en la imagen superior','image\\\\Atencion\\\\losSimpsons.jpg','a','image\\\\Atencion\\\\homero.jpg','image\\\\Atencion\\\\bart.png','image\\\\Atencion\\\\milhouse.png','image\\\\Atencion\\\\rafa.jpg',3,'N','S','S','N','N','a','a','b','b'),(20,'Seleccione los personajes que aparecen en la imagen superior','image\\\\Atencion\\\\looneyTunes.jpg','a','image\\\\Atencion\\\\BugsBunny.png','image\\\\Atencion\\\\Sylvester.png','image\\\\Atencion\\\\headShot.png','image\\\\Atencion\\\\pepe.png',3,'N','S','S','N','N','a','a','b','b'),(21,'Seleccione los personajes que aparecen en la imagen superior','image\\\\Atencion\\\\Supersonicos.jpg','a','image\\\\Atencion\\\\cometin.png','image\\\\Atencion\\\\perroSuper.jpg','image\\\\Atencion\\\\robotina.jpg','image\\\\Atencion\\\\Wally_Gator.png',3,'N','S','S','N','N','a','a','b','b'),(22,'Seleccione los personajes que aparecen en la imagen superior','image\\\\Atencion\\\\ScoobyDoo.jpg','a','image\\\\Atencion\\\\ScoobyDoo.png','image\\\\Atencion\\\\Shaggy.png','image\\\\Atencion\\\\bart.png','image\\\\Atencion\\\\BugsBunny.png',3,'N','S','S','N','N','a','a','b','b'),(23,'Seleccione todos los elementos que puedas encontrar en el sitio de la fotografia superior. (Comedor)','image\\\\Atencion\\\\comedor.jpg','a','image\\\\Atencion\\\\sillaComedor.png','image\\\\Atencion\\\\plato1.png','image\\\\Atencion\\\\tina1.png','image\\\\Atencion\\\\gato1.png',3,'N','S','N','N','N','a','b','b','b'),(24,'Seleccione todas las imagenes que correspondan al medio de transporte que se ve en la imagen superior','image\\\\Atencion\\\\avion.jpg','a','image\\\\Atencion\\\\helicoptero.jpg','image\\\\Atencion\\\\globo.png','image\\\\Atencion\\\\bus.jpg','image\\\\Atencion\\\\moto.png',3,'N','S','S','N','N','a','a','b','b'),(25,'Seleccione todas las imagenes que correspondan a la misma especie del animal mostrado en la imagen superior','image\\\\Atencion\\\\gato3.png','a','image\\\\Atencion\\\\gato2.png','image\\\\Atencion\\\\gato1.png','image\\\\Atencion\\\\perro1.png','image\\\\Atencion\\\\dalmata1.png',3,'N','S','S','N','N','a','a','b','b'),(26,'Seleccione todas las imagenes que correspondan al elemento mostrado en la imagen superior','image\\\\Atencion\\\\pc.png','a','image\\\\Atencion\\\\mouse.png','image\\\\Atencion\\\\teclado.png','image\\\\Atencion\\\\vaso.png','image\\\\Atencion\\\\planta.png',3,'N','S','S','N','N','a','a','b','b'),(27,'Seleccione los dos números que más se repiten en la imagen superior','image\\\\Atencion\\\\numerosRepetidos1.png','a','image\\\\Atencion\\\\numero1.png','image\\\\Atencion\\\\numero4.png','image\\\\Atencion\\\\numero7.png','image\\\\Atencion\\\\numero3.png',4,'N','S','S','N','N','a','a','b','b'),(28,'Seleccione los dos números que menos se repiten en la imagen superior','image\\\\Atencion\\\\numerosRepetidos1.png','a','image\\\\Atencion\\\\numero2.png','image\\\\Atencion\\\\numero3.png','image\\\\Atencion\\\\numero4.png','image\\\\Atencion\\\\numero1.png',4,'N','S','S','N','N','a','a','b','b'),(29,'Seleccione las dos letras que más se repiten en la imagen superior','image\\\\Atencion\\\\numerosRepetidos2.png','a','image\\\\Atencion\\\\letraA.png','image\\\\Atencion\\\\letraI.png','image\\\\Atencion\\\\letraL.png','image\\\\Atencion\\\\letraN.png',4,'N','S','S','N','N','a','a','b','b'),(30,'Seleccione las imagenes que menos se repiten en la imagen superior','image\\\\Atencion\\\\numerosRepetidos3.png','a','image\\\\Atencion\\\\numero1.png','image\\\\Atencion\\\\letraL.png','image\\\\Atencion\\\\letraA.png','image\\\\Atencion\\\\letraN.png',4,'N','S','S','N','N','a','a','b','b'),(31,'En la imagen superior se muestra asociaciones color-número. Seleccione las dos imagenes con asociaciones correctas.','image\\\\Atencion\\\\numeroColores3.png','a','image\\\\Atencion\\\\numeroColores3Bien1.png','image\\\\Atencion\\\\numeroColores3Bien2.png','image\\\\Atencion\\\\numeroColores3Mal1.png','image\\\\Atencion\\\\numeroColores3Mal2.png',4,'N','S','S','N','N','a','a','b','b'),(32,'En la imagen superior se muestra asociaciones color-número. Seleccione las dos imagenes con asociaciones incorrectas.','image\\\\Atencion\\\\numeroColores3.png','a','image\\\\Atencion\\\\numeroColores3Mal1.png','image\\\\Atencion\\\\numeroColores3Mal2.png','image\\\\Atencion\\\\numeroColores3Bien2.png','image\\\\Atencion\\\\numeroColores3Bien1.png',4,'N','S','S','N','N','a','a','b','b'),(33,'Seleccione los números que aparecen en la imagen superior, pero en orden inverso. Ejemplo 123 ->321','image\\\\Atencion\\\\numerosInversos2.png','a','image\\\\Atencion\\\\numerosInversos2B1.png','image\\\\Atencion\\\\numerosInversos2B2.png','image\\\\Atencion\\\\numerosInversos2M1.png','image\\\\Atencion\\\\numerosInversos2M2.png',4,'N','S','S','N','N','a','a','b','b'),(34,'Seleccione las letras que aparecen en la imagen superior, pero en orden inverso. Ejemplo ABC ->CBA','image\\\\Atencion\\\\letrasInversas.png','a','image\\\\Atencion\\\\letrasInversasB1.png','image\\\\Atencion\\\\letrasInversasB2.png','image\\\\Atencion\\\\letrasInversasM1.png','image\\\\Atencion\\\\letrasInversasM2.png',4,'N','S','S','N','N','a','a','b','b');
/*!40000 ALTER TABLE `PREGUNTAATENCION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PREGUNTACALCULO`
--

DROP TABLE IF EXISTS `PREGUNTACALCULO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PREGUNTACALCULO` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `operacion` varchar(500) DEFAULT NULL,
  `opcionA` varchar(80) DEFAULT NULL,
  `opcionB` varchar(80) DEFAULT NULL,
  `opcionC` varchar(80) DEFAULT NULL,
  `opcionD` varchar(80) DEFAULT NULL,
  `nivelPredeterminado` int(5) DEFAULT NULL,
  `personalizado` varchar(1) DEFAULT NULL,
  `correctaA` varchar(1) DEFAULT NULL,
  `correctaB` varchar(1) DEFAULT NULL,
  `correctaC` varchar(1) DEFAULT NULL,
  `correctaD` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PREGUNTACALCULO`
--

LOCK TABLES `PREGUNTACALCULO` WRITE;
/*!40000 ALTER TABLE `PREGUNTACALCULO` DISABLE KEYS */;
INSERT INTO `PREGUNTACALCULO` VALUES (1,'2+1=','3','2','8','4',1,'N','S','N','N','N'),(2,'1+1=','0','2','7','3',1,'N','N','S','N','N'),(3,'4+3=','3','2','8','7',1,'N','N','N','N','S'),(4,'2+6=','4','8','10','7',1,'N','N','S','N','N'),(5,'9+0=','7','10','9','0',1,'N','N','N','S','N'),(6,'2+2=','3','2','8','4',1,'N','N','N','N','S'),(7,'8-1=','3','2','8','7',1,'N','N','N','N','S'),(8,'5+4=','1','8','9','7',1,'N','N','N','S','N'),(9,'3+3=','3','4','6','9',1,'N','N','N','S','N'),(10,'5+3=','7','2','8','3',1,'N','N','N','S','N'),(11,'12-1=','13','12','11','14',2,'N','N','N','S','N'),(12,'14+2=','13','12','28','16',2,'N','N','N','N','S'),(13,'2X1=','3','7','2','1',2,'N','N','N','S','N'),(14,'11+12=','23','24','1','18',2,'N','S','N','N','N'),(15,'12-11','3','23','18','1',2,'N','N','N','N','S'),(16,'3X3=','6','0','9','14',2,'N','N','N','S','N'),(17,'8/2=','16','4','6','10',2,'N','N','S','N','N'),(18,'14+8=','22','6','28','14',2,'N','S','N','N','N'),(19,'14+18=','33','35','4','32',2,'N','N','N','N','S'),(20,'9+19=','29','28','18','27',2,'N','N','S','N','N'),(21,'41-21=','29','21','20','19',2,'N','N','N','S','N'),(22,'5X3=','2','8','15','17',3,'N','N','N','S','N'),(23,'6X4=','30','16','24','32',3,'N','N','N','S','N'),(24,'50/10=','50','10','5','11',3,'N','N','N','S','N'),(25,'121+4=','121','117','125','126',3,'N','N','N','S','N'),(26,'105-9=','98','114','96','95',3,'N','N','N','S','N'),(27,'35/5=','35','8','7','5',3,'N','N','N','S','N'),(28,'84/2=','41','86','42','36',3,'N','N','N','S','N'),(29,'10X10=','110','10','100','111',3,'N','N','N','S','N'),(30,'131+74=','215','105','205','206',3,'N','N','N','S','N'),(31,'11/11=','0','11','1','2',3,'N','N','N','S','N'),(32,'15X15=','30','215','225','205',4,'N','N','N','S','N'),(33,'55/5=','10','15','11','9',4,'N','N','N','S','N'),(34,'125+342=','477','468','467','465',4,'N','N','N','S','N'),(35,'12X12=','146','136','144','157',4,'N','N','N','S','N'),(36,'148-148=','1','296','0','10',4,'N','N','N','S','N'),(37,'132/3=','135','12','44','48',4,'N','N','N','S','N'),(38,'30X20=','736','660','600','746',4,'N','N','N','S','N'),(39,'530/10=','17','70','53','37',4,'N','N','N','S','N'),(40,'131+740=','781','751','871','851',4,'N','N','N','S','N'),(41,'214+328=','532','522','542','552',4,'N','N','N','S','N');
/*!40000 ALTER TABLE `PREGUNTACALCULO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PREGUNTAFORMAS`
--

DROP TABLE IF EXISTS `PREGUNTAFORMAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PREGUNTAFORMAS` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(500) DEFAULT NULL,
  `imagen` varchar(1500) DEFAULT NULL,
  `opcionA` varchar(80) DEFAULT NULL,
  `opcionB` varchar(80) DEFAULT NULL,
  `opcionC` varchar(80) DEFAULT NULL,
  `opcionD` varchar(80) DEFAULT NULL,
  `nivelPredeterminado` int(5) DEFAULT NULL,
  `personalizado` varchar(1) DEFAULT NULL,
  `correctaA` varchar(1) DEFAULT NULL,
  `correctaB` varchar(1) DEFAULT NULL,
  `correctaC` varchar(1) DEFAULT NULL,
  `correctaD` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PREGUNTAFORMAS`
--

LOCK TABLES `PREGUNTAFORMAS` WRITE;
/*!40000 ALTER TABLE `PREGUNTAFORMAS` DISABLE KEYS */;
INSERT INTO `PREGUNTAFORMAS` VALUES (1,'Elige la silueta que no aparece en la imagen','image\\\\Formas\\\\forma1.png','image\\\\Formas\\\\forma1.1.png','image\\\\Formas\\\\forma1.2.png','image\\\\Formas\\\\forma1.3.png','image\\\\Formas\\\\forma1.4.png',1,'N','N','S','N','N'),(2,'Elige la imagen con igual silueta','image\\\\Formas\\\\forma2.png','image\\\\Formas\\\\forma2.1.png','image\\\\Formas\\\\forma2.4.png','image\\\\Formas\\\\forma2.3.png','image\\\\Formas\\\\forma2.2.png',1,'N','N','S','N','N'),(3,'Elige la silueta que no aparece mezclada con las siluetas que se muestrean en la imagen superior','image\\\\Formas\\\\formas3.png','image\\\\Formas\\\\formas3M1.png','image\\\\Formas\\\\formas3C1.png','image\\\\Formas\\\\formas3M2.png','image\\\\Formas\\\\formas3M3.png',1,'N','N','S','N','N'),(4,'Elige la silueta que no aparece mezclada con las siluetas que se muestrean en la imagen superior','image\\\\Formas\\\\formas4.png','image\\\\Formas\\\\formaNube.png','image\\\\Formas\\\\formaArco.png','image\\\\Formas\\\\formaCorrecto.png','image\\\\Formas\\\\formabandera.png',1,'N','S','N','N','N'),(5,'Elige la silueta que no aparece mezclada con las siluetas que se muestrean en la imagen superior','image\\\\Formas\\\\formas5.png','image\\\\Formas\\\\formaEstrella4.png','image\\\\Formas\\\\formaEstrella2.png','image\\\\Formas\\\\formaCorrecto.png','image\\\\Formas\\\\formaCuadradoRed.png',1,'N','S','N','N','N'),(6,'Elige la silueta que no aparece mezclada con las siluetas que se muestrean en la imagen superior','image\\\\Formas\\\\formas6.png','image\\\\Formas\\\\formaTriangulo.png','image\\\\Formas\\\\formaOvalo.png','image\\\\Formas\\\\formaCirculo.png','image\\\\Formas\\\\formaEstrella4.png',1,'N','S','N','N','N'),(7,'Elige la silueta que no aparece mezclada con las siluetas que se muestrean en la imagen superior','image\\\\Formas\\\\formas7.png','image\\\\Formas\\\\formaTriangulo2.png','image\\\\Formas\\\\formaDiamante.png','image\\\\Formas\\\\formaPentagono.png','image\\\\Formas\\\\formaHexagono.png',1,'N','S','N','N','N'),(8,'Elige la silueta que no aparece mezclada con las siluetas que se muestrean en la imagen superior','image\\\\Formas\\\\formas8.png','image\\\\Formas\\\\formaEstrella2.png','image\\\\Formas\\\\formaFlecha.png','image\\\\Formas\\\\formaFlecha2.png','image\\\\Formas\\\\formaEstrella3.png',1,'N','S','N','N','N'),(9,'Elige la silueta del animal que no tiene relación con la imagen superior','image\\\\Formas\\\\alce.png','image\\\\Formas\\\\delfin.png','image\\\\Formas\\\\burro.png','image\\\\Formas\\\\caballo.png','image\\\\Formas\\\\cabra.png',2,'N','S','N','N','N'),(10,'Elige la silueta del animal que no tiene relación con la imagen superior','image\\\\Formas\\\\arana.png','image\\\\Formas\\\\pescado.png','image\\\\Formas\\\\arana2.png','image\\\\Formas\\\\lagartija.png','image\\\\Formas\\\\hormiga.png',2,'N','S','N','N','N'),(11,'Elige la silueta del animal que no tiene relación con la imagen superior','image\\\\Formas\\\\ardilla.png','image\\\\Formas\\\\buho.png','image\\\\Formas\\\\lobo.png','image\\\\Formas\\\\gato.png','image\\\\Formas\\\\gallina.png',2,'N','S','N','N','N'),(12,'Elige la silueta del animal que no tiene relación con la imagen superior','image\\\\Formas\\\\cerdo.png','image\\\\Formas\\\\pescado2.png','image\\\\Formas\\\\rinoceronte.png','image\\\\Formas\\\\vaca.png','image\\\\Formas\\\\llama.png',2,'N','S','N','N','N'),(13,'Elige la silueta del animal que no tiene relación con la imagen superior','image\\\\Formas\\\\delfin.png','image\\\\Formas\\\\pollito.png','image\\\\Formas\\\\estrellaMar.png','image\\\\Formas\\\\leonMarino.png','image\\\\Formas\\\\pescado.png',2,'N','S','N','N','N'),(14,'Elige la silueta del animal que no tiene relación con la imagen superior','image\\\\Formas\\\\mico.png','image\\\\Formas\\\\pato.png','image\\\\Formas\\\\mico2.png','image\\\\Formas\\\\mono.png','image\\\\Formas\\\\oso.png',2,'N','S','N','N','N'),(15,'Elige la silueta del animal que no tiene relación con la imagen superior','image\\\\Formas\\\\hormiga.png','image\\\\Formas\\\\gallina.png','image\\\\Formas\\\\arana.png','image\\\\Formas\\\\arana2.png','image\\\\Formas\\\\cienPies.png',2,'N','S','N','N','N'),(16,'Elige la silueta del animal que no tiene relación con la imagen superior','image\\\\Formas\\\\colibri.png','image\\\\Formas\\\\oso.png','image\\\\Formas\\\\buho.png','image\\\\Formas\\\\libelula.png','image\\\\Formas\\\\abeja.png',2,'N','S','N','N','N'),(17,'Elige la silueta del animal que no tiene relación con la imagen superior','image\\\\Formas\\\\alce.png','image\\\\Formas\\\\perro.png','image\\\\Formas\\\\cabra.png','image\\\\Formas\\\\elefante.png','image\\\\Formas\\\\toro.png',2,'N','S','N','N','N'),(18,'Elige la silueta que no hace parte de la imagen superior','image\\\\Formas\\\\formas9.png','image\\\\Formas\\\\formabandera.png','image\\\\Formas\\\\formaCuadrado.png','image\\\\Formas\\\\formaArco.png','image\\\\Formas\\\\abeja.png',3,'N','S','N','N','N'),(19,'Elige la silueta que no hace parte de la imagen superior','image\\\\Formas\\\\formas10.png','image\\\\Formas\\\\ardilla.png','image\\\\Formas\\\\delfin.png','image\\\\Formas\\\\estrellaMar.png','image\\\\Formas\\\\formaEstrella4.png',3,'N','S','N','N','N'),(20,'Elige la silueta que no hace parte de la imagen superior','image\\\\Formas\\\\formas11.png','image\\\\Formas\\\\pollito.png','image\\\\Formas\\\\ardilla.png','image\\\\Formas\\\\cerdo.png','image\\\\Formas\\\\colibri.png',3,'N','S','N','N','N'),(21,'Elige la silueta que no hace parte de la imagen superior','image\\\\Formas\\\\formas12.png','image\\\\Formas\\\\formaGlobo.png','image\\\\Formas\\\\formaNube.png','image\\\\Formas\\\\arana.png','image\\\\Formas\\\\arana2.png',3,'N','S','N','N','N'),(22,'Elige la silueta que no hace parte de la imagen superior','image\\\\Formas\\\\formas13.png','image\\\\Formas\\\\elefante.png','image\\\\Formas\\\\alce.png','image\\\\Formas\\\\burro.png','image\\\\Formas\\\\cabra.png',3,'N','S','N','N','N'),(23,'Elige la silueta que no hace parte de la imagen superior','image\\\\Formas\\\\formas14.png','image\\\\Formas\\\\oso.png','image\\\\Formas\\\\caballo.png','image\\\\Formas\\\\llama.png','image\\\\Formas\\\\leonMarino.png',3,'N','S','N','N','N'),(24,'Elige la silueta que no hace parte de la imagen superior','image\\\\Formas\\\\formas15.png','image\\\\Formas\\\\tigre1.png','image\\\\Formas\\\\formaCorrecto.png','image\\\\Formas\\\\gato.png','image\\\\Formas\\\\lobo.png',3,'N','S','N','N','N'),(25,'Elige la silueta que no hace parte de la imagen superior','image\\\\Formas\\\\formas16.png','image\\\\Formas\\\\formaHexagono.png','image\\\\Formas\\\\pollito.png','image\\\\Formas\\\\formaCirculo.png','image\\\\Formas\\\\formaPentagono.png',3,'N','S','N','N','N'),(26,'Elige la silueta que hace parte de la imagen superior','image\\\\Formas\\\\formas17.png','image\\\\Formas\\\\burro.png','image\\\\Formas\\\\alce.png','image\\\\Formas\\\\rinoceronte.png','image\\\\Formas\\\\toro.png',4,'N','S','N','N','N'),(27,'Elige la silueta que hace parte de la imagen superior','image\\\\Formas\\\\formas18.png','image\\\\Formas\\\\rinoceronte.png','image\\\\Formas\\\\elefante.png','image\\\\Formas\\\\mico.png','image\\\\Formas\\\\jirafa.png',4,'N','S','N','N','N'),(28,'Elige la silueta que hace parte de la imagen superior','image\\\\Formas\\\\formas19.png','image\\\\Formas\\\\mico.png','image\\\\Formas\\\\alce.png','image\\\\Formas\\\\oso.png','image\\\\Formas\\\\pescado2.png',4,'N','S','N','N','N'),(29,'Elige la silueta que hace parte de la imagen superior','image\\\\Formas\\\\formas20.png','image\\\\Formas\\\\osoHormiguero.png','image\\\\Formas\\\\perro.png','image\\\\Formas\\\\estrellaMar.png','image\\\\Formas\\\\caballo.png',4,'N','S','N','N','N'),(30,'Elige la silueta que hace parte de la imagen superior','image\\\\Formas\\\\formas21.png','image\\\\Formas\\\\jirafa.png','image\\\\Formas\\\\gallina.png','image\\\\Formas\\\\cerdo.png','image\\\\Formas\\\\hormiga.png',4,'N','S','N','N','N'),(31,'Elige la silueta que hace parte de la imagen superior','image\\\\Formas\\\\formas22.png','image\\\\Formas\\\\elefante.png','image\\\\Formas\\\\jirafa.png','image\\\\Formas\\\\pollito.png','image\\\\Formas\\\\pato.png',4,'N','S','N','N','N'),(32,'Elige la silueta que hace parte de la imagen superior','image\\\\Formas\\\\formas23.png','image\\\\Formas\\\\mono.png','image\\\\Formas\\\\pescado.png','image\\\\Formas\\\\mico2.png','image\\\\Formas\\\\abeja.png',4,'N','S','N','N','N'),(33,'Elige la silueta que hace parte de la imagen superior','image\\\\Formas\\\\formas24.png','image\\\\Formas\\\\lagartija.png','image\\\\Formas\\\\hormiga.png','image\\\\Formas\\\\buho.png','image\\\\Formas\\\\elefante.png',4,'N','S','N','N','N');
/*!40000 ALTER TABLE `PREGUNTAFORMAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PREGUNTAGALERIA`
--

DROP TABLE IF EXISTS `PREGUNTAGALERIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PREGUNTAGALERIA` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(500) DEFAULT NULL,
  `imagen` varchar(1500) DEFAULT NULL,
  `informacion` varchar(3000) DEFAULT NULL,
  `opcionA` varchar(80) DEFAULT NULL,
  `opcionB` varchar(80) DEFAULT NULL,
  `opcionC` varchar(80) DEFAULT NULL,
  `opcionD` varchar(80) DEFAULT NULL,
  `nivelPredeterminado` int(5) DEFAULT NULL,
  `personalizado` varchar(1) DEFAULT NULL,
  `correctaA` varchar(1) DEFAULT NULL,
  `correctaB` varchar(1) DEFAULT NULL,
  `correctaC` varchar(1) DEFAULT NULL,
  `correctaD` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PREGUNTAGALERIA`
--

LOCK TABLES `PREGUNTAGALERIA` WRITE;
/*!40000 ALTER TABLE `PREGUNTAGALERIA` DISABLE KEYS */;
INSERT INTO `PREGUNTAGALERIA` VALUES (1,'¿Quién es este personaje?','image\\\\Galeria\\\\simonBolivar.jpg','Contribuyó a inspirar y concretar de manera decisiva la independencia de las actuales Bolivia, Colombia, Ecuador, Panamá, Venezuela y la reorganización del Perú. Tomado de: wikipedia','Simon Bolivar','Yo','El chavo del ocho','Mi papá',1,'N','S','N','N','N'),(2,'¿Donde queda la Torre Eiffel?','image\\\\Galeria\\\\torreEifell.jpg','Construida en 1889 para la Exposición Universal, la Torre Eiffel se convirtió en el principal símbolo de esta ciudad y es el monumento más visitado del mundo. Tomado de: www.paris.es/torre-eiffel','Bogotá','Madrid','Paris','Roma',1,'N','N','N','S','N'),(3,'¿Como se llama este artista Colombiano?','image\\\\Galeria\\\\FernandoBotero.jpg','Pintor y escultor colombiano. Sus obras tiene entre sus rasgos más fácilmente identificables el agrandamiento o la deformación de los volúmenes. Tomado de www.biografiasyvidas.com','Pablo Picasso','Fernando Botero','Juan Pablo Montoya','Nairo Quintana',1,'N','N','S','N','N'),(4,'¿Como se llama este personaje?','image\\\\Galeria\\\\FidelCastro.jpg','Militar, revolucionario, estadista y político cubano. Fue mandatario de su país como presidente entre 1976 y 2008. Tomado de: wikipedia','Alvaro Uribe','Fernando Gaviria','Raul Castro','Fidel Castro',1,'N','N','N','N','S'),(5,'¿Quién es este este escritor Colombiano?','image\\\\Galeria\\\\GabrielGarcia.jpg','Fue un escritor, guionista, editor y periodista colombiano. Está relacionado de manera inherente con el realismo mágico y su obra más conocida, la novela Cien años de soledad. Tomado de: wikipedia','Gustavo Bolivar','Gabriel Garcia M.','Condorito','Francisco de Paula',1,'N','N','S','N','N'),(6,'¿Quién es este personaje?','image\\\\Galeria\\\\Galan.jpg','Político colombiano. Proclamado candidato presidencial por la convención del partido liberal, el 18 de agosto de 1989, en plena campaña, sufrió un atentado mortal en la plaza de Soacha, al sur de Bogotá. Tomado de www.biografiasyvidas.com','Juan Gabriel','Fernando Galán','Luis Carlos Galán','Enrique Peñalosa',1,'N','N','N','S','N'),(7,'Esta reconocida monja ayudo a muchos en su vida. ¿Como se llama?','image\\\\Galeria\\\\teresaCalcuta.jpg','Fundó la congregación de las Misioneras de la Caridad en Calcuta en 1950. Durante más de 45 años atendió a pobres, enfermos, huérfanos y moribundos. Tomado de wikipedia','Shakira','Teresa de Calcuta','Policarpa','Juana de Arco',1,'N','N','S','N','N'),(8,'¿Como se llama este conocido militante de la revolución cubana?','image\\\\Galeria\\\\CheGuevara.jpg','Fue un médico, político, militar, escritor y periodista y uno de los ideólogos y comandantes de la Revolución cubana. Tomado de wikipedia','Ernesto Che Guevara','Hugo Chávez','Nicolas Maduro','Simón Bolivar',1,'N','S','N','N','N'),(9,'¿Como es el nombre de este famoso personaje animado?','image\\\\Galeria\\\\MickeyMouse.jpg','Emblema de la compañía Disney. Creado el 18 de noviembre de 1928. Tomado de wikipedia','Mickey Mouse','Minnie Mouse','Pluto','Jerry',1,'N','S','N','N','N'),(10,'¿Como es el nombre de este gran físico?','image\\\\Galeria\\\\AlbertEinstein.jpg','Fue un físico alemán de origen judío, nacionalizado después suizo, austriaco y estadounidense. Es considerado el científico más conocido y popular del siglo XX. Tomado de wikipedia','Albert Einstein','Manuel Patarroyo','Bohr','Guye',2,'N','S','N','N','N'),(11,'¿Cuál es el nombre de esta Actriz Colombiana?','image\\\\Galeria\\\\VickyHernandez.jpg','Es una destacada actriz colombiana de teatro, cine y televisión de amplia trayectoria profesiona, actuo en Azúcar, Romeo y Buseta, Mujeres asesinas, entre otros. Tomado de wikipedia','Vicky Hernández','Shakira','Margarita Rosa','Teresa Gutiérrez',2,'N','S','N','N','N'),(12,'¿Como se llamaba esta serie estadounidense?','image\\\\Galeria\\\\miBellaGenio.jpg','Es una serie de televisión estadounidense que fue emitida por la cadena NBC a lo largo de cinco temporadas, entre 1965 y 1970. Tomado de wikipedia','Friends','Pepa Pig','Mi Bella Genio','La niñera',2,'N','N','N','S','N'),(13,'Esta es una de las maravillas del mundo. ¿Cuál es su nombre?','image\\\\Galeria\\\\TajMahal.jpg','Es un mausoleo construido entre 1632 y 1653 en la ciudad de Agra, estado de Uttar Pradesh (India), a orillas del río Yamuna. Tomado de wikipedia','Burj Khalifa','Las pirámides de Egito','Taj Mahal','Chichén Itzá',2,'N','N','N','S','N'),(14,'Esta muralla mide alrededor de 7000 km. ¿Donde esta ubicada?','image\\\\Galeria\\\\murallaChina.jpg','Su construcción se extendió en el tiempo entre los siglos 7 y 8 a. de C, la muralla llegó a tener 7300 km de longitud. Tomado de 21wonders.es','Colombia','Corea del Norte','Japón','China',2,'N','N','N','N','S'),(15,'Uno de los monumentos más reconocidos en el mundo. ¿Como se llama?','image\\\\Galeria\\\\estatuaLibertad.jpg','Es una antigua fortificación construida y reconstruida entre el siglo V a. C. y el siglo XVI (Edad Moderna) para proteger la frontera norte del Imperio chino durante las sucesivas dinastías imperiales de los ataques de los nómadas xiongnu de Mongolia y Manchuria. Tomado de wikipedia.','Estatua de la esperanza','Obelisco','New York','Estatua de la libertad',2,'N','N','N','N','S'),(16,'Una de las series de televisión más conocidas. ¿Como se llama este personaje?','image\\\\Galeria\\\\alf.jpg','Un extraterrestre. Nació el 28 de octubre de 1756, en la región Lower East del planeta Melmac, que a su vez estaba localizado 6 pársecs más allá del supercúmulo Hydra-Centaurus, tenía cielo verde, pasto azul y agua naranja. Tomado de wikipedia','Oliver','Alf','Mickey Mouse','Melmac',2,'N','N','S','N','N'),(17,'Para el no habia nada imposible. ¿Como se llama este personaje?','image\\\\Galeria\\\\macgyver.jpg','Es un agente al servicio de la Fundación Phoenix que siempre resuelve todos los problemas usando su inteligencia superior y sus amplios conocimientos técnicos. Tomado de wikipedia','Murdoc','Pete Thornton','Macgyver','Harry Jackson',2,'N','N','N','S','N'),(18,'Un gran activista practicante de la desobediencia civil no violenta. ¿Como se llama este personaje?','image\\\\Galeria\\\\Gandi.jpg','Fue el dirigente más destacado del Movimiento de independencia indio contra el Raj británico, para lo que practicó la desobediencia civil no violenta, además de pacifista, político, pensador y abogado hinduista indio. Tomado de wikipedia','Kim Jong-un','Hugo Chavéz','Martin Lutero','Mahatma Gandhi',2,'N','N','N','N','S'),(19,'¿Como se llama este famoso personaje animado de una de las peliculas hechas por Walt Disney Pictures?','image\\\\Galeria\\\\dumbo.jpg','Es un elefante que es ridiculizado por sus grandísimas orejas, aunque descubre que puede volar usándolas como alas. Tomado de wikipedia','Dumbo','Bambi','Melman','Pato Donald',2,'N','S','N','N','N'),(20,'Un actor polifacético. ¿Cual es su nombre?','image\\\\Galeria\\\\robinsonDiaz.jpg','Es un actor colombiano de teatro, cine y televisión, actúo en Pecados capitales,El Cartel de los Sapos, La pena máxima, entre otros. Tomado de wikipedia','Gordo Benjumea','Robinson Díaz','Jorge Alfredo Varga','Julian Arango',2,'N','N','S','N','N'),(21,'¿Como es el nombre de este sitio turístico?','image\\\\Galeria\\\\chichenitza.png','Es uno de los principales sitios arqueológicos de la península de Yucatán, en México. Vestigio importante y renombrado de la civilización maya, las edificaciones principales que ahí perduran corresponden al periodo denominado clásico tardío o postclásico temprano (800-1100 dC.) Tomado de wikipedia','Chichén Itzá','Pirámides de Egipto','Pirámide de Guiza','Taj Mahal',3,'N','S','N','N','N'),(22,'¿Cual es el nombre de este rascacielos?','image\\\\Galeria\\\\Burjkhalifa.png','Es un rascacielos ubicado en Dubái (Emiratos Árabes Unidos). Con 828 metros de altura, es la estructura más alta de la que se tiene registro en la historia. Tomado de wikipedia','Khawr Dubayy','Casa Blanca','Burj Al Arab','Burj Khalifa',3,'N','N','N','N','S'),(23,'¿Cuál es el nombre de este reconocido personaje animado?','image\\\\Galeria\\\\pluto.png','Es un personaje de ficción que se hizo famoso mediante los cortos de animación de The Walt Disney Company. Generalmente caracteriza al perro de Mickey Mouse, aunque también ha sido la mascota del Pato Donald y de Tribilín o Goofy. Tomado de wikipedia','Tom','Scooby-Doo','Coraje','Pluto',3,'N','N','N','N','S'),(24,'¿Como se llama este reconocido parque?','image\\\\Galeria\\\\centralPatk.jpg','Es un parque urbano público situado en el distrito metropolitano de Manhattan, en la ciudad de Nueva York, Estados Unidos. Tomado de wikipedia','Parque Simón Bolivar','Nueva York','Manhattan','Central Park',3,'N','N','N','N','S'),(25,'¿Como se llama esta torre?','image\\\\Galeria\\\\TorrePisa.jpg','La torre comenzó a inclinarse tan pronto como se inició su construcción en agosto de 1173. Su altura es de 55,7 a 55,8 metros desde la base y la inclinación de unos 4°, extendiéndose 3,9 m de la vertical. Tomado de wikipedia','Italia','Arco Trinfo','Torres Gemelas','Torre de Pisa',3,'N','N','N','N','S'),(26,'¿Cuál era el nombre de estos dos edificios?','image\\\\Galeria\\\\torresGemelas.jpg','Ubicadas en Bajo Manhattan, ciudad de Nueva York, Estados Unidos, inauguradas el 4 de abril de 1973, y destruidas en los atentados del 11 de septiembre de 2001. Tomado de wikipedia','Burj Khalifa','Edificio Empire State','Torre de pisa','Torres Gemelas',3,'N','N','N','N','S'),(27,'¿Cuál es el nombre de esta estructura?','image\\\\Galeria\\\\bigben.jpg','Situado en el lado noroeste del Palacio de Westminster, la sede del Parlamento del Reino Unido, en Londres. Tomado de wikipedia','London Eye','Palacio de Versalles','Palacio de Westminster','Big Ben',3,'N','N','N','N','S'),(28,'¿Como se llama este edificio?','image\\\\Galeria\\\\torreColpatria.jpg','Es un rascacielos situado en Bogotá, en el sector de San Diego. También hace parte del Centro Internacional de Bogotá. Con sus 50 pisos, es el segundo edificio más alto de la ciudad así como uno de sus iconos. Tomado de wikipedia','Bacata','Casa de Nariño','Torres Gemelas','Torre Colpatria',3,'N','N','N','N','S'),(29,'¿Cuál es el nombre de esta obra de arte?','image\\\\Galeria\\\\monalisa.jpg','Es una obra pictórica del pintor renacentista italiano Leonardo da Vinci. Tomado de wikipedia','El grito','La María','Leonardo da Vinci','La Gioconda',3,'N','N','N','N','S'),(30,'¿Cuál es el nombre de este personaje?','image\\\\Galeria\\\\Chaplin.jpg','Fue un actor, humorista, compositor, productor, guionista, director, escritor y editor británico. Adquirió gran popularidad en el cine mudo gracias a las múltiples películas que realizó con su personaje Charlot. Tomado de wikipedia','Charles Chaplin','Piolin','Cantinflas','Elvis Presley',4,'N','S','N','N','N'),(31,'¿Cuál es el nombre de este expresidente de los Estados Unidos?','image\\\\Galeria\\\\abrahamlincoln.jpg','Fue un político y abogado estadounidense que ejerció como decimosexto presidente de los Estados Unidos de América desde marzo de 1861 hasta su asesinato en abril de 1865. Tomado de wikipedia','Abraham Lincoln','George Washington','James Madison','Thomas Jefferson',4,'N','S','N','N','N'),(32,'¿Cuál es el nombre de este famoso cantante?','image\\\\Galeria\\\\presley.jpg','Fue un cantante y actor estadounidense, uno de los más populares del siglo XX. Se hace referencia a él como «el Rey del rock and roll». Tomado de wikipedia','Elvis Presley','Justin Bieber','Charles Chaplin','Thomas Jefferson',4,'N','S','N','N','N'),(33,'¿Cuál es el nombre de este personaje?','image\\\\Galeria\\\\cantinflas.jpg','Fue un actor y comediante mexicano, ganador del Globo de Oro en 1956. Debido a su gran trayectoria cinematográfica, se constituye como uno de los comediantes más grandes y recordados de habla hispana y como el más reconocido comediante mexicano de todos los tiempos. Tomado de wikipedia','Cantinflas','Charles Chaplin','El chavo del 8','Elvis Presley',4,'N','S','N','N','N'),(34,'¿Cuál es el nombre de esta famosa actriz?','image\\\\Galeria\\\\Monroe.jpg','Fue una actriz de cine estadounidense y una de las más populares del siglo XX, considerada como un icono pop y un símbolo sexual. Tomado de wikipedia','Marilyn Monroe','Marilyn Manson','Maddona','Shakira',4,'N','S','N','N','N'),(35,'¿Cuál es el nombre de esta personaje?','image\\\\Galeria\\\\Condorito.png','Es una serie de historieta cómica chilena, protagonizada por el personaje homónimo. Publicada por primera vez el 6 de agosto en 1949 por Pepo, con los años se convirtió en la más popular historieta en Chile, habiendo sido distribuida además en Latinoamérica. Tomado de wikipedia','Condorito','Mafalda','Batman','Superman',4,'N','S','N','N','N'),(36,'¿Cuál es el nombre de esta personaje?','image\\\\Galeria\\\\Mafaldayalma.jpg','Es el nombre de una tira de prensa argentina desarrollada por el humorista gráfico Quino de 1964 a 1973, protagonizada por la niña homónima, «espejo de la clase media latinoamericana y de la juventud progresista», que se muestra preocupada por la humanidad y la paz mundial, y se rebela contra el mundo legado por sus mayores. Tomado de wikipedia','Mafalda','Garfield','Gaturro','Superman',4,'N','S','N','N','N'),(37,'¿Cuál es el nombre de esta personaje?','image\\\\Galeria\\\\piolin.png','También conocido en algunos países hispanohablantes por su nombre en inglés Tweety, es un personaje creado por Bob Clampett para la serie de dibujos animados Looney Tunes, de la productora estadounidense Warner Bros. Tomado de wikipedia','Piolín','Silvestre','Tom','Jerry',4,'N','S','N','N','N'),(38,'¿Cuál es el nombre de esta personaje?','image\\\\Galeria\\\\justin.jpg','Apodado «La Voz»,​ fue una de las principales figuras de la música popular del siglo XX y dejó, a través de sus discos y actuaciones en directo, un legado canónico en lo que respecta a la interpretación vocal masculina de esa música. Tomado de wikipedia','Frank Sinatra','Shaggy','Michael Bublé','Bryan Adams',4,'N','S','N','N','N');
/*!40000 ALTER TABLE `PREGUNTAGALERIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PREGUNTAPERCEPCION`
--

DROP TABLE IF EXISTS `PREGUNTAPERCEPCION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PREGUNTAPERCEPCION` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(500) DEFAULT NULL,
  `imagen` varchar(1500) DEFAULT NULL,
  `opcionA` varchar(80) DEFAULT NULL,
  `opcionB` varchar(80) DEFAULT NULL,
  `opcionC` varchar(80) DEFAULT NULL,
  `opcionD` varchar(80) DEFAULT NULL,
  `nivelPredeterminado` int(5) DEFAULT NULL,
  `personalizado` varchar(1) DEFAULT NULL,
  `correctaA` varchar(1) DEFAULT NULL,
  `correctaB` varchar(1) DEFAULT NULL,
  `correctaC` varchar(1) DEFAULT NULL,
  `correctaD` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PREGUNTAPERCEPCION`
--

LOCK TABLES `PREGUNTAPERCEPCION` WRITE;
/*!40000 ALTER TABLE `PREGUNTAPERCEPCION` DISABLE KEYS */;
INSERT INTO `PREGUNTAPERCEPCION` VALUES (1,'Seleccione la imagen que sea exactamente igual','image\\\\Percepcion\\\\circulo1.png','image\\\\Percepcion\\\\circulo1.png','image\\\\Percepcion\\\\circulo2.png','image\\\\Percepcion\\\\circulo3.png','image\\\\Percepcion\\\\circulo4.png',1,'N','S','N','N','N'),(2,'Seleccione la imagen que sea exactamente igual\",\"imagen\":\"image\\\\Percepcion\\\\cuadrado1.png','image\\\\Percepcion\\\\cuadrado1.png','image\\\\Percepcion\\\\cuadrado1.png','image\\\\Percepcion\\\\cuadrado2.png','image\\\\Percepcion\\\\cuadrado3.png','image\\\\Percepcion\\\\cuadrado4.png',1,'N','S','N','N','N'),(3,'Seleccione la imagen que sea exactamente igual','image\\\\Percepcion\\\\corazon1.png','image\\\\Percepcion\\\\trianguloRojo1.png','image\\\\Percepcion\\\\trianguloVerde1.png','image\\\\Percepcion\\\\corazon1.png','image\\\\Percepcion\\\\nube1.png',1,'N','N','N','S','N'),(4,'Seleccione la imagen que sea exactamente igual','image\\\\Percepcion\\\\maleta1.png','image\\\\Percepcion\\\\maleta1.png','image\\\\Percepcion\\\\maleta2.png','image\\\\Percepcion\\\\maleta3.png','image\\\\Percepcion\\\\maleta4.png',1,'N','S','N','N','N'),(5,'Seleccione la imagen que sea exactamente igual','image\\\\Percepcion\\\\balon4.png','image\\\\Percepcion\\\\balon4.png','image\\\\Percepcion\\\\balon1.png','image\\\\Percepcion\\\\balon2.png','image\\\\Percepcion\\\\balon3.png',1,'N','S','N','N','N'),(6,'Seleccione la imagen que sea exactamente igual','image\\\\Percepcion\\\\silla4.png','image\\\\Percepcion\\\\silla4.png','image\\\\Percepcion\\\\silla1.png','image\\\\Percepcion\\\\silla2.png','image\\\\Percepcion\\\\silla3.png',1,'N','S','N','N','N'),(7,'Seleccione la imagen que sea exactamente igual','image\\\\Percepcion\\\\carro1.png','image\\\\Percepcion\\\\carro1.png','image\\\\Percepcion\\\\carro2.png','image\\\\Percepcion\\\\carro3.png','image\\\\Percepcion\\\\carro4.png',1,'N','S','N','N','N'),(8,'Seleccione la imagen que sea exactamente igual','image\\\\Percepcion\\\\casa4.png','image\\\\Percepcion\\\\casa4.png','image\\\\Percepcion\\\\casa1.png','image\\\\Percepcion\\\\casa2.png','image\\\\Percepcion\\\\casa3.png',1,'N','S','N','N','N'),(9,'Seleccione la figura que tiene el mismo tamaño','image\\\\Percepcion\\\\tv2.png','image\\\\Percepcion\\\\tv2.png','image\\\\Percepcion\\\\tv1.png','image\\\\Percepcion\\\\tv3.png','image\\\\Percepcion\\\\tv4.png',2,'N','S','N','N','N'),(10,'Seleccione la figura que tiene el mismo tamaño','image\\\\Percepcion\\\\pc1.png','image\\\\Percepcion\\\\pc1.png','image\\\\Percepcion\\\\pc2.png','image\\\\Percepcion\\\\pc3.png','image\\\\Percepcion\\\\pc4.png',2,'N','S','N','N','N'),(11,'Seleccione la figura que tiene el mismo tamaño','image\\\\Percepcion\\\\nevera2.png','image\\\\Percepcion\\\\nevera2.png','image\\\\Percepcion\\\\nevera1.png','image\\\\Percepcion\\\\nevera3.png','image\\\\Percepcion\\\\nevera4.png',2,'N','S','N','N','N'),(12,'Seleccione la imagen que sea exactamente igual','image\\\\Percepcion\\\\lavadora4.png','image\\\\Percepcion\\\\lavadora4.png','image\\\\Percepcion\\\\lavadora1.png','image\\\\Percepcion\\\\lavadora2.png','image\\\\Percepcion\\\\lavadora3.png',2,'N','S','N','N','N'),(13,'Seleccione la imagen que sea exactamente igual','image\\\\Percepcion\\\\transmilenio1.png','image\\\\Percepcion\\\\transmilenio1.png','image\\\\Percepcion\\\\transmilenio2.png','image\\\\Percepcion\\\\transmilenio3.png','image\\\\Percepcion\\\\transmilenio4.png',2,'N','S','N','N','N'),(14,'Seleccione la imagen que sea exactamente igual','image\\\\Percepcion\\\\cama3.png','image\\\\Percepcion\\\\cama3.png','image\\\\Percepcion\\\\cama1.png','image\\\\Percepcion\\\\cama2.png','image\\\\Percepcion\\\\cama4.png',2,'N','S','N','N','N'),(15,'Seleccione la imagen que sea exactamente igual','image\\\\Percepcion\\\\sofa1.png','image\\\\Percepcion\\\\sofa1.png','image\\\\Percepcion\\\\sofa2.png','image\\\\Percepcion\\\\sofa3.png','image\\\\Percepcion\\\\sofa4.png',2,'N','S','N','N','N'),(16,'Seleccione la imagen que sea exactamente igual','image\\\\Percepcion\\\\avion2.png','image\\\\Percepcion\\\\avion2.png','image\\\\Percepcion\\\\avion1.png','image\\\\Percepcion\\\\avion3.png','image\\\\Percepcion\\\\avion4.png',2,'N','S','N','N','N'),(17,'Elige la figura que al girarla varias veces No corresponde con la figura de la parte superior','image\\\\Percepcion\\\\figura1.png','image\\\\Percepcion\\\\figura1.4.png','image\\\\Percepcion\\\\figura1.2.png','image\\\\Percepcion\\\\figura1.3.png','image\\\\Percepcion\\\\figura1.png',3,'N','S','N','N','N'),(18,'Elige la figura que al girarla varias veces No corresponde con la figura de la parte superior','image\\\\Percepcion\\\\figura2.png','image\\\\Percepcion\\\\figura2.4.png','image\\\\Percepcion\\\\figura2.2.png','image\\\\Percepcion\\\\figura2.3.png','image\\\\Percepcion\\\\figura2.1.png',3,'N','S','N','N','N'),(19,'Elige la figura que al girarla varias veces No corresponde con la figura de la parte superior','image\\\\Percepcion\\\\figura3.png','image\\\\Percepcion\\\\figura3.4.png','image\\\\Percepcion\\\\figura3.2.png','image\\\\Percepcion\\\\figura3.3.png','image\\\\Percepcion\\\\figura3.1.png',3,'N','S','N','N','N'),(20,'Elige la figura que al girarla varias veces No corresponde con la figura de la parte superior','image\\\\Percepcion\\\\figura4.png','image\\\\Percepcion\\\\figura4.4.png','image\\\\Percepcion\\\\figura4.2.png','image\\\\Percepcion\\\\figura4.3.png','image\\\\Percepcion\\\\figura4.1.png',3,'N','S','N','N','N'),(21,'Elige la figura que al girarla varias veces No corresponde con la figura de la parte superior','image\\\\Percepcion\\\\figura5.png','image\\\\Percepcion\\\\figura5.4.png','image\\\\Percepcion\\\\figura5.2.png','image\\\\Percepcion\\\\figura5.3.png','image\\\\Percepcion\\\\figura5.1.png',3,'N','S','N','N','N'),(22,'Elige la figura que al girarla varias veces No corresponde con la figura de la parte superior','image\\\\Percepcion\\\\figura6.png','image\\\\Percepcion\\\\figura6.4.png','image\\\\Percepcion\\\\figura6.2.png','image\\\\Percepcion\\\\figura6.3.png','image\\\\Percepcion\\\\figura6.1.png',3,'N','S','N','N','N'),(23,'Elige la figura que al girarla varias veces No corresponde con la figura de la parte superior','image\\\\Percepcion\\\\figura7.png','image\\\\Percepcion\\\\figura7.4.png','image\\\\Percepcion\\\\figura7.2.png','image\\\\Percepcion\\\\figura7.3.png','image\\\\Percepcion\\\\figura7.1.png',3,'N','S','N','N','N'),(24,'Elige la figura que al girarla varias veces No corresponde con la figura de la parte superior','image\\\\Percepcion\\\\figura8.png','image\\\\Percepcion\\\\figura8.4.png','image\\\\Percepcion\\\\figura8.2.png','image\\\\Percepcion\\\\figura8.3.png','image\\\\Percepcion\\\\figura8.1.png',3,'N','S','N','N','N');
/*!40000 ALTER TABLE `PREGUNTAPERCEPCION` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-23 19:00:45
