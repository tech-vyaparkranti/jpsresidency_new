-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 22, 2024 at 06:55 AM
-- Server version: 10.11.8-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u200826204_panda`
--

-- --------------------------------------------------------

--
-- Table structure for table `pm_activity`
--

CREATE TABLE `pm_activity` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `max_children` int(11) DEFAULT 1,
  `max_adults` int(11) DEFAULT 1,
  `max_people` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `descr` longtext DEFAULT NULL,
  `duration` float DEFAULT 0,
  `duration_unit` varchar(50) DEFAULT NULL,
  `price` double DEFAULT 0,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `home` int(11) DEFAULT 0,
  `checked` int(11) DEFAULT 0,
  `rank` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pm_activity_file`
--

CREATE TABLE `pm_activity_file` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT 0,
  `checked` int(11) DEFAULT 1,
  `rank` int(11) DEFAULT 0,
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pm_activity_session`
--

CREATE TABLE `pm_activity_session` (
  `id` int(11) NOT NULL,
  `id_activity` int(11) NOT NULL,
  `days` varchar(20) DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL,
  `price` double DEFAULT 0,
  `price_child` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `discount_type` varchar(10) DEFAULT NULL,
  `id_tax` int(11) DEFAULT NULL,
  `taxes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pm_activity_session_hour`
--

CREATE TABLE `pm_activity_session_hour` (
  `id` int(11) NOT NULL,
  `id_activity_session` int(11) NOT NULL,
  `start_h` int(11) DEFAULT NULL,
  `start_m` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pm_article`
--

CREATE TABLE `pm_article` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `text` longtext DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `tags` varchar(250) DEFAULT NULL,
  `id_page` int(11) DEFAULT NULL,
  `users` text DEFAULT NULL,
  `home` int(11) DEFAULT 0,
  `checked` int(11) DEFAULT 0,
  `rank` int(11) DEFAULT 0,
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `publish_date` int(11) DEFAULT NULL,
  `unpublish_date` int(11) DEFAULT NULL,
  `comment` int(11) DEFAULT 0,
  `rating` int(11) DEFAULT 0,
  `show_langs` text DEFAULT NULL,
  `hide_langs` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_article`
--

INSERT INTO `pm_article` (`id`, `lang`, `title`, `subtitle`, `alias`, `text`, `url`, `tags`, `id_page`, `users`, `home`, `checked`, `rank`, `add_date`, `edit_date`, `publish_date`, `unpublish_date`, `comment`, `rating`, `show_langs`, `hide_langs`) VALUES
(1, 1, 'Mon premier article', '', 'mon-premier-article', '', '', '', 5, '1', 0, 2, 1, 1715666456, 1715666456, NULL, NULL, 1, 0, NULL, NULL),
(1, 2, 'Destination Weddings', '', 'scuba-diving1', '<p style=\"text-align:justify;\">Celebrate the most important day of your life at JPS Residency, where dreams come to life amidst the stunning landscapes of IMT Manesar, Gurgaon. With our dedicated focus on destination weddings, we offer a picturesque setting combined with impeccable service to ensure your wedding day is flawless and memorable.</p><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\"><strong>Why Choose JPS Residency for Your Wedding? </strong></p><p style=\"text-align:justify;\"><strong>Stunning Location:</strong> Nestled in the serene settings of Gurgaon and just 12 minutes from the Dwarka Expressway, JPS Residency offers a tranquil yet accessible retreat. The lush surroundings and elegant architecture provide the perfect backdrop for your wedding photos and ceremonies.</p><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\"><strong>Customizable Venues:</strong> We offer a variety of venues to match the scale and style of your wedding:</p><ul><li style=\"text-align:justify;\"><strong>Grand Lawn:</strong> Accommodates up to 1200 guests, ideal for lavish receptions.</li><li style=\"text-align:justify;\"><strong>Elegant Banquet Hall:</strong> Perfect for gatherings of 100-125 guests, offering a sophisticated space for your wedding banquet.</li><li style=\"text-align:justify;\"><strong>Intimate Settings:</strong> For smaller, more personal ceremonies, our beautifully landscaped gardens and poolside area provide a romantic ambiance.</li></ul><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\"><strong>Tailored Wedding Packages</strong></p><p style=\"text-align:justify;\">Our wedding packages are designed to provide flexibility and include all the essential elements you need for a stress-free celebration:</p><ul><li style=\"text-align:justify;\"><strong>Accommodation:</strong> Luxurious rooms and suites for you and your guests, with special rates for wedding parties.</li><li style=\"text-align:justify;\"><strong>Catering:</strong> Customizable menu options ranging from local delicacies to international cuisines, all prepared by our skilled chefs.</li><li style=\"text-align:justify;\"><strong>Decor:</strong> Thematic decorations tailored to your preferences, from classic elegance to modern chic.</li><li style=\"text-align:justify;\"><strong>Event Planning:</strong> A dedicated wedding planner to guide you through every step, ensuring every detail is handled with care.</li></ul><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\"><strong>Additional Wedding Services</strong></p><ul><li style=\"text-align:justify;\"><strong>Photography and Videography:</strong> Connections with top photographers and videographers who can capture your special moments.</li><li style=\"text-align:justify;\"><strong>Entertainment:</strong> Arrangements for live music, DJs, and performances to entertain your guests.</li><li style=\"text-align:justify;\"><strong>Transportation:</strong> Seamless transport options for guests, including airport pickups and local shuttles.</li></ul><p> </p><p style=\"text-align:justify;\"><strong>Your Wedding Journey Starts Here</strong></p><p style=\"text-align:justify;\">From the initial planning stages to the final farewell brunch, we are dedicated to making your wedding journey seamless and spectacular. At JPS Residency, we understand that your wedding is more than just a day; it’s the start of a lifelong journey.</p><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\"><strong>Book Your Wedding Consultation</strong></p><p style=\"text-align:justify;\">Contact us today to schedule a consultation with our wedding specialist who will help you begin planning your perfect day:</p><ul><li style=\"text-align:justify;\"><strong>Phone:</strong> (0124) 2291747, 7835020003, 7835020005</li><li style=\"text-align:justify;\"><strong>Email:</strong> Support@Jpsresidency.In</li></ul><p style=\"text-align:justify;\">Embark on your forever at JPS Residency & Hospitality Services, where your wedding day will be as magical as your love story.</p>', '', '', 5, '1', 0, 2, 1, 1715666456, 1715842433, NULL, NULL, 1, 0, '', ''),
(1, 3, '', '', '', '', '', '', 5, '1', 0, 2, 1, 1715666456, 1715666456, NULL, NULL, 1, 0, NULL, NULL),
(4, 1, 'Première gallery', '', 'premiere-gallery', '', '', '', 7, '1', 0, 2, 2, 1715666456, 1715666456, NULL, NULL, 0, 0, NULL, NULL),
(4, 2, 'Gallery', '', 'first-gallery', '', '', '', 7, '1', 0, 2, 2, 1715666456, 1715852590, NULL, NULL, 0, 0, '', ''),
(4, 3, 'First gallery', '', 'first-gallery', '', '', '', 7, '1', 0, 2, 2, 1715666456, 1715666456, NULL, NULL, 0, 0, NULL, NULL),
(5, 2, 'Destination Weddings at JPS Residency ', '', 'jpsresidency-in-scuba-diving', '<p>\"Then hail, for ever hail, O sea, in whose eternal tossings the wild fowl finds his only rest. Born of earth, yet suckled by the sea; though hill and valley mothered me, ye billows are my foster-brothers!\"</p><p>The four whales slain that evening had died wide apart; one, far to windward; one, less distant, to leeward; one ahead; one astern. These last three were brought alongside ere nightfall; but the windward one could not be reached till morning; and the boat that had killed it lay by its side all night; and that boat was Ahab\'s.\"Then hail, for ever hail, O sea, in whose eternal tossings the wild fowl finds his only rest. Born of earth, yet suckled by the sea; though hill and valley mothered me, ye billows are my foster-brothers!\"</p><p>The four whales slain that evening had died wide apart; one, far to windward; one, less distant, to leeward; one ahead; one astern. These last three were brought alongside ere nightfall; but the windward one could not be reached till morning; and the boat that had killed it lay by its side all night; and that boat was Ahab\'s.</p><p>The waif-pole was thrust upright into the dead whale\'s spout-hole; and the lantern hanging from its top, cast a troubled flickering glare upon the black, glossy back, and far out upon the midnight waves, which gently chafed the whale\'s broad flank, like soft surf upon a beach.</p><p>The waif-pole was thrust upright into the dead whale\'s spout-hole; and the lantern hanging from its top, cast a troubled flickering glare upon the black, glossy back, and far out upon the midnight waves, which gently chafed the whale\'s broad flank, like soft surf upon a beach.</p>', '', '', 1, '1', 0, 2, 3, 1715840909, 1715842655, 1715840820, NULL, 0, NULL, '2', ''),
(7, 2, 'Destination Weddings at JPS ', '', 'dwatjps-gurugram', '<p>Celebrate the most important day of your life at <strong>JPS Residency</strong>, where dreams come to life amidst the stunning landscapes of <strong>IMT Manesar, Gurgaon. </strong>With our dedicated focus on destination weddings, we offer a picturesque setting combined with impeccable service to ensure your wedding day is flawless and memorable.</p><h3><strong>Why Choose JPS Residency for Your Wedding?</strong></h3><p><strong>Stunning Location: </strong>Nestled in the serene settings of Gurgaon and just 12 minutes from the Dwarka Expressway, JPS Residency offers a tranquil yet accessible retreat. The lush surroundings and elegant architecture provide the perfect backdrop for your wedding photos and ceremonies.</p><p><strong>Customizable Venues</strong>: We offer a variety of venues to match the scale and style of your wedding:</p><p><strong>Grand Lawn: </strong>Accommodates up to 1200 guests, ideal for lavish receptions.<br><strong>Elegant Banquet Hall:</strong> Perfect for gatherings of 100-125 guests, offering a sophisticated space for your wedding banquet.<br><strong>Intimate Settings: </strong>For smaller, more personal ceremonies, our beautifully landscaped gardens and poolside area provide a romantic ambiance.</p><p><strong>Tailored Wedding Packages</strong></p><p>Our wedding packages are designed to provide flexibility and include all the essential elements you need for a stress-free celebration:</p><p><strong>Accommodation</strong>: Luxurious rooms and suites for you and your guests, with special rates for wedding parties.<br><strong>Catering:</strong> Customizable menu options ranging from local delicacies to international cuisines, all prepared by our skilled chefs.<br><strong>Decor:</strong> Thematic decorations tailored to your preferences, from classic elegance to modern chic.<br><strong>Event Planning:</strong> A dedicated wedding planner to guide you through every step, ensuring every detail is handled with care.</p><h3><strong>Additional Wedding Services</strong></h3><p><strong>Photography and Videography</strong>: Connections with top photographers and videographers who can capture your special moments.<br><strong>Entertainment: </strong>Arrangements for live music, DJs, and performances to entertain your guests.<br><strong>Transportation:</strong> Seamless transport options for guests, including airport pickups and local shuttles.</p><p><strong>Your Wedding Journey Starts Here</strong></p><p>From the initial planning stages to the final farewell brunch, we are dedicated to making your wedding journey seamless and spectacular. At JPS Residency, we understand that your wedding is more than just a day; it’s the start of a lifelong journey.</p><h3 style=\"text-align:center;\"><a href=\"https://forms.gle/pNXuwUrkEoFtpLu36\"><span style=\"color:hsl(0,75%,60%);\"><strong>Click Here</strong></span></a></h3><h3><strong>Book Your Wedding Consultation</strong></h3><p>Contact us today to schedule a consultation with our wedding specialist who will help you begin planning your perfect day:</p><ul><li><strong>Phone: </strong>(0124) 2291747, 7835020003, 7835020005</li><li><strong>Email:</strong> Support@Jpsresidency.In</li></ul><p>Embark on your forever at JPS Residency & Hospitality Services, where your wedding day will be as magical as your love story. </p><p> </p><p> </p>', '', '', 5, '1', 1, 1, 4, 1715843070, 1718621025, 1715842920, NULL, 1, NULL, '', ''),
(8, 2, 'Kitty Party', '', 'kitty-party', '<p><strong>Host Your Kitty Party at JPS Residency</strong></p><p><br>Looking for the perfect venue for your next kitty party? Look no further than JPS Residency & Hospitality Services! Our stylish and comfortable spaces provide an ideal setting for a fun and memorable gathering with friends. Enjoy delightful conversations, delicious food, and a cozy ambiance that will make your kitty party truly special.</p><p><strong>Why Choose JPS Residency & Hospitality Services for Your Kitty Party?</strong></p><p> </p><p><strong>Chic and Elegant Venues: </strong>Our beautifully designed spaces offer a blend of sophistication and comfort, perfect for your intimate get-together.</p><p><strong>Gourmet Catering:</strong> Savor a specially curated menu featuring a variety of delectable dishes and refreshing beverages, crafted to please every palate</p><p><strong>Personalized Service: </strong>Our dedicated team ensures that every detail is taken care of, from setup to service, so you can relax and enjoy your party.</p><p><strong>Exciting Themes:</strong> Whether you have a theme in mind or need inspiration, we can help bring your vision to life with customized decorations and arrangements.</p><p> </p><p>Celebrate friendship and create unforgettable memories at JPS Residency & Hospitality Services. Contact us today to book your kitty party and let us take care of the rest!</p><p> </p><ul><li><strong>Email:</strong> <a href=\"mailto:Support@Jpsresidency.In\">Support@Jpsresidency.In</a></li><li><strong>Phone:</strong> (0124) 2291747, 7835020003, 7835020005</li><li><strong>Address:</strong> Opp 446 E Sec 8, IMT Manesar, Gurgaon 122050 (Hr)<br> </li></ul><p> </p>', 'https://www.jpsresidency.in/kitty-party-at-jps-residency', '', 19, '1', 0, 2, 11, 1715857331, 1716900288, 1715857260, NULL, 0, NULL, '2', '1,3'),
(9, 2, 'Birthday Party', '', 'birthday-party', '<p><strong>Celebrate Your Birthday at JPS Residency & Hospitality</strong></p><p><br>Make your birthday celebration unforgettable at JPS Residency & Hospitality!  Our stunning venues and exceptional service provide the perfect setting for a joyous and memorable birthday party. Whether you\'re planning an intimate gathering or a grand celebration, we have everything you need to make your special day extraordinary.</p><p><strong>Why Celebrate at JPS Residency & Hospitality?</strong></p><p> </p><p><strong>Beautiful Venues:</strong> Choose from a variety of elegant spaces, each designed to create the perfect party atmosphere.</p><p><br><strong>Delicious Cuisine: </strong>Indulge in our delectable menu options, crafted by our expert chefs to delight you and your guests.</p><p><br><br><strong>Personalized Service</strong>: Our dedicated event planning team will take care of every detail, ensuring your celebration is seamless and stress-free.</p><p><br><strong>Fun Themes: </strong>Bring your party vision to life with customized decorations, entertainment, and more.</p><p><br>Celebrate your birthday in style at <strong>JPS Residency & Hospitality.</strong> Contact us today to start planning your perfect party!</p><p> </p><ul><li style=\"text-align:justify;\"><strong>Phone:</strong> (0124) 2291747, 7835020003, 7835020005</li><li style=\"text-align:justify;\"><strong>Email:</strong> Support@Jpsresidency.In</li></ul>', '', '', 19, '1', 0, 2, 12, 1715858041, 1716958698, 1715857860, NULL, 0, NULL, '2', '1,3'),
(10, 2, 'Lawn Area', '', 'lawnarea', '', '', '', 7, '1', 0, 1, 5, 1715858288, 1715858288, 1715858100, NULL, NULL, NULL, '', ''),
(11, 2, 'Rooms', '', 'roomsgallery', '', '', '', 7, '1', 0, 1, 6, 1715858466, 1715858466, 1715858280, NULL, NULL, NULL, '', ''),
(12, 2, 'Swimming Pool', '', 'swimmingpool', '', '', '', 7, '1', 0, 1, 7, 1715858564, 1715858564, 1715858460, NULL, NULL, NULL, '', ''),
(13, 2, 'Banquet', '', 'banquet', '', '', '', 7, '1', 0, 1, 8, 1715858720, 1715858720, 1715858580, NULL, NULL, NULL, '', ''),
(14, 2, 'Restaurant', '', 'restaurant', '', '', '', 7, '1', 0, 1, 9, 1715858793, 1715858793, 1715858700, NULL, NULL, NULL, '', ''),
(15, 2, 'Activities', '', 'activities', '', '', '', 7, '1', 0, 1, 10, 1715858895, 1715858895, 1715858760, NULL, NULL, NULL, '', ''),
(16, 2, 'Poolside Haldi', '', 'haldi-at-jps-residency', '<p>Immerse yourself in the vibrant <strong>Haldi ceremony </strong>at <strong>JPS Residency</strong>, where tradition meets elegance. Our beautiful venues and exceptional services provide the perfect backdrop for this joyous pre-wedding ritual. Enjoy the warmth of family, the splash of yellow, and the aromatic delights as we handle every detail to perfection. Celebrate your <strong>Haldi</strong> with us, creating lasting memories in a stunning setting at  <strong>JPS Residency.</strong></p><p><br> </p>', '', '', 5, '1', 1, 1, 13, 1716793318, 1716883780, 1716793080, NULL, 0, NULL, '2', '1,3'),
(17, 2, 'Meetings at JPS Residency', '', 'meetings-at-jps-residency', '<p><strong>Elevate Your Meetings at JPS Residency</strong></p><p>Welcome to <strong> JPS Residency & Hospitality Services</strong>, where business meets elegance. Whether you are planning a large conference, an intimate meeting, or a dynamic corporate event, our state-of-the-art facilities and impeccable service ensure that your event will be a resounding success.</p><p> </p><p><strong>Versatile Meeting Spaces</strong><br>Our hotel offers a range of versatile meeting spaces to accommodate groups of all sizes:</p><p><br><strong>Conference Rooms: </strong>We provide multiple conference rooms equipped with the latest technology. These rooms are ideal for breakout sessions, training seminars, and mid-sized gatherings.</p><p> </p><p><strong>Prime Location</strong><br>Located in the heart of Gurugram, JPS Residency is easily accessible and surrounded by popular attractions, dining, and entertainment options. Our prime location offers convenience for both local and out-of-town guests, making it the ideal choice for your next event.</p><p>Contact Us<br>Ready to start planning your event? Contact our meetings and events team today to discuss your requirements and discover how JPS Residency can turn your vision into reality.</p><ul><li style=\"text-align:justify;\"><strong>Phone:</strong> (0124) 2291747, 7835020003, 7835020005</li><li style=\"text-align:justify;\"><strong>Email:</strong> Support@Jpsresidency.In</li></ul><p> </p>', 'https://www.jpsresidency.in/meetings-at-jps-residency', '', 1, '1', 1, 2, 14, 1716799629, 1717048266, 1716799320, NULL, 0, NULL, '2', '1,3'),
(18, 2, 'Sangeet Nights at JPS Residency', '', 'sangeet', '<p>Celebrate the joyous Sangeet night at <strong>JPS Residency</strong>, where music and dance come alive in a spectacular setting. Our luxurious venues and personalized services ensure an unforgettable pre-wedding celebration. Delight in exquisite décor, delicious cuisine, and seamless event planning, making your Sangeet a cherished memory. Experience the perfect blend of tradition and elegance at <strong>JPS Residency. </strong>where every detail is crafted to perfection.</p><p><br> </p>', '', '', 5, '1', 1, 1, 15, 1716802591, 1716882869, 1716802200, NULL, 0, NULL, '', ''),
(19, 2, 'Mehndi', '', 'mehndi', '<p>Celebrate the beauty of the <strong>Mehndi ceremony</strong> at  <strong>JPS Residency</strong> where tradition and elegance blend seamlessly. Our exquisite venues and personalized services create the perfect ambiance for this special pre-wedding event. Enjoy intricate henna designs, vibrant décor, and delicious treats as we take care of every detail. Make</p><p> </p><p> </p><p><br> </p>', '', '', 5, '1', 1, 1, 16, 1716881825, 1716883895, 1716881760, NULL, 0, NULL, '2', '1,3');

-- --------------------------------------------------------

--
-- Table structure for table `pm_article_file`
--

CREATE TABLE `pm_article_file` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT 0,
  `checked` int(11) DEFAULT 1,
  `rank` int(11) DEFAULT 0,
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_article_file`
--

INSERT INTO `pm_article_file` (`id`, `lang`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(4, 1, 4, 0, 2, 1, 'sample4.jpg', '', 'image'),
(4, 2, 4, 0, 2, 1, 'sample4.jpg', '', 'image'),
(4, 3, 4, 0, 2, 1, 'sample4.jpg', '', 'image'),
(5, 1, 1, 0, 1, 1, 'diving.jpg', '', 'image'),
(5, 2, 1, 0, 1, 1, 'diving.jpg', '', 'image'),
(5, 3, 1, 0, 1, 1, 'diving.jpg', '', 'image'),
(6, 2, 1, 1, 1, 1, 'hotelweed.jpg', 'Welcome', 'image'),
(7, 2, 1, 0, 1, 2, 'hotelweed.jpg', '', 'image'),
(8, 2, 1, 1, 1, 1, 'hotelweed.jpg', '', 'image'),
(9, 2, 1, 1, 1, 1, 'hotelweed1.jpg', '', 'image'),
(10, 2, 1, 1, 1, 2, 'weed500.jpg', '', 'image'),
(11, 2, 5, 0, 1, 3, 'weed500.jpg', '', 'image'),
(12, 2, 1, 0, 1, 1, 'weed500.jpg', '', 'image'),
(13, 2, 7, 1, 1, 3, 'weed500.jpg', '', 'image'),
(14, 2, 4, 0, 1, 2, 'img-20240420-wa0001.jpg', '', 'image'),
(15, 2, 4, 0, 1, 2, 'img-20240420-wa0017.jpg', 'Welcome', 'image'),
(16, 2, 4, 0, 1, 3, 'img-20240420-wa0015.jpg', '', 'image'),
(17, 2, 4, 0, 1, 3, 'img-20240420-wa0085.jpg', '', 'image'),
(18, 2, 4, 1, 1, 4, 'img-20240420-wa0035.jpg', '', 'image'),
(19, 2, 4, 0, 1, 5, 'img-20240420-wa0012.jpg', '', 'image'),
(20, 2, 4, 0, 1, 6, 'img-20240420-wa0023.jpg', '', 'image'),
(21, 2, 4, 0, 1, 7, 'img-20240420-wa0005.jpg', '', 'image'),
(22, 2, 4, 0, 1, 8, 'img-20240420-wa0010.jpg', '', 'image'),
(23, 2, 4, 0, 1, 9, '12.jpg', '', 'image'),
(24, 2, 4, 1, 1, 10, '18.jpg', '', 'image'),
(25, 2, 4, 0, 1, 11, '17.jpg', '', 'image'),
(26, 2, 4, 0, 1, 12, '20.jpg', '', 'image'),
(27, 2, 4, 0, 1, 13, '14.jpg', '', 'image'),
(28, 2, 4, 0, 1, 14, '9.jpg', '', 'image'),
(29, 2, 4, 0, 1, 15, '21.jpg', '', 'image'),
(30, 2, 4, 0, 1, 16, '10.jpg', '', 'image'),
(31, 2, 4, 0, 1, 17, '85.jpg', '', 'image'),
(32, 2, 4, 0, 1, 18, '27.jpg', '', 'image'),
(33, 2, 4, 0, 1, 19, '34.jpg', '', 'image'),
(34, 2, 4, 0, 1, 20, '80.jpg', '', 'image'),
(35, 2, 4, 0, 1, 21, '37.jpg', '', 'image'),
(36, 2, 4, 0, 1, 22, '26.jpg', '', 'image'),
(37, 2, 4, 0, 1, 23, '23.jpg', '', 'image'),
(38, 2, 4, 0, 1, 24, '38.jpg', '', 'image'),
(39, 2, 4, 0, 1, 25, '84.jpg', '', 'image'),
(40, 2, 4, 0, 1, 26, '24.jpg', '', 'image'),
(41, 2, 4, 0, 1, 27, '89.jpg', '', 'image'),
(42, 2, 4, 0, 1, 28, '92.jpg', '', 'image'),
(43, 2, 8, 0, 1, 2, '56.jpg', '', 'image'),
(44, 2, 8, 0, 1, 3, '53.jpg', '', 'image'),
(45, 2, 8, 0, 1, 4, '54.jpg', '', 'image'),
(46, 2, 8, 0, 1, 5, '57.jpg', '', 'image'),
(47, 2, 8, 0, 1, 6, '55.jpg', '', 'image'),
(48, 2, 9, 0, 1, 1, '17.jpg', NULL, 'image'),
(49, 2, 9, 0, 2, 4, '58.jpg', '', 'image'),
(50, 2, 9, 0, 2, 5, '2.jpg', '', 'image'),
(51, 2, 9, 0, 2, 6, '10.jpg', '', 'image'),
(52, 2, 9, 0, 2, 7, '46.jpg', '', 'image'),
(53, 2, 9, 0, 2, 8, '47.jpg', '', 'image'),
(54, 2, 9, 0, 2, 9, '9.jpg', '', 'image'),
(55, 2, 9, 0, 2, 10, '57.jpg', '', 'image'),
(56, 2, 9, 0, 2, 11, '74.jpg', '', 'image'),
(57, 2, 9, 0, 2, 12, '34.jpg', '', 'image'),
(58, 2, 10, 0, 1, 34, '58.jpg', NULL, 'image'),
(59, 2, 10, 0, 1, 35, '9.jpg', NULL, 'image'),
(60, 2, 10, 0, 1, 36, '17.jpg', NULL, 'image'),
(61, 2, 10, 0, 1, 37, '57.jpg', NULL, 'image'),
(62, 2, 10, 0, 1, 38, '46.jpg', NULL, 'image'),
(63, 2, 10, 0, 1, 39, '34.jpg', NULL, 'image'),
(64, 2, 10, 0, 1, 40, '10.jpg', NULL, 'image'),
(65, 2, 10, 0, 1, 41, '2.jpg', NULL, 'image'),
(66, 2, 10, 0, 1, 42, '47.jpg', NULL, 'image'),
(67, 2, 11, 0, 1, 43, '19.jpg', NULL, 'image'),
(68, 2, 11, 0, 1, 44, '11.jpg', NULL, 'image'),
(69, 2, 11, 0, 1, 45, '25.jpg', NULL, 'image'),
(70, 2, 11, 0, 1, 46, '8.jpg', NULL, 'image'),
(71, 2, 11, 0, 1, 47, '28.jpg', NULL, 'image'),
(72, 2, 11, 0, 1, 48, '32.jpg', NULL, 'image'),
(73, 2, 11, 0, 1, 49, '13.jpg', NULL, 'image'),
(74, 2, 11, 0, 1, 50, '24.jpg', NULL, 'image'),
(75, 2, 11, 0, 1, 51, '29.jpg', NULL, 'image'),
(76, 2, 11, 0, 1, 52, '26.jpg', NULL, 'image'),
(77, 2, 12, 0, 1, 53, '14.jpg', NULL, 'image'),
(78, 2, 12, 0, 1, 54, '12.jpg', NULL, 'image'),
(79, 2, 12, 0, 1, 55, '20.jpg', NULL, 'image'),
(80, 2, 12, 0, 1, 56, '21.jpg', NULL, 'image'),
(81, 2, 12, 0, 1, 57, '18.jpg', NULL, 'image'),
(82, 2, 13, 0, 1, 58, '38.jpg', NULL, 'image'),
(83, 2, 13, 0, 1, 59, '22.jpg', NULL, 'image'),
(84, 2, 13, 0, 1, 60, '127.jpg', NULL, 'image'),
(85, 2, 13, 0, 1, 61, '37.jpg', NULL, 'image'),
(86, 2, 13, 0, 1, 62, '128.jpg', NULL, 'image'),
(87, 2, 13, 0, 1, 63, '130.jpg', NULL, 'image'),
(88, 2, 14, 0, 1, 64, '27.jpg', NULL, 'image'),
(89, 2, 14, 0, 1, 65, '23.jpg', NULL, 'image'),
(90, 2, 15, 0, 1, 66, '6.jpg', NULL, 'image'),
(91, 2, 15, 0, 1, 67, '41.jpg', NULL, 'image'),
(92, 2, 15, 0, 1, 68, '30.jpg', NULL, 'image'),
(93, 2, 15, 0, 1, 69, '42.jpg', NULL, 'image'),
(94, 2, 15, 0, 1, 70, '7.jpg', NULL, 'image'),
(95, 2, 7, 0, 1, 2, 'dw1.jpg', '', 'image'),
(96, 2, 16, 0, 2, 1, 'test111111.jpg', '', 'image'),
(97, 2, 16, 0, 2, 1, 'confernce-room.png', '', 'image'),
(98, 2, 17, 0, 1, 1, 'kitty-party.png', '', 'image'),
(99, 2, 18, 0, 2, 3, 'birthday.png', '', 'image'),
(100, 2, 16, 0, 2, 2, 'haldi.png', NULL, 'image'),
(101, 2, 16, 0, 1, 1, 'haldi.png', '', 'image'),
(102, 2, 7, 0, 1, 1, 'weeding.png', '', 'image'),
(103, 2, 17, 0, 1, 1, 'mehndi.png', '', 'image'),
(104, 2, 17, 1, 1, 1, 'mehndi.png', '', 'image'),
(105, 2, 17, 0, 2, 2, 'vecteezy-wedding-elegance-shines-in-intricate-henna-tattoos-generated-24651254.jpg', '', 'image'),
(106, 2, 17, 1, 2, 2, 'mehndi.png', '', 'image'),
(107, 2, 18, 0, 1, 2, 'sangeet.png', '', 'image'),
(108, 2, 17, 0, 1, 1, 'mehndi.jpg', '', 'image'),
(109, 2, 19, 0, 1, 2, 'mehndi.jpg', '', 'image'),
(110, 2, 18, 0, 1, 1, 'sanget-2.png', '', 'image'),
(111, 2, 16, 0, 1, 2, 'haldi-2.png', '', 'image'),
(112, 2, 19, 0, 2, 3, 'indian-4388167-1280.jpg', '', 'image'),
(113, 2, 7, 0, 1, 71, 'weeding-3.png', '', 'image'),
(114, 2, 19, 0, 1, 1, 'weeding-3.png', '', 'image'),
(115, 2, 17, 0, 2, 2, 'meetings-at-jps-residency.png', '', 'image'),
(116, 2, 9, 0, 2, 3, 'birthday-party-at-jps.png', '', 'image'),
(117, 2, 8, 0, 1, 1, 'kitty-party.png', '', 'image'),
(118, 2, 17, 0, 2, 3, 'meetings-at-jps-residency.png', '', 'image'),
(119, 2, 17, 0, 2, 2, 'untitled-design.png', '', 'image'),
(120, 2, 9, 0, 1, 3, 'birthday-party-at-jps.png', '', 'image'),
(121, 2, 9, 0, 1, 13, '1691055357-en-idei-club-p-can-we-decorate-hotel-room-for-birthday-di-44.jpg', '', 'image'),
(122, 2, 9, 0, 1, 2, 'kitty-party.png', '', 'image'),
(123, 2, 9, 0, 1, 1, 'birthday-party-at-jps.png', '', 'image'),
(124, 2, 17, 0, 1, 1, 'whatsapp-image-2024-05-29-at-10-45-07-389a5966.jpg', '', 'image'),
(125, 2, 17, 0, 1, 72, 'untitled-design-1.png', '', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_booking`
--

CREATE TABLE `pm_booking` (
  `id` int(11) NOT NULL,
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `from_date` int(11) DEFAULT NULL,
  `to_date` int(11) DEFAULT NULL,
  `nights` int(11) DEFAULT 0,
  `adults` int(11) DEFAULT 1,
  `children` int(11) DEFAULT 1,
  `tourist_tax` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `id_coupon` int(11) DEFAULT NULL,
  `ex_tax` float DEFAULT NULL,
  `tax_amount` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `down_payment` float DEFAULT NULL,
  `paid` float DEFAULT NULL,
  `balance` float DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `country` varchar(100) NOT NULL,
  `comments` text DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `trans` varchar(50) DEFAULT NULL,
  `payment_date` int(11) DEFAULT NULL,
  `payment_option` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_booking`
--

INSERT INTO `pm_booking` (`id`, `add_date`, `edit_date`, `from_date`, `to_date`, `nights`, `adults`, `children`, `tourist_tax`, `discount`, `id_coupon`, `ex_tax`, `tax_amount`, `total`, `down_payment`, `paid`, `balance`, `id_user`, `firstname`, `lastname`, `email`, `company`, `address`, `postcode`, `city`, `phone`, `mobile`, `country`, `comments`, `status`, `trans`, `payment_date`, `payment_option`) VALUES
(20, 1718350468, 1718354275, 1718323200, 1718409600, 1, 2, 1, NULL, 0, NULL, 1607.14, 216, 1800, 0, 0, 1800, NULL, 'Raj', 'Sharma', 'classicsunil@gmail.com', '', 'Jind', '126102', 'Jind', '8818001824', '', 'India', '', 4, NULL, NULL, 'arrival'),
(24, 1718724435, 1718862734, 1719014400, 1719100800, 1, 2, 0, NULL, 0, NULL, 1607.14, 216, 1800, 0, 0, 1800, NULL, 'Nidhir Chandra', 'Ghosh', 'nidhiragt@gmail.com', '', 'Ganaraj chowhumani', '799001', 'Agartala', '8787644281', '9436583420', 'India', '', 4, NULL, NULL, 'arrival'),
(26, 1719246701, NULL, 1719705600, 1719792000, 1, 2, 1, NULL, 0, NULL, 2500, 300, 2800, NULL, NULL, NULL, 0, 'Praveen', 'Kumar', 'pl539621@gmail.com', '', '324 Gali no. 7', '121003', 'Faridabad', '8447350203', '8447350203', 'India', '', 1, NULL, NULL, 'arrival'),
(27, 1719247264, NULL, 1719705600, 1719792000, 1, 2, 1, NULL, 0, NULL, 3045.45, 354.55, 3400, NULL, NULL, NULL, 4, 'Praveen', 'Kumar', 'pk539621@gmail.com', '', '324 Block D Nikhil vihar ismailpur Faridabad', '121003', 'Faridabad', '8447350203', '8447350203', 'India', '', 1, NULL, NULL, 'arrival'),
(28, 1719284482, NULL, 1719705600, 1719792000, 1, 2, 1, NULL, 0, NULL, 2545.46, 294.55, 2840, NULL, NULL, NULL, 4, 'Praveen', 'Kumar', 'pk539621@gmail.com', '', '324 Block D Nikhil vihar ismailpur Faridabad', '121003', 'Faridabad', '8447350203', '8447350203', 'India', '', 1, NULL, NULL, 'arrival'),
(29, 1719482806, NULL, 1719446400, 1719532800, 1, 2, 1, NULL, 0, NULL, 7500, 900, 8400, NULL, NULL, NULL, 0, 'jyoti', 'garg', 'awlmeta.jyotigarg@gmail.com', '', 'Near Old bus stand jind', '126102', 'Jind', '9467503920', '', 'India', '', 1, NULL, NULL, 'arrival'),
(30, 1719483128, NULL, 1719446400, 1719532800, 1, 2, 0, NULL, 0, NULL, 5000, 600, 5600, 1680, NULL, NULL, 0, 'jyoti', 'garg', 'awlmeta.jyotigarg@gmail.com', '', 'Near Old bus stand jind', '126102', 'Jind', '9467503920', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(31, 1719561460, NULL, 1719532800, 1719619200, 1, 2, 0, NULL, 0, NULL, 5089.29, 610.71, 5700, 1710, NULL, NULL, 0, 'saniya', 'khan', 'sksaniya028@gmail.com', '', 'C 42', '122505', 'Gurgaon', '8126937491', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(32, 1719564650, NULL, 1719619200, 1719705600, 1, 1, 0, NULL, 0, NULL, 1600, 192, 1792, 537.6, NULL, NULL, 0, 'Jyoti', 'saini', 'jyotisaini1855@gmil.com', '', 'jind', '12612', 'jind', '8307811235', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(33, 1719564901, NULL, 1719532800, 1719619200, 1, 2, 0, NULL, 0, NULL, 1800, 216, 2016, NULL, NULL, NULL, 0, 'jyoti', 'garg', 'awlmeta.jyotigarg@gmail.com', '', 'Near Old bus stand jind', '126102', '126102', '9467503920', '', 'India', '', 1, NULL, NULL, 'arrival'),
(36, 1719911909, NULL, 1719878400, 1719964800, 1, 1, 0, NULL, 0, NULL, 1600, 192, 1792, 537.6, NULL, NULL, 1, 'saniya', 'khan', 'sksaniya028@gmail.com', 'ask', 'gurgaon haryana', '122050', 'Gurgaon', '8126937491', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(37, 1720089648, NULL, 1720051200, 1720137600, 1, 2, 0, NULL, 0, NULL, 1800, 216, 2016, 604.8, NULL, NULL, 1, 'saniya', 'khan', 'sksaniya028@gmail.com', 'ask', 'gurgaon haryana', '122050', 'Gurgaon', '8126937491', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(38, 1720090107, NULL, 1720310400, 1720396800, 1, 2, 0, NULL, 0, NULL, 5000, 600, 5600, 1680, NULL, NULL, 1, 'saniya', 'khan', 'sksaniya028@gmail.com', 'ask', 'gurgaon haryana', '122050', 'Gurgaon', '8126937491', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(39, 1720501071, NULL, 1720483200, 1720569600, 1, 2, 0, NULL, 0, NULL, 1800, 216, 2016, 604.8, NULL, NULL, 0, 'Aarti', 'saini', 'awlmeta.aarti@gmail.com', '', 'jind', '126102', 'jind', '9467503920', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(40, 1720518305, NULL, 1720483200, 1720569600, 1, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, NULL, NULL, 0, 'Aarti', 'saini', 'awlmeta.aarti@gmail.com', '', 'jind', '126102', 'jind', '9050185967', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(41, 1720518720, NULL, 1720483200, 1720569600, 1, 1, 2, NULL, 0, NULL, 2050, 246, 2296, 688.8, NULL, NULL, 0, 'Jyoti', 'saini', 'jyotisaini1855@gmil.com', '', 'jind', '126102', 'jind', '8307811235', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(42, 1720520280, NULL, 1720483200, 1720569600, 1, 1, 2, NULL, 0, NULL, 1600, 192, 1792, 537.6, NULL, NULL, 1, 'saniya', 'khan', 'sksaniya028@gmail.com', 'ask', 'gurgaon haryana', '122050', 'Gurgaon', '8126937491', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(43, 1720525768, NULL, 1720483200, 1720569600, 1, 1, 0, NULL, 0, NULL, 1600, 192, 1792, 537.6, NULL, NULL, 0, 'jyoti', 'garg', 'awlmeta.jyotigarg@gmail.com', '', 'Near Old bus stand jind', '126102', 'Jind', '9467503920', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(44, 1720525944, NULL, 1720483200, 1720569600, 1, 1, 0, NULL, 0, NULL, 1600, 192, 1792, 537.6, NULL, NULL, 1, 'saniya', 'khan', 'sksaniya028@gmail.com', 'ask', 'gurgaon haryana', '122050', 'Gurgaon', '8126937491', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(45, 1720608146, NULL, 1720569600, 1720656000, 1, 1, 2, NULL, 0, NULL, 1600, 192, 1792, 537.6, NULL, NULL, 0, 'jyoti', 'saini', 'Jyotisaini1855@gmail.com', '', 'Jind', '126102', 'jind', '8307811235', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(46, 1720609634, NULL, 1720569600, 1720656000, 1, 1, 0, NULL, 0, NULL, 1600, 192, 1792, 537.6, NULL, NULL, 0, 'jyoti', 'garg', 'awlmeta.jyotigarg@gmail.com', '', 'Near Old bus stand jind', '126102', 'Jind', '9467503920', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(47, 1720681823, NULL, 1720656000, 1720742400, 1, 2, 0, NULL, 0, NULL, 1800, 216, 2016, 604.8, NULL, NULL, 0, 'Aarti', 'Saini', 'awlmeta.aarti@gmail.com', '', 'jind', '126102', 'jind', '9467503920', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(48, 1721102968, NULL, 1721088000, 1721174400, 1, 1, 2, NULL, 0, NULL, 1600, 192, 1792, 537.6, NULL, NULL, 0, 'jyoti', 'saini', 'Jyotisaini1855@gmail.com', '', 'Jind', '126102', 'jind', '8307811235', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(49, 1721108908, NULL, 1721088000, 1721174400, 1, 1, 2, NULL, 0, NULL, 1600, 192, 1792, 537.6, NULL, NULL, 0, 'Jyoti', 'saini', 'jyotisaini1855@gmil.com', '', 'jind', '126102', 'jind', '8307811235', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(50, 1721109499, NULL, 1721088000, 1721174400, 1, 1, 2, NULL, 0, NULL, 1600, 192, 1792, 537.6, NULL, NULL, 0, 'Jyoti', 'saini', 'jyotisaini1855@gmil.com', '', 'jind', '126102', 'jind', '8307811235', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(51, 1721302467, NULL, 1721260800, 1721347200, 1, 1, 0, NULL, 0, NULL, 1600, 192, 1792, 537.6, NULL, NULL, 0, 'jyoti', 'garg', 'awlmeta.arti@gmail.com', '', 'awlmetaverse ', '126102', 'Jind ', '9467503920', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(52, 1721307212, NULL, 1721260800, 1721347200, 1, 2, 0, NULL, 0, NULL, 2000, 240, 2240, 672, NULL, NULL, 0, 'Abhishek', 'Jadhav', 'j549@gmail.com', '', 'CV RAMAN NAGAR BANGALORE', '560093', 'BANGALORE', '7895672431', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(53, 1721393515, NULL, 1721347200, 1721433600, 1, 1, 0, NULL, 0, NULL, 1600, 192, 1792, 537.6, NULL, NULL, 0, 'sde', 'swde', 'test@gmail.com', '', 'qwse', '560067', 'bangalore', '1234 567 890', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(54, 1721649414, NULL, 1721606400, 1721692800, 1, 1, 0, NULL, 0, NULL, 1600, 192, 1792, 537.6, NULL, NULL, 1, 'saniya', 'khan', 'sksaniya028@gmail.com', 'ask', 'gurgaon haryana', '122050', 'Gurgaon', '8126937491', '', 'India', '', 1, NULL, NULL, 'razorpay'),
(55, 1721980404, NULL, 1721952000, 1722038400, 1, 2, 0, NULL, 0, NULL, 1800, 216, 2016, 604.8, NULL, NULL, 1, 'saniya', 'khan', 'sksaniya028@gmail.com', 'ask', 'gurgaon haryana', '122050', 'Gurgaon', '8126937491', '', 'India', '', 1, NULL, NULL, 'razorpay');

-- --------------------------------------------------------

--
-- Table structure for table `pm_booking_activity`
--

CREATE TABLE `pm_booking_activity` (
  `id` int(11) NOT NULL,
  `id_booking` int(11) NOT NULL,
  `id_activity` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `children` int(11) DEFAULT 0,
  `adults` int(11) DEFAULT 0,
  `duration` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT 0,
  `ex_tax` double DEFAULT 0,
  `tax_rate` double DEFAULT 0,
  `date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pm_booking_payment`
--

CREATE TABLE `pm_booking_payment` (
  `id` int(11) NOT NULL,
  `id_booking` int(11) NOT NULL,
  `descr` varchar(100) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `amount` double DEFAULT 0,
  `date` int(11) DEFAULT NULL,
  `trans` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pm_booking_room`
--

CREATE TABLE `pm_booking_room` (
  `id` int(11) NOT NULL,
  `id_booking` int(11) NOT NULL,
  `id_room` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `num` varchar(10) DEFAULT NULL,
  `children` int(11) DEFAULT 0,
  `adults` int(11) DEFAULT 0,
  `amount` double DEFAULT 0,
  `ex_tax` double DEFAULT 0,
  `tax_rate` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_booking_room`
--

INSERT INTO `pm_booking_room` (`id`, `id_booking`, `id_room`, `title`, `num`, `children`, `adults`, `amount`, `ex_tax`, `tax_rate`) VALUES
(22, 20, 1, 'Deluxe Room', '', 1, 2, 1800, 1800, 12),
(26, 24, 1, 'Deluxe Room', '', 0, 2, 1800, 1800, 12),
(28, 26, 2, 'Super Deluxe Room', NULL, 1, 2, 2500, 2500, 12),
(29, 27, 2, 'Super Deluxe Room', NULL, 1, 2, 2500, 2500, 12),
(30, 28, 2, 'Super Deluxe Room', NULL, 1, 2, 2000, 2000, 12),
(31, 29, 6, 'Best offer For Couple ', NULL, 1, 2, 7500, 7500, 12),
(32, 30, 6, 'Best offer For Couple ', NULL, 0, 2, 5000, 5000, 12),
(33, 31, 6, 'Best offer For Couple ', NULL, 0, 2, 5000, 5000, 12),
(34, 32, 1, 'Deluxe Room', NULL, 0, 1, 1600, 1600, 12),
(35, 33, 1, 'Deluxe Room', NULL, 0, 2, 1800, 1800, 12),
(38, 36, 1, 'Deluxe Room', NULL, 0, 1, 1600, 1600, 12),
(39, 37, 1, 'Deluxe Room', NULL, 0, 2, 1800, 1800, 12),
(40, 38, 6, 'Best offer For Couple ', NULL, 0, 2, 5000, 5000, 12),
(41, 39, 1, 'Deluxe Room', NULL, 0, 2, 1800, 1800, 12),
(42, 41, 1, 'Deluxe Room', NULL, 2, 1, 2050, 2050, 12),
(43, 42, 1, 'Deluxe Room', NULL, 2, 1, 1600, 1600, 12),
(44, 43, 1, 'Deluxe Room', NULL, 0, 1, 1600, 1600, 12),
(45, 44, 1, 'Deluxe Room', NULL, 0, 1, 1600, 1600, 12),
(46, 45, 1, 'Deluxe Room', NULL, 2, 1, 1600, 1600, 12),
(47, 46, 1, 'Deluxe Room', NULL, 0, 1, 1600, 1600, 12),
(48, 47, 1, 'Deluxe Room', NULL, 0, 2, 1800, 1800, 12),
(49, 48, 1, 'Deluxe Room', NULL, 2, 1, 1600, 1600, 12),
(50, 49, 1, 'Deluxe Room', NULL, 2, 1, 1600, 1600, 12),
(51, 50, 1, 'Deluxe Room', NULL, 2, 1, 1600, 1600, 12),
(52, 51, 1, 'Deluxe Room', NULL, 0, 1, 1600, 1600, 12),
(53, 52, 2, 'Super Deluxe Room', NULL, 0, 2, 2000, 2000, 12),
(54, 53, 1, 'Deluxe Room', NULL, 0, 1, 1600, 1600, 12),
(55, 54, 1, 'Deluxe Room', NULL, 0, 1, 1600, 1600, 12),
(56, 55, 1, 'Deluxe Room', NULL, 0, 2, 1800, 1800, 12);

-- --------------------------------------------------------

--
-- Table structure for table `pm_booking_service`
--

CREATE TABLE `pm_booking_service` (
  `id` int(11) NOT NULL,
  `id_booking` int(11) NOT NULL,
  `id_service` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `qty` int(11) DEFAULT 0,
  `amount` double DEFAULT 0,
  `ex_tax` double DEFAULT 0,
  `tax_rate` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_booking_service`
--

INSERT INTO `pm_booking_service` (`id`, `id_booking`, `id_service`, `title`, `qty`, `amount`, `ex_tax`, `tax_rate`) VALUES
(5, 27, 2, 'Veg Thali', 2, 600, 545.45, 10),
(6, 28, 2, 'Veg Thali', 2, 600, 545.45, 10),
(7, 31, 5, 'laundary', 1, 100, 89.29, 12);

-- --------------------------------------------------------

--
-- Table structure for table `pm_booking_tax`
--

CREATE TABLE `pm_booking_tax` (
  `id` int(11) NOT NULL,
  `id_booking` int(11) NOT NULL,
  `id_tax` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_booking_tax`
--

INSERT INTO `pm_booking_tax` (`id`, `id_booking`, `id_tax`, `name`, `amount`) VALUES
(20, 20, 2, 'GST', 216),
(24, 24, 2, 'GST', 216),
(26, 26, 2, 'GST', 300),
(27, 27, 2, 'GST', 300),
(28, 27, 1, 'Tax', 54.55),
(29, 28, 2, 'GST', 240),
(30, 28, 1, 'Tax', 54.55),
(31, 29, 2, 'GST', 900),
(32, 30, 2, 'GST', 600),
(33, 31, 2, 'GST', 610.71),
(34, 32, 2, 'GST', 192),
(35, 33, 2, 'GST', 216),
(38, 36, 2, 'GST', 192),
(39, 37, 2, 'GST', 216),
(40, 38, 2, 'GST', 600),
(41, 39, 2, 'GST', 216),
(42, 41, 2, 'GST', 246),
(43, 42, 2, 'GST', 192),
(44, 43, 2, 'GST', 192),
(45, 44, 2, 'GST', 192),
(46, 45, 2, 'GST', 192),
(47, 46, 2, 'GST', 192),
(48, 47, 2, 'GST', 216),
(49, 48, 2, 'GST', 192),
(50, 49, 2, 'GST', 192),
(51, 50, 2, 'GST', 192),
(52, 51, 2, 'GST', 192),
(53, 52, 2, 'GST', 240),
(54, 53, 2, 'GST', 192),
(55, 54, 2, 'GST', 192),
(56, 55, 2, 'GST', 216);

-- --------------------------------------------------------

--
-- Table structure for table `pm_comment`
--

CREATE TABLE `pm_comment` (
  `id` int(11) NOT NULL,
  `item_type` varchar(30) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT 0,
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `msg` longtext DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_comment`
--

INSERT INTO `pm_comment` (`id`, `item_type`, `id_item`, `rating`, `checked`, `add_date`, `edit_date`, `name`, `email`, `msg`, `ip`) VALUES
(1, 'article', 7, 0, 2, 1716361481, 1716532388, 'saniya', 'sksaniya028@gmail.com', 'hyyy', '14.102.24.231'),
(2, 'article', 7, 0, 1, 1716532271, 1716532380, 'Harvansh', 'awlmeta.gautam@gmail.com', 'good hotel\r\n\r\n', '2405:201:5805:d020:20a5:8597:97e5:5847'),
(3, 'article', 7, NULL, 1, 1718645720, NULL, 'Saniya', 'sksaniya028@gmail.com', 'Hy I need a resort for marriage', '2405:204:30a3:cb8c:9d96:c884:dbfc:6a54');

-- --------------------------------------------------------

--
-- Table structure for table `pm_country`
--

CREATE TABLE `pm_country` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_country`
--

INSERT INTO `pm_country` (`id`, `name`, `code`) VALUES
(1, 'Afghanistan', 'AF'),
(2, 'Åland', 'AX'),
(3, 'Albania', 'AL'),
(4, 'Algeria', 'DZ'),
(5, 'American Samoa', 'AS'),
(6, 'Andorra', 'AD'),
(7, 'Angola', 'AO'),
(8, 'Anguilla', 'AI'),
(9, 'Antarctica', 'AQ'),
(10, 'Antigua and Barbuda', 'AG'),
(11, 'Argentina', 'AR'),
(12, 'Armenia', 'AM'),
(13, 'Aruba', 'AW'),
(14, 'Australia', 'AU'),
(15, 'Austria', 'AT'),
(16, 'Azerbaijan', 'AZ'),
(17, 'Bahamas', 'BS'),
(18, 'Bahrain', 'BH'),
(19, 'Bangladesh', 'BD'),
(20, 'Barbados', 'BB'),
(21, 'Belarus', 'BY'),
(22, 'Belgium', 'BE'),
(23, 'Belize', 'BZ'),
(24, 'Benin', 'BJ'),
(25, 'Bermuda', 'BM'),
(26, 'Bhutan', 'BT'),
(27, 'Bolivia', 'BO'),
(28, 'Bonaire', 'BQ'),
(29, 'Bosnia and Herzegovina', 'BA'),
(30, 'Botswana', 'BW'),
(31, 'Bouvet Island', 'BV'),
(32, 'Brazil', 'BR'),
(33, 'British Indian Ocean Territory', 'IO'),
(34, 'British Virgin Islands', 'VG'),
(35, 'Brunei', 'BN'),
(36, 'Bulgaria', 'BG'),
(37, 'Burkina Faso', 'BF'),
(38, 'Burundi', 'BI'),
(39, 'Cambodia', 'KH'),
(40, 'Cameroon', 'CM'),
(41, 'Canada', 'CA'),
(42, 'Cape Verde', 'CV'),
(43, 'Cayman Islands', 'KY'),
(44, 'Central African Republic', 'CF'),
(45, 'Chad', 'TD'),
(46, 'Chile', 'CL'),
(47, 'China', 'CN'),
(48, 'Christmas Island', 'CX'),
(49, 'Cocos [Keeling] Islands', 'CC'),
(50, 'Colombia', 'CO'),
(51, 'Comoros', 'KM'),
(52, 'Cook Islands', 'CK'),
(53, 'Costa Rica', 'CR'),
(54, 'Croatia', 'HR'),
(55, 'Cuba', 'CU'),
(56, 'Curacao', 'CW'),
(57, 'Cyprus', 'CY'),
(58, 'Czech Republic', 'CZ'),
(59, 'Democratic Republic of the Congo', 'CD'),
(60, 'Denmark', 'DK'),
(61, 'Djibouti', 'DJ'),
(62, 'Dominica', 'DM'),
(63, 'Dominican Republic', 'DO'),
(64, 'East Timor', 'TL'),
(65, 'Ecuador', 'EC'),
(66, 'Egypt', 'EG'),
(67, 'El Salvador', 'SV'),
(68, 'Equatorial Guinea', 'GQ'),
(69, 'Eritrea', 'ER'),
(70, 'Estonia', 'EE'),
(71, 'Ethiopia', 'ET'),
(72, 'Falkland Islands', 'FK'),
(73, 'Faroe Islands', 'FO'),
(74, 'Fiji', 'FJ'),
(75, 'Finland', 'FI'),
(76, 'France', 'FR'),
(77, 'French Guiana', 'GF'),
(78, 'French Polynesia', 'PF'),
(79, 'French Southern Territories', 'TF'),
(80, 'Gabon', 'GA'),
(81, 'Gambia', 'GM'),
(82, 'Georgia', 'GE'),
(83, 'Germany', 'DE'),
(84, 'Ghana', 'GH'),
(85, 'Gibraltar', 'GI'),
(86, 'Greece', 'GR'),
(87, 'Greenland', 'GL'),
(88, 'Grenada', 'GD'),
(89, 'Guadeloupe', 'GP'),
(90, 'Guam', 'GU'),
(91, 'Guatemala', 'GT'),
(92, 'Guernsey', 'GG'),
(93, 'Guinea', 'GN'),
(94, 'Guinea-Bissau', 'GW'),
(95, 'Guyana', 'GY'),
(96, 'Haiti', 'HT'),
(97, 'Heard Island and McDonald Islands', 'HM'),
(98, 'Honduras', 'HN'),
(99, 'Hong Kong', 'HK'),
(100, 'Hungary', 'HU'),
(101, 'Iceland', 'IS'),
(102, 'India', 'IN'),
(103, 'Indonesia', 'ID'),
(104, 'Iran', 'IR'),
(105, 'Iraq', 'IQ'),
(106, 'Ireland', 'IE'),
(107, 'Isle of Man', 'IM'),
(108, 'Israel', 'IL'),
(109, 'Italy', 'IT'),
(110, 'Ivory Coast', 'CI'),
(111, 'Jamaica', 'JM'),
(112, 'Japan', 'JP'),
(113, 'Jersey', 'JE'),
(114, 'Jordan', 'JO'),
(115, 'Kazakhstan', 'KZ'),
(116, 'Kenya', 'KE'),
(117, 'Kiribati', 'KI'),
(118, 'Kosovo', 'XK'),
(119, 'Kuwait', 'KW'),
(120, 'Kyrgyzstan', 'KG'),
(121, 'Laos', 'LA'),
(122, 'Latvia', 'LV'),
(123, 'Lebanon', 'LB'),
(124, 'Lesotho', 'LS'),
(125, 'Liberia', 'LR'),
(126, 'Libya', 'LY'),
(127, 'Liechtenstein', 'LI'),
(128, 'Lithuania', 'LT'),
(129, 'Luxembourg', 'LU'),
(130, 'Macao', 'MO'),
(131, 'Macedonia', 'MK'),
(132, 'Madagascar', 'MG'),
(133, 'Malawi', 'MW'),
(134, 'Malaysia', 'MY'),
(135, 'Maldives', 'MV'),
(136, 'Mali', 'ML'),
(137, 'Malta', 'MT'),
(138, 'Marshall Islands', 'MH'),
(139, 'Martinique', 'MQ'),
(140, 'Mauritania', 'MR'),
(141, 'Mauritius', 'MU'),
(142, 'Mayotte', 'YT'),
(143, 'Mexico', 'MX'),
(144, 'Micronesia', 'FM'),
(145, 'Moldova', 'MD'),
(146, 'Monaco', 'MC'),
(147, 'Mongolia', 'MN'),
(148, 'Montenegro', 'ME'),
(149, 'Montserrat', 'MS'),
(150, 'Morocco', 'MA'),
(151, 'Mozambique', 'MZ'),
(152, 'Myanmar [Burma]', 'MM'),
(153, 'Namibia', 'NA'),
(154, 'Nauru', 'NR'),
(155, 'Nepal', 'NP'),
(156, 'Netherlands', 'NL'),
(157, 'New Caledonia', 'NC'),
(158, 'New Zealand', 'NZ'),
(159, 'Nicaragua', 'NI'),
(160, 'Niger', 'NE'),
(161, 'Nigeria', 'NG'),
(162, 'Niue', 'NU'),
(163, 'Norfolk Island', 'NF'),
(164, 'North Korea', 'KP'),
(165, 'Northern Mariana Islands', 'MP'),
(166, 'Norway', 'NO'),
(167, 'Oman', 'OM'),
(168, 'Pakistan', 'PK'),
(169, 'Palau', 'PW'),
(170, 'Palestine', 'PS'),
(171, 'Panama', 'PA'),
(172, 'Papua New Guinea', 'PG'),
(173, 'Paraguay', 'PY'),
(174, 'Peru', 'PE'),
(175, 'Philippines', 'PH'),
(176, 'Pitcairn Islands', 'PN'),
(177, 'Poland', 'PL'),
(178, 'Portugal', 'PT'),
(179, 'Puerto Rico', 'PR'),
(180, 'Qatar', 'QA'),
(181, 'Republic of the Congo', 'CG'),
(182, 'Réunion', 'RE'),
(183, 'Romania', 'RO'),
(184, 'Russia', 'RU'),
(185, 'Rwanda', 'RW'),
(186, 'Saint Barthélemy', 'BL'),
(187, 'Saint Helena', 'SH'),
(188, 'Saint Kitts and Nevis', 'KN'),
(189, 'Saint Lucia', 'LC'),
(190, 'Saint Martin', 'MF'),
(191, 'Saint Pierre and Miquelon', 'PM'),
(192, 'Saint Vincent and the Grenadines', 'VC'),
(193, 'Samoa', 'WS'),
(194, 'San Marino', 'SM'),
(195, 'São Tomé and Príncipe', 'ST'),
(196, 'Saudi Arabia', 'SA'),
(197, 'Senegal', 'SN'),
(198, 'Serbia', 'RS'),
(199, 'Seychelles', 'SC'),
(200, 'Sierra Leone', 'SL'),
(201, 'Singapore', 'SG'),
(202, 'Sint Maarten', 'SX'),
(203, 'Slovakia', 'SK'),
(204, 'Slovenia', 'SI'),
(205, 'Solomon Islands', 'SB'),
(206, 'Somalia', 'SO'),
(207, 'South Africa', 'ZA'),
(208, 'South Georgia and the South Sandwich Islands', 'GS'),
(209, 'South Korea', 'KR'),
(210, 'South Sudan', 'SS'),
(211, 'Spain', 'ES'),
(212, 'Sri Lanka', 'LK'),
(213, 'Sudan', 'SD'),
(214, 'Suriname', 'SR'),
(215, 'Svalbard and Jan Mayen', 'SJ'),
(216, 'Swaziland', 'SZ'),
(217, 'Sweden', 'SE'),
(218, 'Switzerland', 'CH'),
(219, 'Syria', 'SY'),
(220, 'Taiwan', 'TW'),
(221, 'Tajikistan', 'TJ'),
(222, 'Tanzania', 'TZ'),
(223, 'Thailand', 'TH'),
(224, 'Togo', 'TG'),
(225, 'Tokelau', 'TK'),
(226, 'Tonga', 'TO'),
(227, 'Trinidad and Tobago', 'TT'),
(228, 'Tunisia', 'TN'),
(229, 'Turkey', 'TR'),
(230, 'Turkmenistan', 'TM'),
(231, 'Turks and Caicos Islands', 'TC'),
(232, 'Tuvalu', 'TV'),
(233, 'U.S. Minor Outlying Islands', 'UM'),
(234, 'U.S. Virgin Islands', 'VI'),
(235, 'Uganda', 'UG'),
(236, 'Ukraine', 'UA'),
(237, 'United Arab Emirates', 'AE'),
(238, 'United Kingdom', 'GB'),
(239, 'United States', 'US'),
(240, 'Uruguay', 'UY'),
(241, 'Uzbekistan', 'UZ'),
(242, 'Vanuatu', 'VU'),
(243, 'Vatican City', 'VA'),
(244, 'Venezuela', 'VE'),
(245, 'Vietnam', 'VN'),
(246, 'Wallis and Futuna', 'WF'),
(247, 'Western Sahara', 'EH'),
(248, 'Yemen', 'YE'),
(249, 'Zambia', 'ZM'),
(250, 'Zimbabwe', 'ZW');

-- --------------------------------------------------------

--
-- Table structure for table `pm_coupon`
--

CREATE TABLE `pm_coupon` (
  `id` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `discount` double DEFAULT 0,
  `discount_type` varchar(10) DEFAULT NULL,
  `rooms` text DEFAULT NULL,
  `once` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT 0,
  `publish_date` int(11) DEFAULT NULL,
  `unpublish_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_coupon`
--

INSERT INTO `pm_coupon` (`id`, `title`, `code`, `discount`, `discount_type`, `rooms`, `once`, `checked`, `publish_date`, `unpublish_date`) VALUES
(1, 'Monsoon Discount ', 'monsoon24', 10, 'rate', '1,2,3', 0, 1, 1716355620, 1723697040);

-- --------------------------------------------------------

--
-- Table structure for table `pm_currency`
--

CREATE TABLE `pm_currency` (
  `id` int(11) NOT NULL,
  `code` varchar(5) DEFAULT NULL,
  `sign` varchar(5) DEFAULT NULL,
  `main` int(11) DEFAULT 0,
  `rank` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_currency`
--

INSERT INTO `pm_currency` (`id`, `code`, `sign`, `main`, `rank`) VALUES
(4, 'INR', '₹', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pm_email_content`
--

CREATE TABLE `pm_email_content` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_email_content`
--

INSERT INTO `pm_email_content` (`id`, `lang`, `name`, `subject`, `content`) VALUES
(1, 1, 'CONTACT', 'Contact', '<b>Nom:</b> {name}\r\n<b>Adresse:</b> {address}\r\n<b>Téléphone:</b> {phone}\r\n<b>E-mail:</b> {email}\r\n<b>Message:</b>\r\n{msg}'),
(1, 2, 'CONTACT', 'Contact', '<b>Name:</b> {name}<br>\r\n<b>Address:</b> {address}<br>\r\n<b>Phone:</b> {phone}<br>\r\n<b>E-mail:</b> {email}<br>\r\n<b>Message:</b><br>\r\n{msg}'),
(1, 3, 'CONTACT', 'Contact', '<b>Name:</b> {name}\r\n<b>Address:</b> {address}\r\n<b>Phone:</b> {phone}\r\n<b>E-mail:</b> {email}\r\n<b>Message:</b>\r\n{msg}'),
(2, 1, 'BOOKING_REQUEST', 'Demande de réservation', '<p><b>Adresse de facturation</b><br />\r\n{firstname} {lastname}<br />\r\n{address}<br />\r\n{postcode} {city}<br />\r\nSociété : {company}<br />\r\nTéléphone : {phone}<br />\r\nMobile : {mobile}<br />\r\nEmail : {email}</p>\r\n\r\n<p><strong>Détails de la réservation</strong><br />\r\nArrivée : <b>{Check_in}</b><br />\r\nDépart : <b>{Check_out}</b><br />\r\n<b>{num_nights}</b> nuit(s)<br />\r\n<b>{num_guests}</b> personne(s) - Adulte(s) : <b>{num_adults}</b> / Enfant(s) : <b>{num_children}</b></p>\r\n\r\n<p><b>Chambres</b></p>\r\n\r\n<p>{rooms}</p>\r\n\r\n<p><b>Services supplémentaires</b></p>\r\n\r\n<p>{extra_services}</p>\r\n\r\n<p><b>Activités</b></p>\r\n\r\n<p>{activities}</p>\r\n\r\n<p><b>Commentaires</b><br />\r\n{comments}</p>\r\n'),
(2, 2, 'BOOKING_REQUEST', 'Booking request', '<p><b>Billing address</b><br />\r\n{firstname} {lastname}<br />\r\n{address}<br />\r\n{postcode} {city}<br />\r\nCompany: {company}<br />\r\nPhone: {phone}<br />\r\nMobile: {mobile}<br />\r\nEmail: {email}</p>\r\n\r\n<p><strong>Booking details</strong><br />\r\nCheck in <b>{Check_in}</b><br />\r\nCheck out <b>{Check_out}</b><br />\r\n<b>{num_nights}</b> nights<br />\r\n<b>{num_guests}</b> persons - Adults: <b>{num_adults}</b> / Children: <b>{num_children}</b></p>\r\n\r\n<p><strong>Rooms</strong></p>\r\n\r\n<p>{rooms}</p>\r\n\r\n<p><b>Extra services</b></p>\r\n\r\n<p>{extra_services}</p>\r\n\r\n<p><b>Activities</b></p>\r\n\r\n<p>{activities}</p>\r\n\r\n<p><b>Comments</b><br />\r\n{comments}</p>\r\n'),
(2, 3, 'BOOKING_REQUEST', 'Booking request', '<p><b>Billing address</b><br />\r\n{firstname} {lastname}<br />\r\n{address}<br />\r\n{postcode} {city}<br />\r\nCompany: {company}<br />\r\nPhone: {phone}<br />\r\nMobile: {mobile}<br />\r\nEmail: {email}</p>\r\n\r\n<p><strong>Booking details</strong><br />\r\nCheck in <b>{Check_in}</b><br />\r\nCheck out <b>{Check_out}</b><br />\r\n<b>{num_nights}</b> nights<br />\r\n<b>{num_guests}</b> persons - Adults: <b>{num_adults}</b> / Children: <b>{num_children}</b></p>\r\n\r\n<p><strong>Rooms</strong></p>\r\n\r\n<p>{rooms}</p>\r\n\r\n<p><b>Extra services</b></p>\r\n\r\n<p>{extra_services}</p>\r\n\r\n<p><b>Activities</b></p>\r\n\r\n<p>{activities}</p>\r\n\r\n<p><b>Comments</b><br />\r\n{comments}</p>\r\n'),
(3, 1, 'BOOKING_CONFIRMATION', 'Confirmation de réservation', '<p><b>Adresse de facturation</b><br />\r\n{firstname} {lastname}<br />\r\n{address}<br />\r\n{postcode} {city}<br />\r\nSociété : {company}<br />\r\nTéléphone : {phone}<br />\r\nMobile : {mobile}<br />\r\nEmail : {email}</p>\r\n\r\n<p><strong>Détails de la réservation</strong><br />\r\nArrivée : <b>{Check_in}</b><br />\r\nDépart : <b>{Check_out}</b><br />\r\n<b>{num_nights}</b> nuit(s)<br />\r\n<b>{num_guests}</b> personne(s) - Adulte(s) : <b>{num_adults}</b> / Enfant(s) : <b>{num_children}</b></p>\r\n\r\n<p><b>Chambres</b></p>\r\n\r\n<p>{rooms}</p>\r\n\r\n<p><b>Services supplémentaires</b></p>\r\n\r\n<p>{extra_services}</p>\r\n\r\n<p><b>Activités</b></p>\r\n\r\n<p>{activities}</p>\r\n\r\n<p>Taxe de séjour : {tourist_tax}<br />\r\nRéduction: {discount}<br />\r\n{taxes}<br />\r\nTotal : <strong>{total} TTC</strong></p>\r\n\r\n<p>Acompte : <strong>{down_payment} TTC</strong></p>\r\n\r\n<p><b>Commentaires</b><br />\r\n{comments}</p>\r\n\r\n<p>{payment_notice}</p>\r\n'),
(3, 2, 'BOOKING_CONFIRMATION', 'Booking confirmation', '<p><strong>Billing address</strong><br>{firstname} {lastname}<br>{address}<br>{postcode} {city}<br>Company: {company}<br>Phone: {phone}<br>Mobile: {mobile}<br>Email: {email}</p><p><strong>Booking details</strong><br>Check in <strong>{Check_in}</strong><br>Check out <strong>{Check_out}</strong><br><strong>{num_nights}</strong> nights<br><strong>{num_guests}</strong> persons - Adults: <strong>{num_adults}</strong> / Children: <strong>{num_children}</strong></p><p><strong>Rooms</strong></p><p>{rooms}</p><p><strong>Extra services</strong></p><p>{extra_services}</p><p><strong>Activities</strong></p><p>{activities}</p><p>Tourist tax: {tourist_tax}<br>Discount: {discount}<br>{taxes}<br>Total: <strong>{total} incl. GST</strong></p><p>Down payment: <strong>{down_payment} incl. GST</strong></p><p><strong>Comments</strong><br>{comments}</p><p>{payment_notice}</p>'),
(3, 3, 'BOOKING_CONFIRMATION', 'Booking confirmation', '<p><b>Billing address</b><br />\r\n{firstname} {lastname}<br />\r\n{address}<br />\r\n{postcode} {city}<br />\r\nCompany: {company}<br />\r\nPhone: {phone}<br />\r\nMobile: {mobile}<br />\r\nEmail: {email}</p>\r\n\r\n<p><strong>Booking details</strong><br />\r\nCheck in <b>{Check_in}</b><br />\r\nCheck out <b>{Check_out}</b><br />\r\n<b>{num_nights}</b> nights<br />\r\n<b>{num_guests}</b> persons - Adults: <b>{num_adults}</b> / Children: <b>{num_children}</b></p>\r\n\r\n<p><strong>Rooms</strong></p>\r\n\r\n<p>{rooms}</p>\r\n\r\n<p><b>Extra services</b></p>\r\n\r\n<p>{extra_services}</p>\r\n\r\n<p><b>Activities</b></p>\r\n\r\n<p>{activities}</p>\r\n\r\n<p>Tourist tax: {tourist_tax}<br />\r\nDiscount: {discount}<br />\r\n{taxes}<br />\r\nTotal: <strong>{total} incl. VAT</strong></p>\r\n\r\n<p>Down payment: <strong>{down_payment} incl. VAT</strong></p>\r\n\r\n<p><b>Comments</b><br />\r\n{comments}</p>\r\n\r\n<p>{payment_notice}</p>\r\n'),
(4, 1, 'ACCOUNT_CONFIRMATION', 'Confirmation du compte', '<p>Bonjour,<br />\r\nVous avez cr&eacute;&eacute; un nouveau compte.<br />\r\nCliquez sur le lien ci-dessous pour valider votre compte:<br />\r\n<a href=\"{link}\">Valider mon compte</a></p>\r\n'),
(4, 2, 'ACCOUNT_CONFIRMATION', 'Validate your account', '<p>Hi,<br />\r\nYou created a new account.<br />\r\nClick on the link bellow to validate your account:<br />\r\n<a href=\"{link}\">Validate my new account</a></p>\r\n'),
(4, 3, 'ACCOUNT_CONFIRMATION', 'Validate your account', '<p>Hi,<br />\r\nYou created a new account.<br />\r\nClick on the link bellow to validate your account:<br />\r\n<a href=\"{link}\">Validate my new account</a></p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `pm_facility`
--

CREATE TABLE `pm_facility` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `rank` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_facility`
--

INSERT INTO `pm_facility` (`id`, `lang`, `name`, `rank`) VALUES
(1, 1, 'Climatisation', 1),
(1, 2, 'Air conditioning', 1),
(2, 1, 'Lit bébé', 2),
(2, 2, 'Baby cot', 0),
(3, 1, 'Balcon', 3),
(3, 2, 'Balcony', 3),
(4, 1, 'Barbecue', 4),
(4, 2, 'Barbecue', 4),
(5, 1, 'Salle de bain', 5),
(5, 2, 'Bathroom', 0),
(6, 1, 'Cafetière', 6),
(6, 2, 'Coffeemaker', 6),
(7, 1, 'Plaque de cuisson', 7),
(7, 2, 'Cooktop', 7),
(8, 1, 'Bureau', 8),
(8, 2, 'Desk', 0),
(9, 1, 'Lave vaisselle', 9),
(9, 2, 'Dishwasher', 0),
(10, 1, 'Ventilateur', 10),
(10, 2, 'Fan', 10),
(11, 1, 'Parking gratuit', 11),
(11, 2, 'Free parking', 11),
(12, 1, 'Réfrigérateur', 12),
(12, 2, 'Fridge', 12),
(13, 1, 'Sèche-cheveux', 13),
(13, 2, 'Hairdryer', 0),
(14, 1, 'Internet', 14),
(14, 2, 'Internet', 14),
(15, 1, 'Fer à repasser', 15),
(15, 2, 'Iron', 0),
(16, 1, 'Micro-ondes', 16),
(16, 2, 'Microwave', 16),
(17, 1, 'Mini-bar', 17),
(17, 2, 'Mini-bar', 17),
(18, 1, 'Non-fumeurs', 18),
(18, 2, 'Non-smoking', 18),
(19, 1, 'Parking payant', 19),
(19, 2, 'Paid parking', 19),
(20, 1, 'Animaux acceptés', 20),
(20, 2, 'Pets allowed', 20),
(21, 1, 'Animaux interdits', 21),
(21, 2, 'Pets not allowed', 21),
(22, 1, 'Radio', 22),
(22, 2, 'Radio', 22),
(23, 1, 'Coffre-fort', 23),
(23, 2, 'Safe', 23),
(24, 1, 'Chaines satellite', 24),
(24, 2, 'Satellite chanels', 24),
(25, 1, 'Salle d\'eau', 25),
(25, 2, 'Shower-room', 25),
(26, 1, 'Coin salon', 26),
(26, 2, 'Small lounge', 26),
(27, 1, 'Telephone', 27),
(27, 2, 'Telephone', 27),
(28, 1, 'Téléviseur', 28),
(28, 2, 'Television', 28),
(29, 1, 'Terrasse', 29),
(29, 2, 'Terrasse', 29),
(30, 1, 'Machine à laver', 30),
(30, 2, 'Washing machine', 30),
(31, 1, 'Accès handicapés', 31),
(31, 2, 'Wheelchair accessible', 31),
(32, 1, 'Wi-Fi', 31),
(32, 2, 'WiFi', 31),
(33, 1, 'Chaine hifi', 32),
(33, 2, 'Hi-fi system', 32),
(34, 1, 'Lecteur DVD', 33),
(34, 2, 'DVD player', 33),
(35, 1, 'Ascenceur', 34),
(35, 2, 'Elevator', 34),
(36, 1, 'Coin salon', 35),
(36, 2, 'Lounge', 35),
(37, 1, 'Restaurant', 36),
(37, 2, 'Restaurant', 36),
(38, 1, 'Service de chambre', 37),
(38, 2, 'Room service', 37),
(39, 1, 'Vestiaire', 38),
(39, 2, 'Cloakroom', 38);

-- --------------------------------------------------------

--
-- Table structure for table `pm_facility_file`
--

CREATE TABLE `pm_facility_file` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT 0,
  `checked` int(11) DEFAULT 1,
  `rank` int(11) DEFAULT 0,
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_facility_file`
--

INSERT INTO `pm_facility_file` (`id`, `lang`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(1, 2, 31, 0, 2, 1, 'wheelchair.png', '', 'image'),
(2, 2, 20, 0, 1, 2, 'pet-allowed.png', '', 'image'),
(3, 2, 21, 0, 1, 3, 'pet-not-allowed.png', '', 'image'),
(4, 2, 3, 0, 2, 1, 'balcony.png', '', 'image'),
(5, 2, 4, 0, 1, 5, 'barbecue.png', '', 'image'),
(6, 2, 8, 0, 1, 1, 'desk.png', '', 'image'),
(7, 2, 6, 0, 1, 7, 'coffee.png', '', 'image'),
(8, 2, 24, 0, 1, 8, 'satellite.png', '', 'image'),
(9, 2, 1, 0, 2, 1, 'air-conditioning.png', '', 'image'),
(10, 2, 23, 0, 1, 10, 'safe.png', '', 'image'),
(11, 2, 26, 0, 1, 11, 'lounge.png', '', 'image'),
(12, 2, 15, 0, 1, 1, 'iron.png', '', 'image'),
(13, 2, 14, 0, 1, 13, 'adsl.png', '', 'image'),
(14, 2, 9, 0, 1, 14, 'dishwasher.png', '', 'image'),
(15, 2, 2, 0, 1, 15, 'baby-cot.png', '', 'image'),
(16, 2, 30, 0, 1, 16, 'washing-machine.png', '', 'image'),
(17, 2, 16, 0, 1, 17, 'microwaves.png', '', 'image'),
(18, 2, 17, 0, 1, 18, 'mini-bar.png', '', 'image'),
(19, 2, 18, 0, 2, 1, 'non-smoking.png', '', 'image'),
(20, 2, 11, 0, 1, 20, 'free-parking.png', '', 'image'),
(21, 2, 19, 0, 1, 21, 'paid-parking.png', '', 'image'),
(22, 2, 7, 0, 1, 22, 'cooktop.png', '', 'image'),
(23, 2, 22, 0, 1, 23, 'radio.png', '', 'image'),
(24, 2, 12, 0, 1, 24, 'fridge.png', '', 'image'),
(25, 2, 25, 0, 1, 25, 'shower.png', '', 'image'),
(26, 2, 5, 0, 2, 1, 'bath.png', '', 'image'),
(27, 2, 13, 0, 1, 1, 'hairdryer.png', '', 'image'),
(28, 2, 27, 0, 1, 28, 'phone.png', '', 'image'),
(29, 2, 28, 0, 1, 29, 'tv.png', '', 'image'),
(30, 2, 29, 0, 1, 30, 'terrasse.png', '', 'image'),
(31, 2, 10, 0, 1, 31, 'fan.png', '', 'image'),
(32, 2, 32, 0, 1, 32, 'wifi.png', '', 'image'),
(33, 2, 33, 0, 1, 33, 'hifi.png', '', 'image'),
(34, 2, 34, 0, 1, 34, 'dvd.png', '', 'image'),
(35, 2, 33, 0, 1, 33, 'elevator.png', '', 'image'),
(36, 2, 33, 0, 1, 33, 'lounge.png', '', 'image'),
(37, 2, 33, 0, 1, 33, 'restaurant.png', '', 'image'),
(38, 2, 33, 0, 1, 33, 'room-service.png', '', 'image'),
(39, 2, 33, 0, 1, 33, 'cloakroom.png', '', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_ical_event`
--

CREATE TABLE `pm_ical_event` (
  `id` int(11) NOT NULL,
  `id_room` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `sync_date` int(11) DEFAULT NULL,
  `from_date` int(11) DEFAULT NULL,
  `to_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pm_lang`
--

CREATE TABLE `pm_lang` (
  `id` int(11) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `locale` varchar(20) DEFAULT NULL,
  `main` int(11) DEFAULT 0,
  `checked` int(11) DEFAULT 0,
  `rank` int(11) DEFAULT 0,
  `tag` varchar(20) DEFAULT NULL,
  `rtl` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_lang`
--

INSERT INTO `pm_lang` (`id`, `title`, `locale`, `main`, `checked`, `rank`, `tag`, `rtl`) VALUES
(1, 'Français', 'fr_FR', 0, 2, 2, 'fr', 0),
(2, 'English', 'en_GB', 1, 1, 1, 'en', 0),
(3, 'عربي', 'ar_MA', 0, 2, 3, 'ar', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pm_lang_file`
--

CREATE TABLE `pm_lang_file` (
  `id` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT 0,
  `checked` int(11) DEFAULT 1,
  `rank` int(11) DEFAULT 0,
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_lang_file`
--

INSERT INTO `pm_lang_file` (`id`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(1, 1, 0, 1, 2, 'fr.png', '', 'image'),
(2, 2, 0, 1, 1, 'gb.png', '', 'image'),
(3, 3, 0, 1, 3, 'ar.png', '', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_location`
--

CREATE TABLE `pm_location` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `checked` int(11) DEFAULT 0,
  `pages` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_location`
--

INSERT INTO `pm_location` (`id`, `name`, `address`, `lat`, `lng`, `checked`, `pages`) VALUES
(1, 'JPS Residency & Hospitality Services', '446 E, Sector 8, Imt Manesar, Gurugram, Haryana 122050', 28.382507583544744, 76.89015083494394, 1, '2');

-- --------------------------------------------------------

--
-- Table structure for table `pm_media`
--

CREATE TABLE `pm_media` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_media`
--

INSERT INTO `pm_media` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13);

-- --------------------------------------------------------

--
-- Table structure for table `pm_media_file`
--

CREATE TABLE `pm_media_file` (
  `id` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT 0,
  `checked` int(11) DEFAULT 1,
  `rank` int(11) DEFAULT 0,
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_media_file`
--

INSERT INTO `pm_media_file` (`id`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(1, 1, 0, 1, 1, 'banner1.jpg', NULL, 'image'),
(2, 2, 0, 1, 2, 'banner2.jpg', NULL, 'image'),
(3, 3, 0, 1, 3, '7.jpg', NULL, 'image'),
(4, 4, 0, 1, 4, '6.jpg', NULL, 'image'),
(5, 5, 0, 1, 5, 'bar.jpg', NULL, 'image'),
(6, 6, 0, 1, 1, 'logohotel.png', NULL, 'image'),
(7, 7, 0, 1, 7, 'ds2.jpg', NULL, 'image'),
(8, 8, 0, 1, 8, 'meetings-at-jps-residency.png', NULL, 'image'),
(9, 9, 0, 1, 9, 'birthday-party-at-jps.png', NULL, 'image'),
(10, 10, 0, 1, 10, 'kitty-party.png', NULL, 'image'),
(11, 11, 0, 1, 11, 'screenshot-2024-05-28-120407.png', NULL, 'image'),
(12, 12, 0, 1, 12, 'google-removebg-preview.png', NULL, 'image'),
(13, 13, 0, 1, 13, 'weeding.png', NULL, 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_menu`
--

CREATE TABLE `pm_menu` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `id_parent` int(11) DEFAULT NULL,
  `item_type` varchar(30) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `main` int(11) DEFAULT 1,
  `footer` int(11) DEFAULT 0,
  `checked` int(11) DEFAULT 0,
  `rank` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_menu`
--

INSERT INTO `pm_menu` (`id`, `lang`, `name`, `title`, `id_parent`, `item_type`, `id_item`, `url`, `main`, `footer`, `checked`, `rank`) VALUES
(1, 1, 'Accueil', 'Panda Resort, Hotel de luxe', NULL, 'page', 1, NULL, 1, 0, 1, 1),
(1, 2, 'Home', 'Panda Resort, Luxury Hotel', NULL, 'page', 1, NULL, 1, 0, 1, 1),
(1, 3, 'ترحيب', 'هو سقطت الساحلية ذات, أن.', NULL, 'page', 1, NULL, 1, 0, 1, 1),
(2, 1, 'Contact', 'Contact', NULL, 'page', 2, NULL, 1, 1, 1, 9),
(2, 2, 'Contact', 'Contact', NULL, 'page', 2, NULL, 1, 1, 1, 9),
(2, 3, 'جهة الاتصال', 'جهة الاتصال', NULL, 'page', 2, NULL, 1, 1, 1, 9),
(3, 1, 'Mentions légales', 'Mentions légales', NULL, 'page', 3, NULL, 0, 1, 1, 10),
(3, 2, 'Legal notices', 'Legal notices', NULL, 'page', 3, NULL, 0, 1, 1, 10),
(3, 3, 'يذكر القانونية', 'يذكر القانونية', NULL, 'page', 3, NULL, 0, 1, 1, 10),
(4, 1, 'Plan du site', 'Plan du site', NULL, 'page', 4, NULL, 0, 1, 1, 11),
(4, 2, 'Sitemap', 'Sitemap', NULL, 'page', 4, NULL, 0, 1, 1, 11),
(4, 3, 'خريطة الموقع', 'خريطة الموقع', NULL, 'page', 4, NULL, 0, 1, 1, 11),
(5, 1, 'Hôtel', 'Hôtel', NULL, 'page', 5, NULL, 1, 0, 2, 8),
(5, 2, 'Hotel', 'Hotel', NULL, 'page', 5, NULL, 1, 0, 2, 8),
(5, 3, 'فندق', 'فندق', NULL, 'page', 5, NULL, 1, 0, 2, 8),
(7, 1, 'Galerie', 'Galerie', NULL, 'page', 7, NULL, 1, 0, 1, 6),
(7, 2, 'Gallery', 'Gallery', NULL, 'page', 7, NULL, 1, 0, 1, 6),
(7, 3, 'معرض الصور', 'معرض الصور', NULL, 'page', 7, NULL, 1, 0, 1, 6),
(9, 1, 'Chambres', 'Chambres', NULL, 'page', 9, NULL, 1, 0, 2, 5),
(9, 2, 'Rooms', 'Rooms', NULL, 'page', 9, NULL, 1, 0, 2, 5),
(9, 3, 'الغرف', 'الغرف', NULL, 'page', 9, NULL, 1, 0, 2, 5),
(10, 1, 'Réserver', 'Réserver', NULL, 'page', 10, NULL, 1, 0, 1, 2),
(10, 2, 'Booking', 'Booking', NULL, 'page', 10, NULL, 1, 0, 1, 2),
(10, 3, 'الحجز', 'الحجز', NULL, 'page', 10, NULL, 1, 0, 1, 2),
(16, 1, 'Activités', 'Activités', NULL, 'page', 16, NULL, 1, 0, 1, 7),
(16, 2, 'Menu', 'Menu', NULL, 'url', 16, 'https://www.jpsresidency.in/jpsmenu.pdf', 1, 0, 1, 7),
(16, 3, 'Activities', 'Activities', NULL, 'page', 16, NULL, 1, 0, 1, 7),
(17, 2, 'Destination Wedding', '', 1, 'article', 7, 'https://www.jpsresidency.in/hotel/dwatjps-gurugram', 1, 0, 1, 3),
(19, 2, 'Event', '', 1, 'page', 19, '', 1, 0, 1, 4),
(20, 2, 'Meetings at JPS Residency', '', 19, 'page', 20, 'https://www.jpsresidency.in/event-jps', 1, 0, 1, 12),
(21, 2, 'MEETINGS AT JPS RESIDENCY', 'MEETINGS AT JPS RESIDENCY', 19, 'article', 16, 'https://www.jpsresidency.in/event-jps/meetings-at-jps-residency', 1, 0, 2, 13),
(22, 2, 'Kitty Party', 'Kitty-Party', 19, 'article', 17, 'https://www.jpsresidency.in/event-jps', 1, 0, 2, 14),
(23, 2, 'Birthday Party', '', 19, 'article', 18, 'https://www.jpsresidency.in/event-jps', 1, 0, 2, 15),
(24, 2, 'Birthday Party', 'Birthday Party', 19, 'page', 21, 'https://www.jpsresidency.in/event-jps', 1, 0, 1, 16),
(25, 2, 'Kitty Party', 'Kitty Party', 19, 'page', 22, 'https://www.jpsresidency.in/event-jps', 1, 0, 1, 17);

-- --------------------------------------------------------

--
-- Table structure for table `pm_message`
--

CREATE TABLE `pm_message` (
  `id` int(11) NOT NULL,
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `msg` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_message`
--

INSERT INTO `pm_message` (`id`, `add_date`, `edit_date`, `name`, `email`, `address`, `phone`, `subject`, `msg`) VALUES
(17, 1716230049, NULL, 'Mike Kendal\r\n', 'mikeGoldVofe@gmail.com', 'https://jpsresidency.in', '84765443444', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.org/affiliate-dashboard/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Kendal\r\n \r\nMonkey Digital'),
(18, 1716253782, NULL, 'AmeliaWena', 'daysleseec@gmail.com', '', '89849843821', 'अरे तुम, खिलवाड़ को आदी लग रहा है?', 'अरे, एक मोमबत्ती की रोशनी बुलबुला स्नान के लिए मेरे साथ शामिल होने के लिए परवाह है? -  https://u.to/NsOtIA?ot'),
(19, 1716253945, NULL, 'Art Blazer', 'blazer.art@gmail.com', 'Hello\r\n\r\nAre you ready to turn your dream into reality? \r\n\r\nWith this system, you can build a profitable online business and live life on your own terms. \r\n\r\nFind out how you can do this by clicking on => https://cutt.ly/hwI9GAJK\r\n\r\nRegards\r\nArt\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nAustria, BURGENLAND, Goisern, 4822, Sternhofweg 23\r\nTo stop any further communication from us, please reply to this email...', '', 'Unlock Your Potential: Building a Lucrative Online Business on Your Own Terms', 'Good day\r\n\r\nAre you ready to turn your dream into reality? \r\n\r\nWith this system, you can build a profitable online business and live life on your own terms. \r\n\r\nFind out how you can do this by clicking on => https://cutt.ly/hwI9GAJK\r\n\r\nYours truly\r\nArt\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nAustria, BURGENLAND, Goisern, 4822, Sternhofweg 23\r\nTo stop any further communication from us, please reply to this email...'),
(20, 1716261679, NULL, 'Edwardo Butt', 'edwardo.butt@outlook.com', 'Hi\r\n\r\nHold on tight! A seismic shift is about to hit the scene.\r\n\r\nYou have the chance to uncover the incredible secret hidden within Jeff Bezos Amazon empire – a secret that offers you an endless stream of free traffic and overwhelms you with amazing Amazon commissions!\r\n\r\nWHY EXPERTS LOVE AMZ AUTOMATOR:\r\n[+] Free Traffic: An untapped traffic source from Amazon Prime.\r\n[+] Huge Commissions: Up to $293.47 per day just by watching videos.\r\n[+] Maximum Efficiency: No tedious and expensive setups.\r\n\r\nWHAT PROFESSIONALS ARE SAYING:\r\n[Edwardo] \"AMZ AUTOMATOR has completely transformed the way I earn Amazon commissions. It’s simply revolutionary!\"\r\n\r\nDon’t miss this unique opportunity:\r\nTime is of the essence! This Amazon Prime secret won’t be available for long.\r\n\r\nCLICK HERE TO START =>> https://cutt.ly/Yer8QDT8\r\n\r\nDon’t let this chance slip by. Secure your spot among those who take advantage of this rare opportunity!\r\n\r\nThank you\r\nEdwardo\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nNetherlands, LI, Venray, 5801 Rl, Blauwververstraat 182\r\nTo stop any further communication from us, please reply to this email...', '626794342', 'Discover Jeff Bezos Amazon Prime Secret and Earn $293 a Day!', 'Hello\r\n\r\nHold on tight! A seismic shift is about to hit the scene.\r\n\r\nYou have the chance to uncover the incredible secret hidden within Jeff Bezos Amazon empire – a secret that offers you an endless stream of free traffic and overwhelms you with amazing Amazon commissions!\r\n\r\nWHY EXPERTS LOVE AMZ AUTOMATOR:\r\n[+] Free Traffic: An untapped traffic source from Amazon Prime.\r\n[+] Huge Commissions: Up to $293.47 per day just by watching videos.\r\n[+] Maximum Efficiency: No tedious and expensive setups.\r\n\r\nWHAT PROFESSIONALS ARE SAYING:\r\n[Edwardo] \"AMZ AUTOMATOR has completely transformed the way I earn Amazon commissions. It’s simply revolutionary!\"\r\n\r\nDon’t miss this unique opportunity:\r\nTime is of the essence! This Amazon Prime secret won’t be available for long.\r\n\r\nCLICK HERE TO START =>> https://cutt.ly/Yer8QDT8\r\n\r\nDon’t let this chance slip by. Secure your spot among those who take advantage of this rare opportunity!\r\n\r\nThank you\r\nEdwardo\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nNetherlands, LI, Venray, 5801 Rl, Blauwververstraat 182\r\nTo stop any further communication from us, please reply to this email...'),
(21, 1716295217, NULL, 'Mike Donaldson\r\n', 'peterhauddy@gmail.com', 'https://no-site.com', '88892477693', 'Whitehat SEO for jpsresidency.in', 'Hi \r\n \r\nI have just took an in depth look on your  jpsresidency.in for its SEO metrics and saw that your website could use a boost. \r\n \r\nWe will enhance your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\n \r\nRegards \r\nMike Donaldson\r\n \r\nDigital X SEO Experts'),
(22, 1716306021, NULL, 'Mauricio Soutter', 'mauricio.soutter@msn.com', 'Online Social Media Jobs That Pay $25 - $50 Per Hour. No Experience Required. Work At Home.\r\n\r\nSocial Media Jobs from the comfort of home!\r\n\r\nClick On Link Below\r\n\r\nMore Info --->  https://cashonsocial.com', '129557778', 'Work from home social media jobs', 'Online Social Media Jobs That Pay $25 - $50 Per Hour. No Experience Required. Work At Home.\r\n\r\nSocial Media Jobs from the comfort of home!\r\n\r\nClick On Link Below\r\n\r\nMore Info --->  https://cashonsocial.com'),
(23, 1716362924, 1716363620, 'saniya', 'sksaniya028@gmail.com', 'imt manesar gurgram', '8126937491', 'wedding event', 'hy'),
(24, 1716396876, NULL, 'Deepu', 'businessprocessoutsourcing1@outlook.com', 'I\'m Deepu. a remote Video Producer and Video Editor. My expertise is to create new promotional videos and reels, Making edits in existing videos, Making small clips out of longer videos, Creating video scripts and voiceovers. If you need any videos for your social media channels/websites/corporate events/product promotion/service promotion, then, you are at the right place. Softwares used by me are Premiere Pro, After Effects and DaVinchi Resolve. \r\n\r\nFeel free to reach out to me at Businessprocessoutsourcing1@outlook.com.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '7836792763', 'Video Editing', 'I\'m Deepu. a remote Video Producer and Video Editor. My expertise is to create new promotional videos and reels, Making edits in existing videos, Making small clips out of longer videos, Creating video scripts and voiceovers. If you need any videos for your social media channels/websites/corporate events/product promotion/service promotion, then, you are at the right place. Softwares used by me are Premiere Pro, After Effects and DaVinchi Resolve. \r\n\r\nFeel free to reach out to me at Businessprocessoutsourcing1@outlook.com.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(25, 1716412779, NULL, 'Dir. Chang', 'chihc420@gmail.com', 'http://www.no-sites.com', '83814243769', 'Investment Proposal', 'Greetings, \r\n \r\nI am reaching out to propose a lucrative investment opportunity that I believe you will find intriguing. If you are interested in learning more, please reply, and I will gladly share the details with you. Kindly respond directly to this email for more information: dirchang@iei5h.com \r\n \r\nWarm regards, \r\nDir. Chang \r\n \r\nContact: dirchang@iei5h.com'),
(26, 1716416057, NULL, 'Emily Jones', 'emilyjones2250@gmail.com', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\nWe go beyond just subscriber numbers. We focus on attracting viewers genuinely interested in your niche, leading to long-term engagement with your content. Our approach leverages optimization, community building, and content promotion for sustainable growth, not quick fixes. Additionally, a dedicated team analyzes your channel and creates a personalized plan to unlock your full potential, all without relying on bots.\r\n\r\nOur packages start from just $60 (USD) per month.\r\n\r\nWould this be of interest?\r\n\r\nKind Regards,\r\nEmily', '3159010742', 'Youtube Promotion: 700 new subscribers each month', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nEmily'),
(27, 1716494418, NULL, 'AmeliaWenb', 'dayslesee3@gmail.com', '', '83442534725', 'अरे तुम, खिलवाड़ को आदी लग रहा है?', 'अरे, एक मोमबत्ती की रोशनी बुलबुला स्नान के लिए मेरे साथ शामिल होने के लिए परवाह है? -  https://rb.gy/7xb976?ot'),
(28, 1716501798, NULL, 'Dulcie Guest', 'dulcie.guest@googlemail.com', 'Unlimited FREE Buyer Traffic On Autopilot\r\n\r\nFully-automated software for SET & FORGET traffic 24/7\r\n\r\n\r\nUltra-fast SAME DAY results\r\n\r\n\r\n100% free traffic and it always will be\r\n\r\nClick on link ----> http://instantrealtraffic.com\r\n', '8104049109', 'Do​ ​You​ ​want​ ​FREE​ ​TARGETED​​​ ​Traffic?', 'Unlimited FREE Buyer Traffic On Autopilot\r\n\r\nFully-automated software for SET & FORGET traffic 24/7\r\n\r\n\r\nUltra-fast SAME DAY results\r\n\r\n\r\n100% free traffic and it always will be\r\n\r\nClick on link ----> http://instantrealtraffic.com\r\n'),
(30, 1716603270, NULL, 'Aisha Wilkes', 'aisha.wilkes@msn.com', 'Good day\r\n\r\nPrepare yourself! A monumental shift is here.\r\n\r\nUncover the incredible secret within Jeff Bezos\' Amazon empire – a secret that delivers endless free traffic and outstanding Amazon commissions!\r\n\r\nWHY AMZ AUTOMATOR STANDS OUT:\r\n[+] Endless Traffic: Access a hidden traffic source from Amazon Prime.\r\n[+] High Commissions: Make up to $293.47 daily with ease.\r\n[+] Simple and Efficient: No complicated or expensive setups required.\r\n\r\nWHAT OTHERS ARE SAYING:\r\n[Aisha] \"AMZ AUTOMATOR has revolutionized my income from Amazon commissions. It\'s phenomenal!\"\r\n\r\nACT NOW – THIS SECRET IS FLEETING:\r\nThis exclusive Amazon Prime secret is time-sensitive. Don\'t wait!\r\n\r\nCLICK HERE TO BEGIN =>>  https://cutt.ly/cetnxSvC\r\n\r\nDon\'t let this opportunity pass. Join the ranks of the successful today!\r\n\r\nYours truly\r\nAisha\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nFrance, AQUITAINE, Bayonne, 64100, 82 Rue Du Limas\r\nTo stop any further communication from us, please reply to this email...', '544436373', 'Reveal Jeff Bezos\' Secret and Earn $293 Daily with Amazon Prime...', 'Good day\r\n\r\nPrepare yourself! A monumental shift is here.\r\n\r\nUncover the incredible secret within Jeff Bezos\' Amazon empire – a secret that delivers endless free traffic and outstanding Amazon commissions!\r\n\r\nWHY AMZ AUTOMATOR STANDS OUT:\r\n[+] Endless Traffic: Access a hidden traffic source from Amazon Prime.\r\n[+] High Commissions: Make up to $293.47 daily with ease.\r\n[+] Simple and Efficient: No complicated or expensive setups required.\r\n\r\nWHAT OTHERS ARE SAYING:\r\n[Aisha] \"AMZ AUTOMATOR has revolutionized my income from Amazon commissions. It\'s phenomenal!\"\r\n\r\nACT NOW – THIS SECRET IS FLEETING:\r\nThis exclusive Amazon Prime secret is time-sensitive. Don\'t wait!\r\n\r\nCLICK HERE TO BEGIN =>>  https://cutt.ly/cetnxSvC\r\n\r\nDon\'t let this opportunity pass. Join the ranks of the successful today!\r\n\r\nWarm regards\r\nAisha\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nFrance, AQUITAINE, Bayonne, 64100, 82 Rue Du Limas\r\nTo stop any further communication from us, please reply to this email...'),
(31, 1716757183, NULL, 'Emery Francis', 'francis.emery@msn.com', 'Website Messaging Service\r\n\r\nOur Methodology:\r\n\r\nTargeting: We find relevant websites and companies that fit your target demographic.\r\nMessage Sending: We deliver well-crafted messages using the contact forms of these websites.\r\nOptimization: We fine-tune the messages to comply with best practices and improve the likelihood of a reply.\r\nFeedback: You receive regular reports on the messages sent and any responses received.\r\n\r\nBenefits:\r\n\r\nFocused Outreach: Direct contact with potential customers within your target audience.\r\nEfficient: Saves you the hassle of looking for contact info and drafting messages.\r\nBudget-Friendly: A cost-efficient method to broaden your reach without a hefty marketing budget.\r\n\r\nWhy Choose Us:\r\n\r\nWe possess expertise in creating and handling successful contact marketing campaigns. Our team customizes each message to suit your particular requirements. We believe in a personal approach and strive to help you achieve your business goals.\r\n\r\nDon\'t hesitate to get in touch with us on Telegram t.me/Contactwebsitemarketing \r\nOr if you don\'t feel comfortable with clicking links in emails, \r\nyou can also look me up on Telegram @Contactwebsitemarketing \r\n\r\nWe wish you a very nice day!\r\n\r\nGreetings \r\nTeam Contact Website Marketing.', '3203453683', 'Hi', 'Website Contact Marketing\r\n\r\nProcess:\r\n\r\nSelection: We identify relevant websites and companies that match your target audience.\r\nDispatching Messages: We send carefully crafted messages via the contact forms on these websites.\r\nMessage Optimization: We optimize the messages to ensure they follow best practice guidelines and increase the chances of a response.\r\nFeedback: You receive regular reports on the messages sent and any responses received.\r\n\r\nAdvantages:\r\n\r\nTargeted Approach: Reach potential clients directly within your target demographic.\r\nConvenient: Saves you the hassle of looking for contact info and drafting messages.\r\nAffordable: An economical approach to extending your reach without significant marketing expenses.\r\n\r\nReasons to Select Us:\r\n\r\nWe have experience in setting up and managing effective contact marketing campaigns. Our team ensures that each message is tailored to meet your specific needs. We are committed to a personalized strategy and work to help you meet your business goals.\r\n\r\nDon\'t hesitate to get in touch with us on Telegram t.me/Contactwebsitemarketing \r\nOr if you don\'t feel comfortable with clicking links in emails, \r\nyou can also look me up on Telegram @Contactwebsitemarketing \r\n\r\nWe wish you a very nice day!\r\n\r\nGreetings \r\nTeam Contact Website Marketing.'),
(32, 1716778433, NULL, 'Walt Bayliss', 'jed.stubblefield@gmail.com', 'Hi ,\r\n\r\nAre you feeling overwhelmed by everything you see everyone else doing or what you\'re being told to do to make your agency successful?\r\n\r\nOnly to find yourself stuck where you started...\r\n\r\nI have some exciting news for you!\r\n\r\nOn Monday, May 27th, 2024 at 5 pm EST, White Label Suite is hosting an exclusive online event, the \"White-Label Freedom Event”, that you won\'t want to miss.\r\n\r\nWhat to Expect:\r\n\r\n-Learn how to remove all of the noise and focus on what actually works so you can finally get started.\r\n\r\n-Discover a clear roadmap for success so you can remove the guesswork from your business.\r\n\r\n-Get a playbook to help you focus on a single target audience, address one core problem, and provide a simple solution so you can easily scale without stress.\r\n\r\nJoin us on Zoom [link will be provided when you register] and let Walt Bayliss, co-founder of White Label Suite, guide you through this transformative journey.\r\n\r\nThe team at White Label Suite will also be randomly selecting participants who are engaged on the call and giving away $50 Amazon Gift Cards!\r\n\r\nRegister Now ===>  https://whitelabelsuite.com/freedom?am_id=omaralghossain6089\r\n\r\nto secure your spot and start building the freedom-based business you’ve always wanted.\r\n\r\nLooking forward to seeing you there!\r\n\r\n\r\n\r\nRegards', '532625487', 'Looking for more freedom in your business and less overwhelm? I got you...', 'Hi ,\r\n\r\nAre you feeling overwhelmed by everything you see everyone else doing or what you\'re being told to do to make your agency successful?\r\n\r\nOnly to find yourself stuck where you started...\r\n\r\nI have some exciting news for you!\r\n\r\nOn Monday, May 27th, 2024 at 5 pm EST, White Label Suite is hosting an exclusive online event, the \"White-Label Freedom Event”, that you won\'t want to miss.\r\n\r\nWhat to Expect:\r\n\r\n-Learn how to remove all of the noise and focus on what actually works so you can finally get started.\r\n\r\n-Discover a clear roadmap for success so you can remove the guesswork from your business.\r\n\r\n-Get a playbook to help you focus on a single target audience, address one core problem, and provide a simple solution so you can easily scale without stress.\r\n\r\nJoin us on Zoom [link will be provided when you register] and let Walt Bayliss, co-founder of White Label Suite, guide you through this transformative journey.\r\n\r\nThe team at White Label Suite will also be randomly selecting participants who are engaged on the call and giving away $50 Amazon Gift Cards!\r\n\r\nRegister Now ===>  https://whitelabelsuite.com/freedom?am_id=omaralghossain6089\r\n\r\nto secure your spot and start building the freedom-based business you’ve always wanted.\r\n\r\nLooking forward to seeing you there!\r\n\r\n\r\n\r\nRegards'),
(33, 1716783059, NULL, 'AmeliaWen1', 'daysleseeb@gmail.com', '', '81571972859', 'अरे तुम, खिलवाड़ को आदी लग रहा है?', 'अरे, एक मोमबत्ती की रोशनी बुलबुला स्नान के लिए मेरे साथ शामिल होने के लिए परवाह है? -  https://rb.gy/7xb976?ot'),
(34, 1716933490, NULL, 'Local SEO', 'brandbuildingassistance@outlook.com', 'Boost your local presence and stand out with our expert Local SEO and Google My Business services! Elevate your visibility, attract more customers, and dominate your local market. \r\n\r\nReach out to me today at Brandbuildingassistance@outlook.com and let\'s start optimizing your online presence for success!\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '396092696', 'Local SEO', 'Boost your local presence and stand out with our expert Local SEO and Google My Business services! Elevate your visibility, attract more customers, and dominate your local market. \r\n\r\nReach out to me today at Brandbuildingassistance@outlook.com and let\'s start optimizing your online presence for success!\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(35, 1716955918, NULL, 'Mariel', 'mariel.mussen@gmail.com', '\r\nHey. You could be losing customers every day to your competitors.\r\n\r\n \r\n\r\nPlease go to Google and write the term best (your niche) in (your area)\r\n\r\nFor example, best plumbers in Chicago\r\n\r\n \r\n\r\nPlease check if you appear in the first 3 places on Google.\r\n\r\n \r\n\r\nIf not then I want you to know that you are losing customers to your competitors every day because the top 3 places get 99% of the customers.\r\n\r\n \r\n\r\nIf you\'re interested in solving this and improving your local search ranking on Google.\r\nIt\'s actually quite affordable, and we\'ve assisted thousands of local businesses in making that happen.\r\n\r\n \r\n\r\nWe specialize in helping small local businesses to improve their Google search rankings for targeted keywords.\r\n\r\n \r\nCheck out our service in further depth to discover all of the\r\nsuccess stories highlighted by the clients with countless 5-star reviews.\r\n\r\nIf You Have Any Question\r\n\r\nAnd Want To Know How We Can\r\n\r\nHelp You We Are Live On The Chat 24/7\r\n\r\nhttps://bit.ly/gmb-management-and-ranking-service\r\n\r\n \r\n\r\nThanks for your time  \r\n\r\n \r\n\r\nDanial', '613-321-3353', 'Re:We Can Help You Get Much More Customers..', '\r\nHey. You could be losing customers every day to your competitors.\r\n\r\n \r\n\r\nPlease go to Google and write the term best (your niche) in (your area)\r\n\r\nFor example, best plumbers in Chicago\r\n\r\n \r\n\r\nPlease check if you appear in the first 3 places on Google.\r\n\r\n \r\n\r\nIf not then I want you to know that you are losing customers to your competitors every day because the top 3 places get 99% of the customers.\r\n\r\n \r\n\r\nIf you\'re interested in solving this and improving your local search ranking on Google.\r\nIt\'s actually quite affordable, and we\'ve assisted thousands of local businesses in making that happen.\r\n\r\n \r\n\r\nWe specialize in helping small local businesses to improve their Google search rankings for targeted keywords.\r\n\r\n \r\nCheck out our service in further depth to discover all of the\r\nsuccess stories highlighted by the clients with countless 5-star reviews.\r\n\r\nIf You Have Any Question\r\n\r\nAnd Want To Know How We Can\r\n\r\nHelp You We Are Live On The Chat 24/7\r\n\r\nhttps://bit.ly/gmb-management-and-ranking-service\r\n\r\n \r\n\r\nThanks for your time  \r\n\r\n \r\n\r\nDanial'),
(36, 1717052260, NULL, 'Mike Roger\r\n', 'mikeSnax@gmail.com', 'https://jpsresidency.in', '81913349269', 'NEW: Semrush Backlinks', 'Hello \r\n \r\nThis is Mike Roger\r\n \r\nLet me introduce to you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictly-digital.com/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your jpsresidency.in SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictly-digital.com/semrush-backlinks/ \r\n \r\nCheap and effective \r\nWhatsapp us: https://wa.link/on3cru \r\nTry it anytime soon \r\n \r\nRegards \r\nMike Roger\r\n \r\nmike@strictlydigital.net'),
(37, 1717067373, NULL, 'Julia Schneider', 'wmgirl75@yahoo.com', 'https://www.no-site.com', '86892389897', 'Impfschaden? Jetzt 6.000 Euro Schadenersatz sichern', 'Du hast auch einen Impfschaden oder Nebenwirkungen nach der Corona-Impfung? \r\n \r\nIch leite dir diese Nachricht vom Verein BÜRGERSCHUTZ weiter, weil ich gehört habe, dass du und einige deiner Freunde Impfnebenwirkungen habt oder befürchtet, welche zu bekommen. Als Geimpfte könnten wir jetzt 6.000 € Schadenersatz vom Impfarzt erhalten. \r\n \r\nDer Verein Bürgerschutz, Österreichs größter „Impfopfer-Verein“, unterstützt dich bei Impfschäden nach deiner mRNA-Behandlung oder IMPFAUSLEITUNG. \r\n \r\nZusätzlich erhalten alle Mitglieder vom https://www.buergerschutz.org kostenlos eine Anleitung zur Impfausleitung. \r\n \r\nLeite diese Nachricht weiter, um den Druck auf die Impfärzte und die Regierung zu erhöhen. \r\n \r\nLG \r\nJulia \r\n \r\n \r\nPartnerprogramm Wohncontainer \r\nhttps://skycontainer.at/'),
(38, 1717102407, NULL, 'AmeliaWen1', 'dayslesee3@gmail.com', '', '82443753317', 'हैलो प्रिय, कुछ कंपनी चाहते हैं?', 'हैलो, हम बिस्तर में कुछ मीठे व्यवहार कैसे साझा करते हैं? -  https://rb.gy/7xb976?ot'),
(39, 1717241401, NULL, 'jessicaWenc', 'Upsestewewsag2@gmail.com', '', '86982669575', 'हैलो प्रिय, साहसी लग रहा है?', 'हाय डार्लिंग, कुछ नग्न योग के लिए मुझसे जुड़ना चाहते हैं? -  https://rb.gy/7xb976?rAx'),
(40, 1717345714, NULL, 'Scot Sparks', 'sparks.scot@googlemail.com', 'This Business Is For Anyone Who Wants To Make More Money &\r\nTake Charge Of Their Future\r\n\r\nCheck The Link Below\r\n\r\nhttps://profitfromhousecleaning.com/', '661250387', 'Learn How House Cleaning Business That Makes Over $2000 Every Week!', 'This Business Is For Anyone Who Wants To Make More Money &\r\nTake Charge Of Their Future\r\n\r\nCheck The Link Below\r\n\r\nhttps://profitfromhousecleaning.com/'),
(41, 1717357482, 1717400026, 'Cyrus Sandoval', 'cyrusrsandoval77@gmail.com', 'Hi,I just visited your jpsresidency.in website. I really like the clean design and usability of it. It’s really nice.This is Cyrus. I work as a Social Media Management specialist. We specialized in constantly updating the social media profiles of companies over the last few years using eye catching images and engaging captions. By following this habit, it builds trust when people see that you have an updated social media profiles. Trust builds confidence for buyers. And when they are confident, they are likely to convert into customers.I\'d be happy to give you a free 7 days trial of our service. A total of 7 free social media posts for 10 days content calendar.I would love the chance to discuss how we can contribute to the growth of jpsresidency.in through effective social media management. Are you available for a quick conversation to explore this further? I’d be delighted to connect.All the best,Cyrus SandovalSocial Media Management Specialistcyrusrsandoval77@gmail.com', '', 'Quick Question About jpsresidency.in', 'Hi,\r\n\r\nI just came across your jpsresidency.in website. I really like the great design and usability of it. It’s really nice.\r\n\r\nThis is Cyrus. I work as a Social Media Management specialist. We specialized in constantly updating the social media handles of companies over the last several years using eye catching images and engaging captions. By doing this routine, it builds trust when people see that you have an up to date social media handles. Trust builds confidence for customers. And when they are confident, they are likely to convert into customers.\r\n\r\nI\'d be happy to give you a free 7 days trial of our service. A total of 7 free social media posts for 10 days content calendar.\r\n\r\nI would love the chance to discuss how we can contribute to the growth of jpsresidency.in through effective social media management. Are you available for a quick chat to explore this further? I’d be delighted to get in touch.\r\n\r\nAll the best,\r\nCyrus Sandoval\r\nSocial Media Management Specialist\r\ncyrusrsandoval77@gmail.com'),
(42, 1717361973, NULL, 'Harman', 'fastprocess006@outlook.com', 'Do you need any help with tasks related to Google sheets and Microsoft Excel? I can work on Creating Dashboards in excel sheets, Business Automation, Creating reports, graphs, fetching data from multiple sources, Data Spreadsheet formulations, Data Setup, Data Sorting, Vlookup, hlookup, pivot tables, manual entry of data in spreadsheet. \r\n\r\nPlease share your requirements with me on fastprocess006@outlook.com and I can share cost with you accordingly.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '9057336555', 'Google sheets and microsoft excel work', 'Do you need any help with tasks related to Google sheets and Microsoft Excel? I can work on Creating Dashboards in excel sheets, Business Automation, Creating reports, graphs, fetching data from multiple sources, Data Spreadsheet formulations, Data Setup, Data Sorting, Vlookup, hlookup, pivot tables, manual entry of data in spreadsheet. \r\n\r\nPlease share your requirements with me on fastprocess006@outlook.com and I can share cost with you accordingly.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(43, 1717385047, NULL, 'AmeliaWen2', 'dayslesee1@gmail.com', '', '84445572977', 'हैलो प्रिय, कुछ कंपनी चाहते हैं?', 'हैलो, हम बिस्तर में कुछ मीठे व्यवहार कैसे साझा करते हैं? -  https://rb.gy/7xb976?ot'),
(44, 1717395418, NULL, 'Nace ', 'chas.ellington@yahoo.com', 'Hi ,\r\n\r\nMy name is Nace. I have been converting websites into apps on Fiverr over 10 years. I don\'t stop working until you are fully satisfied, and I provide professional support before,\r\n during and after the work is done. I do this for living, so I take my work very seriously. Each and every buyer will receive my personal care and attention.\r\n\r\nThe process:\r\n\r\n- Please contact me and send me the URL\r\n\r\n- I will inform you what to expect and prepare\r\n\r\n- Leave everything else to me!\r\n\r\nWhat I offer:\r\n\r\n- New website content updated automatically\r\n\r\n- Lifetime customer support\r\n\r\n- Professionally developed apps to sync with your website flow, colors, logo, font, style\r\n\r\n- UNIQUE: Choose your layout and easily edit apps anytime!\r\n\r\n- Works on phones and tablets\r\n\r\n- Unlimited push notifications\r\n\r\n- Unlimited links & buttons\r\n\r\n- Analytics\r\n\r\n- Social media\r\n\r\n- Contact page with action buttons\r\n\r\n- About/Services\r\n\r\n- APK/IPA files\r\n\r\n- Etc.\r\n\r\n\r\nI work with all websites: Wordpress, Shopify, Wix, GoDaddy, Squarespace, Weebly, HostGator, etc. I am looking forward to working with you!\r\n\r\nLets Starts and contact me here  ===> https://tinyurl.com/4hxuhsy5', '7973967578', 'Do you have Mobile app ??', 'Hi ,\r\n\r\nMy name is Nace. I have been converting websites into apps on Fiverr over 10 years. I don\'t stop working until you are fully satisfied, and I provide professional support before,\r\n during and after the work is done. I do this for living, so I take my work very seriously. Each and every buyer will receive my personal care and attention.\r\n\r\nThe process:\r\n\r\n- Please contact me and send me the URL\r\n\r\n- I will inform you what to expect and prepare\r\n\r\n- Leave everything else to me!\r\n\r\nWhat I offer:\r\n\r\n- New website content updated automatically\r\n\r\n- Lifetime customer support\r\n\r\n- Professionally developed apps to sync with your website flow, colors, logo, font, style\r\n\r\n- UNIQUE: Choose your layout and easily edit apps anytime!\r\n\r\n- Works on phones and tablets\r\n\r\n- Unlimited push notifications\r\n\r\n- Unlimited links & buttons\r\n\r\n- Analytics\r\n\r\n- Social media\r\n\r\n- Contact page with action buttons\r\n\r\n- About/Services\r\n\r\n- APK/IPA files\r\n\r\n- Etc.\r\n\r\n\r\nI work with all websites: Wordpress, Shopify, Wix, GoDaddy, Squarespace, Weebly, HostGator, etc. I am looking forward to working with you!\r\n\r\nLets Starts and contact me here  ===> https://tinyurl.com/4hxuhsy5'),
(45, 1717413509, NULL, 'Myrtle Hammel', 'hammel.myrtle@googlemail.com', 'Greetings\r\n\r\nSay goodbye to manual video editing! \r\n\r\nGenerate engaging videos for TikTok, Instagram, and YouTube in seconds.\r\n\r\nDon\'t miss our Early Bird Offer! Visit now for exclusive bonuses and discounts.\r\n\r\nSEE HERE => https://cutt.ly/3etz7Sbd\r\n\r\nWarm regards\r\nMyrtle\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nGermany, NW, Dusseldorf Flehe, 40221, Friedrichstrasse 23\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '211856619', 'Earn 100$ per day with...', 'Good day\r\n\r\nSay goodbye to manual video editing! \r\n\r\nGenerate engaging videos for TikTok, Instagram, and YouTube in seconds.\r\n\r\nDon\'t miss our Early Bird Offer! Visit now for exclusive bonuses and discounts.\r\n\r\nSEE HERE => https://cutt.ly/3etz7Sbd\r\n\r\nRegards\r\nMyrtle\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nGermany, NW, Dusseldorf Flehe, 40221, Friedrichstrasse 23\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(46, 1717474927, NULL, 'JamesLoorp', 'figuera51@ro.com', '', '86183613964', 'seo trends 2024', 'Заходите и читайте новую статью о сео продвижении https://medium.com/@sviblovaolesa/seo-trends-for-2024-what-you-need-to-know-50d311e5dfbb'),
(47, 1717500517, NULL, 'Nelly', 'nelly.huot47@gmail.com', 'Hi\r\n\r\nI hope this massage finds you well.\r\n\r\nAre you looking to elevate your Website SEO game and achieve top rankings on Google?\r\n\r\nAt [Ranked Ai , we specialize in delivering powerful SEO solutions tailored for agencies like yours.\r\n\r\nHere’s how we can help:\r\n\r\nTargeted SEO Strategies: Choose from plans with 25, 50, or 100 target keywords.\r\n\r\nContent Creation: We provide up to 4 high-quality articles per week.\r\n\r\nComprehensive Optimization: From on-page tweaks to building high-quality backlinks.\r\n\r\nCutting-Edge SEO Software: Access industry-leading tools to boost your results.\r\n\r\nWe’ve successfully propelled thousands of companies to page 1 on Google,\r\n\r\ntranslating into millions of dollars in revenue. \r\n\r\nAnd the best part? You can try our services free for the first 7 days!\r\n\r\nPlace your website URL with us, and we’ll do all the work for you.\r\n\r\nReady to get started? Click Here\r\n\r\nbit.ly/seo-free-7\r\n\r\nBest regards,\r\n\r\n\r\n\r\nP.S. Don’t miss out on this opportunity to see the impact of our SEO services firsthand, absolutely risk-free!\r\n\r\n\r\nThanks for your time  \r\n\r\n \r\n\r\nDanial', '0699 355 46 75', 'Re:Boost Your Website Rankings to Page 1 on Google – Try Us Free for 7 Days!', 'Hi\r\n\r\nI hope this massage finds you well.\r\n\r\nAre you looking to elevate your Website SEO game and achieve top rankings on Google?\r\n\r\nAt [Ranked Ai , we specialize in delivering powerful SEO solutions tailored for agencies like yours.\r\n\r\nHere’s how we can help:\r\n\r\nTargeted SEO Strategies: Choose from plans with 25, 50, or 100 target keywords.\r\n\r\nContent Creation: We provide up to 4 high-quality articles per week.\r\n\r\nComprehensive Optimization: From on-page tweaks to building high-quality backlinks.\r\n\r\nCutting-Edge SEO Software: Access industry-leading tools to boost your results.\r\n\r\nWe’ve successfully propelled thousands of companies to page 1 on Google,\r\n\r\ntranslating into millions of dollars in revenue. \r\n\r\nAnd the best part? You can try our services free for the first 7 days!\r\n\r\nPlace your website URL with us, and we’ll do all the work for you.\r\n\r\nReady to get started? Click Here\r\n\r\nbit.ly/seo-free-7\r\n\r\nBest regards,\r\n\r\n\r\n\r\nP.S. Don’t miss out on this opportunity to see the impact of our SEO services firsthand, absolutely risk-free!\r\n\r\n\r\nThanks for your time  \r\n\r\n \r\n\r\nDanial'),
(48, 1717518325, NULL, 'Julia Schneider', 'wmgirl75@yahoo.com', 'http://www.no-sites.com', '81766822865', 'Top 10 Wohn- und Bürocontainer: Perfekte Wertanlage auf einen Blick', 'Dein Weg zu Eigentum und WERTANLAGEN ab nur 1.500 €/m² - Entdecke die Möglichkeiten auf https://skycontainer.at! \r\n \r\nDie Wohnungsnot eskaliert, und Immobilien sind heute unverzichtbar. Ein eigenes Zuhause, eine lohnende Investition oder ein modernes Büro – all das ist dringender denn je. Was, wenn all das erschwinglich, flexibel und nachhaltig sein könnte? Unsere Container-Häuser ab 1.500 €/m² bieten diese Rettung. Die Vermietung verspricht zudem hervorragende Geschäftschancen mit hohen Renditen. In Zeiten, in denen Geld auf der Bank rapide an Wert verliert und Banken immer unsicherer werden, ist eine Investition in Immobilien die einzig sichere Entscheidung. Handle jetzt, bevor es zu spät ist! \r\n \r\n5 Schritte zu deinem NEUEN HAUS oder deiner WERTANLAGE: \r\n \r\nKAUFEN ALS EIGENHEIM: \r\nEin individuelles, modernes Zuhause, das perfekt zu deinem Lebensstil passt. \r\n \r\nKAUF ALS WERTANLAGE: \r\nEine Investition in die Zukunft, die sowohl Wertstabilität als auch Wertsteigerungspotenzial bietet. \r\n \r\nVERMIETEN ÜBER AIRBNB: \r\nNutze die Möglichkeit, durch Kurzzeitvermietungen attraktive Renditen zu erzielen und ein lukratives Geschäft aufzubauen. (ca. 1.500 € monatliche Einnahmen) \r\n \r\nFÜR DAUERMIETER: \r\nEine sichere Einkommensquelle durch langfristige Vermietungen. \r\n \r\nKAUF FÜR EIN NEUES BÜRO: \r\nGestalte ein kreatives und flexibles Arbeitsumfeld, das deine Produktivität steigert. \r\n \r\nFür detaillierte Informationen, BILDER UND PREISE besuche die Webseite unseres Herstellers: https://skycontainer.at \r\n \r\nErlebe die Vielfalt unserer Modelle und lass dich von inspirierenden Videos auf unseren Social-Media-Kanälen begeistern: \r\n \r\nINSTAGRAM: https://www.instagram.com/skycontainer_container_home/ \r\n \r\nTIKTOK: https://www.tiktok.com/@skycontainer.at \r\n \r\nFACEBOOK: https://www.facebook.com/skycontainer.at \r\n \r\nDEIN DIY-PROJEKT: \r\nMit den Plänen unserer beliebtesten Modelle kannst du deinen Design-Wohncontainer in jeder Größe selbst Stück für Stück aufbauen und gestalten. \r\n \r\nVerpasse nicht die Chance, deinen Traum zu verwirklichen und zugleich eine kluge Investition zu tätigen. Entdecke die Möglichkeiten mit SkyContainer. \r\n \r\nMit einem Klick zu deinem neuen Zuhause oder deiner Wertanlage!'),
(49, 1717590084, NULL, 'CompanyRegistar.com', 'pethebridge.gregg@gmail.com', 'Hello\r\n\r\nThis will substantially impact your page rank, the more increased directories your company is listed \r\n\r\nin, globally or locally, the greater your back links you have and the better you rank in Google - Yahoo - Bing.\r\n\r\nNever has it been simpler to promote your website\r\n\r\nJust a few inputs and our system willl do the rest. No more struggling about manual llink building - CAPTHCAs or email \r\n\r\nverification.\r\n\r\nWe\'ve automed all that we possibly could to make submitting your domain a \r\n\r\nbreeze.\r\n\r\nSee your domain on the first page.\r\n\r\nWe will submit your online property to thousands of directories and give you a full \r\n\r\nreport on the status of each submission. Although we have automated the submission process to \r\n\r\na large extent, some of the registries may require manual mail validation which could cause a slight \r\n\r\ndelay.\r\n\r\nMaking your life better\r\n\r\nCompanyRegistar.com', '477361165', 'Your site jpsresidency.in is listed in a few 8 of 2,502,2510,2539,2561 directories', 'Dear Sir/Madam\r\n\r\nThis will substantially impact your page rank, the more increased directories your company is listed \r\n\r\nin, globally or locally, the greater your back links you have and the higher you rank in Google - Yahoo - Bing.\r\n\r\nIt has never been easier to promote your website\r\n\r\nJust a few inputs and our program willl do the rest. No more fretting about email verification - manual link building or CAPTCHAs.\r\n\r\nWe\'ve automed everything that we could have to make submitting your website a \r\n\r\nbreeze.\r\n\r\nSee your online property on the first page.\r\n\r\nWe will submit your online property to numerous directories and give you a full \r\n\r\nreport on the status of each listing. Although we have automated the submission process to \r\n\r\na large extent, some of the registries may require manual mail validation which could cause a slight \r\n\r\ndelay.\r\n\r\nMaking your life better\r\n\r\nCompanyRegistar.com'),
(50, 1717733525, NULL, 'Matthew', 'futurosalesco@gmail.com', 'Hey, \r\n\r\nAre you interested in a sms/whatsapp bot that can reactive all your old leads within minutes, warm them up, and either close the sale or book an appointment using the best practices for sales? \r\n\r\nIt’s free of cost to get started. You only pay when you book an appointment or close a sale a fixed amount or fixed commission. \r\n\r\nThis way you can re-engage all of your old leads by sms/whatsapp with a bot trained on your sales data, product data, and knowledge base in minutes without having to contact them manually or design a campaign to re-engage them by email, sms, etc. The bot does it all for you. \r\n\r\nDoes that sound like something you’re interested in?\r\n\r\nIf you are click the link below to book an appointment to learn more.\r\n\r\nhttps://bit.ly/reactive8 \r\n\r\n\r\nBest,\r\n\r\nMatthew Williams\r\nPresident\r\nZentara\r\n\r\n\r\n\r\n\r\nReply to this email with the word \"UNSUBSCRIBE\" as the Subject to unsubscribe.', '4395835', 'Get 90% Open Rates on your SMS Messages with Reactive8', 'Hey, \r\n\r\nAre you interested in a sms/whatsapp bot that can reactive all your old leads within minutes, warm them up, and either close the sale or book an appointment using the best practices for sales? \r\n\r\nIt’s free of cost to get started. You only pay when you book an appointment or close a sale a fixed amount or fixed commission. \r\n\r\nThis way you can re-engage all of your old leads by sms/whatsapp with a bot trained on your sales data, product data, and knowledge base in minutes without having to contact them manually or design a campaign to re-engage them by email, sms, etc. The bot does it all for you. \r\n\r\nDoes that sound like something you’re interested in?\r\n\r\nIf you are click the link below to book an appointment to learn more.\r\n\r\nhttps://bit.ly/reactive8 \r\n\r\n\r\nBest,\r\n\r\nMatthew Williams\r\nPresident\r\nZentara\r\n\r\n\r\n\r\n\r\nReply to this email with the word \"UNSUBSCRIBE\" as the Subject to unsubscribe.'),
(51, 1717735452, NULL, 'Mike Fitzgerald\r\n', 'mikeLedsinnidO@gmail.com', 'https://no-site.com', '81744956277', 'Increase sales for your local business', 'This service is perfect for boosting your local business\' visibility on the map in a specific location. \r\n \r\nWe provide Google Maps listing management, optimization, and promotion services that cover everything needed to rank in the Google 3-Pack. \r\n \r\nMore info: \r\nhttps://www.speed-seo.co/ranking-in-the-maps-means-sales/ \r\n \r\nThanks and Regards \r\nMike Fitzgerald\r\n \r\nhttps://www.speed-seo.co/whatsapp-us/'),
(52, 1717850767, NULL, 'Hannah Ackerman', 'rachelmanagement@skiff.com', 'http://www.no-sites.com', '86285141172', 'Tailored financial Solution', 'Good day, \r\n \r\nWe specialize in consulting for a group of high-net-worth foreign investors, providing exclusive investment opportunities with a 2.5% interest rate, a 2-year grace period, and a repayment term of 10 to 15 years. If you are seeking funding for your business or personal projects, please indicate your interest, and we will reach out to you for a consultation through our official platform. \r\n \r\nThank you for your time and consideration. \r\n \r\nBest regards, \r\n \r\nMrs. Hannah Ackerman \r\n \r\nalternativeconsult@hgdtkbcs-sec.com \r\n \r\nAlternative Finance \r\n \r\nRelationship Manager'),
(53, 1717877229, NULL, 'Benjamin Winsor', 'winsor.benjamin57@msn.com', 'Hi\r\n\r\nGet Ready! A groundbreaking discovery is here.\r\n\r\nSeize this moment to unveil the astonishing secret nestled in Jeff Bezos\' Amazon empire – a secret that floods you with an endless stream of free traffic and showers you with incredible Amazon commissions!\r\n\r\nWHY TOP EARNERS LOVE AMZ AUTOMATOR:\r\n[+] Effortless Traffic: Discover a hidden traffic source from Amazon Prime.\r\n[+] Lucrative Commissions: Earn up to $293.47 daily just by watching videos.\r\n[+] Seamless Setup: No complicated or costly setups required.\r\n\r\nWHAT USERS ARE SAYING:\r\n[Benjamin] \"AMZ AUTOMATOR has revolutionized my Amazon commissions. It\'s a game-changer!\"\r\n\r\nACT FAST – THIS OFFER IS LIMITED:\r\nThis exclusive Amazon Prime secret won\'t be around forever. Time is running out!\r\n\r\nCLICK HERE TO GET STARTED =>>  https://cutt.ly/uetnxZui\r\n\r\nDon\'t miss out. Join those who are capitalizing on this rare opportunity now!\r\n\r\nYours truly\r\nBenjamin\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nPoland, NA, Warszawa, 04-818, Ul. Smogorska 119\r\nTo stop any further communication from us, please reply to this email...', '786984507', 'Unlock the Hidden Power of Amazon Prime and Earn $293 Daily!', 'Good day\r\n\r\nGet Ready! A groundbreaking discovery is here.\r\n\r\nSeize this moment to unveil the astonishing secret nestled in Jeff Bezos\' Amazon empire – a secret that floods you with an endless stream of free traffic and showers you with incredible Amazon commissions!\r\n\r\nWHY TOP EARNERS LOVE AMZ AUTOMATOR:\r\n[+] Effortless Traffic: Discover a hidden traffic source from Amazon Prime.\r\n[+] Lucrative Commissions: Earn up to $293.47 daily just by watching videos.\r\n[+] Seamless Setup: No complicated or costly setups required.\r\n\r\nWHAT USERS ARE SAYING:\r\n[Benjamin] \"AMZ AUTOMATOR has revolutionized my Amazon commissions. It\'s a game-changer!\"\r\n\r\nACT FAST – THIS OFFER IS LIMITED:\r\nThis exclusive Amazon Prime secret won\'t be around forever. Time is running out!\r\n\r\nCLICK HERE TO GET STARTED =>>  https://cutt.ly/uetnxZui\r\n\r\nDon\'t miss out. Join those who are capitalizing on this rare opportunity now!\r\n\r\nSincerely\r\nBenjamin\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nPoland, NA, Warszawa, 04-818, Ul. Smogorska 119\r\nTo stop any further communication from us, please reply to this email...'),
(54, 1717890569, NULL, 'Joe Hausmann', 'joe.hausmann@hotmail.com', 'Hi, I was trying to contact the business owner because I found a great system for marketing and automation.  Go High Level is the name of the game and you get 14 days for free in using this link.\r\n https://shorturl.at/c9O0A\r\n\r\n', '4555765', 'Sending a Free Trial Your Way, Please Try', 'Hi, I was trying to contact the business owner because I found a great system for marketing and automation.  Go High Level is the name of the game and you get 14 days for free in using this link.\r\n https://shorturl.at/c9O0A\r\n\r\n'),
(55, 1717949420, NULL, 'Your Secret Friend', 'secretsofsuccess87@gmail.com', 'Hey,\r\n\r\nI\'ve discovered something that has transformed my personal and financial life, \r\n\r\nand I immediately thought of you and your incredible dedication to business and\r\n\r\npersonal development. The \"Secrets of Success\" program offers a wealth of knowledge\r\n\r\nfrom personal development legends, and I truly believe this will elevate both your \r\n\r\nbusiness and personal growth. Spots are limited, \r\n\r\nso don\'t miss out join me now: https://secretsofsuccess.com/roundpegs?afmc=17em\r\n\r\nLooking forward to seeing you inside...\r\n\r\nYour Secret Friend! xxx', '6474719895', 'Discover a Secret I\'ve Been Loving: Your Invitation Inside!', 'Hey,\r\n\r\nI\'ve discovered something that has transformed my personal and financial life, \r\n\r\nand I immediately thought of you and your incredible dedication to business and\r\n\r\npersonal development. The \"Secrets of Success\" program offers a wealth of knowledge\r\n\r\nfrom personal development legends, and I truly believe this will elevate both your \r\n\r\nbusiness and personal growth. Spots are limited, \r\n\r\nso don\'t miss out join me now: https://secretsofsuccess.com/roundpegs?afmc=17em\r\n\r\nLooking forward to seeing you inside...\r\n\r\nYour Secret Friend! xxx'),
(56, 1717950035, NULL, 'Alfredpraig', 'kathleenselph@icloud.com', 'https://accstores.com', '86942191429', 'Join the Access Revolution: Accstores.com Seeks Partners for Inclusive Innovation!', 'Discover https://Accstores.com, your one-stop solution for web accessibility needs. From automated testing to expert consultation, we provide tools and services to ensure inclusive online experiences. Join us in creating a web that\'s accessible to all. \r\n \r\n \r\nvisit Our Website \r\nhttps://Accstores.com');
INSERT INTO `pm_message` (`id`, `add_date`, `edit_date`, `name`, `email`, `address`, `phone`, `subject`, `msg`) VALUES
(57, 1717985850, NULL, 'Syed Zain Zain', 'response@cyberstar.one', 'At CyberStar.One, we don\'t just offer cyber services; we redefine them. In today\'s fast-paced digital landscape, security and innovation are paramount. That\'s why we\'ve crafted a suite of cutting-edge solutions tailored to safeguard your digital assets while propelling your business towards unprecedented success.\r\n\r\nOur Offerings:\r\nhttps://cyberstar.one/\r\n\r\nFortified Cybersecurity Solutions:\r\n\r\nCombat evolving threats with our state-of-the-art cybersecurity protocols.\r\nFrom penetration testing to threat intelligence, we provide comprehensive protection against cyber attacks.\r\nDynamic Web Development:\r\n\r\nElevate your online presence with bespoke web development services.\r\nOur team of experts crafts engaging, user-friendly websites optimized for performance and security.\r\nAI-Powered Data Analytics:\r\n\r\nUnlock the potential of your data with our advanced analytics solutions.\r\nLeverage AI algorithms to derive actionable insights and make data-driven decisions.\r\nCloud Infrastructure Services:\r\n\r\nEmbrace the scalability and flexibility of cloud computing with our tailored solutions.\r\nFrom migration to optimization, we streamline your journey to the cloud.\r\nWhy Choose CyberStar.One?\r\n\r\nInnovation at Every Turn:\r\n\r\nWe stay ahead of the curve, harnessing the latest technologies to drive innovation and efficiency.\r\nCustomized Solutions:\r\n\r\nNo two businesses are alike. That\'s why we tailor our services to meet your unique needs and objectives.\r\nRelentless Security:\r\n\r\nYour security is our priority. With CyberStar.One, you can rest assured knowing your digital assets are in safe hands.\r\nExpertise You Can Trust:\r\n\r\nOur team comprises seasoned professionals with a wealth of experience in cybersecurity, web development, data analytics, and cloud computing.\r\nOur Proposal:\r\n\r\nPartner with CyberStar.One, and unlock the full potential of your digital journey. From fortifying your defenses to driving innovation, we\'re committed to your success every step of the way. Let\'s embark on this transformative journey together.\r\n\r\nContact us today to schedule a consultation and discover how CyberStar.One can propel your business to new heights in the digital age.\r\n\r\nCyberStar.One - Empowering Your Digital Future.\r\nEmail US @ ceo@cyberstar.one We Deal All Kind Of IT Development and Cyber Services', '+923133850005', 'Urgent!', 'At CyberStar.One, we don\'t just offer cyber services; we redefine them. In today\'s fast-paced digital landscape, security and innovation are paramount. That\'s why we\'ve crafted a suite of cutting-edge solutions tailored to safeguard your digital assets while propelling your business towards unprecedented success.\r\n\r\nOur Offerings:\r\nhttps://cyberstar.one/\r\n\r\nFortified Cybersecurity Solutions:\r\n\r\nCombat evolving threats with our state-of-the-art cybersecurity protocols.\r\nFrom penetration testing to threat intelligence, we provide comprehensive protection against cyber attacks.\r\nDynamic Web Development:\r\n\r\nElevate your online presence with bespoke web development services.\r\nOur team of experts crafts engaging, user-friendly websites optimized for performance and security.\r\nAI-Powered Data Analytics:\r\n\r\nUnlock the potential of your data with our advanced analytics solutions.\r\nLeverage AI algorithms to derive actionable insights and make data-driven decisions.\r\nCloud Infrastructure Services:\r\n\r\nEmbrace the scalability and flexibility of cloud computing with our tailored solutions.\r\nFrom migration to optimization, we streamline your journey to the cloud.\r\nWhy Choose CyberStar.One?\r\n\r\nInnovation at Every Turn:\r\n\r\nWe stay ahead of the curve, harnessing the latest technologies to drive innovation and efficiency.\r\nCustomized Solutions:\r\n\r\nNo two businesses are alike. That\'s why we tailor our services to meet your unique needs and objectives.\r\nRelentless Security:\r\n\r\nYour security is our priority. With CyberStar.One, you can rest assured knowing your digital assets are in safe hands.\r\nExpertise You Can Trust:\r\n\r\nOur team comprises seasoned professionals with a wealth of experience in cybersecurity, web development, data analytics, and cloud computing.\r\nOur Proposal:\r\n\r\nPartner with CyberStar.One, and unlock the full potential of your digital journey. From fortifying your defenses to driving innovation, we\'re committed to your success every step of the way. Let\'s embark on this transformative journey together.\r\n\r\nContact us today to schedule a consultation and discover how CyberStar.One can propel your business to new heights in the digital age.\r\n\r\nCyberStar.One - Empowering Your Digital Future.\r\nEmail US @ ceo@cyberstar.one We Deal All Kind Of IT Development and Cyber Services'),
(58, 1718011617, NULL, 'Ramon Eubanks', 'ramon.eubanks@googlemail.com', 'Hi\r\n\r\nUnlock the secret to earning over $100 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  https://zeep.ly/STtFd\r\n\r\nKind regards\r\nRamon\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nGermany, BY, Uffenheim, 97210, Heiligengeistbrucke 87\r\nTo stop any further communication from us, please reply to this email...', '9842168065', 'Ready to Make 100 USD or More Every Single Day...', 'Greetings\r\n\r\nUnlock the secret to earning over $100 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  https://zeep.ly/STtFd\r\n\r\nYours sincerely\r\nRamon\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nGermany, BY, Uffenheim, 97210, Heiligengeistbrucke 87\r\nTo stop any further communication from us, please reply to this email...'),
(59, 1718057343, NULL, 'Tim Arndt', 'arndt.tim9@msn.com', 'Greetings\r\n\r\nI hope this message finds you well. I wanted to ask if you are in need of any proxy services. \r\n\r\nWE OFFER:\r\n[-] High-anonymity private browsing from major web browsers\r\n[-] High-volume content posting from proxy-supporting automation tools\r\n[-] High-performance web crawling from custom systems\r\n\r\nSee more info here :  https://cutt.ly/teu4THTP\r\n\r\nThank you\r\nTim\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nUnited States, GA, Augusta, 30907, 4214 Radio Park Drive\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '7066514361', 'Interested in Advanced Proxy Solutions?', 'Hi there\r\n\r\nI hope this message finds you well. I wanted to ask if you are in need of any proxy services. \r\n\r\nWE OFFER:\r\n[-] High-anonymity private browsing from major web browsers\r\n[-] High-volume content posting from proxy-supporting automation tools\r\n[-] High-performance web crawling from custom systems\r\n\r\nSee more info here :  https://cutt.ly/teu4THTP\r\n\r\nThank you\r\nTim\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nUnited States, GA, Augusta, 30907, 4214 Radio Park Drive\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(60, 1718084861, NULL, 'Mike Walter\r\n', 'mikeZesebrice@gmail.com', 'https://google.com', '86452485767', 'FREE fast ranks for jpsresidency.in', 'Hi there \r\n \r\nJust checked your jpsresidency.in baclink profile, I noticed a moderate percentage of toxic links pointing to your website \r\n \r\nWe will investigate each link for its toxicity and perform a professional clean up for you free of charge. \r\n \r\nStart recovering your ranks today: \r\nhttps://www.hilkom-digital.co/professional-linksprofile-clean-up-service/ \r\n \r\nRegards \r\nMike Walter\r\nHilkom Digital SEO Experts \r\nhttps://www.hilkom-digital.co/whatsapp-us/'),
(61, 1718111896, NULL, 'TyroneAtoft', 'lelabrush9119@icloud.com', '', '81449858392', 'Transform Your Sales Approach: AccsMarket.net Collaboration', 'Join our dynamic team at https://AccsMarket.net and become a vital partner in revolutionizing the account acquisition industry. With a diverse array of accounts available, from social media profiles to gaming credentials, partnering with us offers limitless potential for growth and success. Together, we can unlock new opportunities and reshape the digital landscape. \r\n \r\nClick here : https://AccsMarket.net'),
(62, 1718132219, NULL, 'Shanky', 'youronlinepresence2@outlook.com', 'I\'m Shanky, a Social Media Marketing Manager with over 10 years of global experience. I specialize in creating tailored social media content calendars, designing branded content, conducting hashtag research, and scheduling posts. I work across Instagram, Facebook, LinkedIn, Twitter, and Pinterest to help boost your online presence and engagement. \r\n\r\nLet\'s connect at Youronlinepresence2@outlook.com to discuss it further.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '4163453369', 'Social Media Marketing', 'I\'m Shanky, a Social Media Marketing Manager with over 10 years of global experience. I specialize in creating tailored social media content calendars, designing branded content, conducting hashtag research, and scheduling posts. I work across Instagram, Facebook, LinkedIn, Twitter, and Pinterest to help boost your online presence and engagement. \r\n\r\nLet\'s connect at Youronlinepresence2@outlook.com to discuss it further.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(63, 1718132747, NULL, 'Shanky', 'youronlinepresence2@outlook.com', 'I\'m Shanky, a Social Media Marketing Manager with over 10 years of global experience. I specialize in creating tailored social media content calendars, designing branded content, conducting hashtag research, and scheduling posts. I work across Instagram, Facebook, LinkedIn, Twitter, and Pinterest to help boost your online presence and engagement. \r\n\r\nLet\'s connect at Youronlinepresence2@outlook.com to discuss it further.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '7824690054', 'Social Media Marketing', 'I\'m Shanky, a Social Media Marketing Manager with over 10 years of global experience. I specialize in creating tailored social media content calendars, designing branded content, conducting hashtag research, and scheduling posts. I work across Instagram, Facebook, LinkedIn, Twitter, and Pinterest to help boost your online presence and engagement. \r\n\r\nLet\'s connect at Youronlinepresence2@outlook.com to discuss it further.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(64, 1718135683, NULL, 'Lanora Spivey', 'lanora.spivey@gmail.com', 'Greetings\r\n\r\nSay goodbye to manual video editing! \r\n\r\nGenerate engaging videos for TikTok, Instagram, and YouTube in seconds.\r\n\r\nDon\'t miss our Early Bird Offer! Visit now for exclusive bonuses and discounts.\r\n\r\nSEE HERE => https://cutt.ly/3etz7Sbd\r\n\r\nKind regards\r\nLanora\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nGermany, SN, Zittau, 2751, Heinrich Heine Platz 70\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '3583725924', 'Earn 100$ per day with...', 'Good day\r\n\r\nSay goodbye to manual video editing! \r\n\r\nGenerate engaging videos for TikTok, Instagram, and YouTube in seconds.\r\n\r\nDon\'t miss our Early Bird Offer! Visit now for exclusive bonuses and discounts.\r\n\r\nSEE HERE => https://cutt.ly/3etz7Sbd\r\n\r\nYours truly\r\nLanora\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nGermany, SN, Zittau, 2751, Heinrich Heine Platz 70\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(65, 1718163611, NULL, 'Milan Gragg', 'gragg.milan@googlemail.com', 'Unlock Your matter Potential as soon as A.I.!\r\n\r\nAre you ready to take on your business to the next-door level?\r\n\r\nTake this fast quiz to discover how A.I. can upgrade your operations, boost efficiency, and steer growth. \r\n\r\nFind out now!\r\n\r\nStart the Quiz\r\n\r\nhttps://bit.ly/4c8cnmJ', '353252839', 'Unlock Your business Potential following A.I.!', 'Unlock Your situation Potential taking into consideration A.I.!\r\n\r\nAre you ready to assume your situation to the next-door level?\r\n\r\nTake this quick quiz to discover how A.I. can reorganize your operations, boost efficiency, and steer growth. \r\n\r\nFind out now!\r\n\r\nStart the Quiz\r\n\r\nhttps://bit.ly/4c8cnmJ'),
(66, 1718179199, NULL, 'vicleChilk', 'chebakulinakarasevna@gmail.com', 'https://tubesweet.com/tags/en/Big-cock-videos', '83638879594', 'gangbang creampie anal', 'amateur teens com \r\n \r\nhttps://mzl-group.ru:443/bitrix/rk.php?goto=https://tubesweet.com/\r\nhttps://mmw.ru/bitrix/redirect.php?goto=https://tubesweet.com/\r\nhttps://interior.ulsankyocharo.com/portfolio/15?details=&view_returl=http%3A%2F%2Ftubesweet.com\r\nhttps://76yar.ru/redirect?url=https%3A%2F%2Ftubesweet.com\r\n'),
(67, 1718216733, NULL, 'Michaelodozy', 'meimoreland@icloud.com', 'https://accstores.com', '88167797822', 'Grow Your Brand Presence: Partner with Accstores.com as a Supplier!', 'Discover https://Accstores.com, the ultimate destination for seamless web accessibility solutions. We provide a comprehensive range of tools and services designed to make the internet accessible to all users, regardless of ability. Join us in our mission to create a more inclusive online experience for everyone. Explore https://Accstores.com today and unlock the power of accessibility. \r\n \r\n \r\nclick Through The Next Article \r\nhttps://Accstores.com'),
(68, 1718281376, NULL, 'Mike Backer\r\n', 'mikeZesebrice@gmail.com', 'https://jpsresidency.in', '84966477792', 'Domain Authority of your jpsresidency.in', 'Hi there, \r\n \r\nI have reviewed your domain in MOZ and have observed that you may benefit from an increase in authority. \r\n \r\nOur solution guarantees you a high-quality domain authority score within a period of three months. This will increase your organic visibility and strengthen your website authority, thus making it stronger against Google updates. \r\n \r\nCheck out our deals for more details. \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\n \r\nThanks and regards \r\nMike Backer\r\n \r\nMonkey Digital \r\nhttps://www.monkeydigital.co/whatsapp-us/'),
(69, 1718312285, NULL, 'Tesha Calderon', 'calderon.tesha@gmail.com', 'Hi\r\n\r\nUnlock the secret to earning over $300 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  https://cutt.ly/qetz3kWw\r\n\r\nKind regards\r\nTesha\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nNetherlands, GE, Lichtenvoorde, 7131 Ec, Doctor Besselinkstraat 60\r\nTo stop any further communication from us, please reply to this email...', '620645229', 'Earn Over 300 USD per day...', 'Hi there\r\n\r\nUnlock the secret to earning over $300 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  https://cutt.ly/qetz3kWw\r\n\r\nThank you\r\nTesha\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nNetherlands, GE, Lichtenvoorde, 7131 Ec, Doctor Besselinkstraat 60\r\nTo stop any further communication from us, please reply to this email...'),
(70, 1718320837, NULL, 'Candy Fairley', 'fairley.candy@gmail.com', 'Hi,\r\n\r\nThis is crazy, we are building mobile Apps for $50.\r\n\r\nGet your iOS and Android App!\r\n\r\nWhy are we doing this? Well, we are building a lot for cheap.\r\n\r\nVisit us https://pcxleads.com/welcome.php?domain=jpsresidency.in', '9220242796', 'jpsresidency.in app for $50!', 'Hi,\r\n\r\nThis is crazy, we are building mobile Apps for $50.\r\n\r\nGet your iOS and Android App!\r\n\r\nWhy are we doing this? Well, we are building a lot for cheap.\r\n\r\nVisit us https://pcxleads.com/welcome.php?domain=jpsresidency.in'),
(71, 1718328835, NULL, 'Jaunita Mealmaker', 'secretsofsuccess87@gmail.com', 'Can you really rewire your brain for massive success and abundance? And in just 3 days?\r\n\r\nI know, it sounds crazy...\r\n\r\nBut get this - legends like Tony Robbins, and Conor McGregor swear by it!\r\n\r\nAnd now, YOU can learn the exact process for FREE\r\n\r\nAnd here\'s the BEST part... \r\n\r\n--> https://secretsofsuccess.com/bibliomania?afmc=17el\r\n\r\nWhen you join, you\'ll discover how to:\r\n\r\n✅ Reprogram your subconscious mind for success.\r\n✅ Tap into the secrets of unlimited wealth and abundance.\r\n✅ Unlock unshakeable confidence in yourself.\r\n✅ Attract life-changing opportunities and people.\r\n✅ And a whole lot more!\r\n\r\nDon\'t wait - register before its  before it\'s too late!\r\n\r\n= https://secretsofsuccess.com/bibliomania?afmc=17el\r\n​\r\nSee you there,\r\nYour Secret Friend... :-)\r\n', '3833359802', 'RE: Can One Book Really Be Worth $1.5 Million Dollars...?', 'Can you really rewire your brain for massive success and abundance? And in just 3 days?\r\n\r\nI know, it sounds crazy...\r\n\r\nBut get this - legends like Tony Robbins, and Conor McGregor swear by it!\r\n\r\nAnd now, YOU can learn the exact process for FREE\r\n\r\nAnd here\'s the BEST part... \r\n\r\n--> https://secretsofsuccess.com/bibliomania?afmc=17el\r\n\r\nWhen you join, you\'ll discover how to:\r\n\r\n✅ Reprogram your subconscious mind for success.\r\n✅ Tap into the secrets of unlimited wealth and abundance.\r\n✅ Unlock unshakeable confidence in yourself.\r\n✅ Attract life-changing opportunities and people.\r\n✅ And a whole lot more!\r\n\r\nDon\'t wait - register before its  before it\'s too late!\r\n\r\n= https://secretsofsuccess.com/bibliomania?afmc=17el\r\n​\r\nSee you there,\r\nYour Secret Friend... :-)\r\n'),
(72, 1718331718, NULL, 'Garland Freeland', 'freeland.garland@googlemail.com', 'Hello\r\n\r\nUnleash your potential to make $300 daily, starting immediately.\r\n\r\n\r\n\r\nWitness how simple it is – no experience needed...\r\n\r\n\r\n\r\nSeize this unique chance today.\r\n\r\n\r\n\r\nClick here to begin your journey => https://cutt.ly/GeugCEiw\r\n\r\nKind regards\r\nGarland\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nNorway, NA, Bones, 5155, Vakleivbakken 237\r\nTo stop any further communication from us, please reply to this email...', '44869387', 'Earn Over 300 USD per day...', 'Good day\r\n\r\nUnleash your potential to make $300 daily, starting immediately.\r\n\r\n\r\n\r\nWitness how simple it is – no experience needed...\r\n\r\n\r\n\r\nSeize this unique chance today.\r\n\r\n\r\n\r\nClick here to begin your journey => https://cutt.ly/GeugCEiw\r\n\r\nRespectfully\r\nGarland\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nNorway, NA, Bones, 5155, Vakleivbakken 237\r\nTo stop any further communication from us, please reply to this email...'),
(73, 1718361925, NULL, 'Tyrell Cooksey', 'tyrell.cooksey@gmail.com', 'Hi there\r\n\r\nAre you ready to turn your dream into reality? \r\n\r\nWith this system, you can build a profitable online business and live life on your own terms. \r\n\r\nFind out how you can do this by clicking on => https://cutt.ly/Retz32tl\r\n\r\nYours truly\r\nTyrell\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nBrazil, SP, Votuporanga, 15500-063, Rua Rondonia 1083\r\nTo stop any further communication from us, please reply to this email...', '1720439017', 'Unlock Your Potential: Building a Lucrative Online Business on Your Own Terms', 'Greetings\r\n\r\nAre you ready to turn your dream into reality? \r\n\r\nWith this system, you can build a profitable online business and live life on your own terms. \r\n\r\nFind out how you can do this by clicking on => https://cutt.ly/Retz32tl\r\n\r\nRegards\r\nTyrell\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nBrazil, SP, Votuporanga, 15500-063, Rua Rondonia 1083\r\nTo stop any further communication from us, please reply to this email...'),
(74, 1718373758, NULL, 'Nickolas Timmer', 'timmer.nickolas@gmail.com', 'Hi there\r\n\r\nDo you dream of a life where you call the shots?\r\n\r\nOur innovative system empowers you to create a successful online business, allowing you to live life according to your own rules.\r\n\r\nReady to take the first step? Discover how by clicking here =>> https://cutt.ly/ZeySOkrz\r\n\r\nYours sincerely\r\nNickolas\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nItaly, IM, Piani Di Borghetto, 18012, Piazza Cardinale Riario Sforza 22\r\nTo stop any further communication from us, please reply to this email...', '3706041194', 'Transform Your Passion into Profit: Start Your Online Journey Today', 'Greetings\r\n\r\nDo you dream of a life where you call the shots?\r\n\r\nOur innovative system empowers you to create a successful online business, allowing you to live life according to your own rules.\r\n\r\nReady to take the first step? Discover how by clicking here =>> https://cutt.ly/ZeySOkrz\r\n\r\nSincerely\r\nNickolas\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nItaly, IM, Piani Di Borghetto, 18012, Piazza Cardinale Riario Sforza 22\r\nTo stop any further communication from us, please reply to this email...'),
(75, 1718398987, NULL, 'Sammy', 'jenna.butz57@msn.com', 'Hi, \r\n\r\nStruggling to reach more customers and boost your sales in the competitive online market?\r\n\r\nWithout a user-friendly and attractive e-commerce website, you might be missing out on significant opportunities to grow your business and enhance your brand visibility.\r\n\r\nAt OutsourceBPO, we create stunning, custom e-commerce websites designed to meet your unique business needs. Here\'s how we can help:\r\n\r\n- **Custom Design:** Reflects your brand’s identity.\r\n- **User-Friendly:** Easy navigation on all devices.\r\n- **Essential Features:** Secure checkout, customer accounts, and more.\r\n- **SEO & Marketing:** Optimized and integrated to drive sales.\r\n- **Ongoing Support:** Continuous maintenance and updates.\r\n- **Affordable Pricing:** Packages to fit your budget.\r\n\r\nLet’s schedule a free consultation to discuss your goals and how we can help you achieve them. Visit https://outsource-bpo.com/website/?jpsresidency.in for more details .\r\n\r\nBest regards,\r\nSam', '816-941-8420', 'Transform Your Sales with a Custom E-commerce Website!', 'Hi, \r\n\r\nStruggling to reach more customers and boost your sales in the competitive online market?\r\n\r\nWithout a user-friendly and attractive e-commerce website, you might be missing out on significant opportunities to grow your business and enhance your brand visibility.\r\n\r\nAt OutsourceBPO, we create stunning, custom e-commerce websites designed to meet your unique business needs. Here\'s how we can help:\r\n\r\n- **Custom Design:** Reflects your brand’s identity.\r\n- **User-Friendly:** Easy navigation on all devices.\r\n- **Essential Features:** Secure checkout, customer accounts, and more.\r\n- **SEO & Marketing:** Optimized and integrated to drive sales.\r\n- **Ongoing Support:** Continuous maintenance and updates.\r\n- **Affordable Pricing:** Packages to fit your budget.\r\n\r\nLet’s schedule a free consultation to discuss your goals and how we can help you achieve them. Visit https://outsource-bpo.com/website/?jpsresidency.in for more details .\r\n\r\nBest regards,\r\nSam'),
(76, 1718432840, NULL, 'Phillis Curtis', 'curtis.phillis6@gmail.com', 'impatient about how A.I. can supercharge your business?\r\n\r\nTake our quiz and uncover personalized insights on leveraging A.I. for success. From automating tasks to enhancing customer experiences, look how A.I. can create a difference!\r\n\r\n\r\nhttps://bit.ly/4c8cnmJ', '', 'To the jpsresidency.in Owner!', 'enthusiastic not quite how A.I. can supercharge your business?\r\n\r\nTake our quiz and uncover personalized insights upon leveraging A.I. for success. From automating tasks to enhancing customer experiences, look how A.I. can create a difference!\r\n\r\n\r\nhttps://bit.ly/4c8cnmJ'),
(77, 1718582644, NULL, 'Amelia Brown', 'ameliabrown0325@gmail.com', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nAmelia\r\n\r\nUnsubscribe: https://removeme.click/yt/unsubscribe.php?d=jpsresidency.in', '6806747151', 'YouTube Promotion: Grow your subscribers by 700-1500 each month', 'Hi there,\r\n\r\nWe run a Youtube growth service, where we can increase your subscriber count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new subscribers each month.\r\n- Real, human subscribers who subscribe because they are interested in your channel/videos.\r\n- Safe: All actions are done, without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nIf you are interested then we can discuss further.\r\n\r\nKind Regards,\r\nAmelia\r\n\r\nUnsubscribe: https://removeme.click/yt/unsubscribe.php?d=jpsresidency.in'),
(79, 1718644138, NULL, 'Sandy', 'web.techdevelopment@outlook.com', 'Hi, This is Sandy, a website designer and developer. In 17 years of my career, I have worked on broad spectrum of technologies like PHP, WordPress, Codeigniter, Laravel, Opencart, Prestashop, Wix, Html, CSS, JavaScript, Drupal, Shopify, magento. I can help you in creating a new page, new design, resolving issues, upgrading website to latest version, making mobile responsive website, developing new functionality, 3D Model Integration, changing any existing functionality, API integration, Payment gateway or shipping functionality related work, Third-party apps integration in website, monthly maintenance, plugin or theme related work, improving design of all pages or uploading content.\r\n\r\nLet\'s chat on Web.techdevelopment@outlook.com \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '50938965', 'Website designer and developer', 'Hi, This is Sandy, a website designer and developer. In 17 years of my career, I have worked on broad spectrum of technologies like PHP, WordPress, Codeigniter, Laravel, Opencart, Prestashop, Wix, Html, CSS, JavaScript, Drupal, Shopify, magento. I can help you in creating a new page, new design, resolving issues, upgrading website to latest version, making mobile responsive website, developing new functionality, 3D Model Integration, changing any existing functionality, API integration, Payment gateway or shipping functionality related work, Third-party apps integration in website, monthly maintenance, plugin or theme related work, improving design of all pages or uploading content.\r\n\r\nLet\'s chat on Web.techdevelopment@outlook.com \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(80, 1718681173, NULL, 'Mike Peacock\r\n', 'peterhauddy@gmail.com', 'https://no-site.com', '83139337488', 'Whitehat SEO for jpsresidency.in', 'Howdy \r\n \r\nI have just checked  jpsresidency.in for its SEO metrics and saw that your website could use a boost. \r\n \r\nWe will increase your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.co/unbeatable-seo/ \r\n \r\nRegards \r\nMike Peacock\r\n \r\nDigital X SEO Experts \r\nhttps://www.digital-x-press.co/whatsapp-us/'),
(81, 1718683371, NULL, 'The Ecom King', 'info@theecomking.com', '\r\n8 years of experience put into 1 video. Here is literally everything you need to know to achieve your first million dollars with Dropshipping in 2024.\r\n\r\nwatch it now: https://www.youtube.com/watch?v=nT8luUsO4SU\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe\r\nhttps://marketersmentor.com/unsubscribe/\r\n', '192482192', '[Secret 1]The Best Way To Start Dropshipping Now To Make $1Million!', '\r\n8 years of experience put into 1 video. Here is literally everything you need to know to achieve your first million dollars with Dropshipping in 2024.\r\n\r\nwatch it now: https://www.youtube.com/watch?v=nT8luUsO4SU\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe\r\nhttps://marketersmentor.com/unsubscribe/\r\n'),
(82, 1718690825, NULL, 'John', 'romeo.tincher@yahoo.com', 'If you are reading this message, That means my marketing is working. I can make your ad message reach 5 million sites in the same manner for just $50. It\'s the most affordable way to market your business or services. Contact me by email virgo.t3@gmail.com or skype me at live:.cid.dbb061d1dcb9127a', '0362 1139204', 'Dear jpsresidency.in Webmaster.', 'If you are reading this message, That means my marketing is working. I can make your ad message reach 5 million sites in the same manner for just $50. It\'s the most affordable way to market your business or services. Contact me by email virgo.t3@gmail.com or skype me at live:.cid.dbb061d1dcb9127a'),
(83, 1718702070, NULL, 'Abbie Hodgkinson', 'hodgkinson.abbie@gmail.com', 'Hi there\r\n\r\nBrace yourself! A life-changing opportunity is on the horizon.\r\n\r\nUnveil the remarkable secret hidden in Jeff Bezos\' Amazon empire – a secret that grants you a stream of free traffic and remarkable Amazon commissions!\r\n\r\nWHY AMZ AUTOMATOR IS UNMATCHED:\r\n[+] Free Traffic: Unlock a hidden Amazon Prime traffic source.\r\n[+] Significant Commissions: Earn up to $293.47 per day with ease.\r\n[+] Easy Setup: No complex or costly setups required.\r\n\r\nRAVE REVIEWS:\r\n[Abbie] \"AMZ AUTOMATOR has transformed my Amazon commissions. It\'s truly revolutionary!\"\r\n\r\nHURRY – THIS OFFER IS TEMPORARY:\r\nThis exclusive Amazon Prime secret won\'t be available forever. Act quickly!\r\n\r\nCLICK HERE TO START EARNING =>>  https://cutt.ly/VetnxYXO\r\n\r\nTake action now. Secure your place among the successful today!\r\n\r\nWarm regards\r\nAbbie\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nNetherlands, NH, Amsterdam, 1032 Zg, Floraweg 78\r\nTo stop any further communication from us, please reply to this email...', '666532611', 'Discover the Amazon Prime Secret and Earn USD 293 a Day Instantly...', 'Hi there\r\n\r\nBrace yourself! A life-changing opportunity is on the horizon.\r\n\r\nUnveil the remarkable secret hidden in Jeff Bezos\' Amazon empire – a secret that grants you a stream of free traffic and remarkable Amazon commissions!\r\n\r\nWHY AMZ AUTOMATOR IS UNMATCHED:\r\n[+] Free Traffic: Unlock a hidden Amazon Prime traffic source.\r\n[+] Significant Commissions: Earn up to $293.47 per day with ease.\r\n[+] Easy Setup: No complex or costly setups required.\r\n\r\nRAVE REVIEWS:\r\n[Abbie] \"AMZ AUTOMATOR has transformed my Amazon commissions. It\'s truly revolutionary!\"\r\n\r\nHURRY – THIS OFFER IS TEMPORARY:\r\nThis exclusive Amazon Prime secret won\'t be available forever. Act quickly!\r\n\r\nCLICK HERE TO START EARNING =>>  https://cutt.ly/VetnxYXO\r\n\r\nTake action now. Secure your place among the successful today!\r\n\r\nRespectfully\r\nAbbie\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nNetherlands, NH, Amsterdam, 1032 Zg, Floraweg 78\r\nTo stop any further communication from us, please reply to this email...'),
(84, 1718723730, NULL, 'Consuelo Ordell', 'ordell.consuelo@hotmail.com', 'Hi\r\n\r\nUnlock the secret to earning over $300 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  https://cutt.ly/2eugVcxa\r\n\r\nSincerely\r\nConsuelo\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nIceland, NA, Holmavik, 510, Hafnarbraut 97\r\nTo stop any further communication from us, please reply to this email...', '4810000', 'Earn Over 300 USD per day...', 'Hi there\r\n\r\nUnlock the secret to earning over $300 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  https://cutt.ly/2eugVcxa\r\n\r\nKind regards\r\nConsuelo\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nIceland, NA, Holmavik, 510, Hafnarbraut 97\r\nTo stop any further communication from us, please reply to this email...'),
(85, 1718856194, NULL, 'Jon Lewis', 'info@marketersmentor.com', '\r\n8 years of experience put into 1 video. Here is literally everything you need to know to achieve your first million dollars with Dropshipping in 2024.\r\n\r\nwatch it now: https://www.youtube.com/watch?v=nT8luUsO4SU\r\n\r\nTalk soon!\r\nJon\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe\r\nhttps://marketersmentor.com/unsubscribe/\r\n', '7978513441', '[Secret 1]The Best Way To Start Dropshipping Now To Make $1Million!', '\r\n8 years of experience put into 1 video. Here is literally everything you need to know to achieve your first million dollars with Dropshipping in 2024.\r\n\r\nwatch it now: https://www.youtube.com/watch?v=nT8luUsO4SU\r\n\r\nTalk soon!\r\nJon\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe\r\nhttps://marketersmentor.com/unsubscribe/\r\n'),
(86, 1718866088, NULL, 'Jon Lewis', 'info@marketersmentor.com', '\r\nA step-by-step guide, A to Z, on how to create a profitable Dropshipping branded store from scratch in 2024 In this video, \r\nyou will learn everything you need to know to create a successful Branded store.\r\n\r\nI\'ll be showing you how to create a profitable Dropshipping store the right way in 2024 that will actually convert using fast suppliers whilst building a brand. \r\n\r\nThe Ecom king created this long step-by-step tutorial (6 hours+) because he wanted to give you every single possible step that you need to know, \r\nand all the information that you need as a newbie to start a successful Dropshipping business in 2024.\r\n\r\nHe is fed up with gurus selling courses charging thousands of dollars for this information.\r\n\r\nYou can Watch it for free: https://www.youtube.com/watch?v=KomCyocvwGE&t=42s\r\n\r\nTalk soon!\r\nJon\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe\r\nhttps://marketersmentor.com/unsubscribe\r\n', '882273056', '[Secret 2]Beginners Guide To Dropshipping In 2024 (6+ Hours)', '\r\nA step-by-step guide, A to Z, on how to create a profitable Dropshipping branded store from scratch in 2024 In this video, \r\nyou will learn everything you need to know to create a successful Branded store.\r\n\r\nI\'ll be showing you how to create a profitable Dropshipping store the right way in 2024 that will actually convert using fast suppliers whilst building a brand. \r\n\r\nThe Ecom king created this long step-by-step tutorial (6 hours+) because he wanted to give you every single possible step that you need to know, \r\nand all the information that you need as a newbie to start a successful Dropshipping business in 2024.\r\n\r\nHe is fed up with gurus selling courses charging thousands of dollars for this information.\r\n\r\nYou can Watch it for free: https://www.youtube.com/watch?v=KomCyocvwGE&t=42s\r\n\r\nTalk soon!\r\nJon\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe\r\nhttps://marketersmentor.com/unsubscribe\r\n'),
(87, 1718894010, NULL, 'Mike Galbraith\r\n', 'mikeAlkandy@gmail.com', 'https://jpsresidency.in', '85543452975', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.co/join-affiliates/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Galbraith\r\n \r\nMonkey Digital \r\nhttps://www.monkeydigital.co/whatsapp-affiliates/'),
(88, 1718900543, NULL, 'Jorja Dundas', 'dundas.jorja@gmail.com', 'Hi there\r\n\r\nUnlock the secret to earning over $100 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  https://zeep.ly/xnBmP\r\n\r\nYours truly\r\nJorja\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nNetherlands, NB, Heesch, 5384 Bj, Hoogstraat 29\r\nTo stop any further communication from us, please reply to this email...', '617825298', 'Ready to Make 100 USD or More Every Single Day...', 'Hi\r\n\r\nUnlock the secret to earning over $100 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  https://zeep.ly/xnBmP\r\n\r\nWarm regards\r\nJorja\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nNetherlands, NB, Heesch, 5384 Bj, Hoogstraat 29\r\nTo stop any further communication from us, please reply to this email...'),
(89, 1718912207, NULL, 'Darryl Hume', 'darryl.hume25@hotmail.com', 'Hi there\r\n\r\nImagine a world where your passion fuels your income.\r\n\r\nWith our proven method, you can establish a thriving online business and enjoy the freedom to live as you wish.\r\n\r\nCurious to learn more? Click here to start your journey =>> https://cutt.ly/PeySPD0b\r\n\r\nYours truly\r\nDarryl\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nNetherlands, FR, Grou, 9001 Nm, De Skeakels 6\r\nTo stop any further communication from us, please reply to this email...', '677370349', 'Your Path to Financial Freedom: Build Your Online Empire...', 'Hi there\r\n\r\nImagine a world where your passion fuels your income.\r\n\r\nWith our proven method, you can establish a thriving online business and enjoy the freedom to live as you wish.\r\n\r\nCurious to learn more? Click here to start your journey =>> https://cutt.ly/PeySPD0b\r\n\r\nSincerely\r\nDarryl\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nNetherlands, FR, Grou, 9001 Nm, De Skeakels 6\r\nTo stop any further communication from us, please reply to this email...'),
(90, 1718926697, NULL, 'Natalie Chisholm', 'hello@socialbuzzzy.com', '\r\nHi there, I\'m Natalie from Social Growth Engine here to share. I\'ve uncovered an unbeatable solution for boosting your Instagram engagement and felt compelled to spread the word!\r\n\r\nSocial Growth Engine provides a phenomenal service that enhances your Instagram interaction. It\'s as simple as can be:\r\n\r\nDirect your efforts towards generating compelling content.\r\nAffordable at just $36/month.\r\nSafe and sound, result-oriented, and aligned with Instagram\'s guidelines.\r\nSeeing the outstanding outcomes firsthand, I\'m certain you\'ll see the same! Take your Instagram presence to new heights immediately: http://get.socialbuzzzy.com/instagram_booster\r\n\r\nTo your continued success,\r\nYour ally Natalie', '696611009', 'Instagram Engagement Boost', '\r\nHello, This is Natalie from Social Growth Engine reaching out. I\'ve uncovered an exceptional solution for boosting your Instagram presence and felt compelled to spread the word!\r\n\r\nSocial Growth Engine unveils a remarkable service that amplifies your Instagram interaction. It\'s a breeze:\r\n\r\nConcentrate on developing spectacular content.\r\nAffordable at barely $36/month.\r\nTrustworthy, highly effective, and aligned with Instagram\'s guidelines.\r\nSeeing the extraordinary outcomes firsthand, I\'m assured you\'ll enjoy the same! Take your Instagram presence to new heights now: http://get.socialbuzzzy.com/instagram_booster\r\n\r\nTo your continued success,\r\nNatalie at Social Growth Engine'),
(91, 1718941949, NULL, 'Carlosgoape', 'inet4747@outlook.com', '', '89965775921', 'Sales on Etsy, Amazon', '<a href=https://pint77.com> Pinterest advertising for the USA and English-speaking countries. Etsy, amazon, shopify, ebay</a>'),
(92, 1718949903, NULL, 'Vanita Crumley', 'crumley.vanita@gmail.com', 'Are you ready to crush the limits of what you think is possible for your business? If you’re thirsty for success or struggling to make your mark as an entrepreneur, it’s time to level up. \r\n\r\nCheck out this must-subscribe channel: https://www.youtube.com/watch?v=VmYYt1LD4cI&t\r\n\r\nDive into the world of AI and business like never before. This is where you’ll find game-changing insights and strategies to outwork and outthink the competition.\r\n\r\nDon’t procrastinate and don’t make excuses. Subscribe now and start the journey to transforming your business. The only one stopping you is you.\r\n\r\nStay hard,\r\nSecret Profits Club', '3569007970', 'Tired of wondering? jpsresidency.in could be doing so much better!', 'Are you ready to crush the limits of what you think is possible for your business? If you’re thirsty for success or struggling to make your mark as an entrepreneur, it’s time to level up. \r\n\r\nCheck out this must-subscribe channel: https://www.youtube.com/watch?v=VmYYt1LD4cI&t\r\n\r\nDive into the world of AI and business like never before. This is where you’ll find game-changing insights and strategies to outwork and outthink the competition.\r\n\r\nDon’t procrastinate and don’t make excuses. Subscribe now and start the journey to transforming your business. The only one stopping you is you.\r\n\r\nStay hard,\r\nSecret Profits Club'),
(93, 1718958778, NULL, 'Merlin Fry', 'merlin.fry@hotmail.com', 'Hi there\r\n\r\nGenerate effortless income of $531 per day with YouTube Channels in just 60 seconds! \r\n\r\nNo technical skills required, no video creation, and no need to be on camera. \r\n\r\nStart now  =>> https://cutt.ly/wetz8pIQ\r\n\r\nSincerely\r\nMerlin\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nAustralia, TAS, Lachlan, 7140, 78 Isaac Road\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '362044220', 'Earn $531 per Day With YouTube', 'Greetings\r\n\r\nGenerate effortless income of $531 per day with YouTube Channels in just 60 seconds! \r\n\r\nNo technical skills required, no video creation, and no need to be on camera. \r\n\r\nStart now  =>> https://cutt.ly/wetz8pIQ\r\n\r\nYours sincerely\r\nMerlin\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nAustralia, TAS, Lachlan, 7140, 78 Isaac Road\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(94, 1718962806, NULL, 'Connor Gwendolen', 'gwendolen.connor@outlook.com', 'Hi\r\n\r\nI hope this message finds you well. I wanted to ask if you are in need of any proxy services. \r\n\r\nWE OFFER:\r\n[-] High-anonymity private browsing from major web browsers\r\n[-] High-volume content posting from proxy-supporting automation tools\r\n[-] High-performance web crawling from custom systems\r\n\r\nSee more info here :  https://cutt.ly/teu4THTP\r\n\r\nBest regards\r\nConnor\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nUnited States, IL, Bensenville, 60106, 3658 Johnstown Road\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '8473887986', 'Interested in Advanced Proxy Solutions?', 'Hi\r\n\r\nI hope this message finds you well. I wanted to ask if you are in need of any proxy services. \r\n\r\nWE OFFER:\r\n[-] High-anonymity private browsing from major web browsers\r\n[-] High-volume content posting from proxy-supporting automation tools\r\n[-] High-performance web crawling from custom systems\r\n\r\nSee more info here :  https://cutt.ly/teu4THTP\r\n\r\nYours truly\r\nConnor\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nUnited States, IL, Bensenville, 60106, 3658 Johnstown Road\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(95, 1719040073, NULL, 'Michael Mccombs', 'manie.mccombs28@gmail.com', 'Hi ,\r\n\r\nBoost your website to first google page in ranking \r\n\r\nClick here to start ===> https://tinyurl.com/3htytd7h\r\n\r\nJoin our 1k+ happy cutomers !\r\n\r\n', '4166738152', 'boost your Website in the first google page', 'Hi ,\r\n\r\nBoost your website to first google page in ranking \r\n\r\nClick here to start ===> https://tinyurl.com/3htytd7h\r\n\r\nJoin our 1k+ happy cutomers !\r\n\r\n');
INSERT INTO `pm_message` (`id`, `add_date`, `edit_date`, `name`, `email`, `address`, `phone`, `subject`, `msg`) VALUES
(96, 1719090500, NULL, 'Michaelodozy', 'jorjaprerauer4536@icloud.com', 'https://accstores.com', '84235471547', 'Forge New Frontiers: Partner with Accstores.com to Shape the Future of Accessibility!', 'Transform your online presence with https://Accstores.com, the leading platform for web accessibility solutions. Our comprehensive tools and services empower businesses to create inclusive and user-friendly websites for all. From accessibility audits to personalized consultations, we offer tailored solutions to meet your needs. Join us in shaping a more accessible digital landscape. Explore https://Accstores.com today and make your website accessible to everyone. \r\n \r\n \r\nclick Through The Following Website Page \r\nhttps://Accstores.com'),
(97, 1719107203, NULL, 'Quincy Vidal', 'quincy.vidal@gmail.com', 'hi, just a warning,\r\n\r\nIt\'s been a while, but I recently stumbled upon something online about jpsresidency.in and immediately needed to message you guys to validate this nonsense. \r\n\r\nIt looks like there\'s some unfavorable news that could be harmful to your reputation. \r\nBeing aware of how quickly rumors can spiral and wishing not you to be caught off guard, I felt the need to inform you.\r\n\r\nHere\'s where I came across the info:\r\n\r\nhttps://ibit.ly/miw5k		\r\n\r\nI hope it\'s all a misunderstanding, but I thought it best you should know!\r\n\r\nWishing you all the best,\r\nQuincy\r\n', '968-289-7987', 'Came across something alarming about jpsresidency.in - should i be worried', 'Hey hey!\r\n\r\nIt\'s been a while, but I came across a very negative opinon online about jpsresidency.in and felt it necessary to reach out to validate this article. \r\n\r\nIt seems like there\'s some negative press that could be harmful to your reputation. \r\nUnderstanding how easily stories can get out of hand and wishing not you to be taken by surprise, I felt the need to notify you.\r\n\r\nHere\'s where I found the info:\r\n\r\nhttps://ibit.ly/0CaSi		\r\n\r\nI hope it\'s all a mix-up, but it seemed prudent you should know!\r\n\r\nWishing you all the best,\r\nQuincy\r\n'),
(98, 1719235480, NULL, 'Jon Lewis', 'info@marketersmentor.com', '\r\nThe Ecom King will walk you through his personal Facebook and Instagram ad strategy in 2024 for Ecom & Dropshipping. \r\n\r\nHe will cover some quick tips on what he have seen over the last 8+ years marketing in this space. he will also walk you through step by step everything from testing campaigns to scaling campaigns so you can go from $0-$1000/Day In 48 Hours.\r\n\r\nWatch it here: https://www.youtube.com/watch?v=bdVdb1jJ4b4\r\n\r\nTalk soon!\r\nJon\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe\r\nhttps://marketersmentor.com/unsubscribe/\r\n', '7745322388', '[Secret 3]Facebook Ads 2024 FREE COURSE For Beginners', '\r\nThe Ecom King will walk you through his personal Facebook and Instagram ad strategy in 2024 for Ecom & Dropshipping. \r\n\r\nHe will cover some quick tips on what he have seen over the last 8+ years marketing in this space. he will also walk you through step by step everything from testing campaigns to scaling campaigns so you can go from $0-$1000/Day In 48 Hours.\r\n\r\nWatch it here: https://www.youtube.com/watch?v=bdVdb1jJ4b4\r\n\r\nTalk soon!\r\nJon\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe\r\nhttps://marketersmentor.com/unsubscribe/\r\n'),
(99, 1719263054, NULL, 'Joanna Riggs', 'joannariggs278@gmail.com', 'Hi,\r\n\r\nI just visited jpsresidency.in and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur prices start from just $195.\r\n\r\nLet me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna', '4600498', 'Video Promotion for your website', 'Hi,\r\n\r\nI just visited jpsresidency.in and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur videos cost just $195 for a 30 second video ($239 for 60 seconds) and include a full script, voice-over and video.\r\n\r\nI can show you some previous videos we\'ve done if you want me to send some over. Let me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna'),
(100, 1719297514, NULL, 'Michaelodozy', 'josettebent@icloud.com', 'https://accstores.com', '85863447443', 'Innovate for Impact: Join Accstores.com in Creating Accessible Online Communities!', 'Discover https://Accstores.com, the ultimate destination for seamless web accessibility solutions. We provide a comprehensive range of tools and services designed to make the internet accessible to all users, regardless of ability. Join us in our mission to create a more inclusive online experience for everyone. Explore https://Accstores.com today and unlock the power of accessibility. \r\n \r\n \r\njust Click The Following Webpage \r\nhttps://Accstores.com'),
(101, 1719353161, NULL, 'Bob ', 'jimersonbob6@gmail.com', 'Hi, I did a free marketing video for your website, is this a good place to send it?\r\nPlease fill out your info here if so: https://freevideoservice.com/', '246631982', 'I did a free marketing video for you!', 'Hi, I did a free marketing video for your website, is this a good place to send it?\r\nPlease fill out your info here if so: https://freevideoservice.com/'),
(102, 1719408951, NULL, 'Brigette Cunniff', 'brigette.cunniff@icloud.com', 'Howdy!\r\n\r\nWe haven\'t spoken in a while, but I just saw a slam piece online about jpsresidency.in and felt compelled to message you guys to disprove this review. \r\n\r\nIt looks like there\'s some unfavorable news that could be potentially damaging. \r\nKnowing how fast misinformation can spread and hoping not you to be taken by surprise, I felt the need to notify you.\r\n\r\nHere\'s where I came across the info:\r\n\r\nhttps://ibit.ly/xAQWf		\r\n\r\nI hope it\'s all a misunderstanding, but I thought it best you should know!\r\n\r\nBest wishes,\r\nBrigette\r\n', '377-17-1878', 'Came across something concerning about jpsresidency.in - urgent', 'hi there!\r\n\r\nIt\'s been some time, but I just saw a warning article online about jpsresidency.in and felt compelled to reach out to validate this nonsense. \r\n\r\nIt seems like there\'s some unfavorable news that could be detrimental. \r\nUnderstanding how fast misinformation can spread and hoping not you to be unprepared, I felt the need to warn you.\r\n\r\nHere\'s where I found the info:\r\n\r\nhttps://ibit.ly/-pA5j		\r\n\r\nI\'m hoping it\'s all a mix-up, but I thought it best you should know!\r\n\r\nAll the best to you,\r\nBrigette\r\n'),
(103, 1719411015, NULL, 'Jon Lewis', 'info@marketersmentor.com', '\r\nHey,\r\n\r\nWhat if we told you that it was possible to find winning products by being able to analyze them with dozens of statistics, \r\n\r\ninspiration for your future creatives and do competitive analysis to make sure you are the best on your product, all in one platform?\r\n\r\nYou don\'t need to accumulate subscriptions on different platforms and break the bank to find your next winning products!\r\n\r\nLet me introduce you to **MINEA**, your new companion on the road to success!\r\n\r\n- An all-in-one tool that allows you to see and analyze all the ads on Facebook, TikTok, Pinterest!\r\n- An endless source of creative inspiration that will be the key to your next ad success!\r\n- Access to must-have metrics that will help you make the best decisions on your product choices!\r\n- Access to the largest e-commerce community, with expert e-commerce speakers to provide feedback and help you through the challenges!\r\n\r\nWith tens of thousands of ads analyzed every day, Minea is the largest e-commerce database, \r\nwhich will allow you to obtain all the key information to reach your goals. \r\n\r\nYour competitors have already tested hundreds of products and creatives, learn from their mistakes and get ahead of them!\r\n\r\nThe good news is that I have a great offer for you!\r\n\r\nTake advantage of a 20% discount on your subscription for 3 MONTHS, and take advantage of the thousands of ads and stores analyzed every day, \r\n\r\nby clicking here : https://marketersmentor.com/adspy\r\n\r\nBoost your e-commerce business with a powerful, reliable and complete tool adapted to the search of products on all social networks without geographical barriers.\r\n\r\nTalk soon!\r\nJon\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe\r\nhttps://marketersmentor.com/unsubscribe/\r\n', '', '[Secret 4]The best tool for finding winning products!', '\r\nHey,\r\n\r\nWhat if we told you that it was possible to find winning products by being able to analyze them with dozens of statistics, \r\n\r\ninspiration for your future creatives and do competitive analysis to make sure you are the best on your product, all in one platform?\r\n\r\nYou don\'t need to accumulate subscriptions on different platforms and break the bank to find your next winning products!\r\n\r\nLet me introduce you to **MINEA**, your new companion on the road to success!\r\n\r\n- An all-in-one tool that allows you to see and analyze all the ads on Facebook, TikTok, Pinterest!\r\n- An endless source of creative inspiration that will be the key to your next ad success!\r\n- Access to must-have metrics that will help you make the best decisions on your product choices!\r\n- Access to the largest e-commerce community, with expert e-commerce speakers to provide feedback and help you through the challenges!\r\n\r\nWith tens of thousands of ads analyzed every day, Minea is the largest e-commerce database, \r\nwhich will allow you to obtain all the key information to reach your goals. \r\n\r\nYour competitors have already tested hundreds of products and creatives, learn from their mistakes and get ahead of them!\r\n\r\nThe good news is that I have a great offer for you!\r\n\r\nTake advantage of a 20% discount on your subscription for 3 MONTHS, and take advantage of the thousands of ads and stores analyzed every day, \r\n\r\nby clicking here : https://marketersmentor.com/adspy\r\n\r\nBoost your e-commerce business with a powerful, reliable and complete tool adapted to the search of products on all social networks without geographical barriers.\r\n\r\nTalk soon!\r\nJon\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe\r\nhttps://marketersmentor.com/unsubscribe/\r\n'),
(104, 1719420513, NULL, 'Adi Wan', 'viralbusinesscampaign@outlook.com', 'Are you looking to create videos to boost your brand’s visibility and engagement, increase revenue, capture your audience\'s attention, and showcase complex ideas in a simplified way? I can help you achieve this by creating both live-action and animated explainer videos. My services include comprehensive pre-production planning, script writing, graphic design, storyboarding, video editing, animation, sound effects, background music, voiceovers, and footage compilation. If you\'re interested in communicating your business model, products, or services to your audience with a compelling explainer video.\r\n\r\nPlease reach out to me at ViralBusinessCampaign@outlook.com and share your goals.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '6024202733', 'Explainer Video Creation', 'Are you looking to create videos to boost your brand’s visibility and engagement, increase revenue, capture your audience\'s attention, and showcase complex ideas in a simplified way? I can help you achieve this by creating both live-action and animated explainer videos. My services include comprehensive pre-production planning, script writing, graphic design, storyboarding, video editing, animation, sound effects, background music, voiceovers, and footage compilation. If you\'re interested in communicating your business model, products, or services to your audience with a compelling explainer video.\r\n\r\nPlease reach out to me at ViralBusinessCampaign@outlook.com and share your goals.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(105, 1719427280, NULL, 'Mike Dean\r\n', 'mikeAlkandy@gmail.com', 'https://jpsresidency.in', '82638433157', 'NEW: Semrush Backlinks', 'Hi \r\n \r\nThis is Mike Dean\r\n \r\nLet me show you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nThe new Semrush Backlinks, which will make your jpsresidency.in SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.co/semrush-backlinks/ \r\n \r\nCheap and effective \r\nTry it anytime soon \r\n \r\nRegards \r\nMike Dean\r\n https://www.strictlydigital.co/whatsapp-us/'),
(106, 1719444347, NULL, ' Cuni', 'india.cuni@gmail.com', 'Discover how our Premier Agency can dramatically increase your chances of finding your dream Caribbean property. \r\nWe specialize in unlocking access to prime locations and exclusive deals not available elsewhere. \r\nWe have Access to additional Inventory, would you like us to consider adding you to our buyers list then Call Now ☎️ +16615757328\r\nSecure your spot for a personalized journey and make informed decisions.\r\nAvailability is limited – reply now to claim your advantage in the Caribbean Property Real Estate Market. Are you in?\r\n\r\nAlso check out out Premium Caribbean Coastal Properties here: https://stopify.co/5H20W2.link\r\n\r\n������️ Discover Paradise Before It Vanishes! Limited Time Offer, Until September 15. 2024! ������️\r\nYour very own private island is just a Call away—seize the opportunity!\r\nLet us help you . Call Now ☎️ +16612646516  \r\n\r\nRegards,\r\nMark\r\n\r\nYou can also emaiil us at: ccremarketing21@gmail.com\r\nIf you want to promote any product.\r\n\r\n\r\nAlso check out out Premium Caribbean Coastal Properties here: https://stopify.co/5H20W2.link\r\n\r\n������️ Discover Paradise Before It Vanishes! Limited Time Offer, Until May 15. 2024! ������️\r\nYour very own private island is just a Call away—seize the opportunity!\r\nLet us help you . Call Now ☎️ +16612646516  \r\n\r\nRegards,\r\nMark\r\n\r\nYou can also emaiil us at: ccremarketing21@gmail.com\r\nIf you want to promote any product.\r\n', '+16612646516', 'Dear jpsresidency.in Webmaster!', 'Discover how our Premier Agency can dramatically increase your chances of finding your dream Caribbean property. \r\nWe specialize in unlocking access to prime locations and exclusive deals not available elsewhere. \r\nWe have Access to additional Inventory, would you like us to consider adding you to our buyers list then Call Now ☎️ +16615757328\r\nSecure your spot for a personalized journey and make informed decisions.\r\nAvailability is limited – reply now to claim your advantage in the Caribbean Property Real Estate Market. Are you in?\r\n\r\nAlso check out out Premium Caribbean Coastal Properties here: https://stopify.co/5H20W2.link\r\n\r\n������️ Discover Paradise Before It Vanishes! Limited Time Offer, Until September 15. 2024! ������️\r\nYour very own private island is just a Call away—seize the opportunity!\r\nLet us help you . Call Now ☎️ +16612646516  \r\n\r\nRegards,\r\nMark\r\n\r\nYou can also emaiil us at: ccremarketing21@gmail.com\r\nIf you want to promote any product.\r\n\r\n\r\nAlso check out out Premium Caribbean Coastal Properties here: https://stopify.co/5H20W2.link\r\n\r\n������️ Discover Paradise Before It Vanishes! Limited Time Offer, Until May 15. 2024! ������️\r\nYour very own private island is just a Call away—seize the opportunity!\r\nLet us help you . Call Now ☎️ +16612646516  \r\n\r\nRegards,\r\nMark\r\n\r\nYou can also emaiil us at: ccremarketing21@gmail.com\r\nIf you want to promote any product.\r\n'),
(107, 1719613633, NULL, 'Kristie', 'mawson.kristie@yahoo.com', 'Looking for a Great Job? \r\n75% of resumes aren’t even seen by hiring managers!  \r\n \r\nIs your resume keyword rich and ATS ready? \r\n \r\nFind out with our FREE consultation with a certified, trained resume writing. \r\nSend your resume to resumes@razoredgeresumes.com to make sure you are not missing out!\r\n  \r\nSend your resume now and we will reach out to you to speak at your convenience.\r\n\r\nQuick and easy. Start today!', '3067842936', 'Dear jpsresidency.in Webmaster!', 'Looking for a Great Job? \r\n75% of resumes aren’t even seen by hiring managers!  \r\n \r\nIs your resume keyword rich and ATS ready? \r\n \r\nFind out with our FREE consultation with a certified, trained resume writing. \r\nSend your resume to resumes@razoredgeresumes.com to make sure you are not missing out!\r\n  \r\nSend your resume now and we will reach out to you to speak at your convenience.\r\n\r\nQuick and easy. Start today!'),
(108, 1719668194, NULL, 'Michael Teel', 'michael.teel@outlook.com', 'Greetings\r\n\r\nI hope this message finds you well. I wanted to ask if you are in need of any proxy services. \r\n\r\nWE OFFER:\r\n[-] High-anonymity private browsing from major web browsers\r\n[-] High-volume content posting from proxy-supporting automation tools\r\n[-] High-performance web crawling from custom systems\r\n\r\nSee more info here :  https://cutt.ly/teu4THTP\r\n\r\nYours truly\r\nMichael\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nUnited States, MD, Washington, 20004, 4206 Doe Meadow Drive\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '3015395119', 'Interested in Advanced Proxy Solutions?', 'Hi there\r\n\r\nI hope this message finds you well. I wanted to ask if you are in need of any proxy services. \r\n\r\nWE OFFER:\r\n[-] High-anonymity private browsing from major web browsers\r\n[-] High-volume content posting from proxy-supporting automation tools\r\n[-] High-performance web crawling from custom systems\r\n\r\nSee more info here :  https://cutt.ly/teu4THTP\r\n\r\nRegards\r\nMichael\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nUnited States, MD, Washington, 20004, 4206 Doe Meadow Drive\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(109, 1719670466, NULL, 'Sonja Davies', 'sonja.davies15@outlook.com', 'Greetings\r\n\r\nGenerate effortless income of $531 per day with YouTube Channels in just 60 seconds! \r\n\r\nNo technical skills required, no video creation, and no need to be on camera. \r\n\r\nStart now  =>> https://cutt.ly/wetz8pIQ\r\n\r\nYours sincerely\r\nSonja\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nAustria, BURGENLAND, Thann, 2631, Lebzeltergasse 23\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '', 'Earn $531 per Day With YouTube', 'Hello\r\n\r\nGenerate effortless income of $531 per day with YouTube Channels in just 60 seconds! \r\n\r\nNo technical skills required, no video creation, and no need to be on camera. \r\n\r\nStart now  =>> https://cutt.ly/wetz8pIQ\r\n\r\nRespectfully\r\nSonja\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nAustria, BURGENLAND, Thann, 2631, Lebzeltergasse 23\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(110, 1719735833, NULL, 'Phil Stewart', 'noreplyhere@aol.com', 'Hey, looking to boost your ad game? Picture your message hitting website contact forms worldwide, grabbing attention from potential customers everywhere! Starting at just under a hundred bucks my budget-friendly packages are designed to make an impact. Drop me an email now to discuss how you can get more leads and sales now!\r\n\r\nP. Stewart\r\nEmail: kcl45q@submitmaster.xyz\r\nSkype: form-blasting', '342-123-4456', '??', 'Hey there, ready to take your ad game to the next level? Imagine your message popping up in website contact forms all over the world, reaching heaps of potential customers! Starting at just under $100, our affordable packages pack a punch. Shoot me an email now to chat more about getting your brand out there! Let\'s make some noise together!\r\n\r\nPhil Stewart\r\nEmail: nyhgbg@submitmaster.xyz\r\nSkype: form-blasting'),
(111, 1719806034, NULL, 'Sam', 'hireonline556600@outlook.com', 'My name is Sam. I provide data entry services for just $1,000 USD per month (160 hours). If you prefer an hourly basis, the cost is $8 USD per hour. I can handle any computer-related task that is repetitive in nature, such as entering data into software, collecting data, bookkeeping, copy-paste work, uploading content to websites, and following your business processes. I can also transcribe handwritten or scanned documents, update and maintain customer databases, cleanse and validate data, enter survey results and feedback, manage and update inventories, process invoices and receipts, create and update spreadsheets, input product details into e-commerce platforms, digitize paper records, manage email lists and contact information, perform data mining and extraction from websites, compile and organize data from various sources. You can outsource your entire business process to me, where tasks can be done remotely using a computer. I can learn your process and work on any software accordingly. \r\n\r\nReach out to me at Hireonline556600@outlook.com if you have any requirements and we can take a quick call.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '7765965021', 'Data Entry Task', 'My name is Sam. I provide data entry services for just $1,000 USD per month (160 hours). If you prefer an hourly basis, the cost is $8 USD per hour. I can handle any computer-related task that is repetitive in nature, such as entering data into software, collecting data, bookkeeping, copy-paste work, uploading content to websites, and following your business processes. I can also transcribe handwritten or scanned documents, update and maintain customer databases, cleanse and validate data, enter survey results and feedback, manage and update inventories, process invoices and receipts, create and update spreadsheets, input product details into e-commerce platforms, digitize paper records, manage email lists and contact information, perform data mining and extraction from websites, compile and organize data from various sources. You can outsource your entire business process to me, where tasks can be done remotely using a computer. I can learn your process and work on any software accordingly. \r\n\r\nReach out to me at Hireonline556600@outlook.com if you have any requirements and we can take a quick call.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(112, 1719900167, NULL, 'Kelley', 'nickle.kelley@msn.com', 'Are you still looking at getting your website done/ completed? Contact e.solus@gmail.com', '030 80 52 59', 'Hello jpsresidency.in Owner.', 'Are you still looking at getting your website done/ completed? Contact e.solus@gmail.com'),
(113, 1719901164, NULL, 'Shenna Krueger', 'shenna.krueger@gmail.com', 'Hello there\r\n\r\nWe provide real human traffic with a revenue share option.\r\n\r\nAre you striving for long-term growth and looking forward to boost your ad revenue? Pristine Traffic offers premium traffic solutions that bring engaged, high-quality  traffic to your site easily. Our traffic helps you:\r\n- Enhance user engagement and retention\r\n- Maximize your ad earnings\r\n- Ensure consistent, profitable traffic flow\r\n\r\nAchieve sustainable growth like many other successful websites with our tailored solutions. Seize the opportunity to elevate your ad revenue and secure long-term success.\r\n\r\nLearn more about Pristine Traffic and get started today: https://bit.ly/prstraffic\r\n\r\nThank you\r\n\r\nNicole Martinez\r\nPristine Traffic\r\nnichole@pristinetraffic.com\r\nWhatsApp: +18143008897\r\nhttps://bit.ly/prstraffic', '0018143008897', 'Experience the Power of Targeted Traffic', 'Greetings jpsresidency.in team\r\n\r\nWe provide real human traffic with a revenue share option.\r\n\r\nReady to see a significant increase in your ad revenue? At Pristine Traffic, we provide high-quality users that delivers proven results. Our satisfied clients have experienced:\r\n- Remarkable increases in user engagement\r\n- Substantial growth in ad revenue\r\n- Enhanced site performance and profitability\r\n\r\nSee the difference for yourself—don’t just take our word for it! Watch your revenue soar as our premium traffic solutions bring real, engaged  traffic to your site.\r\n\r\nDiscover how Pristine Traffic can transform your site’s performance today: https://bit.ly/prstraffic\r\n\r\nKind regards\r\n\r\nContact: hello@pristinetraffic.com\r\nVisit: https://bit.ly/prstraffic\r\nWhatsApp: +18143008897'),
(114, 1719917505, NULL, 'Adalberto Ferrari', 'ferrari.adalberto@googlemail.com', 'Hi there\r\n\r\nGenerate effortless income of $531 per day with YouTube Channels in just 60 seconds! \r\n\r\nNo technical skills required, no video creation, and no need to be on camera. \r\n\r\nStart now  =>> https://cutt.ly/wetz8pIQ\r\n\r\nSincerely\r\nAdalberto\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nItaly, CN, Villanova Mondovi, 12089, Via Moiariello 118\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '3521408109', 'Earn $531 per Day With YouTube', 'Greetings\r\n\r\nGenerate effortless income of $531 per day with YouTube Channels in just 60 seconds! \r\n\r\nNo technical skills required, no video creation, and no need to be on camera. \r\n\r\nStart now  =>> https://cutt.ly/wetz8pIQ\r\n\r\nYours truly\r\nAdalberto\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nItaly, CN, Villanova Mondovi, 12089, Via Moiariello 118\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(115, 1719917527, NULL, 'Julie Doak', 'julie.doak15@gmail.com', 'Greetings\r\n\r\nI hope this message finds you well. I wanted to ask if you are in need of any proxy services. \r\n\r\nWE OFFER:\r\n[-] High-anonymity private browsing from major web browsers\r\n[-] High-volume content posting from proxy-supporting automation tools\r\n[-] High-performance web crawling from custom systems\r\n\r\nSee more info here :  https://cutt.ly/teu4THTP\r\n\r\nSincerely\r\nJulie\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nPoland, NA, Warszawa, 04-241, Ul. Rafii 27\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '798763214', 'Interested in Advanced Proxy Solutions?', 'Hi\r\n\r\nI hope this message finds you well. I wanted to ask if you are in need of any proxy services. \r\n\r\nWE OFFER:\r\n[-] High-anonymity private browsing from major web browsers\r\n[-] High-volume content posting from proxy-supporting automation tools\r\n[-] High-performance web crawling from custom systems\r\n\r\nSee more info here :  https://cutt.ly/teu4THTP\r\n\r\nSincerely\r\nJulie\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nPoland, NA, Warszawa, 04-241, Ul. Rafii 27\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(116, 1719943337, NULL, 'Marcos Carreno', 'marcos.carreno@yahoo.com', 'Hello\r\n\r\nIt\'s been a while since our last conversation, but I came across a slam piece online about jpsresidency.in and thought it important to email you guys to disprove this nonsense. \r\n\r\nIt looks like there\'s some unfavorable news that could be harmful to your reputation. \r\nUnderstanding how quickly rumors can spiral and hoping not you to be taken by surprise, I felt the need to notify you.\r\n\r\nHere\'s where I came across the info:\r\n\r\nhttps://ibit.ly/LcWsT		\r\n\r\nMy hope is it\'s all a misunderstanding, but it seemed prudent you should know!\r\n\r\nBest wishes,\r\nMarcos\r\n', '533-98-8743', 'Saw something worrying about jpsresidency.in - should i be worried', 'hi!\r\n\r\nIt\'s been some time, but I just saw a very negative opinon online about jpsresidency.in and thought it important to message you guys to disprove this article. \r\n\r\nIt appears like there\'s some unfavorable news that could be detrimental. \r\nKnowing how easily stories can get out of hand and hoping not you to be taken by surprise, I thought it best to warn you.\r\n\r\nHere\'s where I found the info:\r\n\r\nhttps://ibit.ly/iNAJW		\r\n\r\nI\'m hoping it\'s all a mix-up, but I thought it best you should know!\r\n\r\nBest wishes,\r\nMarcos\r\n'),
(117, 1719972330, NULL, 'SEObyAxy', 'seosubmitter@mail.com', 'Good day\r\n\r\nMy name is Axy, and I am excited to introduce you to our comprehensive SEO services designed to boost your online visibility and drive more traffic to your website.\r\n\r\nWe understand that in today\'s competitive digital landscape, having a well-optimized website is crucial for success. \r\n\r\nThat\'s why we are offering a FREE Off-Page & On-Page SEO Audit to help you get started on the right foot.\r\n\r\nHERE\'S WHAT WE CAN DO FOR YOU:\r\n[+] Comprehensive Site Analysis: We will thoroughly check your website and create a customized Full SEO Campaign tailored to your specific needs.\r\n[+] Keyword Research: Our team will identify the most effective keywords to promote for each individual page of your site.\r\n[+] Page-by-Page Evaluation: We will review every page of your website and provide recommendations on the best package to buy and necessary changes to improve your SEO score.\r\n[+] Customized SEO Strategies: If you want to target specific keywords, we will guide you on where to make changes for optimal results.\r\n[+] Personalized SEO Packages: We can create SEO promotion packages customized to your needs or based on your budget.\r\n\r\nWe are committed to helping you achieve your business goals by enhancing your online presence. \r\n\r\nPlease feel free to reach out if you have any questions or if you are ready to take advantage of our free SEO audit.\r\n\r\n==>> https://cutt.ly/6ep8Wy06\r\n\r\nThank you for your time, and we look forward to working with you to make your website stand out!\r\n\r\nThanks,\r\nSEObyAxy\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\n\r\nGreat Britain, NA, Marsett, Dl8 6ds, 73 Ross Road\r\nTo stop any further communication from us, please reply to this email with subject: Unsubscribe jpsresidency.in', '7961344425', 'Free SEO Audit - Elevate Your Online Presence for jpsresidency.in', 'Hi\r\n\r\nMy name is Axy, and I am excited to introduce you to our comprehensive SEO services designed to boost your online visibility and drive more traffic to your website.\r\n\r\nWe understand that in today\'s competitive digital landscape, having a well-optimized website is crucial for success. \r\n\r\nThat\'s why we are offering a FREE Off-Page & On-Page SEO Audit to help you get started on the right foot.\r\n\r\nHERE\'S WHAT WE CAN DO FOR YOU:\r\n[+] Comprehensive Site Analysis: We will thoroughly check your website and create a customized Full SEO Campaign tailored to your specific needs.\r\n[+] Keyword Research: Our team will identify the most effective keywords to promote for each individual page of your site.\r\n[+] Page-by-Page Evaluation: We will review every page of your website and provide recommendations on the best package to buy and necessary changes to improve your SEO score.\r\n[+] Customized SEO Strategies: If you want to target specific keywords, we will guide you on where to make changes for optimal results.\r\n[+] Personalized SEO Packages: We can create SEO promotion packages customized to your needs or based on your budget.\r\n\r\nWe are committed to helping you achieve your business goals by enhancing your online presence. \r\n\r\nPlease feel free to reach out if you have any questions or if you are ready to take advantage of our free SEO audit.\r\n\r\n==>> https://cutt.ly/6ep8Wy06\r\n\r\nThank you for your time, and we look forward to working with you to make your website stand out!\r\n\r\nThanks,\r\nSEObyAxy\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\n\r\nGreat Britain, NA, Marsett, Dl8 6ds, 73 Ross Road\r\nTo stop any further communication from us, please reply to this email with subject: Unsubscribe jpsresidency.in'),
(118, 1719983562, NULL, 'Emily Jones', 'emilyjones2250@gmail.com', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nEmily\r\n\r\nUnsubscribe: https://removeme.click/yt/unsubscribe.php?d=jpsresidency.in', '7820159928', 'Grow your Youtube channel', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\nWe go beyond just subscriber numbers. We focus on attracting viewers genuinely interested in your niche, leading to long-term engagement with your content. Our approach leverages optimization, community building, and content promotion for sustainable growth, not quick fixes. Additionally, a dedicated team analyzes your channel and creates a personalized plan to unlock your full potential, all without relying on bots.\r\n\r\nOur packages start from just $60 (USD) per month.\r\n\r\nWould this be of interest?\r\n\r\nKind Regards,\r\nEmily'),
(119, 1720007579, NULL, 'Justin Gorham', 'gorham.justin@yahoo.com', 'Hi there\r\n\r\nSay goodbye to manual video editing! \r\n\r\nGenerate engaging videos for TikTok, Instagram, and YouTube in seconds.\r\n\r\nDon\'t miss our Early Bird Offer! Visit now for exclusive bonuses and discounts.\r\n\r\nSEE HERE => https://zeep.ly/GlVgW\r\n\r\nYours sincerely\r\nJustin\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nAustria, BURGENLAND, Grosssulz, 8401, Gralla 44\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '', 'Earn 100$ per day with...', 'Hi\r\n\r\nSay goodbye to manual video editing! \r\n\r\nGenerate engaging videos for TikTok, Instagram, and YouTube in seconds.\r\n\r\nDon\'t miss our Early Bird Offer! Visit now for exclusive bonuses and discounts.\r\n\r\nSEE HERE => https://zeep.ly/GlVgW\r\n\r\nRegards\r\nJustin\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nAustria, BURGENLAND, Grosssulz, 8401, Gralla 44\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(120, 1720014076, NULL, 'David', 'hildegard.compton@gmail.com', 'You may wish to save this email for future reference.  There is no need to unsubscribe because this is a one-time email from Se-REM.  This announcement is a public service for a not-for-profit program that has saved and restored lives shattered by abuse and trauma.\r\n  \r\nHave you heard of Se-REM? (Self effective - Rapid Eye Movement). Many people don\'t know that REM brain activity dramatically improves the processing of traumatic emotion. It creates peace and empowers the listener. Se-REM is an advanced version of EMDR therapy. It is more powerful because it combines elements of 6 different therapies, EMDR, hypnosis, mindfulness, Gestalt child within work, music therapy, and Awe therapy,(connecting profoundly with nature).\r\n \r\nIt has helped thousands of people overcome PTSD, and anxiety. But it is also helpful in a great many situations, loss of any kind, grief, phobias and even marital counseling. The mission statement is \"Trauma relief at as close to free as possible\". This program downloads to a smart phone or computer and can be used in an office or at home. Read about it, hear samples, and download at: Se-REM.com. Once you own the program, you are encouraged to give it away to others who will benefit. I provide free consultation to all who use the program. \r\nSe-REM.com has a 95% rating on Trustpilot and is in use in 33 countries.\r\n \r\nIf you would like to know more you can watch a UK Podcast at: https://lockedupliving.podbean.com', '88 690 51 71', 'To the jpsresidency.in Webmaster!', 'You may wish to save this email for future reference.  There is no need to unsubscribe because this is a one-time email from Se-REM.  This announcement is a public service for a not-for-profit program that has saved and restored lives shattered by abuse and trauma.\r\n  \r\nHave you heard of Se-REM? (Self effective - Rapid Eye Movement). Many people don\'t know that REM brain activity dramatically improves the processing of traumatic emotion. It creates peace and empowers the listener. Se-REM is an advanced version of EMDR therapy. It is more powerful because it combines elements of 6 different therapies, EMDR, hypnosis, mindfulness, Gestalt child within work, music therapy, and Awe therapy,(connecting profoundly with nature).\r\n \r\nIt has helped thousands of people overcome PTSD, and anxiety. But it is also helpful in a great many situations, loss of any kind, grief, phobias and even marital counseling. The mission statement is \"Trauma relief at as close to free as possible\". This program downloads to a smart phone or computer and can be used in an office or at home. Read about it, hear samples, and download at: Se-REM.com. Once you own the program, you are encouraged to give it away to others who will benefit. I provide free consultation to all who use the program. \r\nSe-REM.com has a 95% rating on Trustpilot and is in use in 33 countries.\r\n \r\nIf you would like to know more you can watch a UK Podcast at: https://lockedupliving.podbean.com'),
(121, 1720087882, NULL, 'Korey Bussau', 'korey.bussau@gmail.com', 'hi, just a warning,\r\n\r\nIt\'s been a while, but I just read a warning article online about jpsresidency.in and thought it was important to message you guys to disprove this nonsense. \r\n\r\nIt looks like there\'s some negative press that could be harmful to your reputation. \r\nUnderstanding how fast misinformation can spread and hoping not you to be caught off guard, I thought it best to warn you.\r\n\r\nHere\'s the source of the info:\r\n\r\nhttps://ibit.ly/QhEeh		\r\n\r\nI hope it\'s all a misunderstanding, but I believed it necessary you should know!\r\n\r\nWishing you all the best,\r\nKorey\r\n', '338-792-3248', 'Saw something alarming about jpsresidency.in - urgent', 'Quick heads up\r\n\r\nIt\'s been a while since our last conversation, but I just saw a slam piece online about jpsresidency.in and thought it important to reach out to validate this review. \r\n\r\nIt appears like there\'s some unfavorable news that could be detrimental. \r\nBeing aware of how easily stories can get out of hand and hoping not you to be caught off guard, I decided to inform you.\r\n\r\nHere\'s where I found the info:\r\n\r\nhttps://ibit.ly/Rez2-		\r\n\r\nMy hope is it\'s all a misunderstanding, but I believed it necessary you should know!\r\n\r\nBest wishes,\r\nKorey\r\n'),
(122, 1720108593, NULL, 'Jefferey Stretton', 'jefferey.stretton@gmail.com', '**Boost Your Rankings with Whitehat SEO Guest Posts & Premium Link Building!**\r\n\r\nLeverage premium SEO solutions with our 5-star Fiverr Pro gig!\r\n\r\n** Our Services:\r\n\r\n- Premium Guest Posting Services\r\n- High Authority, High Traffic Links\r\n- Proven Results, Post Google\'s Most Recent Updates\r\n\r\n-- Perks:\r\n\r\n- Boost Your Search Engine Rankings\r\n- Enhance Visibility and Organic Traffic\r\n- Excellent 5-Star Reviews\r\n\r\nDon’t miss out on this opportunity to improve your SEO strategy with a trusted expert.\r\n\r\n+ Check out our Fiverr Pro Service! https://go.fiverr.com/visit/?bta=570412&brand=fiverrcpa&landingPage=https252F%252Fwww.fiverr.com252Fdo-end-game-seo-backlinks-for-google-top-rankings', '3257668872', 'Leverage Expert SEO Services to Enhance Your SEO Plan', '**Boost Your SEO with High-Quality Guest Posts & High DA Link Building!**\r\n\r\nLeverage expert SEO services with our 5-star Fiverr Pro gig!\r\n\r\n>> What We Offer:\r\n\r\n- Whitehat Content Links\r\n- High DA, High Traffic Link Building\r\n- Effective Strategies, Following Google\'s Recent Updates\r\n\r\n>> Why Choose Us:\r\n\r\n- Boost Your Organic Rankings\r\n- Enhance Visibility and Search Engine Traffic\r\n- Excellent 5-Star Reviews\r\n\r\nTake advantage of this opportunity to improve your SEO plan with a expert professional.\r\n\r\n++ Check out our Fiverr Pro Service! https://go.fiverr.com/visit/?bta=570412&brand=fp&landingPage=https252F%252Fwww.fiverr.com252Fboost-your-ranking-with-high-quality-backlinks'),
(123, 1720108770, NULL, 'Earle Cable', 'earle.cable@gmail.com', 'Hello\r\n\r\nEarn over 300$ per day with World\'s First Video & Audio Email Marketing App\r\n\r\nIntroducing our groundbreaking Video & Audio Email Marketing App—the first of its kind—that not only enhances your email campaigns but also offers you the opportunity to earn over $300 per day!\r\n\r\nWHY CHOOSE VIDMAILS AI?\r\n- Enhanced Engagement: Utilize video and audio to create captivating campaigns that resonate with your audience.\r\n- Boosted Deliverability: Ensure your messages stand out in crowded inboxes, maximizing your reach.\r\n- Real-Time Results: Gain actionable insights to optimize your campaigns and increase your earnings.\r\n\r\nGo To Product Site => https://cutt.ly/gedlUn9z\r\n\r\nTake the leap towards maximizing your income and transforming your marketing efforts today.\r\n\r\nKind regards\r\nEarle\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nUnited States, IN, Indianapolis, 46256, 1998 Sugarfoot Lane\r\nTo stop any further communication from us, please reply to this email...', '7654423564', 'Earn over 300$ per day with World\'s First Video & Audio Email Marketing App...', 'Hi there\r\n\r\nEarn over 300$ per day with World\'s First Video & Audio Email Marketing App\r\n\r\nIntroducing our groundbreaking Video & Audio Email Marketing App—the first of its kind—that not only enhances your email campaigns but also offers you the opportunity to earn over $300 per day!\r\n\r\nWHY CHOOSE VIDMAILS AI?\r\n- Enhanced Engagement: Utilize video and audio to create captivating campaigns that resonate with your audience.\r\n- Boosted Deliverability: Ensure your messages stand out in crowded inboxes, maximizing your reach.\r\n- Real-Time Results: Gain actionable insights to optimize your campaigns and increase your earnings.\r\n\r\nGo To Product Site => https://cutt.ly/gedlUn9z\r\n\r\nTake the leap towards maximizing your income and transforming your marketing efforts today.\r\n\r\nRegards\r\nEarle\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nUnited States, IN, Indianapolis, 46256, 1998 Sugarfoot Lane\r\nTo stop any further communication from us, please reply to this email...'),
(124, 1720135213, NULL, 'Holley Chave', 'holley.chave@googlemail.com', 'Hello\r\n\r\nIntroducing WPFunnels: the ultimate sales funnel builder for WordPress and WooCommerce. \r\nEasily create high-converting landing pages, sales funnels, and checkout flows without any prior experience.\r\n\r\nDiscover the benefits of WPFunnels:\r\n- Visual drag-and-drop editor for seamless funnel creation\r\n- Boost sales with order bump and one-click upsell/downsell offers\r\n- Choose from optimized templates and track performance with detailed analytics\r\n\r\nReady to supercharge your sales? Try WPFunnels today and watch your conversions soar! => https://cutt.ly/oedl8ekC\r\n\r\nKind regards\r\nHolley\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nDenmark, REGION MIDTJYLLAND, Orum Djurs, 8586, Hindsholmvej 50\r\nTo stop any further communication from us, please reply to this email...', '25619562', 'Boost Your Sales with WPFunnels for WordPress...', 'Good day\r\n\r\nIntroducing WPFunnels: the ultimate sales funnel builder for WordPress and WooCommerce. \r\nEasily create high-converting landing pages, sales funnels, and checkout flows without any prior experience.\r\n\r\nDiscover the benefits of WPFunnels:\r\n- Visual drag-and-drop editor for seamless funnel creation\r\n- Boost sales with order bump and one-click upsell/downsell offers\r\n- Choose from optimized templates and track performance with detailed analytics\r\n\r\nReady to supercharge your sales? Try WPFunnels today and watch your conversions soar! => https://cutt.ly/oedl8ekC\r\n\r\nBest regards\r\nHolley\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nDenmark, REGION MIDTJYLLAND, Orum Djurs, 8586, Hindsholmvej 50\r\nTo stop any further communication from us, please reply to this email...'),
(125, 1720162720, NULL, 'Albertdgdgfweelp', 'vfssffssdfdsffffd@gmail.com', 'https://intznak.site/goroskop/xrumer/1/', '87613224127', 'Personal free prediction from Blind Saint Sergius', 'This horoscope prediction is still a top secret! Blind clairvoyant Saint Sergius from Ternopil, Ukraine - decided that his gift should not be wasted, so he remotely helps everyone anyone who wants it. People live in different parts of the country and the world, and not always they have the opportunity to visit the clairvoyant in person. Saint Sergius only needs a small amount of information to read to read your destiny imprint and give you a diagnostic session. It\'s completely free of charge! \r\nIt is impossible to discuss horoscope with friends and relatives, because so YOU change the true the course of things, violating your destined path. \r\n \r\n \r\n<a href=\"https://intznak.site/goroskop/xrumer/1/\">Get horoscope on our website! Click on link</a> -   https://intznak.site/goroskop/xrumer/1/ \r\n<meta http-equiv=\'refresh\' content=\'0; url=https://intznak.site/goroskop/xrumer/1/\'> \r\n<a href=\"https://intznak.site/goroskop/xrumer/1/\">Get horoscope on our website! Click on link</a> -   https://intznak.site/goroskop/xrumer/1/');
INSERT INTO `pm_message` (`id`, `add_date`, `edit_date`, `name`, `email`, `address`, `phone`, `subject`, `msg`) VALUES
(126, 1720169992, NULL, 'Ines Lett', 'lett.ines@gmail.com', 'Greetings\r\n\r\nCreate viral TikTok, Instagram, YouTube, and Facebook videos instantly with AI VideoReel Builder. \r\n\r\nJust enter a keyword, and it handles the rest - editing, voiceovers, and more. \r\n\r\nGrab yours now before prices rise =>> https://cutt.ly/EeaDDPBw\r\n\r\nKind regards\r\nInes\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nGreat Britain, NA, Upleadon, Gl18 5jq, 48 Helland Bridge\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '7709052430', 'Monetize Your Short Videos with AI VideoReel Builder...', 'Hi\r\n\r\nCreate viral TikTok, Instagram, YouTube, and Facebook videos instantly with AI VideoReel Builder. \r\n\r\nJust enter a keyword, and it handles the rest - editing, voiceovers, and more. \r\n\r\nGrab yours now before prices rise =>> https://cutt.ly/EeaDDPBw\r\n\r\nWarm regards\r\nInes\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nGreat Britain, NA, Upleadon, Gl18 5jq, 48 Helland Bridge\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(127, 1720170069, NULL, 'Louann Nance', 'louann.nance38@googlemail.com', 'Hello\r\n\r\nAre you ready to take your affiliate marketing to the next level? \r\n\r\nIntroducing the 100% DONE-FOR-YOU \"AI\" Traffic & Commission System! Whether you promote offers on WarriorPlus, Clickbank, Digistore24, or any other affiliate network, this system has everything you need to succeed.\r\n\r\nWith this revolutionary system, you\'ll have access to:\r\n - AI-powered traffic generation that drives targeted visitors to your offers.\r\n - A proven commission system designed to maximize your earnings.\r\n - Complete automation so you can focus on scaling your profits.\r\n\r\nStop struggling with outdated methods and start leveraging the power of AI to achieve consistent affiliate success!\r\n\r\nClick here to transform your affiliate marketing results now: https://cutt.ly/pesRBco8\r\n\r\nYours sincerely\r\nLouann\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nFrance, CENTRE, Blois, 41000, 20 Avenue De L\'amandier\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '209567747', 'Your All-in-One Solution for Affiliate Marketing Success!', 'Hello\r\n\r\nAre you ready to take your affiliate marketing to the next level? \r\n\r\nIntroducing the 100% DONE-FOR-YOU \"AI\" Traffic & Commission System! Whether you promote offers on WarriorPlus, Clickbank, Digistore24, or any other affiliate network, this system has everything you need to succeed.\r\n\r\nWith this revolutionary system, you\'ll have access to:\r\n - AI-powered traffic generation that drives targeted visitors to your offers.\r\n - A proven commission system designed to maximize your earnings.\r\n - Complete automation so you can focus on scaling your profits.\r\n\r\nStop struggling with outdated methods and start leveraging the power of AI to achieve consistent affiliate success!\r\n\r\nClick here to transform your affiliate marketing results now: https://cutt.ly/pesRBco8\r\n\r\nKind regards\r\nLouann\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nFrance, CENTRE, Blois, 41000, 20 Avenue De L\'amandier\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(128, 1720170078, NULL, 'Brigette Ramsay', 'ramsay.brigette@msn.com', 'Greetings\r\n\r\nAre you ready to turn your dream into reality? \r\n\r\nWith this system, you can build a profitable online business and live life on your own terms. \r\n\r\nFind out how you can do this by clicking on => https://cutt.ly/Retz32tl\r\n\r\nBest regards\r\nBrigette\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nPoland, NA, Wojkowice Koscielne, 42-510, Ul. Dabrowska 91\r\nTo stop any further communication from us, please reply to this email...', '692221724', 'Unlock Your Potential: Building a Lucrative Online Business on Your Own Terms', 'Good day\r\n\r\nAre you ready to turn your dream into reality? \r\n\r\nWith this system, you can build a profitable online business and live life on your own terms. \r\n\r\nFind out how you can do this by clicking on => https://cutt.ly/Retz32tl\r\n\r\nRespectfully\r\nBrigette\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nPoland, NA, Wojkowice Koscielne, 42-510, Ul. Dabrowska 91\r\nTo stop any further communication from us, please reply to this email...'),
(129, 1720205313, NULL, 'Dave', 'ruiz.savannah25@hotmail.com', 'Dear,\r\n\r\nI hope this message finds you well. I am writing to introduce you to M.I.H, the premier digital marketing agency dedicated to transforming businesses and driving sales growth. Here’s how partnering with M.I.H can benefit your business:\r\n\r\n1. **Targeted SEO Strategies:** Enhance your online visibility and attract high-quality traffic to your website, leading to increased conversion rates.\r\n2. **Effective Social Media Campaigns:** Engage with your audience on various platforms, boosting brand awareness and customer loyalty.\r\n3. **Compelling Content Marketing:** Develop valuable content that resonates with your audience, establishing your brand as an industry leader.\r\n4. **Precision PPC Advertising:** Implement cost-effective PPC campaigns to reach potential customers actively searching for your products or services.\r\n5. **Data-Driven Insights:** Utilize advanced analytics to optimize marketing strategies continuously, ensuring maximum ROI.\r\n\r\nM.I.H\'s tailored approach and expertise across various industries ensure we understand and meet your unique business goals. Let’s discuss how M.I.H can help elevate your brand and drive sales growth.\r\n\r\nPlease get in touch at marketingagency.mih@gmail.com to schedule a consultation. I look forward to exploring opportunities for collaboration.\r\n\r\nBest regards,\r\nM.I.H Marketing Agency\r\nmarketingagency.mih@gmail.com\r\nhttps://mihmarketingagency.com/', '(08) 8319 8903', 'Elevate Your Sales with M.I.H Digital Marketing Expertise', 'Dear,\r\n\r\nI hope this message finds you well. I am writing to introduce you to M.I.H, the premier digital marketing agency dedicated to transforming businesses and driving sales growth. Here’s how partnering with M.I.H can benefit your business:\r\n\r\n1. **Targeted SEO Strategies:** Enhance your online visibility and attract high-quality traffic to your website, leading to increased conversion rates.\r\n2. **Effective Social Media Campaigns:** Engage with your audience on various platforms, boosting brand awareness and customer loyalty.\r\n3. **Compelling Content Marketing:** Develop valuable content that resonates with your audience, establishing your brand as an industry leader.\r\n4. **Precision PPC Advertising:** Implement cost-effective PPC campaigns to reach potential customers actively searching for your products or services.\r\n5. **Data-Driven Insights:** Utilize advanced analytics to optimize marketing strategies continuously, ensuring maximum ROI.\r\n\r\nM.I.H\'s tailored approach and expertise across various industries ensure we understand and meet your unique business goals. Let’s discuss how M.I.H can help elevate your brand and drive sales growth.\r\n\r\nPlease get in touch at marketingagency.mih@gmail.com to schedule a consultation. I look forward to exploring opportunities for collaboration.\r\n\r\nBest regards,\r\nM.I.H Marketing Agency\r\nmarketingagency.mih@gmail.com\r\nhttps://mihmarketingagency.com/'),
(130, 1720231564, NULL, 'Mike Kingsman\r\n', 'mikehauddy@gmail.com', 'https://no-site.com', '87395185371', 'Increase rankings with a SEO friendly web design', 'Hi there \r\nI just checked jpsresidency.in ranks and am sorry to bring this up, but it lacks in many areas. \r\n \r\nUnfortunately, building a bunch of links won\'t solve the issue in this case, and a more comprehensive strategy is required. Google has undergone significant changes over the past year, making it nearly impossible to compete for favorable rankings without a well-designed website. \r\n \r\nWe recommend a search engine-friendly website layout to resolve all issues and propel your site to the top. \r\n \r\nYou can check more details here: https://www.speed-seo.org/web-design/ \r\n \r\nThanks for your consideration \r\nMike Kingsman\r\nSpeed Designs \r\nhttps://www.speed-seo.org/whatsapp-us/'),
(131, 1720235134, NULL, 'Amandagraibe2', 'amandauphole2@gmail.com', '', '84117234621', 'अरे यार, प्यार के लिए तैयार हैं?', 'अरे डार्लिंग, बाहर घूमना चाहते हैं? -  https://is.gd/2xVU7z?vienire'),
(132, 1720235757, NULL, 'Willard Caraballo', 'caraballo.willard@gmail.com', 'Greetings there\r\n\r\nWe provide real human traffic with a revenue share option.\r\n\r\nLooking to easily boost your site’s ad revenue? At Pristine Traffic, we specialize in providing premium traffic solutions designed to connect you with engaged, high-quality audience. Our targeted traffic can help you:\r\n- Increase user engagement and retention\r\n- Maximize your ad earnings\r\n- Achieve sustainable growth with consistent, profitable traffic\r\n\r\nBe one of the successful websites transforming their performance with our tailored traffic solutions. Seize the opportunity to elevate your site’s revenue potential!\r\n\r\nVisit Pristine Traffic today to learn more and get started: https://bit.ly/prstraffic\r\n\r\nBest\r\n\r\nContact: hello@pristinetraffic.com\r\nVisit: https://bit.ly/prstraffic\r\nWhatsApp: +18143008897', '0018143008897', 'Boost User Engagement and Ad Revenue', 'Hi there\r\n\r\nWe provide real human traffic with a revenue share option.\r\n\r\nFor a limited time, amplify your website’s ad revenue with Pristine Traffic’s premium solutions! We provide high-quality traffic that connects you with engaged  users effortlessly, helping you:\r\n- Increase user engagement\r\n- Maximize ad earnings\r\n- Achieve consistent, profitable growth\r\n\r\nDon’t miss this exclusive offer to transform your site’s performance today. Don’t wait—elevate your ad revenue with Pristine Traffic’s proven solutions.\r\n\r\nClaim your offer and get started now: https://bit.ly/prstraffic\r\n\r\nRegards\r\n\r\nNicole Martinez\r\nPristine Traffic\r\nnichole@pristinetraffic.com\r\nWhatsApp: +18143008897\r\nhttps://bit.ly/prstraffic'),
(133, 1720246937, NULL, 'Lashawn Schleinitz', 'schleinitz.lashawn@msn.com', 'Hey there! ������ Unlock a world of entertainment with our exclusive IPTV offer!\r\n\r\nUnlock access to over 20,000 live TV Channels, VODs, EPG, & PPV Events, \r\n\r\nStream from anywhere on your all devices\r\n\r\nGet Your Free Trial ----> https://saveoncable.online', '3761279935', '������ Say Goodbye to Cable Bills  !', 'Hey there! ������ Unlock a world of entertainment with our exclusive IPTV offer!\r\n\r\nUnlock access to over 20,000 live TV Channels, VODs, EPG, & PPV Events, \r\n\r\nStream from anywhere on your all devices\r\n\r\nGet Your Free Trial ----> https://saveoncable.online'),
(134, 1720294430, NULL, 'Fidelia Cilley', 'fidelia.cilley@gmail.com', 'Hi\r\n\r\nUnlock the secret to earning over $100 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  t.ly/9EOQv\r\n\r\nYours sincerely\r\nFidelia\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nUnited States, MI, Marquette, 49855, 1740 Railroad Street\r\nTo stop any further communication from us, please reply to this email...', '9062028027', 'Learn How to Earn Up to $100 Per Day...', 'Good day\r\n\r\nUnlock the secret to earning over $100 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  t.ly/9EOQv\r\n\r\nRegards\r\nFidelia\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nUnited States, MI, Marquette, 49855, 1740 Railroad Street\r\nTo stop any further communication from us, please reply to this email...'),
(135, 1720391456, NULL, 'Matthew Williams', 'futurosalesco@gmail.com', 'Hello,\r\n\r\nBoost your social media presence with our collection of 35,000 engaging Reels. Crafted for attention and engagement, these Reels are perfect for all major platforms.\r\n\r\nReady to elevate your social media game? Cliick here: https://thedigitalagency.site/reels.\r\n\r\nBest regards,\r\n\r\nMatthew Williams  \r\nPresident, AgencyFuse\r\n', '472277549', 'Boost Your Social Media with 35,000 Engaging Reels', 'Hello,\r\n\r\nBoost your social media presence with our collection of 35,000 engaging Reels. Crafted for attention and engagement, these Reels are perfect for all major platforms.\r\n\r\nReady to elevate your social media game? Cliick here: https://thedigitalagency.site/reels.\r\n\r\nBest regards,\r\n\r\nMatthew Williams  \r\nPresident, AgencyFuse\r\n'),
(136, 1720453235, NULL, 'David', 'lanny.downs@gmail.com', 'Are you still looking at getting your website\'s SEO done? Contact Now intrug@gmail.com', '(03) 9026 8594', 'Dear jpsresidency.in Owner!', 'Are you still looking at getting your website\'s SEO done? Contact Now intrug@gmail.com'),
(137, 1720508492, NULL, 'Rosaline Borovansky', 'rosaline.borovansky@gmail.com', 'Quick heads up\r\n\r\nIt\'s been a while since our last conversation, but I just saw a very negative opinon online about jpsresidency.in and felt it necessary to email you guys to disprove this nonsense. \r\n\r\nIt looks like there\'s some rumors circulating that could be harmful to your reputation. \r\nKnowing how easily stories can get out of hand and wishing not you to be caught off guard, I thought it best to warn you.\r\n\r\nHere\'s the source of the info:\r\n\r\nhttps://ibit.ly/LAltB		\r\n\r\nI hope it\'s all a simple confusion, but I believed it necessary you should know!\r\n\r\nBest wishes,\r\nRosaline\r\n', '48-487-3929', 'Saw something alarming about jpsresidency.in - should I be concerned?', 'Hey hey!\r\n\r\nWe haven\'t spoken in a while, but I just saw an article online about jpsresidency.in and felt compelled to reach out to validate this review. \r\n\r\nIt looks like there\'s some unfavorable news that could be detrimental. \r\nKnowing how easily stories can get out of hand and not wanting you to be caught off guard, I decided to notify you.\r\n\r\nHere\'s where I found the info:\r\n\r\nhttps://ibit.ly/QkXCc		\r\n\r\nI hope it\'s all a mix-up, but it seemed prudent you should know!\r\n\r\nAll the best to you,\r\nRosaline\r\n'),
(138, 1720557515, NULL, 'Neil', 'contentwriting011994@outlook.com', 'Hi, This is Neil. I have more than 12 years of experience in content writing. I checked your website jpsresidency.in, and I have extensive experience in your industry. \r\n\r\nI can help you with high-quality content for blogs, articles, and website content, all crafted with no AI involvement. I can also assist with keyword and topic research to enhance your SEO strategy. Additionally, I can provide you with a detailed report on content quality. You can pay me after the completion of your work. \r\n\r\nPlease send me an email at Contentwriting011994@outlook.com\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '4059907523', 'Content Writing Service', 'Hi, This is Neil. I have more than 12 years of experience in content writing. I checked your website jpsresidency.in, and I have extensive experience in your industry. \r\n\r\nI can help you with high-quality content for blogs, articles, and website content, all crafted with no AI involvement. I can also assist with keyword and topic research to enhance your SEO strategy. Additionally, I can provide you with a detailed report on content quality. You can pay me after the completion of your work. \r\n\r\nPlease send me an email at Contentwriting011994@outlook.com\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(139, 1720595715, NULL, 'Reddynlr', 'segif18200@shirulo.com', 'https://t.me/backlink_master', '84391794273', 'speed index tires', 'Hello. I\'m sorry for the trouble. Please do not consider this informational message as spam. Perhaps it will be important for you! \r\nWe want to provide service to speed up sites indexing \r\nOur service accelerates the indexation of site pages or incoming links in the Google search engine. It can be particularly useful for indexing new sites or updating existing ones, changing link structures, or adding new content. With our service, Google will index your site much faster, leading to higher positions in search results and increased site traffic. We utilize mobile Google-bot to index the links specified in the task, significantly increasing the likelihood of your resource or link being indexed. Factors that may reduce indexing chances include duplicated content, a high number of external links, a domain marked as spammy by Google, HTTP errors on the site: (404, 500), pages blocked from indexing in robots.txt or via meta tags in HTML code, or in the .htaccess file. \r\n \r\nWhat is site indexing \r\n \r\nSite indexing refers to the process of adding information about a site or its pages to search engine databases, performed by search engine bots. If a site is indexed, it can appear in search results on Google, Yahoo, Yandex, Rambler, and other search engines. Only indexed sites can appear in search results. Indexing site pages or incoming links can be time-consuming and not always straightforward. Our service expedites the indexation of backlinks and website pages, reducing waiting time. You avoid the hassle of setting up and launching the Google Indexing API, which doesn\'t allow submitting a large number of pages for indexing simultaneously. \r\n \r\nGuarantees that your links and website will be indexed in Google \r\n \r\nWe guarantee that all the links specified in the task will be clicked by a mobile Google bot. However, we cannot ensure a 100% probability of your links or sites being indexed, as it is beyond our control and capabilities. Your resources will likely be indexed by Google with high probability. \r\n \r\nWe will send a report upon completion of the work. \r\n \r\nIf you are interested in this offer, please contact us. https://t.me/backlink_master'),
(140, 1720611133, NULL, 'CompanyRegistar.org', 'judy.salomons51@googlemail.com', 'Hi \r\n\r\nI see your online property is only listed in 9 out of 2398 directories\r\n\r\nThis will severely impact your page rank, the higher amount of directories your company is listed in, globally or locally, the more back links you have and the higher you rank in Bing, Yahoo, Google. \r\n\r\nNever has it been easier to promote your domain jpsresidency.in\r\n\r\nJust a few inputs and our system willl do the rest. \r\n\r\nNo more struggling about CAPTCHAs, manual link building or email verification.\r\n\r\nWeve automed all that we could have to make submitting your website a breeze.\r\n\r\nSee your domain on the first page.\r\n\r\nWe will submit your website to numerous directories and give you a detailed report on the status of each submission. Although we have automated the submission process to a large extent, some of the submissions may require manual approval which could cause a slight delay. \r\n\r\nMaking your life easier \r\n\r\nhttps://jpsresidency.in.CompanyRegistar.org', '9632876014', 'Your online property jpsresidency.in is listed in only a few directories.', 'Hi \r\n\r\nI see your site is only listed in 9 out of 2459 directories\r\n\r\nThis will substantially impact your page rank, the more directories your company is listed in, globally or locally, the greater your back links you have and the better you rank in Google, Yahoo, Bing. \r\n\r\nIt has never been easier to promote your website jpsresidency.in\r\n\r\nJust a few inputs and our program willl do the rest. \r\n\r\nNo more struggling about CAPTCHAs, manual link building or email verification.\r\n\r\nWe have automed everything that we possibly could to make submitting your domain a breeze.\r\n\r\nSee your site on the first page.\r\n\r\nWe will list your site to numerous directories and give you a detailed report on the status of each listing. Although we have created an automated system to a large extent, some of the listings may require manual mail validation which could cause a slight delay. \r\n\r\nMaking your life simpler \r\n\r\nhttps://jpsresidency.in.CompanyRegistar.org'),
(141, 1720614261, NULL, 'Yaakov Nissim', 'operations@outsourcebridge.com', 'Hey, I\'ve a made a 2min video for your company so you can save more than 50% on payroll by hiring the top 5% of overseas talent, can I send it here?', '732-470-0363', 'Quick question', 'Hey, I\'ve a made a 2min video for your company so you can save more than 50% on payroll by hiring the top 5% of overseas talent, can I send it here?'),
(142, 1720627410, NULL, 'Joanna Riggs', 'joannariggs278@gmail.com', 'Hi,\r\n\r\nI just visited jpsresidency.in and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur prices start from just $195.\r\n\r\nLet me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna\r\n\r\nUnsubscribe: https://removeme.click/ev/unsubscribe.php?d=jpsresidency.in', '7802375708', 'Explainer Video for jpsresidency.in?', 'Hi,\r\n\r\nI just visited jpsresidency.in and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nWe have produced over 500 videos to date and work with both non-animated and animated formats:\r\n\r\nNon-animated example:\r\nhttps://www.youtube.com/watch?v=bA2DyChM4Oc\r\n\r\nAnimated example:\r\nhttps://www.youtube.com/watch?v=JG33_MgGjfc\r\n\r\nOur videos cost just $195 for a 30 second video ($239 for 60 seconds) and include a full script, voice-over and video.\r\n\r\nRegards,\r\nJoanna\r\n\r\nUnsubscribe: https://removeme.click/ev/unsubscribe.php?d=jpsresidency.in'),
(143, 1720639168, NULL, 'Sara Smith', 'ss@247globals.com', '\r\nDear CEO/Managing Partner,\r\n\r\nIncrease leads and sales effortlessly with our custom video sales letters or explainer videos. \r\nGet started with our calculator at https://tinyurl.com/vidoecalc and enjoy 20% off with code \'promo20\'.\r\n\r\n\r\n\r\nBest Regards, \r\nSara Smith\r\n\r\nMTC Global Services\r\nMobile: + 44 7951 024 991 \r\nPhone: +44 203 984 8086\r\nAI Video Calc: https://tinyurl.com/vidoecalc\r\n\r\nP.S. For a limited time, we\'re offering a discount to new clients with promo code \"promo20\". Don\'t miss out!\r\n\r\n\r\nDon’t need Cutting-Edge AI & Technology Knowledge & Skills Opt-Out Here https://247globals.com/optout/\r\nSuite 207 Devonshire House, Manor Way, Herts, England, WD6 1QQ\r\n\r\n\r\n', '+ 44  203 984 8086', 'Have You Seen Your Video Content!', '\r\nDear CEO/Managing Partner,\r\n\r\nIncrease leads and sales effortlessly with our custom video sales letters or explainer videos. \r\nGet started with our calculator at https://tinyurl.com/vidoecalc and enjoy 20% off with code \'promo20\'.\r\n\r\n\r\n\r\nBest Regards, \r\nSara Smith\r\n\r\nMTC Global Services\r\nMobile: + 44 7951 024 991 \r\nPhone: +44 203 984 8086\r\nAI Video Calc: https://tinyurl.com/vidoecalc\r\n\r\nP.S. For a limited time, we\'re offering a discount to new clients with promo code \"promo20\". Don\'t miss out!\r\n\r\n\r\nDon’t need Cutting-Edge AI & Technology Knowledge & Skills Opt-Out Here https://247globals.com/optout/\r\nSuite 207 Devonshire House, Manor Way, Herts, England, WD6 1QQ\r\n\r\n\r\n'),
(144, 1720641530, NULL, 'Danyl Garon', 'garon.emory@msn.com', 'Dear Sir /Madam\r\n\r\nAs I see that you do not have many positive reviews on Google Maps, which means that you will not be able to get new customers, But the good news today is that I can increase your google map ranking so you can have more exposure and get more customers this also\r\n\r\nGetting google maps reviews from your customers has always been a beneficial exercise for business, but today its importance is even greater. Let\'s attract new customers by making your business in the first Google search results, 72% of customers will take action only after reading a positive online review.\r\n\r\nIf you are Intrested please click this link to start: https://tinyurl.com/2x44w7y4\r\n\r\n\r\n\r\nRegards \r\nDanyl', '638417271', '5 stares Google Maps Reviews', 'Dear Sir /Madam\r\n\r\nAs I see that you do not have many positive reviews on Google Maps, which means that you will not be able to get new customers, But the good news today is that I can increase your google map ranking so you can have more exposure and get more customers this also\r\n\r\nGetting google maps reviews from your customers has always been a beneficial exercise for business, but today its importance is even greater. Let\'s attract new customers by making your business in the first Google search results, 72% of customers will take action only after reading a positive online review.\r\n\r\nIf you are Intrested please click this link to start: https://tinyurl.com/2x44w7y4\r\n\r\n\r\n\r\nRegards \r\nDanyl'),
(145, 1720679714, NULL, 'Thomastof', 'no_replyclen2000@gmail.com', 'https://0daymusic.org', '85488627411', '0DAY-Music', 'Hello, \r\n \r\nPrivate FTP FLAC/Mp3/Clips 1990-2024. \r\nNew Club/Electro/Trance/Techno/Hardstyle/Hardcore/Lento Violento/ \r\nItalodance/Eurodance/Hands Up music: https://0daymusic.org/rasti.php?ka_rasti=-DE- \r\nList albums: https://0daymusic.org/FTPtxt/ \r\n0-DAY scene releases daily. \r\nSorted section by date / genre. \r\n \r\nRegards \r\n \r\nRichard S.'),
(146, 1720698667, NULL, 'Malorie Fallon', 'malorie.fallon@gmail.com', 'Hey hey!\r\n\r\nIt has been quite some time, but I just read something online about jpsresidency.in and felt compelled to reach out to confirm this article. \r\n\r\nIt looks like there\'s some rumors circulating that could be harmful to your reputation. \r\nUnderstanding how easily stories can get out of hand and wishing not you to be caught off guard, I felt the need to notify you.\r\n\r\nHere\'s where I found the info:\r\n\r\nhttps://ibit.ly/jrPEm		\r\n\r\nI\'m hoping it\'s all a misunderstanding, but it seemed prudent you should know!\r\n\r\nBest wishes,\r\nMalorie\r\n', '622-573-6857', 'Noticed something worrying about jpsresidency.in - should I be concerned?', '\r\n\r\nIt\'s been some time, but I recently stumbled upon a warning article online about jpsresidency.in and thought it was important to email you guys to confirm this article. \r\n\r\nIt seems like there\'s some negative press that could be harmful to your reputation. \r\nUnderstanding how easily stories can get out of hand and hoping not you to be taken by surprise, I decided to inform you.\r\n\r\nHere\'s where I found the info:\r\n\r\nhttps://ibit.ly/5iJmP		\r\n\r\nI hope it\'s all a simple confusion, but I believed it necessary you should know!\r\n\r\nAll the best to you,\r\nMalorie\r\n'),
(147, 1720714146, NULL, 'Nora Bock', 'bock.nora84@googlemail.com', 'Hello\r\n\r\nI hope this message finds you well. I wanted to ask if you are in need of any proxy services. \r\n\r\nWE OFFER:\r\n[-] High-anonymity private browsing from major web browsers\r\n[-] High-volume content posting from proxy-supporting automation tools\r\n[-] High-performance web crawling from custom systems\r\n\r\nSee more info here :  https://tinyurl.com/vvtwx9db\r\n\r\nThank you\r\nNora\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nBelgium, VOV, Ophasselt, 9500, Rue De Boneffe 425\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '493333568', 'Interested in Advanced Proxy Solutions?', 'Hi\r\n\r\nI hope this message finds you well. I wanted to ask if you are in need of any proxy services. \r\n\r\nWE OFFER:\r\n[-] High-anonymity private browsing from major web browsers\r\n[-] High-volume content posting from proxy-supporting automation tools\r\n[-] High-performance web crawling from custom systems\r\n\r\nSee more info here :  https://tinyurl.com/vvtwx9db\r\n\r\nYours sincerely\r\nNora\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nBelgium, VOV, Ophasselt, 9500, Rue De Boneffe 425\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(148, 1720714158, NULL, 'Joey Real', 'joey.real@hotmail.com', 'Good day\r\n\r\nGenerate effortless income of $531 per day with YouTube Channels in just 60 seconds! \r\n\r\nNo technical skills required, no video creation, and no need to be on camera. \r\n\r\nStart now  =>> https://tinyurl.com/yc889ufm\r\n\r\nSincerely\r\nJoey\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nAustralia, QLD, St Lucia, 4067, 20 Davis Street\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '730436969', 'Earn $531 per Day With YouTube', 'Greetings\r\n\r\nGenerate effortless income of $531 per day with YouTube Channels in just 60 seconds! \r\n\r\nNo technical skills required, no video creation, and no need to be on camera. \r\n\r\nStart now  =>> https://tinyurl.com/yc889ufm\r\n\r\nThank you\r\nJoey\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nAustralia, QLD, St Lucia, 4067, 20 Davis Street\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(149, 1720728961, NULL, 'SEObyAxy', 'seosubmitter@mail.com', 'Hi there\r\n\r\nMy name is Axy, and I am excited to introduce you to our comprehensive SEO services designed to boost your online visibility and drive more traffic to your website.\r\n\r\nWe understand that in today\'s competitive digital landscape, having a well-optimized website is crucial for success. \r\n\r\nThat\'s why we are offering a FREE Off-Page & On-Page SEO Audit to help you get started on the right foot.\r\n\r\nHERE\'S WHAT WE CAN DO FOR YOU:\r\n[+] Comprehensive Site Analysis: We will thoroughly check your website and create a customized Full SEO Campaign tailored to your specific needs.\r\n[+] Keyword Research: Our team will identify the most effective keywords to promote for each individual page of your site.\r\n[+] Page-by-Page Evaluation: We will review every page of your website and provide recommendations on the best package to buy and necessary changes to improve your SEO score.\r\n[+] Customized SEO Strategies: If you want to target specific keywords, we will guide you on where to make changes for optimal results.\r\n[+] Personalized SEO Packages: We can create SEO promotion packages customized to your needs or based on your budget.\r\n\r\nWe are committed to helping you achieve your business goals by enhancing your online presence. \r\n\r\nPlease feel free to reach out if you have any questions or if you are ready to take advantage of our free SEO audit.\r\n\r\n==>> https://t.ly/gw63W\r\n\r\nThank you for your time, and we look forward to working with you to make your website stand out!\r\n\r\nThanks,\r\nSEObyAxy\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\n\r\nSwitzerland, NA, Prolin, 1987, Herrenberg 104\r\nTo stop any further communication from us, please reply to this email with subject: Unsubscribe jpsresidency.in', '274271514', 'Do You Need SEO Audit for Your Website jpsresidency.in?', 'Hi there\r\n\r\nMy name is Axy, and I am excited to introduce you to our comprehensive SEO services designed to boost your online visibility and drive more traffic to your website.\r\n\r\nWe understand that in today\'s competitive digital landscape, having a well-optimized website is crucial for success. \r\n\r\nThat\'s why we are offering a FREE Off-Page & On-Page SEO Audit to help you get started on the right foot.\r\n\r\nHERE\'S WHAT WE CAN DO FOR YOU:\r\n[+] Comprehensive Site Analysis: We will thoroughly check your website and create a customized Full SEO Campaign tailored to your specific needs.\r\n[+] Keyword Research: Our team will identify the most effective keywords to promote for each individual page of your site.\r\n[+] Page-by-Page Evaluation: We will review every page of your website and provide recommendations on the best package to buy and necessary changes to improve your SEO score.\r\n[+] Customized SEO Strategies: If you want to target specific keywords, we will guide you on where to make changes for optimal results.\r\n[+] Personalized SEO Packages: We can create SEO promotion packages customized to your needs or based on your budget.\r\n\r\nWe are committed to helping you achieve your business goals by enhancing your online presence. \r\n\r\nPlease feel free to reach out if you have any questions or if you are ready to take advantage of our free SEO audit.\r\n\r\n==>> https://t.ly/gw63W\r\n\r\nThank you for your time, and we look forward to working with you to make your website stand out!\r\n\r\nThanks,\r\nSEObyAxy\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\n\r\nSwitzerland, NA, Prolin, 1987, Herrenberg 104\r\nTo stop any further communication from us, please reply to this email with subject: Unsubscribe jpsresidency.in'),
(150, 1720752701, NULL, 'Ravi Broadus', 'gina.broadus49@gmail.com', 'Hi,\r\nMy name is Ravi, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n I recently grew my client’s organic search traffic  with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/yycmkjf6\r\n\r\n\r\n', '1574827816', 'Why You are not in Googles search first Page?', 'Hi,\r\nMy name is Ravi, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n I recently grew my client’s organic search traffic  with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/yycmkjf6\r\n\r\n\r\n'),
(151, 1720768076, NULL, 'Mike Creighton\r\n', 'mikehauddy@gmail.com', 'https://jpsresidency.in', '88447554496', 'Social ads country traffic', 'Hello, \r\n \r\nHey, I\'m Mike from Monkey Digital. We offer a highly popular service that costs only 10$ per 5000 social ads visits. \r\n \r\nMore info:  \r\nhttps://www.monkey-seo.com/get-started/ \r\n \r\nTracking will be sent the same day, the advertisement goes live within a few hours, effective and cheap marketing, try it out, it will be worth every penny. \r\n \r\nRegards \r\nMonkey Digital \r\nhttps://www.monkey-seo.com/whatsapp-us/'),
(152, 1720771922, NULL, 'Franklyn Naylor', 'franklyn.naylor18@yahoo.com', 'Hi\r\n\r\nUnlock the secret to earning over $300 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  https://tinyurl.com/2s4kzy36\r\n\r\nKind regards\r\nFranklyn\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nBelgium, VOV, Asper, 9890, Rue Du Cornet 65\r\nTo stop any further communication from us, please reply to this email...', '471674449', 'Learn How to Earn Up to $300 Per Day...', 'Greetings\r\n\r\nUnlock the secret to earning over $300 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  https://tinyurl.com/2s4kzy36\r\n\r\nWarm regards\r\nFranklyn\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nBelgium, VOV, Asper, 9890, Rue Du Cornet 65\r\nTo stop any further communication from us, please reply to this email...'),
(153, 1720775069, NULL, 'Jeffery Binns', 'binns.jeffery97@gmail.com', 'Greetings\r\n\r\nUnlock the secret to earning over $100 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  https://tinyurl.com/3zm2xkx3\r\n\r\nKind regards\r\nJeffery\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nUnited Kingdom, NA, Westerton, Ph5 7bh, 74 Dover Road\r\nTo stop any further communication from us, please reply to this email...', '7888529013', 'Learn How to Earn Up to $100 Per Day...', 'Hi there\r\n\r\nUnlock the secret to earning over $100 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  https://tinyurl.com/3zm2xkx3\r\n\r\nYours truly\r\nJeffery\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nUnited Kingdom, NA, Westerton, Ph5 7bh, 74 Dover Road\r\nTo stop any further communication from us, please reply to this email...'),
(154, 1720784475, NULL, 'Terra Kroemer', 'kroemer.terra@yahoo.com', 'Hello\r\n\r\nSay goodbye to manual video editing! \r\n\r\nGenerate engaging videos for TikTok, Instagram, and YouTube in seconds.\r\n\r\nDon\'t miss our Early Bird Offer! Visit now for exclusive bonuses and discounts.\r\n\r\nSEE HERE => https://tinyurl.com/bd4ffuyz\r\n\r\nBest regards\r\nTerra\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nGermany, RP, Rommersheim, 54597, Rudower Strasse 6\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '6556894540', 'Earn 100$ per day with...', 'Hi\r\n\r\nSay goodbye to manual video editing! \r\n\r\nGenerate engaging videos for TikTok, Instagram, and YouTube in seconds.\r\n\r\nDon\'t miss our Early Bird Offer! Visit now for exclusive bonuses and discounts.\r\n\r\nSEE HERE => https://tinyurl.com/bd4ffuyz\r\n\r\nKind regards\r\nTerra\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nGermany, RP, Rommersheim, 54597, Rudower Strasse 6\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(155, 1720791848, NULL, 'Phil Stewart', 'noreplyhere@aol.com', 'Quick question for you, would you like me to blast your ad to millions of contact forms? I posted my ad to your contact form just now and you\'re reading it so there\'s proof it works. Take a look at my site below for more info\r\n\r\nhttp://xspsrs.contactformmarketing.xyz', '342-123-4456', '??', 'Hi, I was wondering if you could benefit from me blasting your ad to millions of contact forms just like I blasted my message to yours just now? Check out my site below for details on how it works.\r\n\r\nhttp://j4x6ly.contactformmarketing.xyz'),
(156, 1720846346, NULL, 'Hilario Worthington', 'hilario.worthington@yahoo.com', 'Hey hey!\r\n\r\nIt\'s been a while since our last conversation, but I just saw a warning article online about jpsresidency.in and immediately needed to message you guys to confirm this nonsense. \r\n\r\nIt seems like there\'s some rumors circulating that could be harmful to your reputation. \r\nBeing aware of how easily stories can get out of hand and not wanting you to be caught off guard, I decided to warn you.\r\n\r\nHere\'s where I came across the info:\r\n\r\nhttps://ibit.ly/GhwCj		\r\n\r\nI hope it\'s all a simple confusion, but I believed it necessary you should know!\r\n\r\nWishing you all the best,\r\nHilario\r\n', '536-537-8194', 'Saw something concerning about jpsresidency.in - should I be concerned?', 'Quick heads up\r\n\r\nWe haven\'t spoken in a while, but I recently stumbled upon an article online about jpsresidency.in and immediately needed to message you guys to disprove this article. \r\n\r\nIt seems like there\'s some unfavorable news that could be potentially damaging. \r\nUnderstanding how fast misinformation can spread and not wanting you to be unprepared, I felt the need to inform you.\r\n\r\nHere\'s where I came across the info:\r\n\r\nhttps://ibit.ly/tVc7a		\r\n\r\nMy hope is it\'s all a mix-up, but I believed it necessary you should know!\r\n\r\nWishing you all the best,\r\nHilario\r\n'),
(157, 1720881819, NULL, 'Freda Chambless', 'freda.chambless@outlook.com', 'Craving Non-Stop Fun? Level Up at 3030 Games!\r\n\r\nAttention gamers in Chonburi! Ready to smash some puzzles, overcome epic battles, or speed to the finish line? 3030Games is your go-to spot for totally no cost online gaming fun! \r\n\r\nHere’s why you’ll adore 3030 Games:\r\n\r\n- Endless Selection: Immerse yourself in a massive library of exciting games – there\'s something for everyone!\r\n\r\n- Completely no cost: Play all day, every day, without spending a dime!\r\n\r\n- Play Instantly: No downloads needed, simply jump right in and begin playing! \r\n\r\nReady to release your inner champion? Visit 30 30 Games now and power up your weekend!\r\n\r\nPlay Now: https://bit.ly/3030games', '7704852498', 'Unlock Unlimited Gaming Fun at 3030 Games', 'Calling all gaming enthusiasts! \r\n\r\nAre you prepared to take on new challenges and enjoy endless fun? 3030 Games has you covered with a selection of games to keep you amused.\r\n\r\nWhat Makes 3030 Games Special?\r\n- Diverse Game Collection: Explore a vast array of exciting games.\r\n- Absolutely no cost: Enjoy unlimited gaming without any cost!\r\n- Instant Gameplay: Begin gaming right away – no installations needed! \r\n\r\nDon’t wait! Head over to 3030 Games now and make the most of your gaming time.\r\n\r\nPlay Online Games Now:  https://bit.ly/3030games'),
(158, 1720953159, NULL, 'Caitlin Street', 'caitlin.street@googlemail.com', 'Good day\r\n\r\nIntroducing WPFunnels: the ultimate sales funnel builder for WordPress and WooCommerce. \r\nEasily create high-converting landing pages, sales funnels, and checkout flows without any prior experience.\r\n\r\nDiscover the benefits of WPFunnels:\r\n- Visual drag-and-drop editor for seamless funnel creation\r\n- Boost sales with order bump and one-click upsell/downsell offers\r\n- Choose from optimized templates and track performance with detailed analytics\r\n\r\nReady to supercharge your sales? Try WPFunnels today and watch your conversions soar! \r\n==> https://tinyurl.com/4c3899e5\r\n\r\nRegards\r\nCaitlin\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nItaly, TV, Casale Sul Sile, 31032, Vicolo Tre Marchetti 105\r\nTo stop any further communication from us, please reply to this email...', '3824708223', 'Boost Your Sales with WPFunnels for WordPress...', 'Hello\r\n\r\nIntroducing WPFunnels: the ultimate sales funnel builder for WordPress and WooCommerce. \r\nEasily create high-converting landing pages, sales funnels, and checkout flows without any prior experience.\r\n\r\nDiscover the benefits of WPFunnels:\r\n- Visual drag-and-drop editor for seamless funnel creation\r\n- Boost sales with order bump and one-click upsell/downsell offers\r\n- Choose from optimized templates and track performance with detailed analytics\r\n\r\nReady to supercharge your sales? Try WPFunnels today and watch your conversions soar! \r\n==> https://tinyurl.com/4c3899e5\r\n\r\nKind regards\r\nCaitlin\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nItaly, TV, Casale Sul Sile, 31032, Vicolo Tre Marchetti 105\r\nTo stop any further communication from us, please reply to this email...'),
(159, 1720958927, NULL, 'Annette Pullen', 'annette.pullen85@msn.com', 'Greetings\r\n\r\nCreate viral TikTok, Instagram, YouTube, and Facebook videos instantly with AI VideoReel Builder. \r\n\r\nJust enter a keyword, and it handles the rest - editing, voiceovers, and more. \r\n\r\nGrab yours now before prices rise =>> https://tinyurl.com/yey55x35\r\n\r\nWarm regards\r\nAnnette\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nSweden, NA, Moja, 130 43, Hantverkarg 95\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '703657177', 'Monetize Your Short Videos with AI VideoReel Builder...', 'Hi\r\n\r\nCreate viral TikTok, Instagram, YouTube, and Facebook videos instantly with AI VideoReel Builder. \r\n\r\nJust enter a keyword, and it handles the rest - editing, voiceovers, and more. \r\n\r\nGrab yours now before prices rise =>> https://tinyurl.com/yey55x35\r\n\r\nWarm regards\r\nAnnette\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nSweden, NA, Moja, 130 43, Hantverkarg 95\r\nTo stop any further communication with jpsresidency.in, please reply to this email...');
INSERT INTO `pm_message` (`id`, `add_date`, `edit_date`, `name`, `email`, `address`, `phone`, `subject`, `msg`) VALUES
(160, 1720960016, NULL, 'Frances Lombard', 'frances.lombard83@outlook.com', 'Hello\r\n\r\nAre you ready to take your affiliate marketing to the next level? \r\n\r\nIntroducing the 100% DONE-FOR-YOU \"AI\" Traffic & Commission System! Whether you promote offers on WarriorPlus, Clickbank, Digistore24, or any other affiliate network, this system has everything you need to succeed.\r\n\r\nWith this revolutionary system, you\'ll have access to:\r\n - AI-powered traffic generation that drives targeted visitors to your offers.\r\n - A proven commission system designed to maximize your earnings.\r\n - Complete automation so you can focus on scaling your profits.\r\n\r\nStop struggling with outdated methods and start leveraging the power of AI to achieve consistent affiliate success!\r\n\r\nClick here to transform your affiliate marketing results now: https://tinyurl.com/bdd428cc\r\n\r\nRespectfully\r\nFrances\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nUnited States, UT, Salt Lake City, 84104, 351 Walton Street\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '8014163083', 'Your All-in-One Solution for Affiliate Marketing Success!', 'Hi\r\n\r\nAre you ready to take your affiliate marketing to the next level? \r\n\r\nIntroducing the 100% DONE-FOR-YOU \"AI\" Traffic & Commission System! Whether you promote offers on WarriorPlus, Clickbank, Digistore24, or any other affiliate network, this system has everything you need to succeed.\r\n\r\nWith this revolutionary system, you\'ll have access to:\r\n - AI-powered traffic generation that drives targeted visitors to your offers.\r\n - A proven commission system designed to maximize your earnings.\r\n - Complete automation so you can focus on scaling your profits.\r\n\r\nStop struggling with outdated methods and start leveraging the power of AI to achieve consistent affiliate success!\r\n\r\nClick here to transform your affiliate marketing results now: https://tinyurl.com/bdd428cc\r\n\r\nThank you\r\nFrances\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nUnited States, UT, Salt Lake City, 84104, 351 Walton Street\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(161, 1721053703, NULL, 'Annmarie Newland', 'annmarie.newland@gmail.com', 'Howdy!\r\n\r\nIt\'s been a while, but I just saw a warning article online about jpsresidency.in and thought it was important to email you guys to confirm this nonsense. \r\n\r\nIt appears like there\'s some unfavorable news that could be potentially damaging. \r\nKnowing how fast misinformation can spread and not wanting you to be taken by surprise, I felt the need to notify you.\r\n\r\nHere\'s where I found the info:\r\n\r\nhttps://ibit.ly/_qdGM		\r\n\r\nI\'m hoping it\'s all a mix-up, but it seemed prudent you should know!\r\n\r\nWishing you all the best,\r\nAnnmarie\r\n', '869-356-8639', 'Noticed something concerning about jpsresidency.in - urgent', 'hi, just a warning,\r\n\r\nIt\'s been some time since we last communicated, but I came across something online about jpsresidency.in and thought it was important to reach out to validate this review. \r\n\r\nIt appears like there\'s some negative press that could be harmful to your reputation. \r\nBeing aware of how easily stories can get out of hand and wishing not you to be caught off guard, I thought it best to warn you.\r\n\r\nHere\'s where I found the info:\r\n\r\nhttps://ibit.ly/3Dz5H		\r\n\r\nMy hope is it\'s all a misunderstanding, but I thought it best you should know!\r\n\r\nWishing you all the best,\r\nAnnmarie\r\n'),
(162, 1721080326, NULL, 'SEObyAxy', 'seosubmitter@mail.com', 'To the jpsresidency.in Webmaster\r\n\r\nBOOST YOUR RANKINGS WITH HIGH-QUALITY BACKLINKS!\r\n\r\nDo you want to increase your online visibility and attract more organic traffic to your website? With our premium SEO Backlinks Services, it\'s possible!\r\n\r\nWHY CHOOSE OUR SERVICES?\r\n[+] Guaranteed Results: Purchase authentic and relevant backlinks that will improve your search engine rankings.\r\n[+] Maximum Visibility: Turn your website into a magnet for organic traffic.\r\n[+] Proven Expertise: We have a team of experienced SEO experts dedicated to your success.\r\n\r\nWHAT OUR CLIENTS SAY:\r\n\"I noticed a significant increase in organic traffic and sales after we started using their backlinking services.\" - [Client Name; Maira], [Company: Maira]\r\n\r\nSPECIAL OFFER FOR YOU:\r\nFor a limited time, we are offering discount... Don\'t miss this opportunity to propel your business to the top of search results!\r\n\r\nAccess Now and Transform Your Website =>> https://t.ly/aG0Is\r\n\r\nIf you have any questions or want to learn more about how we can help you, don\'t hesitate to contact us.\r\n\r\nThanks, \r\nSEObyAxy\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nNetherlands, LI, Hulsberg, 6336 Ve, Kerkbergweg 49\r\nTo stop any further communication through your website form, Please reply with subject:  Unsubscribe jpsresidency.in', '610939506', 'Do You Need Backlinks for Your Website jpsresidency.in?', 'Hi jpsresidency.in Admin\r\n\r\nBOOST YOUR RANKINGS WITH HIGH-QUALITY BACKLINKS!\r\n\r\nDo you want to increase your online visibility and attract more organic traffic to your website? With our premium SEO Backlinks Services, it\'s possible!\r\n\r\nWHY CHOOSE OUR SERVICES?\r\n[+] Guaranteed Results: Purchase authentic and relevant backlinks that will improve your search engine rankings.\r\n[+] Maximum Visibility: Turn your website into a magnet for organic traffic.\r\n[+] Proven Expertise: We have a team of experienced SEO experts dedicated to your success.\r\n\r\nWHAT OUR CLIENTS SAY:\r\n\"I noticed a significant increase in organic traffic and sales after we started using their backlinking services.\" - [Client Name; Maira], [Company: Maira]\r\n\r\nSPECIAL OFFER FOR YOU:\r\nFor a limited time, we are offering discount... Don\'t miss this opportunity to propel your business to the top of search results!\r\n\r\nAccess Now and Transform Your Website =>> https://t.ly/aG0Is\r\n\r\nIf you have any questions or want to learn more about how we can help you, don\'t hesitate to contact us.\r\n\r\nThanks, \r\nSEObyAxy\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nNetherlands, LI, Hulsberg, 6336 Ve, Kerkbergweg 49\r\nTo stop any further communication through your website form, Please reply with subject:  Unsubscribe jpsresidency.in'),
(163, 1721083294, NULL, 'June Leigh', 'june.leigh@gmail.com', 'I hope this message finds you well. I am reaching out to introduce our cutting-edge AI API platform that seamlessly integrates world-class AI models such as GPT-4, Claude, and Gemini. Our platform is designed to empower websites like yours with advanced AI capabilities at a fraction of the cost.\r\n\r\n\r\nKey benefits of our AI API platform:\r\n\r\n\r\nAccess to top-tier AI models for various applications\r\n\r\nAPI prices that are 4-7 times cheaper than official rates\r\n\r\nHigh concurrency and stability for smooth AI services\r\n\r\nEasy integration and comprehensive developer support\r\n\r\n\r\n\r\nWe are offering a FREE API key to get you started. To receive your key and access our step-by-step tutorials, simply reach out to us via Telegram or email, providing your website name. Our team is also available for 1-on-1 technical support to help you unlock the full potential of AI for your website.\r\n\r\nDon\'t miss this opportunity to revolutionize your website with the power of AI. Claim your free API key today and experience the benefits firsthand.\r\n\r\nTo learn more about our services, visit our website: https://www.lmzh.top/\r\n\r\n\r\nTelegram: https://t.me/nicky05061\r\n\r\nEmail: q2408808@outlook.com\r\n\r\nWebsite: https://www.lmzh.top/', '493577999', 'Hi jpsresidency.in Webmaster.', 'I hope this message finds you well. I am reaching out to introduce our cutting-edge AI API platform that seamlessly integrates world-class AI models such as GPT-4, Claude, and Gemini. Our platform is designed to empower websites like yours with advanced AI capabilities at a fraction of the cost.\r\n\r\n\r\nKey benefits of our AI API platform:\r\n\r\n\r\nAccess to top-tier AI models for various applications\r\n\r\nAPI prices that are 4-7 times cheaper than official rates\r\n\r\nHigh concurrency and stability for smooth AI services\r\n\r\nEasy integration and comprehensive developer support\r\n\r\n\r\n\r\nWe are offering a FREE API key to get you started. To receive your key and access our step-by-step tutorials, simply reach out to us via Telegram or email, providing your website name. Our team is also available for 1-on-1 technical support to help you unlock the full potential of AI for your website.\r\n\r\nDon\'t miss this opportunity to revolutionize your website with the power of AI. Claim your free API key today and experience the benefits firsthand.\r\n\r\nTo learn more about our services, visit our website: https://www.lmzh.top/\r\n\r\n\r\nTelegram: https://t.me/nicky05061\r\n\r\nEmail: q2408808@outlook.com\r\n\r\nWebsite: https://www.lmzh.top/'),
(164, 1721087996, NULL, 'Omar Echols', 'creatify64@gmail.com', 'Hi,\r\nI am Omar , I am offering for your website or Producrts  free Marketing short video that you can use it freely in any of your social accounts or Youtube channel , if you are Intrested , please\r\n\r\n\r\n\r\nput your details here and I will sen you the Free video ===> https://tinyurl.com/2a4j95ph\r\n\r\nRegards', '312411927', 'I will create free Marketing short Videos for you !', 'Hi,\r\nI am Omar , I am offering for your website or Producrts  free Marketing short video that you can use it freely in any of your social accounts or Youtube channel , if you are Intrested , please\r\n\r\n\r\n\r\nput your details here and I will sen you the Free video ===> https://tinyurl.com/2a4j95ph\r\n\r\nRegards'),
(165, 1721101114, NULL, 'FrancisVax', 'maryst_deloyd3@outlook.com', '', '81253557713', 'gosznakdublikat at ru', 'https://gosznakdublikat.ru/'),
(166, 1721130426, NULL, 'Silas Holmwood', 'silas.holmwood@outlook.com', 'Hello,\r\n\r\nIt is with sad regret that after 12 years, LeadsMax.biz is shutting down.\r\n\r\nWe have made all our databases available on our website.\r\n\r\n25 Million companies\r\n527 Million People\r\n\r\nLeadsMax.biz', '9407200811', 'LeadsMax.biz shutting down', 'Hello,\r\n\r\nIt is with sad regret that after 12 years, LeadsMax.biz is shutting down.\r\n\r\nWe have made all our databases available on our website.\r\n\r\n25 Million companies\r\n527 Million People\r\n\r\nLeadsMax.biz'),
(167, 1721138016, NULL, 'James', 'omer.hulett@msn.com', 'If you are reading this message, That means my marketing is working. I can make your ad message reach 5 million sites in the same manner for just $50. It\'s the most affordable way to market your business or services. Contact me by email virgo.t3@gmail.com or skype me at live:.cid.dbb061d1dcb9127a\r\n\r\nP.S: Speical Offer - Only for 2 days - 10 Million Sites for the same money $50', '72 458 09 21', 'Hello jpsresidency.in Webmaster!', 'If you are reading this message, That means my marketing is working. I can make your ad message reach 5 million sites in the same manner for just $50. It\'s the most affordable way to market your business or services. Contact me by email virgo.t3@gmail.com or skype me at live:.cid.dbb061d1dcb9127a\r\n\r\nP.S: Speical Offer - Only for 2 days - 10 Million Sites for the same money $50'),
(168, 1721191902, NULL, 'Amber Jordon', 'amber.jordon@yahoo.com', 'Quick heads up\r\n\r\nIt\'s been some time since we last communicated, but I just saw an article online about jpsresidency.in and immediately needed to message you guys to disprove this review. \r\n\r\nIt seems like there\'s some unfavorable news that could be detrimental. \r\nUnderstanding how quickly rumors can spiral and wishing not you to be taken by surprise, I decided to notify you.\r\n\r\nHere\'s where I found the info:\r\n\r\nhttps://ibit.ly/RzbhC		\r\n\r\nI\'m hoping it\'s all a misunderstanding, but I believed it necessary you should know!\r\n\r\nWishing you all the best,\r\nAmber\r\n', '787-444-3676', 'Saw something worrying about jpsresidency.in - should I be concerned?', 'Hey hey!\r\n\r\nIt has been quite some time, but I just saw an article online about jpsresidency.in and felt compelled to reach out to validate this review. \r\n\r\nIt seems like there\'s some unfavorable news that could be detrimental. \r\nUnderstanding how fast misinformation can spread and not wanting you to be taken by surprise, I felt the need to inform you.\r\n\r\nHere\'s where I found the info:\r\n\r\nhttps://ibit.ly/1Y-UQ		\r\n\r\nMy hope is it\'s all a misunderstanding, but I believed it necessary you should know!\r\n\r\nAll the best to you,\r\nAmber\r\n'),
(169, 1721200254, NULL, 'Sonya Pendleton', 'sonya.pendleton@googlemail.com', 'Greetings\r\n\r\nReady to dominate TikTok? \r\n\r\nOur game-changing AI app empowers you to create professional-quality short videos effortlessly!\r\n\r\nDon\'t miss out! Grab your ticket to TikTok success now\r\n\r\nSEE HERE => https://tinyurl.com/yb5cvmf5\r\n\r\nBest regards\r\nSonya\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nUnited Kingdom, NA, East Halton, Dn40 7wj, 29 Guildford Rd\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '7905360227', 'Haw To Make $330/Day From Ai Video Shorts...', 'Greetings\r\n\r\nReady to dominate TikTok? \r\n\r\nOur game-changing AI app empowers you to create professional-quality short videos effortlessly!\r\n\r\nDon\'t miss out! Grab your ticket to TikTok success now\r\n\r\nSEE HERE => https://tinyurl.com/yb5cvmf5\r\n\r\nThank you\r\nSonya\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nUnited Kingdom, NA, East Halton, Dn40 7wj, 29 Guildford Rd\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(170, 1721229017, NULL, 'David', 'noblet.chara@gmail.com', 'We are thrilled to introduce you to Minew, a leading provider of cutting-edge IoT hardware. At Minew, we excel in designing, developing, and delivering top-quality IoT devices that incorporate the latest technologies such as Bluetooth®LE, LoRa, LTE-M, NB-IoT, Wi-Fi, UWB, 4G, 5G, and more.\r\n\r\nOur extensive product line includes BLE sensors, personnel tags, asset trackers, Bluetooth® beacons, IoT gateways, and an array of upcoming innovations. These devices are designed to meet the needs of virtually any commercial and industrial setting.\r\n\r\nBeyond our exceptional hardware, we offer comprehensive customization services, including product engineering, rapid prototyping, flexible manufacturing, and regulatory compliance. Our commitment to quality and customer satisfaction sets us apart from other IoT manufacturers.\r\n\r\nFor more details about our products and services, please visit our website at www.minew.com. If you have any questions or need personalized support, don\'t hesitate to reach out to us at info@minew.com.\r\n\r\nWe look forward to the opportunity to work with you.', '0364 2415789', 'To the jpsresidency.in Webmaster.', 'We are thrilled to introduce you to Minew, a leading provider of cutting-edge IoT hardware. At Minew, we excel in designing, developing, and delivering top-quality IoT devices that incorporate the latest technologies such as Bluetooth®LE, LoRa, LTE-M, NB-IoT, Wi-Fi, UWB, 4G, 5G, and more.\r\n\r\nOur extensive product line includes BLE sensors, personnel tags, asset trackers, Bluetooth® beacons, IoT gateways, and an array of upcoming innovations. These devices are designed to meet the needs of virtually any commercial and industrial setting.\r\n\r\nBeyond our exceptional hardware, we offer comprehensive customization services, including product engineering, rapid prototyping, flexible manufacturing, and regulatory compliance. Our commitment to quality and customer satisfaction sets us apart from other IoT manufacturers.\r\n\r\nFor more details about our products and services, please visit our website at www.minew.com. If you have any questions or need personalized support, don\'t hesitate to reach out to us at info@minew.com.\r\n\r\nWe look forward to the opportunity to work with you.'),
(171, 1721238089, NULL, 'Noah Kinsey', 'noah.kinsey@gmail.com', 'Greetings\r\n\r\nYou have the chance to uncover the incredible secret hidden within Jeff Bezos Amazon empire – a secret that offers you an endless stream of free traffic and overwhelms you with amazing Amazon commissions!\r\n\r\nWHY EXPERTS LOVE AMZ AUTOMATOR:\r\n - Free Traffic: An untapped traffic source from Amazon Prime.\r\n - Huge Commissions: Up to $293.47 per day just by watching videos.\r\n - Maximum Efficiency: No tedious and expensive setups.\r\n\r\nWHAT PROFESSIONALS ARE SAYING:\r\n[Noah] \"AMZ AUTOMATOR has completely transformed the way I earn Amazon commissions. It’s simply revolutionary!\"\r\n\r\nDON’T MISS THIS UNIQUE OPPORTUNITY:\r\nTime is of the essence! This Amazon Prime secret won’t be available for long.\r\n\r\nCLICK HERE TO START =>> https://tinyurl.com/23f3eb7e\r\n\r\nDon’t let this chance slip by. Secure your spot among those who take advantage of this rare opportunity!\r\n\r\nSincerely\r\nNoah\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nCanada, BC, Burnaby, V5b 3c9, 2604 Hammarskjold Dr\r\nTo stop any further communication from us, please reply to this email...', '6042926890', 'Discover Jeff Bezos Amazon Prime Secret and Earn $293 a Day!', 'Hi\r\n\r\nYou have the chance to uncover the incredible secret hidden within Jeff Bezos Amazon empire – a secret that offers you an endless stream of free traffic and overwhelms you with amazing Amazon commissions!\r\n\r\nWHY EXPERTS LOVE AMZ AUTOMATOR:\r\n - Free Traffic: An untapped traffic source from Amazon Prime.\r\n - Huge Commissions: Up to $293.47 per day just by watching videos.\r\n - Maximum Efficiency: No tedious and expensive setups.\r\n\r\nWHAT PROFESSIONALS ARE SAYING:\r\n[Noah] \"AMZ AUTOMATOR has completely transformed the way I earn Amazon commissions. It’s simply revolutionary!\"\r\n\r\nDON’T MISS THIS UNIQUE OPPORTUNITY:\r\nTime is of the essence! This Amazon Prime secret won’t be available for long.\r\n\r\nCLICK HERE TO START =>> https://tinyurl.com/23f3eb7e\r\n\r\nDon’t let this chance slip by. Secure your spot among those who take advantage of this rare opportunity!\r\n\r\nBest regards\r\nNoah\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nCanada, BC, Burnaby, V5b 3c9, 2604 Hammarskjold Dr\r\nTo stop any further communication from us, please reply to this email...'),
(172, 1721268807, NULL, 'Irene Groff', 'irene.groff51@yahoo.com', 'Hi Jpsresidency,\r\n\r\nAre you ready to dive into a revolutionary way of earning passive income? Introducing Auto-Affiliate AI – the only automated affiliate system that can generate $5,000/week without sales funnels, email marketing, or advertising.\r\n\r\n=>>> https://auto-affiliate-ai.blogspot.com\r\n\r\n������ Zero technical skills required.\r\n������ Run your business in just 2 hours per week.\r\n������ All traffic comes from free sources.\r\n\r\nI’ve taken the fastest, most beginner-friendly commission strategy and trained a ChatGPT system to implement it all for you. Imagine earning money while you sleep, with everything handled by AI!\r\n\r\nCurious to see how it works? Click here to watch a live demo.\r\n\r\n=>>> https://auto-affiliate-ai.blogspot.com\r\n\r\nDon\'t miss out on this chance to transform your financial future!\r\n\r\nBest,\r\n[Irene Groff]', '4172240615', 'Discover the Secret to Earning $5,000/Week Without Any Effort! ������', 'Hi Jpsresidency,\r\n\r\nAre you ready to dive into a revolutionary way of earning passive income? Introducing Auto-Affiliate AI – the only automated affiliate system that can generate $5,000/week without sales funnels, email marketing, or advertising.\r\n\r\n=>>> https://auto-affiliate-ai.blogspot.com\r\n\r\n������ Zero technical skills required.\r\n������ Run your business in just 2 hours per week.\r\n������ All traffic comes from free sources.\r\n\r\nI’ve taken the fastest, most beginner-friendly commission strategy and trained a ChatGPT system to implement it all for you. Imagine earning money while you sleep, with everything handled by AI!\r\n\r\nCurious to see how it works? Click here to watch a live demo.\r\n\r\n=>>> https://auto-affiliate-ai.blogspot.com\r\n\r\nDon\'t miss out on this chance to transform your financial future!\r\n\r\nBest,\r\n[Irene Groff]'),
(173, 1721306689, NULL, 'Ravi Doughty', 'manie.doughty@msn.com', 'Hi,\r\nMy name is Ravi, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n I recently grew my client’s organic search traffic  with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/yycmkjf6\r\n\r\n\r\n', '639257798', 'Why You are not in Googles search first Page?', 'Hi,\r\nMy name is Ravi, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n I recently grew my client’s organic search traffic  with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/yycmkjf6\r\n\r\n\r\n'),
(174, 1721355100, NULL, 'Selma Koerstz', 'koerstz.selma57@outlook.com', 'Tired of sore muscles, aches, and pains? Ready to get back to doing the things you love?\r\n\r\nTry MYONATURAL, trusted by massage therapists, chiropractors, and athletic trainers.\r\n\r\nGet 20% off your first order.\r\nUse Coupon Code: VV7UP5HH\r\n\r\n++URL++:  https://bit.ly/4eODq8g\r\n\r\n* MYONATURAL offers a collection of safe, all-natural products aimed at relieving pain and improving your life. Our pain-relieving creams and oral sprays work alone or in combination to relieve pain, lower anxiety, and foster restorative sleep. Developed by someone who understands your struggles, we are focused on helping you feel, move, and live better. Experience the MYONATURAL difference today!\r\n\r\n\r\n\r\n\r\nUnsubscribe by filling this form: https://bit.ly/myounsubscribe\r\n1 Grayson Street, Nurenmerenmong, NSW, United States, 2649', '261979497', 'Reclaim Your Life with MYONATURAL\'s Pain Relief Solutions', 'Suffering from muscle soreness, aches, and pains? Ready to get back to doing the things you love?\r\n\r\nTry MYONATURAL, the top choice for natural pain relief, trusted by massage therapists, chiropractors, and athletic trainers.\r\n\r\nGet 20% off your first order.\r\nUse Coupon Code: VV7UP5HH\r\n\r\n++URL++:  https://bit.ly/4eODq8g\r\n\r\n* MYONATURAL offers a family of safe, all-natural products designed to relieve pain and improve your quality of life. Our pain-relieving creams and oral sprays work individually or together to alleviate pain, reduce anxiety, and promote restorative sleep. Developed by someone who understands your struggles, we are focused on helping you feel, move, and live better. Experience the MYONATURAL difference today!\r\n\r\n\r\n\r\n\r\nUnsubscribe by filling the form: https://bit.ly/myounsubscribe\r\n1 Grayson Street, Nurenmerenmong, NSW, United States, 2649'),
(175, 1721378584, NULL, 'Demetra Mccue', 'mccue.demetra@googlemail.com', 'Hello there\r\n\r\nWe provide real human traffic with a revenue share option.\r\n\r\nAre you looking to leverage your website’s ad revenue effortlessly? At Pristine Traffic, we specialize in providing premium traffic solutions designed to connect you with engaged, high-quality visitors. Our targeted traffic can help you:\r\n- Increase user engagement and retention\r\n- Maximize your ad earnings\r\n- Achieve sustainable growth with consistent, profitable traffic\r\n\r\nBe one of the successful websites transforming their performance with our tailored traffic solutions. Don’t miss out on the opportunity to elevate your site’s revenue potential!\r\n\r\nVisit Pristine Traffic today to learn more and get started: https://bit.ly/prstraffic\r\n\r\nBest regards\r\n\r\nContact: hello@pristinetraffic.com\r\nVisit: https://bit.ly/prstraffic\r\nWhatsApp: +18143008897', '0018143008897', 'Achieve Sustainable Growth with Our Traffic', 'Hey jpsresidency.in team\r\n\r\nWe provide real human traffic with a revenue share option.\r\n\r\nAre you looking to skyrocket your website’s ad revenue easily? At Pristine Traffic, we specialize in providing premium traffic solutions designed to connect you with engaged, high-quality users. Our targeted traffic can help you:\r\n- Increase user engagement and retention\r\n- Maximize your ad earnings\r\n- Achieve sustainable growth with consistent, profitable traffic\r\n\r\nTransform your performance like many successful websites with our tailored traffic solutions. Don’t miss out on the opportunity to elevate your site’s revenue potential!\r\n\r\nVisit Pristine Traffic today to learn more and get started: https://bit.ly/prstraffic\r\n\r\nCheers\r\n\r\nMatthew Turner\r\nPristine Traffic\r\nmatthew@pristinetraffic.com\r\nWhatsApp: +18143008897\r\nhttps://bit.ly/prstraffic'),
(176, 1721378709, NULL, 'Alaric Ong', 'rylanjoseph85@gmail.com', 'https://www.no-site.com', '86927788693', 'My boss Alaric would like to meet you to see how we can collaborate', 'Hi, \r\n \r\nMy mentor Alaric Ong is a million-dollar funnel builder with a proven track record of generating leads, appointments, and sales automatically. He has driven millions of dollars in revenue through his own funnels. \r\n \r\nOur strategy allows us to achieve a cost per lead of $3 to $10 in competitive markets and $20 to $30 per appointment. The key to our success is running thousands of variations of ads, preventing ad fatigue and reducing costs. Most marketers run only a few ads, causing them to quickly lose effectiveness. \r\n \r\nWe use AI to split test and optimize our ads, ensuring we spend more on successful ads and less on underperforming ones. \r\n \r\nThis approach results in leads costing $10 each and appointments costing $30 in Singapore. In Malaysia, we achieve appointments at RM 9.94 (SGD $3). In USA, $20 per appointment \r\n \r\nIf you’re interested in learning more, visit https://funnel.alaric.ai. \r\n \r\nBest, \r\nAlaric \r\n \r\nWhatsApp: https://wa.link/z7f073 \r\n \r\nEmail: alaricong123@gmail.com \r\n \r\n1000+ Client results: http://alaric.site/wins \r\n \r\nHundreds of Testimonials: https://alaricong.com/p/testimonials.html \r\n \r\nJoin our WhatsApp group: https://chat.whatsapp.com/Ln6E1UBammC6MOzcXhXYlN'),
(177, 1721407063, NULL, 'Art Daves', 'art.daves@googlemail.com', 'Hi,\r\n\r\nOur cutting-edge AI technology takes the hassle out of logo design, allowing you to generate a professional looking logo for jpsresidency.in in minutes.\r\n\r\n- No design skills needed! Simply enter your keyword and watch our AI generate an abundance of stunning logo options.\r\n- Generate logos in under 60 seconds, saving you precious time and resources.\r\n- Customize the generated logos to perfectly match your brand vision.\r\n- Choose from a vast library of pre-made logo templates or upload your own designs.\r\n- Sell & Profit: Earn by selling your logos on platforms like Fiverr and Upwork (Commercial License Included!)\r\n- Say Goodbye to Freelancers: Take complete control of your logo creation process.\r\n\r\nPlus, for a limited time, you can grab this for a one-time price of only $14.99! That\'s a steal compared to the regular monthly subscription of $199.\r\n\r\nClick here to learn more: https://furtherinfo.org/nbf1\r\n\r\nArt', '460811708', 'Unleash the Power of AI: Design Stunning Logos in Minutes', 'Hi,\r\n\r\nOur cutting-edge AI technology takes the hassle out of logo design, allowing you to generate a professional looking logo for jpsresidency.in in minutes.\r\n\r\n- No design skills needed! Simply enter your keyword and watch our AI generate an abundance of stunning logo options.\r\n- Generate logos in under 60 seconds, saving you precious time and resources.\r\n- Customize the generated logos to perfectly match your brand vision.\r\n- Choose from a vast library of pre-made logo templates or upload your own designs.\r\n- Sell & Profit: Earn by selling your logos on platforms like Fiverr and Upwork (Commercial License Included!)\r\n- Say Goodbye to Freelancers: Take complete control of your logo creation process.\r\n\r\nPlus, for a limited time, you can grab this for a one-time price of only $14.99! That\'s a steal compared to the regular monthly subscription of $199.\r\n\r\nClick here to learn more: https://furtherinfo.org/nbf1\r\n\r\nArt'),
(178, 1721420677, NULL, 'Elise McGavin', 'elise.mcgavin@gmail.com', '\r\n\r\nIt\'s been some time, but I just got emailed a warning article online about jpsresidency.in and immediately needed to message you guys to confirm this nonsense. \r\n\r\nIt looks like there\'s some unfavorable news that could be detrimental. \r\nBeing aware of how fast misinformation can spread and hoping not you to be unprepared, I decided to inform you.\r\n\r\nHere\'s where I found the info:\r\n\r\nhttps://ibit.ly/Iq3vS		\r\n\r\nMy hope is it\'s all a simple confusion, but it seemed prudent you should know!\r\n\r\nWishing you all the best,\r\nElise\r\n', '222-713-9264', 'Saw something concerning about jpsresidency.in - urgent', 'hey, jsut a warning\r\n\r\nWe haven\'t spoken in a while, but I recently stumbled upon an article online about jpsresidency.in and immediately needed to message you guys to validate this article. \r\n\r\nIt appears like there\'s some negative press that could be harmful to your reputation. \r\nUnderstanding how fast misinformation can spread and not wanting you to be taken by surprise, I decided to warn you.\r\n\r\nHere\'s where I came across the info:\r\n\r\nhttps://ibit.ly/HsM3Y		\r\n\r\nMy hope is it\'s all a misunderstanding, but I believed it necessary you should know!\r\n\r\nBest wishes,\r\nElise\r\n'),
(179, 1721443554, NULL, 'Marisa Benjamin', 'benjamin.marisa@gmail.com', 'Hey there,\r\n\r\nAre you tired of seeing your website traffic go to waste?\r\n\r\n Monetag can help you turn those visitors into cold, hard cash. Imagine earning extra income without the hassle of complex ad networks.\r\n\r\n Our platform makes it easy to place high-paying ads on your site, with instant approval and quick payouts. Don\'t let another visitor leave empty-handed.\r\n\r\n Let\'s start making your website work harder for you.\r\n\r\nReady to give it a try?\r\nhttps://bit.ly/MonetagRegisterToEarn', '7750190355', 'Dear jpsresidency.in Webmaster.', 'Hey there,\r\n\r\nAre you tired of seeing your website traffic go to waste?\r\n\r\n Monetag can help you turn those visitors into cold, hard cash. Imagine earning extra income without the hassle of complex ad networks.\r\n\r\n Our platform makes it easy to place high-paying ads on your site, with instant approval and quick payouts. Don\'t let another visitor leave empty-handed.\r\n\r\n Let\'s start making your website work harder for you.\r\n\r\nReady to give it a try?\r\nhttps://bit.ly/MonetagRegisterToEarn'),
(180, 1721465591, NULL, 'Mike Gilbert\r\n', 'peterhauddy@gmail.com', 'https://no-site.com', '83228142952', 'Whitehat SEO for jpsresidency.in', 'Hello \r\n \r\nI have just took an in depth look on your  jpsresidency.in for its SEO Trend and saw that your website could use an upgrade. \r\n \r\nWe will enhance your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\nRegards \r\nMike Gilbert\r\n \r\nDigital X SEO Experts \r\nhttps://www.digital-x-press.com/whatsapp-us/'),
(181, 1721471727, NULL, 'Luigi Winslow', 'winslow.luigi@gmail.com', 'Hi there,\r\n\r\nAre you tired of paying monthly fees for website hosting, cloud storage, and funnels?\r\n\r\nWe offer a revolutionary solution: host unlimited websites, files, and videos for a single, low one-time fee. No more monthly payments.\r\n\r\nHere\'s what you get:\r\n\r\nUltra-fast hosting powered by Intel® Xeon® CPU technology\r\nUnlimited website hosting\r\nUnlimited cloud storage\r\nUnlimited video hosting\r\nUnlimited funnel creation\r\nFree SSL certificates for all domains and files\r\n99.999% uptime guarantee\r\n24/7 customer support\r\nEasy-to-use cPanel\r\n365-day money-back guarantee\r\n\r\nPlus, get these exclusive bonuses when you act now:\r\n\r\n60+ reseller licenses (sell hosting to your clients!)\r\n10 Fast-Action Bonuses worth over $19,997 (including AI tools, traffic generation, and more!)\r\n\r\nDon\'t miss out on this limited-time offer! The price is about to increase, and this one-time fee won\'t last forever.\r\n\r\nClick here to learn more: https://furtherinfo.org/yarx\r\n\r\nLuigi\r\n\r\nIf you do not wish to receive any further offers:\r\nhttps://removeme.click/wp/unsubscribe.php?d=jpsresidency.in', '298311678', 'Tired of Monthly Hosting Fees?', 'Hi there,\r\n\r\nAre you tired of paying monthly fees for website hosting, cloud storage, and funnels?\r\n\r\nWe offer a revolutionary solution: host unlimited websites, files, and videos for a single, low one-time fee. No more monthly payments.\r\n\r\nLearn more: https://furtherinfo.org/0wg3\r\n\r\nHere\'s what you get:\r\n\r\nUltra-fast hosting powered by Intel® Xeon® CPU technology\r\nUnlimited website hosting\r\nUnlimited cloud storage\r\nUnlimited video hosting\r\nUnlimited funnel creation\r\nFree SSL certificates for all domains and files\r\n99.999% uptime guarantee\r\n24/7 customer support\r\nEasy-to-use cPanel\r\n365-day money-back guarantee\r\n\r\nPlus, get these exclusive bonuses when you act now:\r\n\r\n60+ reseller licenses (sell hosting to your clients!)\r\n10 Fast-Action Bonuses worth over $19,997 (including AI tools, traffic generation, and more!)\r\n\r\nDon\'t miss out on this limited-time offer! The price is about to increase, and this one-time fee won\'t last forever.\r\n\r\nClick here to learn more: https://furtherinfo.org/0wg3\r\n\r\nLuigi\r\n\r\n\r\nIf you do not wish to receive any further offers:\r\nhttps://removeme.click/wp/unsubscribe.php?d=jpsresidency.in'),
(182, 1721475426, NULL, 'Mark Tallent', 'rosario.tallent@hotmail.com', 'Boost Your Videos with Submagic - The Best AI Tool for Short-Form Content\r\n\r\nHey there,\r\n\r\nAre you tired of spending hours creating captions, searching for the perfect transitions, and adding sound effects to your videos? \r\n\r\nSubmagic is here to save the day!\r\n\r\nElevate your content creation game with Submagic, the ultimate AI tool for short-form content.\r\n\r\nTake your videos to the next level with our easy-to-use features that will save you time and money.\r\n\r\n Don\'t waste any more time on manual video editing tasks when Submagic can do it all for you in seconds.\r\n\r\nTrusted by over 500k creators and businesses, including big names like Grant Cardone and David Goggins.\r\n\r\nWhether you\'re a content creator, video editor, or business owner, Submagic has everything you need to create engaging videos that stand out.\r\n\r\nTry Submagic now and see the difference it can make in your content creation process. click here: https://stopify.co/0SSK0M\r\n\r\nGenerate captions, add B-rolls, create dynamic transitions, highlight key moments with Auto-Zoom, include sound effects, and generate video descriptions all with the power of AI.\r\n\r\nTestimonial: \"Submagic has revolutionized my video editing process. It\'s a game-changer!\" - Jason, Happy Submagic User\r\n\r\nSign up for Submagic today and discover why it\'s the go-to tool for creators worldwide.   https://stopify.co/0SSK0M\r\n\r\nDon\'t miss out on the opportunity to streamline your video editing process with Submagic.\r\n\r\nJoin the thousands of creators already using Submagic and transform your videos today.    https://stopify.co/0SSK0M\r\n\r\nHumorous P.S.: Who needs a magic wand when you have Submagic? Try it out and see the magic happen!\r\n\r\nLet Submagic take your videos from ordinary to extraordinary. Sign up now and unleash your creativity!\r\n\r\nBest regards,\r\n\r\nMark,\r\n\r\nSubmagic Team', '9852672044', 'Dear jpsresidency.in Owner.', 'Boost Your Videos with Submagic - The Best AI Tool for Short-Form Content\r\n\r\nHey there,\r\n\r\nAre you tired of spending hours creating captions, searching for the perfect transitions, and adding sound effects to your videos? \r\n\r\nSubmagic is here to save the day!\r\n\r\nElevate your content creation game with Submagic, the ultimate AI tool for short-form content.\r\n\r\nTake your videos to the next level with our easy-to-use features that will save you time and money.\r\n\r\n Don\'t waste any more time on manual video editing tasks when Submagic can do it all for you in seconds.\r\n\r\nTrusted by over 500k creators and businesses, including big names like Grant Cardone and David Goggins.\r\n\r\nWhether you\'re a content creator, video editor, or business owner, Submagic has everything you need to create engaging videos that stand out.\r\n\r\nTry Submagic now and see the difference it can make in your content creation process. click here: https://stopify.co/0SSK0M\r\n\r\nGenerate captions, add B-rolls, create dynamic transitions, highlight key moments with Auto-Zoom, include sound effects, and generate video descriptions all with the power of AI.\r\n\r\nTestimonial: \"Submagic has revolutionized my video editing process. It\'s a game-changer!\" - Jason, Happy Submagic User\r\n\r\nSign up for Submagic today and discover why it\'s the go-to tool for creators worldwide.   https://stopify.co/0SSK0M\r\n\r\nDon\'t miss out on the opportunity to streamline your video editing process with Submagic.\r\n\r\nJoin the thousands of creators already using Submagic and transform your videos today.    https://stopify.co/0SSK0M\r\n\r\nHumorous P.S.: Who needs a magic wand when you have Submagic? Try it out and see the magic happen!\r\n\r\nLet Submagic take your videos from ordinary to extraordinary. Sign up now and unleash your creativity!\r\n\r\nBest regards,\r\n\r\nMark,\r\n\r\nSubmagic Team'),
(183, 1721493345, NULL, 'Felicity Sauncho', 'felicitysauncho@gmail.com', 'Hi there,\r\n\r\nWe run a Youtube growth service, where we can increase your subscriber count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new subscribers each month.\r\n- Real, human subscribers who subscribe because they are interested in your channel/videos.\r\n- Safe: All actions are done, without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nIf you are interested then we can discuss further.\r\n\r\nKind Regards,\r\nFelicity', '218823660', 'YouTube Promotion: Grow your subscribers by 700-1500 each month', 'Hi there,\r\n\r\nWe run a Youtube growth service, where we can increase your subscriber count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new subscribers each month.\r\n- Real, human subscribers who subscribe because they are interested in your channel/videos.\r\n- Safe: All actions are done, without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nIf you are interested then we can discuss further.\r\n\r\nKind Regards,\r\nFelicity\r\n\r\nUnsubscribe: https://removeme.click/yt/unsubscribe.php?d=jpsresidency.in'),
(184, 1721494122, NULL, 'James', 'sal.lomax@gmail.com', 'Work From Home With This 100% FREE Training..., I Promise...You Will Never Look Back\r\n$500+ per day, TRUE -100% Free Training, go here:\r\n\r\nezwayto1000aday.com', '985 44 959', 'Dear jpsresidency.in Webmaster.', 'Work From Home With This 100% FREE Training..., I Promise...You Will Never Look Back\r\n$500+ per day, TRUE -100% Free Training, go here:\r\n\r\nezwayto1000aday.com'),
(185, 1721547498, NULL, 'Mike Daniels\r\n', 'mikeAlkandy@gmail.com', 'https://jpsresidency.in', '82233412786', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.co/join-affiliates/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Daniels\r\n \r\nMonkey Digital \r\nhttps://www.monkeydigital.co/whatsapp-affiliates/'),
(186, 1721680670, NULL, 'Mike Little\r\n', 'mikeAlkandy@gmail.com', 'https://jpsresidency.in', '83895958876', 'NEW: semrush backlinks available on sale', 'Hello \r\nThis is Mike Little\r\nfrom Strictly Digital \r\n \r\nLet me present to you our latest discovered from the SEO environment. \r\nWe have noticed that getting backlinks from websites that have high SEO metrics values doesn\'t always help, and in fact, what is more important is to have backlinks from sites that are actually ranking for many keywords. \r\n \r\nThus, we have built this service especially to meet these new discoveries and the results are astonishing. \r\n \r\nPlease check more details here: \r\nhttps://www.strictlyseonet.com/semrush-backlinks \r\n \r\n \r\n \r\nRegards, \r\nStrictly Digital SEO Team \r\n \r\nWhatsapp us for more details: \r\nhttps://www.strictlyseonet.com/whatsapp-us/'),
(187, 1721766324, NULL, 'Megan Maestas', 'megan.maestas16@hotmail.com', 'hi!\r\n\r\nExplode Your Earnings:(Seriously!): SECRET EMAIL SYSTEM\r\n\r\nWithout Ever Creating Product, Without Fulfilling Services, Without Running Ads, or Ever Doing Customer Service – And Best of All Only Working 30 Minutes A Day, All While Automatically Generating Sales 24/7\r\n\r\ncheck how now:\r\nhttps://bit.ly/copy_my_business_now_ebook (copy high succes strategy now)\r\n\r\n', '1168588954', 'Crazy system that helps aloooot!!', 'hi!\r\n\r\nExplode Your Earnings:(Seriously!): SECRET EMAIL SYSTEM\r\n\r\nWithout Ever Creating Product, Without Fulfilling Services, Without Running Ads, or Ever Doing Customer Service – And Best of All Only Working 30 Minutes A Day, All While Automatically Generating Sales 24/7\r\n\r\ncheck how now:\r\nhttps://bit.ly/copy_my_business_now_ebook (copy high succes strategy now)\r\n\r\n'),
(188, 1721778882, NULL, 'Latrice Stelzer', 'latrice.stelzer@gmail.com', 'Hi\r\n\r\nUnlock the secret to earning over $300 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  https://tinyurl.com/2s4kzy36\r\n\r\nYours sincerely\r\nLatrice\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nFrance, NORD-PAS-DE-CALAIS, Cambrai, 59400, 37 Rue Marie De Medicis\r\nTo stop any further communication from us, please reply to this email...', '390439915', 'Learn How to Earn Up to $300 Per Day...', 'Greetings\r\n\r\nUnlock the secret to earning over $300 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  https://tinyurl.com/2s4kzy36\r\n\r\nKind regards\r\nLatrice\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nFrance, NORD-PAS-DE-CALAIS, Cambrai, 59400, 37 Rue Marie De Medicis\r\nTo stop any further communication from us, please reply to this email...');
INSERT INTO `pm_message` (`id`, `add_date`, `edit_date`, `name`, `email`, `address`, `phone`, `subject`, `msg`) VALUES
(189, 1721818149, NULL, 'SEObyAxy', 'seosubmitter@mail.com', 'Hello\r\n\r\nMy name is Axy, and I am excited to introduce you to our comprehensive SEO services designed to boost your online visibility and drive more traffic to your website.\r\n\r\nWe understand that in today\'s competitive digital landscape, having a well-optimized website is crucial for success. \r\n\r\nThat\'s why we are offering a FREE Off-Page & On-Page SEO Audit to help you get started on the right foot.\r\n\r\nHERE\'S WHAT WE CAN DO FOR YOU:\r\n[+] Comprehensive Site Analysis: We will thoroughly check your website and create a customized Full SEO Campaign tailored to your specific needs.\r\n[+] Keyword Research: Our team will identify the most effective keywords to promote for each individual page of your site.\r\n[+] Page-by-Page Evaluation: We will review every page of your website and provide recommendations on the best package to buy and necessary changes to improve your SEO score.\r\n[+] Customized SEO Strategies: If you want to target specific keywords, we will guide you on where to make changes for optimal results.\r\n[+] Personalized SEO Packages: We can create SEO promotion packages customized to your needs or based on your budget.\r\n\r\nWe are committed to helping you achieve your business goals by enhancing your online presence. \r\n\r\nPlease feel free to reach out if you have any questions or if you are ready to take advantage of our free SEO audit.\r\n\r\n==>> https://t.ly/gw63W\r\n\r\nThank you for your time, and we look forward to working with you to make your website stand out!\r\n\r\nThanks,\r\nSEObyAxy\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\n\r\nAustralia, QLD, Park Ridge, 4125, 16 Kintyre Street\r\nTo stop any further communication from us, please reply to this email with subject: Unsubscribe jpsresidency.in', '731263546', 'Do You Need SEO Audit for Your Website jpsresidency.in?', 'Good day\r\n\r\nMy name is Axy, and I am excited to introduce you to our comprehensive SEO services designed to boost your online visibility and drive more traffic to your website.\r\n\r\nWe understand that in today\'s competitive digital landscape, having a well-optimized website is crucial for success. \r\n\r\nThat\'s why we are offering a FREE Off-Page & On-Page SEO Audit to help you get started on the right foot.\r\n\r\nHERE\'S WHAT WE CAN DO FOR YOU:\r\n[+] Comprehensive Site Analysis: We will thoroughly check your website and create a customized Full SEO Campaign tailored to your specific needs.\r\n[+] Keyword Research: Our team will identify the most effective keywords to promote for each individual page of your site.\r\n[+] Page-by-Page Evaluation: We will review every page of your website and provide recommendations on the best package to buy and necessary changes to improve your SEO score.\r\n[+] Customized SEO Strategies: If you want to target specific keywords, we will guide you on where to make changes for optimal results.\r\n[+] Personalized SEO Packages: We can create SEO promotion packages customized to your needs or based on your budget.\r\n\r\nWe are committed to helping you achieve your business goals by enhancing your online presence. \r\n\r\nPlease feel free to reach out if you have any questions or if you are ready to take advantage of our free SEO audit.\r\n\r\n==>> https://t.ly/gw63W\r\n\r\nThank you for your time, and we look forward to working with you to make your website stand out!\r\n\r\nThanks,\r\nSEObyAxy\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\n\r\nAustralia, QLD, Park Ridge, 4125, 16 Kintyre Street\r\nTo stop any further communication from us, please reply to this email with subject: Unsubscribe jpsresidency.in'),
(190, 1721854617, NULL, 'Sanora Rosado', 'rosado.sanora@msn.com', 'Good day\r\n\r\nUnlock the secret to earning over $100 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  https://tinyurl.com/3zm2xkx3\r\n\r\nSincerely\r\nSanora\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nFrance, CENTRE, Vanves, 92170, 91 Boulevard D\'alsace\r\nTo stop any further communication from us, please reply to this email...', '103073371', 'Learn How to Earn Up to $100 Per Day...', 'Good day\r\n\r\nUnlock the secret to earning over $100 daily, starting right now. \r\n\r\nDiscover how effortless it is – anyone can do it... \r\n\r\nDon\'t miss this exclusive opportunity. \r\n\r\nClick here to get started! =>  https://tinyurl.com/3zm2xkx3\r\n\r\nWarm regards\r\nSanora\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nFrance, CENTRE, Vanves, 92170, 91 Boulevard D\'alsace\r\nTo stop any further communication from us, please reply to this email...'),
(191, 1721898037, NULL, 'Jeffrey King', 'jayson.toledo@businessconfidencesurvey.org', 'Hi,\r\n\r\nShape the future of by completing the 2024 Business Confidence Survey\r\n\r\nIn return you will receive tailored insights relevant to your industry.  Your input will help create better policies and opportunities.\r\n\r\nIt takes 5 minutes. Visit: www.businessconfidence.org or https://itc.formaloo.me/bce321. \r\n\r\nAll responses are confidential.\r\n\r\nOpt-out https://itc.formaloo.me/p00hbb \r\n\r\nRegards,\r\nITC.', '8436742732', 'Feedback Requested', 'Hi,\r\n\r\nShape the future of by completing the 2024 Business Confidence Survey\r\n\r\nIn return you will receive tailored insights relevant to your industry.  Your input will help create better policies and opportunities.\r\n\r\nIt takes 5 minutes. Visit: www.businessconfidence.org or https://itc.formaloo.me/bce321. \r\n\r\nAll responses are confidential.\r\n\r\nOpt-out https://itc.formaloo.me/p00hbb \r\n\r\nRegards,\r\nITC.'),
(192, 1721907998, NULL, 'Michaelodozy', 'bryanleslie7923@icloud.com', 'https://accstores.com', '86446443369', 'Collaborate for Change: Join Accstores.com in Championing Accessibility', 'https://Accstores.com: Your hub for accessible web solutions. We specialize in providing tools and services to ensure websites are inclusive for all users. Join us in creating a web that\'s accessible to everyone. \r\n \r\n \r\nvisit The Next Web Page \r\nhttps://Accstores.com'),
(193, 1721996640, NULL, 'Malorie Palafox', 'malorie.palafox44@yahoo.com', 'The battle for the SERPs for specific keywords can become a battleground, many times.\r\n\r\nIts people`s nature to attack and harm where there is no force to put things right.\r\n\r\nNow you can fight back and return the Negative SEO to them\r\nhttps://www.speed-seo.net/product/negative-seo-service/\r\n\r\n\r\nor whatsapp us:\r\nhttps://www.speed-seo.net/negative-seo-whatsapp/', '183181010', 'Destroy unfair competitors ranks', 'The battle for the SERPs for specific keywords can become a battleground, many times.\r\n\r\nIts people`s nature to attack and harm where there is no force to put things right.\r\n\r\nNow you can fight back and return the Negative SEO to them\r\nhttps://www.speed-seo.net/product/negative-seo-service/\r\n\r\n\r\nor whatsapp us:\r\nhttps://www.speed-seo.net/negative-seo-whatsapp/'),
(194, 1722000289, NULL, 'Katelyn Raiden', 'katelynraiden@gmail.com', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nKatelyn\r\n\r\nUnsubscribe: https://removeme.click/yt/unsubscribe.php?d=jpsresidency.in', '416560958', 'YouTube Promotion: Grow your subscribers by 700-1500 each month', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nKatelyn\r\n\r\nUnsubscribe: https://removeme.click/yt/unsubscribe.php?d=jpsresidency.in'),
(195, 1722003172, NULL, 'Omar Karp', 'creatify64@gmail.com', 'Hi,\r\nI am Omar , I am offering for your website or Producrts  free Marketing short video that you can use it freely in any of your social accounts or Youtube channel , if you are Intrested ,\r\n\r\n please put your details here and I will sent you the Free video ===> https://tinyurl.com/5btpxwsk\r\n\r\nRegards', '3202634752', 'I will create free Marketing short Videos for you !', 'Hi,\r\nI am Omar , I am offering for your website or Producrts  free Marketing short video that you can use it freely in any of your social accounts or Youtube channel , if you are Intrested ,\r\n\r\n please put your details here and I will sent you the Free video ===> https://tinyurl.com/5btpxwsk\r\n\r\nRegards'),
(196, 1722006467, NULL, 'Albertha Calvert', 'albertha.calvert22@yahoo.com', 'Hello\r\n\r\nDiscover our time-tested system for generating passive affiliate commissions around the clock. Simply copy and paste our ready-made funnels, campaigns, and promotional pages to replicate our exact success formula.\r\n\r\nExperience the benefits of a system designed for simplicity and efficiency. With minimal effort, you can start earning consistently without the guesswork or trial and error.\r\n\r\nDon\'t miss this opportunity to transform your income strategy. \r\n\r\nClick here to get started and unlock your path to financial freedom today! =>  https://shorturl.at/2tpCB\r\n\r\nYours truly\r\nAlbertha\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nFrance, CENTRE, Cannes-La-Bocca, 6150, 23 Rue Marie De Medicis\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '455656584', 'Subject: Unlock 24/7 Passive Income with Our Proven System', 'Hi\r\n\r\nDiscover our time-tested system for generating passive affiliate commissions around the clock. Simply copy and paste our ready-made funnels, campaigns, and promotional pages to replicate our exact success formula.\r\n\r\nExperience the benefits of a system designed for simplicity and efficiency. With minimal effort, you can start earning consistently without the guesswork or trial and error.\r\n\r\nDon\'t miss this opportunity to transform your income strategy. \r\n\r\nClick here to get started and unlock your path to financial freedom today! =>  https://shorturl.at/2tpCB\r\n\r\nYours sincerely\r\nAlbertha\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nFrance, CENTRE, Cannes-La-Bocca, 6150, 23 Rue Marie De Medicis\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(197, 1722013686, NULL, 'Blanca Pitman', 'blanca.pitman@outlook.com', 'Hello\r\n\r\nAre you tired of spending endless hours creating content that just doesn’t convert? What if I told you there’s a way to turn your favorite YouTube videos into cash machines instantly?\r\n\r\nIntroducing TubeMagic A.I. – the revolutionary tool that transforms YouTube videos into high-ranking, SEO-optimized blog posts, viral social media content, and more with just a click. Imagine the possibilities!\r\n\r\nSay goodbye to writer\'s block and hello to effortless content creation. With TubeMagic A.I., you can dominate search engines and drive massive organic traffic to your site, all while making money online \r\n\r\nReady to see the magic in action? Click here to get started with TubeMagic A.I. today!\r\n ==>  https://shorturl.at/fmPRV\r\n\r\nYours truly\r\nBlanca\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nAustralia, NSW, Flinders, 2529, 82 Avondale Drive\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '242724444', 'Turn YouTube Videos into Cash Machines Instantly!', 'Hi\r\n\r\nAre you tired of spending endless hours creating content that just doesn’t convert? What if I told you there’s a way to turn your favorite YouTube videos into cash machines instantly?\r\n\r\nIntroducing TubeMagic A.I. – the revolutionary tool that transforms YouTube videos into high-ranking, SEO-optimized blog posts, viral social media content, and more with just a click. Imagine the possibilities!\r\n\r\nSay goodbye to writer\'s block and hello to effortless content creation. With TubeMagic A.I., you can dominate search engines and drive massive organic traffic to your site, all while making money online \r\n\r\nReady to see the magic in action? Click here to get started with TubeMagic A.I. today!\r\n ==>  https://shorturl.at/fmPRV\r\n\r\nYours sincerely\r\nBlanca\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nAustralia, NSW, Flinders, 2529, 82 Avondale Drive\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(198, 1722017994, NULL, 'Beatrice Denton', 'denton.beatrice@gmail.com', 'Greetings\r\n\r\nUnlock the potential of your Instagram and social media accounts with our powerful and user-friendly cloud-based app. Our software helps you bypass the one-link limitation of Instagram, allowing you to generate leads, sales, and grow your brand effortlessly.\r\n\r\nExperience the benefits of creating effective landing pages that drive traffic, build your email list, and produce passive affiliate commissions—all with zero cost traffic. Our app is designed to simplify the process and maximize your online presence.\r\n\r\nDon’t miss out! Start your journey to social media success today. \r\n\r\nClick here to get started and see the results for yourself  =>  https://shorturl.at/oaKvK\r\n\r\nWarm regards\r\nBeatrice\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nAustralia, NSW, Rixs Creek, 2330, 56 Milbrodale Road\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '249252821', 'Transform Your Social Media Presence with Our New Software!', 'Hi\r\n\r\nUnlock the potential of your Instagram and social media accounts with our powerful and user-friendly cloud-based app. Our software helps you bypass the one-link limitation of Instagram, allowing you to generate leads, sales, and grow your brand effortlessly.\r\n\r\nExperience the benefits of creating effective landing pages that drive traffic, build your email list, and produce passive affiliate commissions—all with zero cost traffic. Our app is designed to simplify the process and maximize your online presence.\r\n\r\nDon’t miss out! Start your journey to social media success today. \r\n\r\nClick here to get started and see the results for yourself  =>  https://shorturl.at/oaKvK\r\n\r\nThank you\r\nBeatrice\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nAustralia, NSW, Rixs Creek, 2330, 56 Milbrodale Road\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(199, 1722042664, NULL, 'Arthur Dickey', 'dickey.walter@gmail.com', 'Looking to develop your own GPT, AI, or machine learning application? You\'re in the right place.\r\n\r\nOur experience includes working with large companies like Merck and Siemens, along with numerous smaller firms.\r\n\r\n\r\nOur approach is:\r\n\r\nBusiness-results oriented\r\nCommunicative in easy-to-understand language\r\nEfficient with small, focused teams that prioritize progress over lengthy discussions\r\nExtremely selective in our hiring, requiring thousands of candidates to find the perfect fit\r\nOur expertise covers:\r\n\r\nPython machine learning\r\nData science\r\nNatural Language Processing (NLP)\r\nAI website development\r\nChatGPT integration\r\nBuilding AI SaaS platforms\r\nOpenAI technologies\r\n\r\nClick Here and let us discus your Idea:\r\n\r\nhttps://tinyurl.com/36zcnxxm', '240494563', 'Create your Own AI  GPT', 'Looking to develop your own GPT, AI, or machine learning application? You\'re in the right place.\r\n\r\nOur experience includes working with large companies like Merck and Siemens, along with numerous smaller firms.\r\n\r\n\r\nOur approach is:\r\n\r\nBusiness-results oriented\r\nCommunicative in easy-to-understand language\r\nEfficient with small, focused teams that prioritize progress over lengthy discussions\r\nExtremely selective in our hiring, requiring thousands of candidates to find the perfect fit\r\nOur expertise covers:\r\n\r\nPython machine learning\r\nData science\r\nNatural Language Processing (NLP)\r\nAI website development\r\nChatGPT integration\r\nBuilding AI SaaS platforms\r\nOpenAI technologies\r\n\r\nClick Here and let us discus your Idea:\r\n\r\nhttps://tinyurl.com/36zcnxxm'),
(200, 1722057372, NULL, 'Matthew Williams', 'futurosalesco@gmail.com', 'Hey there!\r\n\r\nWe’ve helped many businesses boost their efficiency through automation. But don’t just take our word for it—hear from our satisfied clients.\r\n\r\nReady to see if automation is right for you? Take our quick quiz!\r\n\r\nhttps://tally.so/r/3N6yBB\r\n\r\nBest,  \r\nMatthew Williams  \r\nPresident, ARSource\r\n', '290636004', 'Hear What Our Clients Are Saying', 'Hey there!\r\n\r\nWe’ve helped many businesses boost their efficiency through automation. But don’t just take our word for it—hear from our satisfied clients.\r\n\r\nReady to see if automation is right for you? Take our quick quiz!\r\n\r\nhttps://tally.so/r/3N6yBB\r\n\r\nBest,  \r\nMatthew Williams  \r\nPresident, ARSource\r\n'),
(201, 1722087436, NULL, 'Carlosgoape', 'inet4747@outlook.com', '', '86958398765', 'You sleep. PC earns money', '<a href=https://app.getgrass.io/register/?referralCode=ftQcOU_kA-dCl9V>You are sleeping - your PC is collecting crypto. The Grasse Network uses 1% of your PC to collect artificial intelligence data from the Internet. Join for free. You can now connect your Solana wallet to Grass</a>'),
(202, 1722172486, NULL, 'Iona McCaskill', 'mccaskill.iona@yahoo.com', 'hi!\r\n\r\nExplode Your Earnings:(Seriously!): SECRET EMAIL SYSTEM\r\n\r\nWithout Ever Creating Product, Without Fulfilling Services, Without Running Ads, or Ever Doing Customer Service – And Best of All Only Working 30 Minutes A Day, All While Automatically Generating Sales 24/7\r\n\r\ncheck how now:\r\nhttps://bit.ly/copy_my_business_now_ebook (copy high succes strategy now)\r\n\r\n', '6508473466', 'Crazy system that helps aloooot!!', 'hi!\r\n\r\nExplode Your Earnings:(Seriously!): SECRET EMAIL SYSTEM\r\n\r\nWithout Ever Creating Product, Without Fulfilling Services, Without Running Ads, or Ever Doing Customer Service – And Best of All Only Working 30 Minutes A Day, All While Automatically Generating Sales 24/7\r\n\r\ncheck how now:\r\nhttps://bit.ly/copy_my_business_now_ebook (copy high succes strategy now)\r\n\r\n'),
(203, 1722190969, NULL, 'SEObyAxy', 'seosubmitter@mail.com', 'Hi jpsresidency.in Administrator\r\n\r\nARE YOU SEEKING HIGH-QUALITY ORGANIC WEBSITE TRAFFIC?\r\n\r\nBoost your online presence and skyrocket your profits with our exclusive Website Traffic service.\r\n\r\nWHY CHOOSE US?\r\n[+] Real Visitors Only: No bots or proxies, just genuine visitors.\r\n[+] Targeted Traffic: Get visitors from search engines and referral traffic from social media.\r\n[+]  Proven Results: Many of our clients have seen significant increases in traffic and sales.\r\n\r\nWHAT OUR CLIENTS SAY:\r\n\"I saw a huge boost in my website\'s traffic and a significant rise in my sales after using their service.\" - [Client Name; Margarette], [Company: Margarette]\r\n\r\nSPECIAL OFFER JUST FOR YOU:\r\nFor a limited time, enjoy the discount on your first purchase of our Website Traffic service. Don’t miss out on this chance to enhance your online presence and grow your business.\r\n\r\nGet Started Now and Watch Your Traffic Soar =>> https://t.ly/U6CCE\r\n\r\nIf you have any questions or need more information, feel free to contact us.\r\n\r\nBest regards,\r\nSEObyAxy\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n   \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nAustralia, VIC, Nar Nar Goon, 3812, 3 Rose Street\r\nTo stop any further communication through your website form, Please reply with subject:  Unsubscribe jpsresidency.in', '353527774', 'Do You Need Website Traffic for Your Website jpsresidency.in?', 'To the jpsresidency.in Webmaster\r\n\r\nARE YOU SEEKING HIGH-QUALITY ORGANIC WEBSITE TRAFFIC?\r\n\r\nBoost your online presence and skyrocket your profits with our exclusive Website Traffic service.\r\n\r\nWHY CHOOSE US?\r\n[+] Real Visitors Only: No bots or proxies, just genuine visitors.\r\n[+] Targeted Traffic: Get visitors from search engines and referral traffic from social media.\r\n[+]  Proven Results: Many of our clients have seen significant increases in traffic and sales.\r\n\r\nWHAT OUR CLIENTS SAY:\r\n\"I saw a huge boost in my website\'s traffic and a significant rise in my sales after using their service.\" - [Client Name; Margarette], [Company: Margarette]\r\n\r\nSPECIAL OFFER JUST FOR YOU:\r\nFor a limited time, enjoy the discount on your first purchase of our Website Traffic service. Don’t miss out on this chance to enhance your online presence and grow your business.\r\n\r\nGet Started Now and Watch Your Traffic Soar =>> https://t.ly/U6CCE\r\n\r\nIf you have any questions or need more information, feel free to contact us.\r\n\r\nBest regards,\r\nSEObyAxy\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n   \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nAustralia, VIC, Nar Nar Goon, 3812, 3 Rose Street\r\nTo stop any further communication through your website form, Please reply with subject:  Unsubscribe jpsresidency.in'),
(204, 1722220363, NULL, 'Celesta Cottee', 'cottee.celesta75@gmail.com', 'Hi\r\n\r\nIntroducing the ultimate solution to skyrocket your income effortlessly: our Copy and Paste System. Just set it up once, and watch as you gain unlimited buyer subscribers and recurring commissions without any additional effort.\r\n\r\nExperience the simplicity and efficiency of our system, designed to streamline your process. Maximize your earnings with minimal time investment, allowing you to focus on other aspects of your business or personal life.\r\n\r\nDon\'t miss out on this game-changing opportunity. Click here to start now and transform your earning potential! =>  https://shorturl.at/IwN5Z\r\n\r\nBest regards\r\nCelesta\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nBrazil, PB, Joao Pessoa, 58064-132, Rua Joamir Severino Dos Santos 1962\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '8378678178', 'Revolutionize Your Earnings with Our Copy and Paste System!', 'Hi\r\n\r\nIntroducing the ultimate solution to skyrocket your income effortlessly: our Copy and Paste System. Just set it up once, and watch as you gain unlimited buyer subscribers and recurring commissions without any additional effort.\r\n\r\nExperience the simplicity and efficiency of our system, designed to streamline your process. Maximize your earnings with minimal time investment, allowing you to focus on other aspects of your business or personal life.\r\n\r\nDon\'t miss out on this game-changing opportunity. Click here to start now and transform your earning potential! =>  https://shorturl.at/IwN5Z\r\n\r\nYours truly\r\nCelesta\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nBrazil, PB, Joao Pessoa, 58064-132, Rua Joamir Severino Dos Santos 1962\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(205, 1722293616, NULL, 'Jay', 'fastprocess006@outlook.com', 'Hi,\r\n\r\nThis is Jay. We are a small but experienced team specializing in delivering day-to-day business operational tasks with high-quality support for any department within your organization.\r\n\r\nTake advantage of our flexible hiring options—full-time, part-time, or hourly. We\'re confident in our capabilities and invite you to experience our efficiency with a one or two-day trial.\r\n\r\nContact us at Fastprocess006@outlook.com to see how we can seamlessly integrate into your business and drive success.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '7965707489', 'Boost Your Operational Efficiency with Our Expert Team', 'Hi,\r\n\r\nThis is Jay. We are a small but experienced team specializing in delivering day-to-day business operational tasks with high-quality support for any department within your organization.\r\n\r\nTake advantage of our flexible hiring options—full-time, part-time, or hourly. We\'re confident in our capabilities and invite you to experience our efficiency with a one or two-day trial.\r\n\r\nContact us at Fastprocess006@outlook.com to see how we can seamlessly integrate into your business and drive success.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(206, 1722308658, NULL, 'Ravi Seaman', 'seaman.kendrick52@gmail.com', 'Hi,\r\nMy name is Ravi, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n I recently grew my client’s organic search traffic  with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/yycmkjf6\r\n\r\n\r\n', '49052686', 'Why You are not in Googles search first Page?', 'Hi,\r\nMy name is Ravi, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n I recently grew my client’s organic search traffic  with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/yycmkjf6\r\n\r\n\r\n'),
(207, 1722328523, NULL, 'Phillis Lutes', 'phillis.lutes@googlemail.com', 'I saw that your jpsresidency.in website might be missing out on approximately a thousand visitors daily. Our AI powered traffic system is tailored to enhance your site\'s visibility: https://bit.ly/3W18sB3\r\nWe\'re offering a free trial that includes four thousand targeted visitors to show the potential benefits. After the trial, we can supply up to a quarter million targeted visitors per month. This service could greatly enhance your website\'s reach and engagement.', '436433650', 'Drive more visitors to jpsresidency.in with our effective AI powered traffic system.', 'I noticed that your jpsresidency.in website could be missing out on approximately 1K visitors daily. Our AI powered traffic system is tailored to boost your site\'s visibility: https://bit.ly/3W18sB3\r\nWe\'re offering a free trial that includes 4,000 targeted visitors to show the potential benefits. After the trial, we can supply up to a quarter million targeted visitors per month. This solution could greatly enhance your website\'s reach and engagement.'),
(208, 1722332499, NULL, 'Samira Erwin', 'erwin.samira@msn.com', 'Get An INSTANT FLOOD of Non-Stop HUNGRY LEADS\r\nUsing This SHOCKING HACK That Nobody’s Even Heard Of!\r\nWe Show You How To Turn This FLOOD OF LEADS\r\nInto ONGOING INCOME…\r\nAnd Do It In Just 3 MINUTES!(REAL! SERIOUSLY!)\r\n\r\nCHECK HERE NOW:\r\n\r\nhttps://bit.ly/LeadsIn3MinutesSecretSystem\r\n', '7172422470', 'Dear jpsresidency.in Admin!', 'Get An INSTANT FLOOD of Non-Stop HUNGRY LEADS\r\nUsing This SHOCKING HACK That Nobody’s Even Heard Of!\r\nWe Show You How To Turn This FLOOD OF LEADS\r\nInto ONGOING INCOME…\r\nAnd Do It In Just 3 MINUTES!(REAL! SERIOUSLY!)\r\n\r\nCHECK HERE NOW:\r\n\r\nhttps://bit.ly/LeadsIn3MinutesSecretSystem\r\n'),
(209, 1722399445, NULL, 'Eldon Montalvo', 'eldon.montalvo@gmail.com', 'MUST SEE!\r\n\r\nCreate AI Video\'s in 1 click (every topic)\r\nEnter your idea (every niche) and click generate!=video!\r\n\r\nGuru\'s Don\'t want you to know this! 60 000$/year!\r\nGenearte Shorts videos 9:16 BUT ALSO LONG FORM Video\'s ratio 16:9 (3-4 minutes)\r\nGenerate + post on social media (youtube - tiktok - instagram - facebook - Website..)\r\n\r\nDon\'t spend tons of MONEY to make a channel and video\'s!\r\nNO more hours of working and edditing!\r\n\r\nEnter Idea + genrate = video to post, in 1-2-3!\r\n\r\nfor example youtube channel (generate your videos + shedule them to post)\r\n---> after a while your videos get traction and you have a full income!\r\n\r\nNEVER BEEN EASIER - JOIN THE AI REVOLUION NOW HERE\r\n\r\nhttps://bit.ly/GenerateFullVideosHere', '6602874418', 'To the jpsresidency.in Webmaster!', 'MUST SEE!\r\n\r\nCreate AI Video\'s in 1 click (every topic)\r\nEnter your idea (every niche) and click generate!=video!\r\n\r\nGuru\'s Don\'t want you to know this! 60 000$/year!\r\nGenearte Shorts videos 9:16 BUT ALSO LONG FORM Video\'s ratio 16:9 (3-4 minutes)\r\nGenerate + post on social media (youtube - tiktok - instagram - facebook - Website..)\r\n\r\nDon\'t spend tons of MONEY to make a channel and video\'s!\r\nNO more hours of working and edditing!\r\n\r\nEnter Idea + genrate = video to post, in 1-2-3!\r\n\r\nfor example youtube channel (generate your videos + shedule them to post)\r\n---> after a while your videos get traction and you have a full income!\r\n\r\nNEVER BEEN EASIER - JOIN THE AI REVOLUION NOW HERE\r\n\r\nhttps://bit.ly/GenerateFullVideosHere'),
(210, 1722438618, NULL, 'Mike Day\r\n', 'mikehauddy@gmail.com', 'https://no-site.com', '86829573623', 'Increase rankings with a SEO friendly web design', 'Hi there \r\nI just checked jpsresidency.in ranks and am sorry to bring this up, but it lacks in many areas. \r\n \r\nUnfortunately, building a bunch of links won\'t solve the issue in this case, and a more comprehensive strategy is required. Google has undergone significant changes over the past year, making it nearly impossible to compete for favorable rankings without a well-designed website. \r\n \r\nWe recommend a search engine-friendly website layout to resolve all issues and propel your site to the top. \r\n \r\nYou can check more details here: https://www.speedseo-digital.net/web-design/ \r\n \r\nThanks for your consideration \r\nMike Day\r\nSpeed Designs \r\nhttps://www.speedseo-digital.net/whatapp-us/'),
(211, 1722451157, NULL, 'Ashley McKinlay', 'ashley.mckinlay@gmail.com', 'Hello\r\n\r\nGenerate effortless income of $531 per day with YouTube Channels in just 60 seconds! \r\n\r\nNo technical skills required, no video creation, and no need to be on camera. \r\n\r\nStart now  =>> https://tinyurl.com/yc889ufm\r\n\r\nBest regards\r\nAshley\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nCanada, BC, Montney, V0c 1y0, 3637 Alaska Hwy\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '2506309373', 'Earn $531 per Day With YouTube', 'Hello\r\n\r\nGenerate effortless income of $531 per day with YouTube Channels in just 60 seconds! \r\n\r\nNo technical skills required, no video creation, and no need to be on camera. \r\n\r\nStart now  =>> https://tinyurl.com/yc889ufm\r\n\r\nYours sincerely\r\nAshley\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nCanada, BC, Montney, V0c 1y0, 3637 Alaska Hwy\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(212, 1722478811, NULL, 'Joanna Riggs', 'joannariggs278@gmail.com', 'Hi,\r\n\r\nI just visited jpsresidency.in and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur videos cost just $195 for a 30 second video ($239 for 60 seconds) and include a full script, voice-over and video.\r\n\r\nI can show you some previous videos we\'ve done if you want me to send some over. Let me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna\r\n\r\nUnsubscribe: https://removeme.click/ev/unsubscribe.php?d=jpsresidency.in', '51377365', 'Explainer Video for your website?', 'Hi,\r\n\r\nI just visited jpsresidency.in and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur videos cost just $195 for a 30 second video ($239 for 60 seconds) and include a full script, voice-over and video.\r\n\r\nI can show you some previous videos we\'ve done if you want me to send some over. Let me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna'),
(213, 1722910837, NULL, 'Arlie Diggs', 'arlie.diggs@gmail.com', 'Watch me Rank On Page #1 In 60 Seconds\r\nAnd Get INSTANT TARGETED VISITORS\r\nwithout knowing SEO, without building backlinks or writing any content!\r\n\r\n----> https://bit.ly/3WOOjQo', '882977210', 'How You Can RANK ON THE 1st PAGE Of Google', 'Watch me Rank On Page #1 In 60 Seconds\r\nAnd Get INSTANT TARGETED VISITORS\r\nwithout knowing SEO, without building backlinks or writing any content!\r\n\r\n----> https://bit.ly/3WOOjQo'),
(214, 1722918981, NULL, 'Vicki Cousin', 'vicki.cousin@msn.com', 'The Click Engine - Get 100% REAL Buyer Traffic\r\nTHIS IS AMAZING\r\n\r\nNOT JUST ANOTHER OFFER - this one is very good (!)\r\n\r\ncheck how this amazing co-operation from businesses help eachother out and drive high \r\nconverting traffic on autopilot to your offer\r\n\r\nWe all work togheter, you just add your affiliatelink in the pool and your good to go\r\n\r\nI had 23 leads in the first month and 2 sales from them. And it\'s dirty cheap because of the co-operation.\r\n\r\nadd your link here:\r\nhttps://lllpg.com/yrxsvhww/', '6625826366', 'Hello jpsresidency.in Administrator!', 'The Click Engine - Get 100% REAL Buyer Traffic\r\nTHIS IS AMAZING\r\n\r\nNOT JUST ANOTHER OFFER - this one is very good (!)\r\n\r\ncheck how this amazing co-operation from businesses help eachother out and drive high \r\nconverting traffic on autopilot to your offer\r\n\r\nWe all work togheter, you just add your affiliatelink in the pool and your good to go\r\n\r\nI had 23 leads in the first month and 2 sales from them. And it\'s dirty cheap because of the co-operation.\r\n\r\nadd your link here:\r\nhttps://lllpg.com/yrxsvhww/'),
(215, 1723004186, NULL, 'Ravi Sexton', 'sexton.toney@googlemail.com', 'Hi,\r\nMy name is Ravi, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n I recently grew my client’s organic search traffic  with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/yycmkjf6\r\n\r\n\r\n', '4426322', 'Why You are not in Googles search first Page?', 'Hi,\r\nMy name is Ravi, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n I recently grew my client’s organic search traffic  with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/yycmkjf6\r\n\r\n\r\n'),
(216, 1723007548, NULL, 'Luckey', 'webdesignservices111@outlook.com', 'Hi, This is Lucky, a website designer and developer. In 17 years of my career, I have worked on broad spectrum of technologies like PHP, WordPress, Codeigniter, Laravel, Opencart, Prestashop, Wix, Html, CSS, JavaScript, Drupal, Shopify, magento. I can help you in creating a new page, new design, resolving issues, upgrading website to latest version, making mobile responsive website, developing new functionality, 3D Model Integration, changing any existing functionality, API integration, Payment gateway or shipping functionality related work, Third-party apps integration in website, monthly maintenance, plugin or theme related work, improving design of all pages or uploading content. I have a couple of team members to assist me on projects. \r\n\r\nLet\'s chat on webdesignservices111@outlook.com with your requirement and I can share pricing and portfolio.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '480806610', 'Website designer and developer', 'Hi, This is Lucky, a website designer and developer. In 17 years of my career, I have worked on broad spectrum of technologies like PHP, WordPress, Codeigniter, Laravel, Opencart, Prestashop, Wix, Html, CSS, JavaScript, Drupal, Shopify, magento. I can help you in creating a new page, new design, resolving issues, upgrading website to latest version, making mobile responsive website, developing new functionality, 3D Model Integration, changing any existing functionality, API integration, Payment gateway or shipping functionality related work, Third-party apps integration in website, monthly maintenance, plugin or theme related work, improving design of all pages or uploading content. I have a couple of team members to assist me on projects. \r\n\r\nLet\'s chat on webdesignservices111@outlook.com with your requirement and I can share pricing and portfolio.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(217, 1723017930, NULL, 'Mike Walker\r\n', 'mikehauddy@gmail.com', 'https://google.com', '88417793212', 'Improve your website`s ranks totally free', 'Hi there, \r\n \r\nWhile checking your jpsresidency.in for its ranks, I have noticed that there are some toxic links pointing towards it. \r\n \r\nGrab your free clean up and improve ranks in no time \r\nhttps://www.hilkom-seo.com/free-links-cleanup/ \r\n \r\nIt really works, get a free backlinks clean up with us today \r\n \r\n \r\nRegards \r\nMike Walker\r\n \r\nWhatsapp:https://www.hilkom-seo.com/whatsapp-us/'),
(218, 1723021468, NULL, 'Mike Warren\r\n', 'mikehauddy@gmail.com', 'https://jpsresidency.in', '87911614878', 'Social ads country traffic', 'Hello, \r\n \r\nHey, I\'m Mike from Monkey Digital. We offer a highly popular service that costs only 10$ per 5000 social ads visits. \r\n \r\nMore info:  \r\nhttps://www.monkey-seo.com/get-started/ \r\n \r\nTracking will be sent the same day, the advertisement goes live within a few hours, effective and cheap marketing, try it out, it will be worth every penny. \r\n \r\nRegards \r\nMonkey Digital \r\nhttps://www.monkey-seo.com/whatsapp-us/'),
(219, 1723158134, NULL, 'Hannah Zeigler', 'hannah.zeigler@googlemail.com', 'Hello\r\n\r\nReady to dominate TikTok? \r\n\r\nOur game-changing AI app empowers you to create professional-quality short videos effortlessly!\r\n\r\nDon\'t miss out! Grab your ticket to TikTok success now\r\n\r\nSEE HERE => https://tinyurl.com/yb5cvmf5\r\n\r\nRespectfully\r\nHannah\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nGermany, BY, Obersu?Bach, 84101, Neuer Jungfernstieg 37\r\nTo stop any further communication with jpsresidency.in, please reply to this email...', '8708824937', 'Haw To Make $330/Day From Ai Video Shorts...', 'Hello\r\n\r\nReady to dominate TikTok? \r\n\r\nOur game-changing AI app empowers you to create professional-quality short videos effortlessly!\r\n\r\nDon\'t miss out! Grab your ticket to TikTok success now\r\n\r\nSEE HERE => https://tinyurl.com/yb5cvmf5\r\n\r\nRespectfully\r\nHannah\r\n  \r\n\r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n\r\n\r\n \r\nGermany, BY, Obersu?Bach, 84101, Neuer Jungfernstieg 37\r\nTo stop any further communication with jpsresidency.in, please reply to this email...'),
(220, 1723159219, NULL, 'SEObyAxy', 'seosubmitter@mail.com', 'To the jpsresidency.in Webmaster\r\n\r\nBOOST YOUR RANKINGS WITH HIGH-QUALITY BACKLINKS!\r\n\r\nDo you want to increase your online visibility and attract more organic traffic to your website? With our premium SEO Backlinks Services, it\'s possible!\r\n\r\nWHY CHOOSE OUR SERVICES?\r\n[+] Guaranteed Results: Purchase authentic and relevant backlinks that will improve your search engine rankings.\r\n[+] Maximum Visibility: Turn your website into a magnet for organic traffic.\r\n[+] Proven Expertise: We have a team of experienced SEO experts dedicated to your success.\r\n\r\nWHAT OUR CLIENTS SAY:\r\n\"I noticed a significant increase in organic traffic and sales after we started using their backlinking services.\" - [Client Name; Jerald], [Company: Jerald]\r\n\r\nSPECIAL OFFER FOR YOU:\r\nFor a limited time, we are offering discount... Don\'t miss this opportunity to propel your business to the top of search results!\r\n\r\nAccess Now and Transform Your Website =>> https://t.ly/aG0Is\r\n\r\nIf you have any questions or want to learn more about how we can help you, don\'t hesitate to contact us.\r\n\r\nThanks, \r\nSEObyAxy\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nItaly, AQ, Petrella Liri, 67060, Via Catullo 106\r\nTo stop any further communication through your website form, Please reply with subject:  Unsubscribe jpsresidency.in', '3772117580', 'Do You Need Backlinks for Your Website jpsresidency.in?', 'Dear jpsresidency.in Admin\r\n\r\nBOOST YOUR RANKINGS WITH HIGH-QUALITY BACKLINKS!\r\n\r\nDo you want to increase your online visibility and attract more organic traffic to your website? With our premium SEO Backlinks Services, it\'s possible!\r\n\r\nWHY CHOOSE OUR SERVICES?\r\n[+] Guaranteed Results: Purchase authentic and relevant backlinks that will improve your search engine rankings.\r\n[+] Maximum Visibility: Turn your website into a magnet for organic traffic.\r\n[+] Proven Expertise: We have a team of experienced SEO experts dedicated to your success.\r\n\r\nWHAT OUR CLIENTS SAY:\r\n\"I noticed a significant increase in organic traffic and sales after we started using their backlinking services.\" - [Client Name; Jerald], [Company: Jerald]\r\n\r\nSPECIAL OFFER FOR YOU:\r\nFor a limited time, we are offering discount... Don\'t miss this opportunity to propel your business to the top of search results!\r\n\r\nAccess Now and Transform Your Website =>> https://t.ly/aG0Is\r\n\r\nIf you have any questions or want to learn more about how we can help you, don\'t hesitate to contact us.\r\n\r\nThanks, \r\nSEObyAxy\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nItaly, AQ, Petrella Liri, 67060, Via Catullo 106\r\nTo stop any further communication through your website form, Please reply with subject:  Unsubscribe jpsresidency.in'),
(221, 1723171533, NULL, 'Ingeborg', 'ingeborg.julius@msn.com', 'Are you still looking at getting your website done/ completed? Contact e.solus@gmail.com', '69 570 14 15', 'Hello jpsresidency.in Owner!', 'Are you still looking at getting your website done/ completed? Contact e.solus@gmail.com'),
(222, 1723222576, NULL, 'Omar Beeton', 'creatify64@gmail.com', 'Hi ,\r\nBoost your views by tracking millions of high-performing videos\r\nFind your next video idea, title and thumbnail much faster saving you hours of research and accelerate your views!\r\n\r\nStart Now  ===> https://shorturl.at/RlYNx\r\n\r\nRegards', '335961754', 'Increase your Youtube Views!', 'Hi ,\r\nBoost your views by tracking millions of high-performing videos\r\nFind your next video idea, title and thumbnail much faster saving you hours of research and accelerate your views!\r\n\r\nStart Now  ===> https://shorturl.at/RlYNx\r\n\r\nRegards'),
(223, 1723251597, NULL, 'Ravi Creason', 'star.creason@gmail.com', 'Hi,\r\nMy name is Ravi, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n I recently grew my client’s organic search traffic  with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/yycmkjf6\r\n\r\n\r\n', '29640841', 'Why You are not in Googles search first Page?', 'Hi,\r\nMy name is Ravi, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n I recently grew my client’s organic search traffic  with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/yycmkjf6\r\n\r\n\r\n');
INSERT INTO `pm_message` (`id`, `add_date`, `edit_date`, `name`, `email`, `address`, `phone`, `subject`, `msg`) VALUES
(224, 1723260435, NULL, 'Clara Appel', 'appel.clara@msn.com', 'Hi there\r\nGet unlimited organic website traffic for 6 months, day by day, traffic by specific keywords.\r\n\r\nCheck it  out today\r\nhttps://www.digital-x-press.com/product/unlimited-organic-traffic/\r\n\r\nNote 1: Only English keywords accepted\r\nNote 2: Daily visits depend on the keywords you choose\r\n\r\n\r\nCheers\r\nDigital X SEO Experts\r\nWhatsapp us: https://www.digital-x-press.com/whatsapp-us/', '', 'drive organic traffic to jpsresidency.in for 6 months', 'Hi there\r\nGet unlimited organic website traffic for 6 months, day by day, traffic by specific keywords.\r\n\r\nCheck it  out today\r\nhttps://www.digital-x-press.com/product/unlimited-organic-traffic/\r\n\r\nNote 1: Only English keywords accepted\r\nNote 2: Daily visits depend on the keywords you choose\r\n\r\n\r\nCheers\r\nDigital X SEO Experts\r\nWhatsapp us: https://www.digital-x-press.com/whatsapp-us/'),
(225, 1723369086, NULL, 'Faith Reyes', 'brauer.winifred@gmail.com', 'Have you heard?\r\n\r\nEmbracing sustainability is not just a trend!\r\n\r\nJoin the movement and transform your home or office with eco-friendly solutions.\r\n\r\nDiscover more >>> https://u.to/HH7LIA\r\n\r\nSave money on maintenance while helping the planet.\r\n\r\nFrom energy-efficient appliances and sustainable designs, every step makes a difference.\r\n\r\nAct now and feel the change!\r\n\r\nDon\'t be left behind in sustainability.', '(818) 012-3456', ' Green Solutions for Every Budget ', 'Have you heard?\r\n\r\nGoing green is here to stay!\r\n\r\nJoin the movement and upgrade your environment with sustainable practices.\r\n\r\nLearn more >>> http://alturl.com/94z4v\r\n\r\nSave money on maintenance while preserving nature.\r\n\r\nFrom recycled materials to smart technology, every step matters.\r\n\r\nAct now and experience the benefits!\r\n\r\nBe a leader in eco-conscious living.'),
(226, 1723415815, NULL, 'Nadya Pontius', 'creatify64@gmail.com', 'Hi ,\r\n\r\nI will help you develop your brand and digital marketing strategies over all your social media accounts\r\n\r\n\r\nchat with me now to discusee further ===> https://shorturl.at/NF2Nj\r\n\r\nRegards', '7192530180', 'I will take care !', 'Hi ,\r\n\r\nI will help you develop your brand and digital marketing strategies over all your social media accounts\r\n\r\n\r\nchat with me now to discusee further ===> https://shorturl.at/NF2Nj\r\n\r\nRegards'),
(227, 1723476912, NULL, 'Arin', 'bizassistance008@outlook.com', 'Hello, My name is Arin Roy. I provide data entry services at USD 9/hour. I can work as per instructions and follow step-by-step instructions. \r\n\r\nIf you are interested, Please share your requirements at bizassistance008@outlook.com and we can take a video call.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '3233575350', 'Data entry services', 'Hello, My name is Arin Roy. I provide data entry services at USD 9/hour. I can work as per instructions and follow step-by-step instructions. \r\n\r\nIf you are interested, Please share your requirements at bizassistance008@outlook.com and we can take a video call.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(228, 1723477621, NULL, 'Darla', 'darla.lofton@googlemail.com', 'Hello,\r\n\r\nI hope this email finds you well.\r\n We are reaching out to introduce M.I.H Marketing Agency, the ideal partner for elevating your brand. Our expertise in innovative strategies, tailored campaigns, and data-driven results sets us apart. \r\n\r\nBy partnering with us, we can enhance your brand with the use of:\r\n• Software development \r\n• AI development\r\n• App development\r\n• Website development\r\n• Cyber security\r\n• Virtual private servers\r\n• SEO, SMO, SEM, SERP\r\n• Digital design\r\n• Social media marketing\r\n• International law and accouting\r\n• Clothing design and supply\r\n• White label writers\r\n• White label courses\r\n\r\nIf the service that you are looking for is not listed please reach out to us,as this list does not include all of the services we provide.\r\n\r\nReady to take your marketing to the next level? Let\'s schedule a zoom meeting to discuss how M.I.H can drive your business forward.\r\n\r\nBest regards,\r\nM.I.H Marketing Agency  \r\nmarketingagency.mih@gmail.com', '', 'Elevate Your Business with M.I.H Marketing Agency', 'Hello,\r\n\r\nI hope this email finds you well.\r\n We are reaching out to introduce M.I.H Marketing Agency, the ideal partner for elevating your brand. Our expertise in innovative strategies, tailored campaigns, and data-driven results sets us apart. \r\n\r\nBy partnering with us, we can enhance your brand with the use of:\r\n• Software development \r\n• AI development\r\n• App development\r\n• Website development\r\n• Cyber security\r\n• Virtual private servers\r\n• SEO, SMO, SEM, SERP\r\n• Digital design\r\n• Social media marketing\r\n• International law and accouting\r\n• Clothing design and supply\r\n• White label writers\r\n• White label courses\r\n\r\nIf the service that you are looking for is not listed please reach out to us,as this list does not include all of the services we provide.\r\n\r\nReady to take your marketing to the next level? Let\'s schedule a zoom meeting to discuss how M.I.H can drive your business forward.\r\n\r\nBest regards,\r\nM.I.H Marketing Agency  \r\nmarketingagency.mih@gmail.com'),
(229, 1723486034, NULL, 'Maynard Atkin', 'maynard.atkin45@yahoo.com', 'Experience the power of advanced SEO with SEO Geek\'s two-week free trial! Enhance your website\'s presence and surpass your competitors with our cutting-edge tools and analytics. Key features:\r\n\r\n- Detailed keyword research and analysis\r\n\r\n- Live rank tracking for your target keywords\r\n\r\n- Detailed competitor analysis and benchmarking\r\n\r\n- On-page SEO optimization suggestions\r\n\r\n- Backlink profile analysis and monitoring\r\n\r\n- Site audit tools to identify and fix technical SEO issues\r\n\r\n- Organic ranking report so you know how your site really ranks\r\n\r\n- Spam score report for backlinks\r\n\r\n- AI-powered content creation for images, ads, social media posts, and more\r\n\r\nNo credit card required to start your free two-week trial\r\n\r\nSign up now and take your SEO strategy to the next level with https://bit.ly/seogeekio (seogeek .io)\r\n\r\n\r\n\r\n\r\n\r\nYou can unsubscribe by sending an email with subject \"Unsubscribe\" to hortzsteven@gmail.com\r\nJoachim Lampes Vei 143, Bergen, NA, Norway, 5089', '41946655', 'Cutting-edge SEO Solutions', 'Unlock the power of advanced SEO with seogeek .io 14 days free trial! Elevate your website\'s reach and outperform your competitors with our cutting-edge tools and analytics. Key features:\r\n\r\n- Comprehensive keyword research and analysis\r\n\r\n- Real-time rank tracking for your target keywords\r\n\r\n- Detailed competitor analysis and benchmarking\r\n\r\n- On-page SEO optimization suggestions\r\n\r\n- Backlink analysis and tracking\r\n\r\n- Site audit tools to identify and fix technical SEO issues\r\n\r\n- Organic Keyword report so you know how your site really ranks\r\n\r\n- Backlink report with spam score\r\n\r\n- Content generation with built-in AI for images, ads, social media posts, and more\r\n\r\nNo credit card required to start your no-cost 14 days trial\r\n\r\nGet started now and elevate your SEO game with https://bit.ly/seogeekio (seogeek .io)\r\n\r\n\r\n\r\n\r\n\r\nYou can unsubscribe by sending an email with subject \"Unsubscribe\" to hortzsteven@gmail.com\r\nJoachim Lampes Vei 143, Bergen, NA, Norway, 5089'),
(230, 1723561442, NULL, 'Michaelodozy', 'karinaschlink1883@icloud.com', 'https://accstores.com', '89268969117', 'Shape the Future of the Web: Join Accstores.com\'s Collaborative Community', 'Step into the world of https://Accstores.com, your ultimate destination for web accessibility solutions. Our platform is dedicated to bridging the gap between technology and inclusivity, offering a comprehensive suite of tools and services to ensure that every website is accessible to all users. From automated accessibility testing to expert consulting services, we provide everything businesses need to create inclusive online experiences. Join us in our mission to break down digital barriers and make the web a more inclusive place for everyone. Explore https://Accstores.com today and embark on a journey towards a more accessible future. \r\n \r\n \r\nofficial Website \r\nhttps://Accstores.com'),
(231, 1723730625, NULL, 'Adrienne', 'chirnside.adrienne@gmail.com', 'If you are reading this message, That means my marketing is working. I can make your ad message reach 5 million sites in the same manner for just $50. It\'s the most affordable way to market your business or services. Contact me by email virgo.t3@gmail.com or skype me at live:.cid.dbb061d1dcb9127a\r\n\r\nP.S: Speical Offer - ONLY for 24 hours - 10 Million Sites for the same money $50', '02.31.72.84.29', 'To the jpsresidency.in Webmaster!', 'If you are reading this message, That means my marketing is working. I can make your ad message reach 5 million sites in the same manner for just $50. It\'s the most affordable way to market your business or services. Contact me by email virgo.t3@gmail.com or skype me at live:.cid.dbb061d1dcb9127a\r\n\r\nP.S: Speical Offer - ONLY for 24 hours - 10 Million Sites for the same money $50'),
(232, 1723756230, NULL, 'Liveology Liveology', 'globalselling@liveology.us', 'Sir JPS Residency & Hospitality Services Gurugram\r\n\r\nLIVEOLOGY LIMITED, the almighty juggernaut under the legendary KSCS Group (since 2011), is the undisputed global overlord of Bytedance, flaunting an insane 11-year reign of absolute supremacy!!!\r\n\r\nWe don\'t just create value; we redefine it for our ultra-exclusive global clientele with our earth-shattering solutions! We dominate 6 major cities, backed by a dream team of over 500 superstars and a jaw-dropping 11,000 square meters of prime business territory, including 55 epic live-streaming locations worldwide!!!\r\n\r\nOur mastery in e-commerce development and TikTok influencer marketing is not just legendary—it\'s untouchable!!! We\'re the kings of the industry, and no one even comes close!!!', '6475139466', 'LIVEOLOGY\'s Reign That Leaves Competitors in the Dust!!!', 'Mrs. JPS Residency & Hospitality Services Gurugram\r\n\r\nLIVEOLOGY LIMITED, the almighty juggernaut under the legendary KSCS Group (since 2011), is the undisputed global overlord of Bytedance, flaunting an insane 11-year reign of absolute supremacy!!!\r\n\r\nWe don\'t just create value; we redefine it for our ultra-exclusive global clientele with our earth-shattering solutions! We dominate 6 major cities, backed by a dream team of over 500 superstars and a jaw-dropping 11,000 square meters of prime business territory, including 55 epic live-streaming locations worldwide!!!\r\n\r\nOur mastery in e-commerce development and TikTok influencer marketing is not just legendary—it\'s untouchable!!! We\'re the kings of the industry, and no one even comes close!!!'),
(233, 1723761128, NULL, 'Alex Mercer', 'aibizboosters@gmail.com', 'AI Tools HQ Team Here...\r\n\r\nIf you haven\'t explored AI in business, you\'re missing out on a game-changer! \r\n\r\nThis is your chance to focus on what truly matters—growing your business.\r\n\r\nHigh Level can automate essential operations, saving you time and hassle. \r\n\r\nNow, for a limited time get an exclusive 30 day trial FREE.\r\n\r\nWhy wait to transform your approach?\r\n\r\n==> START YOUR JOURNEY WITH AI AT HTTPS://AIToolsHQ.net\r\n\r\n~ AI Tools HQ Team\r\n    AIToolsHQ.net\r\n\r\n\r\n\r\n\r\n\r\nAddress: \r\n2412 Irwin St\r\nMelbourne, FL 32901\r\n\r\nTo Opt-out of this list reply with UNSUBSCRIBE in the subject.\r\n\r\njpsresidency.in', '3998596864', 'Unleash AI to Revolutionize Your Business!', 'AI Tools HQ Team Here...\r\n\r\nIf you haven\'t explored AI in business, you\'re missing out on a game-changer! \r\n\r\nThis is your chance to focus on what truly matters—growing your business.\r\n\r\nHigh Level can automate essential operations, saving you time and hassle. \r\n\r\nNow, for a limited time get an exclusive 30 day trial FREE.\r\n\r\nWhy wait to transform your approach?\r\n\r\n==> START YOUR JOURNEY WITH AI AT HTTPS://AIToolsHQ.net\r\n\r\n~ AI Tools HQ Team\r\n    AIToolsHQ.net\r\n\r\n\r\n\r\n\r\n\r\nAddress: \r\n2412 Irwin St\r\nMelbourne, FL 32901\r\n\r\nTo Opt-out of this list reply with UNSUBSCRIBE in the subject.\r\n\r\njpsresidency.in'),
(234, 1723828536, NULL, 'Mike Macey\r\n', 'peterhauddy@gmail.com', 'https://no-site.com', '82394574847', 'Whitehat SEO for jpsresidency.in', 'Hello \r\n \r\nI have just checked  jpsresidency.in for its SEO metrics and saw that your website could use a push. \r\n \r\nWe will improve your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.unlimitedgoogle.com/monthly-seo/ \r\n \r\nRegards \r\nMike Macey\r\n \r\nDigital X SEO Experts \r\nhttps://www.unlimitedgoogle.com/whatsapp-us/'),
(235, 1723861047, NULL, 'Mike Wilson\r\n', 'mikeAlkandy@gmail.com', 'https://jpsresidency.in', '85733873799', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.earn35percent.com/get-started/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Wilson\r\n \r\nMonkey Digital \r\nhttps://www.earn35percent.com/whatsapp-affiliates/'),
(236, 1723929325, NULL, 'Mike MacAdam\r\n', 'mikeAlkandy@gmail.com', 'https://jpsresidency.in', '82227771361', 'NEW: semrush backlinks available on sale', 'Hello \r\nThis is Mike MacAdam\r\nfrom Strictly Digital \r\n \r\nLet me present to you our latest discovered from the SEO environment. \r\nWe have noticed that getting backlinks from websites that have high SEO metrics values doesn\'t always help, and in fact, what is more important is to have backlinks from sites that are actually ranking for many keywords. \r\n \r\nThus, we have built this service especially to meet these new discoveries and the results are astonishing. \r\n \r\nPlease check more details here: \r\nhttps://www.semrushbacklinks.com/get-started/ \r\n \r\n \r\n \r\nRegards, \r\nStrictly Digital SEO Team \r\n \r\nWhatsapp us for more details: \r\nhttps://www.semrushbacklinks.com/whatsapp-us/'),
(237, 1723946794, NULL, 'Jayme', 'jenkin.jayme@outlook.com', 'Hi,\r\n\r\nAre you looking for a quick and hassle-free business loan?\r\n\r\nWe offer a variety of options to suit your needs, including Expansion loans, startup loans, heavy equipment loans, home loans, real estate development loans, construction loans, working capital loans, bridge loans, inventory financing, merchant cash advances, and franchise financing. \r\n\r\nGet the funding you need to achieve your goals with ease. Apply now at www.fundcrownsltd.com/apply-now or email us at: Loan@fundcrownsltd.com\r\n\r\nBest regards. \r\n\r\nDylan Pham\r\nFund Crowns Limited', '0341 69 59 75', 'Dear jpsresidency.in Webmaster!', 'Hi,\r\n\r\nAre you looking for a quick and hassle-free business loan?\r\n\r\nWe offer a variety of options to suit your needs, including Expansion loans, startup loans, heavy equipment loans, home loans, real estate development loans, construction loans, working capital loans, bridge loans, inventory financing, merchant cash advances, and franchise financing. \r\n\r\nGet the funding you need to achieve your goals with ease. Apply now at www.fundcrownsltd.com/apply-now or email us at: Loan@fundcrownsltd.com\r\n\r\nBest regards. \r\n\r\nDylan Pham\r\nFund Crowns Limited'),
(238, 1724129699, NULL, 'Mitchell Haris', 'mitchell.haris@yahoo.com', 'Hello\r\n\r\nIt is with sad regret to inform you that PCXLeads.com is shutting down\r\n\r\nWe have made all our databases available to the public.\r\n\r\nSearch your jpsresidency.in, industry, phone numbers, emails, people..\r\n\r\n25 Million Companies globally\r\n\r\n500 Million Professionals \r\n\r\n143 Countries Included\r\n\r\nGet all this in our shutting down special for $149\r\n\r\nRegards,\r\nPCXLeads.com', '104438848', 'Come check jpsresidency.in on PCXLeads.com', 'Hello\r\n\r\nIt is with sad regret to inform you that PCXLeads.com is shutting down\r\n\r\nWe have made all our databases available to the public.\r\n\r\nSearch your jpsresidency.in, industry, phone numbers, emails, people..\r\n\r\n25 Million Companies globally\r\n\r\n500 Million Professionals \r\n\r\n143 Countries Included\r\n\r\nGet all this in our shutting down special for $149\r\n\r\nRegards,\r\nPCXLeads.com'),
(239, 1724136692, NULL, 'Michaelodozy', 'jessiemendelsohn@icloud.com', 'https://accstores.com', '89322926553', 'Collaborate for a Cause: Accstores.com Seeks Partners in Accessibility Advocacy!', 'Welcome to https://Accstores.com, where accessibility meets innovation. Our platform provides cutting-edge tools and services to ensure every website is inclusive and user-friendly. Join us in our mission to make the web accessible to everyone. Explore https://Accstores.com today and elevate your online presence. \r\n \r\n \r\nplease Click The Next Page \r\nhttps://Accstores.com'),
(240, 1724151118, NULL, 'Ravi Goforth', 'marie.goforth@googlemail.com', 'Hi,\r\nMy name is Ravi, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n I recently grew my client’s organic search traffic  with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/yycmkjf6\r\n\r\n\r\n', '249152977', 'Why You are not in Googles search first Page?', 'Hi,\r\nMy name is Ravi, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n I recently grew my client’s organic search traffic  with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/yycmkjf6\r\n\r\n\r\n'),
(241, 1724168138, NULL, 'Susan Karsh', 'latia.tickell@gmail.com', 'Hello,\r\n\r\nWould you be interested in dropping up to 2 pounds a week without hitting the gym?\r\n\r\nMost people don’t believe this is possible, but it is, because it has been working for me and I never gain the weight back.\r\n\r\nI work for Elebands and we make ultra-thin, fashionable body weight bands that come in 5 - 30 pound sets and they look so sexy and sleek you won’t believe they are weights. \r\n \r\nYou just put them on your wrist, ankle and waist for the entire day and you’ll burn up to 1,500 calories a day, with no workout needed.\r\n \r\nBasically, the added weight makes your body work harder and burn more calories as you go about your day.\r\n \r\nIf you want to lose up to 2 lbs a week, without going to a gym, visit our website here: https://bit.ly/elebands-info\r\n\r\nThis Week, For The Fist 50 Customers, you can get 20% off: Use discount code: TAKE20%OFF\r\n\r\nSusan Karsh\r\nBusiness Development\r\nElebands\r\n \r\nP.S. Even Phil Handy, Former LA Lakers coach said our weight bands are great and help burn calories - watch his video here: https://bit.ly/elebands-phil-handy\r\n\r\n\r\n', '627461735', 'Quick question', 'Hello,\r\n\r\nWould you be interested in dropping up to 2 pounds a week without hitting the gym?\r\n\r\nMost people don’t believe this is possible, but it is, because it has been working for me and I never gain the weight back.\r\n\r\nI work for Elebands and we make ultra-thin, fashionable body weight bands that come in 5 - 30 pound sets and they look so sexy and sleek you won’t believe they are weights. \r\n \r\nYou just put them on your wrist, ankle and waist for the entire day and you’ll burn up to 1,500 calories a day, with no workout needed.\r\n \r\nBasically, the added weight makes your body work harder and burn more calories as you go about your day.\r\n \r\nIf you want to lose up to 2 lbs a week, without going to a gym, visit our website here: https://bit.ly/elebands-info\r\n\r\nThis Week, For The Fist 50 Customers, you can get 20% off: Use discount code: TAKE20%OFF\r\n\r\nSusan Karsh\r\nBusiness Development\r\nElebands\r\n \r\nP.S. Even Phil Handy, Former LA Lakers coach said our weight bands are great and help burn calories - watch his video here: https://bit.ly/elebands-phil-handy\r\n\r\n\r\n'),
(242, 1724265538, NULL, 'Jason Clemens', 'jason.clemens01@gmail.com', 'Hey there, I\'m Jason. I found your website recently and spotted a couple of areas where some small changes could boost your a lot more leads. I\'ve assisted many clients in your industry improve their websites, and they noticed considerable growth in leads as a result.\r\n\r\nI\'m happy to jump on a quick call to discuss these improvements with you. I\'m available this week, so no charge, just to assist.\r\n\r\nTell me the best way to get in touch, and we can schedule a time that works for you. These are straightforward changes and won\'t require much time.\r\n\r\nBest Regards,\r\n\r\nJason Clemens\r\n** Visit: https://bit.ly/FreeWebsiteAuditByJason\r\nOr reply to this email Jason.clemens01@gmail.com or call me at: +1-651-419-8101', '12345687', 'Quick Tweaks for Greater Success', 'Hello, it\'s Jason reaching out. I just stumpled upon your website and spotted a few areas where minor tweaks could boost your more leads. I\'ve assisted many clients in your industry upgrade their websites, and they\'ve seen a significant growth in leads as a result.\r\n\r\nI can schedule a quick call to go over these enhancements with you. I\'m available this week, so free of charge just to help you out lol.\r\n\r\nTell me the best way to get in touch, and we can schedule a time that works for you. These are straightforward changes and won\'t require much time.\r\n\r\nBest,\r\n\r\nJason Clemens\r\n-- Visit: https://bit.ly/FreeWebsiteAuditByJason\r\nOr reply to this email Jason.clemens01@gmail.com or call me at: +1-651-419-8101');

-- --------------------------------------------------------

--
-- Table structure for table `pm_package`
--

CREATE TABLE `pm_package` (
  `id` int(11) NOT NULL,
  `users` text DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `days` text DEFAULT NULL,
  `min_nights` int(11) DEFAULT NULL,
  `max_nights` int(11) DEFAULT NULL,
  `day_start` int(11) DEFAULT NULL,
  `day_end` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_package`
--

INSERT INTO `pm_package` (`id`, `users`, `name`, `days`, `min_nights`, `max_nights`, `day_start`, `day_end`) VALUES
(1, '1', 'Week-end', '5,6,7', 0, 0, NULL, NULL),
(2, '1', 'Night', '1,2,3,4,5,6,7', 1, 100, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pm_page`
--

CREATE TABLE `pm_page` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `title_tag` varchar(250) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `descr` longtext DEFAULT NULL,
  `robots` varchar(20) DEFAULT NULL,
  `keywords` varchar(250) DEFAULT NULL,
  `intro` longtext DEFAULT NULL,
  `text` longtext DEFAULT NULL,
  `id_parent` int(11) DEFAULT NULL,
  `page_model` varchar(50) DEFAULT NULL,
  `article_model` varchar(50) DEFAULT NULL,
  `home` int(11) DEFAULT 0,
  `checked` int(11) DEFAULT 0,
  `rank` int(11) DEFAULT 0,
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `comment` int(11) DEFAULT 0,
  `rating` int(11) DEFAULT 0,
  `system` int(11) DEFAULT 0,
  `show_langs` text DEFAULT NULL,
  `hide_langs` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_page`
--

INSERT INTO `pm_page` (`id`, `lang`, `name`, `title`, `subtitle`, `title_tag`, `alias`, `descr`, `robots`, `keywords`, `intro`, `text`, `id_parent`, `page_model`, `article_model`, `home`, `checked`, `rank`, `add_date`, `edit_date`, `comment`, `rating`, `system`, `show_langs`, `hide_langs`) VALUES
(1, 1, 'Accueil', 'Lorem ipsum dolor sit amet', 'Consectetur adipiscing elit', 'Accueil', '', '', 'index,follow', '', '', '', NULL, 'home', '', 1, 1, 1, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(1, 2, 'Home', 'JPS Residency ', '', 'JPS Residency & Hospitality Services Gurugram', '', '', 'index,follow', '', '', '<p style=\"text-align:justify;\">Welcome to <strong>JPS Residency & Hospitality Services</strong>, a premier destination nestled in the heart of <strong>IMT Manesar, Gurgaon, Haryana</strong>. Since opening our doors in 2015, we have been committed to providing exceptional hospitality services,  with a special focus on making every guest\'s stay memorable. </p><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\"><strong>Whether</strong> you\'re here for a corporate event, a leisurely vacation, or a special celebration like a destination wedding, our goal is to ensure your experience is nothing short of perfect.</p>', NULL, 'home', '', 1, 1, 1, 1715666456, 1716538260, 0, 0, 0, '', ''),
(1, 3, 'ترحيب', 'هو سقطت الساحلية ذات, أن.', 'غير بمعارضة وهولندا، الإقتصادية قد, فقد الفرنسي المعاهدات قد من.', 'ترحيب', '', '', 'index,follow', '', '', '', NULL, 'home', '', 1, 1, 1, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(2, 1, 'Contact', 'Contact', '', 'Contact', 'contact', '', 'index,follow', '', '', '', NULL, 'contact', '', 0, 1, 11, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(2, 2, 'Contact', 'Contact', '', 'Contact', 'contact', '', 'index,follow', '', '', '', NULL, 'contact', '', 0, 1, 11, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(2, 3, 'جهة الاتصال', 'جهة الاتصال', '', 'جهة الاتصال', 'contact', '', 'index,follow', '', '', '', NULL, 'contact', '', 0, 1, 11, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(3, 1, 'Mentions légales', 'Mentions légales', '', 'Mentions légales', 'mentions-legales', '', 'index,follow', '', '', '', NULL, 'page', '', 0, 1, 12, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(3, 2, 'Legal notices', 'Legal notices', '', 'Legal notices', 'legal-notices', '', 'index,follow', '', '', '', NULL, 'page', '', 0, 1, 12, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(3, 3, 'يذكر القانونية', 'يذكر القانونية', '', 'يذكر القانونية', 'legal-notices', '', 'index,follow', '', '', '', NULL, 'page', '', 0, 1, 12, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(4, 1, 'Plan du site', 'Plan du site', '', 'Plan du site', 'plan-site', '', 'index,follow', '', '', '', NULL, 'sitemap', '', 0, 1, 13, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(4, 2, 'Sitemap', 'Sitemap', '', 'Sitemap', 'sitemap', '', 'index,follow', '', '', '', NULL, 'sitemap', '', 0, 1, 13, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(4, 3, 'خريطة الموقع', 'خريطة الموقع', '', 'خريطة الموقع', 'sitemap', '', 'index,follow', '', '', '', NULL, 'sitemap', '', 0, 1, 13, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(5, 1, 'Ma première page', 'Ma première page', '', 'Ma première page', 'my-first-page', '', 'index,follow', '', '', '', NULL, 'page', 'article', 0, 1, 2, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(5, 2, 'Hotel', 'Hotel', '', 'Hotel', 'hotel', '', 'index,follow', '', '', '<p style=\"text-align:justify;\">Welcome to <strong>JPS Residency & Hospitality Services</strong>, a premier destination nestled in the heart of IMT Manesar, Gurgaon, Haryana. Since opening our doors in 2015, we have been committed to providing exceptional hospitality services, with a special focus on making every guest\'s stay memorable. Whether you\'re here for a corporate event, a leisurely vacation, or a special celebration like a destination wedding, our goal is to ensure your experience is nothing short of perfect.</p><p style=\"text-align:justify;\"> </p><figure class=\"image\"><img src=\"https://www.jpsresidency.in/medias/media/big/1/banner1.jpg\" alt=\"\"></figure><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\"><strong>Our Vision</strong></p><p style=\"text-align:justify;\">At JPS Residency, our vision is to be recognized as a leader in the hospitality industry, known for our dedication to excellence and our commitment to creating exceptional experiences for our guests. We strive to blend the warmth of traditional Indian hospitality with modern amenities, ensuring every guest feels both welcomed and comfortable.</p><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\"><strong>Our Location</strong></p><p style=\"text-align:justify;\">Strategically located at Opp 446 E Sec 8, our property offers easy access to major transportation hubs:</p><ul><li style=\"text-align:justify;\"><strong>40 minutes from Indira Gandhi International Airport</strong></li><li style=\"text-align:justify;\"><strong>50 minutes from Bahadurgarh</strong></li><li style=\"text-align:justify;\"><strong>12 minutes from Dwarka Expressway</strong>, providing quick access to major parts of Delhi and Gurgaon</li><li style=\"text-align:justify;\"><strong>Close proximity to local attractions and business hubs</strong></li></ul><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\">This prime location makes our hotel an ideal choice for both domestic and international travelers.</p><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\"><strong>Our Facilities</strong></p><p style=\"text-align:justify;\">JPS Residency spans a sprawling estate that features well-appointed rooms and a host of recreational facilities. Our accommodations include 32 luxurious rooms across three categories, designed to provide comfort and elegance. Each room is equipped with state-of-the-art amenities, ensuring a stay that combines relaxation with convenience.</p><p style=\"text-align:justify;\">For events and gatherings, we offer:</p><ul><li style=\"text-align:justify;\"><strong>Lawn Area:</strong> Accommodating up to 1200 guests, perfect for large scale events and weddings.</li><li style=\"text-align:justify;\"><strong>Banquet Hall:</strong> Suitable for 100-125 guests, ideal for conferences and celebratory gatherings.</li><li style=\"text-align:justify;\"><strong>Conference Hall:</strong> Designed for corporate meetings, accommodating 70-75 participants.</li></ul><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\"><strong>Dining at JPS Residency</strong></p><p style=\"text-align:justify;\">Our culinary offerings are a delight to the senses. We provide a diverse range of dining options, from local delicacies to international cuisine, ensuring that there is something to satisfy every palate. Our dining facilities include themed restaurants, a coffee shop, and room service, available 24/7.</p><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\"><strong>Adventure and Recreation</strong></p><p style=\"text-align:justify;\">We believe in providing more than just a stay; we offer experiences. Our adventure zone includes activities like Bambo Bridges, Wall Climber, and Rope Challenges, designed for thrill-seekers of all ages. For those looking for a more relaxed experience, our swimming pool and landscaped gardens provide the perfect escape.</p><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\"><strong>Commitment to Sustainability</strong></p><p style=\"text-align:justify;\">JPS Residency is dedicated to sustainability and eco-friendly practices. We implement measures to reduce our environmental impact, from energy-efficient lighting and water conservation practices to using locally sourced and organic products.</p><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\"><strong>Contact Us</strong></p><p style=\"text-align:justify;\">For bookings, events, or inquiries, please contact us:</p><ul><li style=\"text-align:justify;\"><strong>Phone:</strong> (0124) 2291747, 7835020003, 7835020005</li><li style=\"text-align:justify;\"><strong>Email:</strong> Support@Jpsresidency.In</li><li style=\"text-align:justify;\"><strong>Address:</strong> Opp 446 E Sec 8, IMT Manesar, Gurgaon, Haryana 122050</li></ul><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\">Experience the pinnacle of hospitality at JPS Residency & Hospitality Services, where your comfort is our priority. Join us and discover why we are the preferred choice for travelers seeking quality and excellence.</p>', NULL, 'page', 'article', 0, 1, 2, 1715666456, 1715843794, 0, 0, 0, '', ''),
(5, 3, 'صفحتي الأولى', 'صفحتي الأولى', '', 'صفحتي الأولى', 'my-first-page', '', 'index,follow', '', '', '', NULL, 'page', 'article', 0, 1, 2, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(6, 1, 'Recherche', 'Recherche', '', 'Recherche', 'search', '', 'noindex,nofollow', '', '', '', NULL, 'search', '', 0, 1, 14, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(6, 2, 'Search', 'Search', '', 'Search', 'search', '', 'noindex,nofollow', '', '', '', NULL, 'search', '', 0, 1, 14, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(6, 3, 'بحث', 'بحث', '', 'بحث', 'search', '', 'noindex,nofollow', '', '', '', NULL, 'search', '', 0, 1, 14, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(7, 1, 'Galerie', 'Galerie', '', 'Galerie', 'galerie', '', 'index,follow', '', '', '', NULL, 'page', 'gallery', 0, 1, 4, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(7, 2, 'Gallery', 'Gallery', '', 'Gallery', 'gallery', '', 'index,follow', '', '', '', NULL, 'page', 'gallery', 0, 1, 4, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(7, 3, 'صور معرض', 'صور معرض', '', 'صور معرض', 'gallery', '', 'index,follow', '', '', '', NULL, 'page', 'gallery', 0, 1, 4, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(8, 1, '404', 'Erreur 404 : Page introuvable !', '', '404 Page introuvable', '404', '', 'noindex,nofollow', '', '', '<p>L\'URL demandée n\'a pas été trouvée sur ce serveur.<br />\r\nLa page que vous voulez afficher n\'existe pas, ou est temporairement indisponible.</p>\r\n\r\n<p>Merci d\'essayer les actions suivantes :</p>\r\n\r\n<ul>\r\n	<li>Assurez-vous que l\'URL dans la barre d\'adresse de votre navigateur est correctement orthographiée et formatée.</li>\r\n	<li>Si vous avez atteint cette page en cliquant sur un lien ou si vous pensez que cela concerne une erreur du serveur, contactez l\'administrateur pour l\'alerter.</li>\r\n</ul>\r\n', NULL, '404', '', 0, 1, 16, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(8, 2, '404', '404 Error: Page not found!', '', '404 Not Found', '404', '', 'noindex,nofollow', '', '', '<p>The wanted URL was not found on this server.<br />\r\nThe page you wish to display does not exist, or is temporarily unavailable.</p>\r\n\r\n<p>Thank you for trying the following actions :</p>\r\n\r\n<ul>\r\n	<li>Be sure the URL in the address bar of your browser is correctly spelt and formated.</li>\r\n	<li>If you reached this page by clicking a link or if you think that it is about an error of the server, contact the administrator to alert him.</li>\r\n</ul>\r\n', NULL, '404', '', 0, 1, 16, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(8, 3, '404', '404 Error: Page not found!', '', '404 Not Found', '404', '', 'noindex,nofollow', '', '', '', NULL, '404', '', 0, 1, 16, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(9, 1, 'Chambres', 'Chambres', '', 'Chambres', 'chambres', '', 'index,follow', '', '', '', NULL, 'rooms', 'room', 0, 1, 3, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(9, 2, 'Rooms', 'Rooms', '', 'Rooms', 'rooms', '', 'index,follow', '', '', '', NULL, 'rooms', 'room', 0, 1, 3, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(9, 3, 'الغرف', 'الغرف', '', 'الغرف', 'rooms', '', 'index,follow', '', '', '', NULL, 'rooms', 'room', 0, 1, 3, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(10, 1, 'Réserver', 'Réserver', '', 'Réserver', 'reserver', '', 'noindex,nofollow', '', '', '', NULL, 'booking', '', 0, 1, 6, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(10, 2, 'Booking', 'Booking', '', 'Booking', 'booking', '', 'noindex,nofollow', '', '', '', NULL, 'booking', '', 0, 1, 6, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(10, 3, 'الحجز', 'الحجز', '', 'الحجز', 'booking', '', 'noindex,nofollow', '', '', '', NULL, 'booking', '', 0, 1, 6, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(11, 1, 'Coordonnées', 'Coordonnées', '', 'Coordonnées', 'coordonnees', '', 'noindex,nofollow', '', '', '', 10, 'details', '', 0, 1, 7, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(11, 2, 'Details', 'Booking details', '', 'Booking details', 'booking-details', '', 'noindex,nofollow', '', '', '', 10, 'details', '', 0, 1, 7, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(11, 3, 'تفاصيل الحجز', 'تفاصيل الحجز', '', 'تفاصيل الحجز', 'booking-details', '', 'noindex,nofollow', '', '', '', 10, 'details', '', 0, 1, 7, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(12, 1, 'Paiement', 'Paiement', '', 'Paiement', 'paiement', '', 'noindex,nofollow', '', '', '', 13, 'payment', '', 0, 1, 10, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(12, 2, 'Payment', 'Payment', '', 'Payment', 'payment', '', 'noindex,nofollow', '', '', '', 13, 'payment', '', 0, 1, 10, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(12, 3, 'دفع', 'دفع', '', 'دفع', 'payment', '', 'noindex,nofollow', '', '', '', 13, 'payment', '', 0, 1, 10, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(13, 1, 'Résumé de la réservation', 'Résumé de la réservation', '', 'Résumé de la réservation', 'resume-reservation', '', 'noindex,nofollow', '', '', '', 11, 'summary', '', 0, 1, 8, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(13, 2, 'Summary', 'Booking summary', '', 'Booking summary', 'booking-summary', '', 'noindex,nofollow', '', '', '', 11, 'summary', '', 0, 1, 8, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(13, 3, 'ملخص الحجز', 'ملخص الحجز', '', 'ملخص الحجز', 'booking-summary', '', 'noindex,nofollow', '', '', '', 11, 'summary', '', 0, 1, 8, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(14, 1, 'Espace client', 'Espace client', '', 'Espace client', 'espace-client', '', 'noindex,nofollow', '', '', '', NULL, 'account', '', 0, 1, 17, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(14, 2, 'Account', 'Account', '', 'Account', 'account', '', 'noindex,nofollow', '', '', '', NULL, 'account', '', 0, 1, 17, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(14, 3, 'Account', 'Account', '', 'Account', 'account', '', 'noindex,nofollow', '', '', '', NULL, 'account', '', 0, 1, 17, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(15, 1, 'Activités', 'Activités', '', 'Activités', 'reservation-activitees', '', 'noindex,nofollow', '', '', '', 10, 'booking-activities', '', 0, 1, 9, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(15, 2, 'Activities', 'Activities', '', 'Activities', 'booking-activities', '', 'noindex,nofollow', '', '', '', 10, 'booking-activities', '', 0, 1, 9, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(15, 3, 'Activities', 'Activities', '', 'Activities', 'booking-activities', '', 'noindex,nofollow', '', '', '', 10, 'booking-activities', '', 0, 1, 9, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(16, 1, 'Activités', 'Activités', '', 'Activités', 'activitees', '', 'noindex,follow', '', '', '', NULL, 'activities', 'activity', 0, 1, 5, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(16, 2, 'Activities', 'Activities', '', 'Activities', 'activities', '', 'noindex,follow', '', '', '<p style=\"text-align:justify;\">Embark on an exciting adventure right here at JPS Residency! Our dedicated adventure zone is designed for guests of all ages, offering a range of activities that challenge your skills and pump up your adrenaline. Whether you\'re looking for some family fun or an action-packed experience, our adventure games provide the perfect opportunity to explore and enjoy.</p><p> </p><figure class=\"image\"><img src=\"https://www.jpsresidency.in/medias/media/big/5/bar.jpg\" alt=\"\"></figure><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\"><strong>Explore Our Adventure Activities:</strong></p><p style=\"text-align:justify;\"><strong>Bambo Bridges:</strong><br>Navigate our carefully constructed Bambo Bridges, a perfect blend of fun and challenge that will test your balance and agility.</p><p style=\"text-align:justify;\"><strong>Wall Climber:</strong><br>Scale new heights on our Wall Climber. Suitable for beginners and seasoned climbers alike, this activity is designed to push your limits safely under the supervision of our trained staff.</p><p style=\"text-align:justify;\"><strong>Rope Challenges:</strong><br>Tackle our Rope Challenges course, featuring a series of obstacles that require strength, strategy, and courage. It\'s a great way to build confidence and teamwork skills.</p><p style=\"text-align:justify;\"><strong>Kids Rope Course:</strong><br>Specially designed for our younger guests, this course is a fun and safe way to introduce children to the thrill of adventure activities.</p><p style=\"text-align:justify;\"><strong>Musical Chairs:</strong><br>Join in the classic game of musical chairs with a twist, played outdoors with music and lots of laughter. Perfect for guests of all ages.</p><p style=\"text-align:justify;\"><strong>Pool Football Games:</strong><br>Enjoy a splashy version of football in our pool, a refreshing and exhilarating way to play the sport.</p><p style=\"text-align:justify;\"><strong>Matka Rings:</strong><br>Test your aim and throw rings to capture your target in this engaging and fun activity.</p><p style=\"text-align:justify;\"><strong>Cricket Kit:</strong><br>Cricket enthusiasts can enjoy a game or two with our complete cricket kit available for guests. It\'s a perfect way to bond with family and friends.</p><p style=\"text-align:justify;\"><strong>Badminton:</strong><br>Engage in a spirited game of badminton on our courts. Whether you’re playing doubles or singles, badminton at JPS Residency is always a hit.</p><p style=\"text-align:justify;\"><strong>Safety First</strong></p><p style=\"text-align:justify;\">At JPS Residency, safety is our top priority. All adventure activities are supervised by trained professionals who ensure that every experience is not only fun but also safe. We provide all necessary safety gear and conduct briefings before each activity.</p><p style=\"text-align:justify;\"><strong>Group and Family Fun</strong></p><p style=\"text-align:justify;\">Our adventure zone is ideal for group outings and family trips. We offer customized packages for groups looking for a thrilling adventure day. Whether you’re planning a corporate team-building event or a family reunion, our adventure activities provide a memorable and engaging experience for everyone.</p><p style=\"text-align:justify;\"> </p><p style=\"text-align:justify;\"><strong>Book Your Adventure</strong></p><p style=\"text-align:justify;\">Ready to add a little excitement to your stay? Contact our front desk to book your adventure activities or to learn more about our group packages:</p><ul><li style=\"text-align:justify;\"><strong>Phone:</strong> (0124) 2291747, 7835020003, 7835020005</li><li style=\"text-align:justify;\"><strong>Email:</strong> Support@Jpsresidency.In</li></ul><p style=\"text-align:justify;\">Experience the thrill of adventure at JPS Residency & Hospitality Services, where every day brings a new challenge to conquer!</p>', NULL, 'activities', 'activity', 0, 1, 5, 1715666456, 1715851331, 0, 0, 1, '', ''),
(16, 3, 'Activities', 'Activities', '', 'Activities', 'activities', '', 'noindex,follow', '', '', '', NULL, 'activities', 'activity', 0, 1, 5, 1715666456, 1715666456, 0, 0, 1, NULL, NULL),
(17, 1, 'Blog', 'Blog', '', 'Blog', 'blog', '', 'index,follow', '', '', '', NULL, 'blog', 'article-blog', 0, 1, 15, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(17, 2, 'Blog', 'Blog', '', 'Blog', 'blog', '', 'index,follow', '', '', '', NULL, 'blog', 'article-blog', 0, 1, 15, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(17, 3, 'مدونة', 'مدونة', '', 'مدونة', 'blog', '', 'index,follow', '', '', '', NULL, 'blog', 'article-blog', 0, 1, 15, 1715666456, 1715666456, 0, 0, 0, NULL, NULL),
(19, 2, 'Event', 'Event with JPS', '', 'event-jps', 'event-jps', '', '', NULL, '', '', 1, 'page', 'page', 0, 2, 18, 1716793781, 1716805792, 0, NULL, NULL, '2', '1,3'),
(20, 2, 'Meetings at JPS Residency', 'Meetings at JPS Residency', '', 'Meetings at JPS Residency', 'meetings-at-jps-residency', '', '', NULL, '', '<p><strong>Elevate Your Meetings at JPS Residency</strong></p><p>Welcome to <strong> JPS Residency & Hospitality Services</strong>, where business meets elegance. Whether you are planning a large conference, an intimate meeting, or a dynamic corporate event, our state-of-the-art facilities and impeccable service ensure that your event will be a resounding success.</p><p> </p><p><strong>Versatile Meeting Spaces</strong><br>Our hotel offers a range of versatile meeting spaces to accommodate groups of all sizes:</p><p><br><strong>Conference Rooms: </strong>We provide multiple conference rooms equipped with the latest technology. These rooms are ideal for breakout sessions, training seminars, and mid-sized gatherings.</p><p> </p><figure class=\"image image_resized\" style=\"width:64.18%;\"><img src=\"https://www.jpsresidency.in/medias/media/big/8/meetings-at-jps-residency.png\" alt=\"\"></figure><p><strong>Prime Location</strong><br>Located in the heart of Gurugram, JPS Residency is easily accessible and surrounded by popular attractions, dining, and entertainment options. Our prime location offers convenience for both local and out-of-town guests, making it the ideal choice for your next event.</p><p>Contact Us<br>Ready to start planning your event? Contact our meetings and events team today to discuss your requirements and discover how JPS Residency can turn your vision into reality.</p><ul><li style=\"text-align:justify;\"><strong>Phone:</strong> (0124) 2291747, 7835020003, 7835020005</li><li style=\"text-align:justify;\"><strong>Email:</strong> Support@Jpsresidency.In</li></ul>', 19, 'page', 'page', 0, 2, 19, 1716800488, 1716877479, 0, NULL, NULL, '2', '1,3'),
(21, 2, 'Birthday Party', 'Birthday Party', '', 'Birthday Party', 'birthday-party-at-jps-residency', '', '', NULL, '', '<p><strong>Celebrate Your Birthday at JPS Residency & Hospitality</strong></p><p><br>Make your birthday celebration unforgettable at JPS Residency & Hospitality!  Our stunning venues and exceptional service provide the perfect setting for a joyous and memorable birthday party. Whether you\'re planning an intimate gathering or a grand celebration, we have everything you need to make your special day extraordinary.</p><p><strong>Why Celebrate at JPS Residency & Hospitality?</strong></p><p> </p><p><strong>Beautiful Venues:</strong> Choose from a variety of elegant spaces, each designed to create the perfect party atmosphere.</p><p><br><strong>Delicious Cuisine: </strong>Indulge in our delectable menu options, crafted by our expert chefs to delight you and your guests.</p><figure class=\"image image_resized\" style=\"width:71.33%;\"><img src=\"https://www.jpsresidency.in/medias/media/big/9/birthday-party-at-jps.png\" alt=\"\"></figure><p><br><strong>Personalized Service</strong>: Our dedicated event planning team will take care of every detail, ensuring your celebration is seamless and stress-free.</p><p><br><strong>Fun Themes: </strong>Bring your party vision to life with customized decorations, entertainment, and more.</p><p><br>Celebrate your birthday in style at <strong>JPS Residency & Hospitality.</strong> Contact us today to start planning your perfect party!</p><p> </p><ul><li style=\"text-align:justify;\"><strong>Phone:</strong> (0124) 2291747, 7835020003, 7835020005</li><li style=\"text-align:justify;\"><strong>Email:</strong> Support@Jpsresidency.In</li></ul>', 19, 'page', '', 0, 2, 20, 1716876369, 1716877519, 0, NULL, NULL, '2', '1,3'),
(22, 2, 'Kitty Party', 'Kitty Party', '', 'Kitty Paty', 'kitty-party-at-jps-residency', '', '', NULL, '', '<p><strong>Host Your Kitty Party at JPS Residency</strong></p><p><br>Looking for the perfect venue for your next kitty party? Look no further than JPS Residency & Hospitality Services! Our stylish and comfortable spaces provide an ideal setting for a fun and memorable gathering with friends. Enjoy delightful conversations, delicious food, and a cozy ambiance that will make your kitty party truly special.</p><p><strong>Why Choose JPS Residency & Hospitality Services for Your Kitty Party?</strong></p><p> </p><p><strong>Chic and Elegant Venues: </strong>Our beautifully designed spaces offer a blend of sophistication and comfort, perfect for your intimate get-together.</p><p><strong>Gourmet Catering:</strong> Savor a specially curated menu featuring a variety of delectable dishes and refreshing beverages, crafted to please every palate.</p><p> </p><figure class=\"image image_resized\" style=\"width:86.99%;\"><img src=\"https://www.jpsresidency.in/medias/media/big/10/kitty-party.png\" alt=\"\"></figure><p><strong>Personalized Service: </strong>Our dedicated team ensures that every detail is taken care of, from setup to service, so you can relax and enjoy your party.</p><p><strong>Exciting Themes:</strong> Whether you have a theme in mind or need inspiration, we can help bring your vision to life with customized decorations and arrangements.</p><p> </p><p>Celebrate friendship and create unforgettable memories at JPS Residency & Hospitality Services. Contact us today to book your kitty party and let us take care of the rest!</p><p> </p><ul><li><strong>Email:</strong> <a href=\"mailto:Support@Jpsresidency.In\">Support@Jpsresidency.In</a></li><li><strong>Phone:</strong> (0124) 2291747, 7835020003, 7835020005</li><li><strong>Address:</strong> Opp 446 E Sec 8, IMT Manesar, Gurgaon 122050 (Hr)<br> </li></ul><p> </p><p> </p>', 19, 'page', '', 0, 2, 18, 1716876864, 1716877601, 0, NULL, NULL, '2', '1,3');

-- --------------------------------------------------------

--
-- Table structure for table `pm_page_file`
--

CREATE TABLE `pm_page_file` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT 0,
  `checked` int(11) DEFAULT 1,
  `rank` int(11) DEFAULT 0,
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_page_file`
--

INSERT INTO `pm_page_file` (`id`, `lang`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(1, 2, 20, 0, 1, 1, 'confernce-room.png', '', 'image'),
(2, 2, 20, 0, 1, 2, 'meetings-at-jps-residency.png', '', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_popup`
--

CREATE TABLE `pm_popup` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `allpages` text DEFAULT NULL,
  `pages` text DEFAULT NULL,
  `background` varchar(20) DEFAULT NULL,
  `checked` int(11) DEFAULT 0,
  `publish_date` int(11) DEFAULT NULL,
  `unpublish_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pm_rate`
--

CREATE TABLE `pm_rate` (
  `id` int(11) NOT NULL,
  `id_room` int(11) NOT NULL,
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL,
  `id_package` int(11) DEFAULT NULL,
  `price` double DEFAULT 0,
  `child_price` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `discount_type` varchar(10) DEFAULT NULL,
  `people` int(11) DEFAULT NULL,
  `price_sup` double DEFAULT NULL,
  `fixed_sup` double DEFAULT NULL,
  `id_tax` int(11) DEFAULT NULL,
  `taxes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_rate`
--

INSERT INTO `pm_rate` (`id`, `id_room`, `start_date`, `end_date`, `id_package`, `price`, `child_price`, `discount`, `discount_type`, `people`, `price_sup`, `fixed_sup`, `id_tax`, `taxes`) VALUES
(1, 1, 1715990400, 1894752000, 2, 1600, 450, 0, '', 1, 200, 0, NULL, '2'),
(2, 2, 1715990400, 1906329600, 2, 1800, 500, 0, '', 1, 200, 0, NULL, '2'),
(3, 3, 1715990400, 1909008000, 2, 2000, 550, 0, '', 1, 200, 0, NULL, '2'),
(4, 4, 1715990400, 1894752000, 2, 1800, 500, 0, '', 1, 200, 0, NULL, '2'),
(5, 5, 1715990400, 1906329600, 2, 2200, 0.001, 0, '', 1, 300, 0, NULL, '2'),
(6, 6, 1715990400, 1909008000, 2, 5000, 0.001, 0, '', 1, 0.001, 0, NULL, '2');

-- --------------------------------------------------------

--
-- Table structure for table `pm_rate_child`
--

CREATE TABLE `pm_rate_child` (
  `id` int(11) NOT NULL,
  `id_rate` int(11) NOT NULL,
  `min_age` int(11) DEFAULT NULL,
  `max_age` int(11) DEFAULT NULL,
  `price` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_rate_child`
--

INSERT INTO `pm_rate_child` (`id`, `id_rate`, `min_age`, `max_age`, `price`) VALUES
(2, 4, 4, 9, 500),
(4, 5, 0, 3, 0.001),
(7, 6, 0, 3, 0.001),
(9, 6, 4, 9, 1250),
(10, 4, 0, 3, 0.001),
(11, 4, 10, 17, 1000),
(12, 1, 6, 9, 450),
(13, 1, 10, 17, 900),
(14, 2, 4, 9, 500),
(15, 2, 10, 17, 1000),
(16, 3, 4, 9, 550),
(17, 3, 9, 17, 1100),
(18, 6, 10, 17, 2500),
(19, 1, 0, 5, 0.001),
(20, 2, 0, 3, 0.001),
(21, 3, 0, 3, 0.001),
(22, 5, 4, 17, 2200);

-- --------------------------------------------------------

--
-- Table structure for table `pm_room`
--

CREATE TABLE `pm_room` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `max_children` int(11) DEFAULT 1,
  `max_adults` int(11) DEFAULT 1,
  `max_people` int(11) DEFAULT NULL,
  `min_people` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `descr` longtext DEFAULT NULL,
  `facilities` varchar(250) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 0,
  `home` int(11) DEFAULT 0,
  `checked` int(11) DEFAULT 0,
  `rank` int(11) DEFAULT 0,
  `start_lock` int(11) DEFAULT NULL,
  `end_lock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_room`
--

INSERT INTO `pm_room` (`id`, `lang`, `max_children`, `max_adults`, `max_people`, `min_people`, `title`, `subtitle`, `alias`, `descr`, `facilities`, `stock`, `price`, `home`, `checked`, `rank`, `start_lock`, `end_lock`) VALUES
(1, 1, 2, 2, 2, 1, 'Chambre Double Deluxe', 'Petit-déjeuner inclus', 'chambre-double-deluxe', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut eleifend diam. Etiam molestie quam at nunc tempus, ac porttitor ante rutrum. Donec ipsum orci, molestie sit amet nibh a, accumsan varius nisl. Suspendisse blandit efficitur interdum. Nulla auctor tortor eu volutpat imperdiet. Nam at tempus sapien, sit amet porttitor neque. Nam lacinia ex libero, vel egestas ante vehicula nec.</p>\r\n\r\n<p>Sed sed dignissim est. Donec egestas nisl eu congue rhoncus. Nulla finibus malesuada mauris, et pellentesque diam scelerisque non. Duis auctor dapibus augue sed malesuada. Nam placerat at libero quis aliquam. Phasellus quam orci, dapibus sit amet finibus a, convallis volutpat arcu. Nullam condimentum quam id urna scelerisque varius. Duis a metus metus.</p>\r\n', '1,5,11,13,17,18,21,23,24,25,27,28,29,32', 4, 145, 1, 1, 1, NULL, NULL),
(1, 2, 2, 2, 4, 1, 'Deluxe Room', '“Elegance Redefined: Our Deluxe Hideaways.”', 'deluxe-double-bedroom', '<p style=\"text-align:justify;\"><span style=\"color:rgb(13,13,13);\">Our Deluxe Room offers a comfortable stay with essential amenities. Ideal for those seeking a cozy and economical option. Amenities include air conditioning (AC), Wi-Fi, a comfortable bed, a tea-coffee maker, a geyser, a television (T.V), soap, shampoo, oil, handwash, towels, pillows, a footmat, and a duvet. Guests also enjoy free access to the swimming pool, Bamboo Bridges, and outdoor activities.</span></p>', '6,8,10,11,14,24,25,27,28,32,37', 10, 1800, 1, 1, 1, NULL, NULL),
(1, 3, 2, 2, 2, 1, 'Deluxe Double Bedroom', 'Breakfast included', 'deluxe-double-bedroom', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut eleifend diam. Etiam molestie quam at nunc tempus, ac porttitor ante rutrum. Donec ipsum orci, molestie sit amet nibh a, accumsan varius nisl. Suspendisse blandit efficitur interdum. Nulla auctor tortor eu volutpat imperdiet. Nam at tempus sapien, sit amet porttitor neque. Nam lacinia ex libero, vel egestas ante vehicula nec.</p>\r\n\r\n<p>Sed sed dignissim est. Donec egestas nisl eu congue rhoncus. Nulla finibus malesuada mauris, et pellentesque diam scelerisque non. Duis auctor dapibus augue sed malesuada. Nam placerat at libero quis aliquam. Phasellus quam orci, dapibus sit amet finibus a, convallis volutpat arcu. Nullam condimentum quam id urna scelerisque varius. Duis a metus metus.</p>\r\n', '1,5,11,13,17,18,21,23,24,25,27,28,29,32', 4, 145, 1, 1, 1, NULL, NULL),
(2, 1, 4, 5, 5, 1, 'Suite Luxueuse', 'Suite avec Piscine & Jacuzzi', 'suite-luxueuse', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et ante in ligula ornare finibus. Sed porttitor leo in felis sodales iaculis. Donec id elit quis erat volutpat viverra. Pellentesque pretium, massa nec pulvinar faucibus, nunc ipsum commodo neque, sit amet fermentum purus enim quis nisi. Nunc ligula est, lacinia non massa quis, consectetur sagittis ex. Nulla facilisi. In mattis diam eu dui egestas faucibus. Duis quis facilisis urna. Vestibulum non nunc quis erat cursus posuere. Quisque tempus porta leo eget ultricies. Praesent rhoncus dolor in risus molestie vulputate. In ac lorem nec metus maximus dictum quis eget eros. In non vestibulum sem, at sollicitudin ligula. <span data-cke-marker=\"1\"> </p>\r\n', '1,2,5,39,35,11,13,36,17,18,21,37,38,23,24,25,26,27,28,32', 5, 390, 1, 1, 2, NULL, NULL),
(2, 2, 2, 2, 4, 1, 'Super Deluxe Room', '“Where Luxury Meets Grandeur: Super Deluxe Living.”', 'luxury-suite', '<p><span style=\"color:rgb(13,13,13);\">Upgrade to our Super Deluxe Room for an enhanced experience, including a complimentary breakfast to start your day right. Amenities include air conditioning (AC), Wi-Fi, a comfortable bed, a tea-coffee maker, a geyser, a television (T.V), soap, shampoo, oil, handwash, towels, pillows, a footmat, and a duvet. Guests also enjoy free access to the swimming pool, Bamboo Bridges, and outdoor activities, along with a delicious complimentary breakfast.</span></p>', '6,8,10,11,24,25,27,28,32,37', 16, 2200, 1, 1, 2, NULL, NULL),
(2, 3, 4, 5, 5, 1, 'Luxury suite', 'Pool & Jacuzzi Suite', 'luxury-suite', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et ante in ligula ornare finibus. Sed porttitor leo in felis sodales iaculis. Donec id elit quis erat volutpat viverra. Pellentesque pretium, massa nec pulvinar faucibus, nunc ipsum commodo neque, sit amet fermentum purus enim quis nisi. Nunc ligula est, lacinia non massa quis, consectetur sagittis ex. Nulla facilisi. In mattis diam eu dui egestas faucibus. Duis quis facilisis urna. Vestibulum non nunc quis erat cursus posuere. Quisque tempus porta leo eget ultricies. Praesent rhoncus dolor in risus molestie vulputate. In ac lorem nec metus maximus dictum quis eget eros. In non vestibulum sem, at sollicitudin ligula. <span data-cke-marker=\"1\"> </p>\r\n', '1,2,5,39,35,11,13,36,17,18,21,37,38,23,24,25,26,27,28,32', 5, 390, 1, 1, 2, NULL, NULL),
(3, 1, 4, 5, 5, 1, 'Suite Royale', 'Suite avec Piscine & Jacuzzi', 'suite-royale', '', '1,2,5,39,35,11,13,36,17,18,21,37,38,23,24,25,27,28,32', 2, 410, 1, 1, 3, NULL, NULL),
(3, 2, 2, 2, 4, 1, 'Cottage', 'Our enchanting cottage awaits, wrapped in whispers of nature and warmed by the hearth.” ', 'royal-suite', '<p style=\"text-align:justify;\"><span style=\"color:rgb(13,13,13);\">Our premium Cottage provides a luxurious and spacious stay, perfect for a relaxing getaway. Enjoy a complimentary breakfast each morning. Amenities include air conditioning (AC), Wi-Fi, a comfortable bed, a tea-coffee maker, a geyser, a television (T.V), soap, shampoo, oil, handwash, towels, pillows, a footmat, and a duvet. Guests also enjoy free access to the swimming pool, Bamboo Bridges, and outdoor activities, along with a delicious complimentary breakfast.</span></p>', '6,8,10,11,14,25,27,28,32,37', 6, 2500, 1, 1, 3, NULL, NULL),
(3, 3, 4, 5, 5, 1, 'Royal suite', 'Pool & Jacuzzi Suite', 'royal-suite', '', '1,2,5,39,35,11,13,36,17,18,21,37,38,23,24,25,27,28,32', 2, 410, 1, 1, 3, NULL, NULL),
(4, 2, 2, 2, 4, 1, ' Continental plan (CP)', 'Room With Breakfast', 'room', '<p style=\"text-align:justify;\"><span style=\"color:rgb(13,13,13);\">Our Room offers a comfortable stay with essential amenities. Ideal for those seeking a cozy and economical option. Amenities include air conditioning (AC), Wi-Fi, a comfortabbed, a tea-coffee maker, a geyser, a television (T.V), soap, shampoo, oil, handwash, towels, pillows, a footmat, and a duvet. Guests also enjoy free access to the swimming pool, Bamboo Bridges, and outdoor activities.</span></p>', '6,8,10,11,14,24,25,27,28,32,37', 32, 1800, 1, 1, 4, NULL, NULL),
(5, 2, 2, 2, 4, 1, 'Modified American plan( MAP)', 'Rooms & breakfast one major meal Lunch or dinner', 'room2', '<p><span style=\"color:rgb(13,13,13);\">Upgrade to our Room for an enhanced experience, including a complimentary breakfast to start your day right. Amenities include air conditioning (AC), Wi-Fi, a comfortable bed, a tea-coffee maker, a geyser, a television (T.V), soap, shampoo, oil, handwash, towels, pillows, a footmat, and a duvet. Guests also enjoy free access to the swimming pool, Bamboo Bridges, and outdoor activities, along with a delicious complimentary breakfast.</span></p>', '6,8,10,11,24,25,27,28,32,37', 32, 2000, 1, 2, 5, NULL, NULL),
(6, 2, 2, 2, 4, 2, 'Best offer For Couple ', '(Welcome Drink, Lunch, hi Tea, Snacks, Dinner, Breakfast)', 'room-3', '<p style=\"text-align:justify;\"><span style=\"color:rgb(13,13,13);\">Our premium room provides a luxurious and spacious stay, perfect for a relaxing getaway. Enjoy a complimentary breakfast each morning. Amenities include air conditioning (AC), Wi-Fi, a comfortable bed, a tea-coffee maker, a geyser, a television (T.V), soap, shampoo, oil, handwash, towels, pillows, a footmat, and a duvet. Guests also enjoy free access to the swimming pool, Bamboo Bridges, and outdoor activities, along with a delicious complimentary breakfast.</span></p>', '6,8,10,11,14,25,27,28,32,37', 6, 5000, 1, 1, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pm_room_calendar`
--

CREATE TABLE `pm_room_calendar` (
  `id` int(11) NOT NULL,
  `id_room` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `latest_sync` int(11) DEFAULT NULL,
  `url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pm_room_closing`
--

CREATE TABLE `pm_room_closing` (
  `id` int(11) NOT NULL,
  `id_room` int(11) NOT NULL,
  `from_date` int(11) DEFAULT NULL,
  `to_date` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pm_room_file`
--

CREATE TABLE `pm_room_file` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT 0,
  `checked` int(11) DEFAULT 1,
  `rank` int(11) DEFAULT 0,
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_room_file`
--

INSERT INTO `pm_room_file` (`id`, `lang`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(1, 1, 1, 0, 2, 1, 'deluxe-double-room.jpg', '', 'image'),
(1, 2, 1, 0, 2, 1, 'deluxe-double-room.jpg', '', 'image'),
(1, 3, 1, 0, 2, 1, 'deluxe-double-room.jpg', '', 'image'),
(2, 1, 2, 0, 2, 1, '6515452555-27726c278e-o.jpg', '', 'image'),
(2, 2, 2, 0, 2, 1, '6515452555-27726c278e-o.jpg', '', 'image'),
(2, 3, 2, 0, 2, 1, '6515452555-27726c278e-o.jpg', '', 'image'),
(3, 1, 3, 0, 2, 1, '6515451125-2fd51bd7c5-o.jpg', '', 'image'),
(3, 2, 3, 0, 2, 1, '6515451125-2fd51bd7c5-o.jpg', '', 'image'),
(3, 3, 3, 0, 2, 1, '6515451125-2fd51bd7c5-o.jpg', '', 'image'),
(4, 2, 3, 0, 1, 2, 'cottage.jpg', '', 'image'),
(5, 2, 2, 0, 1, 2, 'super.jpg', '', 'image'),
(6, 2, 1, 0, 1, 2, 'normal.jpg', '', 'image'),
(7, 2, 4, 0, 1, 3, 'room-2.jpg', '', 'image'),
(8, 2, 5, 0, 2, 1, 'whatsapp-image-2024-05-27-at-16-41-49-1234bde8.jpg', NULL, 'image'),
(9, 2, 5, 0, 2, 2, 'room-4.jpg', '', 'image'),
(10, 2, 6, 0, 1, 5, 'room-5.jpg', '', 'image'),
(11, 2, 5, 0, 1, 1, 'front.jpg', '', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_room_lock`
--

CREATE TABLE `pm_room_lock` (
  `id` int(11) NOT NULL,
  `id_room` int(11) DEFAULT NULL,
  `from_date` int(11) DEFAULT NULL,
  `to_date` int(11) DEFAULT NULL,
  `add_date` int(11) DEFAULT NULL,
  `sessid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_room_lock`
--

INSERT INTO `pm_room_lock` (`id`, `id_room`, `from_date`, `to_date`, `add_date`, `sessid`) VALUES
(1, 1, 1716163200, 1716336000, 1716026387, '66487c13c0740'),
(7, 3, 1716163200, 1716249600, 1716187245, '664af06d2898c'),
(8, 3, 1716163200, 1716249600, 1716187245, '664af06d2898c'),
(19, 2, 1716595200, 1716681600, 1716360082, '664d9392b12bf'),
(22, 1, 1716422400, 1716508800, 1716463070, '664f25de2c460'),
(23, 1, 1716508800, 1716595200, 1716532903, '665036a7a401e'),
(26, 1, 1716768000, 1716854400, 1716803175, '66545667a3bf9'),
(28, 2, 1716768000, 1716854400, 1716804297, '66545ac9893b6'),
(29, 2, 1716768000, 1716854400, 1716804347, '66545afb3947c'),
(30, 2, 1716768000, 1716854400, 1716804468, '66545b744118f'),
(33, 1, 1716768000, 1716854400, 1716809933, '665470cd920fa'),
(34, 1, 1716768000, 1716854400, 1716810078, '6654715e53556'),
(35, 1, 1716768000, 1716854400, 1716810270, '6654721e69f83'),
(38, 1, 1716768000, 1716854400, 1716810584, '6654735849327'),
(39, 1, 1716768000, 1716854400, 1716810613, '66547375208a9'),
(44, 1, 1716854400, 1716940800, 1716894506, '6655bb2a8fbd0'),
(46, 6, 1716940800, 1717027200, 1716961016, '6656bef805617'),
(47, 1, 1716940800, 1717027200, 1716961070, '6656bf2ec859d'),
(48, 6, 1716940800, 1717027200, 1716961070, '6656bf2ec859d'),
(51, 6, 1718323200, 1718409600, 1716990920, '665733c897141'),
(60, 6, 1717372800, 1717459200, 1717405624, '665d87b8d9c8a'),
(65, 1, 1718323200, 1718409600, 1718194709, '66699215f1d20'),
(66, 6, 1718409600, 1718496000, 1718208331, '6669c74bbb08b'),
(67, 6, 1718409600, 1718496000, 1718208331, '6669c74bbb08b'),
(68, 1, 1718323200, 1718409600, 1718276260, '666ad0a464e00'),
(74, 1, 1718582400, 1718668800, 1718620265, '66701069bd3c9'),
(82, 6, 1723680000, 1723766400, 1718695168, '6671350042a16'),
(83, 1, 1719014400, 1719100800, 1718724130, '6671a6222d061'),
(86, 1, 1719014400, 1719100800, 1718724707, '6671a8636e5b6'),
(87, 1, 1718755200, 1718841600, 1718793639, '6672b5a7cb8b5'),
(88, 2, 1719014400, 1719100800, 1718860276, '6673b9f400a98'),
(89, 4, 1719187200, 1719532800, 1718882195, '66740f93ad0ca'),
(91, 6, 1720224000, 1720310400, 1719066630, '6676e0062aa86'),
(99, 6, 1719532800, 1719619200, 1719552553, '667e4a2936ef1'),
(104, 6, 1719792000, 1719878400, 1719831336, '66828b28c8b4e'),
(109, 1, 1723248000, 1723334400, 1720156208, '66878030bcadc'),
(110, 1, 1723248000, 1723334400, 1720156208, '66878030bcadc'),
(111, 1, 1720224000, 1720310400, 1720222007, '668881372fddf'),
(112, 1, 1720224000, 1720310400, 1720253317, '6688fb851b602'),
(113, 1, 1720224000, 1720310400, 1720253360, '6688fbb0dd76a'),
(115, 6, 1720483200, 1720569600, 1720504377, '668cd0393e525'),
(117, 1, 1720483200, 1720569600, 1720520188, '668d0dfc46c03'),
(122, 6, 1720828800, 1720915200, 1720608184, '668e65b886105'),
(125, 2, 1720828800, 1720915200, 1720769198, '6690daaec0afe'),
(134, 2, 1723420800, 1723593600, 1723277606, '66b721268e869'),
(135, 1, 1723852800, 1723939200, 1723803274, '66bf268a338d8'),
(137, 2, 1724457600, 1724544000, 1724217705, '66c579691528f'),
(138, 1, 1724198400, 1724284800, 1724223539, '66c5903382462');

-- --------------------------------------------------------

--
-- Table structure for table `pm_service`
--

CREATE TABLE `pm_service` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `descr` text DEFAULT NULL,
  `long_descr` text DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `rooms` varchar(250) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `id_tax` int(11) DEFAULT NULL,
  `taxes` text DEFAULT NULL,
  `mandatory` int(11) DEFAULT 0,
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT 0,
  `rank` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_service`
--

INSERT INTO `pm_service` (`id`, `lang`, `title`, `descr`, `long_descr`, `type`, `rooms`, `price`, `id_tax`, `taxes`, `mandatory`, `start_date`, `end_date`, `checked`, `rank`) VALUES
(1, 1, 'Set de toilette', '1 serviette de toilette, 1 drap de douche, 1 tapis', '', 'qty-night', '4,1,3,2', 7, 1, '', 0, NULL, NULL, 2, 1),
(1, 2, 'Breakfast ', 'At  JPS Residency & Hospitality Services, we believe a great day begins with a great breakfast. Join us each morning for a delightful array of breakfast options, designed to satisfy every palate and provide the perfect start to your day.', '', 'qty-night', '1,2,3', 250, NULL, '', 0, NULL, NULL, 1, 1),
(1, 3, 'Rent of towel (kit)', '1 hand towel, 1 bath towel, 1 bath mat', '', 'qty-night', '4,1,3,2', 7, 1, '', 0, NULL, NULL, 2, 1),
(2, 1, 'Ménage', '', '', 'package', '1,3,2', 50, 1, '', 0, NULL, NULL, 2, 2),
(2, 2, 'Veg Thali', 'Mix Veg, Paneer, Raita , Dal ,  Papad , Salad, 2-Roti, Rice , Gulab - Jamun', '', 'qty-night', '1,2,3,4', 300, 1, '', 0, NULL, NULL, 1, 2),
(2, 3, 'Housework', '', '', 'package', '1,3,2', 50, 1, '', 0, NULL, NULL, 2, 2),
(3, 1, 'Chauffage', '', '', 'night', '1,3,2', 8, 1, '', 0, NULL, NULL, 2, 3),
(3, 2, 'Nov-Veg Thali', 'Chicken ( chicken Currry/ Butter chicken), Mix Veg, Raita, 2-Roti , Dal , Papad , Salad , Rice , Gulab-Jamun', '', 'qty-night', '1,2,3,4', 400, 1, '', 0, NULL, NULL, 1, 3),
(3, 3, 'Heating', '', '', 'night', '1,3,2', 8, 1, '', 0, NULL, NULL, 2, 3),
(4, 1, 'Animal domestique', 'Précisez la race ci-dessous', '', 'qty-night', '4,1,3,2', 5, 1, '', 0, NULL, NULL, 2, 4),
(4, 2, 'Pet', 'Specify the breed below', '', 'qty-night', '4,1,3,2', 5, 1, '', 0, NULL, NULL, 2, 4),
(4, 3, 'Pet', 'Specify the breed below', '', 'qty-night', '4,1,3,2', 5, 1, '', 0, NULL, NULL, 2, 4),
(5, 2, 'laundary', '', '', 'qty-night', '1,2,3,4,6', 100, 2, '', 0, NULL, NULL, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `pm_slide`
--

CREATE TABLE `pm_slide` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `legend` text DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `id_page` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT 0,
  `rank` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_slide`
--

INSERT INTO `pm_slide` (`id`, `lang`, `legend`, `url`, `id_page`, `checked`, `rank`) VALUES
(1, 1, '', '', 1, 2, 1),
(1, 2, '<h1>Book your holydays with Panda Resort</h1>\r\n\r\n<h2>Fast, Easy and Powerfull</h2>\r\n', '', 1, 2, 1),
(1, 3, '', '', 1, 2, 1),
(2, 1, '', '', 1, 2, 2),
(2, 2, '<h2>A dream stay at the best price</h2><h2>Best price guarantee</h2>', '', 1, 2, 2),
(2, 3, '', '', 1, 2, 2),
(3, 2, '', '', 1, 1, 4),
(4, 2, '', '', 1, 1, 5),
(5, 2, '', '', 1, 2, 6),
(6, 2, '', '', 1, 2, 3),
(7, 2, '', '', 1, 1, 7),
(8, 2, '', '', 1, 1, 8),
(9, 2, '', '', 1, 2, 9),
(10, 2, '', '', 1, 1, 10),
(11, 2, '', '', 1, 1, 11),
(12, 2, '', '', 1, 1, 12),
(13, 2, '', '', 1, 2, 13);

-- --------------------------------------------------------

--
-- Table structure for table `pm_slide_file`
--

CREATE TABLE `pm_slide_file` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `home` int(11) DEFAULT 0,
  `checked` int(11) DEFAULT 1,
  `rank` int(11) DEFAULT 0,
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_slide_file`
--

INSERT INTO `pm_slide_file` (`id`, `lang`, `id_item`, `home`, `checked`, `rank`, `file`, `label`, `type`) VALUES
(1, 1, 1, 0, 1, 1, 'slide1.jpg', '', 'image'),
(1, 2, 1, 0, 1, 1, 'slide1.jpg', '', 'image'),
(1, 3, 1, 0, 1, 1, 'slide1.jpg', '', 'image'),
(2, 1, 2, 0, 1, 3, 'slide2.jpg', '', 'image'),
(2, 2, 2, 0, 1, 3, 'slide2.jpg', '', 'image'),
(2, 3, 2, 0, 1, 3, 'slide2.jpg', '', 'image'),
(3, 2, 3, 0, 1, 4, 'banner2.jpg', '', 'image'),
(4, 2, 4, 0, 1, 5, 'banner1.jpg', '', 'image'),
(5, 2, 5, 0, 2, 1, '10960084-1533264483614249-3468343905977097903-o-copy.jpg', '', 'image'),
(6, 2, 6, 0, 2, 1, 'img-20240420-wa0031-1.jpg', NULL, 'image'),
(7, 2, 7, 0, 1, 8, 'img-20240420-wa0208-1.jpg', NULL, 'image'),
(8, 2, 8, 0, 1, 9, '292389280-3163042020636479-4439384459546087661-n.jpg', NULL, 'image'),
(9, 2, 9, 0, 1, 1, 'inshot-20240420-105849590.jpg', '', 'image'),
(10, 2, 10, 0, 1, 10, 'img-20240420-wa0020.jpg', '', 'image'),
(11, 2, 11, 0, 1, 1, 'whatsapp-image-2024-04-20-at-4-07-47-pm.jpeg', '', 'image'),
(12, 2, 12, 0, 1, 11, 'img-20240701-wa0057.jpg', '', 'image'),
(13, 2, 13, 0, 1, 12, 'img-20240701-wa0076.jpg', '', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `pm_social`
--

CREATE TABLE `pm_social` (
  `id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `checked` int(11) DEFAULT 1,
  `rank` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_social`
--

INSERT INTO `pm_social` (`id`, `type`, `url`, `checked`, `rank`) VALUES
(1, 'facebook', 'https://www.facebook.com/www.jpsresidency.in', 1, 1),
(2, 'twitter', 'https://twitter.com/@JpsResort', 1, 3),
(3, 'pinterest', 'https://www.pinterest.com/jps_resort/', 1, 4),
(4, 'youtube', 'https://www.youtube.com/@jpsresidency9518', 1, 5),
(5, 'instagram', 'https://www.instagram.com/jps_residency/', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pm_tag`
--

CREATE TABLE `pm_tag` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `value` varchar(250) DEFAULT NULL,
  `pages` varchar(250) DEFAULT NULL,
  `checked` int(11) DEFAULT 0,
  `rank` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pm_tax`
--

CREATE TABLE `pm_tax` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `value` double DEFAULT 0,
  `checked` int(11) DEFAULT 0,
  `rank` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_tax`
--

INSERT INTO `pm_tax` (`id`, `lang`, `name`, `value`, `checked`, `rank`) VALUES
(1, 1, 'TVA', 10, 1, 1),
(1, 2, 'Tax', 12, 1, 1),
(1, 3, 'VAT', 10, 1, 1),
(2, 2, 'GST', 12, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pm_text`
--

CREATE TABLE `pm_text` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_text`
--

INSERT INTO `pm_text` (`id`, `lang`, `name`, `value`) VALUES
(1, 1, 'CREATION', 'Création'),
(1, 2, 'CREATION', 'Creation'),
(1, 3, 'CREATION', 'إنشاء'),
(2, 1, 'MESSAGE', 'Message'),
(2, 2, 'MESSAGE', 'Message'),
(2, 3, 'MESSAGE', 'رسالة'),
(3, 1, 'EMAIL', 'E-mail'),
(3, 2, 'EMAIL', 'E-mail'),
(3, 3, 'EMAIL', 'بَرِيدٌ إلِكْترونيّ'),
(4, 1, 'PHONE', 'Tél.'),
(4, 2, 'PHONE', 'Phone'),
(4, 3, 'PHONE', 'رقم هاتف'),
(5, 1, 'FAX', 'Fax'),
(5, 2, 'FAX', 'Fax'),
(5, 3, 'FAX', 'فاكس'),
(6, 1, 'COMPANY', 'Société'),
(6, 2, 'COMPANY', 'Company'),
(6, 3, 'COMPANY', 'مشروع'),
(7, 1, 'COPY_CODE', 'Recopiez le code'),
(7, 2, 'COPY_CODE', 'Copy the code'),
(7, 3, 'COPY_CODE', 'رمز الأمان'),
(8, 1, 'SUBJECT', 'Sujet'),
(8, 2, 'SUBJECT', 'Subject'),
(8, 3, 'SUBJECT', 'موضوع'),
(9, 1, 'REQUIRED_FIELD', 'Champ requis'),
(9, 2, 'REQUIRED_FIELD', 'Required field'),
(9, 3, 'REQUIRED_FIELD', 'الحقل المطلوب'),
(10, 1, 'INVALID_CAPTCHA_CODE', 'Le code de sécurité saisi est incorrect'),
(10, 2, 'INVALID_CAPTCHA_CODE', 'Invalid security code'),
(10, 3, 'INVALID_CAPTCHA_CODE', 'رمز الحماية أدخلته غير صحيح'),
(11, 1, 'INVALID_EMAIL', 'Adresse e-mail invalide'),
(11, 2, 'INVALID_EMAIL', 'Invalid email address'),
(11, 3, 'INVALID_EMAIL', 'بريد إلكتروني خاطئ'),
(12, 1, 'FIRSTNAME', 'Prénom'),
(12, 2, 'FIRSTNAME', 'Firstname'),
(12, 3, 'FIRSTNAME', 'الاسم الأول'),
(13, 1, 'LASTNAME', 'Nom'),
(13, 2, 'LASTNAME', 'Lastname'),
(13, 3, 'LASTNAME', 'اسم العائلة'),
(14, 1, 'ADDRESS', 'Adresse'),
(14, 2, 'ADDRESS', 'Address'),
(14, 3, 'ADDRESS', 'عنوان الشارع'),
(15, 1, 'POSTCODE', 'Code postal'),
(15, 2, 'POSTCODE', 'Post code'),
(15, 3, 'POSTCODE', 'الرمز البريدي'),
(16, 1, 'CITY', 'Ville'),
(16, 2, 'CITY', 'City'),
(16, 3, 'CITY', 'مدينة'),
(17, 1, 'MOBILE', 'Portable'),
(17, 2, 'MOBILE', 'Mobile'),
(17, 3, 'MOBILE', 'هاتف'),
(18, 1, 'ADD', 'Ajouter'),
(18, 2, 'ADD', 'Add'),
(18, 3, 'ADD', 'إضافة على'),
(19, 1, 'EDIT', 'Modifier'),
(19, 2, 'EDIT', 'Edit'),
(19, 3, 'EDIT', 'تغيير'),
(20, 1, 'INVALID_INPUT', 'Saisie invalide'),
(20, 2, 'INVALID_INPUT', 'Invalid input'),
(20, 3, 'INVALID_INPUT', 'إدخال غير صالح'),
(21, 1, 'MAIL_DELIVERY_FAILURE', 'Echec lors de l\'envoi du message.'),
(21, 2, 'MAIL_DELIVERY_FAILURE', 'A failure occurred during the delivery of this message.'),
(21, 3, 'MAIL_DELIVERY_FAILURE', 'حدث فشل أثناء تسليم هذه الرسالة.'),
(22, 1, 'MAIL_DELIVERY_SUCCESS', 'Merci de votre intérêt, votre message a bien été envoyé.\nNous vous contacterons dans les plus brefs délais.'),
(22, 2, 'MAIL_DELIVERY_SUCCESS', 'Thank you for your interest, your message has been sent.\nWe will contact you as soon as possible.'),
(22, 3, 'MAIL_DELIVERY_SUCCESS', 'خزان لاهتمامك ، تم إرسال رسالتك . سوف نتصل بك في أقرب وقت ممكن .'),
(23, 1, 'SEND', 'Envoyer'),
(23, 2, 'SEND', 'Send'),
(23, 3, 'SEND', 'ارسل انت'),
(24, 1, 'FORM_ERRORS', 'Le formulaire comporte des erreurs.'),
(24, 2, 'FORM_ERRORS', 'The following form contains some errors.'),
(24, 3, 'FORM_ERRORS', 'النموذج التالي يحتوي على بعض الأخطاء.'),
(25, 1, 'FROM_DATE', 'Du'),
(25, 2, 'FROM_DATE', 'From'),
(25, 3, 'FROM_DATE', 'من'),
(26, 1, 'TO_DATE', 'au'),
(26, 2, 'TO_DATE', 'till'),
(26, 3, 'TO_DATE', 'حتى'),
(27, 1, 'FROM', 'De'),
(27, 2, 'FROM', 'From'),
(27, 3, 'FROM', 'من'),
(28, 1, 'TO', 'à'),
(28, 2, 'TO', 'to'),
(28, 3, 'TO', 'إلى'),
(29, 1, 'BOOK', 'Réserver'),
(29, 2, 'BOOK', 'Book'),
(29, 3, 'BOOK', 'للحجز'),
(30, 1, 'READMORE', 'Lire la suite'),
(30, 2, 'READMORE', 'Read more'),
(30, 3, 'READMORE', 'اقرأ المزيد'),
(31, 1, 'BACK', 'Retour'),
(31, 2, 'BACK', 'Back'),
(31, 3, 'BACK', 'عودة'),
(32, 1, 'DISCOVER', 'Découvrir'),
(32, 2, 'DISCOVER', 'Discover'),
(32, 3, 'DISCOVER', 'اكتشف'),
(33, 1, 'ALL', 'Tous'),
(33, 2, 'ALL', 'All'),
(33, 3, 'ALL', 'كل'),
(34, 1, 'ALL_RIGHTS_RESERVED', 'Tous droits réservés'),
(34, 2, 'ALL_RIGHTS_RESERVED', 'All rights reserved'),
(34, 3, 'ALL_RIGHTS_RESERVED', 'جميع الحقوق محفوظه'),
(35, 1, 'FORGOTTEN_PASSWORD', 'Mot de passe oublié ?'),
(35, 2, 'FORGOTTEN_PASSWORD', 'Forgotten password?'),
(35, 3, 'FORGOTTEN_PASSWORD', 'هل نسيت كلمة المرور؟'),
(36, 1, 'LOG_IN', 'Connexion'),
(36, 2, 'LOG_IN', 'Log in'),
(36, 3, 'LOG_IN', 'تسجيل الدخول'),
(37, 1, 'SIGN_UP', 'Inscription'),
(37, 2, 'SIGN_UP', 'Sign up'),
(37, 3, 'SIGN_UP', 'تسجيل'),
(38, 1, 'LOG_OUT', 'Déconnexion'),
(38, 2, 'LOG_OUT', 'Log out'),
(38, 3, 'LOG_OUT', 'تسجيل الخروج'),
(39, 1, 'SEARCH', 'Rechercher'),
(39, 2, 'SEARCH', 'Search'),
(39, 3, 'SEARCH', 'ابحث عن'),
(40, 1, 'RESET_PASS_SUCCESS', 'Votre nouveau mot de passe vous a été envoyé sur votre adresse e-mail.'),
(40, 2, 'RESET_PASS_SUCCESS', 'Your new password was sent to you on your e-mail.'),
(40, 3, 'RESET_PASS_SUCCESS', 'تم إرسال كلمة المرور الجديدة إلى عنوان البريد الإلكتروني الخاص بك'),
(41, 1, 'PASS_TOO_SHORT', 'Le mot de passe doit contenir 6 caractères au minimum'),
(41, 2, 'PASS_TOO_SHORT', 'The password must contain 6 characters at least'),
(41, 3, 'PASS_TOO_SHORT', 'يجب أن يحتوي على كلمة المرور ستة أحرف على الأقل'),
(42, 1, 'PASS_DONT_MATCH', 'Les mots de passe doivent correspondre'),
(42, 2, 'PASS_DONT_MATCH', 'The passwords don\'t match'),
(42, 3, 'PASS_DONT_MATCH', 'يجب أن تتطابق كلمات المرور'),
(43, 1, 'ACCOUNT_EXISTS', 'Un compte existe déjà avec cette adresse e-mail'),
(43, 2, 'ACCOUNT_EXISTS', 'An account already exists with this e-mail'),
(43, 3, 'ACCOUNT_EXISTS', 'حساب موجود بالفعل مع هذا عنوان البريد الإلكتروني'),
(44, 1, 'ACCOUNT_CREATED', 'Votre compte a bien été créé. Vous allez recevoir un email de confirmation. Cliquez sur le lien de cet e-mail pour confirmer votre compte avant de continuer.'),
(44, 2, 'ACCOUNT_CREATED', 'Your account has been created. You will receive a confirmation email. Click on the link in this email to confirm your account before continuing.'),
(44, 3, 'ACCOUNT_CREATED', 'Your account has been created. You will receive a confirmation email. Click on the link in this email to confirm your account before continuing.'),
(45, 1, 'INCORRECT_LOGIN', 'Les informations de connexion sont incorrectes.'),
(45, 2, 'INCORRECT_LOGIN', 'Incorrect login information.'),
(45, 3, 'INCORRECT_LOGIN', 'معلومات تسجيل الدخول غير صحيحة.'),
(46, 1, 'I_SIGN_UP', 'Je m\'inscris'),
(46, 2, 'I_SIGN_UP', 'I sign up'),
(46, 3, 'I_SIGN_UP', 'يمكنني الاشتراك'),
(47, 1, 'ALREADY_HAVE_ACCOUNT', 'J\'ai déjà un compte'),
(47, 2, 'ALREADY_HAVE_ACCOUNT', 'I already have an account'),
(47, 3, 'ALREADY_HAVE_ACCOUNT', 'لدي بالفعل حساب'),
(48, 1, 'MY_ACCOUNT', 'Mon compte'),
(48, 2, 'MY_ACCOUNT', 'My account'),
(48, 3, 'MY_ACCOUNT', 'حسابي'),
(49, 1, 'COMMENTS', 'Commentaires'),
(49, 2, 'COMMENTS', 'Comments'),
(49, 3, 'COMMENTS', 'تعليقات'),
(50, 1, 'LET_US_KNOW', 'Faîtes-nous savoir ce que vous pensez'),
(50, 2, 'LET_US_KNOW', 'Let us know what you think'),
(50, 3, 'LET_US_KNOW', 'ماذا عن رايك؟'),
(51, 1, 'COMMENT_SUCCESS', 'Merci de votre intérêt, votre commentaire va être soumis à validation.'),
(51, 2, 'COMMENT_SUCCESS', 'Thank you for your interest, your comment will be checked.'),
(51, 3, 'COMMENT_SUCCESS', 'شكرا ل اهتمامك، و سيتم التحقق من صحة للتعليق.'),
(52, 1, 'NO_SEARCH_RESULT', 'Aucun résultat. Vérifiez l\'orthographe des termes de recherche (> 3 caractères) ou essayez d\'autres mots.'),
(52, 2, 'NO_SEARCH_RESULT', 'No result. Check the spelling terms of search (> 3 characters) or try other words.'),
(52, 3, 'NO_SEARCH_RESULT', 'لا نتيجة. التدقيق الإملائي للكلمات (أكثر من ثلاثة أحرف ) أو محاولة بعبارة أخرى .'),
(53, 1, 'SEARCH_EXCEEDED', 'Nombre de recherches dépassé.'),
(53, 2, 'SEARCH_EXCEEDED', 'Number of researches exceeded.'),
(53, 3, 'SEARCH_EXCEEDED', 'عدد من الأبحاث السابقة .'),
(54, 1, 'SECONDS', 'secondes'),
(54, 2, 'SECONDS', 'seconds'),
(54, 3, 'SECONDS', 'ثواني'),
(55, 1, 'FOR_A_TOTAL_OF', 'sur un total de'),
(55, 2, 'FOR_A_TOTAL_OF', 'for a total of'),
(55, 3, 'FOR_A_TOTAL_OF', 'من الكل'),
(56, 1, 'COMMENT', 'Commentaire'),
(56, 2, 'COMMENT', 'Comment'),
(56, 3, 'COMMENT', 'تعقيب'),
(57, 1, 'VIEW', 'Visionner'),
(57, 2, 'VIEW', 'View'),
(57, 3, 'VIEW', 'ل عرض'),
(58, 1, 'RECENT_ARTICLES', 'Articles récents'),
(58, 2, 'RECENT_ARTICLES', 'Recent articles'),
(58, 3, 'RECENT_ARTICLES', 'المقالات الأخيرة'),
(59, 1, 'RSS_FEED', 'Flux RSS'),
(59, 2, 'RSS_FEED', 'RSS feed'),
(59, 3, 'RSS_FEED', 'تغذية RSS'),
(60, 1, 'COUNTRY', 'Pays'),
(60, 2, 'COUNTRY', 'Country'),
(60, 3, 'COUNTRY', 'Country'),
(61, 1, 'ROOM', 'Chambre'),
(61, 2, 'ROOM', 'Room'),
(61, 3, 'ROOM', 'Room'),
(62, 1, 'INCL_VAT', 'TTC'),
(62, 2, 'INCL_VAT', 'incl. GST'),
(62, 3, 'INCL_VAT', 'incl. VAT'),
(63, 1, 'NIGHTS', 'nuit(s)'),
(63, 2, 'NIGHTS', 'night(s)'),
(63, 3, 'NIGHTS', 'night(s)'),
(64, 1, 'ADULTS', 'Adultes'),
(64, 2, 'ADULTS', 'Adults'),
(64, 3, 'ADULTS', 'Adults'),
(65, 1, 'CHILDREN', 'Enfants'),
(65, 2, 'CHILDREN', 'Children'),
(65, 3, 'CHILDREN', 'Children'),
(66, 1, 'PERSONS', 'personnes'),
(66, 2, 'PERSONS', 'persons'),
(66, 3, 'PERSONS', 'persons'),
(67, 1, 'CONTACT_DETAILS', 'Coordonnées'),
(67, 2, 'CONTACT_DETAILS', 'Contact details'),
(67, 3, 'CONTACT_DETAILS', 'Contact details'),
(68, 1, 'NO_AVAILABILITY', 'Aucune disponibilité'),
(68, 2, 'NO_AVAILABILITY', 'No availability'),
(68, 3, 'NO_AVAILABILITY', 'No availability'),
(69, 1, 'AVAILABILITIES', 'Disponibilités'),
(69, 2, 'AVAILABILITIES', 'Availabilities'),
(69, 3, 'AVAILABILITIES', 'Availabilities'),
(70, 1, 'CHECK', 'Vérifier'),
(70, 2, 'CHECK', 'Check'),
(70, 3, 'CHECK', 'Check'),
(71, 1, 'BOOKING_DETAILS', 'Détails de la réservation'),
(71, 2, 'BOOKING_DETAILS', 'Booking details'),
(71, 3, 'BOOKING_DETAILS', 'Booking details'),
(72, 1, 'SPECIAL_REQUESTS', 'Demandes spéciales'),
(72, 2, 'SPECIAL_REQUESTS', 'Special requests'),
(72, 3, 'SPECIAL_REQUESTS', 'Special requests'),
(73, 1, 'PREVIOUS_STEP', 'Étape précédente'),
(73, 2, 'PREVIOUS_STEP', 'Previous step'),
(73, 3, 'PREVIOUS_STEP', 'Previous step'),
(74, 1, 'CONFIRM_BOOKING', 'Confirmer la réservation'),
(74, 2, 'CONFIRM_BOOKING', 'Confirm the booking'),
(74, 3, 'CONFIRM_BOOKING', 'Confirm the booking'),
(75, 1, 'ALSO_DISCOVER', 'Découvrez aussi'),
(75, 2, 'ALSO_DISCOVER', 'Also discover'),
(75, 3, 'ALSO_DISCOVER', 'Also discover'),
(76, 1, 'CHECK_PEOPLE', 'Merci de vérifier le nombre de personnes pour l\'hébergement choisi.'),
(76, 2, 'CHECK_PEOPLE', 'Please verify the number of people for the chosen accommodation'),
(76, 3, 'CHECK_PEOPLE', 'Please verify the number of people for the chosen accommodation'),
(77, 1, 'BOOKING', 'Réservation'),
(77, 2, 'BOOKING', 'Booking'),
(77, 3, 'BOOKING', 'Booking'),
(78, 1, 'NIGHT', 'nuit'),
(78, 2, 'NIGHT', 'night'),
(78, 3, 'NIGHT', 'night'),
(79, 1, 'WEEK', 'semaine'),
(79, 2, 'WEEK', 'week'),
(79, 3, 'WEEK', 'week'),
(80, 1, 'EXTRA_SERVICES', 'Services supplémentaires'),
(80, 2, 'EXTRA_SERVICES', 'Extra services'),
(80, 3, 'EXTRA_SERVICES', 'Extra services'),
(81, 1, 'BOOKING_TERMS', ''),
(81, 2, 'BOOKING_TERMS', ''),
(81, 3, 'BOOKING_TERMS', ''),
(82, 1, 'NEXT_STEP', 'Étape suivante'),
(82, 2, 'NEXT_STEP', 'Next step'),
(82, 3, 'NEXT_STEP', 'Next step'),
(83, 1, 'TOURIST_TAX', 'Taxe de séjour'),
(83, 2, 'TOURIST_TAX', 'Tourist tax'),
(83, 3, 'TOURIST_TAX', 'Tourist tax'),
(84, 1, 'CHECK_IN', 'Arrivée'),
(84, 2, 'CHECK_IN', 'Check in'),
(84, 3, 'CHECK_IN', 'Check in'),
(85, 1, 'CHECK_OUT', 'Départ'),
(85, 2, 'CHECK_OUT', 'Check out'),
(85, 3, 'CHECK_OUT', 'Check out'),
(86, 1, 'TOTAL', 'Total'),
(86, 2, 'TOTAL', 'Total'),
(86, 3, 'TOTAL', 'Total'),
(87, 1, 'CAPACITY', 'Capacité'),
(87, 2, 'CAPACITY', 'Capacity'),
(87, 3, 'CAPACITY', 'Capacity'),
(88, 1, 'FACILITIES', 'Équipements'),
(88, 2, 'FACILITIES', 'Facilities'),
(88, 3, 'FACILITIES', 'Facilities'),
(89, 1, 'PRICE', 'Prix'),
(89, 2, 'PRICE', 'Price'),
(89, 3, 'PRICE', 'Price'),
(90, 1, 'MORE_DETAILS', 'Plus d\'infos'),
(90, 2, 'MORE_DETAILS', 'More details'),
(90, 3, 'MORE_DETAILS', 'More details'),
(91, 1, 'FROM_PRICE', 'À partir de'),
(91, 2, 'FROM_PRICE', 'From'),
(91, 3, 'FROM_PRICE', 'From'),
(92, 1, 'AMOUNT', 'Montant'),
(92, 2, 'AMOUNT', 'Amount'),
(92, 3, 'AMOUNT', 'Amount'),
(93, 1, 'PAY', 'Payer'),
(93, 2, 'PAY', 'Check out'),
(93, 3, 'PAY', 'Check out'),
(94, 1, 'PAYMENT_PAYPAL_NOTICE', 'Cliquez sur \"Payer\" ci-dessous, vous allez être redirigé vers le site sécurisé de PayPal'),
(94, 2, 'PAYMENT_PAYPAL_NOTICE', 'Click on \"Check Out\" below, you will be redirected towards the secure site of PayPal'),
(94, 3, 'PAYMENT_PAYPAL_NOTICE', 'Click on \"Check Out\" below, you will be redirected towards the secure site of PayPal'),
(95, 1, 'PAYMENT_CANCEL_NOTICE', 'Le paiement a été annulé.<br>Merci de votre visite et à bientôt.'),
(95, 2, 'PAYMENT_CANCEL_NOTICE', 'The payment has been cancelled.<br>Thank you for your visit and see you soon.'),
(95, 3, 'PAYMENT_CANCEL_NOTICE', 'The payment has been cancelled.<br>Thank you for your visit and see you soon.'),
(96, 1, 'PAYMENT_SUCCESS_NOTICE', 'Le paiement a été réalisé avec succès.<br>Merci de votre visite et à bientôt !'),
(96, 2, 'PAYMENT_SUCCESS_NOTICE', 'Your payment has been successfully processed.<br>Thank you for your visit and see you soon!'),
(96, 3, 'PAYMENT_SUCCESS_NOTICE', 'Your payment has been successfully processed.<br>Thank you for your visit and see you soon!'),
(97, 1, 'BILLING_ADDRESS', 'Adresse de facturation'),
(97, 2, 'BILLING_ADDRESS', 'Billing address'),
(97, 3, 'BILLING_ADDRESS', 'Billing address'),
(98, 1, 'DOWN_PAYMENT', 'Acompte'),
(98, 2, 'DOWN_PAYMENT', 'Down payment'),
(98, 3, 'DOWN_PAYMENT', 'Down payment'),
(99, 1, 'PAYMENT_CHECK_NOTICE', 'Merci d\'envoyer un chèque à \"Panda Resort, Santorini 847 00, Greece\" d\'un montant de {amount}.<br>Votre réservation sera validée à réception du paiement.<br>Merci de votre visite et à bientôt !'),
(99, 2, 'PAYMENT_CHECK_NOTICE', 'Thank you for sending a check of {amount} to \"Panda Resort, Santorini 847 00, Greece\".<br>Your reservation will be confirmed upon receipt of the payment.<br>Thank you for your visit and see you soon!'),
(99, 3, 'PAYMENT_CHECK_NOTICE', 'Thank you for sending a check of {amount} to \"Panda Resort, Santorini 847 00, Greece\".<br>Your reservation will be confirmed upon receipt of the payment.<br>Thank you for your visit and see you soon!'),
(100, 1, 'PAYMENT_ARRIVAL_NOTICE', 'Veuillez régler le solde de votre réservation d\'un montant de {amount} à votre arrivée.<br>Merci de votre visite et à bientôt !'),
(100, 2, 'PAYMENT_ARRIVAL_NOTICE', 'Thank you for paying the balance of {amount} for your booking on your arrival.<br>Thank you for your visit and see you soon!'),
(100, 3, 'PAYMENT_ARRIVAL_NOTICE', 'Thank you for paying the balance of {amount} for your booking on your arrival.<br>Thank you for your visit and see you soon!'),
(101, 1, 'MAX_PEOPLE', 'Pers. max'),
(101, 2, 'MAX_PEOPLE', 'Max people'),
(101, 3, 'MAX_PEOPLE', 'Max people'),
(102, 1, 'VAT_AMOUNT', 'Dont TVA'),
(102, 2, 'VAT_AMOUNT', 'VAT amount'),
(102, 3, 'VAT_AMOUNT', 'VAT amount'),
(103, 1, 'MIN_NIGHTS', 'Nuits min'),
(103, 2, 'MIN_NIGHTS', 'Min nights'),
(103, 3, 'MIN_NIGHTS', 'Min nights'),
(104, 1, 'MIN_PEOPLE', 'Pers. min'),
(104, 2, 'MIN_PEOPLE', 'Min people'),
(104, 3, 'MIN_PEOPLE', 'Min people'),
(105, 1, 'RATINGS', 'Note(s)'),
(105, 2, 'RATINGS', 'Rating(s)'),
(105, 3, 'RATINGS', 'Rating(s)'),
(106, 1, 'MAKE_A_REQUEST', 'Faire une demande'),
(106, 2, 'MAKE_A_REQUEST', 'Make a request'),
(106, 3, 'MAKE_A_REQUEST', 'Make a request'),
(109, 1, 'FULLNAME', 'Nom complet'),
(109, 2, 'FULLNAME', 'Full Name'),
(109, 3, 'FULLNAME', 'Full Name'),
(110, 1, 'PASSWORD', 'Mot de passe'),
(110, 2, 'PASSWORD', 'Password'),
(110, 3, 'PASSWORD', 'Password'),
(111, 1, 'LOG_IN_WITH_FACEBOOK', 'Enregistrez-vous avec Facebook'),
(111, 2, 'LOG_IN_WITH_FACEBOOK', 'Log in with Facebook'),
(111, 3, 'LOG_IN_WITH_FACEBOOK', 'Log in with Facebook'),
(112, 1, 'OR', 'Ou'),
(112, 2, 'OR', 'Or'),
(112, 3, 'OR', 'Or'),
(113, 1, 'NEW_PASSWORD', 'Nouveau mot de passe'),
(113, 2, 'NEW_PASSWORD', 'New password'),
(113, 3, 'NEW_PASSWORD', 'New password'),
(114, 1, 'NEW_PASSWORD_NOTICE', 'Merci d\'entrer l\'adresse e-mail correspondant à votre compte. Un nouveau mot de passe vous sera envoyé par e-mail.'),
(114, 2, 'NEW_PASSWORD_NOTICE', 'Please enter your e-mail address corresponding to your account. A new password will be sent to you by e-mail.'),
(114, 3, 'NEW_PASSWORD_NOTICE', 'Please enter your e-mail address corresponding to your account. A new password will be sent to you by e-mail.'),
(115, 1, 'USERNAME', 'Utilisateur'),
(115, 2, 'USERNAME', 'Username'),
(115, 3, 'USERNAME', 'Username'),
(116, 1, 'PASSWORD_CONFIRM', 'Confirmer mot de passe'),
(116, 2, 'PASSWORD_CONFIRM', 'Confirm password'),
(116, 3, 'PASSWORD_CONFIRM', 'Confirm password'),
(117, 1, 'USERNAME_EXISTS', 'Un compte existe déjà avec ce nom d\'utilisateur'),
(117, 2, 'USERNAME_EXISTS', 'An account already exists with this username'),
(117, 3, 'USERNAME_EXISTS', 'An account already exists with this username'),
(118, 1, 'ACCOUNT_EDIT_SUCCESS', 'Les informations de votre compte ont bien été modifiées.'),
(118, 2, 'ACCOUNT_EDIT_SUCCESS', 'Your account information have been changed.'),
(118, 3, 'ACCOUNT_EDIT_SUCCESS', 'Your account information have been changed.'),
(119, 1, 'ACCOUNT_EDIT_FAILURE', 'Echec de la modification des informations de compte.'),
(119, 2, 'ACCOUNT_EDIT_FAILURE', 'An error occured during the modification of the account information.'),
(119, 3, 'ACCOUNT_EDIT_FAILURE', 'An error occured during the modification of the account information.'),
(120, 1, 'ACCOUNT_CREATE_FAILURE', 'Echec de la création du compte.'),
(120, 2, 'ACCOUNT_CREATE_FAILURE', 'Failed to create account.'),
(120, 3, 'ACCOUNT_CREATE_FAILURE', 'Failed to create account.'),
(121, 1, 'PAYMENT_CHECK', 'Par chèque'),
(121, 2, 'PAYMENT_CHECK', 'By check'),
(121, 3, 'PAYMENT_CHECK', 'By check'),
(122, 1, 'PAYMENT_ARRIVAL', 'A l\'arrivée'),
(122, 2, 'PAYMENT_ARRIVAL', 'On arrival'),
(122, 3, 'PAYMENT_ARRIVAL', 'On arrival'),
(123, 1, 'CHOOSE_PAYMENT', 'Choisissez un moyen de paiement'),
(123, 2, 'CHOOSE_PAYMENT', 'Choose a method of payment'),
(123, 3, 'CHOOSE_PAYMENT', 'Choose a method of payment'),
(124, 1, 'PAYMENT_CREDIT_CARDS', 'Cartes de credit'),
(124, 2, 'PAYMENT_CREDIT_CARDS', 'Credit cards'),
(124, 3, 'PAYMENT_CREDIT_CARDS', 'Credit cards'),
(125, 1, 'MAX_ADULTS', 'Adultes max'),
(125, 2, 'MAX_ADULTS', 'Max adults'),
(125, 3, 'MAX_ADULTS', 'Max adults'),
(126, 1, 'MAX_CHILDREN', 'Enfants max'),
(126, 2, 'MAX_CHILDREN', 'Max children'),
(126, 3, 'MAX_CHILDREN', 'Max children'),
(127, 1, 'PAYMENT_2CHECKOUT_NOTICE', 'Cliquez sur \"Payer\" ci-dessous, vous allez être redirigé vers le site sécurisé de 2Checkout.com'),
(127, 2, 'PAYMENT_2CHECKOUT_NOTICE', 'Click on \"Check Out\" below, you will be redirected towards the secure site of 2Checkout.com'),
(127, 3, 'PAYMENT_2CHECKOUT_NOTICE', 'Click on \"Check Out\" below, you will be redirected towards the secure site of 2Checkout.com'),
(128, 1, 'COOKIES_NOTICE', 'Les cookies nous aident à fournir une meilleure expérience utilisateur. En utilisant notre site, vous acceptez l\'utilisation de cookies.'),
(128, 2, 'COOKIES_NOTICE', 'Cookies help us provide better user experience. By using our website, you agree to the use of cookies.'),
(128, 3, 'COOKIES_NOTICE', 'Cookies help us provide better user experience. By using our website, you agree to the use of cookies.'),
(129, 1, 'DURATION', 'Durée'),
(129, 2, 'DURATION', 'Duration'),
(129, 3, 'DURATION', 'Duration'),
(130, 1, 'PERSON', 'Personne'),
(130, 2, 'PERSON', 'Person'),
(130, 3, 'PERSON', 'Person'),
(131, 1, 'CHOOSE_A_DATE', 'Choisissez une date'),
(131, 2, 'CHOOSE_A_DATE', 'Choose a date'),
(131, 3, 'CHOOSE_A_DATE', 'Choose a date'),
(132, 1, 'TIMESLOT', 'Horaire'),
(132, 2, 'TIMESLOT', 'Time slot'),
(132, 3, 'TIMESLOT', 'Time slot'),
(133, 1, 'ACTIVITIES', 'Activités'),
(133, 2, 'ACTIVITIES', 'Activities'),
(133, 3, 'ACTIVITIES', 'Activities'),
(134, 1, 'DESTINATION', 'Destination'),
(134, 2, 'DESTINATION', 'Destination'),
(134, 3, 'DESTINATION', 'Destination'),
(135, 1, 'NO_HOTEL_FOUND', 'Aucun hotel trouvé'),
(135, 2, 'NO_HOTEL_FOUND', 'No hotel found'),
(135, 3, 'NO_HOTEL_FOUND', 'No hotel found'),
(136, 1, 'FOR', 'pour'),
(136, 2, 'FOR', 'for'),
(136, 3, 'FOR', 'for'),
(137, 1, 'FIND_ACTIVITIES_AND_TOURS', 'Découvrez nos activités et excursions'),
(137, 2, 'FIND_ACTIVITIES_AND_TOURS', 'Find out our activities and tours'),
(137, 3, 'FIND_ACTIVITIES_AND_TOURS', 'Find out our activities and tours'),
(138, 1, 'MINUTES', 'minute(s)'),
(138, 2, 'MINUTES', 'minute(s)'),
(138, 3, 'MINUTES', 'minute(s)'),
(139, 1, 'HOURS', 'heure(s)'),
(139, 2, 'HOURS', 'hour(s)'),
(139, 3, 'HOURS', 'hour(s)'),
(140, 1, 'DAYS', 'jour(s)'),
(140, 2, 'DAYS', 'day(s)'),
(140, 3, 'DAYS', 'day(s)'),
(141, 1, 'WEEKS', 'semaine(s)'),
(141, 2, 'WEEKS', 'week(s)'),
(141, 3, 'WEEKS', 'week(s)'),
(142, 1, 'RESULTS', 'Résultats'),
(142, 2, 'RESULTS', 'Results'),
(142, 3, 'RESULTS', 'Results'),
(143, 1, 'BOOKING_HISTORY', 'Historique des réservations'),
(143, 2, 'BOOKING_HISTORY', 'Booking history'),
(143, 3, 'BOOKING_HISTORY', 'Booking history'),
(144, 1, 'BOOKING_SUMMARY', 'Résumé de la réservation'),
(144, 2, 'BOOKING_SUMMARY', 'Booking summary'),
(144, 3, 'BOOKING_SUMMARY', 'Booking summary'),
(145, 1, 'BOOKING_DATE', 'Date de la réservations'),
(145, 2, 'BOOKING_DATE', 'Booking date'),
(145, 3, 'BOOKING_DATE', 'Booking date'),
(146, 1, 'NO_BOOKING_YET', 'Pas encore de réservation...'),
(146, 2, 'NO_BOOKING_YET', 'No booking yet...'),
(146, 3, 'NO_BOOKING_YET', 'No booking yet...'),
(147, 1, 'PAYMENT', 'Paiement'),
(147, 2, 'PAYMENT', 'Payment'),
(147, 3, 'PAYMENT', 'Payment'),
(148, 1, 'PAYMENT_DATE', 'Date du paiement'),
(148, 2, 'PAYMENT_DATE', 'Payment date'),
(148, 3, 'PAYMENT_DATE', 'Payment date'),
(149, 1, 'PAYMENT_METHOD', 'Méthode de paiement'),
(149, 2, 'PAYMENT_METHOD', 'Payment method'),
(149, 3, 'PAYMENT_METHOD', 'Payment method'),
(150, 1, 'NUM_TRANSACTION', 'N°transaction'),
(150, 2, 'NUM_TRANSACTION', 'Num. transaction'),
(150, 3, 'NUM_TRANSACTION', 'Num. transaction'),
(151, 1, 'STATUS', 'Statut'),
(151, 2, 'STATUS', 'Status'),
(151, 3, 'STATUS', 'Status'),
(152, 1, 'AWAITING', 'En attente'),
(152, 2, 'AWAITING', 'Awaiting'),
(152, 3, 'AWAITING', 'Awaiting'),
(153, 1, 'CANCELLED', 'Annulé'),
(153, 2, 'CANCELLED', 'Cancelled'),
(153, 3, 'CANCELLED', 'Cancelled'),
(154, 1, 'REJECTED_PAYMENT', 'Paiement rejeté'),
(154, 2, 'REJECTED_PAYMENT', 'Rejected payment'),
(154, 3, 'REJECTED_PAYMENT', 'Rejected payment'),
(155, 1, 'PAYED', 'Payé'),
(155, 2, 'PAYED', 'Payed'),
(155, 3, 'PAYED', 'Payed'),
(156, 1, 'INCL_TAX', 'TTC'),
(156, 2, 'INCL_TAX', 'incl. tax'),
(156, 3, 'INCL_TAX', 'incl. tax'),
(157, 1, 'TAGS', 'Tags'),
(157, 2, 'TAGS', 'Tags'),
(157, 3, 'TAGS', 'Tags'),
(158, 1, 'ARCHIVES', 'Archives'),
(158, 2, 'ARCHIVES', 'Archives'),
(158, 3, 'ARCHIVES', 'Archives'),
(162, 1, 'LOAD_MORE', 'Voir plus'),
(162, 2, 'LOAD_MORE', 'Load more'),
(162, 3, 'LOAD_MORE', 'Load more'),
(163, 1, 'DO_YOU_HAVE_A_COUPON', 'Avez-vous un code promo ?'),
(163, 2, 'DO_YOU_HAVE_A_COUPON', 'Do you have a coupon?'),
(163, 3, 'DO_YOU_HAVE_A_COUPON', 'Do you have a coupon?'),
(164, 1, 'DISCOUNT', 'Réduction'),
(164, 2, 'DISCOUNT', 'Discount'),
(164, 3, 'DISCOUNT', 'Discount'),
(165, 1, 'COUPON_CODE_SUCCESS', 'Félicitations ! Le code promo a été ajouté avec succès.'),
(165, 2, 'COUPON_CODE_SUCCESS', 'Congratulations! The coupon code has been successfully added.'),
(165, 3, 'COUPON_CODE_SUCCESS', 'Congratulations! The coupon code has been successfully added.'),
(166, 1, 'ROOMS', 'chambres'),
(166, 2, 'ROOMS', 'rooms'),
(166, 3, 'ROOMS', 'rooms'),
(167, 1, 'ADULT', 'adulte'),
(167, 2, 'ADULT', 'adult'),
(167, 3, 'ADULT', 'adult'),
(168, 1, 'CHILD', 'enfant'),
(168, 2, 'CHILD', 'child'),
(168, 3, 'CHILD', 'child'),
(169, 1, 'ACTIVITY', 'Activité'),
(169, 2, 'ACTIVITY', 'Activity'),
(169, 3, 'ACTIVITY', 'Activity'),
(170, 1, 'DATE', 'Date'),
(170, 2, 'DATE', 'Date'),
(170, 3, 'DATE', 'Date'),
(171, 1, 'QUANTITY', 'Quantité'),
(171, 2, 'QUANTITY', 'Quantity'),
(171, 3, 'QUANTITY', 'Quantity'),
(172, 1, 'SERVICE', 'Service'),
(172, 2, 'SERVICE', 'Service'),
(172, 3, 'SERVICE', 'Service'),
(173, 1, 'BOOKING_NOTICE', '<h2>Réservez sur notre site</h2><p class=\"lead mb0\">Dépêchez-vous ! Sélectionnez vos chambres, complétez votre réservation et profitez de nos packages et offres spéciales ! <br><b>Meilleur prix garanti !</b></p>'),
(173, 2, 'BOOKING_NOTICE', '<h2>Book on our website</h2><p class=\"lead mb0\">Hurry up! Select the your rooms, complete your booking and take advantage of our special offers and packages!<br><b>Best price guarantee!</b></p>'),
(173, 3, 'BOOKING_NOTICE', '<h2>Book on our website</h2><p class=\"lead mb0\">Hurry up! Select the your rooms, complete your booking and take advantage of our special offers and packages!<br><b>Best price guarantee!</b></p>'),
(174, 1, 'CONTINUE_AS_GUEST', 'Continuer sans m\'enregistrer'),
(174, 2, 'CONTINUE_AS_GUEST', 'Continue as guest'),
(174, 3, 'CONTINUE_AS_GUEST', 'Continue as guest'),
(175, 1, 'NUM_ROOMS', 'Nb chambres'),
(175, 2, 'NUM_ROOMS', 'Num rooms'),
(175, 3, 'NUM_ROOMS', 'Num rooms'),
(176, 1, 'PRIVACY_POLICY_AGREEMENT', '<small>J\'accepte que les informations recueillies par ce formulaire soient stockées dans un fichier informatisé afin de traiter ma demande.<br>Conformément au \"Réglement Général sur la Protection des Données\", vous pouvez exercer votre droit d\'accès aux données vous concernant et les faire rectifier via le formulaire de contact.</small>'),
(176, 2, 'PRIVACY_POLICY_AGREEMENT', '<small>I agree that the information collected by this form will be stored in a database in order to process my request.<br>In accordance with the \"General Data Protection Regulation\", you can exercise your right to access to your data and make them rectified via the contact form.</small>'),
(176, 3, 'PRIVACY_POLICY_AGREEMENT', '<small>I agree that the information collected by this form will be stored in a database in order to process my request.<br>In accordance with the \"General Data Protection Regulation\", you can exercise your right to access to your data and make them rectified via the contact form.</small>'),
(177, 1, 'COMPLETE_YOUR_BOOKING', 'Terminez votre réservation !'),
(177, 2, 'COMPLETE_YOUR_BOOKING', 'Complete your booking!'),
(177, 3, 'COMPLETE_YOUR_BOOKING', 'Complete your booking!'),
(178, 1, 'PENDING', 'En attente'),
(178, 2, 'PENDING', 'Pending'),
(178, 3, 'PENDING', 'Pending'),
(179, 1, 'CHILDREN_AGE', 'Age des enfants'),
(179, 2, 'CHILDREN_AGE', 'Age of children'),
(179, 3, 'CHILDREN_AGE', 'Age of children'),
(180, 1, 'BOOK_NOW', 'Réserver maintenant'),
(180, 2, 'BOOK_NOW', 'Book now'),
(180, 3, 'BOOK_NOW', 'Book now'),
(181, 1, 'DISCOVER_ALSO', 'Découvrez aussi'),
(181, 2, 'DISCOVER_ALSO', 'Discover also'),
(181, 3, 'DISCOVER_ALSO', 'Discover also'),
(182, 1, 'PAYMENT_BRAINTREE_NOTICE', 'Remplissez le formulaire ci-dessous avec les informations de votre carte de crédit, puis cliquez sur \"Payer\".'),
(182, 2, 'PAYMENT_BRAINTREE_NOTICE', 'Fill in the form bellow with your credit card information, then click on \"Check Out\".'),
(182, 3, 'PAYMENT_BRAINTREE_NOTICE', 'Fill in the form bellow with your credit card information, then click on \"Check Out\".'),
(183, 1, 'COUPON_CODE_FAILURE', 'Erreur : ce code est invalide ou a déjà été utilisé'),
(183, 2, 'COUPON_CODE_FAILURE', 'Error: this code is invalid or already used'),
(183, 3, 'COUPON_CODE_FAILURE', 'Error: this code is invalid or already used'),
(184, 1, 'PAYMENT_RAZORPAY_NOTICE', 'Cliquez sur \"Payer\", puis remplissez le formulaire avec les informations de votre carte de crédit.'),
(184, 2, 'PAYMENT_RAZORPAY_NOTICE', 'Click on \"Check Out\", then fill in the form with your credit card information.'),
(184, 3, 'PAYMENT_RAZORPAY_NOTICE', 'Click on \"Check Out\", then fill in the form with your credit card information.'),
(185, 1, 'YO', 'y.o.'),
(185, 2, 'YO', 'ans'),
(185, 3, 'YO', 'y.o.');

-- --------------------------------------------------------

--
-- Table structure for table `pm_user`
--

CREATE TABLE `pm_user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `add_date` int(11) DEFAULT NULL,
  `edit_date` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT 0,
  `fb_id` varchar(50) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_user`
--

INSERT INTO `pm_user` (`id`, `firstname`, `lastname`, `email`, `login`, `pass`, `type`, `add_date`, `edit_date`, `checked`, `fb_id`, `address`, `postcode`, `city`, `company`, `country`, `mobile`, `phone`, `token`) VALUES
(1, 'saniya', 'khan', 'sksaniya028@gmail.com', 'saniya', '73111ef085330bb09247cd5b8d99c6c9', 'administrator', 1715666456, 1721980393, 1, '', 'gurgaon haryana', '122050', 'Gurgaon', 'ask', 'India', '', '8126937491', ''),
(2, 'Sunil', 'Arora', 'classicsunil@gmail.com', 'classicsunil', '0d8d75b76805feab4f63547172994dd7', 'registered', 1716192661, 1716195986, 1, NULL, '1743GF, Sector 9, Bahadurgarh', '124001', 'Bahadurgarh', '', 'India', '', '8818001824', ''),
(3, 'saloni', 'samrath', 'salonisamrath7203@gmail.com', 'salonisamrath', 'e212b9ef5e0be242171e058ea16a6130', 'registered', 1718620388, NULL, 0, NULL, '31h k pocket sheikh sarai phase 2', '110017', 'delhi', '', 'India', '', '7717763119', 'd0e49dfc66bf9ec9570b0be74b3591a5'),
(4, 'Praveen', 'Kumar', 'pk539621@gmail.com', 'rajaniprav', 'f1fcd14e5c63c53c636e01a00e628c04', 'registered', 1719246375, 1719284471, 1, NULL, '324 Block D Nikhil vihar ismailpur Faridabad', '121003', 'Faridabad', '', 'India', '8447350203', '8447350203', '');

-- --------------------------------------------------------

--
-- Table structure for table `pm_widget`
--

CREATE TABLE `pm_widget` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `showtitle` int(11) DEFAULT NULL,
  `pos` varchar(20) DEFAULT NULL,
  `allpages` int(11) DEFAULT NULL,
  `pages` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `class` varchar(200) DEFAULT NULL,
  `checked` int(11) DEFAULT 0,
  `rank` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pm_widget`
--

INSERT INTO `pm_widget` (`id`, `lang`, `title`, `showtitle`, `pos`, `allpages`, `pages`, `type`, `content`, `class`, `checked`, `rank`) VALUES
(1, 1, 'Qui sommes-nous ?', 1, 'footer_col_1', 1, '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget auctor ipsum. Mauris pharetra neque a mauris commodo, at aliquam leo malesuada. Maecenas eget elit eu ligula rhoncus dapibus at non erat. In sed velit eget eros gravida consectetur varius imperdiet lectus.</p>', '', 1, 1),
(1, 2, 'About us', 1, 'footer_col_1', 1, '4', '', '<p>JPS Residency & Hospitality Services, your premier destination in IMT Manesar, Gurgaon for luxury, relaxation, and unforgettable events. Specializing in destination weddings, we provide an idyllic setting that transforms… <a href=\"https://www.jpsresidency.in/hotel\" target=\"_blank\" rel=\"noopener noreferrer\">Read more</a></p><p> </p><p><a href=\"https://g.co/kgs/Mo99v8U\" target=\"_blank\" rel=\"noopener noreferrer\"><strong>Reviews us on Google</strong></a></p><p><img class=\"image_resized\" style=\"width:13.07%;\" src=\"https://www.jpsresidency.in/medias/media/big/12/google-removebg-preview.png\" alt=\"\"></p>', '', 1, 1),
(1, 3, 'عنا', 1, 'footer_col_1', 1, '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget auctor ipsum. Mauris pharetra neque a mauris commodo, at aliquam leo malesuada. Maecenas eget elit eu ligula rhoncus dapibus at non erat. In sed velit eget eros gravida consectetur varius imperdiet lectus.</p>', '', 1, 1),
(3, 1, 'Derniers articles', 1, 'footer_col_2', 1, '', 'latest_articles', '', '', 1, 2),
(3, 2, 'Latest articles', 1, 'footer_col_2', 1, '', 'latest_articles', '', '', 1, 2),
(3, 3, 'المقالات الأخيرة', 1, 'footer_col_2', 1, '', 'latest_articles', '', '', 1, 2),
(4, 1, 'Contactez-nous', 0, 'footer_col_3', 1, '', 'contact_informations', '', '', 1, 3),
(4, 2, 'Contact us', 0, 'footer_col_3', 1, '', 'contact_informations', '', '', 1, 3),
(4, 3, 'اتصل بنا', 0, 'footer_col_3', 1, '', 'contact_informations', '', '', 1, 3),
(5, 1, 'Footer form', 0, 'footer_col_3', 1, '', 'footer_form', '', 'footer-form mt10', 2, 4),
(5, 2, 'Footer form', 0, 'footer_col_3', 1, '', 'footer_form', '', 'footer-form mt10', 2, 4),
(5, 3, 'Footer form', 0, 'footer_col_3', 1, '', 'footer_form', '', 'footer-form mt10', 2, 4),
(6, 1, 'Blog side', 0, 'right', 0, '17', 'blog_side', '', '', 1, 5),
(6, 2, 'Blog side', 0, 'right', 0, '17', 'blog_side', '', '', 1, 5),
(6, 3, 'Blog side', 0, 'right', 0, '17', 'blog_side', '', '', 1, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pm_activity`
--
ALTER TABLE `pm_activity`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `activity_lang_fkey` (`lang`);

--
-- Indexes for table `pm_activity_file`
--
ALTER TABLE `pm_activity_file`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `activity_file_fkey` (`id_item`,`lang`),
  ADD KEY `activity_file_lang_fkey` (`lang`);

--
-- Indexes for table `pm_activity_session`
--
ALTER TABLE `pm_activity_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_session_fkey` (`id_activity`);

--
-- Indexes for table `pm_activity_session_hour`
--
ALTER TABLE `pm_activity_session_hour`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_session_hour_fkey` (`id_activity_session`);

--
-- Indexes for table `pm_article`
--
ALTER TABLE `pm_article`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `article_lang_fkey` (`lang`),
  ADD KEY `article_page_fkey` (`id_page`,`lang`);

--
-- Indexes for table `pm_article_file`
--
ALTER TABLE `pm_article_file`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `article_file_fkey` (`id_item`,`lang`),
  ADD KEY `article_file_lang_fkey` (`lang`);

--
-- Indexes for table `pm_booking`
--
ALTER TABLE `pm_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pm_booking_activity`
--
ALTER TABLE `pm_booking_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_activity_fkey` (`id_booking`);

--
-- Indexes for table `pm_booking_payment`
--
ALTER TABLE `pm_booking_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_payment_fkey` (`id_booking`);

--
-- Indexes for table `pm_booking_room`
--
ALTER TABLE `pm_booking_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_room_fkey` (`id_booking`);

--
-- Indexes for table `pm_booking_service`
--
ALTER TABLE `pm_booking_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_service_fkey` (`id_booking`);

--
-- Indexes for table `pm_booking_tax`
--
ALTER TABLE `pm_booking_tax`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_tax_fkey` (`id_booking`);

--
-- Indexes for table `pm_comment`
--
ALTER TABLE `pm_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pm_country`
--
ALTER TABLE `pm_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pm_coupon`
--
ALTER TABLE `pm_coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pm_currency`
--
ALTER TABLE `pm_currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pm_email_content`
--
ALTER TABLE `pm_email_content`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `email_content_lang_fkey` (`lang`);

--
-- Indexes for table `pm_facility`
--
ALTER TABLE `pm_facility`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `facility_lang_fkey` (`lang`);

--
-- Indexes for table `pm_facility_file`
--
ALTER TABLE `pm_facility_file`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `facility_file_fkey` (`id_item`,`lang`),
  ADD KEY `facility_file_lang_fkey` (`lang`);

--
-- Indexes for table `pm_ical_event`
--
ALTER TABLE `pm_ical_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ical_event_fkey` (`id_room`);

--
-- Indexes for table `pm_lang`
--
ALTER TABLE `pm_lang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pm_lang_file`
--
ALTER TABLE `pm_lang_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang_file_fkey` (`id_item`);

--
-- Indexes for table `pm_location`
--
ALTER TABLE `pm_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pm_media`
--
ALTER TABLE `pm_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pm_media_file`
--
ALTER TABLE `pm_media_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_file_fkey` (`id_item`);

--
-- Indexes for table `pm_menu`
--
ALTER TABLE `pm_menu`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `menu_lang_fkey` (`lang`);

--
-- Indexes for table `pm_message`
--
ALTER TABLE `pm_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pm_package`
--
ALTER TABLE `pm_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pm_page`
--
ALTER TABLE `pm_page`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `page_lang_fkey` (`lang`);

--
-- Indexes for table `pm_page_file`
--
ALTER TABLE `pm_page_file`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `page_file_fkey` (`id_item`,`lang`),
  ADD KEY `page_file_lang_fkey` (`lang`);

--
-- Indexes for table `pm_popup`
--
ALTER TABLE `pm_popup`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `popup_lang_fkey` (`lang`);

--
-- Indexes for table `pm_rate`
--
ALTER TABLE `pm_rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rate_room_fkey` (`id_room`);

--
-- Indexes for table `pm_rate_child`
--
ALTER TABLE `pm_rate_child`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rate_child_fkey` (`id_rate`);

--
-- Indexes for table `pm_room`
--
ALTER TABLE `pm_room`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `room_lang_fkey` (`lang`);

--
-- Indexes for table `pm_room_calendar`
--
ALTER TABLE `pm_room_calendar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_calendar_fkey` (`id_room`);

--
-- Indexes for table `pm_room_closing`
--
ALTER TABLE `pm_room_closing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_closing_fkey` (`id_room`);

--
-- Indexes for table `pm_room_file`
--
ALTER TABLE `pm_room_file`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `room_file_fkey` (`id_item`,`lang`),
  ADD KEY `room_file_lang_fkey` (`lang`);

--
-- Indexes for table `pm_room_lock`
--
ALTER TABLE `pm_room_lock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_lock_fkey` (`id_room`);

--
-- Indexes for table `pm_service`
--
ALTER TABLE `pm_service`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `service_lang_fkey` (`lang`);

--
-- Indexes for table `pm_slide`
--
ALTER TABLE `pm_slide`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `slide_lang_fkey` (`lang`),
  ADD KEY `slide_page_fkey` (`id_page`,`lang`);

--
-- Indexes for table `pm_slide_file`
--
ALTER TABLE `pm_slide_file`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `slide_file_fkey` (`id_item`,`lang`),
  ADD KEY `slide_file_lang_fkey` (`lang`);

--
-- Indexes for table `pm_social`
--
ALTER TABLE `pm_social`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pm_tag`
--
ALTER TABLE `pm_tag`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `tag_lang_fkey` (`lang`);

--
-- Indexes for table `pm_tax`
--
ALTER TABLE `pm_tax`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `tax_lang_fkey` (`lang`);

--
-- Indexes for table `pm_text`
--
ALTER TABLE `pm_text`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `text_lang_fkey` (`lang`);

--
-- Indexes for table `pm_user`
--
ALTER TABLE `pm_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pm_widget`
--
ALTER TABLE `pm_widget`
  ADD PRIMARY KEY (`id`,`lang`),
  ADD KEY `widget_lang_fkey` (`lang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pm_activity`
--
ALTER TABLE `pm_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pm_activity_file`
--
ALTER TABLE `pm_activity_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pm_activity_session`
--
ALTER TABLE `pm_activity_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pm_activity_session_hour`
--
ALTER TABLE `pm_activity_session_hour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pm_article`
--
ALTER TABLE `pm_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pm_article_file`
--
ALTER TABLE `pm_article_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `pm_booking`
--
ALTER TABLE `pm_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `pm_booking_activity`
--
ALTER TABLE `pm_booking_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pm_booking_payment`
--
ALTER TABLE `pm_booking_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pm_booking_room`
--
ALTER TABLE `pm_booking_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `pm_booking_service`
--
ALTER TABLE `pm_booking_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pm_booking_tax`
--
ALTER TABLE `pm_booking_tax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `pm_comment`
--
ALTER TABLE `pm_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pm_country`
--
ALTER TABLE `pm_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `pm_coupon`
--
ALTER TABLE `pm_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pm_currency`
--
ALTER TABLE `pm_currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pm_email_content`
--
ALTER TABLE `pm_email_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pm_facility`
--
ALTER TABLE `pm_facility`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `pm_facility_file`
--
ALTER TABLE `pm_facility_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `pm_ical_event`
--
ALTER TABLE `pm_ical_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pm_lang`
--
ALTER TABLE `pm_lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pm_lang_file`
--
ALTER TABLE `pm_lang_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pm_location`
--
ALTER TABLE `pm_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pm_media`
--
ALTER TABLE `pm_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pm_media_file`
--
ALTER TABLE `pm_media_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pm_menu`
--
ALTER TABLE `pm_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `pm_message`
--
ALTER TABLE `pm_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `pm_package`
--
ALTER TABLE `pm_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pm_page`
--
ALTER TABLE `pm_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pm_page_file`
--
ALTER TABLE `pm_page_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pm_popup`
--
ALTER TABLE `pm_popup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pm_rate`
--
ALTER TABLE `pm_rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pm_rate_child`
--
ALTER TABLE `pm_rate_child`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pm_room`
--
ALTER TABLE `pm_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pm_room_calendar`
--
ALTER TABLE `pm_room_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pm_room_closing`
--
ALTER TABLE `pm_room_closing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pm_room_file`
--
ALTER TABLE `pm_room_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pm_room_lock`
--
ALTER TABLE `pm_room_lock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `pm_service`
--
ALTER TABLE `pm_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pm_slide`
--
ALTER TABLE `pm_slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pm_slide_file`
--
ALTER TABLE `pm_slide_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pm_social`
--
ALTER TABLE `pm_social`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pm_tag`
--
ALTER TABLE `pm_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pm_tax`
--
ALTER TABLE `pm_tax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pm_text`
--
ALTER TABLE `pm_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `pm_user`
--
ALTER TABLE `pm_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pm_widget`
--
ALTER TABLE `pm_widget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pm_activity`
--
ALTER TABLE `pm_activity`
  ADD CONSTRAINT `activity_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_activity_file`
--
ALTER TABLE `pm_activity_file`
  ADD CONSTRAINT `activity_file_fkey` FOREIGN KEY (`id_item`,`lang`) REFERENCES `pm_activity` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `activity_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_activity_session`
--
ALTER TABLE `pm_activity_session`
  ADD CONSTRAINT `activity_session_fkey` FOREIGN KEY (`id_activity`) REFERENCES `pm_activity` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_activity_session_hour`
--
ALTER TABLE `pm_activity_session_hour`
  ADD CONSTRAINT `activity_session_hour_fkey` FOREIGN KEY (`id_activity_session`) REFERENCES `pm_activity_session` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_article`
--
ALTER TABLE `pm_article`
  ADD CONSTRAINT `article_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `article_page_fkey` FOREIGN KEY (`id_page`,`lang`) REFERENCES `pm_page` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_article_file`
--
ALTER TABLE `pm_article_file`
  ADD CONSTRAINT `article_file_fkey` FOREIGN KEY (`id_item`,`lang`) REFERENCES `pm_article` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `article_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_booking_activity`
--
ALTER TABLE `pm_booking_activity`
  ADD CONSTRAINT `booking_activity_fkey` FOREIGN KEY (`id_booking`) REFERENCES `pm_booking` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_booking_payment`
--
ALTER TABLE `pm_booking_payment`
  ADD CONSTRAINT `booking_payment_fkey` FOREIGN KEY (`id_booking`) REFERENCES `pm_booking` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_booking_room`
--
ALTER TABLE `pm_booking_room`
  ADD CONSTRAINT `booking_room_fkey` FOREIGN KEY (`id_booking`) REFERENCES `pm_booking` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_booking_service`
--
ALTER TABLE `pm_booking_service`
  ADD CONSTRAINT `booking_service_fkey` FOREIGN KEY (`id_booking`) REFERENCES `pm_booking` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_booking_tax`
--
ALTER TABLE `pm_booking_tax`
  ADD CONSTRAINT `booking_tax_fkey` FOREIGN KEY (`id_booking`) REFERENCES `pm_booking` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_email_content`
--
ALTER TABLE `pm_email_content`
  ADD CONSTRAINT `email_content_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_facility`
--
ALTER TABLE `pm_facility`
  ADD CONSTRAINT `facility_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_facility_file`
--
ALTER TABLE `pm_facility_file`
  ADD CONSTRAINT `facility_file_fkey` FOREIGN KEY (`id_item`,`lang`) REFERENCES `pm_facility` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `facility_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_ical_event`
--
ALTER TABLE `pm_ical_event`
  ADD CONSTRAINT `ical_event_fkey` FOREIGN KEY (`id_room`) REFERENCES `pm_room` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_lang_file`
--
ALTER TABLE `pm_lang_file`
  ADD CONSTRAINT `lang_file_fkey` FOREIGN KEY (`id_item`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_media_file`
--
ALTER TABLE `pm_media_file`
  ADD CONSTRAINT `media_file_fkey` FOREIGN KEY (`id_item`) REFERENCES `pm_media` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_menu`
--
ALTER TABLE `pm_menu`
  ADD CONSTRAINT `menu_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_page`
--
ALTER TABLE `pm_page`
  ADD CONSTRAINT `page_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_page_file`
--
ALTER TABLE `pm_page_file`
  ADD CONSTRAINT `page_file_fkey` FOREIGN KEY (`id_item`,`lang`) REFERENCES `pm_page` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `page_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_popup`
--
ALTER TABLE `pm_popup`
  ADD CONSTRAINT `popup_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_rate`
--
ALTER TABLE `pm_rate`
  ADD CONSTRAINT `rate_room_fkey` FOREIGN KEY (`id_room`) REFERENCES `pm_room` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_rate_child`
--
ALTER TABLE `pm_rate_child`
  ADD CONSTRAINT `rate_child_fkey` FOREIGN KEY (`id_rate`) REFERENCES `pm_rate` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_room`
--
ALTER TABLE `pm_room`
  ADD CONSTRAINT `room_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_room_calendar`
--
ALTER TABLE `pm_room_calendar`
  ADD CONSTRAINT `room_calendar_fkey` FOREIGN KEY (`id_room`) REFERENCES `pm_room` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_room_closing`
--
ALTER TABLE `pm_room_closing`
  ADD CONSTRAINT `room_closing_fkey` FOREIGN KEY (`id_room`) REFERENCES `pm_room` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_room_file`
--
ALTER TABLE `pm_room_file`
  ADD CONSTRAINT `room_file_fkey` FOREIGN KEY (`id_item`,`lang`) REFERENCES `pm_room` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `room_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_room_lock`
--
ALTER TABLE `pm_room_lock`
  ADD CONSTRAINT `room_lock_fkey` FOREIGN KEY (`id_room`) REFERENCES `pm_room` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_service`
--
ALTER TABLE `pm_service`
  ADD CONSTRAINT `service_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_slide`
--
ALTER TABLE `pm_slide`
  ADD CONSTRAINT `slide_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `slide_page_fkey` FOREIGN KEY (`id_page`,`lang`) REFERENCES `pm_page` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_slide_file`
--
ALTER TABLE `pm_slide_file`
  ADD CONSTRAINT `slide_file_fkey` FOREIGN KEY (`id_item`,`lang`) REFERENCES `pm_slide` (`id`, `lang`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `slide_file_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_tag`
--
ALTER TABLE `pm_tag`
  ADD CONSTRAINT `tag_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_tax`
--
ALTER TABLE `pm_tax`
  ADD CONSTRAINT `tax_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_text`
--
ALTER TABLE `pm_text`
  ADD CONSTRAINT `text_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pm_widget`
--
ALTER TABLE `pm_widget`
  ADD CONSTRAINT `widget_lang_fkey` FOREIGN KEY (`lang`) REFERENCES `pm_lang` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
