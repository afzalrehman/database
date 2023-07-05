-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 05, 2023 at 09:05 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `huner_foundation`
--

-- --------------------------------------------------------

--
-- Table structure for table `admintable`
--

CREATE TABLE `admintable` (
  `adminID` int(10) NOT NULL,
  `adminName` varchar(60) NOT NULL,
  `adminEmail` varchar(50) NOT NULL,
  `adminCNIC` varchar(15) DEFAULT NULL,
  `adminContact` varchar(20) NOT NULL,
  `adminAddress` varchar(100) DEFAULT NULL,
  `adminRole` varchar(20) NOT NULL,
  `adminRegisteredOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admission_test_questions`
--

CREATE TABLE `admission_test_questions` (
  `qID` int(10) NOT NULL,
  `question` text NOT NULL,
  `option1` varchar(100) NOT NULL,
  `option2` varchar(100) NOT NULL,
  `option3` varchar(100) NOT NULL,
  `option4` varchar(100) NOT NULL,
  `correctAnswer` varchar(100) NOT NULL,
  `marks` int(10) NOT NULL,
  `section` varchar(30) NOT NULL,
  `addedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `addedBy` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `courseID` varchar(30) NOT NULL,
  `courseName` varchar(100) NOT NULL,
  `courseDuration` varchar(20) NOT NULL,
  `courseFeePerMonth` int(10) NOT NULL,
  `offeredBy` int(10) NOT NULL,
  `courseType` varchar(20) NOT NULL,
  `addedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `addedBy` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_result`
--

CREATE TABLE `exam_result` (
  `examID` int(10) NOT NULL,
  `obtMarks` float NOT NULL,
  `totalMarks` int(20) NOT NULL,
  `stdPercentage` float NOT NULL,
  `passStatus` varchar(20) NOT NULL,
  `stdCNIC` varchar(15) NOT NULL,
  `testDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_voucher`
--

CREATE TABLE `fee_voucher` (
  `voucherID` varchar(30) NOT NULL,
  `issueDate` varchar(100) NOT NULL,
  `dueDate` varchar(20) NOT NULL,
  `totalFee` int(10) NOT NULL,
  `feeType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_voucher_file`
--

CREATE TABLE `fee_voucher_file` (
  `fileID` int(10) NOT NULL,
  `voucherID` varchar(30) NOT NULL,
  `voucher` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `institutes`
--

CREATE TABLE `institutes` (
  `insID` int(10) NOT NULL,
  `instituteName` varchar(100) NOT NULL,
  `instituteLocation` varchar(100) NOT NULL,
  `addedBy` varchar(15) NOT NULL,
  `addedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `loginID` int(10) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `CNIC` varchar(15) NOT NULL,
  `loginPassword` varchar(20) NOT NULL,
  `userType` varchar(20) NOT NULL,
  `currentLogin` datetime DEFAULT current_timestamp(),
  `lastLogin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stdID` int(10) NOT NULL,
  `stdFullName` varchar(60) NOT NULL,
  `stdCNIC` varchar(15) DEFAULT NULL,
  `stdEmail` varchar(50) NOT NULL,
  `stdContact` varchar(20) NOT NULL,
  `stdFatherName` varchar(60) DEFAULT NULL,
  `stdFatherCNIC` varchar(20) DEFAULT NULL,
  `stdAge` varchar(10) DEFAULT NULL,
  `stdGender` varchar(20) DEFAULT NULL,
  `stdAddress` varchar(100) DEFAULT NULL,
  `stdCity` varchar(20) DEFAULT NULL,
  `registeredOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `stdStatus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_attempt`
--

CREATE TABLE `student_attempt` (
  `attemptID` int(10) NOT NULL,
  `qID` int(10) NOT NULL,
  `stdChoice` varchar(100) NOT NULL,
  `isCorrect` tinyint(1) NOT NULL,
  `marksObtained` int(10) NOT NULL,
  `stdCNIC` varchar(15) NOT NULL,
  `attemptTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_documents`
--

CREATE TABLE `student_documents` (
  `docID` int(10) NOT NULL,
  `stdCNIC` varchar(15) NOT NULL,
  `stdImage` blob NOT NULL,
  `stdCNICFront` blob NOT NULL,
  `stdCNICBack` blob NOT NULL,
  `stdMarksheetFront` blob NOT NULL,
  `stdMarksheetBack` blob NOT NULL,
  `stdFatherCNICFront` blob NOT NULL,
  `stdFatherCNICBack` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_education`
--

CREATE TABLE `student_education` (
  `eduID` int(10) NOT NULL,
  `stdCNIC` varchar(15) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `trade` varchar(100) NOT NULL,
  `instituteName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_enrollments`
--

CREATE TABLE `student_enrollments` (
  `enrollID` int(10) NOT NULL,
  `courseID` varchar(30) NOT NULL,
  `voucherID` varchar(30) NOT NULL,
  `stdCNIC` varchar(15) NOT NULL,
  `profileCompletionStatus` tinyint(1) DEFAULT NULL,
  `admissionFeeStatus` tinyint(1) DEFAULT NULL,
  `addedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `enrollmentCofirmedBy` varchar(15) DEFAULT NULL,
  `paidVoucher` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_sections`
--

CREATE TABLE `test_sections` (
  `sectionID` varchar(30) NOT NULL,
  `sectionName` varchar(100) NOT NULL,
  `trade` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admintable`
--
ALTER TABLE `admintable`
  ADD PRIMARY KEY (`adminID`),
  ADD UNIQUE KEY `adminCNIC` (`adminCNIC`);

--
-- Indexes for table `admission_test_questions`
--
ALTER TABLE `admission_test_questions`
  ADD PRIMARY KEY (`qID`),
  ADD KEY `fk_section` (`section`),
  ADD KEY `fk_add_admin_cnic` (`addedBy`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`courseID`),
  ADD KEY `fk_courses_admin_cnic` (`addedBy`),
  ADD KEY `fk_ins` (`offeredBy`);

--
-- Indexes for table `exam_result`
--
ALTER TABLE `exam_result`
  ADD PRIMARY KEY (`examID`),
  ADD KEY `fk_std_exam_cnic` (`stdCNIC`);

--
-- Indexes for table `fee_voucher`
--
ALTER TABLE `fee_voucher`
  ADD PRIMARY KEY (`voucherID`);

--
-- Indexes for table `fee_voucher_file`
--
ALTER TABLE `fee_voucher_file`
  ADD PRIMARY KEY (`fileID`),
  ADD KEY `fk_voucher_file` (`voucherID`);

--
-- Indexes for table `institutes`
--
ALTER TABLE `institutes`
  ADD PRIMARY KEY (`insID`),
  ADD KEY `fk_ins_admin_cnic` (`addedBy`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`loginID`),
  ADD KEY `fk_admin_cnic` (`CNIC`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stdID`),
  ADD UNIQUE KEY `stdCNIC` (`stdCNIC`);

--
-- Indexes for table `student_attempt`
--
ALTER TABLE `student_attempt`
  ADD PRIMARY KEY (`attemptID`),
  ADD KEY `fk_std_attempt_cnic` (`stdCNIC`),
  ADD KEY `fk_qID` (`qID`);

--
-- Indexes for table `student_documents`
--
ALTER TABLE `student_documents`
  ADD PRIMARY KEY (`docID`),
  ADD KEY `fk_std_doc_cnic` (`stdCNIC`);

--
-- Indexes for table `student_education`
--
ALTER TABLE `student_education`
  ADD PRIMARY KEY (`eduID`),
  ADD UNIQUE KEY `stdCNIC` (`stdCNIC`);

--
-- Indexes for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  ADD PRIMARY KEY (`enrollID`),
  ADD KEY `fk_enrol_admin_cnic` (`enrollmentCofirmedBy`),
  ADD KEY `fk_std_enrol_cnic` (`stdCNIC`),
  ADD KEY `fk_voucher` (`voucherID`),
  ADD KEY `fk_course` (`courseID`);

--
-- Indexes for table `test_sections`
--
ALTER TABLE `test_sections`
  ADD PRIMARY KEY (`sectionID`),
  ADD KEY `fk_course_section` (`trade`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admintable`
--
ALTER TABLE `admintable`
  MODIFY `adminID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admission_test_questions`
--
ALTER TABLE `admission_test_questions`
  MODIFY `qID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_result`
--
ALTER TABLE `exam_result`
  MODIFY `examID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_voucher_file`
--
ALTER TABLE `fee_voucher_file`
  MODIFY `fileID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `institutes`
--
ALTER TABLE `institutes`
  MODIFY `insID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `loginID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `stdID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_attempt`
--
ALTER TABLE `student_attempt`
  MODIFY `attemptID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_documents`
--
ALTER TABLE `student_documents`
  MODIFY `docID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_education`
--
ALTER TABLE `student_education`
  MODIFY `eduID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  MODIFY `enrollID` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admission_test_questions`
--
ALTER TABLE `admission_test_questions`
  ADD CONSTRAINT `fk_add_admin_cnic` FOREIGN KEY (`addedBy`) REFERENCES `admintable` (`adminCNIC`),
  ADD CONSTRAINT `fk_section` FOREIGN KEY (`section`) REFERENCES `test_sections` (`sectionID`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk_courses_admin_cnic` FOREIGN KEY (`addedBy`) REFERENCES `admintable` (`adminCNIC`),
  ADD CONSTRAINT `fk_ins` FOREIGN KEY (`offeredBy`) REFERENCES `institutes` (`insID`);

--
-- Constraints for table `exam_result`
--
ALTER TABLE `exam_result`
  ADD CONSTRAINT `fk_std_exam_cnic` FOREIGN KEY (`stdCNIC`) REFERENCES `student` (`stdCNIC`);

--
-- Constraints for table `fee_voucher_file`
--
ALTER TABLE `fee_voucher_file`
  ADD CONSTRAINT `fk_voucher_file` FOREIGN KEY (`voucherID`) REFERENCES `fee_voucher` (`voucherID`);

--
-- Constraints for table `institutes`
--
ALTER TABLE `institutes`
  ADD CONSTRAINT `fk_ins_admin_cnic` FOREIGN KEY (`addedBy`) REFERENCES `admintable` (`adminCNIC`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_std_cnic` FOREIGN KEY (`CNIC`) REFERENCES `student` (`stdCNIC`);

--
-- Constraints for table `student_attempt`
--
ALTER TABLE `student_attempt`
  ADD CONSTRAINT `fk_qID` FOREIGN KEY (`qID`) REFERENCES `admission_test_questions` (`qID`),
  ADD CONSTRAINT `fk_std_attempt_cnic` FOREIGN KEY (`stdCNIC`) REFERENCES `student` (`stdCNIC`);

--
-- Constraints for table `student_documents`
--
ALTER TABLE `student_documents`
  ADD CONSTRAINT `fk_std_doc_cnic` FOREIGN KEY (`stdCNIC`) REFERENCES `student` (`stdCNIC`);

--
-- Constraints for table `student_education`
--
ALTER TABLE `student_education`
  ADD CONSTRAINT `fk_std_edu_cnic` FOREIGN KEY (`stdCNIC`) REFERENCES `student` (`stdCNIC`);

--
-- Constraints for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  ADD CONSTRAINT `fk_course` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`),
  ADD CONSTRAINT `fk_enrol_admin_cnic` FOREIGN KEY (`enrollmentCofirmedBy`) REFERENCES `admintable` (`adminCNIC`),
  ADD CONSTRAINT `fk_std_enrol_cnic` FOREIGN KEY (`stdCNIC`) REFERENCES `student` (`stdCNIC`),
  ADD CONSTRAINT `fk_voucher` FOREIGN KEY (`voucherID`) REFERENCES `fee_voucher` (`voucherID`);

--
-- Constraints for table `test_sections`
--
ALTER TABLE `test_sections`
  ADD CONSTRAINT `fk_course_section` FOREIGN KEY (`trade`) REFERENCES `courses` (`courseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
