-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 21, 2017 at 06:44 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `password` varchar(8) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `name`, `department`, `password`) VALUES
('admin', 'TING', 'Swinburne', '123');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `feedbackID` int(10) NOT NULL AUTO_INCREMENT,
  `quizID` int(10) NOT NULL,
  `select` varchar(20) NOT NULL,
  `feedback` varchar(100) NOT NULL,
  PRIMARY KEY (`feedbackID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `quizID` int(10) NOT NULL,
  `questionID` int(10) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) NOT NULL,
  `type` varchar(5) NOT NULL,
  `hints` varchar(50) NOT NULL,
  `input1` varchar(50) NOT NULL,
  `input2` varchar(50) NOT NULL,
  `input3` varchar(50) NOT NULL,
  `input4` varchar(50) NOT NULL,
  `checked` varchar(20) NOT NULL,
  `explanation` varchar(100) NOT NULL,
  PRIMARY KEY (`questionID`,`quizID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`quizID`, `questionID`, `question`, `type`, `hints`, `input1`, `input2`, `input3`, `input4`, `checked`, `explanation`) VALUES
(1, 0, 'Which of the following is an animal of the Jurassic period?', 'M', 'It''s a pterosaur.', 'Pterodactyl', 'Aisle', 'Mortgage', 'Asthma', 'A', 'Watch Words with Silent Letters 00:00:00'),
(2, 1, 'Which of the following is an animal of the Jurassic period?', 'M', 'It''s a pterosaur.', 'Pterodactyl', 'Aisle', 'Mortgage', 'Asthma', 'A', 'Watch Words with Silent Letters 00:00:00'),
(1, 2, 'Which letter is silent in the word "faux"?', 'M', 'It sounds like fow,', 'F', 'A', 'U', 'X', 'D', 'Watch Words with Silent Letters 00:01:20'),
(1, 3, 'Which letter in "mortgage" is silent?', 'M', 'It is pronounced as "morgage".', 'A', 'T', 'G', 'M', 'B', 'Watch Words with Weird Silent Letters 00:02:09'),
(2, 3, '"Millenniums" is the plural form of "millennium".', 'T', 'Watch Words with Strange Plural Forms video.', '', '', '', '', 'False', 'The plural form of "millennium" is millennia.'),
(1, 4, 'Which if the following word has the same silent letter as "aisle"?', 'B', 'The silent word is ', 'asthma', 'bouquet', 'island', 'knob', 'island', 'The silent letters in '),
(1, 5, 'here', 'M', 'asd', 'aaa', 'bb', 'cc', 'dd', 'A', 'ex');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
  `quizID` int(11) NOT NULL AUTO_INCREMENT,
  `quizTopic` varchar(50) NOT NULL,
  `cdate` date NOT NULL,
  `udate` date NOT NULL,
  PRIMARY KEY (`quizID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quizID`, `quizTopic`, `cdate`, `udate`) VALUES
(1, 'Silent Letters', '2017-06-20', '2017-06-20'),
(2, 'Words with Weird Plurals', '2017-06-20', '2017-06-20'),
(3, 'Idioms', '2017-06-20', '2017-06-20'),
(4, 'Exchange Contact Information', '2017-06-20', '2017-06-20'),
(5, 'Acronyms', '2017-06-20', '2017-06-20'),
(11, '56', '2017-06-21', '2017-06-21'),
(12, 'tu', '2017-06-21', '2017-06-21');

-- --------------------------------------------------------

--
-- Table structure for table `reward`
--

CREATE TABLE IF NOT EXISTS `reward` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `reward` varchar(100) NOT NULL,
  `cdate` date NOT NULL,
  `udate` date NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `reward`
--

INSERT INTO `reward` (`index`, `reward`, `cdate`, `udate`) VALUES
(1, '“A smart person knows how to talk. A wise person knows when to be silent.”  - Roy T. Bennett', '2017-06-21', '2017-06-21'),
(2, 'You are never too old to set another goal or to dream a new dream. – C.S.Lewis', '2017-06-21', '2017-06-21'),
(3, 'Today a reader, tomorrow a leader. – Margaret Fuller', '2017-06-21', '2017-06-21'),
(4, 'Hardest time to lie to somebody is when they''re expecting to be lied to. - Alan Turning', '2017-06-21', '2017-06-21'),
(5, 'A computer would deserve to be called intelligent if it could deceive a human into believing that it', '2017-06-21', '2017-06-21'),
(6, 'Never make permanent decision on temporary feelings. - Wiz Khalifa', '2017-06-21', '2017-06-21'),
(7, 'Don''t quit. Suffer now and live the rest of your life as a champion. - Muhammad Ali', '2017-06-21', '2017-06-21');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `videoID` int(10) NOT NULL AUTO_INCREMENT,
  `videoName` varchar(100) NOT NULL,
  `videoDesc` varchar(200) NOT NULL,
  `category` varchar(15) NOT NULL,
  `videoPath` varchar(1000) NOT NULL,
  PRIMARY KEY (`videoID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`videoID`, `videoName`, `videoDesc`, `category`, `videoPath`) VALUES
(1, 'Biology Ep1', 'What do flowers, goldfish and us have in common? What are we made up of? Watch to know more!', 'Biology', 'resources/vid/BiologiEp1.mp4'),
(2, 'Biology Ep2', 'Why is salt used to preserved foods? What happens when some food are soaked in concentrated solution? Watch to know more!', 'Biology', 'resources/vid/BiologiEp2.mp4'),
(3, 'Biology Ep3', 'How to remove tough stains from clothes? What does the detergent do to remove the tough stains? Watch to find out!', 'Biology', 'resources/vid/BiologiEp3.mp4'),
(4, 'Acronyms', 'Acronyms are used widely in our daily lives. Watch to know what some acronyms mean!', 'English', 'resources/vid/Acronyms.mp4'),
(5, 'Exchange Contact Information', 'You just met someone new, and you want to keep in touch with them. How do you do it?', 'English', 'resources/vid/Contact.mp4'),
(6, 'Idioms', 'What are idioms? What do they mean? Let Alisa reveal some common English idioms to you!', 'English', 'resources/vid/Idioms.mp4'),
(7, 'Words with Strange Plural Forms', 'Wonder how some words are presented in plural forms? Do you add "s" to the every word to turn it into plural form? Watch to know which words has weird plural forms!', 'English', 'resources/vid/StrangePlural.mp4'),
(8, 'Words with Weird Silent Letters', 'Have you encountered a weirdly spelled word? How do you pronounce it? Watch to find out some words frequently wrongly pronounced!', 'English', 'resources/vid/WeirdSilentLetters.mp4');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
