-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.29-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table ehr2.area
CREATE TABLE IF NOT EXISTS `area` (
  `area` varchar(1000) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ehr2.area: ~9 rows (approximately)
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` (`area`, `email`, `status`) VALUES
	('ehr.png', 'santoshlagishetty@gmail.com', 0),
	('Capture4.JPG', 'lavanya@gmail.com', 0),
	('t.png', 'lavanya@gmail.com', 0),
	('ehr.png', 'santoshlagishetty@gmail.com', 0),
	('logo2.PNG', 'lavanyareddy99@gmail.com', 0),
	('logo2.PNG', 'lavanya@gmail.com', 0),
	('t.png', 'lavanya@gmail.com', 0),
	('t.png', 'lavanya@gmail.com', 0),
	('t.png', 'lavanya@gmail.com', 0);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;

-- Dumping structure for table ehr2.ayurvedic
CREATE TABLE IF NOT EXISTS `ayurvedic` (
  `ACategory_ID` varchar(50) NOT NULL,
  `ACategory_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ACategory_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table ehr2.ayurvedic: ~2 rows (approximately)
/*!40000 ALTER TABLE `ayurvedic` DISABLE KEYS */;
INSERT INTO `ayurvedic` (`ACategory_ID`, `ACategory_Name`) VALUES
	('ashwa', 'ashwagandha'),
	('harit', 'haritaki');
/*!40000 ALTER TABLE `ayurvedic` ENABLE KEYS */;

-- Dumping structure for table ehr2.branch_master
CREATE TABLE IF NOT EXISTS `branch_master` (
  `Branch_ID` varchar(50) NOT NULL,
  `Branch_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Branch_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table ehr2.branch_master: ~8 rows (approximately)
/*!40000 ALTER TABLE `branch_master` DISABLE KEYS */;
INSERT INTO `branch_master` (`Branch_ID`, `Branch_Name`) VALUES
	('BLR', 'Bangalore'),
	('HYD', 'Hyderabad'),
	('MUM', 'Mumbai'),
	('PAR', 'Parbhani'),
	('PHN', 'Phone Consultation'),
	('PUN', 'Pune'),
	('test', 'Test2'),
	('test2', 'Test22');
/*!40000 ALTER TABLE `branch_master` ENABLE KEYS */;

-- Dumping structure for table ehr2.country
CREATE TABLE IF NOT EXISTS `country` (
  `Country_ID` varchar(50) NOT NULL,
  `Country_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Country_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table ehr2.country: ~2 rows (approximately)
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`Country_ID`, `Country_Name`) VALUES
	('ind', 'India'),
	('out', 'Outside India');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;

-- Dumping structure for procedure ehr2.edit_medicine_data
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_medicine_data`(
	IN `id` VARCHAR(50),
	IN `visit` INT,
	IN `typename` VARCHAR(50),
	IN `name` VARCHAR(50),
	IN `billable` VARCHAR(50),
	IN `given` INT,
	IN `available` INT,
	IN `quantity` VARCHAR(50),
	IN `whenval` VARCHAR(50),
	IN `how` VARCHAR(50)


)
    COMMENT 'This will run for the update save ,which will run after editing the existing value and then save the values'
BEGIN
INSERT INTO patient_medicine (Patient_ID,Visit_Number,Medicine_Type_Name,Medicine_Name,Billable,Given,Quantity,Whenval,How) VALUES (id,visit,typename,name,billable,given,quantity,whenval,how);
update stock_master set Available = available where Medicine_Name=name;
END//
DELIMITER ;

-- Dumping structure for table ehr2.medicine
CREATE TABLE IF NOT EXISTS `medicine` (
  `Medicine_ID` int(11) NOT NULL,
  `Medicine_Type_ID` int(11) NOT NULL,
  `Medicine_Name` varchar(200) NOT NULL,
  `MRP` int(11) DEFAULT NULL,
  `Basic` int(11) DEFAULT NULL,
  `Unit` varchar(50) DEFAULT NULL,
  `Available` int(11) DEFAULT NULL,
  `Package_Weight` int(11) DEFAULT NULL,
  `Brand_Name` varchar(50) DEFAULT NULL,
  `Short_Form` varchar(50) DEFAULT NULL,
  `Net_Content` int(11) DEFAULT NULL,
  `Unit_Price` int(11) DEFAULT NULL,
  PRIMARY KEY (`Medicine_ID`),
  KEY `FK_medicines_medtype` (`Medicine_Type_ID`),
  CONSTRAINT `FK_medicine_medicine_type` FOREIGN KEY (`Medicine_Type_ID`) REFERENCES `medicine_type` (`Type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table ehr2.medicine: ~170 rows (approximately)
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` (`Medicine_ID`, `Medicine_Type_ID`, `Medicine_Name`, `MRP`, `Basic`, `Unit`, `Available`, `Package_Weight`, `Brand_Name`, `Short_Form`, `Net_Content`, `Unit_Price`) VALUES
	(1, 1, 'Alovera Ark', 300, 500, 'ml', 10, 500, 'Goseva', 'AL', 500, 300),
	(2, 1, 'Alovera Juice', 110, 500, 'ml', 31, 500, 'Goseva', 'ALJ', 500, 110),
	(3, 2, 'Arjun', 180, 100, 'ml', 3, 500, 'Goseva', 'ARJ', 500, 36),
	(4, 2, 'Balpal', 100, 100, 'ml', 3, 240, 'Goseva', 'BLPL', 200, 50),
	(5, 2, 'Chobchini', 230, 100, 'ml', 30, 500, 'Goseva', 'CH', 500, 46),
	(6, 2, 'Giloy(Ark)', 180, 100, 'ml', 9, 500, 'Goseva', 'GI', 500, 36),
	(7, 2, 'Gudmar', 320, 100, 'ml', 1, 500, 'Goseva', 'GUD', 500, 64),
	(8, 2, 'Kanchnar', 180, 100, 'ml', 23, 500, 'Goseva', 'KCH', 500, 36),
	(9, 2, 'Manjishtha(Ark)', 180, 100, 'ml', 10, 500, 'Goseva', 'MJ', 500, 36),
	(10, 2, 'Nandi', 180, 100, 'ml', 8, 500, 'Goseva', 'ND', 500, 36),
	(11, 2, 'Nari Sanjivani', 180, 100, 'ml', 80, 500, 'Goseva', 'NS', 500, 36),
	(12, 2, 'Pashanbhed', 180, 100, 'ml', 0, 500, 'Goseva', 'PSH', 500, 36),
	(13, 2, 'Plain ', 100, 100, 'ml', 0, 500, 'Goseva', 'PLAIN', 500, 20),
	(14, 2, 'Punarnava ', 180, 100, 'ml', 8, 500, 'Goseva', 'PU', 500, 36),
	(15, 2, 'Raktashuddhi', 230, 100, 'ml', 27, 500, 'Goseva', 'RKT', 500, 46),
	(16, 2, 'Saptarangi', 180, 100, 'ml', 1, 500, 'Goseva', 'SPT', 500, 36),
	(17, 2, 'Sarpgandha(Ark)', 180, 100, 'ml', 5, 500, 'Goseva', 'SRP', 500, 36),
	(18, 2, 'Tulasi', 180, 100, 'ml', 2, 500, 'Goseva', 'TU', 500, 36),
	(19, 3, 'Abhayarishta', 138, 50, 'grams', 12, 530, 'Dhootpapeswr', 'ABH', 450, 16),
	(20, 3, 'Amrutarishta', 173, 50, 'grams', 3, 540, 'Dhootpapeswr', 'AMR', 450, 20),
	(21, 3, 'Arjunarishta', 135, 50, 'grams', 17, 535, 'Unjha', 'ARJ', 450, 15),
	(22, 3, 'Ashokarishta', 126, 50, 'grams', 2, 550, 'Unjha', 'ASH', 450, 14),
	(23, 3, 'Ashwagandharishta', 182, 50, 'grams', 8, 520, 'Dhootpapeswr', 'ASHW', 450, 21),
	(24, 3, 'Chandanasava', 75, 50, 'grams', 3, 525, 'Dhootpapeswr', 'CHN', 200, 19),
	(25, 3, 'Dashamularishta', 150, 50, 'grams', 0, 0, 'Unjha', 'DSH', 450, 17),
	(26, 3, 'Drakshasava ', 150, 50, 'grams', 0, 0, 'Unjha', 'DRKSH', 450, 17),
	(27, 3, 'Drakshora', 102, 50, 'grams', 25, 325, 'Unjha', 'DRKSH', 225, 23),
	(28, 3, 'Gomutra asava', 270, 50, 'grams', 30, 500, 'Goseva', 'GASAV', 500, 27),
	(29, 3, 'Jirakararishta', 162, 50, 'grams', 18, 535, 'Unjha', 'JRK', 450, 18),
	(30, 3, 'Kanakasava', 140, 50, 'grams', 4, 515, 'Dhootpapeswr', 'KNK', 450, 16),
	(31, 3, 'Khadirarishta', 150, 50, 'grams', 0, 0, 'Unjha', 'KHR', 450, 17),
	(32, 3, 'Kumari Asava', 192, 50, 'grams', 14, 520, 'Dhootpapeswr', 'KUSAVA', 450, 22),
	(33, 3, 'Kutajarishta', 118, 50, 'grams', 1, 550, 'Unjha', 'KTJ', 450, 14),
	(34, 3, 'Lodhrasava', 147, 50, 'grams', 10, 505, 'Dhootpapeswr', 'LODH', 450, 17),
	(35, 3, 'Mahamanjishthadi Qath', 150, 50, 'grams', 4, 520, 'Dhootpapeswr', 'MAHM', 450, 17),
	(36, 3, 'Maharasnadi Qath', 150, 50, 'grams', 0, 0, 'Dhootpapeswr', 'MAHR', 450, 17),
	(37, 3, 'Punarnavasava(Dhoot)', 75, 50, 'grams', 3, 235, 'Dhootpapeswr', 'PUSAVA', 200, 19),
	(38, 3, 'Punarnavasava(Unjha)', 130, 50, 'grams', 14, 540, 'unjha', 'PUSAVA', 450, 15),
	(39, 3, 'Saraswatarishta', 150, 50, 'grams', 0, 0, 'Unjha', 'SRSW', 450, 17),
	(40, 3, 'Takrarishta', 150, 50, 'grams', 10, 500, 'Goseva', 'TKRS', 500, 15),
	(41, 3, 'Takrasava', 150, 50, 'grams', 10, 500, 'Goseva', 'TKR', 500, 15),
	(42, 3, 'Vasakasava', 100, 10, 'grams', 10, 500, 'Goseva', 'VS', 500, 0),
	(43, 3, 'Ushirasava', 144, 50, 'grams', 11, 501, 'Dhootpapeswr', 'USH', 450, 16),
	(44, 4, 'Avipattikar choorna', 80, 50, 'grams', 0, 50, 'Udupi', 'APC', 50, 80),
	(45, 4, 'Charma ', 80, 50, 'grams', 0, 50, 'Udupi', 'CC', 50, 80),
	(46, 4, 'Haridra Khand', 80, 50, 'grams', 0, 0, 'Udupi', 'HKC', 50, 80),
	(47, 4, 'Hinguvachadi', 80, 50, 'grams', 0, 0, 'Udupi', 'HVC', 50, 80),
	(48, 4, 'Kottam Chukkli', 80, 50, 'grams', 0, 50, 'Udupi', 'KCC', 50, 80),
	(49, 4, 'Madhuveri', 90, 100, 'grams', 35, 130, 'Goseva', 'MDHV', 100, 90),
	(50, 4, 'Pachanamrita', 60, 60, 'grams', 56, 80, 'Goseva', 'PCH', 60, 60),
	(51, 4, 'Satavari Kalpa', 10, 10, 'grams', 10, 10, 'Goseva', 'SK', 10, 10),
	(52, 4, 'Sitopaladi', 80, 50, 'grams', 9, 50, 'Udupi', 'SIC', 50, 80),
	(53, 4, 'Talisadi', 80, 50, 'grams', 3, 50, 'Udupi', 'TLC', 50, 80),
	(54, 4, 'Triphala Choorna', 80, 50, 'grams', 17, 50, 'Udupi', 'TC', 50, 80),
	(55, 4, 'Veeryashodhan Choorna', 90, 100, 'grams', 2, 125, 'Unjha', 'VRYC', 100, 90),
	(56, 5, 'Amritdhara', 150, 10, 'ml', 4, 15, 'Home', 'ADROPS', 10, 150),
	(57, 5, 'Bramhi- Ayur Ghee', 70, 10, 'ml', 1, 52, 'Goseva', 'AYUR', 10, 70),
	(58, 5, 'Netraseva', 10, 10, 'ml', 1, 10, 'Goseva', 'NS', 10, 10),
	(59, 5, 'Netranjan', 40, 15, 'ml', 51, 22, 'Goseva', 'NETRA', 15, 40),
	(60, 5, 'PG Drops', 150, 10, 'ml', 8, 50, 'Goseva', 'PG', 10, 150),
	(61, 6, 'Arjun(Ghanavati)', 100, 120, 'number', 3, 70, 'Goseva', 'ARJ', 120, 100),
	(62, 6, 'Bhasma Vati', 100, 120, 'number', 18, 80, 'Goseva', 'BH', 120, 100),
	(63, 6, 'Giloy', 100, 120, 'number', 13, 70, 'Goseva', 'GI', 120, 100),
	(64, 6, 'Haritaki', 100, 120, 'number', 8, 70, 'Goseva', 'HRT', 120, 100),
	(65, 6, 'Madhuvati', 100, 120, 'number', 30, 70, 'Goseva', 'MDH', 120, 100),
	(66, 6, 'Manjishtha', 100, 120, 'number', 7, 82, 'Goseva', 'MJ', 120, 100),
	(67, 6, 'Panchgavya', 150, 120, 'number', 11, 65, 'Goseva', 'PCH', 120, 150),
	(68, 6, 'Punarnava Vati', 100, 120, 'number', 7, 80, 'Goseva', 'PU', 120, 100),
	(69, 6, 'Sarpgandha', 100, 120, 'number', 11, 70, 'Goseva', 'SRP', 120, 100),
	(70, 6, 'Triphala(Goseva)', 80, 120, 'number', 13, 75, 'Goseva', 'TRI', 120, 80),
	(71, 6, 'Tulasi Vati', 100, 120, 'number', 29, 75, 'Goseva', 'TU', 120, 100),
	(72, 7, 'PG Ghrita 250 gm', 750, 250, 'ml', 17, 251, 'Goseva', 'PG', 250, 750),
	(73, 7, 'Phala Ghrita 125gms', 210, 100, 'grams', 11, 125, 'Nagarjuna', 'PHG', 100, 210),
	(74, 7, 'Phala Ghrita 250gms', 410, 200, 'grams', 0, 250, 'Nagarjuna', 'PHG', 200, 410),
	(75, 7, 'Real Ghee 250 ml', 499, 250, 'ml', 29, 475, 'Goseva', 'RG', 250, 499),
	(76, 7, 'Real Ghee 500 ml', 999, 500, 'ml', 9, 922, 'Goseva', 'RG', 500, 999),
	(77, 7, 'Triphala Ghritam 125 gms', 210, 100, 'grams', 24, 125, 'Nagarjuna', 'TRG', 100, 210),
	(78, 7, 'Triphala Ghritam 250 gms', 410, 200, 'grams', 0, 250, 'Nagarjuna', 'TRG', 200, 410),
	(79, 8, 'Abha(Nagarjuna)', 70, 60, 'tab', 4, 47, 'Nagarjuna', 'ABHA', 60, 70),
	(80, 8, 'Abha(Unjha)', 75, 60, 'tab', 7, 30, 'Unjha', 'ABHA', 80, 57),
	(81, 8, 'Abha 40 tab', 300, 60, 'tab', 0, 0, 'Unjha', 'ABHA', 60, 300),
	(82, 8, 'Abha 80 tab', 80, 60, 'tab', 5, 30, 'Unjha', 'ABHA', 80, 60),
	(83, 8, 'Amrutadi', 300, 60, 'tab', 0, 0, 'Udupi', 'AMR', 60, 300),
	(84, 8, 'Gokshuradi(Udupi)', 300, 60, 'tab', 18, 40, 'Udupi', 'GOK', 60, 300),
	(85, 8, 'Gokshuradi(Dhoot)', 106, 60, 'tab', 1, 32, 'Dhoopapeswar', 'GOK', 60, 106),
	(86, 8, 'Gokshuradi(Unjha)80 tabs', 115, 60, 'tab', 25, 31, 'Unjha', 'GOK', 80, 87),
	(87, 8, 'Kaishora(Udupi)', 300, 60, 'tab', 3, 35, 'Udupi', 'KAI', 60, 300),
	(88, 8, 'Kaishora(Unjha)', 96, 60, 'tab', 7, 26, 'Unjha', 'KAI', 60, 96),
	(89, 8, 'Kaishora(Dhoot)', 110, 60, 'tab', 9, 30, 'Dhoopapeswar', 'KAI', 60, 110),
	(90, 8, 'Kaishora 80 tab(Unjha)', 90, 60, 'tab', 7, 30, 'Unjha', 'KAI', 80, 68),
	(91, 8, 'Kanchnar(Udupi)', 300, 60, 'tab', 6, 30, 'Udupi', 'KCH', 60, 300),
	(92, 8, 'Kanchnar(Dhoot)', 118, 60, 'tab', 6, 30, 'Dhoopapeswar', 'KCH', 60, 118),
	(93, 8, 'Kanchnar(Unjha)', 96, 60, 'tab', 4, 28, 'Unjha', 'KCH', 60, 96),
	(94, 8, 'Kanchnar 200 tab(Unjha)', 210, 60, 'tab', 1, 68, 'Unjha', 'KCH', 200, 63),
	(95, 8, 'Lakshadi(Udupi)', 300, 60, 'tab', 12, 30, 'Udupi', 'LHK', 60, 300),
	(96, 8, 'Lakshadi(Dhoot)', 130, 60, 'tab', 5, 30, 'Dhoopapeswar', 'LHK', 60, 130),
	(97, 8, 'Mahayogiraj(209)', 209, 60, 'tab', 10, 15, 'Unjha', 'MAHY', 60, 209),
	(98, 8, 'Mahayogiraj(212)', 212, 60, 'tab', 7, 15, 'Unjha', 'MAHY', 60, 212),
	(99, 8, 'Medohar(Nagarjuna)', 80, 60, 'tab', 3, 45, 'Nagarjuna', 'MED', 60, 80),
	(100, 8, 'Medohar 80 tabs(Unjha)', 110, 60, 'tab', 12, 45, 'Unjha', 'MED', 80, 83),
	(101, 8, 'Navaka Guggulu', 300, 60, 'tab', 0, 0, 'Udupi', 'NAV', 60, 300),
	(102, 8, 'simhanada(Udupi)', 300, 60, 'tab', 22, 50, 'Udupi', 'SIM', 60, 300),
	(103, 8, 'simhanada(Dhoop)', 102, 60, 'tab', 1, 35, 'Dhoopapeswar', 'SIM', 60, 102),
	(104, 8, 'Trayodashang(Udupi)', 300, 60, 'tab', 0, 0, 'Udupi', 'TRAYO', 60, 300),
	(105, 8, 'Trayodashang(Dhoop)', 120, 60, 'tab', 9, 55, 'Dhoopapeswar', 'TRAYO', 60, 120),
	(106, 8, 'Trayodashang 40 tab(Unjha)', 300, 60, 'tab', 0, 0, 'Unjha', 'TRAYO', 60, 300),
	(107, 8, 'Triphala(Udupi)', 300, 60, 'tab', 4, 20, 'Udupi', 'TRP', 60, 300),
	(108, 8, 'Triphala(Unjha)', 90, 60, 'tab', 6, 30, 'Unjha', 'TRP', 80, 68),
	(109, 8, 'Triphala Guggulu 60 tab(Unjha)', 96, 60, 'tab', 8, 28, 'Unjha', 'TRP', 60, 96),
	(110, 8, 'vyoshashi ', 300, 60, 'tab', 18, 30, 'Udupi', 'VYO', 60, 300),
	(111, 8, 'Yogiraj(Udupi)', 300, 60, 'tab', 14, 35, 'Udupi', 'YOG', 60, 300),
	(112, 8, 'Yogiraj(Unjha)', 96, 60, 'tab', 10, 27, 'Unjha', 'YOG', 60, 96),
	(113, 8, 'Yogiraj 200 tabs(Unjha)', 200, 60, 'tab', 3, 68, 'Unjha', 'YOG', 200, 60),
	(114, 9, 'Arjun Twak', 85, 60, 'tab', 21, 32, 'Nagarjuna', 'ARJT', 60, 85),
	(115, 9, 'Arogyavardhini(Udupi)', 270, 60, 'tab', 4, 4, 'Udupi', 'ARG', 60, 270),
	(116, 9, 'Arogyavardhini(Dhoot)', 289, 60, 'tab', 1, 45, 'Dhootpapeswr', 'ARG', 100, 174),
	(117, 9, 'Bilwadi Gutika', 300, 60, 'tab', 3, 178, 'Udupi', 'BIL', 60, 300),
	(118, 9, 'Brahmi Vati', 231, 60, 'tab', 7, 31, 'Dhootpapeswr', 'BRMH', 60, 231),
	(119, 9, 'Bramhi', 300, 60, 'tab', 0, 0, 'Unjha', 'BRMH', 60, 300),
	(120, 9, 'Chandraprabha(Udupi)', 300, 60, 'tab', 0, 0, 'Udupi', 'CHR', 60, 300),
	(121, 9, 'Chandraprabha(Dhhot)', 300, 60, 'tab', 0, 0, 'Dhootpapeswr', 'CHR', 60, 300),
	(122, 9, 'Chandraprabha 40 tab(Unjha)', 300, 60, 'tab', 0, 0, 'Unjha', 'CHR', 60, 300),
	(123, 9, 'Chandraprabha 80 tab(Unjha)', 300, 60, 'tab', 0, 0, 'Unjha', 'CHR', 60, 300),
	(124, 9, 'ConVit', 180, 60, 'tab', 48, 41, 'Home', 'CON', 30, 360),
	(125, 9, 'Cow collestrum', 1365, 60, 'tab', 0, 0, 'Goseva', 'COW', 60, 1365),
	(126, 9, 'Dhanvantaram ', 300, 60, 'tab', 11, 25, 'Udupi', 'DHN', 60, 300),
	(127, 9, 'Garbhpaal Ras', 95, 60, 'tab', 11, 15, 'Unjha', 'GRBH', 60, 95),
	(128, 9, 'Garbhpaal Ras 80 tab', 90, 60, 'tab', 11, 16, 'Unjha', 'GRBH', 80, 68),
	(129, 9, 'Kanyalohadi 66', 66, 60, 'tab', 6, 15, 'Unjha', 'KNY', 60, 66),
	(130, 9, 'Kanyalohadi 75', 75, 60, 'tab', 5, 16, 'Unjha', 'KNY', 60, 75),
	(131, 9, 'Kanyalohadi 100', 100, 60, 'tab', 1, 18, 'Unjha', 'KNY', 80, 75),
	(132, 9, 'Kanyalohadi 80 tab(Unjha)', 90, 60, 'tab', 5, 20, 'Unjha', 'KNY', 80, 68),
	(133, 9, 'Mahasudarshan vati', 115, 60, 'tab', 19, 31, 'Unjha', 'MAHS', 60, 115),
	(134, 9, 'Mahasudarshan vati 80 tab', 130, 60, 'tab', 11, 45, 'Unjha', 'MAHS', 80, 98),
	(135, 9, 'Punarnava mandoor', 100, 60, 'tab', 6, 17, 'Unjha', 'PUM', 80, 75),
	(136, 9, 'Punarnava mandoor 40 tab', 55, 60, 'tab', 12, 12, 'Unjha', 'PUM', 40, 83),
	(137, 9, 'Punarvava Mandur', 100, 60, 'tab', 1, 16, 'Unjha', 'PUM', 60, 100),
	(138, 9, 'Saptamrit', 75, 60, 'tab', 10, 15, 'Unjha', 'SPT', 60, 75),
	(139, 9, 'Saptamrit 80 tabs', 100, 60, 'tab', 11, 17, 'Unjha', 'SPT', 80, 75),
	(140, 9, 'Smritisagar Ras', 130, 60, 'tab', 9, 18, 'Unjha', 'SMR', 80, 98),
	(141, 9, 'Smritisagar Ras 40 tab', 300, 60, 'tab', 0, 0, 'Unjha', 'SMR', 60, 300),
	(142, 9, 'Sootashekhar Ras(Udupi)', 300, 60, 'tab', 0, 0, 'Udupi', 'SUT', 60, 300),
	(143, 9, 'Sootashekhar Ras(Dhoot)', 83, 60, 'tab', 11, 15, 'Dhootpapeswr', 'SUT', 20, 249),
	(144, 9, 'Yashtimadhu', 135, 60, 'tab', 20, 30, 'Nagarjuna', 'YSHT', 60, 135),
	(145, 10, 'Alovera Shampoo', 0, 100, 'ml', 0, 0, 'Goseva', 'ALSHAMPOO', 100, 0),
	(146, 10, 'Angarakshak', 35, 50, 'grams', 14, 70, 'Goseva', 'ANGR', 50, 35),
	(147, 10, 'Dantmanjan', 35, 50, 'grams', 14, 70, 'Goseva', 'DNT', 50, 35),
	(148, 10, 'Dhatri Rasayan', 0, 0, 'grams', 0, 0, 'Unjha', 'DHATRI', 0, 0),
	(149, 10, 'Dhoop(Akola)', 35, 30, 'number', 3, 75, 'Akola', 'DHOOP', 30, 35),
	(150, 10, 'Dhoop(Goseva)', 0, 0, 'number', 0, 0, 'Goseva', 'DHOOP', 0, 0),
	(151, 10, 'Dhoop(Venumadhuri)', 50, 20, 'number', 42, 59, 'Venumadhuri', 'DHOOP', 20, 50),
	(152, 10, 'Dishwash gel', 70, 250, 'ml', 3, 279, 'Goseva', 'DISH', 250, 70),
	(153, 10, 'Facepack', 65, 100, 'grams', 5, 125, 'Goseva', 'FCP', 100, 65),
	(154, 10, 'Floor Cleaner', 0, 0, 'ml', 0, 0, 'Goseva', 'FLOOR', 0, 0),
	(155, 10, 'Gopika Carbon', 45, 75, 'grams', 1, 95, 'Goseva', 'GCS', 75, 45),
	(156, 10, 'Gopika Panchgavya Soap', 0, 0, 'grams', 0, 0, 'Goseva', 'GPS', 0, 0),
	(157, 10, 'Handwash', 65, 200, 'ml', 13, 212, 'Goseva', 'HAND', 200, 65),
	(158, 10, 'Honey', 150, 250, 'ml', 2, 375, 'Venumadhuri', 'HONEY', 250, 150),
	(159, 10, 'Kesari Gulkand', 170, 400, 'grams', 4, 460, 'lion', 'GUL', 400, 170),
	(160, 10, 'Maraham', 30, 15, 'grams', 6, 50, 'Goseva', 'MARH', 15, 30),
	(161, 10, 'Oxygel', 0, 0, 'grams', 0, 0, 'Goseva', 'OXY', 0, 0),
	(162, 10, 'Panchagavya Moisturizing lotion', 70, 100, 'ml', 10, 122, 'Goseva', 'LOTION', 100, 70),
	(163, 10, 'Shampoo', 110, 125, 'ml', 3, 145, 'Venumadhuri', 'SHAMPOO', 125, 110),
	(164, 10, 'Shatavari Kalp', 122, 125, 'grams', 6, 160, 'Dhootpapeswr', 'SHTVARI', 125, 122),
	(165, 10, 'Toilet cleaner', 70, 500, 'ml', 2, 502, 'Goseva', 'TOI', 500, 70),
	(166, 10, 'Ubtan', 0, 0, 'grams', 0, 0, 'Goseva', 'UBT', 0, 0),
	(167, 11, 'Angamardan', 70, 60, 'ml', 12, 71, 'Goseva', 'ANGM', 60, 70),
	(168, 11, 'Bramhi Amla', 90, 100, 'ml', 3, 115, 'Goseva', 'BRMHLA', 100, 90),
	(169, 11, 'Castor Oil', 10, 100, 'ml', 10, 100, 'Goseva', 'CO', 100, 10),
	(170, 11, 'Liv Oil', 10, 100, 'ml', 10, 100, 'Goseva', 'LO', 100, 10);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;

-- Dumping structure for table ehr2.medicine_type
CREATE TABLE IF NOT EXISTS `medicine_type` (
  `Type_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Type_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table ehr2.medicine_type: ~11 rows (approximately)
/*!40000 ALTER TABLE `medicine_type` DISABLE KEYS */;
INSERT INTO `medicine_type` (`Type_ID`, `Type_Name`) VALUES
	(1, 'Alovera'),
	(2, 'Ark'),
	(3, 'Asava-Arishta'),
	(4, 'Choorna'),
	(5, 'Drops'),
	(6, 'Ghanavati'),
	(7, 'Ghrita'),
	(8, 'Guggulu'),
	(9, 'Gutika-Vati'),
	(10, 'Other'),
	(11, 'Tailam');
/*!40000 ALTER TABLE `medicine_type` ENABLE KEYS */;

-- Dumping structure for table ehr2.modern
CREATE TABLE IF NOT EXISTS `modern` (
  `Mod_ID` varchar(50) NOT NULL,
  `Mod_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Mod_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table ehr2.modern: ~2 rows (approximately)
/*!40000 ALTER TABLE `modern` DISABLE KEYS */;
INSERT INTO `modern` (`Mod_ID`, `Mod_Name`) VALUES
	('dolo', 'dolo'),
	('nimdisp', 'nimdispi');
/*!40000 ALTER TABLE `modern` ENABLE KEYS */;

-- Dumping structure for procedure ehr2.patient_medicine_data
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `patient_medicine_data`(
	IN `id` VARCHAR(50),
	IN `visit` INT,
	IN `typename` VARCHAR(50),
	IN `name` VARCHAR(50),
	IN `billable` VARCHAR(50),
	IN `given` INT,
	IN `available` INT,
	IN `basic` INT
,
	IN `quantity` VARCHAR(100),
	IN `whenval` VARCHAR(100),
	IN `how` VARCHAR(100)

)
BEGIN

INSERT INTO patient_medicine (Patient_ID,Visit_Number,Medicine_Type_ID,Medicine_Name,Billable,Given,Quantity,Whenval,How) VALUES (id,visit,typename,name,billable,given,quantity,whenval,how);
END//
DELIMITER ;

-- Dumping structure for table ehr2.state
CREATE TABLE IF NOT EXISTS `state` (
  `State_ID` varchar(10) NOT NULL,
  `State_Name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`State_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table ehr2.state: ~35 rows (approximately)
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` (`State_ID`, `State_Name`) VALUES
	('AN', 'Andaman and Nicobar '),
	('AP', 'Andhra Pradesh'),
	('AR', 'Arunachal Pradesh'),
	('AS', 'Assam'),
	('BI', 'Bihar'),
	('CD', 'Chandigarh'),
	('CH', 'Chhattisgarh'),
	('DD', 'Daman and Diu'),
	('DE', 'Delhi'),
	('DN', 'Dadra and Nagar Have'),
	('GJ', 'Gujarat'),
	('GO', 'Goa'),
	('HA', 'Haryana'),
	('HP', 'Himachal Pradesh'),
	('JH', 'Jharkhand'),
	('JK', 'Jammu and Kashmir'),
	('KE', 'Kerala'),
	('KR', 'Karnataka'),
	('LD', 'Lakshadweep'),
	('ME', 'Meghalaya'),
	('MH', 'Maharashtra'),
	('MI', 'Mizoram'),
	('MN', 'Manipur'),
	('MP', 'Madhya Pradesh'),
	('NA', 'Nagaland'),
	('OD', 'Odisha'),
	('PD', 'Puducherry'),
	('PJ', 'Punjab'),
	('RJ', 'Rajasthan'),
	('SK', 'Sikkim'),
	('TM', 'Tamil Nadu'),
	('TR', 'Tripura'),
	('UK', 'Uttarakhand'),
	('UP', 'Uttar Pradesh'),
	('WB', 'West Bengal');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;

-- Dumping structure for procedure ehr2.stock_update
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `stock_update`(
	IN `typename` VARCHAR(50),
	IN `name` VARCHAR(50),
	IN `typeval` VARCHAR(50)

,
	IN `amount` INT,
	IN `username` VARCHAR(50)







)
BEGIN
insert into stock_transaction (Type_Name,Medicine_Name,Typeval,Amount,Updated_By,Timeval) values (typename,name,typeval,amount,username,now());
	if typeval like 'credit' 
	then
		update stock_master set Available=Available+amount where Medicine_Name=name;
	end if;
	
	if typeval like 'debit'
	then
		update stock_master set Available = Available-amount where Medicine_Name=name;
	END if;
END//
DELIMITER ;

-- Dumping structure for table ehr2.table_seq
CREATE TABLE IF NOT EXISTS `table_seq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ehr2.table_seq: ~0 rows (approximately)
/*!40000 ALTER TABLE `table_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_seq` ENABLE KEYS */;

-- Dumping structure for table ehr2.userprofile
CREATE TABLE IF NOT EXISTS `userprofile` (
  `Name` varchar(50) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Password` varchar(50) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table ehr2.userprofile: ~3 rows (approximately)
/*!40000 ALTER TABLE `userprofile` DISABLE KEYS */;
INSERT INTO `userprofile` (`Name`, `ID`, `Password`, `Phone`, `Type`) VALUES
	('santosh', 1, '12345', 2147483647, 'Doctor'),
	('7', 7, 'admin', 1111111, 'Admin'),
	('admin', 8, 'admin123', 111111, 'Tech');
/*!40000 ALTER TABLE `userprofile` ENABLE KEYS */;

-- Dumping structure for trigger ehr2.patient_id_gen
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `patient_id_gen` BEFORE INSERT ON `patient_master` FOR EACH ROW BEGIN
  /*INSERT INTO table_seq VALUES (NULL);
  SET NEW.Patient_ID = CONCAT('EHR', LPAD(LAST_INSERT_ID(), 3, '0'));*/
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
