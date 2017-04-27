-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 27, 2017 at 11:08 AM
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
  `checked` varchar(5) NOT NULL,
  PRIMARY KEY (`questionID`,`quizID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`quizID`, `questionID`, `question`, `type`, `hints`, `input1`, `input2`, `input3`, `input4`, `checked`) VALUES
(1, 1, 'Best synonym for warn', 'M', 'none', 'feel sleepy', 'write', 'get closer', 'tell of danger', 'D'),
(2, 1, 'Please be quiet ___ the teacher is talking', 'B', 'during / while', 'while', '', '', '', ''),
(1, 2, 'Best synonym for bold', 'M', 'none', 'brave', 'strong', 'made up', 'ancient', 'A'),
(1, 3, 'Best synonym for frustration', 'M', 'none', 'upset feeling', 'first feeling', 'successful feeling', 'cold feeling', 'A'),
(2, 4, '___ he play baseball after school', 'B', 'Has / Does / Do / Is', 'Does', '', '', '', ''),
(1, 5, 'Best synonym for employer', 'M', 'none', 'legal professional', 'waitress', 'boss', 'farmer', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
  `quizID` int(11) NOT NULL AUTO_INCREMENT,
  `quizTopic` varchar(50) NOT NULL,
  `bonus` varchar(1000) NOT NULL,
  PRIMARY KEY (`quizID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quizID`, `quizTopic`, `bonus`) VALUES
(1, 'Volcabulary', 'You know more than you think. TRUST yourself. - Dr.Benjamin Mclane Spock'),
(2, 'Grammar', 'The best proof of love is trust. - Dr.Joyce Brothers'),
(3, 'AngularJS', 'To succeed in your mission you must have single-minded devotion to your goal. - A.P.J. Abdul Kalam');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
