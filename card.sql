/*
Navicat MySQL Data Transfer

Source Server         : xxs
Source Server Version : 50154
Source Host           : localhost:3306
Source Database       : card

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2013-01-08 23:41:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `xx_admin`
-- ----------------------------
DROP TABLE IF EXISTS `xx_admin`;
CREATE TABLE `xx_admin` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `is_account_enabled` bit(1) NOT NULL,
  `is_account_expired` bit(1) NOT NULL,
  `is_account_locked` bit(1) NOT NULL,
  `is_credentials_expired` bit(1) NOT NULL,
  `locked_date` datetime DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_failure_count` int(11) NOT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_admin
-- ----------------------------
INSERT INTO `xx_admin` VALUES ('0731dcsoft2010031200000000000017', '2011-01-01 00:00:00', '2013-01-08 23:05:27', '技术部', 'xxs@163.com', '', '', '', '', '2012-12-17 14:28:34', '2013-01-08 23:05:27', '0', '127.0.0.1', 'ADMIN', '21232f297a57a5a743894a0e4a801fc3', 'admin');

-- ----------------------------
-- Table structure for `xx_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `xx_admin_role`;
CREATE TABLE `xx_admin_role` (
  `admin_set_id` varchar(32) NOT NULL,
  `role_set_id` varchar(32) NOT NULL,
  PRIMARY KEY (`admin_set_id`,`role_set_id`),
  KEY `fk_role_admin_set` (`role_set_id`),
  KEY `fk_admin_role_set` (`admin_set_id`),
  CONSTRAINT `fk_admin_role_set` FOREIGN KEY (`admin_set_id`) REFERENCES `xx_admin` (`id`),
  CONSTRAINT `fk_role_admin_set` FOREIGN KEY (`role_set_id`) REFERENCES `xx_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_admin_role
-- ----------------------------
INSERT INTO `xx_admin_role` VALUES ('0731dcsoft2010031200000000000017', '0731dcsoft2010031200000000000016');
INSERT INTO `xx_admin_role` VALUES ('0731dcsoft2010031200000000000017', '4028bc743ac000ea013ac00bc68c0000');

-- ----------------------------
-- Table structure for `xx_article`
-- ----------------------------
DROP TABLE IF EXISTS `xx_article`;
CREATE TABLE `xx_article` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL,
  `hits` int(11) NOT NULL,
  `html_path` varchar(255) NOT NULL,
  `is_publication` bit(1) NOT NULL,
  `is_recommend` bit(1) NOT NULL,
  `is_top` bit(1) NOT NULL,
  `meta_description` longtext,
  `meta_keywords` longtext,
  `page_count` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `article_category_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_article_category` (`article_category_id`),
  CONSTRAINT `fk_article_article_category` FOREIGN KEY (`article_category_id`) REFERENCES `xx_article_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_article
-- ----------------------------
INSERT INTO `xx_article` VALUES ('4028bc743bbb05c2013bbb2611650002', '2012-12-21 09:48:52', '2012-12-21 09:48:52', 'xxs', '新手上路', '0', '/html/201212/62ec638c2cc94115a783d57dc3e995f8.html', '', '', '', '新手上路', '新手上路', '1', '新手上路', '4028bc743bbb05c2013bbb25d49a0000');

-- ----------------------------
-- Table structure for `xx_article_category`
-- ----------------------------
DROP TABLE IF EXISTS `xx_article_category`;
CREATE TABLE `xx_article_category` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `meta_description` longtext,
  `meta_keywords` longtext,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `path` longtext NOT NULL,
  `sign` varchar(255) NOT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sign` (`sign`),
  KEY `fk_article_category_parent` (`parent_id`),
  CONSTRAINT `fk_article_category_parent` FOREIGN KEY (`parent_id`) REFERENCES `xx_article_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_article_category
-- ----------------------------
INSERT INTO `xx_article_category` VALUES ('4028bc743bbb05c2013bbb25d49a0000', '2012-12-21 09:48:36', '2012-12-21 09:48:36', '0', '新手上路', '新手上路', '新手上路', '1', '4028bc743bbb05c2013bbb25d49a0000', 'xs', null);

-- ----------------------------
-- Table structure for `xx_brand`
-- ----------------------------
DROP TABLE IF EXISTS `xx_brand`;
CREATE TABLE `xx_brand` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `introduction` longtext,
  `logo_path` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_brand
-- ----------------------------
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88a15b0f0001', '2012-10-22 21:20:06', '2012-10-31 11:44:30', null, '', '骏网一卡通', '1', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ac6eb10002', '2012-10-22 21:32:12', '2012-10-31 11:49:24', null, '', '盛大卡', '2', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88aca0800003', '2012-10-22 21:32:25', '2012-10-31 11:50:16', null, '', '神州行', '3', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88acc1ef0004', '2012-10-22 21:32:34', '2012-10-31 11:50:55', null, '', '征途卡', '4', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88acef930005', '2012-10-22 21:32:45', '2012-10-22 21:32:45', null, '', 'Q币卡', '5', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ad18e10006', '2012-10-22 21:32:56', '2012-10-22 21:32:56', null, '', '联通卡', '6', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ad3c100007', '2012-10-22 21:33:05', '2012-10-22 21:33:05', null, '', '久游卡', '7', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ad61df0008', '2012-10-22 21:33:15', '2012-10-22 21:33:15', null, '', '易宝e卡通', '8', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ad845a0009', '2012-10-22 21:33:23', '2012-10-22 21:33:23', null, '', '网易卡', '9', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ada7f6000a', '2012-10-22 21:33:33', '2012-10-22 21:33:33', null, '', '完美卡', '10', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88add167000b', '2012-10-22 21:33:43', '2012-10-22 21:33:43', null, '', '搜狐卡', '11', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ae0511000c', '2012-10-22 21:33:56', '2012-10-22 21:33:56', null, '', '电信卡', '12', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ae29c8000d', '2012-10-22 21:34:06', '2012-10-22 21:34:06', null, '', '纵游一卡通', '13', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ae4be5000e', '2012-10-22 21:34:15', '2012-10-22 21:34:15', null, '', '天下一卡通', '14', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ae757d000f', '2012-10-22 21:34:25', '2012-10-22 21:34:25', null, '', '天宏一卡通', '15', '');

-- ----------------------------
-- Table structure for `xx_cards`
-- ----------------------------
DROP TABLE IF EXISTS `xx_cards`;
CREATE TABLE `xx_cards` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `cards_image_store` longtext,
  `cards_sn` varchar(255) NOT NULL,
  `html_path` varchar(255) NOT NULL,
  `introduction` longtext,
  `is_best` bit(1) NOT NULL,
  `is_hot` bit(1) NOT NULL,
  `is_marketable` bit(1) NOT NULL,
  `is_new` bit(1) NOT NULL,
  `is_specification_enabled` bit(1) NOT NULL,
  `meta_description` longtext,
  `meta_keywords` longtext,
  `name` varchar(255) NOT NULL,
  `price` decimal(15,5) NOT NULL,
  `score` int(11) NOT NULL,
  `brand_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cards_sn` (`cards_sn`),
  KEY `fk_cards_brand` (`brand_id`),
  CONSTRAINT `fk_cards_brand` FOREIGN KEY (`brand_id`) REFERENCES `xx_brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_cards
-- ----------------------------
INSERT INTO `xx_cards` VALUES ('4028bc743bb6fee6013bb755fd4b0001', '2012-12-20 16:02:44', '2012-12-20 16:02:44', null, 'SN_B4A01EABE4F9', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡', '', '', '', '', '', 'Q币卡', 'Q币卡', 'Q币卡', '10.00000', '0', '8ae4839c3a887878013a88acef930005');

-- ----------------------------
-- Table structure for `xx_cards_specification`
-- ----------------------------
DROP TABLE IF EXISTS `xx_cards_specification`;
CREATE TABLE `xx_cards_specification` (
  `cards_set_id` varchar(32) NOT NULL,
  `specification_set_id` varchar(32) NOT NULL,
  PRIMARY KEY (`cards_set_id`,`specification_set_id`),
  KEY `fk_specification_cards_set` (`specification_set_id`),
  KEY `fk_specification_set` (`cards_set_id`),
  CONSTRAINT `fk_specification_cards_set` FOREIGN KEY (`specification_set_id`) REFERENCES `xx_specification` (`id`),
  CONSTRAINT `fk_specification_set` FOREIGN KEY (`cards_set_id`) REFERENCES `xx_cards` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_cards_specification
-- ----------------------------
INSERT INTO `xx_cards_specification` VALUES ('4028bc743bb6fee6013bb755fd4b0001', '8ae4839c3a887878013a889ad43a0000');

-- ----------------------------
-- Table structure for `xx_deposit`
-- ----------------------------
DROP TABLE IF EXISTS `xx_deposit`;
CREATE TABLE `xx_deposit` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `balance` decimal(19,2) NOT NULL,
  `credit` decimal(19,2) NOT NULL,
  `debit` decimal(19,2) NOT NULL,
  `deposit_type` int(11) NOT NULL,
  `lossrate` decimal(19,2) DEFAULT NULL,
  `order_sn` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_deposit_member` (`member_id`),
  CONSTRAINT `fk_deposit_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_deposit
-- ----------------------------
INSERT INTO `xx_deposit` VALUES ('297e62b93bd214af013bd21ef38e0003', '2012-12-25 20:52:22', '2012-12-25 20:52:22', '3000.00', '3000.00', '0.00', '2', null, null, null, '8a9182fc3ba86bc8013ba9782de60001');

-- ----------------------------
-- Table structure for `xx_friend_link`
-- ----------------------------
DROP TABLE IF EXISTS `xx_friend_link`;
CREATE TABLE `xx_friend_link` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_friend_link
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_instant_messaging`
-- ----------------------------
DROP TABLE IF EXISTS `xx_instant_messaging`;
CREATE TABLE `xx_instant_messaging` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `instant_messaging_type` int(11) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_instant_messaging
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_leave_message`
-- ----------------------------
DROP TABLE IF EXISTS `xx_leave_message`;
CREATE TABLE `xx_leave_message` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL,
  `ip` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `for_leave_message_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_leave_message_for_message` (`for_leave_message_id`),
  CONSTRAINT `fk_leave_message_for_message` FOREIGN KEY (`for_leave_message_id`) REFERENCES `xx_leave_message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_leave_message
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_log`
-- ----------------------------
DROP TABLE IF EXISTS `xx_log`;
CREATE TABLE `xx_log` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `action_class` varchar(255) NOT NULL,
  `action_method` varchar(255) NOT NULL,
  `info` longtext,
  `ip` varchar(255) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_log
-- ----------------------------
INSERT INTO `xx_log` VALUES ('297e62b93bd214af013bd21a73b40001', '2012-12-25 20:47:27', '2012-12-25 20:47:27', 'net.xxs.action.admin.MemberAction', 'save', '添加会员: 112233', '127.0.0.1', '添加会员', 'admin');
INSERT INTO `xx_log` VALUES ('297e62b93bd214af013bd21ecb720002', '2012-12-25 20:52:11', '2012-12-25 20:52:11', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('297e62b93bd214af013bd21ef4000004', '2012-12-25 20:52:22', '2012-12-25 20:52:22', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743bb257ca013bb264d4be0001', '2012-12-19 17:00:50', '2012-12-19 17:00:50', 'net.xxs.action.admin.CardsCategoryAction', 'save', '添加充值卡分类: 222', '127.0.0.1', '添加充值卡分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743bb6fee6013bb75600b60004', '2012-12-20 16:02:45', '2012-12-20 16:02:45', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: Q币卡', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743bbb05c2013bbb25d5e20001', '2012-12-21 09:48:37', '2012-12-21 09:48:37', 'net.xxs.action.admin.ArticleCategoryAction', 'save', '添加文章分类: 新手上路', '127.0.0.1', '添加文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743bbb05c2013bbb2613390003', '2012-12-21 09:48:52', '2012-12-21 09:48:52', 'net.xxs.action.admin.ArticleAction', 'save', '添加文章: 新手上路', '127.0.0.1', '添加文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c142aaf013c14324c2c0000', '2013-01-07 16:48:26', '2013-01-07 16:48:26', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('8a9182fc3ba86bc8013ba9782e800002', '2012-12-17 23:25:23', '2012-12-17 23:25:23', 'net.xxs.action.admin.MemberAction', 'save', '添加会员: 123123', '127.0.0.1', '添加会员', 'admin');
INSERT INTO `xx_log` VALUES ('8a9182fc3ba86bc8013ba97939a00004', '2012-12-17 23:26:32', '2012-12-17 23:26:32', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('8ae484093bd1e9bd013bd2053e570001', '2012-12-25 20:24:17', '2012-12-25 20:24:17', 'net.xxs.action.admin.OrderAction', 'completed', '订单编号: DD100037', '127.0.0.1', '订单完成', 'admin');

-- ----------------------------
-- Table structure for `xx_member`
-- ----------------------------
DROP TABLE IF EXISTS `xx_member`;
CREATE TABLE `xx_member` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `deposit` decimal(15,5) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `is_account_enabled` bit(1) NOT NULL,
  `is_account_locked` bit(1) NOT NULL,
  `locked_date` datetime DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_failure_count` int(11) NOT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `member_attribute_value0` varchar(255) DEFAULT NULL,
  `member_attribute_value1` varchar(255) DEFAULT NULL,
  `member_attribute_value10` varchar(255) DEFAULT NULL,
  `member_attribute_value11` varchar(255) DEFAULT NULL,
  `member_attribute_value12` varchar(255) DEFAULT NULL,
  `member_attribute_value13` varchar(255) DEFAULT NULL,
  `member_attribute_value14` varchar(255) DEFAULT NULL,
  `member_attribute_value15` varchar(255) DEFAULT NULL,
  `member_attribute_value16` varchar(255) DEFAULT NULL,
  `member_attribute_value17` varchar(255) DEFAULT NULL,
  `member_attribute_value18` varchar(255) DEFAULT NULL,
  `member_attribute_value19` varchar(255) DEFAULT NULL,
  `member_attribute_value2` varchar(255) DEFAULT NULL,
  `member_attribute_value3` varchar(255) DEFAULT NULL,
  `member_attribute_value4` varchar(255) DEFAULT NULL,
  `member_attribute_value5` varchar(255) DEFAULT NULL,
  `member_attribute_value6` varchar(255) DEFAULT NULL,
  `member_attribute_value7` varchar(255) DEFAULT NULL,
  `member_attribute_value8` varchar(255) DEFAULT NULL,
  `member_attribute_value9` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `password_recover_key` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `register_ip` varchar(255) NOT NULL,
  `safe_answer` varchar(255) DEFAULT NULL,
  `safe_question` varchar(255) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `member_rank_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_member_member_rank` (`member_rank_id`),
  CONSTRAINT `fk_member_member_rank` FOREIGN KEY (`member_rank_id`) REFERENCES `xx_member_rank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member
-- ----------------------------
INSERT INTO `xx_member` VALUES ('297e62b93bd214af013bd21a73550000', '2012-12-25 20:47:27', '2013-01-07 16:48:26', '123', '2012-12-27 00:00:00', '0.00000', '123456@qq.com', '0', '', '', null, '2012-12-25 20:47:27', '0', null, '123123', '北京市', null, null, null, null, null, null, null, null, null, null, '111111', '农业银行', '123123123', null, null, null, null, null, '123123', '123123', '4297f44b13955235245b2497399d7a93', null, '123123', '123123', '127.0.0.1', null, null, '0', '112233', '123123', '402881833054c381013054d08bed0001');
INSERT INTO `xx_member` VALUES ('8a9182fc3ba86bc8013ba9782de60001', '2012-12-17 23:25:23', '2013-01-04 09:42:50', null, '2012-12-20 00:00:00', '3000.00000', '123@qq.com', '0', '', '', null, '2013-01-04 09:42:50', '0', '127.0.0.1', '123123', '北京市', null, null, null, null, null, null, null, null, null, null, '12312', '建设银行', '123', null, null, null, null, null, null, '123', '4297f44b13955235245b2497399d7a93', null, null, '112233', '127.0.0.1', null, null, '0', '123123', null, '402881833054c381013054d08bed0001');

-- ----------------------------
-- Table structure for `xx_member_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_attribute`;
CREATE TABLE `xx_member_attribute` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `attribute_type` int(11) DEFAULT NULL,
  `is_enabled` bit(1) NOT NULL,
  `is_required` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `option_store` varchar(255) DEFAULT NULL,
  `order_list` int(11) DEFAULT NULL,
  `property_index` int(11) NOT NULL,
  `system_attribute_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_attribute
-- ----------------------------
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000001', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '姓名', '', '1', '0', '0');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000002', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '性别', '', '2', '1', '1');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000003', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '出生日期', '', '3', '2', '2');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000005', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '地址', '', '4', '3', '3');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000006', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '邮编', '', '5', '4', '4');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000007', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '电话', '', '6', '5', '5');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000008', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '手机', '', '7', '6', '6');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000009', '2011-01-01 00:00:00', '2012-12-08 13:01:19', '0', '', '', '推荐人', '', '8', '7', '7');

-- ----------------------------
-- Table structure for `xx_member_bank`
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_bank`;
CREATE TABLE `xx_member_bank` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `bankcity` varchar(255) NOT NULL,
  `bankdetail` varchar(255) NOT NULL,
  `bankname` varchar(255) NOT NULL,
  `banknum` varchar(255) NOT NULL,
  `is_default` bit(1) NOT NULL,
  `memo` longtext,
  `openname` varchar(255) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `banknum` (`banknum`),
  KEY `fk_member_bank_member` (`member_id`),
  CONSTRAINT `fk_member_bank_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_bank
-- ----------------------------
INSERT INTO `xx_member_bank` VALUES ('', '2013-01-08 14:25:15', '2013-01-08 14:25:12', '郑州', '中信银行北环路', '中信银行', '1876276253753563', '', '1111', '123123', '8a9182fc3ba86bc8013ba9782de60001');

-- ----------------------------
-- Table structure for `xx_member_business`
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_business`;
CREATE TABLE `xx_member_business` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `business_number` varchar(255) NOT NULL,
  `business_type` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `icp` varchar(255) NOT NULL,
  `link_man` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `real_name` varchar(255) NOT NULL,
  `scope` varchar(255) NOT NULL,
  `server_tel` varchar(255) NOT NULL,
  `server_time` varchar(255) DEFAULT NULL,
  `tel` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  `result_type` int(11) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_member_business_member` (`member_id`),
  CONSTRAINT `fk_member_business_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_business
-- ----------------------------
INSERT INTO `xx_member_business` VALUES ('', '2013-01-08 21:45:29', '2013-01-08 21:45:35', '44556544', '上海徐汇区', '万和', '384985988774847', '1', '上海', 'g12312', '张先生', '28384783', '陈晨', '文化娱乐', '2883737', '24小时', '123233423', 'www.baidu.com', '340000', '8a9182fc3ba86bc8013ba9782de60001', '0', null);

-- ----------------------------
-- Table structure for `xx_member_rank`
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_rank`;
CREATE TABLE `xx_member_rank` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `benefits` double NOT NULL,
  `is_default` bit(1) NOT NULL,
  `lossrate` double NOT NULL,
  `name` varchar(255) NOT NULL,
  `preferential_scale` double NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `score` (`score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_rank
-- ----------------------------
INSERT INTO `xx_member_rank` VALUES ('0731dcsoft2010031200000000000010', '2012-12-19 10:52:48', '2012-12-20 16:49:57', '0.01', '', '0.96', '普通会员', '100', '0');
INSERT INTO `xx_member_rank` VALUES ('402881833054c381013054d08bed0001', '2011-01-01 00:00:00', '2012-11-05 09:12:49', '0.01', '', '0.97', '一级会员', '100', '2000');
INSERT INTO `xx_member_rank` VALUES ('402881833054c381013054d0bf800002', '2011-01-01 00:00:00', '2012-12-20 16:48:23', '0.01', '', '0.98', '二级会员', '100', '5000');
INSERT INTO `xx_member_rank` VALUES ('402881833054c381013054d103ec0003', '2011-01-01 00:00:00', '2012-12-20 16:49:57', '0.01', '', '0.99', '三级会员', '100', '10000');

-- ----------------------------
-- Table structure for `xx_message`
-- ----------------------------
DROP TABLE IF EXISTS `xx_message`;
CREATE TABLE `xx_message` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `content` longtext NOT NULL,
  `delete_status` int(11) NOT NULL,
  `is_read` bit(1) NOT NULL,
  `is_save_draftbox` bit(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `from_member_id` varchar(32) DEFAULT NULL,
  `to_member_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_message_from_member` (`from_member_id`),
  KEY `fk_message_to_member` (`to_member_id`),
  CONSTRAINT `fk_message_from_member` FOREIGN KEY (`from_member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `fk_message_to_member` FOREIGN KEY (`to_member_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_message
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `xx_navigation`;
CREATE TABLE `xx_navigation` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `is_blank_target` bit(1) NOT NULL,
  `is_visible` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `navigation_position` int(11) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_navigation
-- ----------------------------
INSERT INTO `xx_navigation` VALUES ('4028bc743bac0d54013bacbb0f14000d', '2012-12-18 14:37:18', '2012-12-18 14:37:18', '', '', '首页', '1', '1', '${base}/');
INSERT INTO `xx_navigation` VALUES ('4028bc743bac0d54013bacbb688e000e', '2012-12-18 14:37:41', '2012-12-21 09:49:06', '', '', '新手导航', '0', '1', '${base}/shop/article_list/xs.htm');

-- ----------------------------
-- Table structure for `xx_order`
-- ----------------------------
DROP TABLE IF EXISTS `xx_order`;
CREATE TABLE `xx_order` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `brand_id` varchar(255) NOT NULL,
  `memo` longtext,
  `order_sn` varchar(255) NOT NULL,
  `order_status` int(11) NOT NULL,
  `paid_amount` decimal(15,5) NOT NULL,
  `payment_config_name` varchar(255) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  `payment_config_id` varchar(32) DEFAULT NULL,
  `amount` decimal(15,5) NOT NULL,
  `card_num` varchar(255) NOT NULL,
  `card_pwd` varchar(255) NOT NULL,
  `cards_html_path` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(15,5) NOT NULL,
  `product_sn` varchar(255) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `ret_code` varchar(100) DEFAULT NULL,
  `ret_msg` varchar(100) DEFAULT NULL,
  `payment_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `fk_order_member` (`member_id`),
  KEY `fk_order_payment_config` (`payment_config_id`),
  KEY `fk_order_product` (`product_id`),
  KEY `fk_order_payment` (`payment_id`),
  CONSTRAINT `fk_order_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `fk_order_payment` FOREIGN KEY (`payment_id`) REFERENCES `xx_payment` (`id`),
  CONSTRAINT `fk_order_payment_config` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_payment_config` (`id`),
  CONSTRAINT `fk_order_product` FOREIGN KEY (`product_id`) REFERENCES `xx_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_order
-- ----------------------------
INSERT INTO `xx_order` VALUES ('4028bc743bca84a6013bca9af94a0000', '2012-12-24 09:50:52', '2012-12-24 09:50:52', '8ae4839c3a887878013a88acef930005', null, 'DD100029', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '12341234', '12341234', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743bcab079013bcab1423f0000', '2012-12-24 10:15:12', '2012-12-24 10:15:13', '8ae4839c3a887878013a88acef930005', null, 'DD100030', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '55555', '55555', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2002', '不支持该类卡或该面值', null);
INSERT INTO `xx_order` VALUES ('4028bc743bcab079013bcab97b590003', '2012-12-24 10:24:11', '2012-12-24 10:24:11', '8ae4839c3a887878013a88acef930005', null, 'DD100031', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '55555', '55555', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2002', '不支持该类卡或该面值', null);
INSERT INTO `xx_order` VALUES ('4028bc743bcab079013bcabd28540006', '2012-12-24 10:28:12', '2012-12-24 10:28:12', '8ae4839c3a887878013a88acef930005', null, 'DD100032', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '55555', '55555', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2002', '不支持该类卡或该面值', null);
INSERT INTO `xx_order` VALUES ('4028bc743bcab079013bcabd7d690009', '2012-12-24 10:28:34', '2012-12-24 10:28:34', '8ae4839c3a887878013a88acef930005', null, 'DD100033', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '55555', '55555', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2002', '不支持该类卡或该面值', null);
INSERT INTO `xx_order` VALUES ('4028bc743bcab079013bcabe649c000c', '2012-12-24 10:29:33', '2012-12-24 10:29:33', '8ae4839c3a887878013a88acef930005', null, 'DD100034', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '55555', '55555', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2002', '不支持该类卡或该面值', null);
INSERT INTO `xx_order` VALUES ('4028bc743bcab079013bcabec0c6000f', '2012-12-24 10:29:57', '2012-12-24 10:29:57', '8ae4839c3a887878013a88acef930005', null, 'DD100035', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '55555', '55555', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2002', '不支持该类卡或该面值', null);
INSERT INTO `xx_order` VALUES ('4028bc743bcab079013bcabef8600012', '2012-12-24 10:30:11', '2012-12-24 10:30:11', '8ae4839c3a887878013a88acef930005', null, 'DD100036', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '55555', '55555', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2002', '不支持该类卡或该面值', null);
INSERT INTO `xx_order` VALUES ('4028bc743bcab079013bcad62b670015', '2012-12-24 10:55:31', '2012-12-25 20:24:17', '8ae4839c3a887878013a88acef930005', null, 'DD100037', '2', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '55555', '55555', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2002', '不支持该类卡或该面值', null);
INSERT INTO `xx_order` VALUES ('4028bc743bd4d1f6013bd4fec8a70002', '2012-12-26 10:16:05', '2012-12-26 10:16:05', '8ae4839c3a887878013a88acef930005', null, 'DD100040', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '45645', '45645', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743bd4d1f6013bd502b3b50005', '2012-12-26 10:20:22', '2012-12-26 10:20:22', '8ae4839c3a887878013a88acef930005', null, 'DD100041', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '45645', '45645', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743bd4d1f6013bd5336c8c0008', '2012-12-26 11:13:35', '2012-12-26 11:13:35', '8ae4839c3a887878013a88acef930005', null, 'DD100042', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '3453456', '34534534', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743bd4d1f6013bd538b593000b', '2012-12-26 11:19:21', '2012-12-26 11:19:21', '8ae4839c3a887878013a88acef930005', null, 'DD100043', '0', '0.00000', '通道2', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '6666', '4456456', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743bdf8efc013bdf91436e0000', '2012-12-28 11:32:17', '2012-12-28 11:32:17', '8ae4839c3a887878013a88acef930005', null, 'DD100048', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '67867867', '678678', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2002', '不支持该类卡或该面值', null);
INSERT INTO `xx_order` VALUES ('4028bc743bdf8efc013bdf98c1180003', '2012-12-28 11:40:28', '2012-12-28 11:40:41', '8ae4839c3a887878013a88acef930005', null, 'DD100049', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '9999', '9999', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2014', '不存在该笔订单', '4028bc743bdf8efc013bdf98c1c40005');
INSERT INTO `xx_order` VALUES ('8a9181603bd77698013bd7806e290000', '2012-12-26 21:56:56', '2012-12-26 21:56:57', '8ae4839c3a887878013a88acef930005', null, 'DD100044', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '88888', '88888', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2002', '不支持该类卡或该面值', null);
INSERT INTO `xx_order` VALUES ('8a9181603bd7af5a013bd7b298ef0000', '2012-12-26 22:51:44', '2012-12-26 22:51:45', '8ae4839c3a887878013a88acef930005', null, 'DD100045', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '99999999', '999999999', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2002', '不支持该类卡或该面值', null);
INSERT INTO `xx_order` VALUES ('8a9181603bd7af5a013bd7b74b9a0003', '2012-12-26 22:56:52', '2012-12-26 22:56:52', '8ae4839c3a887878013a88acef930005', null, 'DD100046', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '456745', '45645', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2002', '不支持该类卡或该面值', null);
INSERT INTO `xx_order` VALUES ('8a9181603bd7cbae013bd7d179600000', '2012-12-26 23:25:27', '2012-12-26 23:25:33', '8ae4839c3a887878013a88acef930005', null, 'DD100047', '0', '0.00000', '通道1', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '66666', '66666', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2002', '不支持该类卡或该面值', null);
INSERT INTO `xx_order` VALUES ('8a9183cb3bbd9ec5013bbda34a1c0003', '2012-12-21 21:24:53', '2012-12-21 21:24:53', '8ae4839c3a887878013a88acef930005', null, 'DD100004', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '23234', '232342', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8a9183cb3bbd9ec5013bbdab82150005', '2012-12-21 21:33:52', '2012-12-21 21:33:52', '8ae4839c3a887878013a88acef930005', null, 'DD100005', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '23234', '232342', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8a9183cb3bbd9ec5013bbdba7b340007', '2012-12-21 21:50:13', '2012-12-21 21:50:13', '8ae4839c3a887878013a88acef930005', null, 'DD100006', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '23234', '232342', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8a9183cb3bbd9ec5013bbdbc5fc30009', '2012-12-21 21:52:17', '2012-12-21 21:52:17', '8ae4839c3a887878013a88acef930005', null, 'DD100007', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '23234', '232342', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8a9183cb3bbd9ec5013bbdbfb2e4000d', '2012-12-21 21:55:55', '2012-12-21 21:55:55', '8ae4839c3a887878013a88acef930005', null, 'DD100008', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '567', '444', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc83cca013bc84710660000', '2012-12-23 22:59:58', '2012-12-23 22:59:58', '8ae4839c3a887878013a88acef930005', null, 'DD100009', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '777', '777', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc83cca013bc84c08780002', '2012-12-23 23:05:24', '2012-12-23 23:05:24', '8ae4839c3a887878013a88acef930005', null, 'DD100010', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '756', '567', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc83cca013bc84eb4a30005', '2012-12-23 23:08:19', '2012-12-23 23:08:19', '8ae4839c3a887878013a88acef930005', null, 'DD100011', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '222333', '2222333', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc83cca013bc84f95e00008', '2012-12-23 23:09:17', '2012-12-23 23:09:17', '8ae4839c3a887878013a88acef930005', null, 'DD100012', '0', '0.00000', '易宝非银行卡支付(专业版)', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '345345', '345345', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc83cca013bc8539cfd000b', '2012-12-23 23:13:41', '2012-12-23 23:13:41', '8ae4839c3a887878013a88acef930005', null, 'DD100013', '0', '0.00000', '易宝非银行卡支付(专业版)', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '8888', '8888', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc83cca013bc85662ac000e', '2012-12-23 23:16:42', '2012-12-23 23:16:42', '8ae4839c3a887878013a88acef930005', null, 'DD100014', '0', '0.00000', '易宝非银行卡支付(专业版)', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '666', '6666', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc85832013bc85bc9ee0000', '2012-12-23 23:22:36', '2012-12-23 23:22:36', '8ae4839c3a887878013a88acef930005', null, 'DD100015', '0', '0.00000', '易宝非银行卡支付(专业版)', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '567577', '567567', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc85832013bc862c01c0003', '2012-12-23 23:30:13', '2012-12-23 23:30:13', '8ae4839c3a887878013a88acef930005', null, 'DD100016', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '4563456', '5463456', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc85832013bc866a6490006', '2012-12-23 23:34:28', '2012-12-23 23:34:28', '8ae4839c3a887878013a88acef930005', null, 'DD100017', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '5675', '56756', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc85832013bc8682bc80009', '2012-12-23 23:36:08', '2012-12-23 23:36:08', '8ae4839c3a887878013a88acef930005', null, 'DD100018', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '3453456', '35463456', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc85832013bc86930c9000c', '2012-12-23 23:37:15', '2012-12-23 23:37:15', '8ae4839c3a887878013a88acef930005', null, 'DD100019', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '4356345', '345645', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc85832013bc86a28d9000f', '2012-12-23 23:38:18', '2012-12-23 23:38:18', '8ae4839c3a887878013a88acef930005', null, 'DD100020', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '546356', '3546354', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc85832013bc86be6f70012', '2012-12-23 23:40:12', '2012-12-23 23:40:12', '8ae4839c3a887878013a88acef930005', null, 'DD100021', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '45645', '456456', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc85832013bc86d1e3e0015', '2012-12-23 23:41:32', '2012-12-23 23:41:32', '8ae4839c3a887878013a88acef930005', null, 'DD100022', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '24352345', '23452345', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc85832013bc870e8a90018', '2012-12-23 23:45:41', '2012-12-23 23:45:41', '8ae4839c3a887878013a88acef930005', null, 'DD100023', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '3546354', '34563456', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc85832013bc874b16d001b', '2012-12-23 23:49:49', '2012-12-23 23:49:49', '8ae4839c3a887878013a88acef930005', null, 'DD100024', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '3452345', '2435234', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc85832013bc87714d9001e', '2012-12-23 23:52:25', '2012-12-23 23:52:25', '8ae4839c3a887878013a88acef930005', null, 'DD100025', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '888', '8888', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc85832013bc878835b0021', '2012-12-23 23:53:59', '2012-12-23 23:53:59', '8ae4839c3a887878013a88acef930005', null, 'DD100026', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '234123', '12341234', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc85832013bc87a56ab0024', '2012-12-23 23:55:59', '2012-12-23 23:55:59', '8ae4839c3a887878013a88acef930005', null, 'DD100027', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '2334', '234234', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', null, null, null);
INSERT INTO `xx_order` VALUES ('8ae480e73bc85832013bc87bd2120027', '2012-12-23 23:57:36', '2012-12-23 23:57:37', '8ae4839c3a887878013a88acef930005', null, 'DD100028', '0', '0.00000', '殴飞消耗点卡接口', '0', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '45645', '456456', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2002', '不支持该类卡或该面值', null);

-- ----------------------------
-- Table structure for `xx_order_log`
-- ----------------------------
DROP TABLE IF EXISTS `xx_order_log`;
CREATE TABLE `xx_order_log` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `info` longtext,
  `operator` varchar(255) DEFAULT NULL,
  `order_log_type` int(11) NOT NULL,
  `order_sn` varchar(255) NOT NULL,
  `order_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_log_order` (`order_id`),
  CONSTRAINT `fk_order_log_order` FOREIGN KEY (`order_id`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_order_log
-- ----------------------------
INSERT INTO `xx_order_log` VALUES ('4028bc743bca84a6013bca9af9b70001', '2012-12-24 09:50:52', '2012-12-24 09:50:52', null, null, '0', 'DD100029', '4028bc743bca84a6013bca9af94a0000');
INSERT INTO `xx_order_log` VALUES ('4028bc743bcab079013bcab1425e0001', '2012-12-24 10:15:12', '2012-12-24 10:15:12', null, null, '0', 'DD100030', '4028bc743bcab079013bcab1423f0000');
INSERT INTO `xx_order_log` VALUES ('4028bc743bcab079013bcab97b780004', '2012-12-24 10:24:11', '2012-12-24 10:24:11', null, null, '0', 'DD100031', '4028bc743bcab079013bcab97b590003');
INSERT INTO `xx_order_log` VALUES ('4028bc743bcab079013bcabd28920007', '2012-12-24 10:28:12', '2012-12-24 10:28:12', null, null, '0', 'DD100032', '4028bc743bcab079013bcabd28540006');
INSERT INTO `xx_order_log` VALUES ('4028bc743bcab079013bcabd7da7000a', '2012-12-24 10:28:34', '2012-12-24 10:28:34', null, null, '0', 'DD100033', '4028bc743bcab079013bcabd7d690009');
INSERT INTO `xx_order_log` VALUES ('4028bc743bcab079013bcabe64bc000d', '2012-12-24 10:29:33', '2012-12-24 10:29:33', null, null, '0', 'DD100034', '4028bc743bcab079013bcabe649c000c');
INSERT INTO `xx_order_log` VALUES ('4028bc743bcab079013bcabec0e50010', '2012-12-24 10:29:57', '2012-12-24 10:29:57', null, null, '0', 'DD100035', '4028bc743bcab079013bcabec0c6000f');
INSERT INTO `xx_order_log` VALUES ('4028bc743bcab079013bcabef8800013', '2012-12-24 10:30:11', '2012-12-24 10:30:11', null, null, '0', 'DD100036', '4028bc743bcab079013bcabef8600012');
INSERT INTO `xx_order_log` VALUES ('4028bc743bcab079013bcad62b960016', '2012-12-24 10:55:31', '2012-12-24 10:55:31', null, null, '0', 'DD100037', '4028bc743bcab079013bcad62b670015');
INSERT INTO `xx_order_log` VALUES ('4028bc743bd4d1f6013bd4fec9150003', '2012-12-26 10:16:05', '2012-12-26 10:16:05', null, null, '0', 'DD100040', '4028bc743bd4d1f6013bd4fec8a70002');
INSERT INTO `xx_order_log` VALUES ('4028bc743bd4d1f6013bd502b3f30006', '2012-12-26 10:20:22', '2012-12-26 10:20:22', null, null, '0', 'DD100041', '4028bc743bd4d1f6013bd502b3b50005');
INSERT INTO `xx_order_log` VALUES ('4028bc743bd4d1f6013bd5336d470009', '2012-12-26 11:13:35', '2012-12-26 11:13:35', null, null, '0', 'DD100042', '4028bc743bd4d1f6013bd5336c8c0008');
INSERT INTO `xx_order_log` VALUES ('4028bc743bd4d1f6013bd538b5b2000c', '2012-12-26 11:19:21', '2012-12-26 11:19:21', null, null, '0', 'DD100043', '4028bc743bd4d1f6013bd538b593000b');
INSERT INTO `xx_order_log` VALUES ('4028bc743bdf8efc013bdf91439d0001', '2012-12-28 11:32:17', '2012-12-28 11:32:17', null, null, '0', 'DD100048', '4028bc743bdf8efc013bdf91436e0000');
INSERT INTO `xx_order_log` VALUES ('4028bc743bdf8efc013bdf98c1470004', '2012-12-28 11:40:28', '2012-12-28 11:40:28', null, null, '0', 'DD100049', '4028bc743bdf8efc013bdf98c1180003');
INSERT INTO `xx_order_log` VALUES ('8a9181603bd77698013bd7806eae0001', '2012-12-26 21:56:56', '2012-12-26 21:56:56', null, null, '0', 'DD100044', '8a9181603bd77698013bd7806e290000');
INSERT INTO `xx_order_log` VALUES ('8a9181603bd7af5a013bd7b2998d0001', '2012-12-26 22:51:44', '2012-12-26 22:51:44', null, null, '0', 'DD100045', '8a9181603bd7af5a013bd7b298ef0000');
INSERT INTO `xx_order_log` VALUES ('8a9181603bd7af5a013bd7b74c750004', '2012-12-26 22:56:52', '2012-12-26 22:56:52', null, null, '0', 'DD100046', '8a9181603bd7af5a013bd7b74b9a0003');
INSERT INTO `xx_order_log` VALUES ('8a9181603bd7cbae013bd7d17a340001', '2012-12-26 23:25:27', '2012-12-26 23:25:27', null, null, '0', 'DD100047', '8a9181603bd7cbae013bd7d179600000');
INSERT INTO `xx_order_log` VALUES ('8a9183cb3bbd9ec5013bbda34a6e0004', '2012-12-21 21:24:53', '2012-12-21 21:24:53', null, null, '0', 'DD100004', '8a9183cb3bbd9ec5013bbda34a1c0003');
INSERT INTO `xx_order_log` VALUES ('8a9183cb3bbd9ec5013bbdab82410006', '2012-12-21 21:33:52', '2012-12-21 21:33:52', null, null, '0', 'DD100005', '8a9183cb3bbd9ec5013bbdab82150005');
INSERT INTO `xx_order_log` VALUES ('8a9183cb3bbd9ec5013bbdba7b8d0008', '2012-12-21 21:50:13', '2012-12-21 21:50:13', null, null, '0', 'DD100006', '8a9183cb3bbd9ec5013bbdba7b340007');
INSERT INTO `xx_order_log` VALUES ('8a9183cb3bbd9ec5013bbdbc6019000a', '2012-12-21 21:52:17', '2012-12-21 21:52:17', null, null, '0', 'DD100007', '8a9183cb3bbd9ec5013bbdbc5fc30009');
INSERT INTO `xx_order_log` VALUES ('8a9183cb3bbd9ec5013bbdbfb320000e', '2012-12-21 21:55:55', '2012-12-21 21:55:55', null, null, '0', 'DD100008', '8a9183cb3bbd9ec5013bbdbfb2e4000d');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc83cca013bc84710cd0001', '2012-12-23 22:59:58', '2012-12-23 22:59:58', null, null, '0', 'DD100009', '8ae480e73bc83cca013bc84710660000');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc83cca013bc84c08e30003', '2012-12-23 23:05:24', '2012-12-23 23:05:24', null, null, '0', 'DD100010', '8ae480e73bc83cca013bc84c08780002');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc83cca013bc84eb5910006', '2012-12-23 23:08:19', '2012-12-23 23:08:19', null, null, '0', 'DD100011', '8ae480e73bc83cca013bc84eb4a30005');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc83cca013bc84f966c0009', '2012-12-23 23:09:17', '2012-12-23 23:09:17', null, null, '0', 'DD100012', '8ae480e73bc83cca013bc84f95e00008');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc83cca013bc8539d42000c', '2012-12-23 23:13:41', '2012-12-23 23:13:41', null, null, '0', 'DD100013', '8ae480e73bc83cca013bc8539cfd000b');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc83cca013bc85662f5000f', '2012-12-23 23:16:42', '2012-12-23 23:16:42', null, null, '0', 'DD100014', '8ae480e73bc83cca013bc85662ac000e');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc85832013bc85bca390001', '2012-12-23 23:22:36', '2012-12-23 23:22:36', null, null, '0', 'DD100015', '8ae480e73bc85832013bc85bc9ee0000');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc85832013bc862c07d0004', '2012-12-23 23:30:13', '2012-12-23 23:30:13', null, null, '0', 'DD100016', '8ae480e73bc85832013bc862c01c0003');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc85832013bc866a68c0007', '2012-12-23 23:34:28', '2012-12-23 23:34:28', null, null, '0', 'DD100017', '8ae480e73bc85832013bc866a6490006');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc85832013bc8682c1f000a', '2012-12-23 23:36:08', '2012-12-23 23:36:08', null, null, '0', 'DD100018', '8ae480e73bc85832013bc8682bc80009');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc85832013bc8693151000d', '2012-12-23 23:37:15', '2012-12-23 23:37:15', null, null, '0', 'DD100019', '8ae480e73bc85832013bc86930c9000c');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc85832013bc86a29450010', '2012-12-23 23:38:18', '2012-12-23 23:38:18', null, null, '0', 'DD100020', '8ae480e73bc85832013bc86a28d9000f');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc85832013bc86be73b0013', '2012-12-23 23:40:12', '2012-12-23 23:40:12', null, null, '0', 'DD100021', '8ae480e73bc85832013bc86be6f70012');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc85832013bc86d1e750016', '2012-12-23 23:41:32', '2012-12-23 23:41:32', null, null, '0', 'DD100022', '8ae480e73bc85832013bc86d1e3e0015');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc85832013bc870e9460019', '2012-12-23 23:45:41', '2012-12-23 23:45:41', null, null, '0', 'DD100023', '8ae480e73bc85832013bc870e8a90018');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc85832013bc874b1b9001c', '2012-12-23 23:49:49', '2012-12-23 23:49:49', null, null, '0', 'DD100024', '8ae480e73bc85832013bc874b16d001b');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc85832013bc8771582001f', '2012-12-23 23:52:25', '2012-12-23 23:52:25', null, null, '0', 'DD100025', '8ae480e73bc85832013bc87714d9001e');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc85832013bc87883d30022', '2012-12-23 23:53:59', '2012-12-23 23:53:59', null, null, '0', 'DD100026', '8ae480e73bc85832013bc878835b0021');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc85832013bc87a56e40025', '2012-12-23 23:55:59', '2012-12-23 23:55:59', null, null, '0', 'DD100027', '8ae480e73bc85832013bc87a56ab0024');
INSERT INTO `xx_order_log` VALUES ('8ae480e73bc85832013bc87bd2840028', '2012-12-23 23:57:36', '2012-12-23 23:57:36', null, null, '0', 'DD100028', '8ae480e73bc85832013bc87bd2120027');
INSERT INTO `xx_order_log` VALUES ('8ae484093bd1e9bd013bd2053e270000', '2012-12-25 20:24:17', '2012-12-25 20:24:17', '订单完成,获得积分: ', 'admin', '3', 'DD100037', '4028bc743bcab079013bcad62b670015');

-- ----------------------------
-- Table structure for `xx_payment`
-- ----------------------------
DROP TABLE IF EXISTS `xx_payment`;
CREATE TABLE `xx_payment` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `bank_account` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `memo` longtext,
  `operator` varchar(255) DEFAULT NULL,
  `payer` varchar(255) DEFAULT NULL,
  `payment_config_name` varchar(255) NOT NULL,
  `payment_sn` varchar(255) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `amount` decimal(15,5) NOT NULL,
  `deposit_id` varchar(32) DEFAULT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  `payment_config_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_sn` (`payment_sn`),
  KEY `fk_payment_member` (`member_id`),
  KEY `fk_payment_deposit` (`deposit_id`),
  KEY `fk_payment_payment_config` (`payment_config_id`),
  CONSTRAINT `fk_payment_deposit` FOREIGN KEY (`deposit_id`) REFERENCES `xx_deposit` (`id`),
  CONSTRAINT `fk_payment_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `fk_payment_payment_config` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_payment_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_payment
-- ----------------------------
INSERT INTO `xx_payment` VALUES ('4028bc743bcab079013bcab1429c0002', '2012-12-24 10:15:12', '2012-12-24 10:15:12', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100032', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743bcab079013bcab97b880005', '2012-12-24 10:24:11', '2012-12-24 10:24:11', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100033', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743bcab079013bcabd28b10008', '2012-12-24 10:28:12', '2012-12-24 10:28:12', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100034', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743bcab079013bcabd7dc7000b', '2012-12-24 10:28:34', '2012-12-24 10:28:34', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100035', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743bcab079013bcabe64cb000e', '2012-12-24 10:29:33', '2012-12-24 10:29:33', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100036', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743bcab079013bcabec1050011', '2012-12-24 10:29:57', '2012-12-24 10:29:57', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100037', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743bcab079013bcabef89f0014', '2012-12-24 10:30:11', '2012-12-24 10:30:11', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100038', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743bcab079013bcad62ba60017', '2012-12-24 10:55:31', '2012-12-24 10:55:31', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100039', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743bcab079013bcaf83eda0018', '2012-12-24 11:32:44', '2012-12-24 11:32:44', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100040', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743bd4d1f6013bd4fec9340004', '2012-12-26 10:16:05', '2012-12-26 10:16:05', '1', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100041', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('4028bc743bd4d1f6013bd502b4120007', '2012-12-26 10:20:22', '2012-12-26 10:20:22', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100042', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('4028bc743bd4d1f6013bd5336db4000a', '2012-12-26 11:13:35', '2012-12-26 11:13:35', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100043', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('4028bc743bd4d1f6013bd538b600000d', '2012-12-26 11:19:21', '2012-12-26 11:19:21', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '通道2', 'ZF100044', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('4028bc743bdf8efc013bdf9143bc0002', '2012-12-28 11:32:17', '2012-12-28 11:32:17', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100049', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('4028bc743bdf8efc013bdf98c1c40005', '2012-12-28 11:40:28', '2012-12-28 11:40:28', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100050', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8a9181603bd77698013bd7806f080002', '2012-12-26 21:56:56', '2012-12-26 21:56:56', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100045', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8a9181603bd7af5a013bd7b299d30002', '2012-12-26 22:51:44', '2012-12-26 22:51:44', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100046', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8a9181603bd7af5a013bd7b74cca0005', '2012-12-26 22:56:52', '2012-12-26 22:56:52', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100047', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8a9181603bd7cbae013bd7d18f870002', '2012-12-26 23:25:33', '2012-12-26 23:25:33', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '通道1', 'ZF100048', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8a9183cb3bbd9ec5013bbdbf83ae000c', '2012-12-21 21:55:43', '2012-12-21 21:55:43', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100002', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8a9183cb3bbd9ec5013bbdbfbcd8000f', '2012-12-21 21:55:57', '2012-12-21 21:55:57', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100003', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8a9183cb3bbd9ec5013bbdc37b180010', '2012-12-21 22:00:03', '2012-12-21 22:00:03', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100004', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8a9183cb3bbd9ec5013bbdd019580011', '2012-12-21 22:13:50', '2012-12-21 22:13:50', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100005', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8a9183cb3bbd9ec5013bbdd4f54b0012', '2012-12-21 22:19:08', '2012-12-21 22:19:08', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100006', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8a9183cb3bbd9ec5013bbdd56c430013', '2012-12-21 22:19:38', '2012-12-21 22:19:38', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100007', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8a9183cb3bbd9ec5013bbdd5aa9b0014', '2012-12-21 22:19:54', '2012-12-21 22:19:54', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100008', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8a9183cb3bbe2cb3013bbe32449d0000', '2012-12-22 00:01:03', '2012-12-22 00:01:03', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100009', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8a9183cb3bbe2cb3013bbe337e8d0001', '2012-12-22 00:02:24', '2012-12-22 00:02:24', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100010', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8a9183cb3bbe2cb3013bbe34d8d90002', '2012-12-22 00:03:52', '2012-12-22 00:03:52', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100011', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8a9183cb3bbe2cb3013bbe3607f30003', '2012-12-22 00:05:10', '2012-12-22 00:05:10', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100012', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc83cca013bc84df1050004', '2012-12-23 23:07:29', '2012-12-23 23:07:29', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100013', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc83cca013bc84ebd230007', '2012-12-23 23:08:21', '2012-12-23 23:08:21', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100014', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc83cca013bc84fa6ff000a', '2012-12-23 23:09:21', '2012-12-23 23:09:21', '1', '易宝非银行卡支付(专业版)', null, null, '123123', '易宝非银行卡支付(专业版)', 'ZF100015', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc83cca013bc853a5ef000d', '2012-12-23 23:13:43', '2012-12-23 23:13:43', '1', '易宝非银行卡支付(专业版)', null, null, '123123', '易宝非银行卡支付(专业版)', 'ZF100016', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc83cca013bc85679db0010', '2012-12-23 23:16:48', '2012-12-23 23:16:48', '1', '易宝非银行卡支付(专业版)', null, null, '123123', '易宝非银行卡支付(专业版)', 'ZF100017', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc85832013bc85bd73f0002', '2012-12-23 23:22:40', '2012-12-23 23:22:40', '1', '易宝非银行卡支付(专业版)', null, null, '123123', '易宝非银行卡支付(专业版)', 'ZF100018', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc85832013bc862c6b70005', '2012-12-23 23:30:14', '2012-12-23 23:30:14', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100019', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc85832013bc866adae0008', '2012-12-23 23:34:30', '2012-12-23 23:34:30', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100020', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc85832013bc8683293000b', '2012-12-23 23:36:10', '2012-12-23 23:36:10', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100021', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc85832013bc86937c7000e', '2012-12-23 23:37:17', '2012-12-23 23:37:17', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100022', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc85832013bc86a2f030011', '2012-12-23 23:38:20', '2012-12-23 23:38:20', '333', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100023', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc85832013bc86c04680014', '2012-12-23 23:40:20', '2012-12-23 23:40:20', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100024', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc85832013bc86d261e0017', '2012-12-23 23:41:34', '2012-12-23 23:41:34', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100025', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc85832013bc870ef4a001a', '2012-12-23 23:45:42', '2012-12-23 23:45:42', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100026', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc85832013bc874b878001d', '2012-12-23 23:49:50', '2012-12-23 23:49:50', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100027', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc85832013bc8771d540020', '2012-12-23 23:52:27', '2012-12-23 23:52:27', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100028', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc85832013bc8788a010023', '2012-12-23 23:54:01', '2012-12-23 23:54:01', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100029', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc85832013bc87a74310026', '2012-12-23 23:56:06', '2012-12-23 23:56:06', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100030', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');
INSERT INTO `xx_payment` VALUES ('8ae480e73bc85832013bc87bd74b0029', '2012-12-23 23:57:37', '2012-12-23 23:57:37', 'A819109', '殴飞消耗点卡接口', null, null, '123123', '殴飞消耗点卡接口', 'ZF100031', '0', '0', '10.00000', null, '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001');

-- ----------------------------
-- Table structure for `xx_payment_config`
-- ----------------------------
DROP TABLE IF EXISTS `xx_payment_config`;
CREATE TABLE `xx_payment_config` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `bargainor_id` varchar(255) DEFAULT NULL,
  `bargainor_key` varchar(255) DEFAULT NULL,
  `description` longtext,
  `is_default` bit(1) NOT NULL,
  `is_enabled` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `payment_config_type` int(11) NOT NULL,
  `payment_fee` decimal(15,5) NOT NULL,
  `payment_fee_type` int(11) NOT NULL,
  `payment_product_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_payment_config
-- ----------------------------
INSERT INTO `xx_payment_config` VALUES ('4028bc743bac0d54013baca8729d0000', '2012-12-18 14:16:58', '2012-12-26 10:20:14', '10011842896', '09ocl8ku8todssltsgyicyai6p1c0d488kvnh1rt88q0s7sjwq0hb0n3mgi8', '<span style=\"color:#666666;font-family:\'tahoma, Arial, 宋体, Verdana, sans-serif\';\"><span style=\"line-height:25px;\">通道2</span></span>', '', '', '通道2', '2', '2', '0.00000', '0', 'yeepayforzy');
INSERT INTO `xx_payment_config` VALUES ('4028bc743bac0d54013baca8e1350001', '2012-12-18 14:17:27', '2013-01-04 09:57:03', 'A819109', '8B157oSJTv3cmlwXDejSokqbM8b5svsF', '<span style=\"color:#666666;font-family:\'tahoma, Arial, 宋体, Verdana, sans-serif\';\"><span style=\"line-height:25px;\">通道1</span></span>', '', '', '通道1', '1', '2', '0.00000', '0', 'ofpay');

-- ----------------------------
-- Table structure for `xx_payment_discount`
-- ----------------------------
DROP TABLE IF EXISTS `xx_payment_discount`;
CREATE TABLE `xx_payment_discount` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount` decimal(19,4) DEFAULT NULL,
  `memo` longtext,
  `operator` varchar(255) DEFAULT NULL,
  `brand_id` varchar(32) DEFAULT NULL,
  `payment_config_id` varchar(32) DEFAULT NULL,
  `face` longtext,
  PRIMARY KEY (`id`),
  KEY `FK512B8EB9115DF6A7` (`payment_config_id`),
  KEY `fk_payment_discount_payment_config` (`payment_config_id`),
  KEY `fk_payment_Discount_brand` (`brand_id`),
  CONSTRAINT `fk_payment_Discount_brand` FOREIGN KEY (`brand_id`) REFERENCES `xx_brand` (`id`),
  CONSTRAINT `fk_payment_discount_payment_config` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_payment_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_payment_discount
-- ----------------------------
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacaced380003', '2012-12-18 14:21:52', '2012-12-20 16:46:21', '000101', '0.9700', null, 'admin', '8ae4839c3a887878013a88aca0800003', '4028bc743bac0d54013baca8e1350001', '10,20,30,40');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacad51510004', '2012-12-18 14:22:17', '2012-12-18 14:31:35', '000201', '0.9600', null, 'admin', '8ae4839c3a887878013a88ad18e10006', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb048980005', '2012-12-18 14:25:32', '2012-12-18 14:25:32', '000501', '0.8550', null, 'admin', '8ae4839c3a887878013a88a15b0f0001', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb11b0b0006', '2012-12-18 14:26:26', '2012-12-18 14:26:26', '000601', '0.8700', null, 'admin', '8ae4839c3a887878013a88ac6eb10002', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb174950007', '2012-12-18 14:26:49', '2012-12-18 14:26:49', '000701', '0.8150', null, 'admin', '8ae4839c3a887878013a88acef930005', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb1f9550008', '2012-12-18 14:27:23', '2012-12-18 14:27:23', '000801', '0.8500', null, 'admin', '8ae4839c3a887878013a88ada7f6000a', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb2b5140009', '2012-12-18 14:28:11', '2012-12-18 14:28:11', '000901', '0.8500', null, 'admin', '8ae4839c3a887878013a88acc1ef0004', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb31b9e000a', '2012-12-18 14:28:37', '2012-12-18 14:28:37', '001001', '0.8500', null, 'admin', '8ae4839c3a887878013a88ad845a0009', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb3a792000b', '2012-12-18 14:29:13', '2012-12-18 14:29:13', '001101', '0.8550', null, 'admin', '8ae4839c3a887878013a88add167000b', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb4087e000c', '2012-12-18 14:29:38', '2012-12-18 14:29:38', '001201', '0.8200', null, 'admin', '8ae4839c3a887878013a88ad3c100007', '4028bc743bac0d54013baca8e1350001', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc6897e000f', '2012-12-18 14:49:50', '2012-12-18 14:49:50', 'szx-net', '0.9600', null, 'admin', '8ae4839c3a887878013a88ad18e10006', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc6e4410010', '2012-12-18 14:50:13', '2012-12-18 14:50:13', 'unicom-net', '0.9600', null, 'admin', '8ae4839c3a887878013a88ad18e10006', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc74c510011', '2012-12-18 14:50:40', '2012-12-18 14:50:40', 'telecom-net', '0.9600', null, 'admin', '8ae4839c3a887878013a88ae0511000c', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc7e1db0012', '2012-12-18 14:51:18', '2012-12-18 14:51:18', 'junnet-net', '0.8500', null, 'admin', '8ae4839c3a887878013a88a15b0f0001', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc821640013', '2012-12-18 14:51:35', '2012-12-18 14:51:35', 'sndacard-net', '0.8500', null, 'admin', '8ae4839c3a887878013a88ac6eb10002', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc87f340014', '2012-12-18 14:51:59', '2012-12-18 14:51:59', 'zhengtu-net', '0.8500', null, 'admin', '8ae4839c3a887878013a88acc1ef0004', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc8d9d70015', '2012-12-18 14:52:22', '2012-12-18 14:52:22', 'ypcard-net', '0.8900', null, 'admin', '8ae4839c3a887878013a88ad61df0008', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc9340d0016', '2012-12-18 14:52:45', '2012-12-18 14:52:45', 'wanmei-net', '0.8500', null, 'admin', '8ae4839c3a887878013a88ada7f6000a', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc991500017', '2012-12-18 14:53:09', '2012-12-18 14:53:09', 'sohu-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88add167000b', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc9e5a90018', '2012-12-18 14:53:30', '2012-12-18 14:53:30', 'tianxia-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88ae4be5000e', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacca1b400019', '2012-12-18 14:53:44', '2012-12-18 14:53:44', 'zongyou-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88ae29c8000d', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacca6885001a', '2012-12-18 14:54:04', '2012-12-18 14:54:04', 'tianhong-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88ae757d000f', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacca9ec8001b', '2012-12-18 14:54:18', '2012-12-18 14:54:18', 'qqcard-net', '0.8200', null, 'admin', '8ae4839c3a887878013a88acef930005', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013baccae16f001c', '2012-12-18 14:54:35', '2012-12-18 14:54:35', 'jiuyou-net', '0.8100', null, 'admin', '8ae4839c3a887878013a88ad3c100007', '4028bc743bac0d54013baca8729d0000', null);
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013baccb17d0001d', '2012-12-18 14:54:49', '2012-12-18 14:54:49', 'netease-net', '0.8400', null, 'admin', '8ae4839c3a887878013a88ad845a0009', '4028bc743bac0d54013baca8729d0000', null);

-- ----------------------------
-- Table structure for `xx_product`
-- ----------------------------
DROP TABLE IF EXISTS `xx_product`;
CREATE TABLE `xx_product` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `is_default` bit(1) NOT NULL,
  `is_marketable` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(15,5) NOT NULL,
  `product_sn` varchar(255) NOT NULL,
  `specification_value_store` longtext,
  `cards_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_sn` (`product_sn`),
  KEY `fk_product_cards` (`cards_id`),
  CONSTRAINT `fk_product_cards` FOREIGN KEY (`cards_id`) REFERENCES `xx_cards` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_product
-- ----------------------------
INSERT INTO `xx_product` VALUES ('4028bc743bb6fee6013bb755fed20002', '2012-12-20 16:02:44', '2012-12-20 16:02:44', '', '', 'Q币卡 [10元]', '10.00000', 'SN_A18F88A39EA3', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"orderList\":6,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('4028bc743bb6fee6013bb75600880003', '2012-12-20 16:02:45', '2012-12-20 16:02:45', '', '', 'Q币卡 [50元]', '50.00000', 'SN_EA47F87C7C44', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"orderList\":15,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');

-- ----------------------------
-- Table structure for `xx_role`
-- ----------------------------
DROP TABLE IF EXISTS `xx_role`;
CREATE TABLE `xx_role` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `authority_list_store` longtext,
  `description` longtext,
  `is_system` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_role
-- ----------------------------
INSERT INTO `xx_role` VALUES ('0731dcsoft2010031200000000000016', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '[\"ROLE_CARDS\",\"ROLE_CARDS_NOTIFY\",\"ROLE_CARDS_CATEGORY\",\"ROLE_CARDS_TYPE\",\"ROLE_SPECIFICATION\",\"ROLE_BRAND\",\"ROLE_ORDER\",\"ROLE_PAYMENT\",\"ROLE_REFUND\",\"ROLE_SHIPPING\",\"ROLE_RESHIP\",\"ROLE_MEMBER\",\"ROLE_MEMBER_RANK\",\"ROLE_MEMBER_ATTRIBUTE\",\"ROLE_COMMENT\",\"ROLE_LEAVE_MESSAGE\",\"ROLE_NAVIGATION\",\"ROLE_ARTICLEE\",\"ROLE_ARTICLE_CATEGORY\",\"ROLE_FRIEND_LINK\",\"ROLE_PAGE_TEMPLATE\",\"ROLE_MAIL_TEMPLATE\",\"ROLE_PRINT_TEMPLATE\",\"ROLE_CACHE\",\"ROLE_BUILD_HTML\",\"ROLE_ADMIN\",\"ROLE_ROLE\",\"ROLE_MESSAGE\",\"ROLE_LOG\",\"ROLE_SETTING\",\"ROLE_INSTANT_MESSAGING\",\"ROLE_PAYMENT_CONFIG\",\"ROLE_DELIVERY_TYPE\",\"ROLE_AREA\",\"ROLE_DELIVERY_CORP\",\"ROLE_DELIVERY_CENTER\",\"ROLE_DELIVERY_TEMPLATE\",\"ROLE_BASE\"]', '拥有后台管理最高权限', '', '超级管理员');
INSERT INTO `xx_role` VALUES ('4028bc743ac000ea013ac00bc68c0000', '2012-11-02 15:35:28', '2013-01-08 14:17:09', '[\"ROLE_CARDS\",\"ROLE_SPECIFICATION\",\"ROLE_BRAND\",\"ROLE_ORDER\",\"ROLE_WITHDRAW\",\"ROLE_PAYMENT\",\"ROLE_MEMBER\",\"ROLE_MEMBER_RANK\",\"ROLE_MEMBER_ATTRIBUTE\",\"ROLE_MEMBER_BANK\",\"ROLE_MEMBER_BUSINESS\",\"ROLE_LEAVE_MESSAGE\",\"ROLE_NAVIGATION\",\"ROLE_ARTICLEE\",\"ROLE_ARTICLE_CATEGORY\",\"ROLE_FRIEND_LINK\",\"ROLE_PAGE_TEMPLATE\",\"ROLE_MAIL_TEMPLATE\",\"ROLE_CACHE\",\"ROLE_BUILD_HTML\",\"ROLE_ADMIN\",\"ROLE_ROLE\",\"ROLE_MESSAGE\",\"ROLE_LOG\",\"ROLE_SETTING\",\"ROLE_INSTANT_MESSAGING\",\"ROLE_PAYMENT_CONFIG\",\"ROLE_BASE\"]', '', '', '管理员');

-- ----------------------------
-- Table structure for `xx_specification`
-- ----------------------------
DROP TABLE IF EXISTS `xx_specification`;
CREATE TABLE `xx_specification` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `specification_type` int(11) NOT NULL,
  `specification_value_store` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_specification
-- ----------------------------
INSERT INTO `xx_specification` VALUES ('8ae4839c3a887878013a889ad43a0000', '2012-10-22 21:12:59', '2012-10-22 21:12:59', '', '面额', '1', '0', '[{\"name\":\"2元\",\"id\":\"865f79cb441b4d96b78a726da915983a\",\"orderList\":1,\"imagePath\":null},{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"orderList\":2,\"imagePath\":null},{\"name\":\"6元\",\"id\":\"b782681bb2d84adfb44f7f52fc1865fe\",\"orderList\":3,\"imagePath\":null},{\"name\":\"7元\",\"id\":\"5ee91ba755c94429b431e53062103395\",\"orderList\":4,\"imagePath\":null},{\"name\":\"9元\",\"id\":\"a0ac41cf920941f89dac8bf56536cdfb\",\"orderList\":5,\"imagePath\":null},{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"orderList\":6,\"imagePath\":null},{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"orderList\":7,\"imagePath\":null},{\"name\":\"18元\",\"id\":\"ed813458e5554f68b7e0236395813aaa\",\"orderList\":8,\"imagePath\":null},{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"orderList\":9,\"imagePath\":null},{\"name\":\"25元\",\"id\":\"41df081483264e2e961b5139380f4dc8\",\"orderList\":10,\"imagePath\":null},{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"orderList\":11,\"imagePath\":null},{\"name\":\"35元\",\"id\":\"41993db6d27c443cae3fbd8737c2450a\",\"orderList\":12,\"imagePath\":null},{\"name\":\"40元\",\"id\":\"0fb15579801b495aaec443489d1c29d3\",\"orderList\":13,\"imagePath\":null},{\"name\":\"45元\",\"id\":\"ec5ed899785245a8b59156a33a05fc8e\",\"orderList\":14,\"imagePath\":null},{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"orderList\":15,\"imagePath\":null},{\"name\":\"60元\",\"id\":\"bc51a8c55a0448a3b3b0399e2e849dad\",\"orderList\":16,\"imagePath\":null},{\"name\":\"68元\",\"id\":\"e082743847604fc7b877334583949589\",\"orderList\":17,\"imagePath\":null},{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"orderList\":18,\"imagePath\":null},{\"name\":\"120元\",\"id\":\"a5ad7d399b6545a884633fd61a3c1b64\",\"orderList\":19,\"imagePath\":null},{\"name\":\"180元\",\"id\":\"39e664a67acc41efab0412d3d6da6514\",\"orderList\":20,\"imagePath\":null},{\"name\":\"200元\",\"id\":\"ad57f9d532e44555b4c999ecd20b1b1b\",\"orderList\":21,\"imagePath\":null},{\"name\":\"208元\",\"id\":\"754c8ba67078496a9c316d17268c35bb\",\"orderList\":22,\"imagePath\":null},{\"name\":\"250元\",\"id\":\"54c23e4ed7384e9283430df68b8864ec\",\"orderList\":23,\"imagePath\":null},{\"name\":\"300元\",\"id\":\"4025aae4e0964371a22d9227aebd51f3\",\"orderList\":24,\"imagePath\":null},{\"name\":\"350元\",\"id\":\"ac638b8b77cb4cc8847db6da803a8eb5\",\"orderList\":25,\"imagePath\":null},{\"name\":\"468元\",\"id\":\"a7286eec8d63489383732ddc0e941f51\",\"orderList\":26,\"imagePath\":null},{\"name\":\"500元\",\"id\":\"05acf907cd0447218f4e615b83709282\",\"orderList\":27,\"imagePath\":null},{\"name\":\"1000元\",\"id\":\"10fbd47637c941c7ba2b8809c93976ae\",\"orderList\":28,\"imagePath\":null}]');

-- ----------------------------
-- Table structure for `xx_withdraw`
-- ----------------------------
DROP TABLE IF EXISTS `xx_withdraw`;
CREATE TABLE `xx_withdraw` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `lossrate` decimal(19,2) NOT NULL,
  `memo` longtext,
  `message` longtext,
  `money` decimal(19,2) NOT NULL,
  `rememo` longtext,
  `total_money` decimal(19,2) NOT NULL,
  `withdraw_sn` varchar(255) NOT NULL,
  `withdraw_status` int(11) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `withdraw_sn` (`withdraw_sn`),
  KEY `fk_withdraw_member` (`member_id`),
  CONSTRAINT `fk_withdraw_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_withdraw
-- ----------------------------
INSERT INTO `xx_withdraw` VALUES ('297e62b93bd214af013bd21f47430005', '2012-12-25 20:52:43', '2013-01-04 10:07:59', '0.97', '222', '会员自主提现', '20.00', null, '19.40', 'TX100001', '2', '8a9182fc3ba86bc8013ba9782de60001');
