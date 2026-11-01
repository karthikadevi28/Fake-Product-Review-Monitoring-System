DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `pid` int(255) NOT NULL,
  `uname` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `pname` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `discount` varchar(45) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `nproduct` varchar(45) NOT NULL,
  `total` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `creditcard` varchar(45) NOT NULL,
  `ipaddress` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `purchase`
--

/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` (`pid`,`uname`,`age`,`gender`,`pname`,`price`,`discount`,`amount`,`nproduct`,`total`,`date`,`creditcard`,`ipaddress`,`status`) VALUES 
 (1000,'sathish','20-30','Male','Malar Rice','450','0','450','1','450','2025-10-31','1234567890123456','192.168.1.7','Accept');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;


--
-- Definition of table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE `purchases` (
  `pid` int(255) NOT NULL,
  `block` longtext NOT NULL,
  `transaction` longtext NOT NULL,
  `uname` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `pname` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `discount` varchar(45) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `nproduct` varchar(45) NOT NULL,
  `total` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `creditcard` varchar(45) NOT NULL,
  `ipaddress` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `purchases`
--

/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` (`pid`,`block`,`transaction`,`uname`,`age`,`gender`,`pname`,`price`,`discount`,`amount`,`nproduct`,`total`,`date`,`creditcard`,`ipaddress`,`status`) VALUES 
 (999,'e4412db89c123254387d1428c43c793da79db38691a91421033956b415ffad6b','a8ff2c23dabd7da2a3ed5c32e410be591f7cf1beeee2e73071edcede2c65cd30','sathish','20-30','Male','SAMSUNG LAPTOP X11','230000','23000','207000','5','1035000','2025-10-31','1234567890123456','192.168.1.7','Pending'),
 (1000,'a859d9565dc3c53a7662b7b03e7e68d3f454ea0d2862a2c9b3a25c88bf3b01ad','ad08badffd2f3c550f517b941dc16aa5460a3a872f4f3fef85110e31fdddbee4','sathish','20-30','Male','Malar Rice','450','0','450','1','450','2025-10-31','1234567890123456','192.168.1.7','Pending');
online2