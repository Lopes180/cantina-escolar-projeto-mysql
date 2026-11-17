CREATE DATABASE  IF NOT EXISTS `cantina_escolar_v2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cantina_escolar_v2`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: cantina_escolar_v2
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `agente_cantina`
--

DROP TABLE IF EXISTS `agente_cantina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agente_cantina` (
  `id_agente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_agente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agente_cantina`
--

LOCK TABLES `agente_cantina` WRITE;
/*!40000 ALTER TABLE `agente_cantina` DISABLE KEYS */;
INSERT INTO `agente_cantina` VALUES (1,'Carlos Eduardo'),(2,'Fernanda Lima'),(3,'Roberto Almeida'),(4,'Patricia Souza');
/*!40000 ALTER TABLE `agente_cantina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(30) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nome_categoria` (`nome_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (2,'Bebidas'),(3,'Doces'),(1,'Salgados');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudante`
--

DROP TABLE IF EXISTS `estudante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudante` (
  `id_estudante` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf_responsavel` varchar(14) NOT NULL,
  `saldo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `id_turma` int NOT NULL,
  PRIMARY KEY (`id_estudante`),
  KEY `id_turma` (`id_turma`),
  CONSTRAINT `estudante_ibfk_1` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudante`
--

LOCK TABLES `estudante` WRITE;
/*!40000 ALTER TABLE `estudante` DISABLE KEYS */;
INSERT INTO `estudante` VALUES (1,'Lucas Oliveira','111.222.333-00',50.00,1),(2,'Maria Santos','222.333.444-00',35.50,1),(3,'Pedro Almeida','333.444.555-00',20.00,2),(4,'Ana Beatriz','444.555.666-00',75.00,3),(5,'Gabriel Costa','555.666.777-00',15.50,4),(6,'Julia Ferreira','666.777.888-00',100.00,5),(7,'Rafael Martins','777.888.999-00',40.00,6),(8,'Camila Rocha','888.999.000-00',65.00,7),(9,'Bruno Ribeiro','999.000.111-00',30.00,8),(10,'Larissa Gomes','000.111.222-00',90.00,9);
/*!40000 ALTER TABLE `estudante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento`
--

DROP TABLE IF EXISTS `forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pagamento` (
  `id_forma_pagamento` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_forma_pagamento`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,'Pix',1),(2,'Dinheiro',1),(3,'Saldo',1);
/*!40000 ALTER TABLE `forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_cardapio`
--

DROP TABLE IF EXISTS `item_cardapio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_cardapio` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `id_categoria` int NOT NULL,
  `id_agente` int NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_agente` (`id_agente`),
  CONSTRAINT `item_cardapio_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `item_cardapio_ibfk_2` FOREIGN KEY (`id_agente`) REFERENCES `agente_cantina` (`id_agente`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_cardapio`
--

LOCK TABLES `item_cardapio` WRITE;
/*!40000 ALTER TABLE `item_cardapio` DISABLE KEYS */;
INSERT INTO `item_cardapio` VALUES (1,'Coxinha',6.00,1,1),(2,'Pastel de Queijo',7.00,1,1),(3,'Enroladinho',5.50,1,2),(4,'Pao de Queijo',4.00,1,2),(5,'Hamburguer',12.00,1,3),(6,'Suco de Laranja',5.00,2,1),(7,'Refrigerante',6.00,2,2),(8,'Agua Mineral',3.00,2,3),(9,'Achocolatado',4.50,2,4),(10,'Brigadeiro',3.50,3,3),(11,'Brownie',6.00,3,4),(12,'Bolo de Chocolate',5.00,3,4),(14,'Coxinha de Frango',6.00,1,1),(15,'Pastel de Queijo',7.00,1,1);
/*!40000 ALTER TABLE `item_cardapio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido` (
  `id_pedido` int NOT NULL,
  `id_item` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_pedido`,`id_item`),
  KEY `id_item` (`id_item`),
  CONSTRAINT `item_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `item_pedido_ibfk_2` FOREIGN KEY (`id_item`) REFERENCES `item_cardapio` (`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido`
--

LOCK TABLES `item_pedido` WRITE;
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
INSERT INTO `item_pedido` VALUES (1,1,2,6.00),(2,2,1,7.00),(2,10,1,3.50),(3,2,1,7.00),(4,5,1,12.00),(4,7,1,6.00),(5,6,1,5.00),(5,7,1,6.00),(6,1,1,6.00),(6,6,1,5.00),(6,9,1,4.50),(7,1,1,6.00),(7,10,1,3.50),(8,4,2,4.00),(8,5,1,12.00),(9,2,1,7.00),(9,7,1,6.00),(10,3,1,5.50),(10,5,1,12.00);
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_estudante` int NOT NULL,
  `id_forma_pagamento` int NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `status_pagamento` varchar(20) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_estudante` (`id_estudante`),
  KEY `id_forma_pagamento` (`id_forma_pagamento`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_estudante`) REFERENCES `estudante` (`id_estudante`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_forma_pagamento`) REFERENCES `forma_pagamento` (`id_forma_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,4,1,18.00,'Pago'),(2,5,2,11.00,'Pago'),(3,6,3,15.50,'Pago'),(4,7,1,9.50,'Pendente'),(5,8,3,20.00,'Pago'),(6,9,2,13.00,'Pago'),(7,10,1,17.50,'Pendente'),(8,1,3,8.50,'Pago'),(9,3,1,14.00,'Pago'),(10,5,2,12.50,'Pendente');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turma` (
  `id_turma` int NOT NULL AUTO_INCREMENT,
  `nome_turma` varchar(30) NOT NULL,
  PRIMARY KEY (`id_turma`),
  UNIQUE KEY `nome_turma` (`nome_turma`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (7,'1º EM'),(8,'2º EM'),(9,'3º EM'),(1,'6º Ano A'),(2,'6º Ano B'),(3,'7º Ano A'),(4,'7º Ano B'),(5,'8º Ano A'),(6,'9º Ano A');
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-15 16:51:42
