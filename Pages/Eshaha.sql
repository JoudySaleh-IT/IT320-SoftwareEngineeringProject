-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 04, 2025 at 05:57 PM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Eshaha`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `admin_id` int UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Admin`
--

INSERT INTO `Admin` (`admin_id`, `email`, `password`) VALUES
(1, 'admin@eeshaha.com', 'admin_hash_1');

-- --------------------------------------------------------

--
-- Table structure for table `BookingRequest`
--

CREATE TABLE `BookingRequest` (
  `request_id` int UNSIGNED NOT NULL,
  `experience_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `numPeople` int NOT NULL DEFAULT '1',
  `status` enum('accepted','rejected') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `BookingRequest`
--

INSERT INTO `BookingRequest` (`request_id`, `experience_id`, `user_id`, `numPeople`, `status`) VALUES
(1, 1, 4, 2, 'accepted'),
(2, 5, 3, 1, 'rejected');

-- --------------------------------------------------------

--
-- Table structure for table `Experience`
--

CREATE TABLE `Experience` (
  `experience_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `expType` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(5,2) DEFAULT '0.00',
  `exchangePreference` varchar(100) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Experience`
--

INSERT INTO `Experience` (`experience_id`, `user_id`, `title`, `description`, `category`, `city`, `expType`, `price`, `exchangePreference`, `image`) VALUES
(1, 1, 'تذوق القهوة العربية في شرفة مع إطلالة الغروب', 'جلسة خاصة في الشرفة لتجربة القهوة السعودية التقليدية مع شرح لطريقة التحضير وطقوس التقديم.', 'الطعام والثقافة', 'الرياض', 1, 60.00, NULL, 'uploads/exp/exp1.jpg'),
(2, 2, 'ورشة تعليمية لمهارات تعديل الصور', 'ورشة عملية لتعليم أساسيات تعديل الصور في لايت روم على مختلف الصور الاحترافية.', 'ورش العمل', 'جدة', 0, 0.00, 'مهارات التصميم الجرافيكي، مساعدة في التسويق الرقمي', 'uploads/exp/exp2.jpg'),
(3, 1, 'قيم نايت', 'عِش أجواء تنافسية ممتعة في ليلة ألعاب جماعية مليئة بالحماس والضحك.\r\n', 'الجولات', 'الرياض', 1, 50.00, NULL, 'uploads/exp/exp3.jpg'),
(4, 3, 'ورشة طبخ أطباق سعودية تقليدية', 'ورشة ممتعة لتعلم تحضير أطباق سعودية متنوعة مع إمكانية تبادل المهارات مع المشاركين.', 'الطعام والثقافة', 'الدمام', 0, 0.00, 'تعلم الخياطة، مساعدة في التصوير الفوتوغرافي', 'uploads/exp/exp4.jpg'),
(5, 2, 'جولة تصوير في جدة التاريخية', 'جولة ميدانية في حي البلد مع مصور محترف لالتقاط صور للعمارة التقليدية والشوارع القديمة.', 'ترفيه', 'جدة', 1, 150.00, NULL, 'uploads/exp/exp5.jpg'),
(6, 4, 'تعليم الخط العربي للمبتدئين', 'جلسة تعليم أساسيات الخط العربي مع فرصة لتبادل المهارات في مجالات أخرى.', 'ثقافة', 'الرياض', 0, 0.00, 'تعلم البرمجة، مساعدة في تصميم المواقع', 'uploads/exp/exp6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `Review`
--

CREATE TABLE `Review` (
  `review_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `experience_id` int UNSIGNED NOT NULL,
  `rating` decimal(3,2) NOT NULL DEFAULT '0.00',
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Review`
--

INSERT INTO `Review` (`review_id`, `user_id`, `experience_id`, `rating`, `comment`) VALUES
(1, 2, 1, 5.00, 'سارة مضيفة رائعة! معرفتها بتقاليد القهوة السعودية مذهلة. التجربة كانت أصيلة وممتعة للغاية. أوصي بها بشدة!'),
(2, 3, 2, 5.00, 'كانت تجربة رائعة! سارة تشرح بخطوات بسيطة وتخلي كل شيء واضح حتى للمبتدئين. حسّيت إني فعلاً طورت نظرتي في التكوين والإضاءة. أنصح فيها لكل شخص حاب يبدأ عالم التصوير.'),
(3, 4, 3, 5.00, 'التجربة كانت مليانة حماس وضحك! الأجواء كانت مرّة تفاعلية والتنظيم ممتاز، حسّيت الوقت طار من كثر المتعة. أنصح أي أحد يحب الألعاب الجماعية يجربها.');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `user_id` int UNSIGNED NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phoneNum` varchar(12) NOT NULL,
  `password` varchar(255) NOT NULL,
  `averageRating` decimal(3,2) DEFAULT '0.00',
  `bio` text,
  `profileImage` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`user_id`, `firstName`, `lastName`, `email`, `phoneNum`, `password`, `averageRating`, `bio`, `profileImage`) VALUES
(1, 'سارة', 'المنصور', 'sara@example.com', '0501234567', 'user_hash_1', 4.80, 'مهتمة بالثقافة ومحبة للتصوير.\r\nأستمتع بمشاركة التجارب السعودية الأصيلة والتعلم من الآخرين من خلال التبادل الثقافي.', 'uploads/users/user1.png'),
(2, 'أسماء', 'حسن', 'asma@example.com', '0559876543', 'user_hash_2', NULL, NULL, 'uploads/users/user2.png'),
(3, 'ليلى', 'محمد', 'layla@example.com', '0532233445', 'user_hash_3', NULL, NULL, 'uploads/users/user3.png'),
(4, 'نوره', 'العتيبي', 'norah@example.com', '0563344556', 'user_hash_4', NULL, NULL, 'uploads/users/user4.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BookingRequest`
--
ALTER TABLE `BookingRequest`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `idx_request_experience` (`experience_id`),
  ADD KEY `idx_request_user` (`user_id`);

--
-- Indexes for table `Experience`
--
ALTER TABLE `Experience`
  ADD PRIMARY KEY (`experience_id`),
  ADD KEY `idx_experience_user` (`user_id`);

--
-- Indexes for table `Review`
--
ALTER TABLE `Review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `idx_review_user` (`user_id`),
  ADD KEY `idx_review_experience` (`experience_id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `uq_user_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BookingRequest`
--
ALTER TABLE `BookingRequest`
  MODIFY `request_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Experience`
--
ALTER TABLE `Experience`
  MODIFY `experience_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Review`
--
ALTER TABLE `Review`
  MODIFY `review_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BookingRequest`
--
ALTER TABLE `BookingRequest`
  ADD CONSTRAINT `fk_request_experience` FOREIGN KEY (`experience_id`) REFERENCES `Experience` (`experience_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_request_user` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Experience`
--
ALTER TABLE `Experience`
  ADD CONSTRAINT `fk_experience_user` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Review`
--
ALTER TABLE `Review`
  ADD CONSTRAINT `fk_review_experience` FOREIGN KEY (`experience_id`) REFERENCES `Experience` (`experience_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_review_user` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
