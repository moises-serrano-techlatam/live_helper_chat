-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2017 at 01:03 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lhc_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `lh_abstract_auto_responder`
--

CREATE TABLE `lh_abstract_auto_responder` (
  `id` int(11) NOT NULL,
  `siteaccess` varchar(3) NOT NULL,
  `wait_message` text NOT NULL,
  `wait_timeout` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `timeout_message` text NOT NULL,
  `dep_id` int(11) NOT NULL,
  `repeat_number` int(11) NOT NULL DEFAULT '1',
  `wait_timeout_2` int(11) NOT NULL,
  `timeout_message_2` text NOT NULL,
  `wait_timeout_3` int(11) NOT NULL,
  `timeout_message_3` text NOT NULL,
  `wait_timeout_4` int(11) NOT NULL,
  `timeout_message_4` text NOT NULL,
  `wait_timeout_5` int(11) NOT NULL,
  `timeout_message_5` text NOT NULL,
  `wait_timeout_reply_1` int(11) NOT NULL,
  `timeout_reply_message_1` text NOT NULL,
  `wait_timeout_reply_2` int(11) NOT NULL,
  `timeout_reply_message_2` text NOT NULL,
  `wait_timeout_reply_3` int(11) NOT NULL,
  `timeout_reply_message_3` text NOT NULL,
  `wait_timeout_reply_4` int(11) NOT NULL,
  `timeout_reply_message_4` text NOT NULL,
  `wait_timeout_reply_5` int(11) NOT NULL,
  `timeout_reply_message_5` text NOT NULL,
  `ignore_pa_chat` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_abstract_auto_responder_chat`
--

CREATE TABLE `lh_abstract_auto_responder_chat` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `auto_responder_id` int(11) NOT NULL,
  `wait_timeout_send` int(11) NOT NULL,
  `pending_send_status` int(11) NOT NULL,
  `active_send_status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_abstract_browse_offer_invitation`
--

CREATE TABLE `lh_abstract_browse_offer_invitation` (
  `id` int(11) NOT NULL,
  `siteaccess` varchar(10) NOT NULL,
  `time_on_site` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `callback_content` longtext NOT NULL,
  `lhc_iframe_content` tinyint(4) NOT NULL,
  `custom_iframe_url` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `executed_times` int(11) NOT NULL,
  `url` varchar(250) NOT NULL,
  `active` int(11) NOT NULL,
  `has_url` int(11) NOT NULL,
  `is_wildcard` int(11) NOT NULL,
  `referrer` varchar(250) NOT NULL,
  `priority` varchar(250) NOT NULL,
  `hash` varchar(40) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `unit` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_abstract_email_template`
--

CREATE TABLE `lh_abstract_email_template` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `from_name` varchar(150) NOT NULL,
  `from_name_ac` tinyint(4) NOT NULL,
  `from_email` varchar(150) NOT NULL,
  `from_email_ac` tinyint(4) NOT NULL,
  `user_mail_as_sender` tinyint(4) NOT NULL,
  `content` text NOT NULL,
  `subject` varchar(250) NOT NULL,
  `bcc_recipients` varchar(200) NOT NULL,
  `subject_ac` tinyint(4) NOT NULL,
  `reply_to` varchar(150) NOT NULL,
  `reply_to_ac` tinyint(4) NOT NULL,
  `recipient` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lh_abstract_email_template`
--

INSERT INTO `lh_abstract_email_template` (`id`, `name`, `from_name`, `from_name_ac`, `from_email`, `from_email_ac`, `user_mail_as_sender`, `content`, `subject`, `bcc_recipients`, `subject_ac`, `reply_to`, `reply_to_ac`, `recipient`) VALUES
(1, 'Send mail to user', 'Live Helper Chat', 0, '', 0, 0, 'Dear {user_chat_nick},\r\n\r\n{additional_message}\r\n\r\nLive Support response:\r\n{messages_content}\r\n\r\nSincerely,\r\nLive Support Team\r\n', '{name_surname} has responded to your request', '', 1, '', 1, ''),
(2, 'Support request from user', '', 0, '', 0, 0, 'Hello,\r\n\r\nUser request data:\r\nName: {name}\r\nEmail: {email}\r\nPhone: {phone}\r\nDepartment: {department}\r\nCountry: {country}\r\nCity: {city}\r\nIP: {ip}\r\n\r\nMessage:\r\n{message}\r\n\r\nAdditional data, if any:\r\n{additional_data}\r\n\r\nURL of page from which user has send request:\r\n{url_request}\r\n\r\nLink to chat if any:\r\n{prefillchat}\r\n\r\nSincerely,\r\nLive Support Team', '{name}, {country}, {department}, Support request from user', '', 0, '', 0, 'paresh@vlogicinfo.com'),
(3, 'User mail for himself', 'Live Helper Chat', 0, '', 0, 0, 'Dear {user_chat_nick},\r\n\r\nTranscript:\r\n{messages_content}\r\nChat ID: {chat_id}\n\r\nSincerely,\r\nLive Support Team\r\n', 'Chat transcript', '', 0, '', 0, ''),
(4, 'New chat request', 'Live Helper Chat', 0, '', 0, 0, 'Hello,\r\n\r\nUser request data:\r\nName: {name}\r\nEmail: {email}\r\nPhone: {phone}\r\nDepartment: {department}\r\nCountry: {country}\r\nCity: {city}\r\nIP: {ip}\r\nCreated:	{created}\r\nUser left:	{user_left}\r\nWaited:	{waited}\r\nChat duration:	{chat_duration}\r\n\r\nMessage:\r\n{message}\r\n\r\nURL of page from which user has send request:\r\n{url_request}\r\n\r\nClick to accept chat automatically\r\n{url_accept}\r\n\r\nSurvey\r\n{survey}\r\n\r\nSincerely,\r\nLive Support Team', 'New chat request', '', 0, '', 0, 'paresh@vlogicinfo.com'),
(5, 'Chat was closed', 'Live Helper Chat', 0, '', 0, 0, 'Hello,\r\n\r\n{operator} has closed a chat\r\nName: {name}\r\nEmail: {email}\r\nPhone: {phone}\r\nDepartment: {department}\r\nCountry: {country}\r\nCity: {city}\r\nIP: {ip}\r\nCreated:	{created}\r\nUser left:	{user_left}\r\nWaited:	{waited}\r\nChat duration:	{chat_duration}\r\n\r\nMessage:\r\n{message}\r\n\r\nAdditional data, if any:\r\n{additional_data}\r\n\r\nURL of page from which user has send request:\r\n{url_request}\r\n\r\nSurvey:\r\n{survey}\r\n\r\nSincerely,\r\nLive Support Team', 'Chat was closed', '', 0, '', 0, 'paresh@vlogicinfo.com'),
(6, 'New FAQ question', 'Live Helper Chat', 0, '', 0, 0, 'Hello,\r\n\r\nNew FAQ question\r\nEmail: {email}\r\n\r\nQuestion:\r\n{question}\r\n\r\nQuestion URL:\r\n{url_question}\r\n\r\nURL to answer a question:\r\n{url_request}\r\n\r\nSincerely,\r\nLive Support Team', 'New FAQ question', '', 0, '', 0, 'paresh@vlogicinfo.com'),
(7, 'New unread message', 'Live Helper Chat', 0, '', 0, 0, 'Hello,\r\n\r\nUser request data:\r\nName: {name}\r\nEmail: {email}\r\nPhone: {phone}\r\nDepartment: {department}\r\nCountry: {country}\r\nCity: {city}\r\nIP: {ip}\r\nCreated:	{created}\r\nUser left:	{user_left}\r\nWaited:	{waited}\r\nChat duration:	{chat_duration}\r\n\r\nMessage:\r\n{message}\r\n\r\nURL of page from which user has send request:\r\n{url_request}\r\n\r\nClick to accept chat automatically\r\n{url_accept}\r\n\r\nSurvey:\r\n{survey}\r\n\r\nSincerely,\r\nLive Support Team', 'New unread message', '', 0, '', 0, 'paresh@vlogicinfo.com'),
(8, 'Filled form', 'MCFC', 0, '', 0, 0, 'Hello,\r\n\r\nUser has filled a form\r\nForm name - {form_name}\r\nUser IP - {ip}\r\nDownload filled data - {url_download}\r\nView filled data - {url_view}\r\n\r\n{content}\r\n\r\nSincerely,\r\nLive Support Team', 'Filled form - {form_name}', '', 0, '', 0, 'paresh@vlogicinfo.com'),
(9, 'Chat was accepted', 'Live Helper Chat', 0, '', 0, 0, 'Hello,\r\n\r\nOperator {user_name} has accepted a chat [{chat_id}]\r\n\r\nUser request data:\r\nName: {name}\r\nEmail: {email}\r\nPhone: {phone}\r\nDepartment: {department}\r\nCountry: {country}\r\nCity: {city}\r\nIP: {ip}\r\nCreated:	{created}\r\nUser left:	{user_left}\r\nWaited:	{waited}\r\nChat duration:	{chat_duration}\r\n\r\nMessage:\r\n{message}\r\n\r\nURL of page from which user has send request:\r\n{url_request}\r\n\r\nClick to accept chat automatically\r\n{url_accept}\r\n\r\nSurvey:\r\n{survey}\r\n\r\nSincerely,\r\nLive Support Team', 'Chat was accepted [{chat_id}]', '', 0, '', 0, 'paresh@vlogicinfo.com'),
(10, 'Permission request', 'Live Helper Chat', 0, '', 0, 0, 'Hello,\r\n\r\nOperator {user} has requested these permissions\n\r\n{permissions}\r\n\r\nSincerely,\r\nLive Support Team', 'Permission request from {user}', '', 0, '', 0, ''),
(11, 'You have unread messages', 'Live Helper Chat', 0, '', 0, 0, 'Hello,\r\n\r\nOperator {operator} has answered to you\r\n\r\n{messages}\r\n\r\nSincerely,\r\nLive Support Team', 'Operator has answered to your request', '', 0, '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `lh_abstract_form`
--

CREATE TABLE `lh_abstract_form` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `recipient` varchar(250) NOT NULL,
  `active` int(11) NOT NULL,
  `name_attr` varchar(250) NOT NULL,
  `intro_attr` varchar(250) NOT NULL,
  `xls_columns` text NOT NULL,
  `pagelayout` varchar(200) NOT NULL,
  `post_content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_abstract_form_collected`
--

CREATE TABLE `lh_abstract_form_collected` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `ip` varchar(250) NOT NULL,
  `identifier` varchar(250) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_abstract_proactive_chat_event`
--

CREATE TABLE `lh_abstract_proactive_chat_event` (
  `id` int(11) NOT NULL,
  `vid_id` int(11) NOT NULL,
  `ev_id` int(11) NOT NULL,
  `ts` int(11) NOT NULL,
  `val` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_abstract_proactive_chat_invitation`
--

CREATE TABLE `lh_abstract_proactive_chat_invitation` (
  `id` int(11) NOT NULL,
  `siteaccess` varchar(10) NOT NULL,
  `time_on_site` int(11) NOT NULL,
  `pageviews` int(11) NOT NULL,
  `message` text NOT NULL,
  `message_returning` text NOT NULL,
  `executed_times` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `hide_after_ntimes` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `operator_ids` varchar(100) NOT NULL,
  `wait_message` text NOT NULL,
  `timeout_message` text NOT NULL,
  `message_returning_nick` varchar(250) NOT NULL,
  `referrer` varchar(250) NOT NULL,
  `wait_timeout` int(11) NOT NULL,
  `show_random_operator` int(11) NOT NULL,
  `operator_name` varchar(100) NOT NULL,
  `position` int(11) NOT NULL,
  `event_invitation` int(11) NOT NULL,
  `dynamic_invitation` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `requires_email` int(11) NOT NULL,
  `iddle_for` int(11) NOT NULL,
  `event_type` int(11) NOT NULL,
  `requires_username` int(11) NOT NULL,
  `requires_phone` int(11) NOT NULL,
  `repeat_number` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_abstract_proactive_chat_invitation_event`
--

CREATE TABLE `lh_abstract_proactive_chat_invitation_event` (
  `id` int(11) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `min_number` int(11) NOT NULL,
  `during_seconds` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_abstract_proactive_chat_variables`
--

CREATE TABLE `lh_abstract_proactive_chat_variables` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `store_timeout` int(11) NOT NULL,
  `filter_val` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_abstract_product`
--

CREATE TABLE `lh_abstract_product` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `disabled` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `departament_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_abstract_product_departament`
--

CREATE TABLE `lh_abstract_product_departament` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `departament_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_abstract_rest_api_key`
--

CREATE TABLE `lh_abstract_rest_api_key` (
  `id` int(11) NOT NULL,
  `api_key` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_abstract_survey`
--

CREATE TABLE `lh_abstract_survey` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `feedback_text` text NOT NULL,
  `max_stars_1_title` varchar(250) NOT NULL,
  `max_stars_1_pos` int(11) NOT NULL,
  `max_stars_2_title` varchar(250) NOT NULL,
  `max_stars_2_pos` int(11) NOT NULL,
  `max_stars_2` int(11) NOT NULL,
  `max_stars_3_title` varchar(250) NOT NULL,
  `max_stars_3_pos` int(11) NOT NULL,
  `max_stars_3` int(11) NOT NULL,
  `max_stars_4_title` varchar(250) NOT NULL,
  `max_stars_4_pos` int(11) NOT NULL,
  `max_stars_4` int(11) NOT NULL,
  `max_stars_5_title` varchar(250) NOT NULL,
  `max_stars_5_pos` int(11) NOT NULL,
  `max_stars_5` int(11) NOT NULL,
  `question_options_1` varchar(250) NOT NULL,
  `question_options_1_items` text NOT NULL,
  `question_options_1_pos` int(11) NOT NULL,
  `question_options_2` varchar(250) NOT NULL,
  `question_options_2_items` text NOT NULL,
  `question_options_2_pos` int(11) NOT NULL,
  `question_options_3` varchar(250) NOT NULL,
  `question_options_3_items` text NOT NULL,
  `question_options_3_pos` int(11) NOT NULL,
  `question_options_4` varchar(250) NOT NULL,
  `question_options_4_items` text NOT NULL,
  `question_options_4_pos` int(11) NOT NULL,
  `question_options_5` varchar(250) NOT NULL,
  `question_options_5_items` text NOT NULL,
  `question_options_5_pos` int(11) NOT NULL,
  `question_plain_1` text NOT NULL,
  `question_plain_1_pos` int(11) NOT NULL,
  `question_plain_2` text NOT NULL,
  `question_plain_2_pos` int(11) NOT NULL,
  `question_plain_3` text NOT NULL,
  `question_plain_3_pos` int(11) NOT NULL,
  `question_plain_4` text NOT NULL,
  `question_plain_4_pos` int(11) NOT NULL,
  `question_plain_5` text NOT NULL,
  `question_plain_5_pos` int(11) NOT NULL,
  `max_stars_1_enabled` int(11) NOT NULL,
  `max_stars_2_enabled` int(11) NOT NULL,
  `max_stars_3_enabled` int(11) NOT NULL,
  `max_stars_4_enabled` int(11) NOT NULL,
  `max_stars_5_enabled` int(11) NOT NULL,
  `question_options_1_enabled` int(11) NOT NULL,
  `question_options_2_enabled` int(11) NOT NULL,
  `question_options_3_enabled` int(11) NOT NULL,
  `question_options_4_enabled` int(11) NOT NULL,
  `question_options_5_enabled` int(11) NOT NULL,
  `question_plain_1_enabled` int(11) NOT NULL,
  `question_plain_2_enabled` int(11) NOT NULL,
  `question_plain_3_enabled` int(11) NOT NULL,
  `question_plain_4_enabled` int(11) NOT NULL,
  `question_plain_5_enabled` int(11) NOT NULL,
  `max_stars_1` int(11) NOT NULL,
  `max_stars_1_req` int(11) NOT NULL,
  `max_stars_2_req` int(11) NOT NULL,
  `max_stars_3_req` int(11) NOT NULL,
  `max_stars_4_req` int(11) NOT NULL,
  `max_stars_5_req` int(11) NOT NULL,
  `question_options_1_req` int(11) NOT NULL,
  `question_options_2_req` int(11) NOT NULL,
  `question_options_3_req` int(11) NOT NULL,
  `question_options_4_req` int(11) NOT NULL,
  `question_options_5_req` int(11) NOT NULL,
  `question_plain_1_req` int(11) NOT NULL,
  `question_plain_2_req` int(11) NOT NULL,
  `question_plain_3_req` int(11) NOT NULL,
  `question_plain_4_req` int(11) NOT NULL,
  `question_plain_5_req` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_abstract_survey_item`
--

CREATE TABLE `lh_abstract_survey_item` (
  `id` bigint(20) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ftime` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `max_stars_1` int(11) NOT NULL,
  `max_stars_2` int(11) NOT NULL,
  `max_stars_3` int(11) NOT NULL,
  `max_stars_4` int(11) NOT NULL,
  `max_stars_5` int(11) NOT NULL,
  `question_options_1` int(11) NOT NULL,
  `question_options_2` int(11) NOT NULL,
  `question_options_3` int(11) NOT NULL,
  `question_options_4` int(11) NOT NULL,
  `question_options_5` int(11) NOT NULL,
  `question_plain_1` text NOT NULL,
  `question_plain_2` text NOT NULL,
  `question_plain_3` text NOT NULL,
  `question_plain_4` text NOT NULL,
  `question_plain_5` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_abstract_widget_theme`
--

CREATE TABLE `lh_abstract_widget_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `name_company` varchar(250) NOT NULL,
  `onl_bcolor` varchar(10) NOT NULL,
  `bor_bcolor` varchar(10) NOT NULL DEFAULT 'e3e3e3',
  `text_color` varchar(10) NOT NULL,
  `online_image` varchar(250) NOT NULL,
  `online_image_path` varchar(250) NOT NULL,
  `offline_image` varchar(250) NOT NULL,
  `offline_image_path` varchar(250) NOT NULL,
  `logo_image` varchar(250) NOT NULL,
  `logo_image_path` varchar(250) NOT NULL,
  `need_help_image` varchar(250) NOT NULL,
  `header_background` varchar(10) NOT NULL,
  `need_help_tcolor` varchar(10) NOT NULL,
  `need_help_bcolor` varchar(10) NOT NULL,
  `need_help_border` varchar(10) NOT NULL,
  `need_help_close_bg` varchar(10) NOT NULL,
  `need_help_hover_bg` varchar(10) NOT NULL,
  `need_help_close_hover_bg` varchar(10) NOT NULL,
  `need_help_image_path` varchar(250) NOT NULL,
  `custom_status_css` text NOT NULL,
  `custom_container_css` text NOT NULL,
  `custom_widget_css` text NOT NULL,
  `need_help_header` varchar(250) NOT NULL,
  `need_help_text` varchar(250) NOT NULL,
  `online_text` varchar(250) NOT NULL,
  `offline_text` varchar(250) NOT NULL,
  `widget_border_color` varchar(10) NOT NULL,
  `copyright_image` varchar(250) NOT NULL,
  `copyright_image_path` varchar(250) NOT NULL,
  `widget_copyright_url` varchar(250) NOT NULL,
  `show_copyright` int(11) NOT NULL DEFAULT '1',
  `explain_text` text NOT NULL,
  `intro_operator_text` varchar(250) NOT NULL,
  `operator_image` varchar(250) NOT NULL,
  `operator_image_path` varchar(250) NOT NULL,
  `minimize_image` varchar(250) NOT NULL,
  `minimize_image_path` varchar(250) NOT NULL,
  `restore_image` varchar(250) NOT NULL,
  `restore_image_path` varchar(250) NOT NULL,
  `close_image` varchar(250) NOT NULL,
  `close_image_path` varchar(250) NOT NULL,
  `popup_image` varchar(250) NOT NULL,
  `popup_image_path` varchar(250) NOT NULL,
  `support_joined` varchar(250) NOT NULL,
  `support_closed` varchar(250) NOT NULL,
  `pending_join` varchar(250) NOT NULL,
  `noonline_operators` varchar(250) NOT NULL,
  `noonline_operators_offline` varchar(250) NOT NULL,
  `hide_close` int(11) NOT NULL,
  `hide_popup` int(11) NOT NULL,
  `show_need_help` int(11) NOT NULL DEFAULT '1',
  `show_need_help_timeout` int(11) NOT NULL DEFAULT '24',
  `header_height` int(11) NOT NULL,
  `header_padding` int(11) NOT NULL,
  `widget_border_width` int(11) NOT NULL,
  `show_voting` tinyint(1) NOT NULL DEFAULT '1',
  `department_title` varchar(250) NOT NULL,
  `department_select` varchar(250) NOT NULL,
  `buble_visitor_background` varchar(250) NOT NULL,
  `buble_visitor_title_color` varchar(250) NOT NULL,
  `buble_visitor_text_color` varchar(250) NOT NULL,
  `buble_operator_background` varchar(250) NOT NULL,
  `buble_operator_title_color` varchar(250) NOT NULL,
  `buble_operator_text_color` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_admin_theme`
--

CREATE TABLE `lh_admin_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `static_content` longtext NOT NULL,
  `static_js_content` longtext NOT NULL,
  `static_css_content` longtext NOT NULL,
  `header_content` text NOT NULL,
  `header_css` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_canned_msg`
--

CREATE TABLE `lh_canned_msg` (
  `id` int(11) NOT NULL,
  `msg` longtext NOT NULL,
  `fallback_msg` text NOT NULL,
  `title` varchar(250) NOT NULL,
  `explain` varchar(250) NOT NULL,
  `position` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `delay` int(11) NOT NULL,
  `auto_send` tinyint(1) NOT NULL,
  `attr_int_1` int(11) NOT NULL,
  `attr_int_2` int(11) NOT NULL,
  `attr_int_3` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_canned_msg_tag`
--

CREATE TABLE `lh_canned_msg_tag` (
  `id` int(11) NOT NULL,
  `tag` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_canned_msg_tag_link`
--

CREATE TABLE `lh_canned_msg_tag_link` (
  `id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `canned_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_chat`
--

CREATE TABLE `lh_chat` (
  `id` int(11) NOT NULL,
  `nick` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `status_sub` int(11) NOT NULL DEFAULT '0',
  `status_sub_sub` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hash` varchar(40) NOT NULL,
  `referrer` text NOT NULL,
  `session_referrer` text NOT NULL,
  `chat_variables` text NOT NULL,
  `remarks` text NOT NULL,
  `ip` varchar(100) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `sender_user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_status` int(11) NOT NULL DEFAULT '0',
  `user_closed_ts` int(11) NOT NULL DEFAULT '0',
  `support_informed` int(11) NOT NULL DEFAULT '0',
  `unread_messages_informed` int(11) NOT NULL DEFAULT '0',
  `reinform_timeout` int(11) NOT NULL DEFAULT '0',
  `last_op_msg_time` int(11) NOT NULL DEFAULT '0',
  `has_unread_op_messages` int(11) NOT NULL DEFAULT '0',
  `unread_op_messages_informed` int(11) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL,
  `country_code` varchar(100) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `unanswered_chat` int(11) NOT NULL,
  `user_typing` int(11) NOT NULL,
  `user_typing_txt` varchar(50) NOT NULL,
  `operator_typing` int(11) NOT NULL,
  `operator_typing_id` int(11) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `has_unread_messages` int(11) NOT NULL,
  `last_user_msg_time` int(11) NOT NULL,
  `fbst` tinyint(1) NOT NULL,
  `online_user_id` int(11) NOT NULL,
  `auto_responder_id` int(11) NOT NULL,
  `last_msg_id` int(11) NOT NULL,
  `additional_data` text NOT NULL,
  `user_tz_identifier` varchar(50) NOT NULL,
  `lat` varchar(10) NOT NULL,
  `lon` varchar(10) NOT NULL,
  `city` varchar(100) NOT NULL,
  `operation` text NOT NULL,
  `operation_admin` varchar(200) NOT NULL,
  `status_sub_arg` varchar(200) NOT NULL,
  `uagent` varchar(250) NOT NULL,
  `chat_locale` varchar(10) NOT NULL,
  `chat_locale_to` varchar(10) NOT NULL,
  `mail_send` int(11) NOT NULL,
  `screenshot_id` int(11) NOT NULL,
  `wait_time` int(11) NOT NULL,
  `chat_duration` int(11) NOT NULL,
  `tslasign` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `chat_initiator` int(11) NOT NULL,
  `transfer_timeout_ts` int(11) NOT NULL,
  `transfer_timeout_ac` int(11) NOT NULL,
  `transfer_if_na` int(11) NOT NULL,
  `na_cb_executed` int(11) NOT NULL,
  `device_type` int(11) NOT NULL,
  `nc_cb_executed` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_chatbox`
--

CREATE TABLE `lh_chatbox` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_chat_accept`
--

CREATE TABLE `lh_chat_accept` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `hash` varchar(50) NOT NULL,
  `ctime` int(11) NOT NULL,
  `wused` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_chat_archive_range`
--

CREATE TABLE `lh_chat_archive_range` (
  `id` int(11) NOT NULL,
  `range_from` int(11) NOT NULL,
  `range_to` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_chat_blocked_user`
--

CREATE TABLE `lh_chat_blocked_user` (
  `id` int(11) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `datets` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_chat_config`
--

CREATE TABLE `lh_chat_config` (
  `identifier` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `explain` varchar(250) NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lh_chat_config`
--

INSERT INTO `lh_chat_config` (`identifier`, `value`, `type`, `explain`, `hidden`) VALUES
('tracked_users_cleanup', '160', 0, 'How many days keep records of online users.', 0),
('list_online_operators', '0', 0, 'List online operators.', 0),
('voting_days_limit', '7', 0, 'How many days voting widget should not be expanded after last show', 0),
('track_online_visitors', '1', 0, 'Enable online site visitors tracking', 0),
('pro_active_invite', '1', 0, 'Is pro active chat invitation active. Online users tracking also has to be enabled', 0),
('customer_company_name', 'Live Helper Chat', 0, 'Your company name - visible in bottom left corner', 0),
('customer_site_url', 'http://livehelperchat.com', 0, 'Your site URL address', 0),
('smtp_data', 'a:5:{s:4:\"host\";s:0:\"\";s:4:\"port\";s:2:\"25\";s:8:\"use_smtp\";i:0;s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";}', 0, 'SMTP configuration', 1),
('chatbox_data', 'a:6:{i:0;b:0;s:20:\"chatbox_auto_enabled\";i:0;s:19:\"chatbox_secret_hash\";s:9:\"360bc400b\";s:20:\"chatbox_default_name\";s:7:\"Chatbox\";s:17:\"chatbox_msg_limit\";i:50;s:22:\"chatbox_default_opname\";s:7:\"Manager\";}', 0, 'Chatbox configuration', 1),
('start_chat_data', 'a:49:{i:0;b:0;s:21:\"name_visible_in_popup\";b:1;s:27:\"name_visible_in_page_widget\";b:1;s:19:\"name_require_option\";s:8:\"required\";s:22:\"email_visible_in_popup\";b:1;s:28:\"email_visible_in_page_widget\";b:1;s:20:\"email_require_option\";s:8:\"required\";s:24:\"message_visible_in_popup\";b:1;s:30:\"message_visible_in_page_widget\";b:1;s:22:\"message_require_option\";s:8:\"required\";s:22:\"phone_visible_in_popup\";b:0;s:28:\"phone_visible_in_page_widget\";b:0;s:20:\"phone_require_option\";s:8:\"required\";s:21:\"force_leave_a_message\";b:0;s:29:\"offline_name_visible_in_popup\";b:1;s:35:\"offline_name_visible_in_page_widget\";b:1;s:27:\"offline_name_require_option\";s:8:\"required\";s:30:\"offline_phone_visible_in_popup\";b:0;s:36:\"offline_phone_visible_in_page_widget\";b:0;s:28:\"offline_phone_require_option\";s:8:\"required\";s:32:\"offline_message_visible_in_popup\";b:1;s:38:\"offline_message_visible_in_page_widget\";b:1;s:30:\"offline_message_require_option\";s:8:\"required\";s:20:\"tos_visible_in_popup\";b:0;s:17:\"show_messages_box\";b:0;s:26:\"tos_visible_in_page_widget\";b:0;s:19:\"tos_checked_offline\";b:0;s:18:\"tos_checked_online\";b:0;s:28:\"offline_tos_visible_in_popup\";b:0;s:34:\"offline_tos_visible_in_page_widget\";b:0;s:35:\"offline_file_visible_in_page_widget\";b:0;s:29:\"offline_file_visible_in_popup\";b:0;s:11:\"name_hidden\";b:0;s:24:\"custom_fields_encryption\";s:0:\"\";s:29:\"custom_fields_encryption_hmac\";s:0:\"\";s:19:\"offline_name_hidden\";b:0;s:12:\"email_hidden\";b:0;s:20:\"offline_email_hidden\";b:0;s:15:\"user_msg_height\";s:0:\"\";s:12:\"phone_hidden\";b:0;s:20:\"offline_phone_hidden\";b:0;s:14:\"message_hidden\";b:0;s:18:\"message_auto_start\";b:0;s:28:\"message_auto_start_key_press\";b:0;s:22:\"offline_message_hidden\";b:0;s:21:\"show_operator_profile\";b:0;s:21:\"remove_operator_space\";b:0;s:18:\"hide_message_label\";b:0;s:13:\"custom_fields\";s:0:\"\";}', 0, '', 1),
('application_name', 'a:6:{s:3:\"eng\";s:31:\"Live Helper Chat - live support\";s:3:\"lit\";s:26:\"Live Helper Chat - pagalba\";s:3:\"hrv\";s:0:\"\";s:3:\"esp\";s:0:\"\";s:3:\"por\";s:0:\"\";s:10:\"site_admin\";s:31:\"Live Helper Chat - live support\";}', 1, 'Support application name, visible in browser title.', 0),
('track_footprint', '0', 0, 'Track users footprint. For this also online visitors tracking should be enabled', 0),
('pro_active_limitation', '-1', 0, 'Pro active chats invitations limitation based on pending chats, (-1) do not limit, (0,1,n+1) number of pending chats can be for invitation to be shown.', 0),
('pro_active_show_if_offline', '0', 0, 'Should invitation logic be executed if there is no online operators', 0),
('export_hash', '66116b8ea', 0, 'Chats export secret hash', 0),
('message_seen_timeout', '24', 0, 'Proactive message timeout in hours. After how many hours proactive chat mesasge should be shown again.', 0),
('reopen_chat_enabled', '1', 0, 'Reopen chat functionality enabled', 0),
('ignorable_ip', '', 0, 'Which ip should be ignored in online users list, separate by comma', 0),
('run_departments_workflow', '0', 0, 'Should cronjob run departments transfer workflow, even if user leaves a chat', 0),
('geo_location_data', 'a:3:{s:4:\"zoom\";i:4;s:3:\"lat\";s:7:\"49.8211\";s:3:\"lng\";s:7:\"11.7835\";}', 0, '', 1),
('xmp_data', 'a:14:{i:0;b:0;s:4:\"host\";s:15:\"talk.google.com\";s:6:\"server\";s:9:\"gmail.com\";s:8:\"resource\";s:6:\"xmpphp\";s:4:\"port\";s:4:\"5222\";s:7:\"use_xmp\";i:0;s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:11:\"xmp_message\";s:98:\"New chat request [{chat_id}] from [{department}]\r\n{messages}\r\nClick to accept a chat\r\n{url_accept}\";s:10:\"recipients\";s:0:\"\";s:20:\"xmp_accepted_message\";s:89:\"{user_name} has accepted a chat [{chat_id}] from [{department}]\r\n{messages}\r\n{url_accept}\";s:16:\"use_standard_xmp\";i:0;s:15:\"test_recipients\";s:0:\"\";s:21:\"test_group_recipients\";s:0:\"\";}', 0, 'XMP data', 1),
('run_unaswered_chat_workflow', '0', 0, 'Should cronjob run unanswered chats workflow and execute unaswered chats callback, 0 - no, any other number bigger than 0 is a minits how long chat have to be not accepted before executing callback.', 0),
('disable_popup_restore', '0', 0, 'Disable option in widget to open new window. Restore icon will be hidden', 0),
('accept_tos_link', '#', 0, 'Change to your site Terms of Service', 0),
('hide_button_dropdown', '0', 0, 'Hide close button in dropdown', 0),
('on_close_exit_chat', '0', 0, 'On chat close exit chat', 0),
('activity_timeout', '5', 0, 'How long operator should go offline automatically because of inactivity. Value in minutes', 0),
('product_enabled_module', '0', 0, 'Product module is enabled', 1),
('product_show_departament', '0', 0, 'Enable products show by departments', 1),
('paidchat_data', '', 0, 'Paid chat configuration', 1),
('disable_iframe_sharing', '1', 0, 'Disable iframes in sharing mode', 0),
('file_configuration', 'a:7:{i:0;b:0;s:5:\"ft_op\";s:43:\"gif|jpe?g|png|zip|rar|xls|doc|docx|xlsx|pdf\";s:5:\"ft_us\";s:26:\"gif|jpe?g|png|doc|docx|pdf\";s:6:\"fs_max\";i:2048;s:18:\"active_user_upload\";b:0;s:16:\"active_op_upload\";b:1;s:19:\"active_admin_upload\";b:1;}', 0, 'Files configuration item', 1),
('accept_chat_link_timeout', '300', 0, 'How many seconds chat accept link is valid. Set 0 to force login all the time manually.', 0),
('session_captcha', '0', 0, 'Use session captcha. LHC have to be installed on the same domain or subdomain.', 0),
('sync_sound_settings', 'a:16:{i:0;b:0;s:12:\"repeat_sound\";i:1;s:18:\"repeat_sound_delay\";i:5;s:10:\"show_alert\";b:0;s:22:\"new_chat_sound_enabled\";b:1;s:31:\"new_message_sound_admin_enabled\";b:1;s:30:\"new_message_sound_user_enabled\";b:1;s:14:\"online_timeout\";d:300;s:22:\"check_for_operator_msg\";d:10;s:21:\"back_office_sinterval\";d:10;s:22:\"chat_message_sinterval\";d:3.5;s:20:\"long_polling_enabled\";b:0;s:30:\"polling_chat_message_sinterval\";d:1.5;s:29:\"polling_back_office_sinterval\";d:5;s:18:\"connection_timeout\";i:30;s:28:\"browser_notification_message\";b:0;}', 0, '', 1),
('sound_invitation', '1', 0, 'Play sound on invitation to chat.', 0),
('explicit_http_mode', '', 0, 'Please enter explicit http mode. Either http: or https:, do not forget : at the end.', 0),
('track_domain', '', 0, 'Set your domain to enable user tracking across different domain subdomains.', 0),
('max_message_length', '500', 0, 'Maximum message length in characters', 0),
('need_help_tip', '1', 0, 'Show need help tooltip?', 0),
('need_help_tip_timeout', '24', 0, 'Need help tooltip timeout, after how many hours show again tooltip?', 0),
('use_secure_cookie', '0', 0, 'Use secure cookie, check this if you want to force SSL all the time', 0),
('faq_email_required', '0', 0, 'Is visitor e-mail required for FAQ', 0),
('disable_print', '0', 0, 'Disable chat print', 0),
('hide_disabled_department', '1', 0, 'Hide disabled department widget', 0),
('disable_send', '0', 0, 'Disable chat transcript send', 0),
('ignore_user_status', '0', 0, 'Ignore users online statuses and use departments online hours', 0),
('bbc_button_visible', '1', 0, 'Show BB Code button', 0),
('activity_track_all', '0', 0, 'Track all logged operators activity and ignore their individual settings.', 0),
('allow_reopen_closed', '1', 0, 'Allow user to reopen closed chats?', 0),
('reopen_as_new', '1', 0, 'Reopen closed chat as new? Otherwise it will be reopened as active.', 0),
('default_theme_id', '0', 0, 'Default theme ID.', 1),
('default_admin_theme_id', '0', 0, 'Default admin theme ID', 1),
('translation_data', 'a:6:{i:0;b:0;s:19:\"translation_handler\";s:4:\"bing\";s:19:\"enable_translations\";b:0;s:14:\"bing_client_id\";s:0:\"\";s:18:\"bing_client_secret\";s:0:\"\";s:14:\"google_api_key\";s:0:\"\";}', 0, 'Translation data', 1),
('disable_html5_storage', '1', 0, 'Disable HMTL5 storage, check it if your site is switching between http and https', 0),
('automatically_reopen_chat', '1', 0, 'Automatically reopen chat on widget open', 0),
('autoclose_timeout', '0', 0, 'Automatic chats closing. 0 - disabled, n > 0 time in minutes before chat is automatically closed', 0),
('autopurge_timeout', '0', 0, 'Automatic chats purging. 0 - disabled, n > 0 time in minutes before chat is automatically deleted', 0),
('update_ip', '127.0.0.1', 0, 'Which ip should be allowed to update DB by executing http request, separate by comma?', 0),
('track_if_offline', '0', 0, 'Track online visitors even if there is no online operators', 0),
('min_phone_length', '8', 0, 'Minimum phone number length', 0),
('mheight', '', 0, 'Messages box height', 0),
('inform_unread_message', '0', 0, 'Inform visitor about unread messages from operator, value in minutes. 0 - disabled', 0),
('dashboard_order', '[[\"online_operators\",\"departments_stats\",\"online_visitors\"],[\"pending_chats\",\"unread_chats\",\"transfered_chats\"],[\"active_chats\",\"closed_chats\"]]', 0, 'Home page dashboard widgets order', 0),
('banned_ip_range', '', 0, 'Which ip should not be allowed to chat', 0),
('suggest_leave_msg', '1', 0, 'Suggest user to leave a message then user chooses offline department', 0),
('checkstatus_timeout', '0', 0, 'Interval between chat status checks in seconds, 0 disabled.', 0),
('show_language_switcher', '0', 0, 'Show users option to switch language at widget', 0),
('sharing_auto_allow', '0', 0, 'Do not ask permission for users to see their screen', 0),
('sharing_nodejs_enabled', '0', 0, 'NodeJs support enabled', 0),
('sharing_nodejs_path', '', 0, 'socket.io path, optional', 0),
('online_if', '0', 0, '', 0),
('track_mouse_activity', '0', 0, 'Should mouse movement be tracked as activity measure, if not checked only basic events would be tracked', 0),
('track_activity', '0', 0, 'Track users activity on site?', 0),
('autologin_data', 'a:3:{i:0;b:0;s:11:\"secret_hash\";s:16:\"please_change_me\";s:7:\"enabled\";i:0;}', 0, 'Autologin configuration data', 1),
('sharing_nodejs_secure', '0', 0, 'Connect to NodeJs in https mode', 0),
('disable_js_execution', '1', 0, 'Disable JS execution in Co-Browsing operator window', 0),
('sharing_nodejs_socket_host', '', 0, 'Host where NodeJs is running', 0),
('hide_right_column_frontpage', '0', 0, 'Hide right column in frontpage', 0),
('front_tabs', 'dashboard,online_users,online_map', 0, 'Home page tabs order', 0),
('speech_data', 'a:3:{i:0;b:0;s:8:\"language\";i:7;s:7:\"dialect\";s:5:\"en-US\";}', 1, '', 1),
('sharing_nodejs_sllocation', 'https://cdn.socket.io/socket.io-1.1.0.js', 0, 'Location of SocketIO JS library', 0),
('track_is_online', '0', 0, 'Track is user still on site, chat status checks also has to be enabled', 0),
('show_languages', 'eng,lit,hrv,esp,por,nld,ara,ger,pol,rus,ita,fre,chn,cse,nor,tur,vnm,idn,sve,per,ell,dnk,rou,bgr,tha,geo,fin,alb', 0, 'Between what languages user should be able to switch', 0),
('geoadjustment_data', 'a:8:{i:0;b:0;s:18:\"use_geo_adjustment\";b:0;s:13:\"available_for\";s:0:\"\";s:15:\"other_countries\";s:6:\"custom\";s:8:\"hide_for\";s:0:\"\";s:12:\"other_status\";s:7:\"offline\";s:11:\"rest_status\";s:6:\"hidden\";s:12:\"apply_widget\";i:0;}', 0, 'Geo adjustment settings', 1),
('geo_data', 'a:5:{i:0;b:0;s:21:\"geo_detection_enabled\";i:1;s:22:\"geo_service_identifier\";s:8:\"max_mind\";s:23:\"max_mind_detection_type\";s:7:\"country\";s:22:\"max_mind_city_location\";s:37:\"var/external/geoip/GeoLite2-City.mmdb\";}', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lh_chat_crm_mapping`
--

CREATE TABLE `lh_chat_crm_mapping` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `module_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lh_chat_file`
--

CREATE TABLE `lh_chat_file` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `upload_name` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `online_user_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_chat_online_user`
--

CREATE TABLE `lh_chat_online_user` (
  `id` int(11) NOT NULL,
  `vid` varchar(50) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `current_page` text NOT NULL,
  `page_title` varchar(250) NOT NULL,
  `referrer` text NOT NULL,
  `chat_id` int(11) NOT NULL,
  `invitation_seen_count` int(11) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `last_visit` int(11) NOT NULL,
  `first_visit` int(11) NOT NULL,
  `total_visits` int(11) NOT NULL,
  `pages_count` int(11) NOT NULL,
  `tt_pages_count` int(11) NOT NULL,
  `invitation_count` int(11) NOT NULL,
  `last_check_time` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `user_agent` varchar(250) NOT NULL,
  `notes` varchar(250) NOT NULL,
  `user_country_code` varchar(50) NOT NULL,
  `user_country_name` varchar(50) NOT NULL,
  `visitor_tz` varchar(50) NOT NULL,
  `operator_message` text NOT NULL,
  `operator_user_proactive` varchar(100) NOT NULL,
  `operator_user_id` int(11) NOT NULL,
  `message_seen` int(11) NOT NULL,
  `message_seen_ts` int(11) NOT NULL,
  `user_active` int(11) NOT NULL,
  `lat` varchar(10) NOT NULL,
  `lon` varchar(10) NOT NULL,
  `city` varchar(100) NOT NULL,
  `reopen_chat` int(11) NOT NULL,
  `time_on_site` int(11) NOT NULL,
  `tt_time_on_site` int(11) NOT NULL,
  `requires_email` int(11) NOT NULL,
  `requires_username` int(11) NOT NULL,
  `requires_phone` int(11) NOT NULL,
  `screenshot_id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `operation` text NOT NULL,
  `online_attr_system` text NOT NULL,
  `operation_chat` text NOT NULL,
  `online_attr` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lh_chat_online_user`
--

INSERT INTO `lh_chat_online_user` (`id`, `vid`, `ip`, `current_page`, `page_title`, `referrer`, `chat_id`, `invitation_seen_count`, `invitation_id`, `last_visit`, `first_visit`, `total_visits`, `pages_count`, `tt_pages_count`, `invitation_count`, `last_check_time`, `dep_id`, `user_agent`, `notes`, `user_country_code`, `user_country_name`, `visitor_tz`, `operator_message`, `operator_user_proactive`, `operator_user_id`, `message_seen`, `message_seen_ts`, `user_active`, `lat`, `lon`, `city`, `reopen_chat`, `time_on_site`, `tt_time_on_site`, `requires_email`, `requires_username`, `requires_phone`, `screenshot_id`, `identifier`, `operation`, `online_attr_system`, `operation_chat`, `online_attr`) VALUES
(1, '36sm4jf5rjmtt1d9p2xt', '115.99.209.123', 'http://192.168.0.100/E-commerce/opencart1/upload/index.php?route=common/home', 'Your Store', '', 4, 0, 0, 1501078100, 1501077835, 1, 2, 2, 0, 1501078100, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:55.0) Gecko/20100101 Firefox/55.0', '', 'in', 'India', 'Asia/Yekaterinburg', '', '', 0, 1, 1501077852, 1, '', '', '', 0, 284, 284, 0, 0, 0, 0, '', '', '', '', ''),
(2, '9qhoabl3mtwtyzemud24', '115.99.209.123', 'http://115.99.209.123/E-commerce/opencart1/upload/index.php?route=account/register', 'Register Account', '//192.168.0.100/E-commerce/opencart1/upload/index.php?route=common/home', 5, 0, 0, 1501078200, 1501077986, 1, 3, 3, 0, 1501078200, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:55.0) Gecko/20100101 Firefox/55.0', '', 'in', 'India', 'Asia/Yekaterinburg', '', '', 0, 1, 1501078003, 1, '', '', '', 0, 227, 227, 0, 0, 0, 0, '', '', '', '', ''),
(3, '8djgdyq3hehpwhusmtg', '115.99.209.123', 'http://192.168.0.100/E-commerce/opencart1/upload/', '', '', 6, 0, 0, 1501078809, 1501078294, 1, 2, 2, 0, 1501078809, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:55.0) Gecko/20100101 Firefox/55.0', '', 'in', 'India', 'Asia/Yekaterinburg', '', '', 0, 1, 1501078794, 1, '', '', '', 0, 530, 530, 0, 0, 0, 0, '', '', '', '', ''),
(4, 'q6c2cvun9cddhzs7ri6m', '115.99.209.123', 'http://115.99.209.123/E-commerce/opencart1/upload/index.php?route=account/register', 'Register Account', '//115.99.209.123/E-commerce/opencart1/upload/index.php?route=account/logout', 0, 0, 0, 1501078634, 1501078634, 1, 1, 1, 0, 1501078634, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '', 'in', 'India', 'Asia/Yekaterinburg', '', '', 0, 0, 0, 1, '', '', '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', ''),
(5, 'jmda9lr2j7qkotoplojy', '115.99.209.123', 'http://115.99.209.123/E-commerce/opencart1/upload/index.php?route=product/category&path=20', 'Desktops', '//115.99.209.123/E-commerce/opencart1/upload/index.php?route=account/register', 0, 0, 0, 1501078634, 1501078634, 1, 1, 1, 0, 1501078634, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '', 'in', 'India', 'Asia/Yekaterinburg', '', '', 0, 0, 0, 1, '', '', '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `lh_chat_online_user_footprint`
--

CREATE TABLE `lh_chat_online_user_footprint` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `online_user_id` int(11) NOT NULL,
  `page` varchar(250) NOT NULL,
  `vtime` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_chat_paid`
--

CREATE TABLE `lh_chat_paid` (
  `id` int(11) NOT NULL,
  `hash` varchar(250) NOT NULL,
  `chat_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_cobrowse`
--

CREATE TABLE `lh_cobrowse` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `online_user_id` int(11) NOT NULL,
  `mtime` int(11) NOT NULL,
  `url` varchar(250) NOT NULL,
  `initialize` longtext NOT NULL,
  `modifications` longtext NOT NULL,
  `finished` tinyint(1) NOT NULL,
  `w` int(11) NOT NULL,
  `wh` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_departament`
--

CREATE TABLE `lh_departament` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `xmpp_recipients` text NOT NULL,
  `xmpp_group_recipients` text NOT NULL,
  `priority` int(11) NOT NULL,
  `sort_priority` int(11) NOT NULL,
  `department_transfer_id` int(11) NOT NULL,
  `transfer_timeout` int(11) NOT NULL,
  `disabled` int(11) NOT NULL,
  `hidden` int(11) NOT NULL,
  `delay_lm` int(11) NOT NULL,
  `max_active_chats` int(11) NOT NULL,
  `max_timeout_seconds` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `mod_start_hour` int(4) NOT NULL,
  `mod_end_hour` int(4) NOT NULL,
  `tud_start_hour` int(4) NOT NULL,
  `tud_end_hour` int(4) NOT NULL,
  `wed_start_hour` int(4) NOT NULL,
  `wed_end_hour` int(4) NOT NULL,
  `thd_start_hour` int(4) NOT NULL,
  `thd_end_hour` int(4) NOT NULL,
  `frd_start_hour` int(4) NOT NULL,
  `frd_end_hour` int(4) NOT NULL,
  `sad_start_hour` int(4) NOT NULL,
  `sad_end_hour` int(4) NOT NULL,
  `sud_start_hour` int(4) NOT NULL,
  `sud_end_hour` int(4) NOT NULL,
  `nc_cb_execute` tinyint(1) NOT NULL,
  `na_cb_execute` tinyint(1) NOT NULL,
  `inform_unread` tinyint(1) NOT NULL,
  `active_balancing` tinyint(1) NOT NULL,
  `visible_if_online` tinyint(1) NOT NULL,
  `inform_close` int(11) NOT NULL,
  `inform_unread_delay` int(11) NOT NULL,
  `inform_options` varchar(250) NOT NULL,
  `online_hours_active` tinyint(1) NOT NULL,
  `inform_delay` int(11) NOT NULL,
  `attr_int_1` int(11) NOT NULL,
  `attr_int_2` int(11) NOT NULL,
  `attr_int_3` int(11) NOT NULL,
  `pending_max` int(11) NOT NULL,
  `pending_group_max` int(11) NOT NULL,
  `active_chats_counter` int(11) NOT NULL,
  `pending_chats_counter` int(11) NOT NULL,
  `closed_chats_counter` int(11) NOT NULL,
  `inform_close_all` int(11) NOT NULL,
  `inform_close_all_email` varchar(250) NOT NULL,
  `product_configuration` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lh_departament`
--

INSERT INTO `lh_departament` (`id`, `name`, `email`, `xmpp_recipients`, `xmpp_group_recipients`, `priority`, `sort_priority`, `department_transfer_id`, `transfer_timeout`, `disabled`, `hidden`, `delay_lm`, `max_active_chats`, `max_timeout_seconds`, `identifier`, `mod_start_hour`, `mod_end_hour`, `tud_start_hour`, `tud_end_hour`, `wed_start_hour`, `wed_end_hour`, `thd_start_hour`, `thd_end_hour`, `frd_start_hour`, `frd_end_hour`, `sad_start_hour`, `sad_end_hour`, `sud_start_hour`, `sud_end_hour`, `nc_cb_execute`, `na_cb_execute`, `inform_unread`, `active_balancing`, `visible_if_online`, `inform_close`, `inform_unread_delay`, `inform_options`, `online_hours_active`, `inform_delay`, `attr_int_1`, `attr_int_2`, `attr_int_3`, `pending_max`, `pending_group_max`, `active_chats_counter`, `pending_chats_counter`, `closed_chats_counter`, `inform_close_all`, `inform_close_all_email`, `product_configuration`) VALUES
(1, 'IT', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `lh_departament_custom_work_hours`
--

CREATE TABLE `lh_departament_custom_work_hours` (
  `id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `date_from` int(11) NOT NULL,
  `date_to` int(11) NOT NULL,
  `start_hour` int(11) NOT NULL,
  `end_hour` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_departament_group`
--

CREATE TABLE `lh_departament_group` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_departament_group_member`
--

CREATE TABLE `lh_departament_group_member` (
  `id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `dep_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_departament_group_user`
--

CREATE TABLE `lh_departament_group_user` (
  `id` int(11) NOT NULL,
  `dep_group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_departament_limit_group`
--

CREATE TABLE `lh_departament_limit_group` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `pending_max` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_departament_limit_group_member`
--

CREATE TABLE `lh_departament_limit_group_member` (
  `id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `dep_limit_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_faq`
--

CREATE TABLE `lh_faq` (
  `id` int(11) NOT NULL,
  `question` varchar(250) NOT NULL,
  `answer` text NOT NULL,
  `url` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL,
  `identifier` varchar(10) NOT NULL,
  `active` int(11) NOT NULL,
  `has_url` tinyint(1) NOT NULL,
  `is_wildcard` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_forgotpasswordhash`
--

CREATE TABLE `lh_forgotpasswordhash` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hash` varchar(40) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_group`
--

CREATE TABLE `lh_group` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `disabled` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lh_group`
--

INSERT INTO `lh_group` (`id`, `name`, `disabled`) VALUES
(1, 'Administrators', 0),
(2, 'Operators', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lh_grouprole`
--

CREATE TABLE `lh_grouprole` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lh_grouprole`
--

INSERT INTO `lh_grouprole` (`id`, `group_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `lh_groupuser`
--

CREATE TABLE `lh_groupuser` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lh_groupuser`
--

INSERT INTO `lh_groupuser` (`id`, `group_id`, `user_id`) VALUES
(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lh_group_work`
--

CREATE TABLE `lh_group_work` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_work_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_msg`
--

CREATE TABLE `lh_msg` (
  `id` int(11) NOT NULL,
  `msg` longtext NOT NULL,
  `time` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name_support` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lh_msg`
--

INSERT INTO `lh_msg` (`id`, `msg`, `time`, `chat_id`, `user_id`, `name_support`) VALUES
(1, 'Hi', 1499679115, 1, 0, ''),
(2, 'Paresh Mathukia has accepted the chat!', 1499679130, 1, -1, ''),
(3, 'Hi', 1499683695, 1, 1, 'Paresh Mathukia'),
(4, 'Test', 1499760107, 2, 0, ''),
(5, 'Paresh Mathukia has accepted the chat!', 1499760115, 2, -1, ''),
(6, 'Hi', 1499760143, 2, 0, ''),
(7, 'Hello', 1499760166, 2, 1, 'Paresh Mathukia'),
(8, 'this is a test', 1499760182, 2, 0, ''),
(9, 'Great', 1499760191, 2, 1, 'Paresh Mathukia'),
(10, 'Visitor has closed the chat explicitly!', 1499760680, 2, -1, ''),
(11, 'Visitor has closed the chat explicitly!', 1499760708, 2, -1, ''),
(12, 'test fynsis', 1500028427, 3, 0, ''),
(13, 'Paresh Mathukia has accepted the chat!', 1500028441, 3, -1, ''),
(14, 'hello', 1500028448, 3, 0, ''),
(15, 'hi', 1500028461, 3, 1, 'Paresh Mathukia'),
(16, 'Visitor has closed the chat explicitly!', 1500028471, 3, -1, ''),
(17, 'hey', 1501077852, 4, 0, ''),
(18, 'Paresh Mathukia has accepted the chat!', 1501077908, 4, -1, ''),
(19, 'Hello', 1501077955, 4, 1, 'Paresh Mathukia'),
(20, 'skdjf', 1501078003, 5, 0, ''),
(21, 'Paresh Mathukia has accepted the chat!', 1501078071, 5, -1, ''),
(22, 'jznbzlvjdnvlzf', 1501078141, 4, 0, ''),
(23, 'sdfsf', 1501078142, 4, 0, ''),
(24, 'awdwa', 1501078142, 4, 0, ''),
(25, 'hisas', 1501078143, 5, 1, 'Paresh Mathukia'),
(26, 'He;;osdoajdojasd', 1501078144, 5, 1, 'Paresh Mathukia'),
(27, 'wdaaaaaaa', 1501078156, 4, 0, ''),
(28, 'd', 1501078794, 6, 0, ''),
(29, 'Visitor has closed the chat explicitly!', 1501078805, 6, -1, ''),
(30, 'test', 1501600788, 7, 0, ''),
(31, 'Paresh Mathukia has accepted the chat!', 1501600796, 7, -1, ''),
(32, 'Hi', 1501600807, 7, 1, 'Paresh Mathukia'),
(33, 'Test', 1501770567, 8, 0, ''),
(34, 'Hi', 1501770573, 8, 0, ''),
(35, 'Paresh Mathukia has accepted the chat!', 1501770578, 8, -1, ''),
(36, 'test', 1501772230, 9, 0, ''),
(37, 'Paresh Mathukia has accepted the chat!', 1501772237, 6, -1, ''),
(38, 'Paresh Mathukia has accepted the chat!', 1501772249, 9, -1, ''),
(39, 't', 1501843284, 10, 0, ''),
(40, 'Paresh Mathukia has accepted the chat!', 1501843307, 10, -1, ''),
(41, 'Hi', 1501843318, 10, 1, 'Paresh Mathukia'),
(42, 'hello', 1501843325, 10, 0, ''),
(43, 'q', 1501843509, 11, 0, ''),
(44, 'Paresh Mathukia has accepted the chat!', 1501843524, 11, -1, ''),
(45, 'hi', 1502708741, 12, 0, ''),
(46, 'Paresh Mathukia has accepted the chat!', 1502708750, 12, -1, ''),
(47, 'test', 1502710639, 13, 0, ''),
(48, 'Paresh Mathukia has accepted the chat!', 1502710646, 13, -1, ''),
(49, 'test', 1502711042, 14, 0, ''),
(50, 'Paresh Mathukia has accepted the chat!', 1502711049, 14, -1, ''),
(51, 'test', 1502712152, 15, 0, ''),
(52, 'Paresh Mathukia has accepted the chat!', 1502712162, 15, -1, ''),
(53, 'TEST', 1502716540, 16, 0, ''),
(54, 'Paresh Mathukia has accepted the chat!', 1502716551, 16, -1, ''),
(55, 'TESTING', 1502719205, 17, 0, ''),
(56, 'Paresh Mathukia has accepted the chat!', 1502719237, 17, -1, ''),
(57, 'test', 1502719539, 18, 0, ''),
(58, 'Paresh Mathukia has accepted the chat!', 1502719558, 18, -1, ''),
(59, 'test', 1502720851, 19, 0, ''),
(60, 'Paresh Mathukia has accepted the chat!', 1502720861, 19, -1, ''),
(61, 'test', 1502724925, 20, 0, ''),
(62, 'Paresh Mathukia has accepted the chat!', 1502724928, 20, -1, ''),
(63, 'Hi', 1502724992, 20, 1, 'Paresh Mathukia'),
(64, 'Hi', 1502724995, 20, 1, 'Paresh Mathukia'),
(65, 'test', 1502724999, 20, 1, 'Paresh Mathukia'),
(66, 'test', 1502725005, 20, 0, ''),
(67, 'xsxdcfv', 1502725048, 20, 1, 'Paresh Mathukia'),
(68, 'hello', 1502725086, 20, 0, ''),
(69, 'welcome', 1502725093, 20, 1, 'Paresh Mathukia');

-- --------------------------------------------------------

--
-- Table structure for table `lh_question`
--

CREATE TABLE `lh_question` (
  `id` int(11) NOT NULL,
  `question` varchar(250) NOT NULL,
  `location` varchar(250) NOT NULL,
  `active` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `is_voting` int(11) NOT NULL,
  `question_intro` text NOT NULL,
  `revote` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_question_answer`
--

CREATE TABLE `lh_question_answer` (
  `id` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `ctime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_question_option`
--

CREATE TABLE `lh_question_option` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_name` varchar(250) NOT NULL,
  `priority` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_question_option_answer`
--

CREATE TABLE `lh_question_option_answer` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_role`
--

CREATE TABLE `lh_role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lh_role`
--

INSERT INTO `lh_role` (`id`, `name`) VALUES
(1, 'Administrators'),
(2, 'Operators');

-- --------------------------------------------------------

--
-- Table structure for table `lh_rolefunction`
--

CREATE TABLE `lh_rolefunction` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `function` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lh_rolefunction`
--

INSERT INTO `lh_rolefunction` (`id`, `role_id`, `module`, `function`) VALUES
(1, 1, '*', '*'),
(2, 2, 'lhuser', 'selfedit'),
(3, 2, 'lhuser', 'changeonlinestatus'),
(4, 2, 'lhuser', 'changeskypenick'),
(5, 2, 'lhuser', 'personalcannedmsg'),
(6, 2, 'lhuser', 'change_visibility_list'),
(7, 2, 'lhuser', 'see_assigned_departments'),
(8, 2, 'lhuser', 'canseedepartmentstats'),
(9, 2, 'lhchat', 'use'),
(10, 2, 'lhchat', 'chattabschrome'),
(11, 2, 'lhchat', 'singlechatwindow'),
(12, 2, 'lhchat', 'allowopenremotechat'),
(13, 2, 'lhchat', 'allowchattabs'),
(14, 2, 'lhchat', 'use_onlineusers'),
(15, 2, 'lhchat', 'take_screenshot'),
(16, 2, 'lhfront', 'use'),
(17, 2, 'lhsystem', 'use'),
(18, 2, 'lhtranslation', 'use'),
(19, 2, 'lhchat', 'allowblockusers'),
(20, 2, 'lhsystem', 'generatejs'),
(21, 2, 'lhsystem', 'changelanguage'),
(22, 2, 'lhchat', 'allowredirect'),
(23, 2, 'lhchat', 'allowtransfer'),
(24, 2, 'lhchat', 'allowtransferdirectly'),
(25, 2, 'lhchat', 'administratecannedmsg'),
(26, 2, 'lhchat', 'sees_all_online_visitors'),
(27, 2, 'lhpermission', 'see_permissions'),
(28, 2, 'lhquestionary', 'manage_questionary'),
(29, 2, 'lhfaq', 'manage_faq'),
(30, 2, 'lhchatbox', 'manage_chatbox'),
(31, 2, 'lhbrowseoffer', 'manage_bo'),
(32, 2, 'lhxml', '*'),
(33, 2, 'lhcobrowse', 'browse'),
(34, 2, 'lhfile', 'use_operator'),
(35, 2, 'lhfile', 'file_delete_chat'),
(36, 2, 'lhstatistic', 'use'),
(37, 2, 'lhspeech', 'changedefaultlanguage'),
(38, 2, 'lhspeech', 'use'),
(39, 2, 'lhcannedmsg', 'use'),
(40, 2, 'lhspeech', 'change_chat_recognition');

-- --------------------------------------------------------

--
-- Table structure for table `lh_speech_chat_language`
--

CREATE TABLE `lh_speech_chat_language` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `dialect` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_speech_language`
--

CREATE TABLE `lh_speech_language` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lh_speech_language`
--

INSERT INTO `lh_speech_language` (`id`, `name`) VALUES
(1, 'Afrikaans'),
(2, 'Bahasa Indonesia'),
(3, 'Bahasa Melayu'),
(4, 'Català'),
(5, 'Čeština'),
(6, 'Deutsch'),
(7, 'English'),
(8, 'Español'),
(9, 'Euskara'),
(10, 'Français'),
(11, 'Galego'),
(12, 'Hrvatski'),
(13, 'IsiZulu'),
(14, 'Íslenska'),
(15, 'Italiano'),
(16, 'Magyar'),
(17, 'Nederlands'),
(18, 'Norsk bokmål'),
(19, 'Polski'),
(20, 'Português'),
(21, 'Română'),
(22, 'Slovenčina'),
(23, 'Suomi'),
(24, 'Svenska'),
(25, 'Türkçe'),
(26, 'български'),
(27, 'Pусский'),
(28, 'Српски'),
(29, '한국어'),
(30, '中文'),
(31, '日本語'),
(32, 'Lingua latīna');

-- --------------------------------------------------------

--
-- Table structure for table `lh_speech_language_dialect`
--

CREATE TABLE `lh_speech_language_dialect` (
  `id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `lang_name` varchar(100) NOT NULL,
  `lang_code` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lh_speech_language_dialect`
--

INSERT INTO `lh_speech_language_dialect` (`id`, `language_id`, `lang_name`, `lang_code`) VALUES
(1, 1, 'Afrikaans', 'af-ZA'),
(2, 2, 'Bahasa Indonesia', 'id-ID'),
(3, 3, 'Bahasa Melayu', 'ms-MY'),
(4, 4, 'Català', 'ca-ES'),
(5, 5, 'Čeština', 'cs-CZ'),
(6, 6, 'Deutsch', 'de-DE'),
(7, 7, 'Australia', 'en-AU'),
(8, 7, 'Canada', 'en-CA'),
(9, 7, 'India', 'en-IN'),
(10, 7, 'New Zealand', 'en-NZ'),
(11, 7, 'South Africa', 'en-ZA'),
(12, 7, 'United Kingdom', 'en-GB'),
(13, 7, 'United States', 'en-US'),
(14, 8, 'Argentina', 'es-AR'),
(15, 8, 'Bolivia', 'es-BO'),
(16, 8, 'Chile', 'es-CL'),
(17, 8, 'Colombia', 'es-CO'),
(18, 8, 'Costa Rica', 'es-CR'),
(19, 8, 'Ecuador', 'es-EC'),
(20, 8, 'El Salvador', 'es-SV'),
(21, 8, 'España', 'es-ES'),
(22, 8, 'Estados Unidos', 'es-US'),
(23, 8, 'Guatemala', 'es-GT'),
(24, 8, 'Honduras', 'es-HN'),
(25, 8, 'México', 'es-MX'),
(26, 8, 'Nicaragua', 'es-NI'),
(27, 8, 'Panamá', 'es-PA'),
(28, 8, 'Paraguay', 'es-PY'),
(29, 8, 'Perú', 'es-PE'),
(30, 8, 'Puerto Rico', 'es-PR'),
(31, 8, 'República Dominicana', 'es-DO'),
(32, 8, 'Uruguay', 'es-UY'),
(33, 8, 'Venezuela', 'es-VE'),
(34, 9, 'Euskara', 'eu-ES'),
(35, 10, 'Français', 'fr-FR'),
(36, 11, 'Galego', 'gl-ES'),
(37, 12, 'Hrvatski', 'hr_HR'),
(38, 13, 'IsiZulu', 'zu-ZA'),
(39, 14, 'Íslenska', 'is-IS'),
(40, 15, 'Italia', 'it-IT'),
(41, 15, 'Svizzera', 'it-CH'),
(42, 16, 'Magyar', 'hu-HU'),
(43, 17, 'Nederlands', 'nl-NL'),
(44, 18, 'Norsk bokmål', 'nb-NO'),
(45, 19, 'Polski', 'pl-PL'),
(46, 20, 'Brasil', 'pt-BR'),
(47, 20, 'Portugal', 'pt-PT'),
(48, 21, 'Română', 'ro-RO'),
(49, 22, 'Slovenčina', 'sk-SK'),
(50, 23, 'Suomi', 'fi-FI'),
(51, 24, 'Svenska', 'sv-SE'),
(52, 25, 'Türkçe', 'tr-TR'),
(53, 26, 'български', 'bg-BG'),
(54, 27, 'Pусский', 'ru-RU'),
(55, 28, 'Српски', 'sr-RS'),
(56, 29, '한국어', 'ko-KR'),
(57, 30, '普通话 (中国大陆)', 'cmn-Hans-CN'),
(58, 30, '普通话 (香港)', 'cmn-Hans-HK'),
(59, 30, '中文 (台灣)', 'cmn-Hant-TW'),
(60, 30, '粵語 (香港)', 'yue-Hant-HK'),
(61, 31, '日本語', 'ja-JP'),
(62, 32, 'Lingua latīna', 'la');

-- --------------------------------------------------------

--
-- Table structure for table `lh_transfer`
--

CREATE TABLE `lh_transfer` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `transfer_user_id` int(11) NOT NULL,
  `from_dep_id` int(11) NOT NULL,
  `transfer_to_user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_userdep`
--

CREATE TABLE `lh_userdep` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `last_activity` int(11) NOT NULL,
  `hide_online` int(11) NOT NULL,
  `last_accepted` int(11) NOT NULL,
  `active_chats` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `dep_group_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lh_userdep`
--

INSERT INTO `lh_userdep` (`id`, `user_id`, `dep_id`, `last_activity`, `hide_online`, `last_accepted`, `active_chats`, `type`, `dep_group_id`) VALUES
(1, 1, 0, 1503572598, 0, 0, 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lh_users`
--

CREATE TABLE `lh_users` (
  `id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `time_zone` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `filepath` varchar(200) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `job_title` varchar(100) NOT NULL,
  `departments_ids` varchar(100) NOT NULL,
  `chat_nickname` varchar(100) NOT NULL,
  `xmpp_username` varchar(200) NOT NULL,
  `session_id` varchar(40) NOT NULL,
  `operation_admin` text NOT NULL,
  `skype` varchar(50) NOT NULL,
  `disabled` tinyint(4) NOT NULL,
  `hide_online` tinyint(1) NOT NULL,
  `all_departments` tinyint(1) NOT NULL,
  `invisible_mode` tinyint(1) NOT NULL,
  `inactive_mode` tinyint(1) NOT NULL,
  `rec_per_req` tinyint(1) NOT NULL,
  `active_chats_counter` int(11) NOT NULL,
  `closed_chats_counter` int(11) NOT NULL,
  `pending_chats_counter` int(11) NOT NULL,
  `attr_int_1` int(11) NOT NULL,
  `attr_int_2` int(11) NOT NULL,
  `attr_int_3` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lh_users`
--

INSERT INTO `lh_users` (`id`, `username`, `password`, `email`, `time_zone`, `name`, `surname`, `filepath`, `filename`, `job_title`, `departments_ids`, `chat_nickname`, `xmpp_username`, `session_id`, `operation_admin`, `skype`, `disabled`, `hide_online`, `all_departments`, `invisible_mode`, `inactive_mode`, `rec_per_req`, `active_chats_counter`, `closed_chats_counter`, `pending_chats_counter`, `attr_int_1`, `attr_int_2`, `attr_int_3`) VALUES
(1, 'admin', '$2y$10$UTHwMedTNplX8tgpyUAjdexTPfsRBi7mmPRGvhZlBROvyDl9ap3OO', 'sales@fynsis.com', '', 'Administrator', '', '', '', '', '0', 'Admin', '', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lh_users_remember`
--

CREATE TABLE `lh_users_remember` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mtime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_users_session`
--

CREATE TABLE `lh_users_session` (
  `id` int(11) NOT NULL,
  `token` varchar(40) NOT NULL,
  `device_type` int(11) NOT NULL,
  `device_token` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL,
  `expires_on` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lh_users_setting`
--

CREATE TABLE `lh_users_setting` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lh_users_setting`
--

INSERT INTO `lh_users_setting` (`id`, `user_id`, `identifier`, `value`) VALUES
(1, 1, 'user_language', 'en_EN'),
(2, 1, 'enable_pending_list', '1'),
(3, 1, 'enable_active_list', '1'),
(4, 1, 'enable_close_list', '0'),
(5, 1, 'enable_unread_list', '1'),
(6, 1, 'enable_mchats_list', '0'),
(7, 1, 'new_user_bn', '0'),
(8, 1, 'new_user_sound', '0'),
(9, 1, 'o_department', '0'),
(10, 1, 'ouser_timeout', '3600'),
(11, 1, 'oupdate_timeout', '10'),
(12, 1, 'omax_rows', '50'),
(13, 1, 'ogroup_by', 'none'),
(14, 1, 'omap_depid', '0'),
(15, 1, 'omap_mtimeout', '30'),
(16, 1, 'dwo', ''),
(17, 1, 'new_chat_sound', '1'),
(18, 1, 'chat_message', '1'),
(19, 1, 'show_alert_chat', '0'),
(20, 1, 'sn_off', '1'),
(21, 1, 'ownntfonly', '0'),
(22, 1, 'trackactivitytimeout', '-1'),
(23, 1, 'trackactivity', '0'),
(24, 1, 'show_all_pending', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lh_users_setting_option`
--

CREATE TABLE `lh_users_setting_option` (
  `identifier` varchar(50) NOT NULL,
  `class` varchar(50) NOT NULL,
  `attribute` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lh_users_setting_option`
--

INSERT INTO `lh_users_setting_option` (`identifier`, `class`, `attribute`) VALUES
('chat_message', '', ''),
('new_chat_sound', '', ''),
('enable_pending_list', '', ''),
('enable_active_list', '', ''),
('enable_close_list', '', ''),
('new_user_bn', '', ''),
('new_user_sound', '', ''),
('oupdate_timeout', '', ''),
('ouser_timeout', '', ''),
('o_department', '', ''),
('omax_rows', '', ''),
('ogroup_by', '', ''),
('omap_depid', '', ''),
('omap_mtimeout', '', ''),
('dwo', '', ''),
('enable_unread_list', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lh_abstract_auto_responder`
--
ALTER TABLE `lh_abstract_auto_responder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siteaccess_position` (`siteaccess`,`position`);

--
-- Indexes for table `lh_abstract_auto_responder_chat`
--
ALTER TABLE `lh_abstract_auto_responder_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Indexes for table `lh_abstract_browse_offer_invitation`
--
ALTER TABLE `lh_abstract_browse_offer_invitation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `lh_abstract_email_template`
--
ALTER TABLE `lh_abstract_email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lh_abstract_form`
--
ALTER TABLE `lh_abstract_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lh_abstract_form_collected`
--
ALTER TABLE `lh_abstract_form_collected`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`);

--
-- Indexes for table `lh_abstract_proactive_chat_event`
--
ALTER TABLE `lh_abstract_proactive_chat_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vid_id_ev_id_val_ts` (`vid_id`,`ev_id`,`val`,`ts`),
  ADD KEY `vid_id_ev_id_ts` (`vid_id`,`ev_id`,`ts`);

--
-- Indexes for table `lh_abstract_proactive_chat_invitation`
--
ALTER TABLE `lh_abstract_proactive_chat_invitation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_on_site_pageviews_siteaccess_position` (`time_on_site`,`pageviews`,`siteaccess`,`identifier`,`position`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `dynamic_invitation` (`dynamic_invitation`),
  ADD KEY `tag` (`tag`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Indexes for table `lh_abstract_proactive_chat_invitation_event`
--
ALTER TABLE `lh_abstract_proactive_chat_invitation_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invitation_id` (`invitation_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `lh_abstract_proactive_chat_variables`
--
ALTER TABLE `lh_abstract_proactive_chat_variables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `lh_abstract_product`
--
ALTER TABLE `lh_abstract_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departament_id` (`departament_id`);

--
-- Indexes for table `lh_abstract_product_departament`
--
ALTER TABLE `lh_abstract_product_departament`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departament_id` (`departament_id`);

--
-- Indexes for table `lh_abstract_rest_api_key`
--
ALTER TABLE `lh_abstract_rest_api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_key` (`api_key`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `lh_abstract_survey`
--
ALTER TABLE `lh_abstract_survey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lh_abstract_survey_item`
--
ALTER TABLE `lh_abstract_survey_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_id` (`survey_id`),
  ADD KEY `chat_id` (`chat_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `ftime` (`ftime`),
  ADD KEY `max_stars_1` (`max_stars_1`),
  ADD KEY `max_stars_2` (`max_stars_2`),
  ADD KEY `max_stars_3` (`max_stars_3`),
  ADD KEY `max_stars_4` (`max_stars_4`),
  ADD KEY `max_stars_5` (`max_stars_5`),
  ADD KEY `question_options_1` (`question_options_1`),
  ADD KEY `question_options_2` (`question_options_2`),
  ADD KEY `question_options_3` (`question_options_3`),
  ADD KEY `question_options_4` (`question_options_4`),
  ADD KEY `question_options_5` (`question_options_5`);

--
-- Indexes for table `lh_abstract_widget_theme`
--
ALTER TABLE `lh_abstract_widget_theme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lh_admin_theme`
--
ALTER TABLE `lh_admin_theme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lh_canned_msg`
--
ALTER TABLE `lh_canned_msg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `attr_int_1` (`attr_int_1`),
  ADD KEY `attr_int_2` (`attr_int_2`),
  ADD KEY `attr_int_3` (`attr_int_3`),
  ADD KEY `position_title` (`position`,`title`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `lh_canned_msg_tag`
--
ALTER TABLE `lh_canned_msg_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag` (`tag`);

--
-- Indexes for table `lh_canned_msg_tag_link`
--
ALTER TABLE `lh_canned_msg_tag_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `canned_id` (`canned_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `lh_chat`
--
ALTER TABLE `lh_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_user_id` (`status`,`user_id`),
  ADD KEY `user_id_sender_user_id` (`user_id`,`sender_user_id`),
  ADD KEY `unanswered_chat` (`unanswered_chat`),
  ADD KEY `sender_user_id` (`sender_user_id`),
  ADD KEY `online_user_id` (`online_user_id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `unread_operator` (`has_unread_op_messages`,`unread_op_messages_informed`),
  ADD KEY `has_unread_messages_dep_id_id` (`has_unread_messages`,`dep_id`,`id`),
  ADD KEY `status_dep_id_id` (`status`,`dep_id`,`id`),
  ADD KEY `status_dep_id_priority_id` (`status`,`dep_id`,`priority`,`id`),
  ADD KEY `status_priority_id` (`status`,`priority`,`id`);

--
-- Indexes for table `lh_chatbox`
--
ALTER TABLE `lh_chatbox`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `lh_chat_accept`
--
ALTER TABLE `lh_chat_accept`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash` (`hash`);

--
-- Indexes for table `lh_chat_archive_range`
--
ALTER TABLE `lh_chat_archive_range`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lh_chat_blocked_user`
--
ALTER TABLE `lh_chat_blocked_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `lh_chat_config`
--
ALTER TABLE `lh_chat_config`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `lh_chat_crm_mapping`
--
ALTER TABLE `lh_chat_crm_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lh_chat_file`
--
ALTER TABLE `lh_chat_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`),
  ADD KEY `online_user_id` (`online_user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `lh_chat_online_user`
--
ALTER TABLE `lh_chat_online_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vid` (`vid`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `last_visit_dep_id` (`last_visit`,`dep_id`);

--
-- Indexes for table `lh_chat_online_user_footprint`
--
ALTER TABLE `lh_chat_online_user_footprint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id_vtime` (`chat_id`,`vtime`),
  ADD KEY `online_user_id` (`online_user_id`);

--
-- Indexes for table `lh_chat_paid`
--
ALTER TABLE `lh_chat_paid`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash` (`hash`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Indexes for table `lh_cobrowse`
--
ALTER TABLE `lh_cobrowse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`),
  ADD KEY `online_user_id` (`online_user_id`);

--
-- Indexes for table `lh_departament`
--
ALTER TABLE `lh_departament`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `attr_int_1` (`attr_int_1`),
  ADD KEY `attr_int_2` (`attr_int_2`),
  ADD KEY `attr_int_3` (`attr_int_3`),
  ADD KEY `disabled_hidden` (`disabled`,`hidden`),
  ADD KEY `sort_priority_name` (`sort_priority`,`name`),
  ADD KEY `active_mod` (`online_hours_active`,`mod_start_hour`,`mod_end_hour`),
  ADD KEY `active_tud` (`online_hours_active`,`tud_start_hour`,`tud_end_hour`),
  ADD KEY `active_wed` (`online_hours_active`,`wed_start_hour`,`wed_end_hour`),
  ADD KEY `active_thd` (`online_hours_active`,`thd_start_hour`,`thd_end_hour`),
  ADD KEY `active_frd` (`online_hours_active`,`frd_start_hour`,`frd_end_hour`),
  ADD KEY `active_sad` (`online_hours_active`,`sad_start_hour`,`sad_end_hour`),
  ADD KEY `active_sud` (`online_hours_active`,`sud_start_hour`,`sud_end_hour`);

--
-- Indexes for table `lh_departament_custom_work_hours`
--
ALTER TABLE `lh_departament_custom_work_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `date_from` (`date_from`),
  ADD KEY `search_active` (`date_from`,`date_to`,`dep_id`);

--
-- Indexes for table `lh_departament_group`
--
ALTER TABLE `lh_departament_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lh_departament_group_member`
--
ALTER TABLE `lh_departament_group_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_group_id` (`dep_group_id`);

--
-- Indexes for table `lh_departament_group_user`
--
ALTER TABLE `lh_departament_group_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_group_id` (`dep_group_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `lh_departament_limit_group`
--
ALTER TABLE `lh_departament_limit_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lh_departament_limit_group_member`
--
ALTER TABLE `lh_departament_limit_group_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_limit_group_id` (`dep_limit_group_id`);

--
-- Indexes for table `lh_faq`
--
ALTER TABLE `lh_faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`),
  ADD KEY `active_url` (`active`,`url`),
  ADD KEY `has_url` (`has_url`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `is_wildcard` (`is_wildcard`);

--
-- Indexes for table `lh_forgotpasswordhash`
--
ALTER TABLE `lh_forgotpasswordhash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lh_group`
--
ALTER TABLE `lh_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled` (`disabled`);

--
-- Indexes for table `lh_grouprole`
--
ALTER TABLE `lh_grouprole`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`role_id`,`group_id`),
  ADD KEY `group_id_primary` (`group_id`);

--
-- Indexes for table `lh_groupuser`
--
ALTER TABLE `lh_groupuser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `group_id_2` (`group_id`,`user_id`);

--
-- Indexes for table `lh_group_work`
--
ALTER TABLE `lh_group_work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `lh_msg`
--
ALTER TABLE `lh_msg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id_id` (`chat_id`,`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `lh_question`
--
ALTER TABLE `lh_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `priority` (`priority`),
  ADD KEY `active_priority` (`active`,`priority`);

--
-- Indexes for table `lh_question_answer`
--
ALTER TABLE `lh_question_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip` (`ip`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `lh_question_option`
--
ALTER TABLE `lh_question_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `lh_question_option_answer`
--
ALTER TABLE `lh_question_option_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `lh_role`
--
ALTER TABLE `lh_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lh_rolefunction`
--
ALTER TABLE `lh_rolefunction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `lh_speech_chat_language`
--
ALTER TABLE `lh_speech_chat_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Indexes for table `lh_speech_language`
--
ALTER TABLE `lh_speech_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lh_speech_language_dialect`
--
ALTER TABLE `lh_speech_language_dialect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `lh_transfer`
--
ALTER TABLE `lh_transfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `transfer_user_id_dep_id` (`transfer_user_id`,`dep_id`),
  ADD KEY `transfer_to_user_id` (`transfer_to_user_id`);

--
-- Indexes for table `lh_userdep`
--
ALTER TABLE `lh_userdep`
  ADD PRIMARY KEY (`id`),
  ADD KEY `last_activity_hide_online_dep_id` (`last_activity`,`hide_online`,`dep_id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `user_id_type` (`user_id`,`type`);

--
-- Indexes for table `lh_users`
--
ALTER TABLE `lh_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hide_online` (`hide_online`),
  ADD KEY `rec_per_req` (`rec_per_req`),
  ADD KEY `email` (`email`),
  ADD KEY `xmpp_username` (`xmpp_username`);

--
-- Indexes for table `lh_users_remember`
--
ALTER TABLE `lh_users_remember`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lh_users_session`
--
ALTER TABLE `lh_users_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_token_device_type` (`device_token`,`device_type`),
  ADD KEY `token` (`token`);

--
-- Indexes for table `lh_users_setting`
--
ALTER TABLE `lh_users_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`identifier`);

--
-- Indexes for table `lh_users_setting_option`
--
ALTER TABLE `lh_users_setting_option`
  ADD PRIMARY KEY (`identifier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lh_abstract_auto_responder`
--
ALTER TABLE `lh_abstract_auto_responder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_abstract_auto_responder_chat`
--
ALTER TABLE `lh_abstract_auto_responder_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_abstract_browse_offer_invitation`
--
ALTER TABLE `lh_abstract_browse_offer_invitation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_abstract_email_template`
--
ALTER TABLE `lh_abstract_email_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `lh_abstract_form`
--
ALTER TABLE `lh_abstract_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_abstract_form_collected`
--
ALTER TABLE `lh_abstract_form_collected`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_abstract_proactive_chat_event`
--
ALTER TABLE `lh_abstract_proactive_chat_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_abstract_proactive_chat_invitation`
--
ALTER TABLE `lh_abstract_proactive_chat_invitation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_abstract_proactive_chat_invitation_event`
--
ALTER TABLE `lh_abstract_proactive_chat_invitation_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_abstract_proactive_chat_variables`
--
ALTER TABLE `lh_abstract_proactive_chat_variables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_abstract_product`
--
ALTER TABLE `lh_abstract_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_abstract_product_departament`
--
ALTER TABLE `lh_abstract_product_departament`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_abstract_rest_api_key`
--
ALTER TABLE `lh_abstract_rest_api_key`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_abstract_survey`
--
ALTER TABLE `lh_abstract_survey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_abstract_survey_item`
--
ALTER TABLE `lh_abstract_survey_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_abstract_widget_theme`
--
ALTER TABLE `lh_abstract_widget_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_admin_theme`
--
ALTER TABLE `lh_admin_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_canned_msg`
--
ALTER TABLE `lh_canned_msg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_canned_msg_tag`
--
ALTER TABLE `lh_canned_msg_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_canned_msg_tag_link`
--
ALTER TABLE `lh_canned_msg_tag_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_chat`
--
ALTER TABLE `lh_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `lh_chatbox`
--
ALTER TABLE `lh_chatbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_chat_accept`
--
ALTER TABLE `lh_chat_accept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_chat_archive_range`
--
ALTER TABLE `lh_chat_archive_range`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_chat_blocked_user`
--
ALTER TABLE `lh_chat_blocked_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_chat_crm_mapping`
--
ALTER TABLE `lh_chat_crm_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `lh_chat_file`
--
ALTER TABLE `lh_chat_file`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_chat_online_user`
--
ALTER TABLE `lh_chat_online_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `lh_chat_online_user_footprint`
--
ALTER TABLE `lh_chat_online_user_footprint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_chat_paid`
--
ALTER TABLE `lh_chat_paid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_cobrowse`
--
ALTER TABLE `lh_cobrowse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_departament`
--
ALTER TABLE `lh_departament`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lh_departament_custom_work_hours`
--
ALTER TABLE `lh_departament_custom_work_hours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_departament_group`
--
ALTER TABLE `lh_departament_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_departament_group_member`
--
ALTER TABLE `lh_departament_group_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_departament_group_user`
--
ALTER TABLE `lh_departament_group_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_departament_limit_group`
--
ALTER TABLE `lh_departament_limit_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_departament_limit_group_member`
--
ALTER TABLE `lh_departament_limit_group_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_faq`
--
ALTER TABLE `lh_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_forgotpasswordhash`
--
ALTER TABLE `lh_forgotpasswordhash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_group`
--
ALTER TABLE `lh_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lh_grouprole`
--
ALTER TABLE `lh_grouprole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lh_groupuser`
--
ALTER TABLE `lh_groupuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lh_group_work`
--
ALTER TABLE `lh_group_work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_msg`
--
ALTER TABLE `lh_msg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT for table `lh_question`
--
ALTER TABLE `lh_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_question_answer`
--
ALTER TABLE `lh_question_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_question_option`
--
ALTER TABLE `lh_question_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_question_option_answer`
--
ALTER TABLE `lh_question_option_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_role`
--
ALTER TABLE `lh_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lh_rolefunction`
--
ALTER TABLE `lh_rolefunction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `lh_speech_chat_language`
--
ALTER TABLE `lh_speech_chat_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_speech_language`
--
ALTER TABLE `lh_speech_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `lh_speech_language_dialect`
--
ALTER TABLE `lh_speech_language_dialect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `lh_transfer`
--
ALTER TABLE `lh_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_userdep`
--
ALTER TABLE `lh_userdep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lh_users`
--
ALTER TABLE `lh_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lh_users_remember`
--
ALTER TABLE `lh_users_remember`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lh_users_session`
--
ALTER TABLE `lh_users_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lh_users_setting`
--
ALTER TABLE `lh_users_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
