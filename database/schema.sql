-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: EmployeePayrollDBProject
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `EmployeePayrollDBProject`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `EmployeePayrollDBProject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `EmployeePayrollDBProject`;

--
-- Table structure for table `Attendance`
--

DROP TABLE IF EXISTS `Attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendance` (
  `Attendance_ID` int NOT NULL,
  `Employee_ID` int DEFAULT NULL,
  `Attendance_Date` date DEFAULT NULL,
  `Check_In_Time` time DEFAULT NULL,
  `Check_Out_Time` time DEFAULT NULL,
  `Working_Hours` decimal(4,2) DEFAULT NULL,
  `Attendance_Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Attendance_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `Attendance_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Check_Working_Hours` BEFORE INSERT ON `Attendance` FOR EACH ROW BEGIN
    IF NEW.Working_Hours < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Working hours cannot be negative';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Log_Attendance_Insert` AFTER INSERT ON `Attendance` FOR EACH ROW BEGIN
    INSERT INTO Attendance_Log
        (Attendance_ID, Employee_ID, Attendance_Date,
         Action_Type, Log_Time)
    VALUES
        (NEW.Attendance_ID, NEW.Employee_ID,
         NEW.Attendance_Date, 'INSERT', NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Log_Attendance_Delete` AFTER DELETE ON `Attendance` FOR EACH ROW BEGIN
    INSERT INTO Attendance_Delete_Log
        (Attendance_ID, Employee_ID, Attendance_Date, Deleted_At)
    VALUES
        (OLD.Attendance_ID, OLD.Employee_ID,
         OLD.Attendance_Date, NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Attendance_Delete_Log`
--

DROP TABLE IF EXISTS `Attendance_Delete_Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendance_Delete_Log` (
  `Log_ID` int NOT NULL AUTO_INCREMENT,
  `Attendance_ID` int DEFAULT NULL,
  `Employee_ID` int DEFAULT NULL,
  `Attendance_Date` date DEFAULT NULL,
  `Deleted_At` datetime DEFAULT NULL,
  PRIMARY KEY (`Log_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Attendance_Log`
--

DROP TABLE IF EXISTS `Attendance_Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendance_Log` (
  `Log_ID` int NOT NULL AUTO_INCREMENT,
  `Attendance_ID` int DEFAULT NULL,
  `Employee_ID` int DEFAULT NULL,
  `Attendance_Date` date DEFAULT NULL,
  `Action_Type` varchar(20) DEFAULT NULL,
  `Log_Time` datetime DEFAULT NULL,
  PRIMARY KEY (`Log_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `Department_ID` int NOT NULL,
  `Department_Name` varchar(50) NOT NULL,
  `Department_Description` varchar(100) DEFAULT NULL,
  `Manager_ID` int DEFAULT NULL,
  PRIMARY KEY (`Department_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `Department_Employee_View`
--

DROP TABLE IF EXISTS `Department_Employee_View`;
/*!50001 DROP VIEW IF EXISTS `Department_Employee_View`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Department_Employee_View` AS SELECT 
 1 AS `Department_Name`,
 1 AS `Employee_ID`,
 1 AS `First_Name`,
 1 AS `Last_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `Employee_ID` int NOT NULL,
  `First_Name` varchar(30) NOT NULL,
  `Last_Name` varchar(30) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Department_ID` int DEFAULT NULL,
  `Designation` varchar(50) DEFAULT NULL,
  `Date_of_Joining` date DEFAULT NULL,
  `Employment_Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `Department_ID` (`Department_ID`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`Department_ID`) REFERENCES `Department` (`Department_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Check_Employee_Email` BEFORE UPDATE ON `Employee` FOR EACH ROW BEGIN
    IF NEW.Email IS NULL OR TRIM(NEW.Email) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Email cannot be empty';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `High_Salary_Employees`
--

DROP TABLE IF EXISTS `High_Salary_Employees`;
/*!50001 DROP VIEW IF EXISTS `High_Salary_Employees`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `High_Salary_Employees` AS SELECT 
 1 AS `Employee_ID`,
 1 AS `First_Name`,
 1 AS `Last_Name`,
 1 AS `Basic_Salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Leave_Delete_Log`
--

DROP TABLE IF EXISTS `Leave_Delete_Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Leave_Delete_Log` (
  `Log_ID` int NOT NULL AUTO_INCREMENT,
  `Leave_ID` int DEFAULT NULL,
  `Employee_ID` int DEFAULT NULL,
  `Leave_Type` varchar(30) DEFAULT NULL,
  `Deleted_At` datetime DEFAULT NULL,
  PRIMARY KEY (`Log_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Leave_Request`
--

DROP TABLE IF EXISTS `Leave_Request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Leave_Request` (
  `Leave_ID` int NOT NULL,
  `Employee_ID` int DEFAULT NULL,
  `Leave_Type` varchar(30) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Number_of_Days` int DEFAULT NULL,
  `Reason` varchar(100) DEFAULT NULL,
  `Request_Date` date DEFAULT NULL,
  `Approval_Status` varchar(20) DEFAULT NULL,
  `Approved_By` int DEFAULT NULL,
  PRIMARY KEY (`Leave_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `Leave_Request_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Log_Leave_Delete` AFTER DELETE ON `Leave_Request` FOR EACH ROW BEGIN
    INSERT INTO Leave_Delete_Log
        (Leave_ID, Employee_ID, Leave_Type, Deleted_At)
    VALUES
        (OLD.Leave_ID, OLD.Employee_ID,
         OLD.Leave_Type, NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Payroll`
--

DROP TABLE IF EXISTS `Payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payroll` (
  `Payroll_ID` int NOT NULL,
  `Employee_ID` int DEFAULT NULL,
  `Salary_ID` int DEFAULT NULL,
  `Payroll_Month` int DEFAULT NULL,
  `Payroll_Year` int DEFAULT NULL,
  `Total_Working_Days` int DEFAULT NULL,
  `Days_Present` int DEFAULT NULL,
  `Days_Absent` int DEFAULT NULL,
  `Overtime_Hours` decimal(5,2) DEFAULT NULL,
  `Gross_Salary` decimal(10,2) DEFAULT NULL,
  `Total_Deductions` decimal(10,2) DEFAULT NULL,
  `Net_Salary` decimal(10,2) DEFAULT NULL,
  `Payment_Date` date DEFAULT NULL,
  `Payment_Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Payroll_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  KEY `Salary_ID` (`Salary_ID`),
  CONSTRAINT `Payroll_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`),
  CONSTRAINT `Payroll_ibfk_2` FOREIGN KEY (`Salary_ID`) REFERENCES `Salary` (`Salary_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Log_Payroll_Status` AFTER UPDATE ON `Payroll` FOR EACH ROW BEGIN
    IF NOT (OLD.Payment_Status <=> NEW.Payment_Status) THEN
        INSERT INTO Payroll_Status_Log
            (Payroll_ID, Old_Status, New_Status, Change_Time)
        VALUES
            (NEW.Payroll_ID, OLD.Payment_Status,
             NEW.Payment_Status, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Payroll_Status_Log`
--

DROP TABLE IF EXISTS `Payroll_Status_Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payroll_Status_Log` (
  `Log_ID` int NOT NULL AUTO_INCREMENT,
  `Payroll_ID` int DEFAULT NULL,
  `Old_Status` varchar(20) DEFAULT NULL,
  `New_Status` varchar(20) DEFAULT NULL,
  `Change_Time` datetime DEFAULT NULL,
  PRIMARY KEY (`Log_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Salary`
--

DROP TABLE IF EXISTS `Salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Salary` (
  `Salary_ID` int NOT NULL,
  `Employee_ID` int DEFAULT NULL,
  `Basic_Salary` decimal(10,2) DEFAULT NULL,
  `House_Rent_Allowance` decimal(10,2) DEFAULT NULL,
  `Other_Allowances` decimal(10,2) DEFAULT NULL,
  `Deductions` decimal(10,2) DEFAULT NULL,
  `Effective_From` date DEFAULT NULL,
  `Effective_To` date DEFAULT NULL,
  PRIMARY KEY (`Salary_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `Salary_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Check_Salary_Insert` BEFORE INSERT ON `Salary` FOR EACH ROW BEGIN
    IF NEW.Basic_Salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Basic salary cannot be negative';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Check_Salary_Update` BEFORE UPDATE ON `Salary` FOR EACH ROW BEGIN
    IF NEW.Basic_Salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Basic salary cannot be negative';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `User_Admin`
--

DROP TABLE IF EXISTS `User_Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Admin` (
  `User_ID` int NOT NULL,
  `Employee_ID` int DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password_Hash` varchar(100) DEFAULT NULL,
  `Role` varchar(30) DEFAULT NULL,
  `Created_At` date DEFAULT NULL,
  `Account_Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Username` (`Username`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `User_Admin_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `EmployeePayrollDBProject`
--

USE `EmployeePayrollDBProject`;

--
-- Final view structure for view `Department_Employee_View`
--

/*!50001 DROP VIEW IF EXISTS `Department_Employee_View`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Department_Employee_View` AS select `d`.`Department_Name` AS `Department_Name`,`e`.`Employee_ID` AS `Employee_ID`,`e`.`First_Name` AS `First_Name`,`e`.`Last_Name` AS `Last_Name` from (`Department` `d` join `Employee` `e` on((`d`.`Department_ID` = `e`.`Department_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `High_Salary_Employees`
--

/*!50001 DROP VIEW IF EXISTS `High_Salary_Employees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `High_Salary_Employees` AS select `e`.`Employee_ID` AS `Employee_ID`,`e`.`First_Name` AS `First_Name`,`e`.`Last_Name` AS `Last_Name`,`s`.`Basic_Salary` AS `Basic_Salary` from (`Employee` `e` join `Salary` `s` on((`e`.`Employee_ID` = `s`.`Employee_ID`))) where (`s`.`Basic_Salary` > 35000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-29 15:06:54
