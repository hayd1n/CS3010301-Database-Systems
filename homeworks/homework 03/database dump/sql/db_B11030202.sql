-- -------------------------------------------------------------
-- TablePlus 6.1.2(568)
--
-- https://tableplus.com/
--
-- Database: db_B11030202
-- Generation Time: 2025-05-12 03:58:41.9810
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `6_10_a` (
  `Fname` text,
  `Minit` text,
  `Lname` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `6_10_b` (
  `Fname` text,
  `Minit` text,
  `Lname` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `6_10_c` (
  `Fname` text,
  `Minit` text,
  `Lname` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `6_12_a` (
  `Course_name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `6_12_b` (
  `Course_name` text,
  `Instructor` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `6_12_c` (
  `Course_number` text,
  `Semester` text,
  `Year` int DEFAULT NULL,
  `COUNT(*)` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `6_12_d` (
  `Name` text,
  `Course_Name` text,
  `Course_number` text,
  `Credit_Hours` int DEFAULT NULL,
  `Semester` text,
  `YEAR` int DEFAULT NULL,
  `GRADE` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `7_5_a` (
  `Dname` text,
  `WORKECOUNT` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `7_5_b` (
  `Dname` text,
  `WORKECOUNT` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `COURSE` (
  `Course_name` varchar(60) NOT NULL,
  `Course_number` varchar(10) NOT NULL,
  `Credit_hours` int NOT NULL,
  `Department` varchar(10) NOT NULL,
  PRIMARY KEY (`Course_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `DEPARTMENT` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int NOT NULL,
  `Mgr_ssn` char(9) NOT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `Dname` (`Dname`),
  KEY `Mgr_ssn` (`Mgr_ssn`),
  CONSTRAINT `DEPARTMENT_ibfk_1` FOREIGN KEY (`Mgr_ssn`) REFERENCES `EMPLOYEE` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `DEPENDENT` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(15) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`),
  CONSTRAINT `DEPENDENT_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `EMPLOYEE` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `DEPT_LOCATIONS` (
  `Dnumber` int NOT NULL,
  `Dlocation` varchar(15) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `DEPT_LOCATIONS_ibfk_1` FOREIGN KEY (`Dnumber`) REFERENCES `DEPARTMENT` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `EMPLOYEE` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int NOT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `Dno` (`Dno`),
  KEY `Super_ssn` (`Super_ssn`),
  CONSTRAINT `EMPLOYEE_ibfk_1` FOREIGN KEY (`Dno`) REFERENCES `DEPARTMENT` (`Dnumber`),
  CONSTRAINT `EMPLOYEE_ibfk_2` FOREIGN KEY (`Super_ssn`) REFERENCES `EMPLOYEE` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `GRADE_REPORT` (
  `Student_number` int NOT NULL,
  `Section_identifier` int NOT NULL,
  `Grade` char(1) NOT NULL,
  PRIMARY KEY (`Student_number`,`Section_identifier`),
  KEY `Section_identifier` (`Section_identifier`),
  CONSTRAINT `GRADE_REPORT_ibfk_1` FOREIGN KEY (`Student_number`) REFERENCES `STUDENT` (`Student_number`),
  CONSTRAINT `GRADE_REPORT_ibfk_2` FOREIGN KEY (`Section_identifier`) REFERENCES `SECTION` (`Section_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `PREREQUISITE` (
  `Course_number` varchar(10) NOT NULL,
  `Prerequisite_number` varchar(10) NOT NULL,
  PRIMARY KEY (`Course_number`,`Prerequisite_number`),
  KEY `Prerequisite_number` (`Prerequisite_number`),
  CONSTRAINT `PREREQUISITE_ibfk_1` FOREIGN KEY (`Course_number`) REFERENCES `COURSE` (`Course_number`),
  CONSTRAINT `PREREQUISITE_ibfk_2` FOREIGN KEY (`Prerequisite_number`) REFERENCES `COURSE` (`Course_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `PROJECT` (
  `Pname` varchar(15) NOT NULL,
  `Pnumber` int NOT NULL,
  `Plocation` varchar(15) DEFAULT NULL,
  `Dnum` int NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `Pname` (`Pname`),
  KEY `Dnum` (`Dnum`),
  CONSTRAINT `PROJECT_ibfk_1` FOREIGN KEY (`Dnum`) REFERENCES `DEPARTMENT` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `SECTION` (
  `Section_identifier` int NOT NULL,
  `Course_number` varchar(10) NOT NULL,
  `Semester` varchar(10) NOT NULL,
  `Year` int NOT NULL,
  `Instructor` varchar(15) NOT NULL,
  PRIMARY KEY (`Section_identifier`),
  KEY `Course_number` (`Course_number`),
  CONSTRAINT `SECTION_ibfk_1` FOREIGN KEY (`Course_number`) REFERENCES `COURSE` (`Course_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `STUDENT` (
  `Name` varchar(20) NOT NULL,
  `Student_number` int NOT NULL,
  `Class` int NOT NULL,
  `Major` varchar(10) NOT NULL,
  PRIMARY KEY (`Student_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `WORKS_ON` (
  `Essn` char(9) NOT NULL,
  `Pno` int NOT NULL,
  `Hours` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `Pno` (`Pno`),
  CONSTRAINT `WORKS_ON_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `EMPLOYEE` (`Ssn`),
  CONSTRAINT `WORKS_ON_ibfk_2` FOREIGN KEY (`Pno`) REFERENCES `PROJECT` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `6_10_a` (`Fname`, `Minit`, `Lname`) VALUES
('Franklin', 'T', 'Wong'),
('Ramesh', 'K', 'Narayan');

INSERT INTO `6_10_b` (`Fname`, `Minit`, `Lname`) VALUES
('John', 'B', 'Smith'),
('Franklin', 'T', 'Wong'),
('Joyce', 'A', 'English');

INSERT INTO `6_10_c` (`Fname`, `Minit`, `Lname`) VALUES
('Franklin', 'T', 'Wong'),
('Ahmad', 'V', 'Jabbar'),
('Alicia', 'J', 'Zelaya');

INSERT INTO `6_12_a` (`Course_name`) VALUES
('Intro to Computer Science'),
('Data Structures'),
('Database');

INSERT INTO `6_12_b` (`Course_name`, `Instructor`) VALUES
('Discrete Mathematics', 'Chang'),
('Intro to Computer Science', 'Anderson'),
('Database', 'Stone');

INSERT INTO `6_12_c` (`Course_number`, `Semester`, `Year`, `COUNT(*)`) VALUES
('CS1310', 'Fall', 7, 1),
('CS1310', 'Fall', 8, 1);

INSERT INTO `7_5_a` (`Dname`, `WORKECOUNT`) VALUES
('Research', 4),
('Headquarters', 1),
('Administration', 3);

INSERT INTO `7_5_b` (`Dname`, `WORKECOUNT`) VALUES
('Research', 3),
('Headquarters', 1),
('Administration', 1);

INSERT INTO `COURSE` (`Course_name`, `Course_number`, `Credit_hours`, `Department`) VALUES
('Intro to Computer Science', 'CS1310', 4, 'CS'),
('Data Structures', 'CS3320', 4, 'CS'),
('Database', 'CS3380', 3, 'CS'),
('Financial Accounting', 'fac4390', 5, 'BUSINESS'),
('Discrete Mathematics', 'MATH2410', 3, 'MATH');

INSERT INTO `DEPARTMENT` (`Dname`, `Dnumber`, `Mgr_ssn`, `Mgr_start_date`) VALUES
('Headquarters', 1, '888665555', '1981-06-19'),
('Information Tec', 2, '987987987', '2007-10-01'),
('Administration', 4, '987654321', '1995-01-01'),
('Research', 5, '333445555', '1988-05-22');

INSERT INTO `DEPENDENT` (`Essn`, `Dependent_name`, `Sex`, `Bdate`, `Relationship`) VALUES
('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'),
('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse'),
('123456789', 'Michael', 'M', '1988-01-04', 'Son'),
('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
('888665555', 'John', 'M', NULL, 'Son');

INSERT INTO `DEPT_LOCATIONS` (`Dnumber`, `Dlocation`) VALUES
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Houston'),
(5, 'Sugarland');

INSERT INTO `EMPLOYEE` (`Fname`, `Minit`, `Lname`, `Ssn`, `Bdate`, `Address`, `Sex`, `Salary`, `Super_ssn`, `Dno`) VALUES
('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5),
('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5),
('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5),
('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5),
('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, NULL, 1),
('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4),
('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4),
('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4);

INSERT INTO `GRADE_REPORT` (`Student_number`, `Section_identifier`, `Grade`) VALUES
(8, 85, 'A'),
(8, 92, 'A'),
(8, 102, 'B'),
(8, 135, 'A'),
(17, 112, 'B'),
(17, 119, 'C');

INSERT INTO `PREREQUISITE` (`Course_number`, `Prerequisite_number`) VALUES
('CS3320', 'CS1310'),
('CS3380', 'CS3320'),
('CS3380', 'MATH2410');

INSERT INTO `PROJECT` (`Pname`, `Pnumber`, `Plocation`, `Dnum`) VALUES
('ProductX', 1, 'Houston', 1),
('ProductY', 2, 'Houston', 1),
('ProductZ', 3, 'Houston', 1),
('6Sigma', 4, 'Houston', 1),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

INSERT INTO `SECTION` (`Section_identifier`, `Course_number`, `Semester`, `Year`, `Instructor`) VALUES
(85, 'MATH2410', 'Fall', 7, 'King'),
(92, 'CS1310', 'Fall', 7, 'Anderson'),
(102, 'CS3320', 'Spring', 8, 'Knuth'),
(112, 'MATH2410', 'Fall', 8, 'Chang'),
(119, 'CS1310', 'Fall', 8, 'Anderson'),
(135, 'CS3380', 'Fall', 8, 'Stone');

INSERT INTO `STUDENT` (`Name`, `Student_number`, `Class`, `Major`) VALUES
('Brown', 8, 2, 'CS'),
('Smith', 17, 3, 'CS'),
('Robin', 34, 3, 'BUSINESS');

INSERT INTO `WORKS_ON` (`Essn`, `Pno`, `Hours`) VALUES
('123456789', 1, 32.5),
('123456789', 2, 7.5),
('333445555', 2, 10.0),
('333445555', 3, 10.0),
('333445555', 10, 10.0),
('333445555', 20, 10.0),
('453453453', 1, 20.0),
('453453453', 2, 20.0),
('666884444', 3, 40.0),
('888665555', 20, NULL),
('987654321', 20, 15.0),
('987654321', 30, 20.0),
('987987987', 10, 35.0),
('987987987', 30, 5.0),
('999887777', 10, 10.0),
('999887777', 30, 30.0);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;