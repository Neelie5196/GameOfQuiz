-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 11, 2017 at 01:10 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`quizID`, `questionID`, `question`, `type`, `hints`, `input1`, `input2`, `input3`, `input4`, `checked`, `explanation`) VALUES
(1, 1, 'Best synonym for warn', 'M', 'none', 'feel sleepy', 'write', 'get closer', 'tell of danger', 'D', 'Go find it Yourself la'),
(1, 2, 'Best synonym for bold', 'M', 'none', 'brave', 'strong', 'made up', 'ancient', 'A', 'Go find it Yourself la'),
(1, 3, 'Best synonym for frustration', 'M', 'none', 'upset feeling', 'first feeling', 'successful feeling', 'cold feeling', 'A', 'Go find it Yourself la'),
(2, 4, '___ he play baseball after school', 'B', 'none', 'Has', 'Does', 'Do', 'Is', 'Does', 'Go find it Yourself la'),
(1, 5, 'Best synonym for employer', 'M', 'none', 'legal professional', 'waitress', 'boss', 'farmer', 'C', ''),
(2, 6, 'Please be quiet ___ the teacher is talking', 'B', 'none', 'during', 'while', 'when', 'meanwhile', 'while', '');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
  `quizID` int(11) NOT NULL AUTO_INCREMENT,
  `quizTopic` varchar(50) NOT NULL,
  `bonus` varchar(1000) NOT NULL,
  `videoID` int(10) NOT NULL,
  PRIMARY KEY (`quizID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quizID`, `quizTopic`, `bonus`) VALUES
(1, 'Volcabulary', 'You know more than you think. TRUST yourself. - Dr.Benjamin Mclane Spock'),
(2, 'Grammar', 'The best proof of love is trust. - Dr.Joyce Brothers'),
(3, 'AngularJS', 'To succeed in your mission you must have single-minded devotion to your goal. - A.P.J. Abdul Kalam');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `videoID` int(10) NOT NULL AUTO_INCREMENT,
  `videoName` varchar(100) NOT NULL,
  `category` varchar(15) NOT NULL,
  `videoPath` varchar(1000) NOT NULL,
  PRIMARY KEY (`videoID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `quiz`
--

INSERT INTO `video` (`videoID`, `videoName`, `category`, `videoPath`) VALUES
(1, 'Biology Ep1', 'Biology', 'resources/vid/BiologiEp1.mp4'),
(2, 'Biology Ep2', 'Biology', 'resources/vid/BiologiEp2.mp4'),
(3, 'Biology Ep3', 'Biology', 'resources/vid/BiologiEp3.mp4');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
