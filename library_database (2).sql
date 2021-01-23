-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2021 at 02:27 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library database`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getbookauthors` ()  SELECT * FROM book_author$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getbooks` ()  SELECT * FROM book$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getlibraryusers` ()  SELECT * FROM library_users$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getpublisher` ()  NO SQL
select * from publisher$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `showlibrarybranches` ()  SELECT * FROM library_branches$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` varchar(50) NOT NULL,
  `Title` varchar(60) NOT NULL,
  `Publisher_Name` varchar(30) NOT NULL,
  `Pub_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `Title`, `Publisher_Name`, `Pub_year`) VALUES
('978-CS-213-421', 'Engineering Mathematics-22', 's pearson', 1998),
('978-CS-213-422', 'dbms', 'mk', 2000),
('978-CS-213-423', 'Bell Tolls', 'Ernest Hemingway', 2001),
('978-CS-213-424', 'Automata Theory', 'RK Naidu', 1999),
('978-CS-213-425', 'c    ', 's pearson', 1991),
('978-CS-213-426', 'Electronics and Science', 'GG George', 1972),
('978-CS-213-427', 'Machine Learning', 'Firdausi', 1997),
('978-CS-213-428', 'Apple Cart', 'GB Shaw', 1975),
('978-CS-213-429', 'Data Science', 'KK', 1956),
('978-CS-213-430', 'SAN', 'R Mishra', 1856),
('978-CS-213-431', 'Management', 'L Govind', 2000),
('978-CS-213-432', 'Computer Science', 'Ravi R', 1900),
('978-CS-213-433', 'Man and Superman', 'G Shaw', 1987),
('978-CS-213-434', 'The Castle', 'Franz', 2003),
('978-CS-213-435', 'Kurukku', 'Faustina Bama', 2002),
('978-CS-213-436', 'Silas Marner', 'George Eliot', 1976),
('978-CS-213-437', 'Computer Networks', 'Vidhyashree', 1982),
('978-CS-213-438', 'Data Communication', 'K Hellen', 1999),
('978-CS-213-439', 'ADE', 'P Patterson', 1889),
('978-CS-213-440', 'Animal Farm', 'George Elliot', 2004),
('978-CS-213-441', 'Engg Mathematics-2', 'pearson', 2000),
('978-CS-213-442', 'C Sharp ', 'K Sinha', 1972),
('978-CS-213-443', 'Advanced Java', 'S Rao', 1988),
('978-CS-213-444', 'Visual Studio', 'M Swami', 1967),
('978-CS-213-445', 'Tughlaq', 'Girish Karnad', 2004),
('978-CS-213-446', 'Parajay', 'Gopinath', 2001),
('978-CS-213-447', 'Networking', 'S Jain', 1920),
('978-CS-213-448', 'Asian Drama', 'Gunnar Myrdal', 1999),
('978-CS-213-449', 'Time Machine', 'HG Wells', 1993),
('978-CS-213-450', 'Invisible Man', 'HG Wells', 1998),
('978-CS-213-451', 'The Vegetarian', 'Han Kang', 2002),
('978-CS-213-452', 'The clown', 'heinrich ball', 2002),
('978-CS-213-453', 'Economics Study', 'R Bird', 1900),
('978-CS-213-454', 'Python', 'S Smith', 1999),
('978-CS-213-455', 'Microprocessor', 'Raghav.Ms', 1998),
('978-CS-213-456', 'Illiad', 'Hormer', 2004),
('978-CS-213-457', 'Quantum Physics', 'S Trivedi', 1944),
('978-CS-213-458', 'Chemistry Cycle', 'RR Sen', 1984),
('978-CS-213-459', 'My Truth', 'Indira Gandhi', 1921),
('978-CS-213-460', 'Ahiron', 'Indira Goswami', 1945),
('978-CS-213-461', 'The Devourers', 'Indira Das', 1900),
('978-CS-213-462', 'Principia', 'Newton', 1872),
('978-CS-213-463', 'The Harry Potter', 'JK Rowling', 1988),
('978-CS-213-464', 'Discovery Of India', 'Nehru', 1940),
('978-CS-213-465', 'Geet Govind', 'Jeet Raval', 2003),
('978-CS-213-466', 'Socialism', 'J Narayan', 1999),
('978-CS-213-467', 'HC Verma', 'H Verma', 2000),
('978-CS-213-468', 'NCERT', 'HG Wells', 2001),
('978-CS-213-469', 'Paradise Lost', 'J Milton', 1900),
('978-CS-213-470', 'Unto The Last', 'JJ sigh', 1988),
('978-CS-213-471', 'Mahatma', 'KM Munshi', 1999),
('978-CS-213-472', 'meghdut', 'r.rao', 1990);

--
-- Triggers `book`
--
DELIMITER $$
CREATE TRIGGER `deleted` BEFORE DELETE ON `book` FOR EACH ROW INSERT INTO booklog VALUES(null,OLD.title,"deleted",NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert` AFTER INSERT ON `book` FOR EACH ROW INSERT INTO booklog VALUES(null,NEW.title,"inserted",NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update` AFTER UPDATE ON `book` FOR EACH ROW INSERT INTO booklog VALUES(null,NEW.title,"updated",NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `booklog`
--

CREATE TABLE `booklog` (
  `id` int(11) NOT NULL,
  `bookname` varchar(40) NOT NULL,
  `action` varchar(15) NOT NULL,
  `changetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booklog`
--

INSERT INTO `booklog` (`id`, `bookname`, `action`, `changetime`) VALUES
(3, 'dbms', 'inserted', '2019-11-22 12:14:54'),
(4, 'Bell Tolls', 'inserted', '2019-11-23 13:13:23'),
(5, 'Automata Theory', 'inserted', '2019-11-23 13:13:23'),
(6, 'Electronics and Science', 'inserted', '2019-11-23 13:16:09'),
(7, 'Machine Learning', 'inserted', '2019-11-23 13:16:09'),
(8, 'Apple Cart', 'inserted', '2019-11-23 13:17:36'),
(9, 'Data Science', 'inserted', '2019-11-23 13:18:50'),
(10, 'SAN', 'inserted', '2019-11-23 13:18:50'),
(11, 'Management', 'inserted', '2019-11-23 13:21:20'),
(12, 'Computer Science', 'inserted', '2019-11-23 13:21:20'),
(13, 'Man and Superman', 'inserted', '2019-11-23 13:22:57'),
(14, 'The Castle', 'inserted', '2019-11-23 13:22:57'),
(15, 'Kurukku', 'inserted', '2019-11-23 13:24:49'),
(16, 'Silas Marner', 'inserted', '2019-11-23 13:24:49'),
(17, 'Computer Networks', 'inserted', '2019-11-23 13:26:50'),
(18, 'Data Communication', 'inserted', '2019-11-23 13:26:50'),
(19, 'ADE', 'inserted', '2019-11-23 13:28:08'),
(20, 'Animal Farm', 'inserted', '2019-11-23 13:28:08'),
(21, 'Engg Mathematics-2', 'inserted', '2019-11-23 13:29:37'),
(22, 'C Sharp ', 'inserted', '2019-11-23 13:29:37'),
(23, 'Advanced Java', 'inserted', '2019-11-23 13:30:50'),
(24, 'Visual Studio', 'inserted', '2019-11-23 13:30:50'),
(25, 'Tughlaq', 'inserted', '2019-11-23 13:32:00'),
(26, 'Parajay', 'inserted', '2019-11-23 13:32:00'),
(27, 'Networking', 'inserted', '2019-11-23 13:33:47'),
(28, 'Asian Drama', 'inserted', '2019-11-23 13:33:47'),
(29, 'Time Machine', 'inserted', '2019-11-23 13:36:09'),
(30, 'Invisible Man', 'inserted', '2019-11-23 13:36:09'),
(31, 'The Vegetarian', 'inserted', '2019-11-23 13:37:29'),
(32, 'The clown', 'inserted', '2019-11-23 13:37:29'),
(33, 'Economics Study', 'inserted', '2019-11-23 13:38:31'),
(34, 'Python', 'inserted', '2019-11-23 13:38:31'),
(35, 'Microprocessor', 'inserted', '2019-11-23 13:40:54'),
(36, 'Illiad', 'inserted', '2019-11-23 13:40:54'),
(37, 'Quantum Physics', 'inserted', '2019-11-23 13:42:55'),
(38, 'Chemistry Cycle', 'inserted', '2019-11-23 13:42:55'),
(39, 'My Truth', 'inserted', '2019-11-23 13:44:30'),
(40, 'Ahiron', 'inserted', '2019-11-23 13:44:30'),
(41, 'The Devourers', 'inserted', '2019-11-23 13:46:08'),
(42, 'Principia', 'inserted', '2019-11-23 13:46:08'),
(43, 'The Harry Potter', 'inserted', '2019-11-23 13:47:27'),
(44, 'Discovery Of India', 'inserted', '2019-11-23 13:47:27'),
(45, 'Geet Govind', 'inserted', '2019-11-23 13:48:35'),
(46, 'Socialism', 'inserted', '2019-11-23 13:48:35'),
(47, 'HC Verma', 'inserted', '2019-11-23 13:49:56'),
(48, 'NCERT', 'inserted', '2019-11-23 13:49:56'),
(49, 'Paradise Lost', 'inserted', '2019-11-23 13:53:30'),
(50, 'Unto The Last', 'inserted', '2019-11-23 13:53:30'),
(51, 'China Passage', 'inserted', '2019-11-23 13:57:27'),
(52, 'Gulliver', 'inserted', '2019-11-23 13:57:27'),
(53, 'c ++', 'updated', '2019-11-23 14:12:50'),
(54, 'c ++', 'updated', '2019-11-23 14:14:20'),
(55, 'China Passage', 'deleted', '2019-11-23 14:15:14'),
(56, 'Mahatma', 'inserted', '2019-11-23 14:20:07'),
(57, 'Meghdut', 'inserted', '2019-11-23 14:20:07'),
(58, 'c    ', 'updated', '2019-11-23 14:23:07'),
(59, 'Engineering Mathematics-3', 'updated', '2019-11-25 07:44:16'),
(60, 'Meghdut', 'deleted', '2019-12-08 17:26:30'),
(61, 'meghdut', 'inserted', '2019-12-08 17:27:20'),
(62, 'Engineering Mathematics-22', 'updated', '2019-12-09 05:29:10');

-- --------------------------------------------------------

--
-- Table structure for table `book_author`
--

CREATE TABLE `book_author` (
  `book_id` varchar(50) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  `author_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_author`
--

INSERT INTO `book_author` (`book_id`, `book_name`, `author_name`) VALUES
('978-CS-213-421', 'Engg Mathematics-2', 'KCSinha'),
('978-CS-213-422', 'SAN', 'V kishore'),
('978-CS-213-423', 'ATC', 'D Das'),
('978-CS-213-424', 'The Lost Ship', 'gg wells'),
('978-CS-213-425', 'Dbms', 'kurukku'),
('978-CS-213-426', 'Management', 'T Moody'),
('978-CS-213-427', 'Microprocessor', 'Kampani'),
('978-CS-213-428', 'Machine Learning', 'T Smith'),
('978-CS-213-429', 'Graphics', 'M swami'),
('978-CS-213-430', 'NCERT', 'DD'),
('978-CS-213-431', 'Spiderman', 'J Horns'),
('978-CS-213-432', 'Advanced java', 'p gopal'),
('978-CS-213-433', 'OOC', 'R Sharma'),
('978-CS-213-434', 'JAVA', 'ak hasim'),
('978-CS-213-435', 'Software Engineering', 'KSS'),
('978-CS-213-436', 'Biology', 'G Wells'),
('978-CS-213-437', 'Chemistry', 's das'),
('978-CS-213-438', 'Computer Science', 'Compton'),
('978-CS-213-439', 'Data Science', 'S Smith'),
('978-CS-213-440', 'The Lion King', 'Hellen'),
('978-CS-213-441', 'Harry Potter', 'JK Rowling');

-- --------------------------------------------------------

--
-- Table structure for table `book_lending`
--

CREATE TABLE `book_lending` (
  `book_id` varchar(50) NOT NULL,
  `card_no` int(50) NOT NULL,
  `date_out` date NOT NULL,
  `due_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_lending`
--

INSERT INTO `book_lending` (`book_id`, `card_no`, `date_out`, `due_date`) VALUES
('978-CS-213-400', 4, '2019-05-10', '2019-05-20'),
('978-CS-213-427', 9, '2019-05-20', '2019-05-28');

-- --------------------------------------------------------

--
-- Table structure for table `library_branches`
--

CREATE TABLE `library_branches` (
  `branch_id` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `address` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `library_branches`
--

INSERT INTO `library_branches` (`branch_id`, `branch_name`, `address`) VALUES
('1CIV001', 'Civil', 'Bangalore'),
('1CIV003', 'Civil', 'kolkata'),
('1CIV006', 'Civil', 'Dehradun'),
('1CIV008', 'Civil', 'Bihar'),
('1CIV045', 'Civil', 'Delhi'),
('1CIV065', 'Civil', 'NCR'),
('1CIV067', 'Civil', 'Kolkata'),
('1CIV099', 'Civil', 'Kolkata'),
('1CS001', 'computer Science  ', 'Dheradun'),
('1CS002', 'Computer Science', 'Bangalore'),
('1CS003', 'computer science', 'kolkata'),
('1CS004', 'Computer Science', 'Bangalore'),
('1ECE001', 'Electronics', 'Bangalore'),
('1ECE004', 'Electronics', 'Kolkata'),
('1ECE0045', 'Electronics', 'Assam'),
('1ECE005', 'Electronics', 'Bihar'),
('1ECE067', 'Electronics', 'Dehradun'),
('1ME003', 'Mechanical', 'Assam'),
('1MEC001', 'Mechanical', 'Bangalore'),
('1MEC002', 'Mechanical', 'Bihar'),
('1MEC004', 'Mechanical', 'Kolkata');

-- --------------------------------------------------------

--
-- Table structure for table `library_users`
--

CREATE TABLE `library_users` (
  `name` varchar(50) NOT NULL,
  `card_no` int(50) NOT NULL,
  `ph_no` int(50) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `library_users`
--

INSERT INTO `library_users` (`name`, `card_no`, `ph_no`, `email_id`, `address`) VALUES
('shashwat', 1, 169899, 'shashwat@gmail.om', 'jsdhushd'),
('ashu', 2, 35266, 'havgavsgv@gmail.com', 'dvytdcvjdgv'),
('saurav', 3, 498464, 'frdfyt@gmail.com', 'sf5fgf'),
('aadersh', 4, 84186, 'gsfytc@gmail.com', 'fdrtdcjhtfth'),
('vidya ', 5, 7826542, 'vidya@gmail.com', 'hdegeudedg6ey'),
('sonu', 6, 45687984, 'sonukr@gmail.com', 'banglore'),
('aman', 8, 7412254, 'aman@gmail.com', 'bauxar'),
('Deepak Kumar', 9, 464848184, 'depaak@gmail.com', 'Kanpur'),
('pranav', 10, 2147483647, 'vtyf@gmail.com', 'bihar');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `name` varchar(50) NOT NULL,
  `address` varchar(60) NOT NULL,
  `phone_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`name`, `address`, `phone_number`) VALUES
('Ajeet', 'Nepal', 12497563),
('Akshay', 'Delhi', 42656666),
('Amit', 'Nepal', 54568566),
('Ashish Kumar', 'Bihar', 4465465),
('Ashutosh kumar', 'Uttar ', 87896634),
('Chanchal kumar Chandan', 'Bangalore', 321632132),
('Deepak', 'Kanpur', 245683355),
('Dheeraj', 'Kanpur', 45667944),
('Ketki', 'kolkata', 154956566),
('Kiccha Sudeep', 'Bangalore', 164523264),
('Komal', 'kolkata', 48685652),
('Manish', 'Bangalore', 155685366),
('MS dhoni', 'Ranchi', 58974652),
('Nikitha', 'Mangalore', 12556663),
('Pranav', 'Bihar', 1234895),
('Puja', 'kolkata ', 2147483647),
('Punit', 'Dehradun', 23456655),
('Raghav', 'Dehradun', 12355256),
('Rohit', 'Mumbai', 2525652),
('shubham', 'Banaras', 4545454),
('sudhanshu', 'Assam', 13549653),
('Suyash', 'NCR', 4598265),
('vidya', 'Delhi', 4566522);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `booklog`
--
ALTER TABLE `booklog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`book_id`,`author_name`);

--
-- Indexes for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD PRIMARY KEY (`book_id`,`card_no`),
  ADD KEY `book_lending_ibfk_1` (`card_no`);

--
-- Indexes for table `library_branches`
--
ALTER TABLE `library_branches`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `library_users`
--
ALTER TABLE `library_users`
  ADD PRIMARY KEY (`card_no`),
  ADD UNIQUE KEY `ph_no` (`ph_no`),
  ADD UNIQUE KEY `email_id` (`email_id`),
  ADD UNIQUE KEY `address` (`address`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booklog`
--
ALTER TABLE `booklog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `library_users`
--
ALTER TABLE `library_users`
  MODIFY `card_no` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE;

--
-- Constraints for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD CONSTRAINT `book_lending_ibfk_1` FOREIGN KEY (`card_no`) REFERENCES `library_users` (`card_no`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
