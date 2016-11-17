-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2016 at 06:58 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `connormarkulaassigment`
--
CREATE DATABASE IF NOT EXISTS `connormarkulaassigment` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `connormarkulaassigment`;

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE IF NOT EXISTS `administrator` (
  `administratorID` int(11) NOT NULL,
  `administratorUsername` varchar(45) NOT NULL,
  `administratorPassword` varchar(64) NOT NULL,
  `administratorSalt` varchar(64) NOT NULL,
  `administratorFirstName` varchar(45) NOT NULL,
  `administratorLastName` varchar(45) NOT NULL,
  `employeeID` int(11) NOT NULL,
  PRIMARY KEY (`administratorID`),
  KEY `fk_administrator_employee1_idx` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`administratorID`, `administratorUsername`, `administratorPassword`, `administratorSalt`, `administratorFirstName`, `administratorLastName`, `employeeID`) VALUES
(1, 'admin', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Bob', 'bun', 1),
(2, 'administrator', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'Jacob', 'wood', 3),
(3, 'n876543', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 'John', 'ball', 1);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE IF NOT EXISTS `appointment` (
  `appointmentID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `employeeID` int(11) NOT NULL,
  `typeID` int(11) NOT NULL,
  `appointmentDate` date NOT NULL,
  `appointmentTime` time NOT NULL,
  PRIMARY KEY (`appointmentID`),
  KEY `fk_appointment_Customer1_idx` (`customerID`),
  KEY `fk_appointment_Employee1_idx` (`employeeID`),
  KEY `fk_appointment_appointment_type1_idx` (`typeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentID`, `customerID`, `employeeID`, `typeID`, `appointmentDate`, `appointmentTime`) VALUES
(1, 1, 2, 1, '2016-10-13', '16:35:00'),
(2, 3, 2, 1, '2016-10-13', '09:00:00'),
(3, 2, 3, 1, '2016-10-11', '09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_type`
--

CREATE TABLE IF NOT EXISTS `appointment_type` (
  `typeID` int(11) NOT NULL,
  `appiontmentType` varchar(45) NOT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appointment_type`
--

INSERT INTO `appointment_type` (`typeID`, `appiontmentType`) VALUES
(1, 'meeting with customers'),
(2, 'meeting with emplyees');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `customerFirstName` varchar(45) NOT NULL,
  `customerLastName` varchar(45) NOT NULL,
  `customerEmail` varchar(45) NOT NULL,
  `customerStreet` varchar(45) DEFAULT NULL,
  `customerSuburb` varchar(45) DEFAULT NULL,
  `customerPostcode` char(4) DEFAULT NULL,
  `customerHomePhone` varchar(45) NOT NULL,
  `customerMobile` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `customerFirstName`, `customerLastName`, `customerEmail`, `customerStreet`, `customerSuburb`, `customerPostcode`, `customerHomePhone`, `customerMobile`) VALUES
(1, 'Nathan', 'Banks', 'Nathan@banks.com', NULL, NULL, NULL, '0734561234', NULL),
(2, 'Jade', 'Bank', 'Jade@bank.com', '223 door st', NULL, '', '76542384', NULL),
(3, 'Connor', 'Max', 'connor@max.com', '155 south road', 'bankstown', NULL, '43267543', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `employeeID` int(11) NOT NULL AUTO_INCREMENT,
  `employeeFirstName` varchar(45) NOT NULL,
  `employeeLastName` varchar(45) NOT NULL,
  `dateCommenced` date NOT NULL,
  `positionID` int(11) NOT NULL,
  `employeeHomePhone` varchar(45) DEFAULT NULL,
  `employeeMoblie` varchar(45) NOT NULL,
  PRIMARY KEY (`employeeID`),
  KEY `fk_Employee_position_idx` (`positionID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeID`, `employeeFirstName`, `employeeLastName`, `dateCommenced`, `positionID`, `employeeHomePhone`, `employeeMoblie`) VALUES
(1, 'Simon', 'Book', '2016-10-12', 1, '078888888', ''),
(2, 'John', 'Ball', '2016-10-02', 3, '0754235678', ''),
(3, 'Malcom', 'Walter', '2016-10-13', 2, '0732455678', '');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `invoiceID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `employeeID` int(11) NOT NULL,
  `dateOfInvoice` date NOT NULL,
  PRIMARY KEY (`invoiceID`),
  KEY `fk_Invoice_Customer1_idx` (`customerID`),
  KEY `fk_Invoice_Employee1_idx` (`employeeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoiceID`, `customerID`, `employeeID`, `dateOfInvoice`) VALUES
(1, 1, 2, '2016-10-10'),
(2, 1, 2, '2016-10-16'),
(3, 3, 2, '2016-10-18');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_product`
--

CREATE TABLE IF NOT EXISTS `invoice_product` (
  `invoiceID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`invoiceID`,`productID`),
  KEY `fk_invoice_product_product1_idx` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice_product`
--

INSERT INTO `invoice_product` (`invoiceID`, `productID`, `qty`) VALUES
(1, 1, 1),
(2, 2, 3),
(2, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `payslip`
--

CREATE TABLE IF NOT EXISTS `payslip` (
  `payslipID` int(11) NOT NULL AUTO_INCREMENT,
  `payslipPayment` int(11) NOT NULL,
  `payslipDate` date NOT NULL,
  `employeeID` int(11) NOT NULL,
  PRIMARY KEY (`payslipID`),
  KEY `fk_payslips_employee1_idx` (`employeeID`),
  KEY `employeeID` (`employeeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `payslip`
--

INSERT INTO `payslip` (`payslipID`, `payslipPayment`, `payslipDate`, `employeeID`) VALUES
(1, 5000, '2016-10-12', 1),
(3, 700, '2016-10-13', 2),
(4, 800, '2016-10-12', 3);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE IF NOT EXISTS `position` (
  `positionID` int(11) NOT NULL AUTO_INCREMENT,
  `positionName` varchar(45) NOT NULL,
  PRIMARY KEY (`positionID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`positionID`, `positionName`) VALUES
(1, 'web developer'),
(2, 'cashier'),
(3, 'IT help desk');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(45) NOT NULL,
  `productPrice` decimal(14,2) NOT NULL,
  `productCurrentStock` int(11) NOT NULL,
  PRIMARY KEY (`product`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product`, `productName`, `productPrice`, `productCurrentStock`) VALUES
(1, 'USB 5gb', '5.00', 5),
(2, 'laptop', '1000.00', 10),
(3, 'Hard Drive 1 TB', '75.00', 5),
(4, 'Intel CPU', '400.00', 5),
(5, 'AMD CPU', '450.00', 13);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `fk_administrator_employee1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON UPDATE CASCADE;

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `fk_appointment_Customer1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_appointment_Employee1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_appointment_appointment_type1` FOREIGN KEY (`typeID`) REFERENCES `appointment_type` (`typeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_Employee_position` FOREIGN KEY (`positionID`) REFERENCES `position` (`positionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `fk_Invoice_Customer1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Invoice_Employee1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON UPDATE CASCADE;

--
-- Constraints for table `invoice_product`
--
ALTER TABLE `invoice_product`
  ADD CONSTRAINT `fk_invoice_product_Invoice1` FOREIGN KEY (`invoiceID`) REFERENCES `invoice` (`invoiceID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_invoice_product_product1` FOREIGN KEY (`productID`) REFERENCES `product` (`product`) ON UPDATE CASCADE;

--
-- Constraints for table `payslip`
--
ALTER TABLE `payslip`
  ADD CONSTRAINT `fk_payslips_employee1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
