CREATE DATABASE IF NOT EXISTS `si`;
USE `si`;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


-- --------------------------------------------------------

--
-- `si_biller`
--

CREATE TABLE IF NOT EXISTS `si_biller` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer` text COLLATE utf8_unicode_ci,
  `paypal_business_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_notify_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_return_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eway_customer_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `custom_field1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`domain_id`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- `si_cron`
--

CREATE TABLE IF NOT EXISTS `si_cron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recurrence` int(11) NOT NULL,
  `recurrence_type` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `email_biller` int(1) DEFAULT NULL,
  `email_customer` int(1) DEFAULT NULL,
  PRIMARY KEY (`domain_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- `si_cron_log`
--

CREATE TABLE IF NOT EXISTS `si_cron_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `cron_id` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `run_date` date NOT NULL,
  PRIMARY KEY (`domain_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- `si_customers`
--

CREATE TABLE IF NOT EXISTS `si_customers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL DEFAULT '1',
  `attention` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_card_holder_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_card_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_card_expiry_month` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_card_expiry_year` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `custom_field1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`domain_id`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- `si_custom_fields`
--

CREATE TABLE IF NOT EXISTS `si_custom_fields` (
  `cf_id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_custom_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cf_custom_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cf_display` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `domain_id` int(11) NOT NULL,
  PRIMARY KEY (`cf_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- `si_custom_fields`
--

INSERT INTO `si_custom_fields` (`cf_id`, `cf_custom_field`, `cf_custom_label`, `cf_display`, `domain_id`) VALUES
(1, 'biller_cf1', 'ORG ID', '0', 1),
(2, 'biller_cf2', 'VAT ID', '0', 1),
(3, 'biller_cf3', 'TAX', '0', 1),
(4, 'biller_cf4', 'Bank', '0', 1),
(5, 'customer_cf1', 'ORG ID', '0', 1),
(6, 'customer_cf2', 'VAT ID', '0', 1),
(7, 'customer_cf3', 'TAX', '0', 1),
(8, 'customer_cf4', 'Bank', '0', 1),
(9, 'product_cf1', 'Quant. unit (QU)', '0', 1),
(10, 'product_cf2', 'Delivery', '0', 1),
(11, 'product_cf3', '', '0', 1),
(12, 'product_cf4', NULL, '0', 1),
(13, 'invoice_cf1', 'Order', '0', 1),
(14, 'invoice_cf2', 'Date of delivery', '0', 1),
(15, 'invoice_cf3', 'Invoice number', '0', 1),
(16, 'invoice_cf4', '', '0', 1);

-- --------------------------------------------------------

--
-- `si_extensions`
--

CREATE TABLE IF NOT EXISTS `si_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- `si_index`
--

CREATE TABLE IF NOT EXISTS `si_index` (
  `id` int(11) NOT NULL,
  `node` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sub_node` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_node_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain_id` int(11) NOT NULL,
  `year` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- `si_index`
--

INSERT INTO `si_index` (`id`, `node`, `sub_node`, `sub_node_2`, `domain_id`, `year`) VALUES
(0, 'invoice', '1', NULL, 1, NULL),
(0, 'invoice', '4', NULL, 1, NULL),
(0, 'invoice', '2', NULL, 1, NULL),
(0, 'invoice', '3', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- `si_inventory`
--

CREATE TABLE IF NOT EXISTS `si_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(25,6) NOT NULL,
  `cost` decimal(25,6) DEFAULT NULL,
  `date` date NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`domain_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- `si_invoices`
--

CREATE TABLE IF NOT EXISTS `si_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `index_id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL DEFAULT '1',
  `biller_id` int(10) NOT NULL DEFAULT '0',
  `customer_id` int(10) NOT NULL DEFAULT '0',
  `type_id` int(10) NOT NULL DEFAULT '0',
  `preference_id` int(10) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `custom_field1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`domain_id`,`id`),
  KEY `domain_id` (`domain_id`),
  KEY `biller_id` (`biller_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- `si_invoice_items`
--

CREATE TABLE IF NOT EXISTS `si_invoice_items` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) NOT NULL DEFAULT '0',
  `quantity` decimal(25,6) NOT NULL DEFAULT '0.000000',
  `product_id` int(10) DEFAULT '0',
  `unit_price` decimal(25,6) DEFAULT '0.000000',
  `tax_amount` decimal(25,6) DEFAULT '0.000000',
  `gross_total` decimal(25,6) DEFAULT '0.000000',
  `description` text COLLATE utf8_unicode_ci,
  `total` decimal(25,6) DEFAULT '0.000000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=105 ;

-- --------------------------------------------------------

--
-- `si_invoice_item_tax`
--

CREATE TABLE IF NOT EXISTS `si_invoice_item_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_item_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `tax_type` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `tax_rate` decimal(25,6) NOT NULL,
  `tax_amount` decimal(25,6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=285 ;

--
-- `si_invoice_item_tax`
--

INSERT INTO `si_invoice_item_tax` (`id`, `invoice_item_id`, `tax_id`, `tax_type`, `tax_rate`, `tax_amount`) VALUES
(147, 6, 4, '%', 0.000000, 0.000000),
(148, 7, 4, '%', 0.000000, 0.000000),
(149, 8, 4, '%', 0.000000, 0.000000),
(150, 9, 4, '%', 0.000000, 0.000000),
(151, 10, 4, '%', 0.000000, 0.000000),
(152, 11, 4, '%', 0.000000, 0.000000),
(153, 12, 4, '%', 0.000000, 0.000000),
(154, 13, 4, '%', 0.000000, 0.000000),
(155, 14, 4, '%', 0.000000, 0.000000),
(156, 15, 4, '%', 0.000000, 0.000000),
(162, 16, 4, '%', 0.000000, 0.000000),
(165, 17, 4, '%', 0.000000, 0.000000),
(166, 18, 4, '%', 0.000000, 0.000000),
(167, 19, 4, '%', 0.000000, 0.000000),
(168, 20, 4, '%', 0.000000, 0.000000),
(169, 21, 4, '%', 0.000000, 0.000000),
(170, 22, 4, '%', 0.000000, 0.000000),
(171, 23, 4, '%', 0.000000, 0.000000),
(172, 24, 4, '%', 0.000000, 0.000000),
(173, 25, 4, '%', 0.000000, 0.000000),
(174, 26, 4, '%', 0.000000, 0.000000),
(175, 27, 4, '%', 0.000000, 0.000000),
(176, 28, 4, '%', 0.000000, 0.000000),
(157, 29, 4, '%', 0.000000, 0.000000),
(177, 30, 4, '%', 0.000000, 0.000000),
(178, 31, 4, '%', 0.000000, 0.000000),
(179, 32, 4, '%', 0.000000, 0.000000),
(180, 33, 4, '%', 0.000000, 0.000000),
(181, 34, 4, '%', 0.000000, 0.000000),
(182, 35, 4, '%', 0.000000, 0.000000),
(183, 36, 4, '%', 0.000000, 0.000000),
(184, 37, 4, '%', 0.000000, 0.000000),
(185, 38, 4, '%', 0.000000, 0.000000),
(186, 39, 4, '%', 0.000000, 0.000000),
(187, 40, 4, '%', 0.000000, 0.000000),
(188, 41, 4, '%', 0.000000, 0.000000),
(189, 42, 4, '%', 0.000000, 0.000000),
(194, 43, 4, '%', 0.000000, 0.000000),
(195, 44, 4, '%', 0.000000, 0.000000),
(196, 45, 4, '%', 0.000000, 0.000000),
(197, 46, 4, '%', 0.000000, 0.000000),
(198, 47, 4, '%', 0.000000, 0.000000),
(218, 48, 4, '%', 0.000000, 0.000000),
(219, 49, 4, '%', 0.000000, 0.000000),
(220, 50, 4, '%', 0.000000, 0.000000),
(221, 51, 4, '%', 0.000000, 0.000000),
(222, 52, 4, '%', 0.000000, 0.000000),
(223, 53, 4, '%', 0.000000, 0.000000),
(224, 54, 4, '%', 0.000000, 0.000000),
(206, 55, 4, '%', 0.000000, 0.000000),
(207, 56, 4, '%', 0.000000, 0.000000),
(208, 57, 4, '%', 0.000000, 0.000000),
(209, 58, 4, '%', 0.000000, 0.000000),
(230, 65, 4, '%', 0.000000, 0.000000),
(136, 60, 4, '%', 0.000000, 0.000000),
(137, 61, 4, '%', 0.000000, 0.000000),
(139, 62, 4, '%', 0.000000, 0.000000),
(140, 63, 4, '%', 0.000000, 0.000000),
(141, 64, 4, '%', 0.000000, 0.000000),
(231, 66, 4, '%', 0.000000, 0.000000),
(232, 67, 4, '%', 0.000000, 0.000000),
(262, 68, 4, '%', 0.000000, 0.000000),
(277, 69, 4, '%', 0.000000, 0.000000),
(283, 103, 4, '%', 0.000000, 0.000000),
(284, 104, 4, '%', 0.000000, 0.000000);

-- --------------------------------------------------------

--
-- `si_invoice_type`
--

CREATE TABLE IF NOT EXISTS `si_invoice_type` (
  `inv_ty_id` int(11) NOT NULL AUTO_INCREMENT,
  `inv_ty_description` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`inv_ty_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- `si_invoice_type`
--

INSERT INTO `si_invoice_type` (`inv_ty_id`, `inv_ty_description`) VALUES
(1, 'Total'),
(2, 'Itemised'),
(3, 'Consulting');

-- --------------------------------------------------------

--
-- `si_log`
--

CREATE TABLE IF NOT EXISTS `si_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sqlquerie` text COLLATE utf8_unicode_ci NOT NULL,
  `last_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- `si_payment`
--

CREATE TABLE IF NOT EXISTS `si_payment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ac_inv_id` int(11) NOT NULL,
  `ac_amount` decimal(25,6) NOT NULL,
  `ac_notes` text COLLATE utf8_unicode_ci NOT NULL,
  `ac_date` datetime NOT NULL,
  `ac_payment_type` int(10) NOT NULL DEFAULT '1',
  `domain_id` int(11) NOT NULL,
  `online_payment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`domain_id`,`id`),
  KEY `domain_id` (`domain_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- `si_payment_types`
--

CREATE TABLE IF NOT EXISTS `si_payment_types` (
  `pt_id` int(10) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL DEFAULT '1',
  `pt_description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `pt_enabled` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`domain_id`,`pt_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- `si_payment_types`
--

INSERT INTO `si_payment_types` (`pt_id`, `domain_id`, `pt_description`, `pt_enabled`) VALUES
(1, 1, 'Cash', '1'),
(2, 1, 'Bank transfer', '1');

-- --------------------------------------------------------

--
-- `si_preferences`
--

CREATE TABLE IF NOT EXISTS `si_preferences` (
  `pref_id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL DEFAULT '1',
  `pref_description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_currency_sign` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_inv_heading` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_inv_wording` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_inv_detail_heading` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_inv_detail_line` text COLLATE utf8_unicode_ci,
  `pref_inv_payment_method` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_inv_payment_line1_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_inv_payment_line1_value` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_inv_payment_line2_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_inv_payment_line2_value` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_enabled` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `status` int(1) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `index_group` int(11) NOT NULL,
  `currency_code` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `include_online_payment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_position` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`domain_id`,`pref_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- `si_preferences`
--

INSERT INTO `si_preferences` (`pref_id`, `domain_id`, `pref_description`, `pref_currency_sign`, `pref_inv_heading`, `pref_inv_wording`, `pref_inv_detail_heading`, `pref_inv_detail_line`, `pref_inv_payment_method`, `pref_inv_payment_line1_name`, `pref_inv_payment_line1_value`, `pref_inv_payment_line2_name`, `pref_inv_payment_line2_value`, `pref_enabled`, `status`, `locale`, `language`, `index_group`, `currency_code`, `include_online_payment`, `currency_position`) VALUES
(4, 1, 'Delivery', '€', 'Delivery', 'Delivery', 'Details', 'Customer take the product and it show no defect on first moment.', '', '', '', '', '', '1', 0, NULL, NULL, 4, 'EUR', '', 'left'),
(3, 1, 'Promoinvoice', '€', 'Promoinvoice', 'Proposal for Billing', 'Details', '', 'transfer', '', '0308', '', '+2 week', '1', 0, NULL, NULL, 3, 'EUR', '', 'left'),
(1, 1, 'Invoice', '€', 'Invoice', 'The tax certificate', 'Details', '', 'transfer', '', '0308', '', '+2 week', '1', 1, NULL, NULL, 1, 'EUR', '', 'left'),
(2, 1, 'Receipt', '€', 'Receipt', 'Proof of payment', 'Purpose of payment', 'Payment of invoice', 'cash', '', '', '', '', '1', 0, NULL, NULL, 2, 'EUR', '', 'left');

-- --------------------------------------------------------

--
-- `si_products`
--

CREATE TABLE IF NOT EXISTS `si_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `unit_price` decimal(25,6) DEFAULT '0.000000',
  `default_tax_id` int(11) DEFAULT NULL,
  `default_tax_id_2` int(11) DEFAULT NULL,
  `cost` decimal(25,6) DEFAULT '0.000000',
  `reorder_level` int(11) DEFAULT NULL,
  `custom_field1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `enabled` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`domain_id`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- `si_sql_patchmanager`
--

CREATE TABLE IF NOT EXISTS `si_sql_patchmanager` (
  `sql_id` int(11) NOT NULL AUTO_INCREMENT,
  `sql_patch_ref` int(11) NOT NULL,
  `sql_patch` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sql_release` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sql_statement` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sql_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=798 ;

--
-- `si_sql_patchmanager`
--

INSERT INTO `si_sql_patchmanager` (`sql_id`, `sql_patch_ref`, `sql_patch`, `sql_release`, `sql_statement`) VALUES
(547, 201, 'Set domain_id on system defaults table to 1', '20090622', 'UPDATE si_system_defaults SET domain_id = 1'),
(548, 202, 'Set extension_id on system defaults table to 1', '20090622', 'UPDATE si_system_defaults SET extension_id = 1'),
(562, 215, '', '', ''),
(561, 214, '', '', ''),
(560, 213, '', '', ''),
(559, 212, '', '', ''),
(558, 211, '', '', ''),
(557, 210, '', '', ''),
(556, 210, '', '', ''),
(555, 209, '', '', ''),
(554, 208, '', '', ''),
(553, 207, '', '', ''),
(552, 206, '', '', ''),
(551, 205, '', '', ''),
(550, 204, '', '', ''),
(549, 203, 'Move all old consulting style invoices to itemised', '20090704', 'UPDATE si_invoices SET type_id = 2 where type_id = 3'),
(546, 200, 'Update extensions table', '20090529', 'UPDATE si_extensions SET id = 0 WHERE name = core LIMIT 1'),
(545, 199, '', '', ''),
(544, 198, '', '', ''),
(543, 197, '', '', ''),
(542, 196, '', '', ''),
(541, 195, '', '', ''),
(540, 194, '', '', ''),
(539, 193, '', '', ''),
(538, 192, '', '', ''),
(537, 191, '', '', ''),
(536, 190, '', '', ''),
(535, 189, '', '', ''),
(534, 188, '', '', ''),
(533, 187, '', '', ''),
(532, 186, '', '', ''),
(531, 185, '', '', ''),
(530, 184, '', '', ''),
(529, 183, '', '', ''),
(528, 182, '', '', ''),
(527, 181, '', '', ''),
(526, 180, '', '', ''),
(525, 179, '', '', ''),
(524, 178, '', '', ''),
(523, 177, '', '', ''),
(522, 176, '', '', ''),
(521, 175, '', '', ''),
(520, 174, '', '', ''),
(519, 173, '', '', ''),
(518, 172, '', '', ''),
(517, 171, '', '', ''),
(516, 170, '', '', ''),
(515, 169, '', '', ''),
(514, 168, '', '', ''),
(513, 167, '', '', ''),
(512, 166, '', '', ''),
(511, 165, '', '', ''),
(510, 164, '', '', ''),
(509, 163, '', '', ''),
(508, 162, '', '', ''),
(507, 161, '', '', ''),
(506, 160, '', '', ''),
(505, 159, '', '', ''),
(504, 158, '', '', ''),
(503, 157, '', '', ''),
(502, 156, '', '', ''),
(501, 155, '', '', ''),
(500, 154, '', '', ''),
(499, 153, '', '', ''),
(498, 152, '', '', ''),
(497, 151, '', '', ''),
(496, 150, '', '', ''),
(495, 149, '', '', ''),
(494, 148, '', '', ''),
(493, 147, '', '', ''),
(492, 146, '', '', ''),
(491, 145, '', '', ''),
(490, 144, '', '', ''),
(2, 2, '', '', ''),
(1, 1, 'Create sql_patchmanger table', '20060514', 'CREATE TABLE si_sql_patchmanager (sql_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,sql_patch_ref VARCHAR( 50 ) NOT NULL ,sql_patch VARCHAR( 255 ) NOT NULL ,sql_release VARCHAR( 25 ) NOT NULL ,sql_statement TEXT NOT NULL) ENGINE = MYISAM '),
(489, 143, '', '', ''),
(488, 142, '', '', ''),
(487, 141, '', '', ''),
(486, 140, '', '', ''),
(485, 139, '', '', ''),
(484, 138, '', '', ''),
(483, 137, '', '', ''),
(482, 136, '', '', ''),
(481, 135, '', '', ''),
(480, 134, '', '', ''),
(479, 133, '', '', ''),
(478, 132, '', '', ''),
(477, 131, '', '', ''),
(476, 130, '', '', ''),
(475, 129, '', '', ''),
(474, 128, '', '', ''),
(473, 127, '', '', ''),
(472, 126, '', '', ''),
(471, 125, '', '', ''),
(470, 124, '', '', ''),
(469, 123, '', '', ''),
(468, 122, '', '', ''),
(467, 121, '', '', ''),
(466, 120, '', '', ''),
(465, 119, '', '', ''),
(464, 118, '', '', ''),
(463, 117, '', '', ''),
(462, 116, '', '', ''),
(461, 115, '', '', ''),
(460, 114, '', '', ''),
(459, 113, '', '', ''),
(458, 112, '', '', ''),
(457, 111, '', '', ''),
(456, 110, '', '', ''),
(455, 109, '', '', ''),
(454, 108, '', '', ''),
(453, 107, '', '', ''),
(452, 106, '', '', ''),
(451, 105, '', '', ''),
(450, 104, '', '', ''),
(449, 103, '', '', ''),
(448, 102, '', '', ''),
(447, 101, '', '', ''),
(446, 100, '', '', ''),
(445, 99, '', '', ''),
(444, 98, '', '', ''),
(443, 97, '', '', ''),
(442, 96, '', '', ''),
(441, 95, '', '', ''),
(440, 94, '', '', ''),
(439, 93, '', '', ''),
(438, 92, '', '', ''),
(437, 91, '', '', ''),
(436, 90, '', '', ''),
(435, 89, '', '', ''),
(434, 88, '', '', ''),
(433, 87, '', '', ''),
(432, 86, '', '', ''),
(431, 85, '', '', ''),
(430, 84, '', '', ''),
(429, 83, '', '', ''),
(428, 82, '', '', ''),
(427, 81, '', '', ''),
(426, 80, '', '', ''),
(425, 79, '', '', ''),
(424, 78, '', '', ''),
(423, 77, '', '', ''),
(422, 76, '', '', ''),
(421, 75, '', '', ''),
(420, 74, '', '', ''),
(419, 73, '', '', ''),
(418, 72, '', '', ''),
(417, 71, '', '', ''),
(416, 70, '', '', ''),
(415, 69, '', '', ''),
(414, 68, '', '', ''),
(413, 67, '', '', ''),
(412, 66, '', '', ''),
(411, 65, '', '', ''),
(410, 64, '', '', ''),
(407, 61, '', '', ''),
(408, 62, '', '', ''),
(409, 63, '', '', ''),
(404, 58, '', '', ''),
(405, 59, '', '', ''),
(406, 60, '', '', ''),
(400, 54, '', '', ''),
(401, 55, '', '', ''),
(402, 56, '', '', ''),
(403, 57, '', '', ''),
(51, 50, '', '', ''),
(52, 51, '', '', ''),
(53, 52, '', '', ''),
(54, 53, '', '', ''),
(50, 49, '', '', ''),
(49, 48, '', '', ''),
(48, 47, '', '', ''),
(47, 46, '', '', ''),
(46, 45, '', '', ''),
(45, 44, '', '', ''),
(44, 43, '', '', ''),
(43, 42, '', '', ''),
(42, 41, '', '', ''),
(41, 40, '', '', ''),
(40, 39, '', '', ''),
(39, 38, '', '', ''),
(38, 37, '', '', ''),
(37, 0, 'Start', '20060514', ''),
(36, 36, '', '', ''),
(35, 35, '', '', ''),
(34, 34, '', '', ''),
(33, 33, '', '', ''),
(32, 32, '', '', ''),
(31, 31, '', '', ''),
(30, 30, '', '', ''),
(29, 29, '', '', ''),
(28, 28, '', '', ''),
(27, 27, '', '', ''),
(26, 26, '', '', ''),
(25, 25, '', '', ''),
(24, 24, '', '', ''),
(23, 23, '', '', ''),
(22, 22, '', '', ''),
(21, 21, '', '', ''),
(20, 20, '', '', ''),
(19, 19, '', '', ''),
(18, 18, '', '', ''),
(17, 17, '', '', ''),
(16, 16, '', '', ''),
(15, 15, '', '', ''),
(14, 14, '', '', ''),
(13, 13, '', '', ''),
(12, 12, '', '', ''),
(11, 11, '', '', ''),
(10, 10, '', '', ''),
(9, 9, '', '', ''),
(8, 8, '', '', ''),
(7, 7, '', '', ''),
(6, 6, '', '', ''),
(5, 5, '', '', ''),
(4, 4, '', '', ''),
(3, 3, '', '', ''),
(563, 216, '', '', ''),
(564, 217, '', '', ''),
(565, 218, '', '', ''),
(566, 219, '', '', ''),
(567, 220, '', '', ''),
(568, 221, '', '', ''),
(569, 222, '', '', ''),
(570, 223, '', '', ''),
(571, 224, '', '', ''),
(572, 225, '', '', ''),
(573, 226, '', '', ''),
(574, 227, '', '', ''),
(575, 228, '', '', ''),
(576, 229, '', '', ''),
(577, 230, '', '', ''),
(578, 231, '', '', ''),
(579, 232, '', '', ''),
(580, 233, '', '', ''),
(581, 234, '', '', ''),
(582, 235, '', '', ''),
(583, 236, '', '', ''),
(584, 237, '', '', ''),
(585, 238, '', '', ''),
(586, 239, '', '', ''),
(587, 240, '', '', ''),
(588, 241, '', '', ''),
(589, 242, '', '', ''),
(590, 243, '', '', ''),
(591, 244, '', '', ''),
(592, 245, '', '', ''),
(593, 246, '', '', ''),
(594, 247, '', '', ''),
(595, 248, '', '', ''),
(596, 249, '', '', ''),
(597, 250, '', '', ''),
(598, 251, '', '', '');

-- --------------------------------------------------------

--
-- `si_system_defaults`
--

CREATE TABLE IF NOT EXISTS `si_system_defaults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `domain_id` int(5) NOT NULL DEFAULT '0',
  `extension_id` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`domain_id`,`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- `si_system_defaults`
--

INSERT INTO `si_system_defaults` (`id`, `name`, `value`, `domain_id`, `extension_id`) VALUES
(1, 'biller', '2', 1, 1),
(2, 'customer', '0', 1, 1),
(3, 'tax', '4', 1, 1),
(4, 'preference', '1', 1, 1),
(5, 'line_items', '2', 1, 1),
(6, 'template', 'eu_invoice', 1, 1),
(7, 'payment_type', '2', 1, 1),
(8, 'language', 'en_INT', 1, 1),
(9, 'dateformate', 'Y-m-d', 1, 1),
(10, 'spreadsheet', 'xls', 1, 1),
(11, 'wordprocessor', 'doc', 1, 1),
(12, 'pdfscreensize', '800', 1, 1),
(13, 'pdfpapersize', 'A4', 1, 1),
(14, 'pdfleftmargin', '15', 1, 1),
(15, 'pdfrightmargin', '15', 1, 1),
(16, 'pdftopmargin', '15', 1, 1),
(17, 'pdfbottommargin', '15', 1, 1),
(18, 'emailhost', 'localhost', 1, 1),
(19, 'emailusername', '', 1, 1),
(20, 'emailpassword', '', 1, 1),
(21, 'logging', '0', 1, 1),
(22, 'delete', '1', 1, 1),
(23, 'tax_per_line_item', '1', 1, 1),
(24, 'inventory', '0', 1, 1),
(25, 'numbering', '1', 1, 1),
(26, 'suppliers_numbering', '1', 1, 1);

-- --------------------------------------------------------

--
-- `si_tax`
--

CREATE TABLE IF NOT EXISTS `si_tax` (
  `tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_percentage` decimal(25,6) DEFAULT '0.000000',
  `type` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_enabled` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `domain_id` int(11) NOT NULL,
  PRIMARY KEY (`domain_id`,`tax_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- `si_tax`
--

INSERT INTO `si_tax` (`tax_id`, `tax_description`, `tax_percentage`, `type`, `tax_enabled`, `domain_id`) VALUES
(1, 'Discount 10%', -10.000000, '%', '1', 1),
(2, 'Discount 15%', -15.000000, '%', '1', 1),
(3, 'Discount 10€', -10.000000, '€', '1', 1),
(4, 'VAT free', 0.000000, '%', '1', 1),
(5, 'Post', 20.000000, '€', '1', 1),
(6, 'VAT', 20.000000, '%', '1', 1);

-- --------------------------------------------------------

--
-- `si_user`
--

CREATE TABLE IF NOT EXISTS `si_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `domain_id` int(11) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` int(1) NOT NULL,
  PRIMARY KEY (`domain_id`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- `si_user_domain`
--

CREATE TABLE IF NOT EXISTS `si_user_domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- `si_user_domain`
--

INSERT INTO `si_user_domain` (`id`, `name`) VALUES
(1, 'default');

-- --------------------------------------------------------

--
-- `si_user_role`
--

CREATE TABLE IF NOT EXISTS `si_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- `si_user_role`
--

INSERT INTO `si_user_role` (`id`, `name`) VALUES
(1, 'administrator');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
