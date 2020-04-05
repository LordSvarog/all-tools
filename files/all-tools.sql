-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: all-tools
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `order_positions`
--

DROP TABLE IF EXISTS `order_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_positions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id_fk` (`order_id`),
  KEY `product_id_fk` (`product_id`),
  CONSTRAINT `order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Товары в заказе';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_positions`
--

LOCK TABLES `order_positions` WRITE;
/*!40000 ALTER TABLE `order_positions` DISABLE KEYS */;
INSERT INTO `order_positions` VALUES (1,1,2),(2,1,10),(3,1,15),(4,2,5),(5,2,17),(6,3,1),(7,3,10),(8,3,50),(9,4,18),(10,4,20),(11,5,2),(14,8,5),(15,8,17),(17,18,45),(18,19,45);
/*!40000 ALTER TABLE `order_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `status` char(10) NOT NULL DEFAULT 'new',
  `cost` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'payed',6042),(2,1,'payed',2046),(3,1,'payed',7682),(4,1,'payed',5761),(5,1,'new',52),(8,1,'new',2046),(10,1,'new',0),(11,1,'new',0),(12,1,'new',0),(13,1,'new',0),(14,1,'new',0),(15,1,'new',0),(16,1,'new',0),(17,1,'new',0),(18,1,'new',3106),(19,1,'new',3106);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT '',
  `price` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COMMENT='Товары';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Ведро 7л б/крышки',3067),(2,'Совок д/мусора \'Лень\'',52),(3,'Таз 12 л круглый',1289),(4,'Вешалка-плечики дерев. с перекладиной',215),(5,'	Щетка д/мытья посуды \'ОЛА\'',742),(6,'Черенок металический для щеткок и мопов 120 см',2811),(7,'Насадка д/швабры \'МОП\' микрофибрка (кентукки)',3291),(8,'Валик малярный 100 мм',314),(9,'	Валик малярный мех 200 мм',1732),(10,'	Щетка для обуви',2326),(11,'Коврик универсальный резиновый (ванная, прихожая)',3992),(12,'Ерш д/унит. с подставкой (большой)',2779),(13,'Лампа накаливания 60 Вт',296),(14,'Dosia-универсал в ассортименте',3577),(15,'Персил-автомат (Эра)',3664),(16,'\'Ласка\' магия бальзама д/шерсти (Эра)',634),(17,'Тележка (И) 4-х кол. МАЛАЯ',1304),(18,'Скамейка парковая со спинкой и ПОДЛОКОТНИКАМИ 2000х400х900мм',1113),(19,'Салфетка микрофибра 50*70',1756),(20,'Скотч 48мм х 47м прозрачный',4648),(21,'Ведро 12л б/крышки',1114),(22,'Совок д/мусора \'Лень\'',659),(23,'Таз 15 л круглый',4986),(24,'Вешалка-плечики р. 50-52',632),(25,'Щетка для пола Шробер с коротким жестким ворсом',1459),(26,'	Щетка для пола \'Моника\'',2483),(27,'Насадка д/швабры \'МОП-люкс \'York\' х/б',3335),(28,'	Палка телескопическая 1,5м',3328),(29,'Щетка-сметка 280 мм 3-х ряд.',3274),(30,'Щетинистое покрытие 0,9м*10м (травка зелёная)',397),(31,'Коврик-травка \'Зеленая Трава\'',2531),(32,'Ерш д/унитаза',1214),(33,'Лампа накаливания 40 Вт',4707),(34,'Dosia-матик в ассортименте',4782),(35,'Персил-автомат колор (Эра)',4818),(36,'\'Ласка-гель\' магия цвета (Эра)',4710),(37,'Тележка (И) 4х кол. пов.ручка, СПЛОШ. ПЛАТФ',382),(38,'Скамейка парковая со спинкой и ПОДЛОКОТНИКАМИ 2000х400х900мм',3014),(39,'Салфетка \'влажная 3шт в уп.',400),(40,'Скотч 38мм х 25м двусторонний полипропиленовый',3315),(41,'Ведро 10л с крышкой',3207),(42,'Совок д/мусора Москва',153),(43,'Таз 10 л круглый',1636),(44,'Вешалка-плечики р. 48-50',1283),(45,'Щетка для  подметания метро 0.5 м 4-х ряд(деревян.)',3106),(46,'Швабра \'Кентукки\' отжимная хлопок',339),(47,'Швабра пластик д/пола 40*10 см с насадкой микрофибра',313),(48,'Насадка д/швабры 40 см МОП микрофибра с ушками',3138),(49,'	Валик малярный мех 200 мм',863),(50,'	Щетка для обуви',2289),(51,'	Коврик ворсовый',3598),(52,'Ерш бутылочный',3623),(53,'Лампа накаливания 60 Вт',999),(54,'Dosia-универсал в ассортименте',2033),(55,'Персил-автомат колор (Эра)',96),(56,'\'Ласка-гель\' магия  бальзам (Эра)',1549),(57,'Тележка (И) 4х кол. платф решет',4218),(58,'Скамейка парковая со спинкой и ПОДЛОКОТНИКАМИ - УСИЛЕННАЯ 2000х400х900мм',4422),(59,'Салфетка микрофибра 50*70',834),(60,'Скотч 50мм х 50м прозрачный',364),(61,'Ведро 10л б/крышки',4421),(62,'Комплект совок д/мусора с щеткой',86),(63,'Таз 10 л круглый',4042),(64,'Вешалка-плечики р. 52-54',1540),(65,'Щетка для  подметания метро 0.5 м 4-х ряд(деревян.)',4181),(66,'Черенок металический для щеткок и мопов 120 см',2766),(67,'Насадка д/швабры \'МОП-люкс \'York\' х/б',4897),(68,'Насадка д/швабры 40см МОП 100% хлопок',3855),(69,'Валик малярный мех 200 мм',3942),(70,'Щетка для  мытья окон б/черенка',4934),(71,'Вантуз с деревянной ручкой',936),(72,'Ерш д/унитаза',4586),(73,'Лампа накаливания 60 Вт',316),(74,'Dosia-матик в ассортименте',4835),(75,'Персил-автомат колор (Эра)',4948),(76,'\'Ласка\' магия бальзама д/шерсти (Эра)',3686),(77,'Тележка (И) 4 кол.платф.решет. повор. T- ручка',580),(78,'Скамейка парковая со спинкой, закругленная 1550х900х600 мм',51),(79,'Салфетка \'влажная 3шт в уп.',2080),(80,'Скотч 50мм х 50м прозрачный',1914),(81,'Ведро 12л б/крышки',329),(82,'Комплект совок д/мусора с щеткой',1476),(83,'Таз 12 л круглый',4471),(84,'Вешалка-плечики р. 50-52',1043),(85,'Щетка д/мытья посуды \'ОЛА\'',772),(86,'Черенок металический для щеткок и мопов 120 см',382),(87,'Насадка д/швабры \'МОП-люкс \'York\' х/б',1852),(88,'Насадка д/швабры 60см МОП микрофибра с ушками',3496),(89,'Термометр уличный',3227),(90,'Щетинистое покрытие 0,9м*10м (травка зелёная)',4748),(91,'Коврик-травка \'Зеленая Трава\'',857),(92,'Ерш бутылочный',2124),(93,'Лампа накаливания 40 Вт',405),(94,'Dosia-матик в ассортименте',2974),(95,'Персил-автомат колор (Эра)',3166),(96,'\'Ласка\' магия бальзама д/шерсти (Эра)',4973),(97,'Тележка (И) 4х кол. платф решет',3985),(98,'Скамейка парковая со спинкой, закругленная 1550х900х600 мм',143),(99,'Салфетка \'влажная 3шт в уп.',834),(100,'Скотч 50мм х 50м прозрачный',2632),(101,'Ведро 10л б/крышки',4804),(102,'Совок д/мусора \'Лень\'',3316),(103,'Таз 12 л круглый',1802),(104,'Вешалка-плечики дерев. с перекладиной 3 шт в упак.',1004),(105,'Щетка для пола(деревян.) щетина',2499),(106,'Щетка  металлическая 4-рядная',3584),(107,'Насадка д/швабры \'МОП\' микрофибрка (кентукки)',1186),(108,'Насадка д/швабры 40 см МОП микрофибра с ушками',4011),(109,'Термометр уличный',2210),(110,'Щетка для обуви',1633),(111,'Коврик универсальный резиновый (ванная, прихожая)',366),(112,'Ерш д/унит. с подставкой (большой)',282),(113,'Лампа накаливания 60 Вт',724),(114,'Dosia-матик в ассортименте',3235),(115,'Персил-автомат колор (Эра)',4568),(116,'\'Ласка-гель\' магия цвета (Эра)',4442),(117,'Тележка (И) 4-х кол. под ВАННУ',4304),(118,'Скамейка парковая со спинкой и ПОДЛОКОТНИКАМИ - УСИЛЕННАЯ 2000х400х900мм',4256),(119,'Салфетка микрофибра 40х40см \'ТЕХТОР\'',678),(120,'Лента сигнальная (50мм х 200м) цветная, для ограждения',4645),(121,'Ведро 10л с крышкой',4506),(122,'Совок д/мусора \'Лень\'',610),(123,'Таз 10 л круглый',3894),(124,'Вешалка-плечики р. 52-54',2709),(125,'Щетка д/мытья посуды \'ОЛА\'',676),(126,'Щетка  металлическая 4-рядная',1833),(127,'Насадка д/швабры \'МОП\' микрофибрка (кентукки)',4789),(128,'Насадка д/швабры 60см МОП микрофибра с ушками',2481),(129,'Валик малярный мех 200 мм',3067),(130,'Щетинистое покрытие 0,9м*10м (травка зелёная)',2027),(131,'Коврик универсальный резиновый (ванная, прихожая)',3267),(132,'Щит подножный 1м х 0,5 (дерево+щетина)',981),(133,'Лампа люминесц. ЛБ-20,ЛД-20 20 Вт',4928),(134,'Dosia-матик колор, лимон',4983),(135,'Персил-автомат (Эра)',1606),(136,'\'Ласка-гель\' сияние белого (Эра)',252),(137,'Тележка (И) 4-х кол. МАЛАЯ',3808),(138,'Скамейка парковая со спинкой и ПОДЛОКОТНИКАМИ 2000х400х900мм',717),(139,'Салфетка микрофибра 40х30см \'Универсал\'',488),(140,'Скотч 50мм х 25м полипропилен. двухстор.',2108),(141,'Ведро 7л б/крышки',3075),(142,'Корзина для мусора Москва (с прорез.)',4768),(143,'Таз 7 л круглый',4958),(144,'Вешалка-плечики р. 48-50',1912),(145,'Щетка для пола(деревян.) щетина',1661),(146,'Швабра деревянная для пола',3797),(147,'Швабра губчатая отжимная с ручкой PVA',1926),(148,'Насадка д/швабры 60см МОП микрофибра с ушками',4665),(149,'Клеенка медицинская',4768),(150,'Щетка утюжок',3964),(151,'Коврик ворсовый',1616),(152,'Ерш д/унит. с подставкой (малый)',2104),(153,'Лампа люминесц. ЛБ-20,ЛД-20 20 Вт',2277),(154,'Dosia-матик колор, лимон',211),(155,'Персил ручная стирка (Эра)',3022),(156,'\'Ласка\' магия бальзама д/шерсти (Эра)',4804),(157,'Тележка (И) 4 кол.платф.решет. повор. T- ручка',3500),(158,'Скамейка парковая со спинкой, закругленная 1550х900х600 мм',3573),(159,'Салфетка \'влажная 3шт в уп.',4155),(160,'Скотч 50мм х 50м прозрачный',3450);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-05 22:36:48
