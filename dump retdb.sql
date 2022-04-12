-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: retdb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `bollatrasporto`
--

DROP TABLE IF EXISTS `bollatrasporto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bollatrasporto` (
  `IdUnivoco` char(6) NOT NULL,
  `Peso` decimal(6,2) NOT NULL,
  `ImportoTrasporto` decimal(6,2) NOT NULL,
  `DataOrdine` date NOT NULL,
  `DataArrivo` date NOT NULL,
  `Trasp` varchar(16) NOT NULL,
  PRIMARY KEY (`IdUnivoco`),
  CONSTRAINT `bollatrasporto_chk_1` CHECK ((`Peso` > 0)),
  CONSTRAINT `bollatrasporto_chk_2` CHECK ((`ImportoTrasporto` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bollatrasporto`
--

LOCK TABLES `bollatrasporto` WRITE;
/*!40000 ALTER TABLE `bollatrasporto` DISABLE KEYS */;
INSERT INTO `bollatrasporto` VALUES ('200009',120.50,50.00,'2021-03-02','2021-03-08','14587542354'),('200010',440.80,200.00,'2021-04-03','2021-04-15','14587542354');
/*!40000 ALTER TABLE `bollatrasporto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chiodo`
--

DROP TABLE IF EXISTS `chiodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chiodo` (
  `CodChiodo` char(6) NOT NULL,
  `Lunghezza` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`CodChiodo`),
  CONSTRAINT `chiodo_chk_1` CHECK ((`Lunghezza` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chiodo`
--

LOCK TABLES `chiodo` WRITE;
/*!40000 ALTER TABLE `chiodo` DISABLE KEYS */;
INSERT INTO `chiodo` VALUES ('000008',5.0),('000009',9.5);
/*!40000 ALTER TABLE `chiodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `CodPar` varchar(16) NOT NULL,
  `Citta` varchar(20) DEFAULT NULL,
  `CAP` char(5) DEFAULT NULL,
  `Via` varchar(20) DEFAULT NULL,
  `NumeroCivico` varchar(4) DEFAULT NULL,
  `Nome` varchar(20) NOT NULL,
  `Sesso` enum('M','F') DEFAULT NULL,
  `Telefono` varchar(18) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CodPar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('DKMTHA40L18E729S','Firenze','00134','Via Corso Europa','22','Matteo Leone','M','3654542654','matteo.leone@libero.it'),('LCMPSP41A44B635S','Milano','20090','Via Panzini','13','Alessandro Rizzo','M','3214856541','alessandro.rizzo@libero.it'),('PNHRMX72S69H250L','Roma','00118','Via Nazionale','1','Alessia Verdi','F','3562124587','alessia.verdi@libero.it');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulenza`
--

DROP TABLE IF EXISTS `consulenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulenza` (
  `DataeOra` datetime NOT NULL,
  `Descrizione` varchar(100) DEFAULT NULL,
  `Fornitore` varchar(16) NOT NULL,
  PRIMARY KEY (`DataeOra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulenza`
--

LOCK TABLES `consulenza` WRITE;
/*!40000 ALTER TABLE `consulenza` DISABLE KEYS */;
INSERT INTO `consulenza` VALUES ('2021-03-05 16:30:00',NULL,'10101222000'),('2021-03-08 18:30:00',NULL,'12548965412'),('2021-06-02 11:00:00',NULL,'10101222000');
/*!40000 ALTER TABLE `consulenza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dipendente`
--

DROP TABLE IF EXISTS `dipendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dipendente` (
  `CodPar` varchar(16) NOT NULL,
  `Citta` varchar(20) NOT NULL,
  `CAP` char(5) NOT NULL,
  `Via` varchar(20) NOT NULL,
  `NumeroCivico` varchar(4) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Sesso` enum('M','F') NOT NULL,
  `Telefono` varchar(18) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Mansione` varchar(15) NOT NULL,
  PRIMARY KEY (`CodPar`),
  CONSTRAINT `dipendente_chk_1` CHECK (((`Mansione` = _utf8mb4'segretario') or (`Mansione` = _utf8mb4'Operaio')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dipendente`
--

LOCK TABLES `dipendente` WRITE;
/*!40000 ALTER TABLE `dipendente` DISABLE KEYS */;
INSERT INTO `dipendente` VALUES ('KLTSBF99H49C819J','Milano','20019','Via Flaminia','15','Simone Russo','M','3854657925','simone.russo@libero.it','Operaio'),('QBGCCS96H04L455I','Venezia','20097','Via Larga','11','Giordano Colombo','M','3548756241','giordano.colombo@libero.it','Operaio'),('WCSJDG28P21A004I','Ancona','60131','Via Piazza Fontana','4','Francesca Marchetti','F','3854695421','francesca.marchetti@libero.it','segretario');
/*!40000 ALTER TABLE `dipendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elencazionecliente`
--

DROP TABLE IF EXISTS `elencazionecliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elencazionecliente` (
  `IdFatturaC` char(6) NOT NULL,
  `IdPrev` char(6) NOT NULL,
  `Mat1` char(6) NOT NULL,
  `Mat2` char(6) DEFAULT NULL,
  `Mat3` char(6) DEFAULT NULL,
  `Mat4` char(6) DEFAULT NULL,
  `Mat5` char(6) DEFAULT NULL,
  PRIMARY KEY (`IdFatturaC`,`IdPrev`,`Mat1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elencazionecliente`
--

LOCK TABLES `elencazionecliente` WRITE;
/*!40000 ALTER TABLE `elencazionecliente` DISABLE KEYS */;
INSERT INTO `elencazionecliente` VALUES ('200003','200005','000003','000013',NULL,NULL,NULL),('200004','200006','000002','000014',NULL,NULL,NULL),('200007','200008','000006',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `elencazionecliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elencazioneforn`
--

DROP TABLE IF EXISTS `elencazioneforn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elencazioneforn` (
  `IdFatturaF` char(6) NOT NULL,
  `IdOrdine` char(6) NOT NULL,
  `Mat1` char(6) NOT NULL,
  `Mat2` char(6) DEFAULT NULL,
  `Mat3` char(6) DEFAULT NULL,
  `Mat4` char(6) DEFAULT NULL,
  `Mat5` char(6) DEFAULT NULL,
  PRIMARY KEY (`IdFatturaF`,`IdOrdine`,`Mat1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elencazioneforn`
--

LOCK TABLES `elencazioneforn` WRITE;
/*!40000 ALTER TABLE `elencazioneforn` DISABLE KEYS */;
INSERT INTO `elencazioneforn` VALUES ('200001','200011','000001',NULL,NULL,NULL,NULL),('200002','200012','000003','000013',NULL,NULL,NULL);
/*!40000 ALTER TABLE `elencazioneforn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatturacliente`
--

DROP TABLE IF EXISTS `fatturacliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatturacliente` (
  `IdUnivoco` char(6) NOT NULL,
  `mat1` char(6) NOT NULL,
  `mat2` char(6) DEFAULT NULL,
  `mat3` char(6) DEFAULT NULL,
  `mat4` char(6) DEFAULT NULL,
  `mat5` char(6) DEFAULT NULL,
  `CostoFinale` decimal(6,2) NOT NULL,
  `DataF` date NOT NULL,
  `Cliente` varchar(16) NOT NULL,
  `DataVend` datetime DEFAULT NULL,
  PRIMARY KEY (`IdUnivoco`),
  CONSTRAINT `fatturacliente_chk_1` CHECK ((`CostoFinale` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatturacliente`
--

LOCK TABLES `fatturacliente` WRITE;
/*!40000 ALTER TABLE `fatturacliente` DISABLE KEYS */;
INSERT INTO `fatturacliente` VALUES ('200003','000003','000013',NULL,NULL,NULL,300.00,'2021-05-02','PNHRMX72S69H250L','2021-05-01 11:30:00'),('200004','000002','000014',NULL,NULL,NULL,350.00,'2021-06-02','LCMPSP41A44B635S','2021-06-01 10:30:00'),('200007','000006',NULL,NULL,NULL,NULL,15.00,'2021-07-05','DKMTHA40L18E729S','2021-07-04 09:00:00');
/*!40000 ALTER TABLE `fatturacliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatturafornitore`
--

DROP TABLE IF EXISTS `fatturafornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatturafornitore` (
  `IdUnivoco` char(6) NOT NULL,
  `mat1` char(6) NOT NULL,
  `mat2` char(6) DEFAULT NULL,
  `mat3` char(6) DEFAULT NULL,
  `mat4` char(6) DEFAULT NULL,
  `mat5` char(6) DEFAULT NULL,
  `CostoFinale` decimal(6,2) NOT NULL,
  `DataF` date NOT NULL,
  `Forn` varchar(16) NOT NULL,
  PRIMARY KEY (`IdUnivoco`),
  CONSTRAINT `fatturafornitore_chk_1` CHECK ((`CostoFinale` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatturafornitore`
--

LOCK TABLES `fatturafornitore` WRITE;
/*!40000 ALTER TABLE `fatturafornitore` DISABLE KEYS */;
INSERT INTO `fatturafornitore` VALUES ('200001','000001',NULL,NULL,NULL,NULL,50.00,'2021-03-08','10101222000'),('200002','000003','000013',NULL,NULL,NULL,200.00,'2021-04-15','12548965412');
/*!40000 ALTER TABLE `fatturafornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filo`
--

DROP TABLE IF EXISTS `filo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filo` (
  `CodFilo` char(6) NOT NULL,
  `Ret` char(6) DEFAULT NULL,
  `Diametro` decimal(3,0) NOT NULL,
  `Colore` varchar(6) NOT NULL,
  PRIMARY KEY (`CodFilo`),
  CONSTRAINT `filo_chk_1` CHECK (((`Colore` = _utf8mb4'verde') or (`Colore` = _utf8mb4'bianco') or (`Colore` = _utf8mb4'grigio') or (`Colore` = _utf8mb4'nero')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filo`
--

LOCK TABLES `filo` WRITE;
/*!40000 ALTER TABLE `filo` DISABLE KEYS */;
INSERT INTO `filo` VALUES ('000005',NULL,10,'bianco'),('000006',NULL,15,'nero'),('000007','000004',20,'verde');
/*!40000 ALTER TABLE `filo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornitore`
--

DROP TABLE IF EXISTS `fornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornitore` (
  `CodPar` varchar(16) NOT NULL,
  `Citta` varchar(20) DEFAULT NULL,
  `CAP` char(5) DEFAULT NULL,
  `Via` varchar(20) DEFAULT NULL,
  `NumeroCivico` varchar(4) DEFAULT NULL,
  `Nome` varchar(20) NOT NULL,
  `Sesso` enum('M','F') DEFAULT NULL,
  `Telefono` varchar(18) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CodPar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornitore`
--

LOCK TABLES `fornitore` WRITE;
/*!40000 ALTER TABLE `fornitore` DISABLE KEYS */;
INSERT INTO `fornitore` VALUES ('10101222000','Ancona','60121','Via Giordano Bruno','33','Mario Rossi','M','3336589656','mario.rossi@libero.it'),('12548965412','Firenze','50100','Via della Scala','45','Luigi Ferrari','M','3654569541','luigi.ferrari@libero.it');
/*!40000 ALTER TABLE `fornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intfuorisede`
--

DROP TABLE IF EXISTS `intfuorisede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intfuorisede` (
  `CodInt` char(6) NOT NULL,
  `DataInt` datetime NOT NULL,
  `Descrizione` varchar(100) DEFAULT NULL,
  `Citta` varchar(20) NOT NULL,
  `Provincia` char(2) NOT NULL,
  `CAP` char(5) NOT NULL,
  `Via` varchar(20) NOT NULL,
  `NumeroCivico` varchar(4) NOT NULL,
  `Cliente` varchar(16) NOT NULL,
  `Dipendente` varchar(16) NOT NULL,
  PRIMARY KEY (`CodInt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intfuorisede`
--

LOCK TABLES `intfuorisede` WRITE;
/*!40000 ALTER TABLE `intfuorisede` DISABLE KEYS */;
INSERT INTO `intfuorisede` VALUES ('100001','2021-03-01 09:30:00',NULL,'Roma','RM','00118','Via Nazionale','1','PNHRMX72S69H250L','KLTSBF99H49C819J'),('100002','2021-03-01 10:00:00',NULL,'Milano','MI','20090','Via Panzini','13','LCMPSP41A44B635S','QBGCCS96H04L455I'),('100003','2021-06-02 09:00:00',NULL,'Firenze','FI','00134','Via Corso Europa','22','DKMTHA40L18E729S','KLTSBF99H49C819J');
/*!40000 ALTER TABLE `intfuorisede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `DataI` date NOT NULL,
  PRIMARY KEY (`DataI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES ('2021-03-01'),('2021-04-01'),('2021-05-01'),('2021-06-01'),('2021-07-01'),('2021-08-01'),('2021-09-01'),('2021-10-01'),('2021-11-01'),('2021-12-01');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialeeco`
--

DROP TABLE IF EXISTS `materialeeco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materialeeco` (
  `Codice` char(6) NOT NULL,
  `Quantita` decimal(5,0) NOT NULL,
  `PrezzoIng` decimal(7,2) NOT NULL,
  `PrezzoList` decimal(7,2) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Marca` varchar(20) DEFAULT NULL,
  `Descrizione` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Codice`),
  CONSTRAINT `materialeeco_chk_1` CHECK ((`PrezzoIng` > 0)),
  CONSTRAINT `materialeeco_chk_2` CHECK ((`PrezzoList` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialeeco`
--

LOCK TABLES `materialeeco` WRITE;
/*!40000 ALTER TABLE `materialeeco` DISABLE KEYS */;
INSERT INTO `materialeeco` VALUES ('000001',100,30.00,50.00,'rete1',NULL,NULL),('000002',150,40.00,60.00,'rete2',NULL,NULL),('000003',200,50.00,70.00,'rete3',NULL,NULL),('000004',50,10.00,30.00,'rete4',NULL,NULL),('000005',3,6.00,9.00,'filo1',NULL,NULL),('000006',5,10.00,15.00,'filo2',NULL,NULL),('000007',35,70.00,105.00,'filo3',NULL,NULL),('000008',200,5.00,8.00,'chiodo1',NULL,NULL),('000009',800,20.00,30.00,'chiodo2',NULL,NULL),('000010',100,150.00,200.00,'saetta1',NULL,NULL),('000011',200,400.00,600.00,'saetta2',NULL,NULL),('000012',20,60.00,90.00,'palo1',NULL,NULL),('000013',50,200.00,250.00,'palo2',NULL,NULL),('000014',40,200.00,300.00,'palo3',NULL,NULL);
/*!40000 ALTER TABLE `materialeeco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialeorg`
--

DROP TABLE IF EXISTS `materialeorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materialeorg` (
  `CodiceM` char(6) NOT NULL,
  `Settore` decimal(1,0) DEFAULT NULL,
  `Ripiano` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`CodiceM`),
  CONSTRAINT `materialeorg_chk_1` CHECK (((`Settore` > 0) and (`Settore` < 6)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialeorg`
--

LOCK TABLES `materialeorg` WRITE;
/*!40000 ALTER TABLE `materialeorg` DISABLE KEYS */;
INSERT INTO `materialeorg` VALUES ('000001',1,NULL),('000002',1,NULL),('000003',1,NULL),('000004',1,NULL),('000005',2,NULL),('000006',2,NULL),('000007',2,NULL),('000008',3,NULL),('000009',3,NULL),('000010',4,NULL),('000011',4,NULL),('000012',5,NULL),('000013',5,NULL),('000014',5,NULL);
/*!40000 ALTER TABLE `materialeorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordinefornitore`
--

DROP TABLE IF EXISTS `ordinefornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordinefornitore` (
  `IdUnivoco` char(6) NOT NULL,
  `DataOrdine` date NOT NULL,
  `mat1` char(6) NOT NULL,
  `quantita1` decimal(5,0) NOT NULL,
  `mat2` char(6) DEFAULT NULL,
  `quantita2` decimal(5,0) DEFAULT NULL,
  `mat3` char(6) DEFAULT NULL,
  `quantita3` decimal(5,0) DEFAULT NULL,
  `mat4` char(6) DEFAULT NULL,
  `quantita4` decimal(5,0) DEFAULT NULL,
  `mat5` char(6) DEFAULT NULL,
  `quantita5` decimal(5,0) DEFAULT NULL,
  `Forn` varchar(16) NOT NULL,
  PRIMARY KEY (`IdUnivoco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordinefornitore`
--

LOCK TABLES `ordinefornitore` WRITE;
/*!40000 ALTER TABLE `ordinefornitore` DISABLE KEYS */;
INSERT INTO `ordinefornitore` VALUES ('200011','2021-03-02','000001',100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10101222000'),('200012','2021-04-03','000003',200,'000013',50,NULL,NULL,NULL,NULL,NULL,NULL,'12548965412');
/*!40000 ALTER TABLE `ordinefornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `Transazione` char(6) NOT NULL,
  `Fornitore` char(6) DEFAULT NULL,
  `Cliente` char(6) DEFAULT NULL,
  `Descrizione` varchar(100) DEFAULT NULL,
  `Importo` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES ('200015','200001',NULL,NULL,50.00),('200016','200002',NULL,NULL,200.00),('200017',NULL,'200003',NULL,300.00),('200018',NULL,'200004',NULL,350.00),('200019',NULL,'200007',NULL,15.00);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palo`
--

DROP TABLE IF EXISTS `palo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `palo` (
  `CodPalo` char(6) NOT NULL,
  `Altezza` decimal(2,1) NOT NULL,
  `Tipologia` varchar(8) NOT NULL,
  `Colore` varchar(6) NOT NULL,
  PRIMARY KEY (`CodPalo`),
  CONSTRAINT `palo_chk_1` CHECK (((`Altezza` > 0.4) and (`Altezza` < 3.1))),
  CONSTRAINT `palo_chk_2` CHECK (((`Tipologia` = _utf8mb4'a T') or (`Tipologia` = _utf8mb4'a Tubo'))),
  CONSTRAINT `palo_chk_3` CHECK (((`Colore` = _utf8mb4'verde') or (`Colore` = _utf8mb4'bianco') or (`Colore` = _utf8mb4'grigio') or (`Colore` = _utf8mb4'nero')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palo`
--

LOCK TABLES `palo` WRITE;
/*!40000 ALTER TABLE `palo` DISABLE KEYS */;
INSERT INTO `palo` VALUES ('000012',1.5,'a T','verde'),('000013',2.0,'a T','bianco'),('000014',1.5,'a tubo','grigio');
/*!40000 ALTER TABLE `palo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preventivo`
--

DROP TABLE IF EXISTS `preventivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preventivo` (
  `IdUnivoco` char(6) NOT NULL,
  `mat1` char(6) NOT NULL,
  `mat2` char(6) DEFAULT NULL,
  `mat3` char(6) DEFAULT NULL,
  `mat4` char(6) DEFAULT NULL,
  `mat5` char(6) DEFAULT NULL,
  `DataP` date NOT NULL,
  `CostoPreventivato` decimal(6,2) NOT NULL,
  `OreLavStimate` decimal(3,0) DEFAULT NULL,
  `Cliente` varchar(16) NOT NULL,
  `RichiestaPrev` datetime DEFAULT NULL,
  PRIMARY KEY (`IdUnivoco`),
  CONSTRAINT `preventivo_chk_1` CHECK ((`CostoPreventivato` > 0)),
  CONSTRAINT `preventivo_chk_2` CHECK ((`OreLavStimate` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preventivo`
--

LOCK TABLES `preventivo` WRITE;
/*!40000 ALTER TABLE `preventivo` DISABLE KEYS */;
INSERT INTO `preventivo` VALUES ('200005','000003','000013',NULL,NULL,NULL,'2021-04-30',280.00,NULL,'PNHRMX72S69H250L','2021-04-30 10:00:00'),('200006','000002','000014',NULL,NULL,NULL,'2021-05-30',320.00,NULL,'LCMPSP41A44B635S','2021-05-30 10:00:00'),('200008','000006',NULL,NULL,NULL,NULL,'2021-04-30',12.00,NULL,'DKMTHA40L18E729S','2021-06-27 11:00:00');
/*!40000 ALTER TABLE `preventivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produzione`
--

DROP TABLE IF EXISTS `produzione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produzione` (
  `Filo` varchar(15) NOT NULL,
  `Rete` varchar(15) NOT NULL,
  `MetriRete` decimal(4,0) NOT NULL,
  PRIMARY KEY (`Filo`,`Rete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produzione`
--

LOCK TABLES `produzione` WRITE;
/*!40000 ALTER TABLE `produzione` DISABLE KEYS */;
INSERT INTO `produzione` VALUES ('000007','000004',50);
/*!40000 ALTER TABLE `produzione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rete`
--

DROP TABLE IF EXISTS `rete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rete` (
  `CodRete` char(6) NOT NULL,
  `Colore` varchar(6) NOT NULL,
  `Altezza` decimal(2,1) NOT NULL,
  `Spessore` decimal(3,0) NOT NULL,
  PRIMARY KEY (`CodRete`),
  CONSTRAINT `rete_chk_1` CHECK (((`Colore` = _utf8mb4'verde') or (`Colore` = _utf8mb4'bianco') or (`Colore` = _utf8mb4'grigio') or (`Colore` = _utf8mb4'nero'))),
  CONSTRAINT `rete_chk_2` CHECK (((`Altezza` > 0.4) and (`Altezza` < 3.1))),
  CONSTRAINT `rete_chk_3` CHECK ((`Spessore` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rete`
--

LOCK TABLES `rete` WRITE;
/*!40000 ALTER TABLE `rete` DISABLE KEYS */;
INSERT INTO `rete` VALUES ('000001','verde',1.0,10),('000002','grigio',1.5,5),('000003','bianco',2.0,8),('000004','verde',1.0,8);
/*!40000 ALTER TABLE `rete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `richiestaprev`
--

DROP TABLE IF EXISTS `richiestaprev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `richiestaprev` (
  `DataeOra` datetime NOT NULL,
  `Descrizione` varchar(100) DEFAULT NULL,
  `Cliente` varchar(16) NOT NULL,
  PRIMARY KEY (`DataeOra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `richiestaprev`
--

LOCK TABLES `richiestaprev` WRITE;
/*!40000 ALTER TABLE `richiestaprev` DISABLE KEYS */;
INSERT INTO `richiestaprev` VALUES ('2021-04-30 10:00:00',NULL,'PNHRMX72S69H250L'),('2021-05-30 10:00:00',NULL,'LCMPSP41A44B635S'),('2021-06-27 11:00:00',NULL,'DKMTHA40L18E729S');
/*!40000 ALTER TABLE `richiestaprev` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saetta`
--

DROP TABLE IF EXISTS `saetta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saetta` (
  `CodSaetta` char(6) NOT NULL,
  `Altezza` decimal(2,1) NOT NULL,
  `Colore` varchar(6) NOT NULL,
  PRIMARY KEY (`CodSaetta`),
  CONSTRAINT `saetta_chk_1` CHECK (((`Altezza` > 0.9) and (`Altezza` < 2.1))),
  CONSTRAINT `saetta_chk_2` CHECK (((`Colore` = _utf8mb4'verde') or (`Colore` = _utf8mb4'bianco') or (`Colore` = _utf8mb4'grigio') or (`Colore` = _utf8mb4'nero')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saetta`
--

LOCK TABLES `saetta` WRITE;
/*!40000 ALTER TABLE `saetta` DISABLE KEYS */;
INSERT INTO `saetta` VALUES ('000010',1.5,'verde'),('000011',2.0,'bianco');
/*!40000 ALTER TABLE `saetta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedaint`
--

DROP TABLE IF EXISTS `schedaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedaint` (
  `IdUnivoco` char(6) NOT NULL,
  `DataIniLav` date NOT NULL,
  `DataFinLav` date NOT NULL,
  `ScadenzaLav` date DEFAULT NULL,
  `OreLav` decimal(3,0) NOT NULL,
  PRIMARY KEY (`IdUnivoco`),
  CONSTRAINT `schedaint_chk_1` CHECK ((`OreLav` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedaint`
--

LOCK TABLES `schedaint` WRITE;
/*!40000 ALTER TABLE `schedaint` DISABLE KEYS */;
INSERT INTO `schedaint` VALUES ('100001','2021-03-01','2021-03-05',NULL,32),('100002','2021-03-12','2021-03-20',NULL,64),('100003','2021-06-02','2021-06-22',NULL,160);
/*!40000 ALTER TABLE `schedaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transazionedoc`
--

DROP TABLE IF EXISTS `transazionedoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transazionedoc` (
  `CodiceD` char(6) NOT NULL,
  `DataT` date NOT NULL,
  `ImportoTotale` decimal(6,2) NOT NULL,
  `Forn` varchar(6) DEFAULT NULL,
  `Cliente` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`CodiceD`),
  CONSTRAINT `transazionedoc_chk_1` CHECK ((`ImportoTotale` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transazionedoc`
--

LOCK TABLES `transazionedoc` WRITE;
/*!40000 ALTER TABLE `transazionedoc` DISABLE KEYS */;
INSERT INTO `transazionedoc` VALUES ('200015','2021-03-18',50.00,'200001',NULL),('200016','2021-04-20',200.00,'200002',NULL),('200017','2021-05-05',300.00,NULL,'200003'),('200018','2021-06-04',350.00,NULL,'200004'),('200019','2021-07-10',15.00,NULL,'200005');
/*!40000 ALTER TABLE `transazionedoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trasportatore`
--

DROP TABLE IF EXISTS `trasportatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trasportatore` (
  `CodPar` varchar(16) NOT NULL,
  `Citta` varchar(20) DEFAULT NULL,
  `CAP` char(5) DEFAULT NULL,
  `Via` varchar(20) DEFAULT NULL,
  `NumeroCivico` varchar(4) DEFAULT NULL,
  `Nome` varchar(20) NOT NULL,
  `Sesso` enum('M','F') DEFAULT NULL,
  `Telefono` varchar(18) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CodPar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trasportatore`
--

LOCK TABLES `trasportatore` WRITE;
/*!40000 ALTER TABLE `trasportatore` DISABLE KEYS */;
INSERT INTO `trasportatore` VALUES ('14587542354','Roma','00100','Via Condotti','3','Matteo Bianchi','M','3334571296','matteo.bianchi@libero.it'),('15896574535','Ancona','60122','Via Cassia','2','Federica Rossini','F','3521235465','federica.rossini@libero.it');
/*!40000 ALTER TABLE `trasportatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venditamateriali`
--

DROP TABLE IF EXISTS `venditamateriali`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venditamateriali` (
  `DataeOra` datetime NOT NULL,
  `Descrizione` varchar(100) DEFAULT NULL,
  `Cliente` varchar(16) NOT NULL,
  PRIMARY KEY (`DataeOra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venditamateriali`
--

LOCK TABLES `venditamateriali` WRITE;
/*!40000 ALTER TABLE `venditamateriali` DISABLE KEYS */;
INSERT INTO `venditamateriali` VALUES ('2021-05-01 11:30:00',NULL,'PNHRMX72S69H250L'),('2021-06-01 10:30:00',NULL,'LCMPSP41A44B635S'),('2021-07-04 09:00:00',NULL,'DKMTHA40L18E729S');
/*!40000 ALTER TABLE `venditamateriali` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'retdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-12 21:40:19
