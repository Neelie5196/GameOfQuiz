-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 22, 2017 at 09:51 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`quizID`, `questionID`, `question`, `type`, `hints`, `input1`, `input2`, `input3`, `input4`, `checked`, `explanation`) VALUES
(1, 0, 'Which of the following is an animal of the Jurassic period?', 'M', 'It''s a pterosaur.', 'Pterodactyl', 'Aisle', 'Mortgage', 'Asthma', 'A', 'Watch Words with Silent Letters 00:00:00'),
(2, 1, 'Which of the following is an animal of the Jurassic period?', 'M', 'It''s a pterosaur.', 'Pterodactyl', 'Aisle', 'Mortgage', 'Asthma', 'A', 'Watch Words with Silent Letters 00:00:00'),
(1, 2, 'Which letter is silent in the word "faux"?', 'M', 'It sounds like fow,', 'F', 'A', 'U', 'X', 'D', 'Watch Words with Silent Letters 00:01:20'),
(1, 3, 'Which letter in "mortgage" is silent?', 'M', 'It is pronounced as "morgage".', 'A', 'T', 'G', 'M', 'B', 'Watch Words with Weird Silent Letters 00:02:09'),
(2, 3, '"Millenniums" is the plural form of "millennium".', 'T', 'Watch Words with Strange Plural Forms video.', '', '', '', '', 'False', 'The plural form of "millennium" is millennia.'),
(1, 4, 'Which if the following word has the same silent letter as "aisle"?', 'B', 'The silent word is ', 'asthma', 'bouquet', 'island', 'knob', 'island', 'The silent letters in ');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quizID`, `quizTopic`, `bonus`, `videoID`) VALUES
(1, 'Silent Letters', '“A smart person knows how to talk. A wise person knows when to be silent.” \r\n- Roy T. Bennett', 8),
(2, 'Words with Weird Plurals', 'You are never too old to set another goal or to dream a new dream. – C.S.Lewis', 7),
(3, 'Idioms', 'Today a reader, tomorrow a leader. – Margaret Fuller', 6),
(4, 'Exchange Contact Information', 'To have another language is to possess a second soul. – Charlemagne', 5),
(5, 'Acronyms', 'Language is “the infinite use of finite means.” – Wilhelm von Humboldt', 4);

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
(1, 'Biology Ep1', 'What do flowers, goldfish and us have in common? What are we made up of? Watch to know more!', 'Biology', 'resources/vid/BiologiEp1.wmv'),
(2, 'Biology Ep2', 'Why is salt used to preserved foods? What happens when some food are soaked in concentrated solution? Watch to know more!', 'Biology', 'resources/vid/BiologiEp2.wmv'),
(3, 'Biology Ep3', 'How to remove tough stains from clothes? What does the detergent do to remove the tough stains? Watch to find out!', 'Biology', 'resources/vid/BiologiEp3.wmv'),
(4, 'Acronyms', 'Acronyms are used widely in our daily lives. Watch to know what some acronyms mean!', 'English', 'resources/vid/Acronyms.m4v'),
(5, 'Exchange Contact Information', 'You just met someone new, and you want to keep in touch with them. How do you do it?', 'English', 'resources/vid/Contact.wmv'),
(6, 'Idioms', 'What are idioms? What do they mean? Let Alisa reveal some common English idioms to you!', 'English', 'resources/vid/Idioms.wmv'),
(7, 'Words with Strange Plural Forms', 'Wonder how some words are presented in plural forms? Do you add "s" to the every word to turn it into plural form? Watch to know which words has weird plural forms!', 'English', 'resources/vid/StrangePlural.m4v'),
(8, 'Words with Weird Silent Letters', 'Have you encountered a weirdly spelled word? How do you pronounce it? Watch to find out some words frequently wrongly pronounced!', 'English', 'resources/vid/WeirdSilentLetters.wmv');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
