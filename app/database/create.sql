SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';
SET time_zone = 'Africa/Nairobi';

--
-- Database: `booky`
--


--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `first_name` varchar(20) NOT NULL,
    `last_name` varchar(20) NOT NULL,
    `created_at` datetime DEFAULT CURRENT_TIMESTAMP
);

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `publisher_name` varchar(50) NOT NULL,
    `created_at` datetime DEFAULT CURRENT_TIMESTAMP
);

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(20) UNIQUE NOT NULL,
  `title` varchar(100) NOT NULL,
  `edition_number` int(10) NOT NULL,
  `publisher_id` int(10) NOT NULL,
  `copyright` varchar(4), -- Copyright year of the book (a string).
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
);

--
-- Table structure for table `author_isbn`
--

CREATE TABLE `author_isbn` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `author_id` int(10) NOT NULL,
    `isbn_id` id(10) NOT NULL,
    `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ('author_id') REFERENCES `authors` ('id'),
    FOREIGN KEY ('isbn_id') REFERENCES `titles` ('id')
);


-- 
-- Dumping data for table `authors`
--
INSERT INTO `authors` ('first_name', 'last_name') VALUES ('Gayle', 'L. McDowell');

--
-- Dumping data for table `publishers`
--
INSERT INTO `publishers` ('publisher_name') VALUES ('CareerCup, LLC');

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` ('isbn', 'title', 'edition_number', 'publisher_id', 'copyright') 
VALUES ('9780984782857', 'Cracking The Coding Interview', 6, 1, '2019');

--
-- Dumping data for table `author_isbn`
--

INSERT INTO `author_isbn` ('author_id', 'isbn_id') VALUES (1, 1);


















