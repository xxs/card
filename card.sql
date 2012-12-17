/*
Navicat MySQL Data Transfer

Source Server         : JTM
Source Server Version : 50154
Source Host           : localhost:3306
Source Database       : card

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2012-12-17 09:52:17
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
INSERT INTO `xx_admin` VALUES ('0731dcsoft2010031200000000000017', '2011-01-01 00:00:00', '2012-12-17 09:47:22', '技术部', 'xxs@163.com', '', '', '', '', null, '2012-12-17 09:47:22', '0', '127.0.0.1', 'ADMIN', '21232f297a57a5a743894a0e4a801fc3', 'admin');

-- ----------------------------
-- Table structure for `xx_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `xx_admin_role`;
CREATE TABLE `xx_admin_role` (
  `admin_set_id` varchar(32) NOT NULL,
  `role_set_id` varchar(32) NOT NULL,
  PRIMARY KEY (`admin_set_id`,`role_set_id`),
  KEY `xx_role_admin_set` (`role_set_id`),
  KEY `xx_admin_role_set` (`admin_set_id`),
  CONSTRAINT `xx_admin_role_ibfk_1` FOREIGN KEY (`admin_set_id`) REFERENCES `xx_admin` (`id`),
  CONSTRAINT `xx_admin_role_ibfk_2` FOREIGN KEY (`role_set_id`) REFERENCES `xx_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_admin_role
-- ----------------------------
INSERT INTO `xx_admin_role` VALUES ('0731dcsoft2010031200000000000017', '0731dcsoft2010031200000000000016');
INSERT INTO `xx_admin_role` VALUES ('0731dcsoft2010031200000000000017', '4028bc743ac000ea013ac00bc68c0000');

-- ----------------------------
-- Table structure for `xx_area`
-- ----------------------------
DROP TABLE IF EXISTS `xx_area`;
CREATE TABLE `xx_area` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `display_name` text NOT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `path` text NOT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_area_parent` (`parent_id`),
  KEY `xx_area_grade` (`grade`),
  KEY `xx_area_order_list` (`order_list`),
  CONSTRAINT `xx_area_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `xx_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_area
-- ----------------------------
INSERT INTO `xx_area` VALUES ('4028bc743ab4e741013ab534172b0001', '2012-10-31 13:03:40', '2012-10-31 13:03:40', '上海', '0', '上海', '0', '4028bc743ab4e741013ab534172b0001', null);
INSERT INTO `xx_area` VALUES ('4028bc743ab4e741013ab534c7be0002', '2012-10-31 13:04:26', '2012-10-31 13:04:26', '北京', '0', '北京', '0', '4028bc743ab4e741013ab534c7be0002', null);
INSERT INTO `xx_area` VALUES ('4028bc743ab4e741013ab53571d90003', '2012-10-31 13:05:09', '2012-10-31 13:05:09', '上海黄浦区', '1', '黄浦区', '0', '4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003', '4028bc743ab4e741013ab534172b0001');

-- ----------------------------
-- Table structure for `xx_article`
-- ----------------------------
DROP TABLE IF EXISTS `xx_article`;
CREATE TABLE `xx_article` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `hits` int(11) NOT NULL,
  `html_path` varchar(255) NOT NULL,
  `is_publication` bit(1) NOT NULL,
  `is_recommend` bit(1) NOT NULL,
  `is_top` bit(1) NOT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `page_count` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `article_category_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_article_article_category` (`article_category_id`),
  KEY `xx_article_create_date` (`create_date`),
  KEY `xx_article_hits` (`hits`),
  CONSTRAINT `xx_article_ibfk_1` FOREIGN KEY (`article_category_id`) REFERENCES `xx_article_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_article
-- ----------------------------
INSERT INTO `xx_article` VALUES ('8ae4839c3a887878013a88de7a550045', '2012-10-22 22:26:52', '2012-10-22 22:30:34', null, '<ul class=\"help2_right_ul3\" style=\"font-family:微软雅黑, \'microsoft yahei\', 宋体, Tahoma, Verdana, Arial, Helvetica, sans-serif;margin:0px 0px 20px 46px;padding:0px;color:#4b4c4c;list-style:none;width:687px;display:inline;overflow:hidden;line-height:21.600000381469727px;\"><li style=\"width:687px;margin-bottom:20px;float:left;\">充值卡回购交易是双方行为，由第三方专业支付平台验证。因此交易保障也是对双方的保障。 既要保障您提交了正确的充值卡卡号和密码后，我们按照事先约定的回购方案付给您相应的回购款； 也要保障您不会提交错误的充值卡卡号和密码来找我们麻烦。 本站为正规网站，本公司名称“<a href=\"http://baike.baidu.com/view/8467651.htm\" target=\"_blank\" style=\"text-decoration:none;color:#53a0be;\">佛山市路易名臣科技有限公司</a>”已在工商局注册备案,可以进入佛山市工商局网站验证，为您的资金全程护航; 本站仅提供多余充值卡及游戏点卡兑现功能。</li>\r\n<li style=\"width:687px;margin-bottom:20px;float:left;\"><b>我们采取的保障措施包括：</b><ul style=\"margin:0px;padding:0px;list-style:disc;\"><li style=\"width:687px;margin-bottom:20px;float:left;\">&nbsp;&nbsp;&nbsp;●充值卡的卡号和密码交给合法的第三方支付平台进行认证和处理，保证公平性。<br />\r\n&nbsp;&nbsp;&nbsp;●申请提现后，给您打款通过银行的网银系统处理，支付过程透明并且可查询。<br />\r\n&nbsp;&nbsp;&nbsp;●支付回购款之前会通过QQ/MSN等电子通讯方式进行确认，同时留下对话记录作为核对依据。</li>\r\n</ul>\r\n</li>\r\n<li style=\"width:687px;margin-bottom:20px;float:left;\"><b>关于名臣福利网站的保障:</b><ul style=\"margin:0px;padding:0px;list-style:disc;\"><li style=\"width:687px;margin-bottom:20px;float:left;\">&nbsp;&nbsp;&nbsp;●名臣福利网站托管在大型数据中心<a href=\"http://www.west263.com/\" target=\"_blank\" style=\"text-decoration:none;color:#53a0be;\">西部数码</a>的机房 。<br />\r\n&nbsp;&nbsp;&nbsp;●名臣福利网站通过工信部ICP备案，进行了现场网站负责人信息和图像采集。<br />\r\n&nbsp;&nbsp;&nbsp;●名臣福利网站主要通过朋友口碑相传进行推广，神马都是浮云，朋友口碑才最可靠。</li>\r\n</ul>\r\n</li>\r\n</ul>', '2', '/html/201210/3251116bbab5408ebc977c1f1a6648a5.html', '', '', '', '', '', '1', '交易保障', '8ae4839c3a887878013a88dd51d90041');
INSERT INTO `xx_article` VALUES ('8ae4839c3a887878013a88e130050048', '2012-10-22 22:29:50', '2012-11-10 15:20:48', null, '<ul class=\"help2_right_ul3\" style=\"font-family:微软雅黑, \'microsoft yahei\', 宋体, Tahoma, Verdana, Arial, Helvetica, sans-serif;margin:0px 0px 20px 46px;padding:0px;color:#4b4c4c;list-style:none;width:687px;display:inline;overflow:hidden;line-height:21.600000381469727px;\"><li style=\"width:687px;margin-bottom:20px;float:left;font-size:13px;\"><center>佛山市路易名臣科技有限公司</center><center>Foshan Louismansion Technology CO., Ltd.</center></li>\r\n<li style=\"width:687px;margin-bottom:20px;float:left;margin-left:50px;\">地址：中国. 广东省. 佛山市禅城区江湾一路18号西区<br />\r\n邮编：528000<br />\r\n公司网址：<a href=\"http://www.louismansion.com/\" target=\"_blank\" style=\"text-decoration:none;color:#53a0be;\">http://www.lousimansion.com</a><br />\r\n名臣福利网址：<a href=\"http://www.mcfl.cn/\" target=\"_blank\" style=\"text-decoration:none;color:#53a0be;\">http://www.mcfl.cn</a>&nbsp;&nbsp;<a href=\"http://fuli.louismansion.com/\" target=\"_blank\" style=\"text-decoration:none;color:#53a0be;\">http://fuli.louismansion.com</a><br />\r\n全国服务热线：400-611-8420<br />\r\n固话：0757-28615113（佛山）<br />\r\n客 服 QQ：<a href=\"http://wpa.qq.com/msgrd?v=3&amp;uin=854768232&amp;site=qq&amp;menu=yes\" target=\"_blank\" style=\"text-decoration:none;color:#53a0be;\"><img alt=\"点击这里给我发消息\" border=\"0\" src=\"http://wpa.qq.com/pa?p=2:854768232:41\" title=\"点击这里给我发消息\" style=\"border:none;\" /></a>854768232&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"http://wpa.qq.com/msgrd?v=3&amp;uin=554368159&amp;site=qq&amp;menu=yes\" target=\"_blank\" style=\"text-decoration:none;color:#53a0be;\"><img alt=\"点击这里给我发消息\" border=\"0\" src=\"http://wpa.qq.com/pa?p=2:554368159:41\" title=\"点击这里给我发消息\" style=\"border:none;\" /></a>554368159</li>\r\n</ul>', '6', '/html/201210/19a2519b572240bab7b23ba482c6c064.html', '', '', '', '', '', '1', '联系我们', '8ae4839c3a887878013a88dd51d90041');
INSERT INTO `xx_article` VALUES ('8ae4839c3a887878013a88e37619004a', '2012-10-22 22:32:19', '2012-11-18 16:00:28', null, '<ul class=\"help2_right_ul3\" style=\"font-family:微软雅黑, \'microsoft yahei\', 宋体, Tahoma, Verdana, Arial, Helvetica, sans-serif;margin:0px 0px 20px 50px;padding:0px;color:#4b4c4c;list-style:none;width:687px;display:inline;overflow:hidden;line-height:21.600000381469727px;\"><li style=\"width:687px;margin-bottom:0px;float:left;margin-top:0px;background-color:#999999;background-position:initial initial;background-repeat:initial initial;\"><span style=\"text-align:center;width:200px;float:left;height:20px;color:#ffffff;\"><b>卡种类型</b></span><span style=\"text-align:center;width:150px;float:left;height:20px;color:#ffffff;margin-right:50px;\"><b>兑换比率</b></span><span style=\"width:287px;float:left;height:20px;color:#ffffff;\"><b style=\"margin-left:90px;\">支持面值</b></span></li>\r\n<li style=\"width:685px;margin-bottom:0px;float:left;border-bottom-color:#cccccc;border-width:medium 1px 1px;border-style:none solid solid;border-left-color:#cccccc;margin-top:0px;background-color:#fafafa;height:36px;border-right-color:#cccccc;background-position:initial initial;background-repeat:initial initial;\"><span style=\"text-align:center;line-height:36px;width:199px;float:left;height:36px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\"><img alt=\"神州行充值卡\" src=\"http://www.mcfl.cn/statics/attachment/goods/ka/101.jpg\" style=\"border:none;\" /></span><span style=\"text-align:center;line-height:36px;width:149px;float:left;height:36px;color:#ff0000;margin-right:20px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\">96%</span><span style=\"text-align:center;line-height:36px;width:285px;float:left;height:36px;\">10 20 30 50 100 300 500</span></li>\r\n<li style=\"width:685px;margin-bottom:0px;float:left;border-bottom-color:#cccccc;border-width:medium 1px 1px;border-style:none solid solid;border-left-color:#cccccc;margin-top:0px;background-color:#fafafa;height:36px;border-right-color:#cccccc;background-position:initial initial;background-repeat:initial initial;\"><span style=\"text-align:center;line-height:36px;width:199px;float:left;height:36px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\"><img alt=\"联通充值卡\" src=\"http://www.mcfl.cn/statics/attachment/goods/ka/201.jpg\" style=\"border:none;\" /></span><span style=\"text-align:center;line-height:36px;width:149px;float:left;height:36px;color:#ff0000;margin-right:20px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\">96%</span><span style=\"text-align:center;line-height:36px;width:285px;float:left;height:36px;\">10 20 30 50 100 300 500</span></li>\r\n<li style=\"width:685px;margin-bottom:0px;float:left;border-bottom-color:#cccccc;border-width:medium 1px 1px;border-style:none solid solid;border-left-color:#cccccc;margin-top:0px;background-color:#fafafa;height:36px;border-right-color:#cccccc;background-position:initial initial;background-repeat:initial initial;\"><span style=\"text-align:center;line-height:36px;width:199px;float:left;height:36px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\"><img alt=\"电信充值卡\" src=\"http://www.mcfl.cn/statics/attachment/goods/ka/301.jpg\" style=\"border:none;\" /></span><span style=\"text-align:center;line-height:36px;width:149px;float:left;height:36px;color:#ff0000;margin-right:20px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\">96%</span><span style=\"text-align:center;line-height:36px;width:285px;float:left;height:36px;\">50 100</span></li>\r\n<li style=\"width:685px;margin-bottom:0px;float:left;border-bottom-color:#cccccc;border-width:medium 1px 1px;border-style:none solid solid;border-left-color:#cccccc;margin-top:0px;background-color:#fafafa;height:36px;border-right-color:#cccccc;background-position:initial initial;background-repeat:initial initial;\"><span style=\"text-align:center;line-height:36px;width:199px;float:left;height:36px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\"><img alt=\"盛大一卡通\" src=\"http://www.mcfl.cn/statics/attachment/goods/ka/1.jpg\" style=\"border:none;\" /></span><span style=\"text-align:center;line-height:36px;width:149px;float:left;height:36px;color:#ff0000;margin-right:20px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\">84%</span><span style=\"text-align:center;line-height:36px;width:285px;float:left;height:36px;\">任意面值</span></li>\r\n<li style=\"width:685px;margin-bottom:0px;float:left;border-bottom-color:#cccccc;border-width:medium 1px 1px;border-style:none solid solid;border-left-color:#cccccc;margin-top:0px;background-color:#fafafa;height:36px;border-right-color:#cccccc;background-position:initial initial;background-repeat:initial initial;\"><span style=\"text-align:center;line-height:36px;width:199px;float:left;height:36px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\"><img alt=\"骏网一卡通\" src=\"http://www.mcfl.cn/statics/attachment/goods/ka/2.jpg\" style=\"border:none;\" /></span><span style=\"text-align:center;line-height:36px;width:149px;float:left;height:36px;color:#ff0000;margin-right:20px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\">85%</span><span style=\"text-align:center;line-height:36px;width:285px;float:left;height:36px;\">任意面值</span></li>\r\n<li style=\"width:685px;margin-bottom:0px;float:left;border-bottom-color:#cccccc;border-width:medium 1px 1px;border-style:none solid solid;border-left-color:#cccccc;margin-top:0px;background-color:#fafafa;height:36px;border-right-color:#cccccc;background-position:initial initial;background-repeat:initial initial;\"><span style=\"text-align:center;line-height:36px;width:199px;float:left;height:36px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\"><img alt=\"搜狐一卡通\" src=\"http://www.mcfl.cn/statics/attachment/goods/ka/9.jpg\" style=\"border:none;\" /></span><span style=\"text-align:center;line-height:36px;width:149px;float:left;height:36px;color:#ff0000;margin-right:20px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\">82%</span><span style=\"text-align:center;line-height:36px;width:285px;float:left;height:36px;\">5 10 15 30 40 100</span></li>\r\n<li style=\"width:685px;margin-bottom:0px;float:left;border-bottom-color:#cccccc;border-width:medium 1px 1px;border-style:none solid solid;border-left-color:#cccccc;margin-top:0px;background-color:#fafafa;height:36px;border-right-color:#cccccc;background-position:initial initial;background-repeat:initial initial;\"><span style=\"text-align:center;line-height:36px;width:199px;float:left;height:36px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\"><img alt=\"网易一卡通\" src=\"http://www.mcfl.cn/statics/attachment/goods/ka/10.jpg\" style=\"border:none;\" /></span><span style=\"text-align:center;line-height:36px;width:149px;float:left;height:36px;color:#ff0000;margin-right:20px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\">82%</span><span style=\"text-align:center;line-height:36px;width:285px;float:left;height:36px;\">30 15 5 10 20 50</span></li>\r\n<li style=\"width:685px;margin-bottom:0px;float:left;border-bottom-color:#cccccc;border-width:medium 1px 1px;border-style:none solid solid;border-left-color:#cccccc;margin-top:0px;background-color:#fafafa;height:36px;border-right-color:#cccccc;background-position:initial initial;background-repeat:initial initial;\"><span style=\"text-align:center;line-height:36px;width:199px;float:left;height:36px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\"><img alt=\"久游一卡通\" src=\"http://www.mcfl.cn/statics/attachment/goods/ka/998.jpg\" style=\"border:none;\" /></span><span style=\"text-align:center;line-height:36px;width:149px;float:left;height:36px;color:#ff0000;margin-right:20px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\">82%</span><span style=\"text-align:center;line-height:36px;width:285px;float:left;height:36px;\">5 10 30 50</span></li>\r\n<li style=\"width:685px;margin-bottom:0px;float:left;border-bottom-color:#cccccc;border-width:medium 1px 1px;border-style:none solid solid;border-left-color:#cccccc;margin-top:0px;background-color:#fafafa;height:36px;border-right-color:#cccccc;background-position:initial initial;background-repeat:initial initial;\"><span style=\"text-align:center;line-height:36px;width:199px;float:left;height:36px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\"><img alt=\"完美一卡通\" src=\"http://www.mcfl.cn/statics/attachment/goods/ka/996.jpg\" style=\"border:none;\" /></span><span style=\"text-align:center;line-height:36px;width:149px;float:left;height:36px;color:#ff0000;margin-right:20px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\">82%</span><span style=\"text-align:center;line-height:36px;width:285px;float:left;height:36px;\">15 30 50 100</span></li>\r\n<li style=\"width:685px;margin-bottom:0px;float:left;border-bottom-color:#cccccc;border-width:medium 1px 1px;border-style:none solid solid;border-left-color:#cccccc;margin-top:0px;background-color:#fafafa;height:36px;border-right-color:#cccccc;background-position:initial initial;background-repeat:initial initial;\"><span style=\"text-align:center;line-height:36px;width:199px;float:left;height:36px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\"><img alt=\"天下通一卡通\" src=\"http://www.mcfl.cn/statics/attachment/goods/ka/3.jpg\" style=\"border:none;\" /></span><span style=\"text-align:center;line-height:36px;width:149px;float:left;height:36px;color:#ff0000;margin-right:20px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\">82%</span><span style=\"text-align:center;line-height:36px;width:285px;float:left;height:36px;\">5&nbsp; 6 10 15 30 50 100</span></li>\r\n<li style=\"width:685px;margin-bottom:0px;float:left;border-bottom-color:#cccccc;border-width:medium 1px 1px;border-style:none solid solid;border-left-color:#cccccc;margin-top:0px;background-color:#fafafa;height:36px;border-right-color:#cccccc;background-position:initial initial;background-repeat:initial initial;\"><span style=\"text-align:center;line-height:36px;width:199px;float:left;height:36px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\"><img alt=\"Q币充值卡\" src=\"http://www.mcfl.cn/statics/attachment/goods/ka/999.jpg\" style=\"border:none;\" /></span><span style=\"text-align:center;line-height:36px;width:149px;float:left;height:36px;color:#ff0000;margin-right:20px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\">82%</span><span style=\"text-align:center;line-height:36px;width:285px;float:left;height:36px;\">5 10 15 20 30 60 100 200</span></li>\r\n<li style=\"width:685px;margin-bottom:0px;float:left;border-bottom-color:#cccccc;border-width:medium 1px 1px;border-style:none solid solid;border-left-color:#cccccc;margin-top:0px;background-color:#fafafa;height:36px;border-right-color:#cccccc;background-position:initial initial;background-repeat:initial initial;\"><span style=\"text-align:center;line-height:36px;width:199px;float:left;height:36px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\"><img alt=\"纵游一卡通\" src=\"http://www.mcfl.cn/statics/attachment/goods/ka/991.jpg\" style=\"border:none;\" /></span><span style=\"text-align:center;line-height:36px;width:149px;float:left;height:36px;color:#ff0000;margin-right:20px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\">82%</span><span style=\"text-align:center;line-height:36px;width:285px;float:left;height:36px;\">5 10 15 30 50 100</span></li>\r\n<li style=\"width:685px;margin-bottom:0px;float:left;border-bottom-color:#cccccc;border-width:medium 1px 1px;border-style:none solid solid;border-left-color:#cccccc;margin-top:0px;background-color:#fafafa;height:36px;border-right-color:#cccccc;background-position:initial initial;background-repeat:initial initial;\"><span style=\"text-align:center;line-height:36px;width:199px;float:left;height:36px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\"><img alt=\"易宝一卡通\" src=\"http://www.mcfl.cn/statics/attachment/goods/ka/yeepay.jpg\" style=\"border:none;\" /></span><span style=\"text-align:center;line-height:36px;width:149px;float:left;height:36px;color:#ff0000;margin-right:20px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\">89%</span><span style=\"text-align:center;line-height:36px;width:285px;float:left;height:36px;\">2&nbsp; 5 10 15 20 25 30 50 100</span></li>\r\n<li style=\"width:685px;margin-bottom:0px;float:left;border-bottom-color:#cccccc;border-width:medium 1px 1px;border-style:none solid solid;border-left-color:#cccccc;margin-top:0px;background-color:#fafafa;height:36px;border-right-color:#cccccc;background-position:initial initial;background-repeat:initial initial;\"><span style=\"font-size:20px;\"><strong><span style=\"text-align:center;line-height:36px;width:199px;float:left;height:36px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\"><img alt=\"巨人(征途)一卡通\" src=\"http://www.mcfl.cn/statics/attachment/goods/ka/12.jpg\" style=\"border:none;\" /></span></strong></span><span style=\"text-align:center;line-height:36px;width:149px;float:left;height:36px;color:#ff0000;margin-right:20px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\">84%</span><span style=\"text-align:center;line-height:36px;width:285px;float:left;height:36px;\">任意面值</span></li>\r\n<li style=\"width:685px;margin-bottom:0px;float:left;border-bottom-color:#cccccc;border-width:medium 1px 1px;border-style:none solid solid;border-left-color:#cccccc;margin-top:0px;background-color:#fafafa;height:36px;border-right-color:#cccccc;background-position:initial initial;background-repeat:initial initial;\"><span style=\"font-size:20px;\"><strong><span style=\"text-align:center;line-height:36px;width:199px;float:left;height:36px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\"><img alt=\"天宏一卡通\" src=\"http://www.mcfl.cn/statics/attachment/goods/ka/997.jpg\" style=\"border:none;\" /></span></strong></span><span style=\"text-align:center;line-height:36px;width:149px;float:left;height:36px;color:#ff0000;margin-right:20px;border-right-color:#cccccc;border-right-width:1px;border-right-style:solid;\">82%</span><span style=\"text-align:center;line-height:36px;width:285px;float:left;height:36px;\">5 10 15 20 30 50 100</span></li>\r\n<li class=\"help2_right_b\" style=\"width:687px;margin-bottom:0px;float:left;height:22px;line-height:20px;padding-left:4px;\"><p style=\"margin-top:0px;margin-bottom:0px;padding:0px;\">注：收卡折扣变动及福利捐赠变动，请及时参照系统平台公告，任意面值的点卡都收购，若没有你需要的面值，请联系客服。</p>\r\n</li>\r\n<li class=\"help2_right_b\" style=\"width:687px;margin-bottom:0px;float:left;height:22px;line-height:20px;padding-left:4px;\">另：电信卡面值为20元，30元，300元，500元请联系客服收购，网站上暂时只支持50元和100元的面值。</li>\r\n<li class=\"help2_right_b\" style=\"width:687px;margin-bottom:0px;float:left;height:22px;line-height:20px;padding-left:4px;\">例如：你有1张100元的充值卡，折扣为93折，那么卖卡后可以得到：1*100*0.93=93元</li>\r\n</ul>', '4', '/html/201210/f2559fd3f668488b80fb9616c8ea7528.html', '', '', '', '', '', '1', '收卡价格', '8ae4839c3a887878013a88dd51d90041');

-- ----------------------------
-- Table structure for `xx_article_category`
-- ----------------------------
DROP TABLE IF EXISTS `xx_article_category`;
CREATE TABLE `xx_article_category` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `path` text NOT NULL,
  `sign` varchar(255) NOT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sign` (`sign`),
  KEY `xx_article_category_parent` (`parent_id`),
  KEY `xx_article_category_grade` (`grade`),
  KEY `xx_article_category_order_list` (`order_list`),
  CONSTRAINT `xx_article_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `xx_article_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_article_category
-- ----------------------------
INSERT INTO `xx_article_category` VALUES ('8ae4839c3a887878013a88dd51d90041', '2012-10-22 22:25:36', '2012-10-22 22:25:36', '0', '', '', '新手上路', '0', '8ae4839c3a887878013a88dd51d90041', 'xin_shou', null);
INSERT INTO `xx_article_category` VALUES ('8ae4839c3a887878013a88ddb4b20043', '2012-10-22 22:26:02', '2012-10-22 22:26:02', '0', '', '', '名臣公益', '0', '8ae4839c3a887878013a88ddb4b20043', 'gong_yi', null);

-- ----------------------------
-- Table structure for `xx_brand`
-- ----------------------------
DROP TABLE IF EXISTS `xx_brand`;
CREATE TABLE `xx_brand` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `introduction` text,
  `logo_path` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_brand_order_list` (`order_list`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_brand
-- ----------------------------
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88a15b0f0001', '2012-10-22 21:20:06', '2012-10-31 11:44:30', '', null, '骏网一卡通', '1', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ac6eb10002', '2012-10-22 21:32:12', '2012-10-31 11:49:24', '', null, '盛大卡', '2', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88aca0800003', '2012-10-22 21:32:25', '2012-10-31 11:50:16', '', null, '神州行', '3', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88acc1ef0004', '2012-10-22 21:32:34', '2012-10-31 11:50:55', '', null, '征途卡', '4', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88acef930005', '2012-10-22 21:32:45', '2012-10-22 21:32:45', '', null, 'Q币卡', '5', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ad18e10006', '2012-10-22 21:32:56', '2012-10-22 21:32:56', '', null, '联通卡', '6', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ad3c100007', '2012-10-22 21:33:05', '2012-10-22 21:33:05', '', null, '久游卡', '7', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ad61df0008', '2012-10-22 21:33:15', '2012-10-22 21:33:15', '', null, '易宝e卡通', '8', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ad845a0009', '2012-10-22 21:33:23', '2012-10-22 21:33:23', '', null, '网易卡', '9', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ada7f6000a', '2012-10-22 21:33:33', '2012-10-22 21:33:33', '', null, '完美卡', '10', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88add167000b', '2012-10-22 21:33:43', '2012-10-22 21:33:43', '', null, '搜狐卡', '11', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ae0511000c', '2012-10-22 21:33:56', '2012-10-22 21:33:56', '', null, '电信卡', '12', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ae29c8000d', '2012-10-22 21:34:06', '2012-10-22 21:34:06', '', null, '纵游一卡通', '13', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ae4be5000e', '2012-10-22 21:34:15', '2012-10-22 21:34:15', '', null, '天下一卡通', '14', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ae757d000f', '2012-10-22 21:34:25', '2012-10-22 21:34:25', '', null, '天宏一卡通', '15', '');

-- ----------------------------
-- Table structure for `xx_cart_item`
-- ----------------------------
DROP TABLE IF EXISTS `xx_cart_item`;
CREATE TABLE `xx_cart_item` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` varchar(32) NOT NULL,
  `member_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_cart_item_member` (`member_id`),
  KEY `xx_cart_item_product` (`product_id`),
  CONSTRAINT `xx_cart_item_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `xx_cart_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `xx_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_cart_item
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_comment`
-- ----------------------------
DROP TABLE IF EXISTS `xx_comment`;
CREATE TABLE `xx_comment` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `ip` varchar(255) NOT NULL,
  `is_admin_reply` bit(1) NOT NULL,
  `is_show` bit(1) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `goods_id` varchar(32) NOT NULL,
  `for_comment_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_comment_goods` (`goods_id`),
  KEY `xx_comment_for_comment` (`for_comment_id`),
  KEY `xx_comment_create_date` (`create_date`),
  CONSTRAINT `xx_comment_ibfk_1` FOREIGN KEY (`for_comment_id`) REFERENCES `xx_comment` (`id`),
  CONSTRAINT `xx_comment_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `xx_goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_delivery_center`
-- ----------------------------
DROP TABLE IF EXISTS `xx_delivery_center`;
CREATE TABLE `xx_delivery_center` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `area_store` text NOT NULL,
  `consignor` varchar(255) NOT NULL,
  `is_default` bit(1) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_delivery_center
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_delivery_corp`
-- ----------------------------
DROP TABLE IF EXISTS `xx_delivery_corp`;
CREATE TABLE `xx_delivery_corp` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_delivery_corp_order_list` (`order_list`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_delivery_corp
-- ----------------------------
INSERT INTO `xx_delivery_corp` VALUES ('4028bc743ab4e741013ab5372e7d0005', '2012-10-31 13:07:03', '2012-11-13 23:15:30', '默认无需物流', '0', '');

-- ----------------------------
-- Table structure for `xx_delivery_item`
-- ----------------------------
DROP TABLE IF EXISTS `xx_delivery_item`;
CREATE TABLE `xx_delivery_item` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `delivery_quantity` int(11) NOT NULL,
  `goods_html_path` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_sn` varchar(255) NOT NULL,
  `reship_id` varchar(32) DEFAULT NULL,
  `shipping_id` varchar(32) DEFAULT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_delivery_item_shipping` (`shipping_id`),
  KEY `xx_delivery_item_reship` (`reship_id`),
  KEY `xx_delivery_item_product` (`product_id`),
  CONSTRAINT `xx_delivery_item_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `xx_delivery_item_ibfk_2` FOREIGN KEY (`reship_id`) REFERENCES `xx_reship` (`id`),
  CONSTRAINT `xx_delivery_item_ibfk_3` FOREIGN KEY (`shipping_id`) REFERENCES `xx_shipping` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_delivery_item
-- ----------------------------
INSERT INTO `xx_delivery_item` VALUES ('8a9182e13ab666b7013ab6acd9600008', '2012-10-31 19:55:12', '2012-10-31 19:55:12', '2', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [30元]', 'SN_5690B347AA89', null, '8a9182e13ab666b7013ab6acd7370007', '8ae4839c3a887878013a88d343fe0037');

-- ----------------------------
-- Table structure for `xx_delivery_template`
-- ----------------------------
DROP TABLE IF EXISTS `xx_delivery_template`;
CREATE TABLE `xx_delivery_template` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `content` text NOT NULL,
  `is_default` bit(1) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_delivery_template
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_delivery_type`
-- ----------------------------
DROP TABLE IF EXISTS `xx_delivery_type`;
CREATE TABLE `xx_delivery_type` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `continue_weight` int(11) NOT NULL,
  `continue_weight_price` decimal(15,5) NOT NULL,
  `delivery_method` int(11) NOT NULL,
  `description` text,
  `first_weight` int(11) NOT NULL,
  `first_weight_price` decimal(15,5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `default_delivery_corp_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_delivery_item_delivery_corp` (`default_delivery_corp_id`),
  KEY `xx_delivery_type_order_list` (`order_list`),
  CONSTRAINT `xx_delivery_type_ibfk_1` FOREIGN KEY (`default_delivery_corp_id`) REFERENCES `xx_delivery_corp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_delivery_type
-- ----------------------------
INSERT INTO `xx_delivery_type` VALUES ('8a8f81d93afa3e77013afa5526f80000', '2012-11-13 23:13:35', '2012-11-14 23:11:09', '1000', '0.00000', '0', '默认方式', '1000', '0.00000', '虚拟配送', '0', '4028bc743ab4e741013ab5372e7d0005');

-- ----------------------------
-- Table structure for `xx_deposit`
-- ----------------------------
DROP TABLE IF EXISTS `xx_deposit`;
CREATE TABLE `xx_deposit` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `balance` decimal(19,5) NOT NULL,
  `credit` decimal(19,5) NOT NULL,
  `debit` decimal(19,5) NOT NULL,
  `deposit_type` int(11) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  `lossrate` decimal(19,5) DEFAULT NULL,
  `order_sn` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_deposit_member` (`member_id`),
  KEY `xx_deposit_create_date` (`create_date`),
  CONSTRAINT `xx_deposit_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_deposit
-- ----------------------------
INSERT INTO `xx_deposit` VALUES ('402880853ae8e6be013ae8fd927d0006', '2012-11-10 14:24:23', '2012-11-10 14:24:23', '200386.71000', '43.17000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('402880853ae8e6be013ae8ff0d93000f', '2012-11-10 14:26:00', '2012-11-10 14:26:00', '200578.71000', '192.00000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('402880853ae8e6be013ae90adf060016', '2012-11-10 14:38:54', '2012-11-10 14:38:54', '200636.31000', '57.60000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('402880853ae8e6be013ae90adf2c0017', '2012-11-10 14:38:54', '2012-11-10 14:38:54', '1.55000', '0.60000', '0.00000', '7', '8a9182e13ab73c9e013ab74780e80000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('402880853ae8e6be013ae90bad61001e', '2012-11-10 14:39:47', '2012-11-10 14:39:47', '200693.91000', '57.60000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('402880853ae8e6be013ae90bad8b001f', '2012-11-10 14:39:47', '2012-11-10 14:39:47', '2.15000', '0.60000', '0.00000', '7', '8a9182e13ab73c9e013ab74780e80000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('402880853ae8e6be013ae9102a130022', '2012-11-10 14:44:41', '2012-11-10 14:44:41', '202.15000', '200.00000', '0.00000', '0', '8a9182e13ab73c9e013ab74780e80000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743abb0a04013abb2b60b50000', '2012-11-01 16:51:53', '2012-11-01 16:51:53', '11220.00000', '20.00000', '0.00000', '2', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743abe9afa013abf1cf6610000', '2012-11-02 11:14:37', '2012-11-02 11:14:37', '500.00000', '500.00000', '0.00000', '2', '4028bc743ab48628013ab4b892a00000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743abe9afa013abf1e103d0002', '2012-11-02 11:15:49', '2012-11-02 11:15:49', '700.00000', '200.00000', '0.00000', '2', '4028bc743ab48628013ab4b892a00000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743abf206b013abf27b8780001', '2012-11-02 11:26:22', '2012-11-02 11:26:22', '300.00000', '300.00000', '0.00000', '2', '4028bc743abf206b013abf27afae0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743abf206b013abf28c68c0003', '2012-11-02 11:27:31', '2012-11-02 11:27:31', '3000.00000', '2700.00000', '0.00000', '2', '4028bc743abf206b013abf27afae0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743abf3198013abf36ae0f0001', '2012-11-02 11:42:42', '2012-11-02 11:42:42', '3060.00000', '60.00000', '0.00000', '0', '4028bc743abf206b013abf27afae0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743ac936a6013ac93c35e00001', '2012-11-04 10:24:57', '2012-11-04 10:24:57', '11220.00000', '0.00000', '0.00000', '6', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743ac936a6013ac942cd410002', '2012-11-04 10:32:09', '2012-11-04 10:32:09', '697.28000', '0.00000', '1.36000', '6', '4028bc743ab48628013ab4b892a00000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743ac936a6013ac944bc6e0004', '2012-11-04 10:34:16', '2012-11-04 10:34:16', '9240.00000', '0.00000', '990.00000', '6', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743ac936a6013ac953a5d00006', '2012-11-04 10:50:33', '2012-11-04 10:50:33', '18007.00000', '7777.00000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743ac936a6013ac9d93da50009', '2012-11-04 13:16:28', '2012-11-04 13:16:28', '17848.60000', '0.00000', '79.20000', '6', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743ac9de7a013ac9e8ae280001', '2012-11-04 13:33:20', '2012-11-04 13:33:20', '18827.80000', '900.00000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743ac9de7a013ac9ea55fc0002', '2012-11-04 13:35:08', '2012-11-04 13:35:08', '18760.48000', '0.00000', '33.66000', '6', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743ac9fbfb013aca000a520001', '2012-11-04 13:58:51', '2012-11-04 13:58:51', '0.00000', '0.00000', '5.94000', '6', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743ac9fbfb013aca0520b10003', '2012-11-04 14:04:24', '2012-11-04 14:04:24', '200005.94000', '200000.00000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743ac9fbfb013aca05cf210004', '2012-11-04 14:05:09', '2012-11-04 14:05:09', '199960.40000', '0.00000', '22.77000', '6', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743ac9fbfb013aca13ea840006', '2012-11-04 14:20:33', '2012-11-04 14:20:33', '199960.40000', '0.00000', '22.77000', '6', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743b645e3a013b646e977a0004', '2012-12-04 13:41:07', '2012-12-04 13:41:07', '200713.11000', '19.20000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743b645e3a013b646e98060005', '2012-12-04 13:41:07', '2012-12-04 13:41:07', '202.35000', '0.20000', '0.00000', '7', '8a9182e13ab73c9e013ab74780e80000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743b647802013b647b88290004', '2012-12-04 13:55:15', '2012-12-04 13:55:15', '200732.31000', '19.20000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743b647802013b647b88670005', '2012-12-04 13:55:15', '2012-12-04 13:55:15', '202.55000', '0.20000', '0.00000', '7', '8a9182e13ab73c9e013ab74780e80000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743b6dfb36013b6dfcbaf60000', '2012-12-06 10:12:57', '2012-12-06 10:12:57', '200730.39000', '0.00000', '1.92000', '6', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743b742994013b742dd2980008', '2012-12-07 15:04:18', '2012-12-07 15:04:18', '200784.09000', '17.60000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743b742994013b742dd2d60009', '2012-12-07 15:04:18', '2012-12-07 15:04:18', '203.11000', '0.18000', '0.00000', '7', '8a9182e13ab73c9e013ab74780e80000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743b742994013b74312cfe000c', '2012-12-07 15:07:58', '2012-12-07 15:07:58', '200031.45000', '0.00000', '752.64000', '6', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743b7447e7013b744e63720009', '2012-12-07 15:39:52', '2012-12-07 15:39:52', '200066.65000', '17.60000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743b7452db013b7453d52f0007', '2012-12-07 15:45:49', '2012-12-07 15:45:49', '200084.25000', '17.60000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743b7452db013b7457dd1b000a', '2012-12-07 15:50:13', '2012-12-07 15:50:13', '200000.25000', '0.00000', '80.64000', '6', '8a9183a93a92e6de013a931577bb0000', '0.96000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743b7466ad013b746cc72b0004', '2012-12-07 16:13:04', '2012-12-07 16:13:04', '200017.85000', '17.60000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('4028bc743b748c5c013b748d160b0004', '2012-12-07 16:48:21', '2012-12-07 16:48:21', '200123.45000', '17.60000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', null, null);
INSERT INTO `xx_deposit` VALUES ('4028bc743b748c5c013b748d16590005', '2012-12-07 16:48:21', '2012-12-07 16:48:21', '203.83000', '0.18000', '0.00000', '7', '8a9182e13ab73c9e013ab74780e80000', null, 'DD100049', '123123');
INSERT INTO `xx_deposit` VALUES ('4028bc743b8d1bfd013b8d1e15df0001', '2012-12-12 11:17:37', '2012-12-12 11:17:37', '200141.05000', '17.60000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', null, null);
INSERT INTO `xx_deposit` VALUES ('4028bc743b8d1bfd013b8d1e162d0002', '2012-12-12 11:17:37', '2012-12-12 11:17:37', '204.01000', '0.18000', '0.00000', '7', '8a9182e13ab73c9e013ab74780e80000', null, 'DD100054', '123123');
INSERT INTO `xx_deposit` VALUES ('4028bc743b8dfca5013b8dff09d20004', '2012-12-12 15:23:19', '2012-12-12 15:23:19', '200158.65000', '17.60000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', null, null);
INSERT INTO `xx_deposit` VALUES ('4028bc743b8dfca5013b8dff0a200005', '2012-12-12 15:23:19', '2012-12-12 15:23:19', '204.19000', '0.18000', '0.00000', '7', '8a9182e13ab73c9e013ab74780e80000', null, 'DD100055', '123123');
INSERT INTO `xx_deposit` VALUES ('4028bc743b938b55013b938fad860008', '2012-12-13 17:19:25', '2012-12-13 17:19:25', '200176.25000', '17.60000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', null, null);
INSERT INTO `xx_deposit` VALUES ('4028bc743b938b55013b938fade40009', '2012-12-13 17:19:25', '2012-12-13 17:19:25', '204.37000', '0.18000', '0.00000', '7', '8a9182e13ab73c9e013ab74780e80000', null, 'DD100057', '123123');
INSERT INTO `xx_deposit` VALUES ('8a8f80153ae0be07013ae0c4acce0006', '2012-11-09 00:05:16', '2012-11-09 00:05:16', '200013.86000', '53.46000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('8a8f80153ae0be07013ae0c9d3b5000c', '2012-11-09 00:10:54', '2012-11-09 00:10:54', '200022.77000', '8.91000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('8a8f80153ae0be07013ae0cdef370012', '2012-11-09 00:15:23', '2012-11-09 00:15:23', '200036.14000', '13.37000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('8a8f80153ae0d04c013ae0d4e25e0005', '2012-11-09 00:22:58', '2012-11-09 00:22:58', '200045.05000', '8.91000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('8a8f80153ae0d04c013ae0d5aece000b', '2012-11-09 00:23:51', '2012-11-09 00:23:51', '200053.96000', '8.91000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('8a8f80153ae0d04c013ae0d7c52d0011', '2012-11-09 00:26:08', '2012-11-09 00:26:08', '200062.87000', '8.91000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('8a8f80153ae0d04c013ae0e331580018', '2012-11-09 00:38:36', '2012-11-09 00:38:36', '200071.78000', '8.91000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('8a8f80153ae0d04c013ae0e48266001f', '2012-11-09 00:40:02', '2012-11-09 00:40:02', '200249.98000', '178.20000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('8a8f80153ae0d04c013ae0e58a860026', '2012-11-09 00:41:10', '2012-11-09 00:41:10', '200339.08000', '89.10000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('8a8f80153ae0e850013ae0eeff240005', '2012-11-09 00:51:30', '2012-11-09 00:51:30', '200343.54000', '4.46000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('8a8f80153ae0e850013ae0ef2e6e0006', '2012-11-09 00:51:42', '2012-11-09 00:51:42', '0.95000', '0.05000', '0.00000', '7', '8a9182e13ab73c9e013ab74780e80000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('8a91807c3b70d14d013b70d260a30005', '2012-12-06 23:25:33', '2012-12-06 23:25:33', '200749.59000', '19.20000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('8a91807c3b70d14d013b70d261090006', '2012-12-06 23:25:33', '2012-12-06 23:25:33', '202.75000', '0.20000', '0.00000', '7', '8a9182e13ab73c9e013ab74780e80000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('8a91807c3b70d14d013b70d4e071000d', '2012-12-06 23:28:17', '2012-12-06 23:28:17', '200766.49000', '16.90000', '0.00000', '0', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('8a91807c3b70d14d013b70d4e0e0000e', '2012-12-06 23:28:17', '2012-12-06 23:28:17', '202.93000', '0.18000', '0.00000', '7', '8a9182e13ab73c9e013ab74780e80000', '0.00000', '', '');
INSERT INTO `xx_deposit` VALUES ('8a9183a93a92e6de013a93157c620001', '2012-10-24 22:03:09', '2012-10-24 22:03:09', '10000.00000', '10000.00000', '0.00000', '2', '8a9183a93a92e6de013a931577bb0000', '0.00000', '', '');

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
  PRIMARY KEY (`id`),
  KEY `xx_friend_link_order_list` (`order_list`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_friend_link
-- ----------------------------
INSERT INTO `xx_friend_link` VALUES ('ff8080813aa60e2e013aa628f8230000', '2012-10-28 14:57:13', '2012-10-28 14:57:13', null, '思思科技', '1', 'www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('ff8080813aa60e2e013aa6295d410001', '2012-10-28 14:57:39', '2012-10-28 14:57:39', null, '帝威软科', '2', 'www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('ff8080813aa60e2e013aa62bdf210002', '2012-10-28 15:00:23', '2012-10-28 15:00:23', '/upload/image/201210/9c85f47d23d14e06985c22380cb5f15a.png', '支付宝', '5', 'www.baidu.com');

-- ----------------------------
-- Table structure for `xx_goods`
-- ----------------------------
DROP TABLE IF EXISTS `xx_goods`;
CREATE TABLE `xx_goods` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `cost` decimal(15,5) DEFAULT NULL,
  `freeze_store` int(11) NOT NULL,
  `goods_attribute_value0` varchar(255) DEFAULT NULL,
  `goods_attribute_value1` varchar(255) DEFAULT NULL,
  `goods_attribute_value10` varchar(255) DEFAULT NULL,
  `goods_attribute_value11` varchar(255) DEFAULT NULL,
  `goods_attribute_value12` varchar(255) DEFAULT NULL,
  `goods_attribute_value13` varchar(255) DEFAULT NULL,
  `goods_attribute_value14` varchar(255) DEFAULT NULL,
  `goods_attribute_value15` varchar(255) DEFAULT NULL,
  `goods_attribute_value16` varchar(255) DEFAULT NULL,
  `goods_attribute_value17` varchar(255) DEFAULT NULL,
  `goods_attribute_value18` varchar(255) DEFAULT NULL,
  `goods_attribute_value19` varchar(255) DEFAULT NULL,
  `goods_attribute_value2` varchar(255) DEFAULT NULL,
  `goods_attribute_value3` varchar(255) DEFAULT NULL,
  `goods_attribute_value4` varchar(255) DEFAULT NULL,
  `goods_attribute_value5` varchar(255) DEFAULT NULL,
  `goods_attribute_value6` varchar(255) DEFAULT NULL,
  `goods_attribute_value7` varchar(255) DEFAULT NULL,
  `goods_attribute_value8` varchar(255) DEFAULT NULL,
  `goods_attribute_value9` varchar(255) DEFAULT NULL,
  `goods_image_store` text,
  `goods_parameter_value_store` text,
  `goods_sn` varchar(255) NOT NULL,
  `html_path` varchar(255) NOT NULL,
  `introduction` text,
  `is_best` bit(1) NOT NULL,
  `is_hot` bit(1) NOT NULL,
  `is_marketable` bit(1) NOT NULL,
  `is_new` bit(1) NOT NULL,
  `is_specification_enabled` bit(1) NOT NULL,
  `market_price` decimal(15,5) NOT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `name` varchar(255) NOT NULL,
  `price` decimal(15,5) NOT NULL,
  `score` int(11) NOT NULL,
  `store` int(11) DEFAULT NULL,
  `store_place` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  `goods_type_id` varchar(32) DEFAULT NULL,
  `brand_id` varchar(32) DEFAULT NULL,
  `goods_category_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_sn` (`goods_sn`),
  KEY `xx_goods_goods_category` (`goods_category_id`),
  KEY `xx_goods_goods_type` (`goods_type_id`),
  KEY `xx_goods_brand` (`brand_id`),
  KEY `xx_goods_create_date` (`create_date`),
  KEY `xx_goods_name` (`name`),
  KEY `xx_goods_price` (`price`),
  CONSTRAINT `xx_goods_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `xx_brand` (`id`),
  CONSTRAINT `xx_goods_ibfk_2` FOREIGN KEY (`goods_category_id`) REFERENCES `xx_goods_category` (`id`),
  CONSTRAINT `xx_goods_ibfk_3` FOREIGN KEY (`goods_type_id`) REFERENCES `xx_goods_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_goods
-- ----------------------------
INSERT INTO `xx_goods` VALUES ('4028e3373b17db72013b17eaed2c0000', '2012-11-19 17:06:10', '2012-11-19 17:06:10', '100.00000', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'SN_A45110394A31', '/html/201211/a444bae58a2242fbbc0bada2dcdf2ee8.html', '', '', '', '', '', '', '100.00000', '', '', '盛大一卡通', '100.00000', '0', '1000', '', '0', null, '8ae4839c3a887878013a88ac6eb10002', '8ae4839c3a887878013a88ba80150017');
INSERT INTO `xx_goods` VALUES ('8ae4839c3a887878013a88d311030032', '2012-10-22 22:14:24', '2012-10-22 22:17:26', '100.00000', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'SN_029FA07A1B4C', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '', '', '', '', '', '', '120.00000', '', '', '腾讯一卡通', '100.00000', '0', null, '', '0', null, '8ae4839c3a887878013a88acef930005', '8ae4839c3a887878013a88b9d9c10015');

-- ----------------------------
-- Table structure for `xx_goods_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `xx_goods_attribute`;
CREATE TABLE `xx_goods_attribute` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `attribute_type` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `option_store` varchar(255) DEFAULT NULL,
  `order_list` int(11) DEFAULT NULL,
  `property_index` int(11) NOT NULL,
  `goods_type_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_goods_attribute_goods_type` (`goods_type_id`),
  KEY `xx_goods_attribute_order_list` (`order_list`),
  CONSTRAINT `xx_goods_attribute_ibfk_1` FOREIGN KEY (`goods_type_id`) REFERENCES `xx_goods_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_goods_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_goods_category`
-- ----------------------------
DROP TABLE IF EXISTS `xx_goods_category`;
CREATE TABLE `xx_goods_category` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `path` text NOT NULL,
  `sign` varchar(255) NOT NULL,
  `goods_type_id` varchar(32) DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sign` (`sign`),
  KEY `xx_goods_category_goods_type` (`goods_type_id`),
  KEY `xx_goods_category_parent` (`parent_id`),
  KEY `xx_goods_category_grade` (`grade`),
  KEY `xx_goods_category_order_list` (`order_list`),
  CONSTRAINT `xx_goods_category_ibfk_1` FOREIGN KEY (`goods_type_id`) REFERENCES `xx_goods_type` (`id`),
  CONSTRAINT `xx_goods_category_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `xx_goods_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_goods_category
-- ----------------------------
INSERT INTO `xx_goods_category` VALUES ('8ae4839c3a887878013a88b9d9c10015', '2012-10-22 21:46:52', '2012-10-22 21:46:52', '0', '', '', '腾讯一卡通', '0', '8ae4839c3a887878013a88b9d9c10015', 'teng_xun', '8ae4839c3a887878013a88b39b6a0010', null);
INSERT INTO `xx_goods_category` VALUES ('8ae4839c3a887878013a88ba80150017', '2012-10-22 21:47:34', '2012-10-22 21:47:46', '0', '', '', '盛大一卡通', '0', '8ae4839c3a887878013a88ba80150017', 'sheng_da', '8ae4839c3a887878013a88b39b6a0010', null);
INSERT INTO `xx_goods_category` VALUES ('8ae4839c3a887878013a88bafe98001a', '2012-10-22 21:48:07', '2012-10-22 21:48:07', '0', '', '', '骏网一卡通', '0', '8ae4839c3a887878013a88bafe98001a', 'jun_wang', '8ae4839c3a887878013a88b39b6a0010', null);
INSERT INTO `xx_goods_category` VALUES ('8ae4839c3a887878013a88bb547e001c', '2012-10-22 21:48:29', '2012-10-22 21:48:29', '0', '', '', '完美一卡通', '0', '8ae4839c3a887878013a88bb547e001c', 'wan_mei', '8ae4839c3a887878013a88b39b6a0010', null);
INSERT INTO `xx_goods_category` VALUES ('8ae4839c3a887878013a88bba8b4001e', '2012-10-22 21:48:50', '2012-10-22 21:48:50', '0', '', '', '搜狐一卡通', '0', '8ae4839c3a887878013a88bba8b4001e', 'sou_hu', '8ae4839c3a887878013a88b39b6a0010', null);
INSERT INTO `xx_goods_category` VALUES ('8ae4839c3a887878013a88bc0e8b0020', '2012-10-22 21:49:16', '2012-10-22 21:49:16', '0', '', '', '征途一卡通', '0', '8ae4839c3a887878013a88bc0e8b0020', 'zheng_tu', '8ae4839c3a887878013a88b39b6a0010', null);
INSERT INTO `xx_goods_category` VALUES ('8ae4839c3a887878013a88bc6dea0022', '2012-10-22 21:49:41', '2012-10-22 21:49:41', '0', '', '', '久游一卡通', '0', '8ae4839c3a887878013a88bc6dea0022', 'jiu_you', '8ae4839c3a887878013a88b39b6a0010', null);
INSERT INTO `xx_goods_category` VALUES ('8ae4839c3a887878013a88bccd590024', '2012-10-22 21:50:05', '2012-10-22 21:50:05', '0', '', '', '网易一卡通', '0', '8ae4839c3a887878013a88bccd590024', 'wang_yi', '8ae4839c3a887878013a88b39b6a0010', null);
INSERT INTO `xx_goods_category` VALUES ('8ae4839c3a887878013a88bd517a0026', '2012-10-22 21:50:39', '2012-10-22 21:50:39', '0', '', '', '电信充值卡', '0', '8ae4839c3a887878013a88bd517a0026', 'dian_xin', '8ae4839c3a887878013a88b6960e0014', null);
INSERT INTO `xx_goods_category` VALUES ('8ae4839c3a887878013a88bdaf250028', '2012-10-22 21:51:03', '2012-10-22 21:51:03', '0', '', '', '联通充值卡', '0', '8ae4839c3a887878013a88bdaf250028', 'lian_tong', '8ae4839c3a887878013a88b6960e0014', null);
INSERT INTO `xx_goods_category` VALUES ('8ae4839c3a887878013a88be08aa002a', '2012-10-22 21:51:26', '2012-10-22 21:51:26', '0', '', '', '纵游一卡通', '0', '8ae4839c3a887878013a88be08aa002a', 'zong_you', '8ae4839c3a887878013a88b6960e0014', null);
INSERT INTO `xx_goods_category` VALUES ('8ae4839c3a887878013a88be6075002c', '2012-10-22 21:51:48', '2012-10-22 21:51:48', '0', '', '', '天宏一卡通', '0', '8ae4839c3a887878013a88be6075002c', 'tian_hong', '8ae4839c3a887878013a88b39b6a0010', null);
INSERT INTO `xx_goods_category` VALUES ('8ae4839c3a887878013a88beb496002e', '2012-10-22 21:52:10', '2012-10-22 21:52:10', '0', '', '', '天下通一卡通', '0', '8ae4839c3a887878013a88beb496002e', 'tianxia_tong', '8ae4839c3a887878013a88b39b6a0010', null);
INSERT INTO `xx_goods_category` VALUES ('8ae4839c3a887878013a88bf094e0030', '2012-10-22 21:52:32', '2012-10-22 21:52:32', '0', '', '', '移动充值卡', '0', '8ae4839c3a887878013a88bf094e0030', 'yi_dong', '8ae4839c3a887878013a88b6960e0014', null);

-- ----------------------------
-- Table structure for `xx_goods_notify`
-- ----------------------------
DROP TABLE IF EXISTS `xx_goods_notify`;
CREATE TABLE `xx_goods_notify` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `is_sent` bit(1) NOT NULL,
  `send_date` datetime DEFAULT NULL,
  `product_id` varchar(32) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_goods_notify_member` (`member_id`),
  KEY `xx_goods_notify_product` (`product_id`),
  KEY `xx_goods_notify_create_date` (`create_date`),
  CONSTRAINT `xx_goods_notify_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `xx_goods_notify_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `xx_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_goods_notify
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_goods_specification`
-- ----------------------------
DROP TABLE IF EXISTS `xx_goods_specification`;
CREATE TABLE `xx_goods_specification` (
  `goods_set_id` varchar(32) NOT NULL,
  `specification_set_id` varchar(32) NOT NULL,
  PRIMARY KEY (`goods_set_id`,`specification_set_id`),
  KEY `xx_specification_set` (`goods_set_id`),
  KEY `xx_specification_goods_set` (`specification_set_id`),
  CONSTRAINT `xx_goods_specification_ibfk_1` FOREIGN KEY (`specification_set_id`) REFERENCES `xx_specification` (`id`),
  CONSTRAINT `xx_goods_specification_ibfk_2` FOREIGN KEY (`goods_set_id`) REFERENCES `xx_goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_goods_specification
-- ----------------------------
INSERT INTO `xx_goods_specification` VALUES ('8ae4839c3a887878013a88d311030032', '8ae4839c3a887878013a889ad43a0000');

-- ----------------------------
-- Table structure for `xx_goods_type`
-- ----------------------------
DROP TABLE IF EXISTS `xx_goods_type`;
CREATE TABLE `xx_goods_type` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `goods_parameter_store` text,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_goods_type
-- ----------------------------
INSERT INTO `xx_goods_type` VALUES ('8ae4839c3a887878013a88b39b6a0010', '2012-10-22 21:40:03', '2012-10-22 21:42:41', null, '游戏点卡');
INSERT INTO `xx_goods_type` VALUES ('8ae4839c3a887878013a88b6960e0014', '2012-10-22 21:43:18', '2012-10-22 21:43:18', null, '手机充值卡');

-- ----------------------------
-- Table structure for `xx_goods_type_brand`
-- ----------------------------
DROP TABLE IF EXISTS `xx_goods_type_brand`;
CREATE TABLE `xx_goods_type_brand` (
  `goods_type_set_id` varchar(32) NOT NULL,
  `brand_set_id` varchar(32) NOT NULL,
  PRIMARY KEY (`goods_type_set_id`,`brand_set_id`),
  KEY `xx_goods_type_brand_set` (`goods_type_set_id`),
  KEY `xx_brand_goods_type_set` (`brand_set_id`),
  CONSTRAINT `xx_goods_type_brand_ibfk_1` FOREIGN KEY (`brand_set_id`) REFERENCES `xx_brand` (`id`),
  CONSTRAINT `xx_goods_type_brand_ibfk_2` FOREIGN KEY (`goods_type_set_id`) REFERENCES `xx_goods_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_goods_type_brand
-- ----------------------------
INSERT INTO `xx_goods_type_brand` VALUES ('8ae4839c3a887878013a88b39b6a0010', '8ae4839c3a887878013a88a15b0f0001');
INSERT INTO `xx_goods_type_brand` VALUES ('8ae4839c3a887878013a88b39b6a0010', '8ae4839c3a887878013a88ac6eb10002');
INSERT INTO `xx_goods_type_brand` VALUES ('8ae4839c3a887878013a88b39b6a0010', '8ae4839c3a887878013a88acc1ef0004');
INSERT INTO `xx_goods_type_brand` VALUES ('8ae4839c3a887878013a88b39b6a0010', '8ae4839c3a887878013a88acef930005');
INSERT INTO `xx_goods_type_brand` VALUES ('8ae4839c3a887878013a88b39b6a0010', '8ae4839c3a887878013a88ad3c100007');
INSERT INTO `xx_goods_type_brand` VALUES ('8ae4839c3a887878013a88b39b6a0010', '8ae4839c3a887878013a88ad61df0008');
INSERT INTO `xx_goods_type_brand` VALUES ('8ae4839c3a887878013a88b39b6a0010', '8ae4839c3a887878013a88ad845a0009');
INSERT INTO `xx_goods_type_brand` VALUES ('8ae4839c3a887878013a88b39b6a0010', '8ae4839c3a887878013a88ada7f6000a');
INSERT INTO `xx_goods_type_brand` VALUES ('8ae4839c3a887878013a88b39b6a0010', '8ae4839c3a887878013a88add167000b');
INSERT INTO `xx_goods_type_brand` VALUES ('8ae4839c3a887878013a88b39b6a0010', '8ae4839c3a887878013a88ae29c8000d');
INSERT INTO `xx_goods_type_brand` VALUES ('8ae4839c3a887878013a88b39b6a0010', '8ae4839c3a887878013a88ae4be5000e');
INSERT INTO `xx_goods_type_brand` VALUES ('8ae4839c3a887878013a88b39b6a0010', '8ae4839c3a887878013a88ae757d000f');
INSERT INTO `xx_goods_type_brand` VALUES ('8ae4839c3a887878013a88b6960e0014', '8ae4839c3a887878013a88aca0800003');
INSERT INTO `xx_goods_type_brand` VALUES ('8ae4839c3a887878013a88b6960e0014', '8ae4839c3a887878013a88ad18e10006');
INSERT INTO `xx_goods_type_brand` VALUES ('8ae4839c3a887878013a88b6960e0014', '8ae4839c3a887878013a88ae0511000c');

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
  PRIMARY KEY (`id`),
  KEY `xx_instant_messaging_order_list` (`order_list`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_instant_messaging
-- ----------------------------
INSERT INTO `xx_instant_messaging` VALUES ('8a8f81d93afa3e77013afa5857930003', '2012-11-13 23:17:04', '2012-11-13 23:17:04', '1', '1', '小M', '1232121');
INSERT INTO `xx_instant_messaging` VALUES ('8a8f81d93afa3e77013afa5857a30004', '2012-11-13 23:17:04', '2012-11-13 23:17:04', '0', '0', '小新', '123123');

-- ----------------------------
-- Table structure for `xx_leave_message`
-- ----------------------------
DROP TABLE IF EXISTS `xx_leave_message`;
CREATE TABLE `xx_leave_message` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `ip` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `for_leave_message_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_leave_message_for_message` (`for_leave_message_id`),
  KEY `xx_leave_message_create_date` (`create_date`),
  CONSTRAINT `xx_leave_message_ibfk_1` FOREIGN KEY (`for_leave_message_id`) REFERENCES `xx_leave_message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_leave_message
-- ----------------------------
INSERT INTO `xx_leave_message` VALUES ('4028bc743a9574fa013a95e206990000', '2012-10-25 11:05:49', '2012-10-25 11:05:49', '123@qq.com', 'eee', '127.0.0.1', 'eee', '123123', null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a92e6de013a9326a2dc0003', '2012-10-24 22:21:53', '2012-10-24 22:21:53', null, '123123', '127.0.0.1', '123123', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a92e6de013a93270c970004', '2012-10-24 22:22:20', '2012-10-24 22:22:20', null, 'yyyy', '127.0.0.1', 'yyyy', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a9369b2fc0000', '2012-10-24 23:35:08', '2012-10-24 23:35:08', null, '234', '127.0.0.1', '44234', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a936a3e7d0001', '2012-10-24 23:35:44', '2012-10-24 23:35:44', null, '2345234', '127.0.0.1', '6345', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a936a81f20002', '2012-10-24 23:36:01', '2012-10-24 23:36:01', null, '23452345', '127.0.0.1', '345234', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a936ac06f0003', '2012-10-24 23:36:17', '2012-10-24 23:36:17', null, '2345', '127.0.0.1', '34523', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a936afa9e0004', '2012-10-24 23:36:32', '2012-10-24 23:36:32', null, '365', '127.0.0.1', '4563456', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a936dfaed0005', '2012-10-24 23:39:49', '2012-10-24 23:39:49', null, '12341234', '127.0.0.1', '234', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a936e32f40006', '2012-10-24 23:40:03', '2012-10-24 23:40:03', null, 'rqwerqwer', '127.0.0.1', 'qwer', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a936e97550007', '2012-10-24 23:40:29', '2012-10-24 23:40:29', null, '653456', '127.0.0.1', '546345', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a936f32bb0008', '2012-10-24 23:41:09', '2012-10-24 23:41:09', null, '2435', '127.0.0.1', '56', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a936fbdd20009', '2012-10-24 23:41:44', '2012-10-24 23:41:44', null, 'qwerqwer', '127.0.0.1', 'qwerqwer', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a93700d34000a', '2012-10-24 23:42:05', '2012-10-24 23:42:05', null, 'wert', '127.0.0.1', 'wert', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a9370d87d000b', '2012-10-24 23:42:57', '2012-10-24 23:42:57', null, 'qweqwer', '127.0.0.1', 'weqr', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a937264df000c', '2012-10-24 23:44:38', '2012-10-24 23:44:38', null, '2435', '127.0.0.1', '3452345', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a9372acf0000d', '2012-10-24 23:44:57', '2012-10-24 23:44:57', null, 'eee', '127.0.0.1', 'eee', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a9373afa1000e', '2012-10-24 23:46:03', '2012-10-24 23:46:03', null, '1234', '127.0.0.1', '2431', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a9373f8ca000f', '2012-10-24 23:46:22', '2012-10-24 23:46:22', null, 'tttt', '127.0.0.1', 'tttt', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a937502760010', '2012-10-24 23:47:30', '2012-10-24 23:47:30', null, '2345', '127.0.0.1', '24', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a93753f6a0011', '2012-10-24 23:47:45', '2012-10-24 23:47:45', null, 'qwerqwer', '127.0.0.1', 'qwerqwer', null, null);
INSERT INTO `xx_leave_message` VALUES ('8a9183a93a935a9b013a937585f80012', '2012-10-24 23:48:03', '2012-10-24 23:48:03', null, 'ertwret', '127.0.0.1', 'ertywret', null, null);

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
  `info` text,
  `ip` varchar(255) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_log
-- ----------------------------
INSERT INTO `xx_log` VALUES ('402880853ae8e6be013ae8fbd9550001', '2012-11-10 14:22:30', '2012-11-10 14:22:30', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743abb0a04013abb2b61610001', '2012-11-01 16:51:53', '2012-11-01 16:51:53', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743abe9afa013abf1cf76b0001', '2012-11-02 11:14:37', '2012-11-02 11:14:37', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743abe9afa013abf1e106c0003', '2012-11-02 11:15:49', '2012-11-02 11:15:49', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743abf206b013abf27b8c60002', '2012-11-02 11:26:22', '2012-11-02 11:26:22', 'net.xxs.action.admin.MemberAction', 'save', '添加会员: 123456', '127.0.0.1', '添加会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743abf206b013abf28c6cb0004', '2012-11-02 11:27:31', '2012-11-02 11:27:31', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123456', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743ac000ea013ac00c08b60001', '2012-11-02 15:35:45', '2012-11-02 15:35:45', 'net.xxs.action.admin.AdminAction', 'update', '编辑管理员: admin', '127.0.0.1', '编辑管理员', 'admin');
INSERT INTO `xx_log` VALUES ('4028e3373b17db72013b17eaf0180002', '2012-11-19 17:06:11', '2012-11-19 17:06:11', 'net.xxs.action.admin.GoodsAction', 'save', '添加商品: 盛大一卡通', '127.0.0.1', '添加商品', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f83943ab198ff013ab1e97f1a0000', '2012-10-30 21:43:20', '2012-10-30 21:43:20', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 收卡价格', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f83943ab198ff013ab1e9ae360001', '2012-10-30 21:43:32', '2012-10-30 21:43:32', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 联系我们', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a9182e13ab666b7013ab6acda4f000a', '2012-10-31 19:55:12', '2012-10-31 19:55:12', 'net.xxs.action.admin.OrderAction', 'shipping', '订单编号: DD100003', '127.0.0.1', '订单发货', 'admin');
INSERT INTO `xx_log` VALUES ('8a9182e13ab666b7013ab6aced5c000c', '2012-10-31 19:55:17', '2012-10-31 19:55:17', 'net.xxs.action.admin.OrderAction', 'completed', '订单编号: DD100003', '127.0.0.1', '订单完成', 'admin');
INSERT INTO `xx_log` VALUES ('8a9183a93a92e6de013a93157cbe0002', '2012-10-24 22:03:09', '2012-10-24 22:03:09', 'net.xxs.action.admin.MemberAction', 'save', '添加会员: 123123', '127.0.0.1', '添加会员', 'admin');
INSERT INTO `xx_log` VALUES ('8a9183a93a92e6de013a932f60de0005', '2012-10-24 22:31:26', '2012-10-24 22:31:26', 'net.xxs.action.admin.SettingAction', 'update', null, '127.0.0.1', '系统设置', 'admin');

-- ----------------------------
-- Table structure for `xx_member`
-- ----------------------------
DROP TABLE IF EXISTS `xx_member`;
CREATE TABLE `xx_member` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `area_store` varchar(255) DEFAULT NULL,
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
  `register_ip` varchar(255) NOT NULL,
  `safe_answer` varchar(255) DEFAULT NULL,
  `safe_question` varchar(255) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `member_rank_id` varchar(32) NOT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `xx_member_member_rank` (`member_rank_id`),
  CONSTRAINT `xx_member_ibfk_1` FOREIGN KEY (`member_rank_id`) REFERENCES `xx_member_rank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member
-- ----------------------------
INSERT INTO `xx_member` VALUES ('4028bc743ab48628013ab4b892a00000', '2012-10-31 10:48:46', '2012-12-07 16:56:26', null, null, null, '698.64000', '123@qq.com', '0', '', '', null, '2012-12-07 16:56:26', '0', '127.0.0.1', '111111111', null, null, null, null, null, null, null, null, null, null, null, null, '建设银行', null, null, null, null, null, null, null, null, '4297f44b13955235245b2497399d7a93', null, null, '127.0.0.1', null, null, '57', '112233', null, '0731dcsoft2010031200000000000010', 'xiaduoer');
INSERT INTO `xx_member` VALUES ('4028bc743abf206b013abf27afae0000', '2012-11-02 11:26:20', '2012-11-02 11:42:34', null, null, '2012-11-22 00:00:00', '3060.00000', '123456@qq.com', '0', '', '', null, '2012-11-02 11:26:51', '0', '127.0.0.1', '24312341234', null, null, null, null, null, null, null, null, null, null, null, null, '建设银行', null, null, null, null, null, null, null, '123456', '4297f44b13955235245b2497399d7a93', null, null, '127.0.0.1', null, null, '5000', '123456', null, '402881833054c381013054d0bf800002', 'xiaduoer');
INSERT INTO `xx_member` VALUES ('8a9182e13ab73c9e013ab74780e80000', '2012-10-31 22:44:07', '2012-12-13 17:19:25', null, null, null, '204.37000', 'xiaduoer@163.com', null, '', '', null, '2012-12-07 16:51:20', '2', '127.0.0.1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '4297f44b13955235245b2497399d7a93', null, null, '127.0.0.1', null, null, '0', 'xiaduoer', null, '402881833054c381013054d0bf800002', 'xiaduoer');
INSERT INTO `xx_member` VALUES ('8a9183a93a92e6de013a931577bb0000', '2012-10-24 22:03:08', '2012-12-14 14:37:31', '123', null, '2012-10-17 00:00:00', '200176.25000', '123@qq.com', '0', '', '', null, '2012-12-14 14:37:31', '0', '127.0.0.1', '7878467486@qq.com', '北京市', null, null, null, null, null, null, null, null, null, null, '张成', '建设银行', '西单支行', null, null, null, null, null, '123', '111', '4297f44b13955235245b2497399d7a93', '1352095466484_5d10233c974145cd86d898a4afe84087a4e4d2896be046b250cc3ddabae55217', '123', '127.0.0.1', null, null, '123', '123123', '123', '0731dcsoft2010031200000000000010', 'xiaduoer');
INSERT INTO `xx_member` VALUES ('8a9183f63ad5735c013ad581e48f0000', '2012-11-06 19:36:30', '2012-11-06 19:36:30', null, null, null, '0.00000', '12333@qq.com', null, '', '', null, '2012-11-06 19:36:30', '0', '127.0.0.1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '4297f44b13955235245b2497399d7a93', null, null, '127.0.0.1', null, null, '0', '7777', null, '402881833054c381013054d0bf800002', 'xiaduoer');

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
  PRIMARY KEY (`id`),
  KEY `xx_member_attribute_order_list` (`order_list`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_attribute
-- ----------------------------
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000001', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '姓名', null, '1', '0', '0');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000002', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '性别', null, '2', '1', '1');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000003', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '出生日期', null, '3', '2', '2');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000004', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '地区', null, '4', '3', '3');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000005', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '地址', null, '5', '4', '4');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000006', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '邮编', null, '6', '5', '5');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000007', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '电话', null, '7', '6', '6');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000008', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '手机', null, '8', '7', '7');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000009', '2011-01-01 00:00:00', '2012-12-08 13:01:19', '0', '', '', '推荐人', null, '9', '8', '8');
INSERT INTO `xx_member_attribute` VALUES ('4028bc743a9c37c6013a9c4d24c80000', '2012-10-26 17:00:32', '2012-11-10 12:44:56', '0', '', '', '收款卡号', null, '11', '0', null);
INSERT INTO `xx_member_attribute` VALUES ('4028bc743ab48628013ab4bdae9c0001', '2012-10-31 10:54:20', '2012-11-10 12:44:38', '3', '', '', '账号类型', '[\"建设银行\",\"农业银行\",\"光大银行\",\"中信银行\"]', '10', '3', null);
INSERT INTO `xx_member_attribute` VALUES ('8a8f81133ae86694013ae8a020320000', '2012-11-10 12:42:19', '2012-11-10 12:42:35', '3', '', '', '开户银行所在地', '[\"北京市\",\"河南省\"]', '13', '1', null);
INSERT INTO `xx_member_attribute` VALUES ('8a8f81133ae86694013ae8a1ced50001', '2012-11-10 12:44:09', '2012-11-10 12:44:09', '0', '', '', '开户姓名', null, '12', '2', null);
INSERT INTO `xx_member_attribute` VALUES ('8a8f81133ae86694013ae8a30b0d0002', '2012-11-10 12:45:30', '2012-11-10 12:45:30', '0', '', '', '支行名称', null, '14', '4', null);

-- ----------------------------
-- Table structure for `xx_member_goods`
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_goods`;
CREATE TABLE `xx_member_goods` (
  `favorite_member_set_id` varchar(32) NOT NULL,
  `favorite_goods_set_id` varchar(32) NOT NULL,
  PRIMARY KEY (`favorite_member_set_id`,`favorite_goods_set_id`),
  KEY `xx_member_favorite_goods_set` (`favorite_member_set_id`),
  KEY `xx_goods_favorite_member_set` (`favorite_goods_set_id`),
  CONSTRAINT `xx_member_goods_ibfk_1` FOREIGN KEY (`favorite_goods_set_id`) REFERENCES `xx_goods` (`id`),
  CONSTRAINT `xx_member_goods_ibfk_2` FOREIGN KEY (`favorite_member_set_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_member_rank`
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_rank`;
CREATE TABLE `xx_member_rank` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `is_default` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `preferential_scale` double NOT NULL,
  `score` int(11) NOT NULL,
  `lossrate` double NOT NULL,
  `benefits` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `score` (`score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_rank
-- ----------------------------
INSERT INTO `xx_member_rank` VALUES ('0731dcsoft2010031200000000000010', '2011-01-01 00:00:00', '2012-10-26 17:05:44', '', '普通会员', '100', '0', '0.96', '0.01');
INSERT INTO `xx_member_rank` VALUES ('402881833054c381013054d08bed0001', '2011-01-01 00:00:00', '2012-11-05 09:12:49', '', '一级会员', '100', '2000', '0.97', '0.01');
INSERT INTO `xx_member_rank` VALUES ('402881833054c381013054d0bf800002', '2011-01-01 00:00:00', '2012-10-26 16:55:12', '', '二级会员', '100', '5000', '0.98', '0.01');
INSERT INTO `xx_member_rank` VALUES ('402881833054c381013054d103ec0003', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '', '三级会员', '100', '10000', '0.99', '0.01');

-- ----------------------------
-- Table structure for `xx_message`
-- ----------------------------
DROP TABLE IF EXISTS `xx_message`;
CREATE TABLE `xx_message` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `content` text NOT NULL,
  `delete_status` int(11) NOT NULL,
  `is_read` bit(1) NOT NULL,
  `is_save_draftbox` bit(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `from_member_id` varchar(32) DEFAULT NULL,
  `to_member_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_message_from_member` (`from_member_id`),
  KEY `xx_message_to_member` (`to_member_id`),
  KEY `xx_message_create_date` (`create_date`),
  CONSTRAINT `xx_message_ibfk_1` FOREIGN KEY (`from_member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `xx_message_ibfk_2` FOREIGN KEY (`to_member_id`) REFERENCES `xx_member` (`id`)
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
  PRIMARY KEY (`id`),
  KEY `xx_navigation_order_list` (`order_list`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_navigation
-- ----------------------------
INSERT INTO `xx_navigation` VALUES ('8a8f820f3b1e601d013b1e7c0f890000', '2012-11-20 23:42:25', '2012-11-22 09:47:10', '', '', '快捷通道', '1', '4', '#');
INSERT INTO `xx_navigation` VALUES ('8a8f820f3b1e601d013b1e84d9fe0001', '2012-11-20 23:52:01', '2012-11-20 23:52:01', '', '', '关于名臣', '0', '1', '${base}/shop/article_list/gong_yi.htm');
INSERT INTO `xx_navigation` VALUES ('8a8f820f3b1e601d013b1e8532440002', '2012-11-20 23:52:23', '2012-11-20 23:52:23', '', '', '新手导航', '0', '2', '${base}/shop/article_list/xin_shou.htm');
INSERT INTO `xx_navigation` VALUES ('8a8f820f3b1e601d013b1e9e31050003', '2012-11-21 00:19:41', '2012-11-21 00:19:41', '', '', '名臣福利', '2', '1', '${base}/shop/article_list/gong_yi.htm');
INSERT INTO `xx_navigation` VALUES ('8a8f820f3b1e601d013b1e9f0a2f0004', '2012-11-21 00:20:37', '2012-11-21 00:20:37', '', '', '交易保障', '2', '0', '${base}/');
INSERT INTO `xx_navigation` VALUES ('8a8f820f3b1e601d013b1e9f57c00005', '2012-11-21 00:20:57', '2012-11-21 00:20:57', '', '', '常见问题', '2', '3', '${base}/');
INSERT INTO `xx_navigation` VALUES ('8a8f820f3b1e601d013b1e9fa7560006', '2012-11-21 00:21:17', '2012-11-21 00:21:17', '', '', '成功案例', '2', '4', '${base}/');
INSERT INTO `xx_navigation` VALUES ('8a8f820f3b1e601d013b1e9feb9c0007', '2012-11-21 00:21:35', '2012-11-21 00:21:35', '', '', '联系我们', '2', '5', '${base}/');
INSERT INTO `xx_navigation` VALUES ('8ae4839c3a887878013a88d9f043003e', '2012-10-22 22:21:55', '2012-11-20 23:42:41', '', '', '首  页', '1', '1', '${base}/');
INSERT INTO `xx_navigation` VALUES ('8ae4839c3a887878013a88dab9f2003f', '2012-10-22 22:22:46', '2012-11-20 23:43:22', '', '', '在线留言', '1', '6', '${base}/shop/leave_message.htm');
INSERT INTO `xx_navigation` VALUES ('8ae4839c3a887878013a88dfef940047', '2012-10-22 22:28:28', '2012-11-20 23:43:15', '', '', '交易保障', '1', '5', '${base}/shop/article_list/xin_shou.htm');
INSERT INTO `xx_navigation` VALUES ('8ae4839c3a887878013a88e3ea6f004c', '2012-10-22 22:32:49', '2012-11-20 23:43:08', '', '', '收卡价格', '1', '3', '${base}/shop/article_list/xin_shou.htm');

-- ----------------------------
-- Table structure for `xx_order`
-- ----------------------------
DROP TABLE IF EXISTS `xx_order`;
CREATE TABLE `xx_order` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `delivery_fee` decimal(15,5) NOT NULL,
  `delivery_type_name` varchar(255) NOT NULL,
  `goods_id_list_store` text,
  `memo` text,
  `order_sn` varchar(255) NOT NULL,
  `order_status` int(11) NOT NULL,
  `paid_amount` decimal(15,5) NOT NULL,
  `payment_config_name` varchar(255) NOT NULL,
  `payment_fee` decimal(15,5) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `ship_address` varchar(255) NOT NULL,
  `ship_area_store` text NOT NULL,
  `ship_mobile` varchar(255) DEFAULT NULL,
  `ship_name` varchar(255) NOT NULL,
  `ship_phone` varchar(255) DEFAULT NULL,
  `ship_zip_code` varchar(255) NOT NULL,
  `shipping_status` int(11) NOT NULL,
  `total_amount` decimal(15,5) NOT NULL,
  `total_product_price` decimal(15,5) NOT NULL,
  `total_product_quantity` int(11) NOT NULL,
  `total_product_weight` int(11) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  `delivery_type_id` varchar(32) DEFAULT NULL,
  `payment_config_id` varchar(32) DEFAULT NULL,
  `brand_id` varchar(255) NOT NULL,
  `pay_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `xx_order_delivery_type` (`delivery_type_id`),
  KEY `xx_order_member` (`member_id`),
  KEY `xx_order_payment_config` (`payment_config_id`),
  KEY `xx_order_create_date` (`create_date`),
  CONSTRAINT `xx_order_ibfk_1` FOREIGN KEY (`delivery_type_id`) REFERENCES `xx_delivery_type` (`id`),
  CONSTRAINT `xx_order_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `xx_order_ibfk_3` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_payment_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_order
-- ----------------------------
INSERT INTO `xx_order` VALUES ('402880853ae8e6be013ae8fc46870002', '2012-11-10 14:22:58', '2012-11-13 23:13:58', '0.00000', '免物流', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100017', '0', '44.97000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '44.97000', '44.97000', '3', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('402880853ae8e6be013ae8fe64380009', '2012-11-10 14:25:16', '2012-11-13 23:13:58', '0.00000', '免物流', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100018', '0', '200.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '200.00000', '200.00000', '1', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('402880853ae8e6be013ae90abcb20012', '2012-11-10 14:38:45', '2012-11-13 23:13:58', '0.00000', '免物流', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100019', '0', '60.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '60.00000', '60.00000', '1', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('402880853ae8e6be013ae90b96f7001a', '2012-11-10 14:39:41', '2012-11-13 23:13:58', '0.00000', '免物流', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100020', '0', '60.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '60.00000', '60.00000', '1', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('4028bc743ab4e741013ab53927310008', '2012-10-31 13:09:12', '2012-11-13 23:13:48', '12.00000', '物流1', '[\"8ae4839c3a887878013a88d311030032\"]', '', '100001', '0', '30.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '30.00000', '18.00000', '2', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('4028bc743ab55947013ab5656cee0007', '2012-10-31 13:57:34', '2012-11-13 23:13:48', '12.00000', '物流1', '[\"8ae4839c3a887878013a88d311030032\"]', '', '100002', '0', '192.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '192.00000', '180.00000', '1', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('4028bc743ac8cf21013ac8e8a5aa0001', '2012-11-04 08:53:40', '2012-11-13 23:13:48', '12.00000', '物流1', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100004', '0', '192.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '192.00000', '180.00000', '1', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('4028bc743ade682c013ade7894a10001', '2012-11-08 13:22:55', '2012-11-13 23:13:48', '12.00000', '物流1', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100005', '0', '16.50000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '16.50000', '4.50000', '1', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('4028bc743b645e3a013b64622dbe0000', '2012-12-04 13:27:34', '2012-12-04 13:41:07', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100025', '0', '20.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('4028bc743b647802013b647b7a7d0000', '2012-12-04 13:55:12', '2012-12-04 13:55:15', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100026', '0', '20.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('4028bc743b64ce89013b652e427e0001', '2012-12-04 17:10:28', '2012-12-04 17:10:28', '0.00000', '虚拟配送', null, null, 'DD100027', '0', '0.00000', '易宝非银行卡支付(专业版)', '0.00000', '0', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743b64ce89013b6524016e0000', '', null);
INSERT INTO `xx_order` VALUES ('4028bc743b64ce89013b652f14a30005', '2012-12-04 17:11:22', '2012-12-04 17:11:22', '0.00000', '虚拟配送', null, null, 'DD100028', '0', '0.00000', '易宝非银行卡支付(专业版)', '0.00000', '0', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743b64ce89013b6524016e0000', '', null);
INSERT INTO `xx_order` VALUES ('4028bc743b69af9e013b69b05d2d0000', '2012-12-05 14:11:04', '2012-12-05 14:11:04', '0.00000', '虚拟配送', null, null, 'DD100029', '0', '0.00000', '易宝非银行卡支付(专业版)', '0.00000', '0', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743b64ce89013b6524016e0000', '', null);
INSERT INTO `xx_order` VALUES ('4028bc743b69e110013b69e282270000', '2012-12-05 15:05:50', '2012-12-05 15:05:50', '0.00000', '虚拟配送', null, null, 'DD100030', '0', '0.00000', '易宝非银行卡支付(专业版)', '0.00000', '0', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743b64ce89013b6524016e0000', '', null);
INSERT INTO `xx_order` VALUES ('4028bc743b69e110013b69e6a3760004', '2012-12-05 15:10:21', '2012-12-05 15:10:21', '0.00000', '虚拟配送', null, null, 'DD100031', '0', '0.00000', '易宝非银行卡支付(专业版)', '0.00000', '0', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743b64ce89013b6524016e0000', '', null);
INSERT INTO `xx_order` VALUES ('4028bc743b69e110013b69e6d8a00009', '2012-12-05 15:10:34', '2012-12-05 15:10:34', '0.00000', '虚拟配送', null, null, 'DD100032', '0', '0.00000', '易宝非银行卡支付(专业版)', '0.00000', '0', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743b64ce89013b6524016e0000', '', null);
INSERT INTO `xx_order` VALUES ('4028bc743b6e0818013b6e252f780000', '2012-12-06 10:57:08', '2012-12-06 10:57:08', '0.00000', '虚拟配送', null, null, 'DD100033', '0', '0.00000', '易宝非银行卡支付(专业版)', '0.00000', '0', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743b64ce89013b6524016e0000', '', null);
INSERT INTO `xx_order` VALUES ('4028bc743b742052013b7421deb80000', '2012-12-07 14:51:15', '2012-12-07 14:51:15', '0.00000', '虚拟配送', null, null, 'DD100036', '0', '0.00000', '易宝支付', '0.00000', '0', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b742994013b742a02f20000', '2012-12-07 15:00:08', '2012-12-07 15:00:13', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100037', '0', '20.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b742994013b742dbd990004', '2012-12-07 15:04:12', '2012-12-07 15:04:18', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100038', '0', '20.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b7447e7013b744974ff0000', '2012-12-07 15:34:29', '2012-12-07 15:34:33', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100039', '0', '20.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b7447e7013b744e56430005', '2012-12-07 15:39:49', '2012-12-07 15:39:52', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100040', '0', '20.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b7452db013b7453b2e20000', '2012-12-07 15:45:40', '2012-12-07 15:45:40', '0.00000', '虚拟配送', null, null, 'DD100041', '0', '0.00000', '易宝支付', '0.00000', '0', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b7452db013b7453c4370003', '2012-12-07 15:45:45', '2012-12-07 15:45:49', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100042', '0', '20.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b7466ad013b746cb99f0000', '2012-12-07 16:13:00', '2012-12-07 16:13:04', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100043', '0', '20.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b747cf7013b74800d210000', '2012-12-07 16:34:07', '2012-12-07 16:34:11', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100044', '0', '20.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b747cf7013b748190c40005', '2012-12-07 16:35:46', '2012-12-07 16:35:52', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100045', '0', '20.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b748301013b7483c3c10000', '2012-12-07 16:38:10', '2012-12-07 16:38:15', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100046', '0', '20.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b748301013b7485e28a0005', '2012-12-07 16:40:29', '2012-12-07 16:40:33', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100047', '0', '20.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b748301013b748bede7000a', '2012-12-07 16:47:05', '2012-12-07 16:47:08', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100048', '0', '20.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b748c5c013b748d07170000', '2012-12-07 16:48:17', '2012-12-07 16:48:21', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100049', '0', '20.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b780fea013b788b51920000', '2012-12-08 11:24:54', '2012-12-08 11:24:54', '0.00000', '虚拟配送', null, null, 'DD100050', '0', '0.00000', '易宝支付', '0.00000', '0', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b887855013b88e6f98d0000', '2012-12-11 15:38:56', '2012-12-11 15:38:56', '0.00000', '虚拟配送', null, null, 'DD100051', '0', '0.00000', '殴飞接口', '0.00000', '0', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743b886ba3013b886eeb4c0000', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b887855013b88ea14f60004', '2012-12-11 15:42:20', '2012-12-11 15:42:20', '0.00000', '虚拟配送', null, null, 'DD100052', '0', '0.00000', '殴飞接口', '0.00000', '0', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743b886ba3013b886eeb4c0000', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b887855013b88ea66420007', '2012-12-11 15:42:41', '2012-12-11 15:42:41', '0.00000', '虚拟配送', null, null, 'DD100053', '0', '0.00000', '易宝非银行卡支付(专业版)', '0.00000', '0', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743b64ce89013b6524016e0000', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b887855013b88ea8043000a', '2012-12-11 15:42:47', '2012-12-12 11:17:37', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100054', '0', '20.00000', '易宝通用支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b8dfca5013b8dfeeca50000', '2012-12-12 15:23:12', '2012-12-12 15:23:19', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100055', '0', '20.00000', '易宝通用支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b938b55013b938c67250000', '2012-12-13 17:15:50', '2012-12-13 17:15:50', '0.00000', '虚拟配送', null, null, 'DD100056', '0', '0.00000', '殴飞接口', '0.00000', '0', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743b886ba3013b886eeb4c0000', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b938b55013b938f9eb10004', '2012-12-13 17:19:21', '2012-12-13 17:19:24', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100057', '0', '20.00000', '易宝通用支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028bc743b98215e013b982214540000', '2012-12-14 14:37:48', '2012-12-14 14:37:48', '0.00000', '虚拟配送', null, null, 'DD100058', '0', '0.00000', '殴飞接口', '0.00000', '0', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743b886ba3013b886eeb4c0000', '8ae4839c3a887878013a88acef930005', null);
INSERT INTO `xx_order` VALUES ('4028e3373b17db72013b17ebcd240004', '2012-11-19 17:07:07', '2012-11-19 17:07:07', '0.00000', '虚拟配送', null, '', 'DD100024', '0', '0.00000', '易宝支付', '0.00000', '0', 'xxs', '{\"orderList\":0,\"grade\":1,\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '100.00000', '100.00000', '1', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('8a8f80153ae0be07013ae0c469ce0002', '2012-11-09 00:04:59', '2012-11-13 23:13:58', '0.00000', '免物流', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100007', '0', '54.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '54.00000', '54.00000', '1', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('8a8f80153ae0be07013ae0c8fa830008', '2012-11-09 00:09:58', '2012-11-13 23:13:58', '0.00000', '免物流', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100008', '0', '9.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '9.00000', '9.00000', '1', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('8a8f80153ae0be07013ae0cdd69f000e', '2012-11-09 00:15:17', '2012-11-13 23:13:58', '0.00000', '免物流', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100009', '0', '13.50000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '13.50000', '13.50000', '1', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('8a8f80153ae0d04c013ae0d4c3f10001', '2012-11-09 00:22:51', '2012-11-13 23:13:58', '0.00000', '免物流', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100010', '0', '9.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '9.00000', '9.00000', '1', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('8a8f80153ae0d04c013ae0d566750007', '2012-11-09 00:23:32', '2012-11-13 23:13:58', '0.00000', '免物流', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100011', '0', '9.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '9.00000', '9.00000', '1', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('8a8f80153ae0d04c013ae0d7886d000d', '2012-11-09 00:25:52', '2012-11-13 23:13:58', '0.00000', '免物流', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100012', '0', '9.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '9.00000', '9.00000', '1', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('8a8f80153ae0d04c013ae0e28a430014', '2012-11-09 00:37:53', '2012-11-13 23:13:58', '0.00000', '免物流', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100013', '0', '9.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '9.00000', '9.00000', '1', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('8a8f80153ae0d04c013ae0e42d72001b', '2012-11-09 00:39:41', '2012-11-13 23:13:58', '0.00000', '免物流', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100014', '0', '180.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '180.00000', '180.00000', '1', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('8a8f80153ae0d04c013ae0e552e40022', '2012-11-09 00:40:56', '2012-11-13 23:13:58', '0.00000', '免物流', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100015', '0', '90.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '90.00000', '90.00000', '1', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('8a8f80153ae0e850013ae0eebc640001', '2012-11-09 00:51:13', '2012-11-13 23:13:58', '0.00000', '免物流', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100016', '0', '4.50000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '4.50000', '4.50000', '1', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('8a8f82133aff6bbb013aff6fc8c60001', '2012-11-14 23:00:46', '2012-11-14 23:00:46', '0.00000', '无配送', null, '', 'DD100021', '0', '0.00000', '货到付款', '0.00000', '0', 'sssaa', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '23', '摩卡', '2342', '2343', '0', '100.00000', '100.00000', '1', '0', '4028bc743ab48628013ab4b892a00000', '8a8f81d93afa3e77013afa5526f80000', null, '', null);
INSERT INTO `xx_order` VALUES ('8a8f82133aff6bbb013aff70ee860005', '2012-11-14 23:02:02', '2012-11-14 23:02:02', '0.00000', '无配送', null, '', 'DD100022', '0', '0.00000', '易宝支付', '0.00000', '0', 'sssaa', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '23', '摩卡', '2342', '2343', '0', '20.00000', '20.00000', '1', '0', '4028bc743ab48628013ab4b892a00000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('8a8f82133aff6bbb013aff721eda000a', '2012-11-14 23:03:20', '2012-11-14 23:03:20', '0.00000', '无配送', null, '', 'DD100023', '0', '0.00000', '易宝支付', '0.00000', '0', 'sssaa', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '23', '摩卡', '2342', '2343', '0', '10.00000', '10.00000', '1', '0', '4028bc743ab48628013ab4b892a00000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('8a91807c3b70d14d013b70d1f9d40000', '2012-12-06 23:25:07', '2012-12-06 23:25:33', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100034', '0', '20.00000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"grade\":1,\"orderList\":0,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '20.00000', '20.00000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('8a91807c3b70d14d013b70d44a5e0009', '2012-12-06 23:27:39', '2012-12-06 23:28:17', '0.00000', '虚拟配送', '[\"8ae4839c3a887878013a88d311030032\"]', null, 'DD100035', '0', '17.60000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"grade\":1,\"orderList\":0,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '17.60000', '17.60000', '0', '0', '8a9183a93a92e6de013a931577bb0000', '8a8f81d93afa3e77013afa5526f80000', '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('8a9182e13ab666b7013ab6707b5a0002', '2012-10-31 18:49:15', '2012-11-13 23:13:48', '12.00000', '物流1', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100003', '2', '69.00000', '易宝支付', '0.00000', '2', 'sssaa', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '23', '摩卡', '2342', '2343', '2', '69.00000', '57.00000', '2', '0', '4028bc743ab48628013ab4b892a00000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);
INSERT INTO `xx_order` VALUES ('ff8080813adff468013ae07396a60001', '2012-11-08 22:36:42', '2012-11-13 23:13:48', '12.00000', '物流1', '[\"8ae4839c3a887878013a88d311030032\"]', '', 'DD100006', '0', '25.50000', '易宝支付', '0.00000', '2', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '234234', 'xxs', '23423', '23423', '0', '25.50000', '13.50000', '3', '0', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', '', null);

-- ----------------------------
-- Table structure for `xx_order_item`
-- ----------------------------
DROP TABLE IF EXISTS `xx_order_item`;
CREATE TABLE `xx_order_item` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `delivery_quantity` int(11) NOT NULL,
  `goods_html_path` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(15,5) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_sn` varchar(255) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `order_id` varchar(32) NOT NULL,
  `card_num` text NOT NULL,
  `card_pwd` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_order_item_order` (`order_id`),
  KEY `xx_order_item_product` (`product_id`),
  CONSTRAINT `xx_order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `xx_order` (`id`),
  CONSTRAINT `xx_order_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `xx_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_order_item
-- ----------------------------
INSERT INTO `xx_order_item` VALUES ('402880853ae8e6be013ae8fc46ad0003', '2012-11-10 14:22:58', '2012-11-10 14:22:58', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [15元]', '14.99000', '3', 'SN_F2BD0F8D0A4E', '8ae4839c3a887878013a88d33fcf0035', '402880853ae8e6be013ae8fc46870002', '', '');
INSERT INTO `xx_order_item` VALUES ('402880853ae8e6be013ae8fe6454000a', '2012-11-10 14:25:16', '2012-11-10 14:25:16', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [200元]', '200.00000', '1', 'SN_55D1AF4F15CA', '8ae4839c3a887878013a88d35b96003a', '402880853ae8e6be013ae8fe64380009', '', '');
INSERT INTO `xx_order_item` VALUES ('402880853ae8e6be013ae90abccd0013', '2012-11-10 14:38:45', '2012-11-10 14:38:45', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [60元]', '60.00000', '1', 'SN_691D4BBC4468', '8ae4839c3a887878013a88d347990038', '402880853ae8e6be013ae90abcb20012', '', '');
INSERT INTO `xx_order_item` VALUES ('402880853ae8e6be013ae90b9712001b', '2012-11-10 14:39:41', '2012-11-10 14:39:41', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [60元]', '60.00000', '1', 'SN_691D4BBC4468', '8ae4839c3a887878013a88d347990038', '402880853ae8e6be013ae90b96f7001a', '', '');
INSERT INTO `xx_order_item` VALUES ('4028bc743ab4e741013ab53927400009', '2012-10-31 13:09:12', '2012-10-31 13:09:12', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [10元]', '9.00000', '2', 'SN_E7A926BF2C5A', '8ae4839c3a887878013a88d3381e0034', '4028bc743ab4e741013ab53927310008', '', '');
INSERT INTO `xx_order_item` VALUES ('4028bc743ab55947013ab5656d4c0008', '2012-10-31 13:57:34', '2012-10-31 13:57:34', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [200元]', '180.00000', '1', 'SN_55D1AF4F15CA', '8ae4839c3a887878013a88d35b96003a', '4028bc743ab55947013ab5656cee0007', '', '');
INSERT INTO `xx_order_item` VALUES ('4028bc743ac8cf21013ac8e8a5d90002', '2012-11-04 08:53:40', '2012-11-04 08:53:40', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [200元]', '180.00000', '1', 'SN_55D1AF4F15CA', '8ae4839c3a887878013a88d35b96003a', '4028bc743ac8cf21013ac8e8a5aa0001', '', '');
INSERT INTO `xx_order_item` VALUES ('4028bc743ade682c013ade7894ef0002', '2012-11-08 13:22:55', '2012-11-08 13:22:55', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [5元]', '4.50000', '1', 'SN_8B79E4D89FB8', '8ae4839c3a887878013a88d334590033', '4028bc743ade682c013ade7894a10001', '', '');
INSERT INTO `xx_order_item` VALUES ('4028bc743b645e3a013b64622e2b0001', '2012-12-04 13:27:34', '2012-12-04 13:27:34', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b645e3a013b64622dbe0000', '11111111', '22222222');
INSERT INTO `xx_order_item` VALUES ('4028bc743b647802013b647b7abb0001', '2012-12-04 13:55:12', '2012-12-04 13:55:12', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b647802013b647b7a7d0000', '11111111', '22222222');
INSERT INTO `xx_order_item` VALUES ('4028bc743b64ce89013b652e42fb0002', '2012-12-04 17:10:28', '2012-12-04 17:10:28', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b64ce89013b652e427e0001', '11111111', '22222222');
INSERT INTO `xx_order_item` VALUES ('4028bc743b64ce89013b652f14d20006', '2012-12-04 17:11:22', '2012-12-04 17:11:22', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b64ce89013b652f14a30005', '11111111', '22222222');
INSERT INTO `xx_order_item` VALUES ('4028bc743b69af9e013b69b05d9a0001', '2012-12-05 14:11:04', '2012-12-05 14:11:04', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b69af9e013b69b05d2d0000', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b69e110013b69e282550001', '2012-12-05 15:05:50', '2012-12-05 15:05:50', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b69e110013b69e282270000', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b69e110013b69e6a3b50005', '2012-12-05 15:10:21', '2012-12-05 15:10:21', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b69e110013b69e6a3760004', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b69e110013b69e6d94c000a', '2012-12-05 15:10:34', '2012-12-05 15:10:34', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b69e110013b69e6d8a00009', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b6e0818013b6e252f970001', '2012-12-06 10:57:09', '2012-12-06 10:57:09', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b6e0818013b6e252f780000', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b742052013b7421df440001', '2012-12-07 14:51:15', '2012-12-07 14:51:15', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b742052013b7421deb80000', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b742994013b742a03210001', '2012-12-07 15:00:08', '2012-12-07 15:00:08', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b742994013b742a02f20000', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b742994013b742dbdc80005', '2012-12-07 15:04:13', '2012-12-07 15:04:13', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b742994013b742dbd990004', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b7447e7013b7449751e0001', '2012-12-07 15:34:29', '2012-12-07 15:34:29', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b7447e7013b744974ff0000', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b7447e7013b744e56620006', '2012-12-07 15:39:49', '2012-12-07 15:39:49', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b7447e7013b744e56430005', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b7452db013b7453b3110001', '2012-12-07 15:45:40', '2012-12-07 15:45:40', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b7452db013b7453b2e20000', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b7452db013b7453c4470004', '2012-12-07 15:45:45', '2012-12-07 15:45:45', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b7452db013b7453c4370003', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b7466ad013b746cb9ce0001', '2012-12-07 16:13:00', '2012-12-07 16:13:00', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b7466ad013b746cb99f0000', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b747cf7013b74800d400001', '2012-12-07 16:34:07', '2012-12-07 16:34:07', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b747cf7013b74800d210000', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b747cf7013b748190f20006', '2012-12-07 16:35:46', '2012-12-07 16:35:46', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b747cf7013b748190c40005', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b748301013b7483c3ef0001', '2012-12-07 16:38:10', '2012-12-07 16:38:10', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b748301013b7483c3c10000', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b748301013b7485e2a90006', '2012-12-07 16:40:29', '2012-12-07 16:40:29', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b748301013b7485e28a0005', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b748301013b748bedf6000b', '2012-12-07 16:47:05', '2012-12-07 16:47:05', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b748301013b748bede7000a', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b748c5c013b748d07650001', '2012-12-07 16:48:17', '2012-12-07 16:48:17', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b748c5c013b748d07170000', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b780fea013b788b51c10001', '2012-12-08 11:24:54', '2012-12-08 11:24:54', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b780fea013b788b51920000', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b887855013b88e6f9cb0001', '2012-12-11 15:38:56', '2012-12-11 15:38:56', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b887855013b88e6f98d0000', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('4028bc743b887855013b88ea15340005', '2012-12-11 15:42:20', '2012-12-11 15:42:20', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b887855013b88ea14f60004', 'kkkk', 'llll');
INSERT INTO `xx_order_item` VALUES ('4028bc743b887855013b88ea66b00008', '2012-12-11 15:42:41', '2012-12-11 15:42:41', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b887855013b88ea66420007', 'kkkk', 'llll');
INSERT INTO `xx_order_item` VALUES ('4028bc743b887855013b88ea8081000b', '2012-12-11 15:42:47', '2012-12-11 15:42:47', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b887855013b88ea8043000a', 'kkkk', 'llll');
INSERT INTO `xx_order_item` VALUES ('4028bc743b8dfca5013b8dfeecd40001', '2012-12-12 15:23:12', '2012-12-12 15:23:12', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b8dfca5013b8dfeeca50000', 'yyyyy', '88888');
INSERT INTO `xx_order_item` VALUES ('4028bc743b938b55013b938c69670001', '2012-12-13 17:15:51', '2012-12-13 17:15:51', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b938b55013b938c67250000', '555', '666');
INSERT INTO `xx_order_item` VALUES ('4028bc743b938b55013b938f9f4d0005', '2012-12-13 17:19:21', '2012-12-13 17:19:21', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b938b55013b938f9eb10004', '555', '666');
INSERT INTO `xx_order_item` VALUES ('4028bc743b98215e013b982214730001', '2012-12-14 14:37:48', '2012-12-14 14:37:48', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '4028bc743b98215e013b982214540000', 'uuu', '8888');
INSERT INTO `xx_order_item` VALUES ('8a8f80153ae0be07013ae0c469e80003', '2012-11-09 00:04:59', '2012-11-09 00:04:59', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [60元]', '54.00000', '1', 'SN_691D4BBC4468', '8ae4839c3a887878013a88d347990038', '8a8f80153ae0be07013ae0c469ce0002', '', '');
INSERT INTO `xx_order_item` VALUES ('8a8f80153ae0be07013ae0c8faa30009', '2012-11-09 00:09:58', '2012-11-09 00:09:58', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [10元]', '9.00000', '1', 'SN_E7A926BF2C5A', '8ae4839c3a887878013a88d3381e0034', '8a8f80153ae0be07013ae0c8fa830008', '', '');
INSERT INTO `xx_order_item` VALUES ('8a8f80153ae0be07013ae0cdd6c6000f', '2012-11-09 00:15:17', '2012-11-09 00:15:17', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [15元]', '13.50000', '1', 'SN_F2BD0F8D0A4E', '8ae4839c3a887878013a88d33fcf0035', '8a8f80153ae0be07013ae0cdd69f000e', '', '');
INSERT INTO `xx_order_item` VALUES ('8a8f80153ae0d04c013ae0d4c4430002', '2012-11-09 00:22:51', '2012-11-09 00:22:51', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [10元]', '9.00000', '1', 'SN_E7A926BF2C5A', '8ae4839c3a887878013a88d3381e0034', '8a8f80153ae0d04c013ae0d4c3f10001', '', '');
INSERT INTO `xx_order_item` VALUES ('8a8f80153ae0d04c013ae0d566940008', '2012-11-09 00:23:32', '2012-11-09 00:23:32', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [10元]', '9.00000', '1', 'SN_E7A926BF2C5A', '8ae4839c3a887878013a88d3381e0034', '8a8f80153ae0d04c013ae0d566750007', '', '');
INSERT INTO `xx_order_item` VALUES ('8a8f80153ae0d04c013ae0d78893000e', '2012-11-09 00:25:52', '2012-11-09 00:25:52', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [10元]', '9.00000', '1', 'SN_E7A926BF2C5A', '8ae4839c3a887878013a88d3381e0034', '8a8f80153ae0d04c013ae0d7886d000d', '', '');
INSERT INTO `xx_order_item` VALUES ('8a8f80153ae0d04c013ae0e28a6d0015', '2012-11-09 00:37:53', '2012-11-09 00:37:53', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [10元]', '9.00000', '1', 'SN_E7A926BF2C5A', '8ae4839c3a887878013a88d3381e0034', '8a8f80153ae0d04c013ae0e28a430014', '', '');
INSERT INTO `xx_order_item` VALUES ('8a8f80153ae0d04c013ae0e42db7001c', '2012-11-09 00:39:41', '2012-11-09 00:39:41', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [200元]', '180.00000', '1', 'SN_55D1AF4F15CA', '8ae4839c3a887878013a88d35b96003a', '8a8f80153ae0d04c013ae0e42d72001b', '', '');
INSERT INTO `xx_order_item` VALUES ('8a8f80153ae0d04c013ae0e553090023', '2012-11-09 00:40:56', '2012-11-09 00:40:56', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [100元]', '90.00000', '1', 'SN_DC8CC08204F0', '8ae4839c3a887878013a88d347ba0039', '8a8f80153ae0d04c013ae0e552e40022', '', '');
INSERT INTO `xx_order_item` VALUES ('8a8f80153ae0e850013ae0eebcbf0002', '2012-11-09 00:51:13', '2012-11-09 00:51:13', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [5元]', '4.50000', '1', 'SN_8B79E4D89FB8', '8ae4839c3a887878013a88d334590033', '8a8f80153ae0e850013ae0eebc640001', '', '');
INSERT INTO `xx_order_item` VALUES ('8a8f82133aff6bbb013aff6fc91e0002', '2012-11-14 23:00:47', '2012-11-14 23:00:47', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [100元]', '100.00000', '1', 'SN_DC8CC08204F0', '8ae4839c3a887878013a88d347ba0039', '8a8f82133aff6bbb013aff6fc8c60001', '', '');
INSERT INTO `xx_order_item` VALUES ('8a8f82133aff6bbb013aff70eeb60006', '2012-11-14 23:02:02', '2012-11-14 23:02:02', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '8a8f82133aff6bbb013aff70ee860005', '', '');
INSERT INTO `xx_order_item` VALUES ('8a8f82133aff6bbb013aff721f15000b', '2012-11-14 23:03:20', '2012-11-14 23:03:20', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [10元]', '10.00000', '1', 'SN_E7A926BF2C5A', '8ae4839c3a887878013a88d3381e0034', '8a8f82133aff6bbb013aff721eda000a', '', '');
INSERT INTO `xx_order_item` VALUES ('8a91807c3b70d14d013b70d1fa270001', '2012-12-06 23:25:07', '2012-12-06 23:25:07', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '8a91807c3b70d14d013b70d1f9d40000', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('8a91807c3b70d14d013b70d44a90000a', '2012-12-06 23:27:39', '2012-12-06 23:27:39', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [20元]', '20.00000', '1', 'SN_79DDA7EB5CBB', '8ae4839c3a887878013a88d343ae0036', '8a91807c3b70d14d013b70d44a5e0009', 'FE5005100168', '227386847613318');
INSERT INTO `xx_order_item` VALUES ('8a9182e13ab666b7013ab6707bb00003', '2012-10-31 18:49:15', '2012-10-31 19:55:12', '2', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [30元]', '28.50000', '2', 'SN_5690B347AA89', '8ae4839c3a887878013a88d343fe0037', '8a9182e13ab666b7013ab6707b5a0002', '', '');
INSERT INTO `xx_order_item` VALUES ('ff8080813adff468013ae07396f70002', '2012-11-08 22:36:42', '2012-11-08 22:36:42', '0', '/html/201210/511c9da09b1f486dba228e497878c2f5.html', '腾讯一卡通 [5元]', '4.50000', '3', 'SN_8B79E4D89FB8', '8ae4839c3a887878013a88d334590033', 'ff8080813adff468013ae07396a60001', '', '');

-- ----------------------------
-- Table structure for `xx_order_log`
-- ----------------------------
DROP TABLE IF EXISTS `xx_order_log`;
CREATE TABLE `xx_order_log` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `info` text,
  `operator` varchar(255) DEFAULT NULL,
  `order_log_type` int(11) NOT NULL,
  `order_sn` varchar(255) NOT NULL,
  `order_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_order_log_order` (`order_id`),
  KEY `xx_order_log_create_date` (`create_date`),
  CONSTRAINT `xx_order_log_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_order_log
-- ----------------------------
INSERT INTO `xx_order_log` VALUES ('402880853ae8e6be013ae8fc46bc0004', '2012-11-10 14:22:58', '2012-11-10 14:22:58', null, null, '0', 'DD100017', '402880853ae8e6be013ae8fc46870002');
INSERT INTO `xx_order_log` VALUES ('402880853ae8e6be013ae8fd92910007', '2012-11-10 14:24:23', '2012-11-10 14:24:23', '支付总金额: ￥44.97元', null, '2', 'DD100017', '402880853ae8e6be013ae8fc46870002');
INSERT INTO `xx_order_log` VALUES ('402880853ae8e6be013ae8fe6672000b', '2012-11-10 14:25:17', '2012-11-10 14:25:17', null, null, '0', 'DD100018', '402880853ae8e6be013ae8fe64380009');
INSERT INTO `xx_order_log` VALUES ('402880853ae8e6be013ae8ff0da20010', '2012-11-10 14:26:00', '2012-11-10 14:26:00', '支付总金额: ￥200.00元', null, '2', 'DD100018', '402880853ae8e6be013ae8fe64380009');
INSERT INTO `xx_order_log` VALUES ('402880853ae8e6be013ae90abcdd0014', '2012-11-10 14:38:45', '2012-11-10 14:38:45', null, null, '0', 'DD100019', '402880853ae8e6be013ae90abcb20012');
INSERT INTO `xx_order_log` VALUES ('402880853ae8e6be013ae90adf360018', '2012-11-10 14:38:54', '2012-11-10 14:38:54', '支付总金额: ￥60.00元', null, '2', 'DD100019', '402880853ae8e6be013ae90abcb20012');
INSERT INTO `xx_order_log` VALUES ('402880853ae8e6be013ae90b971f001c', '2012-11-10 14:39:41', '2012-11-10 14:39:41', null, null, '0', 'DD100020', '402880853ae8e6be013ae90b96f7001a');
INSERT INTO `xx_order_log` VALUES ('402880853ae8e6be013ae90bad940020', '2012-11-10 14:39:47', '2012-11-10 14:39:47', '支付总金额: ￥60.00元', null, '2', 'DD100020', '402880853ae8e6be013ae90b96f7001a');
INSERT INTO `xx_order_log` VALUES ('4028bc743ab4e741013ab5392750000a', '2012-10-31 13:09:12', '2012-10-31 13:09:12', null, null, '0', '100001', '4028bc743ab4e741013ab53927310008');
INSERT INTO `xx_order_log` VALUES ('4028bc743ab55947013ab55f86ec0002', '2012-10-31 13:51:07', '2012-10-31 13:51:07', '支付总金额: ￥30.00元', null, '2', '100001', '4028bc743ab4e741013ab53927310008');
INSERT INTO `xx_order_log` VALUES ('4028bc743ab55947013ab5656d4c0009', '2012-10-31 13:57:34', '2012-10-31 13:57:34', null, null, '0', '100002', '4028bc743ab55947013ab5656cee0007');
INSERT INTO `xx_order_log` VALUES ('4028bc743ab55947013ab567b7e8000b', '2012-10-31 14:00:04', '2012-10-31 14:00:04', '支付总金额: ￥192.00元', null, '2', '100002', '4028bc743ab55947013ab5656cee0007');
INSERT INTO `xx_order_log` VALUES ('4028bc743ac8cf21013ac8e8a5e80003', '2012-11-04 08:53:40', '2012-11-04 08:53:40', null, null, '0', 'DD100004', '4028bc743ac8cf21013ac8e8a5aa0001');
INSERT INTO `xx_order_log` VALUES ('4028bc743ac8cf21013ac8e8bc7e0005', '2012-11-04 08:53:46', '2012-11-04 08:53:46', '支付总金额: ￥192.00元', null, '2', 'DD100004', '4028bc743ac8cf21013ac8e8a5aa0001');
INSERT INTO `xx_order_log` VALUES ('4028bc743ade682c013ade7894ff0003', '2012-11-08 13:22:55', '2012-11-08 13:22:55', null, null, '0', 'DD100005', '4028bc743ade682c013ade7894a10001');
INSERT INTO `xx_order_log` VALUES ('4028bc743ade682c013ade78a8680005', '2012-11-08 13:23:00', '2012-11-08 13:23:00', '支付总金额: ￥16.50元', null, '2', 'DD100005', '4028bc743ade682c013ade7894a10001');
INSERT INTO `xx_order_log` VALUES ('4028bc743b645e3a013b64622e5a0002', '2012-12-04 13:27:34', '2012-12-04 13:27:34', null, null, '0', 'DD100025', '4028bc743b645e3a013b64622dbe0000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b645e3a013b646e98260006', '2012-12-04 13:41:07', '2012-12-04 13:41:07', '支付总金额: ￥20.00元', null, '2', 'DD100025', '4028bc743b645e3a013b64622dbe0000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b647802013b647b7aea0002', '2012-12-04 13:55:12', '2012-12-04 13:55:12', null, null, '0', 'DD100026', '4028bc743b647802013b647b7a7d0000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b647802013b647b88d40006', '2012-12-04 13:55:15', '2012-12-04 13:55:15', '支付总金额: ￥20.00元', null, '2', 'DD100026', '4028bc743b647802013b647b7a7d0000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b64ce89013b652e43a70003', '2012-12-04 17:10:29', '2012-12-04 17:10:29', null, null, '0', 'DD100027', '4028bc743b64ce89013b652e427e0001');
INSERT INTO `xx_order_log` VALUES ('4028bc743b64ce89013b652f15100007', '2012-12-04 17:11:22', '2012-12-04 17:11:22', null, null, '0', 'DD100028', '4028bc743b64ce89013b652f14a30005');
INSERT INTO `xx_order_log` VALUES ('4028bc743b69af9e013b69b05daa0002', '2012-12-05 14:11:04', '2012-12-05 14:11:04', null, null, '0', 'DD100029', '4028bc743b69af9e013b69b05d2d0000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b69e110013b69e282650002', '2012-12-05 15:05:50', '2012-12-05 15:05:50', null, null, '0', 'DD100030', '4028bc743b69e110013b69e282270000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b69e110013b69e6a3d40006', '2012-12-05 15:10:21', '2012-12-05 15:10:21', null, null, '0', 'DD100031', '4028bc743b69e110013b69e6a3760004');
INSERT INTO `xx_order_log` VALUES ('4028bc743b69e110013b69e6d95b000b', '2012-12-05 15:10:34', '2012-12-05 15:10:34', null, null, '0', 'DD100032', '4028bc743b69e110013b69e6d8a00009');
INSERT INTO `xx_order_log` VALUES ('4028bc743b6e0818013b6e252fb60002', '2012-12-06 10:57:09', '2012-12-06 10:57:09', null, null, '0', 'DD100033', '4028bc743b6e0818013b6e252f780000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b742052013b7421df830002', '2012-12-07 14:51:15', '2012-12-07 14:51:15', null, null, '0', 'DD100036', '4028bc743b742052013b7421deb80000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b742994013b742a03310002', '2012-12-07 15:00:08', '2012-12-07 15:00:08', null, null, '0', 'DD100037', '4028bc743b742994013b742a02f20000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b742994013b742dbde70006', '2012-12-07 15:04:13', '2012-12-07 15:04:13', null, null, '0', 'DD100038', '4028bc743b742994013b742dbd990004');
INSERT INTO `xx_order_log` VALUES ('4028bc743b742994013b742dd2f5000a', '2012-12-07 15:04:18', '2012-12-07 15:04:18', '支付总金额: ￥20.00元', null, '2', 'DD100038', '4028bc743b742994013b742dbd990004');
INSERT INTO `xx_order_log` VALUES ('4028bc743b7447e7013b7449753d0002', '2012-12-07 15:34:29', '2012-12-07 15:34:29', null, null, '0', 'DD100039', '4028bc743b7447e7013b744974ff0000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b7447e7013b744e56820007', '2012-12-07 15:39:49', '2012-12-07 15:39:49', null, null, '0', 'DD100040', '4028bc743b7447e7013b744e56430005');
INSERT INTO `xx_order_log` VALUES ('4028bc743b7452db013b7453b3200002', '2012-12-07 15:45:40', '2012-12-07 15:45:40', null, null, '0', 'DD100041', '4028bc743b7452db013b7453b2e20000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b7452db013b7453c4560005', '2012-12-07 15:45:45', '2012-12-07 15:45:45', null, null, '0', 'DD100042', '4028bc743b7452db013b7453c4370003');
INSERT INTO `xx_order_log` VALUES ('4028bc743b7466ad013b746cb9dd0002', '2012-12-07 16:13:00', '2012-12-07 16:13:00', null, null, '0', 'DD100043', '4028bc743b7466ad013b746cb99f0000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b747cf7013b74800d500002', '2012-12-07 16:34:07', '2012-12-07 16:34:07', null, null, '0', 'DD100044', '4028bc743b747cf7013b74800d210000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b747cf7013b748191120007', '2012-12-07 16:35:46', '2012-12-07 16:35:46', null, null, '0', 'DD100045', '4028bc743b747cf7013b748190c40005');
INSERT INTO `xx_order_log` VALUES ('4028bc743b748301013b7483c40f0002', '2012-12-07 16:38:10', '2012-12-07 16:38:10', null, null, '0', 'DD100046', '4028bc743b748301013b7483c3c10000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b748301013b7485e2c80007', '2012-12-07 16:40:29', '2012-12-07 16:40:29', null, null, '0', 'DD100047', '4028bc743b748301013b7485e28a0005');
INSERT INTO `xx_order_log` VALUES ('4028bc743b748301013b748bee16000c', '2012-12-07 16:47:05', '2012-12-07 16:47:05', null, null, '0', 'DD100048', '4028bc743b748301013b748bede7000a');
INSERT INTO `xx_order_log` VALUES ('4028bc743b748c5c013b748d07940002', '2012-12-07 16:48:17', '2012-12-07 16:48:17', null, null, '0', 'DD100049', '4028bc743b748c5c013b748d07170000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b748c5c013b748d16880006', '2012-12-07 16:48:21', '2012-12-07 16:48:21', '支付总金额: ￥20.00元', null, '2', 'DD100049', '4028bc743b748c5c013b748d07170000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b780fea013b788b51e10002', '2012-12-08 11:24:54', '2012-12-08 11:24:54', null, null, '0', 'DD100050', '4028bc743b780fea013b788b51920000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b887855013b88e6f9fa0002', '2012-12-11 15:38:56', '2012-12-11 15:38:56', null, null, '0', 'DD100051', '4028bc743b887855013b88e6f98d0000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b887855013b88ea15b10006', '2012-12-11 15:42:20', '2012-12-11 15:42:20', null, null, '0', 'DD100052', '4028bc743b887855013b88ea14f60004');
INSERT INTO `xx_order_log` VALUES ('4028bc743b887855013b88ea66df0009', '2012-12-11 15:42:41', '2012-12-11 15:42:41', null, null, '0', 'DD100053', '4028bc743b887855013b88ea66420007');
INSERT INTO `xx_order_log` VALUES ('4028bc743b887855013b88ea80a0000c', '2012-12-11 15:42:47', '2012-12-11 15:42:47', null, null, '0', 'DD100054', '4028bc743b887855013b88ea8043000a');
INSERT INTO `xx_order_log` VALUES ('4028bc743b8d1bfd013b8d1e164c0003', '2012-12-12 11:17:37', '2012-12-12 11:17:37', '支付总金额: ￥20.00元', null, '2', 'DD100054', '4028bc743b887855013b88ea8043000a');
INSERT INTO `xx_order_log` VALUES ('4028bc743b8dfca5013b8dfeed130002', '2012-12-12 15:23:12', '2012-12-12 15:23:12', null, null, '0', 'DD100055', '4028bc743b8dfca5013b8dfeeca50000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b8dfca5013b8dff0a400006', '2012-12-12 15:23:20', '2012-12-12 15:23:20', '支付总金额: ￥20.00元', null, '2', 'DD100055', '4028bc743b8dfca5013b8dfeeca50000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b938b55013b938c69960002', '2012-12-13 17:15:51', '2012-12-13 17:15:51', null, null, '0', 'DD100056', '4028bc743b938b55013b938c67250000');
INSERT INTO `xx_order_log` VALUES ('4028bc743b938b55013b938f9f7c0006', '2012-12-13 17:19:21', '2012-12-13 17:19:21', null, null, '0', 'DD100057', '4028bc743b938b55013b938f9eb10004');
INSERT INTO `xx_order_log` VALUES ('4028bc743b938b55013b938fae03000a', '2012-12-13 17:19:25', '2012-12-13 17:19:25', '支付总金额: ￥20.00元', null, '2', 'DD100057', '4028bc743b938b55013b938f9eb10004');
INSERT INTO `xx_order_log` VALUES ('4028bc743b98215e013b982214820002', '2012-12-14 14:37:48', '2012-12-14 14:37:48', null, null, '0', 'DD100058', '4028bc743b98215e013b982214540000');
INSERT INTO `xx_order_log` VALUES ('8a8f80153ae0be07013ae0c469f60004', '2012-11-09 00:04:59', '2012-11-09 00:04:59', null, null, '0', 'DD100007', '8a8f80153ae0be07013ae0c469ce0002');
INSERT INTO `xx_order_log` VALUES ('8a8f80153ae0be07013ae0c8fab7000a', '2012-11-09 00:09:58', '2012-11-09 00:09:58', null, null, '0', 'DD100008', '8a8f80153ae0be07013ae0c8fa830008');
INSERT INTO `xx_order_log` VALUES ('8a8f80153ae0be07013ae0cdd6d80010', '2012-11-09 00:15:17', '2012-11-09 00:15:17', null, null, '0', 'DD100009', '8a8f80153ae0be07013ae0cdd69f000e');
INSERT INTO `xx_order_log` VALUES ('8a8f80153ae0d04c013ae0d4c4530003', '2012-11-09 00:22:51', '2012-11-09 00:22:51', null, null, '0', 'DD100010', '8a8f80153ae0d04c013ae0d4c3f10001');
INSERT INTO `xx_order_log` VALUES ('8a8f80153ae0d04c013ae0d566a60009', '2012-11-09 00:23:32', '2012-11-09 00:23:32', null, null, '0', 'DD100011', '8a8f80153ae0d04c013ae0d566750007');
INSERT INTO `xx_order_log` VALUES ('8a8f80153ae0d04c013ae0d788a6000f', '2012-11-09 00:25:52', '2012-11-09 00:25:52', null, null, '0', 'DD100012', '8a8f80153ae0d04c013ae0d7886d000d');
INSERT INTO `xx_order_log` VALUES ('8a8f80153ae0d04c013ae0d7daf40012', '2012-11-09 00:26:13', '2012-11-09 00:26:13', '支付总金额: ￥9.00元', null, '2', 'DD100012', '8a8f80153ae0d04c013ae0d7886d000d');
INSERT INTO `xx_order_log` VALUES ('8a8f80153ae0d04c013ae0e28a7e0016', '2012-11-09 00:37:53', '2012-11-09 00:37:53', null, null, '0', 'DD100013', '8a8f80153ae0d04c013ae0e28a430014');
INSERT INTO `xx_order_log` VALUES ('8a8f80153ae0d04c013ae0e379db0019', '2012-11-09 00:38:55', '2012-11-09 00:38:55', '支付总金额: ￥9.00元', null, '2', 'DD100013', '8a8f80153ae0d04c013ae0e28a430014');
INSERT INTO `xx_order_log` VALUES ('8a8f80153ae0d04c013ae0e42dc6001d', '2012-11-09 00:39:41', '2012-11-09 00:39:41', null, null, '0', 'DD100014', '8a8f80153ae0d04c013ae0e42d72001b');
INSERT INTO `xx_order_log` VALUES ('8a8f80153ae0d04c013ae0e4f8a30020', '2012-11-09 00:40:33', '2012-11-09 00:40:33', '支付总金额: ￥180.00元', null, '2', 'DD100014', '8a8f80153ae0d04c013ae0e42d72001b');
INSERT INTO `xx_order_log` VALUES ('8a8f80153ae0d04c013ae0e5531b0024', '2012-11-09 00:40:56', '2012-11-09 00:40:56', null, null, '0', 'DD100015', '8a8f80153ae0d04c013ae0e552e40022');
INSERT INTO `xx_order_log` VALUES ('8a8f80153ae0e850013ae0eebccd0003', '2012-11-09 00:51:13', '2012-11-09 00:51:13', null, null, '0', 'DD100016', '8a8f80153ae0e850013ae0eebc640001');
INSERT INTO `xx_order_log` VALUES ('8a8f80153ae0e850013ae0ef36060007', '2012-11-09 00:51:44', '2012-11-09 00:51:44', '支付总金额: ￥4.50元', null, '2', 'DD100016', '8a8f80153ae0e850013ae0eebc640001');
INSERT INTO `xx_order_log` VALUES ('8a8f82133aff6bbb013aff6fc9570003', '2012-11-14 23:00:47', '2012-11-14 23:00:47', null, null, '0', 'DD100021', '8a8f82133aff6bbb013aff6fc8c60001');
INSERT INTO `xx_order_log` VALUES ('8a8f82133aff6bbb013aff70eeda0007', '2012-11-14 23:02:02', '2012-11-14 23:02:02', null, null, '0', 'DD100022', '8a8f82133aff6bbb013aff70ee860005');
INSERT INTO `xx_order_log` VALUES ('8a8f82133aff6bbb013aff721f37000c', '2012-11-14 23:03:20', '2012-11-14 23:03:20', null, null, '0', 'DD100023', '8a8f82133aff6bbb013aff721eda000a');
INSERT INTO `xx_order_log` VALUES ('8a91807c3b70d14d013b70d1fa530002', '2012-12-06 23:25:07', '2012-12-06 23:25:07', null, null, '0', 'DD100034', '8a91807c3b70d14d013b70d1f9d40000');
INSERT INTO `xx_order_log` VALUES ('8a91807c3b70d14d013b70d261270007', '2012-12-06 23:25:33', '2012-12-06 23:25:33', '支付总金额: ￥20.00元', null, '2', 'DD100034', '8a91807c3b70d14d013b70d1f9d40000');
INSERT INTO `xx_order_log` VALUES ('8a91807c3b70d14d013b70d44ab1000b', '2012-12-06 23:27:39', '2012-12-06 23:27:39', null, null, '0', 'DD100035', '8a91807c3b70d14d013b70d44a5e0009');
INSERT INTO `xx_order_log` VALUES ('8a91807c3b70d14d013b70d4e107000f', '2012-12-06 23:28:17', '2012-12-06 23:28:17', '支付总金额: ￥17.60元', null, '2', 'DD100035', '8a91807c3b70d14d013b70d44a5e0009');
INSERT INTO `xx_order_log` VALUES ('8a9182e13ab666b7013ab6707bbf0004', '2012-10-31 18:49:15', '2012-10-31 18:49:15', null, null, '0', 'DD100003', '8a9182e13ab666b7013ab6707b5a0002');
INSERT INTO `xx_order_log` VALUES ('8a9182e13ab666b7013ab67096960006', '2012-10-31 18:49:22', '2012-10-31 18:49:22', '支付总金额: ￥69.00元', null, '2', 'DD100003', '8a9182e13ab666b7013ab6707b5a0002');
INSERT INTO `xx_order_log` VALUES ('8a9182e13ab666b7013ab6acd9a40009', '2012-10-31 19:55:12', '2012-10-31 19:55:12', '物流公司: xxs<br />商品信息: 腾讯一卡通 [30元] × 2<br />', 'admin', '4', 'DD100003', '8a9182e13ab666b7013ab6707b5a0002');
INSERT INTO `xx_order_log` VALUES ('8a9182e13ab666b7013ab6aced52000b', '2012-10-31 19:55:17', '2012-10-31 19:55:17', '订单完成,获得积分: 57', 'admin', '6', 'DD100003', '8a9182e13ab666b7013ab6707b5a0002');
INSERT INTO `xx_order_log` VALUES ('ff8080813adff468013ae07397060003', '2012-11-08 22:36:42', '2012-11-08 22:36:42', null, null, '0', 'DD100006', 'ff8080813adff468013ae07396a60001');
INSERT INTO `xx_order_log` VALUES ('ff8080813adff468013ae073dc3c0005', '2012-11-08 22:37:00', '2012-11-08 22:37:00', '支付总金额: ￥25.50元', null, '2', 'DD100006', 'ff8080813adff468013ae07396a60001');

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
  `memo` text,
  `operator` varchar(255) DEFAULT NULL,
  `payer` varchar(255) DEFAULT NULL,
  `payment_config_name` varchar(255) NOT NULL,
  `payment_fee` decimal(15,5) NOT NULL,
  `payment_sn` varchar(255) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `total_amount` decimal(15,5) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `payment_config_id` varchar(32) DEFAULT NULL,
  `deposit_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_sn` (`payment_sn`),
  KEY `xx_payment_member` (`member_id`),
  KEY `xx_payment_deposit` (`deposit_id`),
  KEY `xx_payment_payment_config` (`payment_config_id`),
  KEY `xx_payment_order` (`order_id`),
  KEY `xx_payment_create_date` (`create_date`),
  CONSTRAINT `xx_payment_ibfk_1` FOREIGN KEY (`deposit_id`) REFERENCES `xx_deposit` (`id`),
  CONSTRAINT `xx_payment_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `xx_payment_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `xx_order` (`id`),
  CONSTRAINT `xx_payment_ibfk_4` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_payment_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_payment
-- ----------------------------
INSERT INTO `xx_payment` VALUES ('402880853ae8e6be013ae8fd7ef70005', '2012-11-10 14:24:18', '2012-11-10 14:24:23', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100027', '3', '2', '44.97000', '8a9183a93a92e6de013a931577bb0000', '402880853ae8e6be013ae8fc46870002', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('402880853ae8e6be013ae8fe72f5000c', '2012-11-10 14:25:20', '2012-11-10 14:25:20', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100028', '0', '2', '200.00000', '8a9183a93a92e6de013a931577bb0000', '402880853ae8e6be013ae8fe64380009', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('402880853ae8e6be013ae8fef8f8000e', '2012-11-10 14:25:54', '2012-11-10 14:26:00', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100029', '3', '2', '200.00000', '8a9183a93a92e6de013a931577bb0000', '402880853ae8e6be013ae8fe64380009', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('402880853ae8e6be013ae90ac64f0015', '2012-11-10 14:38:48', '2012-11-10 14:38:54', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100030', '3', '2', '60.00000', '8a9183a93a92e6de013a931577bb0000', '402880853ae8e6be013ae90abcb20012', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('402880853ae8e6be013ae90ba070001d', '2012-11-10 14:39:44', '2012-11-10 14:39:47', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100031', '3', '2', '60.00000', '8a9183a93a92e6de013a931577bb0000', '402880853ae8e6be013ae90b96f7001a', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('402880853ae8e6be013ae90fe3020021', '2012-11-10 14:44:23', '2012-11-10 14:44:41', '10001126856', '易宝支付', null, null, 'xiaduoer', '易宝支付', '0.00000', 'ZF100032', '3', '0', '200.00000', '8a9182e13ab73c9e013ab74780e80000', null, '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743ab4e741013ab539373e000b', '2012-10-31 13:09:16', '2012-10-31 13:09:16', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', '100001', '0', '2', '30.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743ab4e741013ab53927310008', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743ab4e741013ab53eb6e5000c', '2012-10-31 13:15:17', '2012-10-31 13:15:17', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', '100002', '0', '2', '30.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743ab4e741013ab53927310008', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743ab4e741013ab53f5911000d', '2012-10-31 13:15:58', '2012-10-31 13:15:58', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', '100003', '0', '2', '30.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743ab4e741013ab53927310008', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743ab55947013ab55d44fa0000', '2012-10-31 13:48:39', '2012-10-31 13:48:39', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', '100004', '0', '2', '30.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743ab4e741013ab53927310008', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743ab55947013ab55ea3bf0001', '2012-10-31 13:50:09', '2012-10-31 13:51:06', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', '100005', '3', '2', '30.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743ab4e741013ab53927310008', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743ab55947013ab561a2c70003', '2012-10-31 13:53:25', '2012-10-31 13:53:37', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', '100006', '3', '0', '500.00000', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743ab55947013ab56267400005', '2012-10-31 13:54:16', '2012-10-31 14:00:55', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', '100007', '3', '0', '700.00000', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743ab55947013ab56575e7000a', '2012-10-31 13:57:36', '2012-10-31 14:00:04', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', '100008', '3', '2', '192.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743ab55947013ab5656cee0007', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743abf3198013abf3666c50000', '2012-11-02 11:42:24', '2012-11-02 11:42:27', '10001126856', '易宝支付', null, null, '123456', '易宝支付', '0.00000', 'ZF100010', '3', '0', '60.00000', '4028bc743abf206b013abf27afae0000', null, '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743ac8cf21013ac8e8b0f40004', '2012-11-04 08:53:43', '2012-11-04 08:53:46', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100011', '3', '2', '192.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743ac8cf21013ac8e8a5aa0001', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743ac936a6013ac953969e0005', '2012-11-04 10:50:29', '2012-11-04 10:50:33', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100012', '3', '0', '7777.00000', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743ac9de7a013ac9e8a1570000', '2012-11-04 13:33:17', '2012-11-04 13:33:20', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100013', '3', '0', '900.00000', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743ac9fbfb013aca0516ed0002', '2012-11-04 14:04:22', '2012-11-04 14:04:24', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100014', '3', '0', '200000.00000', '8a9183a93a92e6de013a931577bb0000', null, '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743ade682c013ade789fcd0004', '2012-11-08 13:22:58', '2012-11-08 13:23:00', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100015', '3', '2', '16.50000', '8a9183a93a92e6de013a931577bb0000', '4028bc743ade682c013ade7894a10001', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b645e3a013b646d6b8c0003', '2012-12-04 13:39:50', '2012-12-04 13:41:07', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100035', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b645e3a013b64622dbe0000', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b647802013b647b83080003', '2012-12-04 13:55:14', '2012-12-04 13:55:15', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100036', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b647802013b647b7a7d0000', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b64ce89013b652e5a4c0004', '2012-12-04 17:10:34', '2012-12-04 17:10:34', 'a', '易宝非银行卡支付(专业版)', null, null, '123123', '易宝非银行卡支付(专业版)', '0.00000', 'ZF100037', '0', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b64ce89013b652e427e0001', '4028bc743b64ce89013b6524016e0000', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b64ce89013b652f1b4a0008', '2012-12-04 17:11:24', '2012-12-04 17:11:24', '10001126856', '易宝非银行卡支付(专业版)', null, null, '123123', '易宝非银行卡支付(专业版)', '0.00000', 'ZF100038', '0', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b64ce89013b652f14a30005', '4028bc743b64ce89013b6524016e0000', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b69af9e013b69b06a1d0003', '2012-12-05 14:11:07', '2012-12-05 14:11:07', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '易宝非银行卡支付(专业版)', '0.00000', 'ZF100039', '0', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b69af9e013b69b05d2d0000', '4028bc743b64ce89013b6524016e0000', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b69e110013b69e28da00003', '2012-12-05 15:05:53', '2012-12-05 15:05:53', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '易宝非银行卡支付(专业版)', '0.00000', 'ZF100040', '0', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b69e110013b69e282270000', '4028bc743b64ce89013b6524016e0000', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b69e110013b69e6b26b0007', '2012-12-05 15:10:24', '2012-12-05 15:10:24', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '易宝非银行卡支付(专业版)', '0.00000', 'ZF100041', '0', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b69e110013b69e6a3760004', '4028bc743b64ce89013b6524016e0000', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b69e110013b69e6ccf70008', '2012-12-05 15:10:31', '2012-12-05 15:10:31', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '易宝非银行卡支付(专业版)', '0.00000', 'ZF100042', '0', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b69e110013b69e6a3760004', '4028bc743b64ce89013b6524016e0000', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b69e110013b69e6eab1000c', '2012-12-05 15:10:39', '2012-12-05 15:10:39', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '易宝非银行卡支付(专业版)', '0.00000', 'ZF100043', '0', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b69e110013b69e6d8a00009', '4028bc743b64ce89013b6524016e0000', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b69e110013b69efbec3000d', '2012-12-05 15:20:17', '2012-12-05 15:20:17', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '易宝非银行卡支付(专业版)', '0.00000', 'ZF100044', '0', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b69e110013b69e6d8a00009', '4028bc743b64ce89013b6524016e0000', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b6e0818013b6e253eba0003', '2012-12-06 10:57:12', '2012-12-06 10:57:12', '10011842896', '易宝非银行卡支付(专业版)', null, null, '123123', '易宝非银行卡支付(专业版)', '0.00000', 'ZF100045', '0', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b6e0818013b6e252f780000', '4028bc743b64ce89013b6524016e0000', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b742994013b742a0ee90003', '2012-12-07 15:00:11', '2012-12-07 15:00:13', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100049', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b742994013b742a02f20000', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b742994013b742dc8d40007', '2012-12-07 15:04:15', '2012-12-07 15:04:18', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100050', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b742994013b742dbd990004', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b7447e7013b74497ef10003', '2012-12-07 15:34:31', '2012-12-07 15:34:33', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100051', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b7447e7013b744974ff0000', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b7447e7013b744e5eaf0008', '2012-12-07 15:39:51', '2012-12-07 15:39:52', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100052', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b7447e7013b744e56430005', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b7452db013b7453ce0b0006', '2012-12-07 15:45:47', '2012-12-07 15:45:49', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100053', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b7452db013b7453c4370003', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b7466ad013b746cc1110003', '2012-12-07 16:13:02', '2012-12-07 16:13:04', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100054', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b7466ad013b746cb99f0000', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b747cf7013b748015fb0003', '2012-12-07 16:34:09', '2012-12-07 16:34:10', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100055', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b747cf7013b74800d210000', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b747cf7013b7481974b0008', '2012-12-07 16:35:48', '2012-12-07 16:35:52', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100056', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b747cf7013b748190c40005', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b748301013b7483ce8e0003', '2012-12-07 16:38:13', '2012-12-07 16:38:14', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100057', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b748301013b7483c3c10000', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b748301013b7485eab70008', '2012-12-07 16:40:31', '2012-12-07 16:40:33', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100058', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b748301013b7485e28a0005', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b748301013b748bf365000d', '2012-12-07 16:47:07', '2012-12-07 16:47:08', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100059', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b748301013b748bede7000a', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b748c5c013b748d11480003', '2012-12-07 16:48:20', '2012-12-07 16:48:21', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100060', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b748c5c013b748d07170000', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b887855013b88e7165c0003', '2012-12-11 15:39:04', '2012-12-11 15:39:04', 'a', '殴飞消耗点卡接口', null, null, '123123', '殴飞接口', '0.00000', 'ZF100061', '0', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b887855013b88e6f98d0000', '4028bc743b886ba3013b886eeb4c0000', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b8d1bfd013b8d1e10be0000', '2012-12-12 11:17:36', '2012-12-12 11:17:37', '10001126856', '易宝支付', null, null, '123123', '易宝通用支付', '0.00000', 'ZF100062', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b887855013b88ea8043000a', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b8dfca5013b8dfefc070003', '2012-12-12 15:23:16', '2012-12-12 15:23:19', '10001126856', '易宝支付', null, null, '123123', '易宝通用支付', '0.00000', 'ZF100063', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b8dfca5013b8dfeeca50000', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b938b55013b938c72500003', '2012-12-13 17:15:53', '2012-12-13 17:15:53', 'a', '殴飞消耗点卡接口', null, null, '123123', '殴飞接口', '0.00000', 'ZF100064', '0', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b938b55013b938c67250000', '4028bc743b886ba3013b886eeb4c0000', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b938b55013b938fa8560007', '2012-12-13 17:19:23', '2012-12-13 17:19:24', '10001126856', '易宝支付', null, null, '123123', '易宝通用支付', '0.00000', 'ZF100065', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b938b55013b938f9eb10004', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('4028bc743b98215e013b982228e50003', '2012-12-14 14:37:53', '2012-12-14 14:37:53', 'a', '殴飞消耗点卡接口', null, null, '123123', '殴飞接口', '0.00000', 'ZF100066', '0', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '4028bc743b98215e013b982214540000', '4028bc743b886ba3013b886eeb4c0000', null);
INSERT INTO `xx_payment` VALUES ('8a8f80153ae0be07013ae0c49fe70005', '2012-11-09 00:05:13', '2012-11-09 00:05:16', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100017', '3', '2', '54.00000', '8a9183a93a92e6de013a931577bb0000', '8a8f80153ae0be07013ae0c469ce0002', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('8a8f80153ae0be07013ae0c906a8000b', '2012-11-09 00:10:01', '2012-11-09 00:10:07', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100018', '3', '2', '9.00000', '8a9183a93a92e6de013a931577bb0000', '8a8f80153ae0be07013ae0c8fa830008', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('8a8f80153ae0be07013ae0cde0980011', '2012-11-09 00:15:19', '2012-11-09 00:15:23', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100019', '3', '2', '13.50000', '8a9183a93a92e6de013a931577bb0000', '8a8f80153ae0be07013ae0cdd69f000e', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('8a8f80153ae0d04c013ae0d4db240004', '2012-11-09 00:22:57', '2012-11-09 00:22:58', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100020', '3', '2', '9.00000', '8a9183a93a92e6de013a931577bb0000', '8a8f80153ae0d04c013ae0d4c3f10001', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('8a8f80153ae0d04c013ae0d56fa3000a', '2012-11-09 00:23:35', '2012-11-09 00:23:38', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100021', '3', '2', '9.00000', '8a9183a93a92e6de013a931577bb0000', '8a8f80153ae0d04c013ae0d566750007', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('8a8f80153ae0d04c013ae0d790020010', '2012-11-09 00:25:54', '2012-11-09 00:25:56', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100022', '3', '2', '9.00000', '8a9183a93a92e6de013a931577bb0000', '8a8f80153ae0d04c013ae0d7886d000d', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('8a8f80153ae0d04c013ae0e2ab970017', '2012-11-09 00:38:02', '2012-11-09 00:38:10', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100023', '3', '2', '9.00000', '8a9183a93a92e6de013a931577bb0000', '8a8f80153ae0d04c013ae0e28a430014', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('8a8f80153ae0d04c013ae0e4347a001e', '2012-11-09 00:39:42', '2012-11-09 00:39:45', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100024', '3', '2', '180.00000', '8a9183a93a92e6de013a931577bb0000', '8a8f80153ae0d04c013ae0e42d72001b', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('8a8f80153ae0d04c013ae0e559bc0025', '2012-11-09 00:40:58', '2012-11-09 00:40:59', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100025', '3', '2', '90.00000', '8a9183a93a92e6de013a931577bb0000', '8a8f80153ae0d04c013ae0e552e40022', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('8a8f80153ae0e850013ae0eec60c0004', '2012-11-09 00:51:15', '2012-11-09 00:51:17', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100026', '3', '2', '4.50000', '8a9183a93a92e6de013a931577bb0000', '8a8f80153ae0e850013ae0eebc640001', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('8a8f82133aff6bbb013aff70f48f0008', '2012-11-14 23:02:03', '2012-11-14 23:02:03', '10001126856', '易宝支付', null, null, '112233', '易宝支付', '0.00000', 'ZF100033', '0', '2', '20.00000', '4028bc743ab48628013ab4b892a00000', '8a8f82133aff6bbb013aff70ee860005', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('8a8f82133aff6bbb013aff72249f000d', '2012-11-14 23:03:21', '2012-11-14 23:03:21', '10001126856', '易宝支付', null, null, '112233', '易宝支付', '0.00000', 'ZF100034', '0', '2', '10.00000', '4028bc743ab48628013ab4b892a00000', '8a8f82133aff6bbb013aff721eda000a', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('8a91807c3b70d14d013b70d251b40003', '2012-12-06 23:25:29', '2012-12-06 23:25:29', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100046', '0', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '8a91807c3b70d14d013b70d1f9d40000', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('8a91807c3b70d14d013b70d251b90004', '2012-12-06 23:25:29', '2012-12-06 23:25:33', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100047', '3', '2', '20.00000', '8a9183a93a92e6de013a931577bb0000', '8a91807c3b70d14d013b70d1f9d40000', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('8a91807c3b70d14d013b70d4d9cc000c', '2012-12-06 23:28:15', '2012-12-06 23:28:17', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100048', '3', '2', '17.60000', '8a9183a93a92e6de013a931577bb0000', '8a91807c3b70d14d013b70d44a5e0009', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('8a9182e13ab666b7013ab67085ac0005', '2012-10-31 18:49:18', '2012-10-31 18:49:22', '10001126856', '易宝支付', null, null, '112233', '易宝支付', '0.00000', 'ZF100009', '3', '2', '69.00000', '4028bc743ab48628013ab4b892a00000', '8a9182e13ab666b7013ab6707b5a0002', '4028bc743ab4e741013ab538ee9c0006', null);
INSERT INTO `xx_payment` VALUES ('ff8080813adff468013ae073cb7b0004', '2012-11-08 22:36:56', '2012-11-08 22:37:00', '10001126856', '易宝支付', null, null, '123123', '易宝支付', '0.00000', 'ZF100016', '3', '2', '25.50000', '8a9183a93a92e6de013a931577bb0000', 'ff8080813adff468013ae07396a60001', '4028bc743ab4e741013ab538ee9c0006', null);

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
  `description` text,
  `name` varchar(255) NOT NULL,
  `order_list` int(11) DEFAULT NULL,
  `payment_config_type` int(11) NOT NULL,
  `payment_fee` decimal(15,5) NOT NULL,
  `payment_fee_type` int(11) NOT NULL,
  `payment_product_id` varchar(255) DEFAULT NULL,
  `is_default` bit(1) NOT NULL,
  `is_enabled` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_payment_config_order_list` (`order_list`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_payment_config
-- ----------------------------
INSERT INTO `xx_payment_config` VALUES ('4028bc743ab4e741013ab538ee9c0006', '2012-10-31 13:08:58', '2012-12-12 16:31:43', '10001126856', '69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl', '易宝通用支付', '易宝通用支付', '2', '2', '0.00000', '0', 'yeepay', '', '');
INSERT INTO `xx_payment_config` VALUES ('4028bc743b64ce89013b6524016e0000', '2012-12-04 16:59:16', '2012-12-12 16:24:58', '10011842896', '09ocl8ku8todssltsgyicyai6p1c0d488kvnh1rt88q0s7sjwq0hb0n3mgi8', '易宝非银行卡支付(专业版)', '易宝非银行卡支付(专业版)', '1', '2', '0.00000', '0', 'yeepayforzy', '', '');
INSERT INTO `xx_payment_config` VALUES ('4028bc743b886ba3013b886eeb4c0000', '2012-12-11 13:27:48', '2012-12-12 16:31:37', 'a', 'b', '殴飞', '殴飞接口', '0', '2', '0.00000', '0', 'ofpay', '', '');

-- ----------------------------
-- Table structure for `xx_payment_discount`
-- ----------------------------
DROP TABLE IF EXISTS `xx_payment_discount`;
CREATE TABLE `xx_payment_discount` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount` decimal(19,2) DEFAULT NULL,
  `memo` longtext,
  `operator` varchar(255) DEFAULT NULL,
  `brand_id` varchar(32) DEFAULT NULL,
  `payment_config_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK512B8EB9115DF6A7` (`payment_config_id`),
  KEY `fk_payment_discount_payment_config` (`payment_config_id`),
  KEY `fk_payment_Discount_brand` (`brand_id`),
  CONSTRAINT `xx_payment_discount_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `xx_brand` (`id`),
  CONSTRAINT `xx_payment_discount_ibfk_2` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_payment_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_payment_discount
-- ----------------------------
INSERT INTO `xx_payment_discount` VALUES ('4028bc743b6f5e56013b6f6b628c0002', '2012-12-06 16:53:26', '2012-12-06 16:53:26', 'rtyrty', '34.00', '234', null, '8ae4839c3a887878013a88ae29c8000d', '4028bc743b64ce89013b6524016e0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743b6f5e56013b6f6f6d950003', '2012-12-06 16:57:51', '2012-12-06 16:57:51', 'tttt', '33.00', '33', null, '8ae4839c3a887878013a88ae757d000f', '4028bc743b64ce89013b6524016e0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743b73db75013b73ee7de30000', '2012-12-07 13:55:07', '2012-12-07 13:55:07', '5er', '0.00', 'er', 'admin', '8ae4839c3a887878013a88ae757d000f', '4028bc743b64ce89013b6524016e0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743b7994d5013b799b311f0000', '2012-12-08 16:21:52', '2012-12-08 16:21:52', 'yyyy', '0.90', null, 'admin', '8ae4839c3a887878013a88acef930005', '4028bc743b64ce89013b6524016e0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743b7994d5013b79a324d30001', '2012-12-08 16:30:33', '2012-12-08 16:30:33', 'uuuu', '0.67', '33555', 'admin', '8ae4839c3a887878013a88ac6eb10002', '4028bc743b64ce89013b6524016e0000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743b886ba3013b8870f8cf0001', '2012-12-11 13:30:03', '2012-12-11 13:30:03', '4444', '0.78', 'aaa', 'admin', '8ae4839c3a887878013a88acef930005', '4028bc743b886ba3013b886eeb4c0000');
INSERT INTO `xx_payment_discount` VALUES ('8a91807c3b70d14d013b70d413fc0008', '2012-12-06 23:27:25', '2012-12-06 23:27:25', 'QQCARD', '0.88', '555', 'admin', '8ae4839c3a887878013a88acef930005', '4028bc743ab4e741013ab538ee9c0006');
INSERT INTO `xx_payment_discount` VALUES ('8a9182e13b6ff69f013b708493690000', '2012-12-06 22:00:35', '2012-12-06 22:00:35', 'ttt', '345555.00', '234', 'admin', '8ae4839c3a887878013a88add167000b', '4028bc743b64ce89013b6524016e0000');
INSERT INTO `xx_payment_discount` VALUES ('8a9182e13b6ff69f013b708511540001', '2012-12-06 22:01:07', '2012-12-06 22:01:07', '777', '777.00', '777', 'admin', '8ae4839c3a887878013a88ae757d000f', '4028bc743b64ce89013b6524016e0000');
INSERT INTO `xx_payment_discount` VALUES ('8a9182e13b6ff69f013b70873c750002', '2012-12-06 22:03:29', '2012-12-06 22:03:29', '666', '666.00', '666', 'admin', '8ae4839c3a887878013a88ad845a0009', '4028bc743b64ce89013b6524016e0000');

-- ----------------------------
-- Table structure for `xx_product`
-- ----------------------------
DROP TABLE IF EXISTS `xx_product`;
CREATE TABLE `xx_product` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `cost` decimal(15,5) DEFAULT NULL,
  `freeze_store` int(11) NOT NULL,
  `is_default` bit(1) NOT NULL,
  `is_marketable` bit(1) NOT NULL,
  `market_price` decimal(15,5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(15,5) NOT NULL,
  `product_sn` varchar(255) NOT NULL,
  `specification_value_store` text,
  `store` int(11) DEFAULT NULL,
  `store_place` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  `goods_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_sn` (`product_sn`),
  KEY `xx_product_goods` (`goods_id`),
  CONSTRAINT `xx_product_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `xx_goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_product
-- ----------------------------
INSERT INTO `xx_product` VALUES ('4028e3373b17db72013b17eaeecf0001', '2012-11-19 17:06:10', '2012-11-19 17:06:10', '100.00000', '0', '', '', '100.00000', '盛大一卡通', '100.00000', 'SN_5BC5CF6FCC7E', null, '1000', null, '0', '4028e3373b17db72013b17eaed2c0000');
INSERT INTO `xx_product` VALUES ('8ae4839c3a887878013a88d334590033', '2012-10-22 22:14:33', '2012-10-22 22:14:33', '5.00000', '0', '', '', '6.00000', '腾讯一卡通 [5元]', '5.00000', 'SN_8B79E4D89FB8', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"orderList\":2,\"imagePath\":null}]', null, '', '0', '8ae4839c3a887878013a88d311030032');
INSERT INTO `xx_product` VALUES ('8ae4839c3a887878013a88d3381e0034', '2012-10-22 22:14:34', '2012-10-22 22:14:34', '10.00000', '0', '', '', '12.00000', '腾讯一卡通 [10元]', '10.00000', 'SN_E7A926BF2C5A', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"orderList\":6,\"imagePath\":null}]', null, '', '0', '8ae4839c3a887878013a88d311030032');
INSERT INTO `xx_product` VALUES ('8ae4839c3a887878013a88d33fcf0035', '2012-10-22 22:14:36', '2012-10-22 22:14:36', '15.00000', '0', '', '', '18.00000', '腾讯一卡通 [15元]', '15.00000', 'SN_F2BD0F8D0A4E', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"orderList\":7,\"imagePath\":null}]', null, '', '0', '8ae4839c3a887878013a88d311030032');
INSERT INTO `xx_product` VALUES ('8ae4839c3a887878013a88d343ae0036', '2012-10-22 22:14:37', '2012-10-22 22:14:37', '20.00000', '0', '', '', '24.00000', '腾讯一卡通 [20元]', '20.00000', 'SN_79DDA7EB5CBB', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"orderList\":9,\"imagePath\":null}]', null, '', '0', '8ae4839c3a887878013a88d311030032');
INSERT INTO `xx_product` VALUES ('8ae4839c3a887878013a88d343fe0037', '2012-10-22 22:14:37', '2012-10-22 22:14:37', '30.00000', '0', '', '', '36.00000', '腾讯一卡通 [30元]', '30.00000', 'SN_5690B347AA89', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"orderList\":11,\"imagePath\":null}]', null, '', '0', '8ae4839c3a887878013a88d311030032');
INSERT INTO `xx_product` VALUES ('8ae4839c3a887878013a88d347990038', '2012-10-22 22:14:38', '2012-10-22 22:14:38', '60.00000', '0', '', '', '72.00000', '腾讯一卡通 [60元]', '60.00000', 'SN_691D4BBC4468', '[{\"name\":\"60元\",\"id\":\"bc51a8c55a0448a3b3b0399e2e849dad\",\"orderList\":16,\"imagePath\":null}]', null, '', '0', '8ae4839c3a887878013a88d311030032');
INSERT INTO `xx_product` VALUES ('8ae4839c3a887878013a88d347ba0039', '2012-10-22 22:14:38', '2012-10-22 22:14:38', '100.00000', '0', '', '', '120.00000', '腾讯一卡通 [100元]', '100.00000', 'SN_DC8CC08204F0', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"orderList\":18,\"imagePath\":null}]', null, '', '0', '8ae4839c3a887878013a88d311030032');
INSERT INTO `xx_product` VALUES ('8ae4839c3a887878013a88d35b96003a', '2012-10-22 22:14:43', '2012-10-22 22:14:43', '200.00000', '0', '', '', '240.00000', '腾讯一卡通 [200元]', '200.00000', 'SN_55D1AF4F15CA', '[{\"name\":\"200元\",\"id\":\"ad57f9d532e44555b4c999ecd20b1b1b\",\"orderList\":21,\"imagePath\":null}]', null, '', '0', '8ae4839c3a887878013a88d311030032');

-- ----------------------------
-- Table structure for `xx_receiver`
-- ----------------------------
DROP TABLE IF EXISTS `xx_receiver`;
CREATE TABLE `xx_receiver` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `address` text NOT NULL,
  `area_store` text NOT NULL,
  `is_default` bit(1) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) NOT NULL,
  `member_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_receiver_member` (`member_id`),
  CONSTRAINT `xx_receiver_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_receiver
-- ----------------------------
INSERT INTO `xx_receiver` VALUES ('4028bc743ab4e741013ab5390ed60007', '2012-10-31 13:09:06', '2012-10-31 13:09:06', 'xxs', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '', '234234', 'xxs', '23423', '23423', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_receiver` VALUES ('8a9182e13ab666b7013ab67074440001', '2012-10-31 18:49:14', '2012-10-31 18:49:14', 'sssaa', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '', '23', '摩卡', '2342', '2343', '4028bc743ab48628013ab4b892a00000');

-- ----------------------------
-- Table structure for `xx_refund`
-- ----------------------------
DROP TABLE IF EXISTS `xx_refund`;
CREATE TABLE `xx_refund` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `bank_account` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `memo` text,
  `operator` varchar(255) DEFAULT NULL,
  `payee` varchar(255) DEFAULT NULL,
  `payment_config_name` varchar(255) NOT NULL,
  `refund_sn` varchar(255) NOT NULL,
  `refund_type` int(11) NOT NULL,
  `total_amount` decimal(15,5) NOT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `payment_config_id` varchar(32) DEFAULT NULL,
  `deposit_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refund_sn` (`refund_sn`),
  KEY `xx_refund_deposit` (`deposit_id`),
  KEY `xx_refund_payment_config` (`payment_config_id`),
  KEY `xx_refund_order` (`order_id`),
  KEY `xx_refund_create_date` (`create_date`),
  CONSTRAINT `xx_refund_ibfk_1` FOREIGN KEY (`deposit_id`) REFERENCES `xx_deposit` (`id`),
  CONSTRAINT `xx_refund_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `xx_order` (`id`),
  CONSTRAINT `xx_refund_ibfk_3` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_payment_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_refund
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_reship`
-- ----------------------------
DROP TABLE IF EXISTS `xx_reship`;
CREATE TABLE `xx_reship` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `delivery_corp_name` varchar(255) NOT NULL,
  `delivery_fee` decimal(19,2) NOT NULL,
  `delivery_sn` varchar(255) DEFAULT NULL,
  `delivery_type_name` varchar(255) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `reship_address` varchar(255) NOT NULL,
  `reship_area_store` text NOT NULL,
  `reship_mobile` varchar(255) DEFAULT NULL,
  `reship_name` varchar(255) NOT NULL,
  `reship_phone` varchar(255) DEFAULT NULL,
  `reship_sn` varchar(255) NOT NULL,
  `reship_zip_code` varchar(255) NOT NULL,
  `delivery_type_id` varchar(32) DEFAULT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reship_sn` (`reship_sn`),
  KEY `xx_reship_delivery_type` (`delivery_type_id`),
  KEY `xx_reship_order` (`order_id`),
  KEY `xx_reship_create_date` (`create_date`),
  CONSTRAINT `xx_reship_ibfk_1` FOREIGN KEY (`delivery_type_id`) REFERENCES `xx_delivery_type` (`id`),
  CONSTRAINT `xx_reship_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_reship
-- ----------------------------

-- ----------------------------
-- Table structure for `xx_role`
-- ----------------------------
DROP TABLE IF EXISTS `xx_role`;
CREATE TABLE `xx_role` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `authority_list_store` text,
  `description` text,
  `is_system` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_role
-- ----------------------------
INSERT INTO `xx_role` VALUES ('0731dcsoft2010031200000000000016', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '[\"ROLE_GOODS\",\"ROLE_GOODS_NOTIFY\",\"ROLE_GOODS_CATEGORY\",\"ROLE_GOODS_TYPE\",\"ROLE_SPECIFICATION\",\"ROLE_BRAND\",\"ROLE_ORDER\",\"ROLE_PAYMENT\",\"ROLE_REFUND\",\"ROLE_SHIPPING\",\"ROLE_RESHIP\",\"ROLE_MEMBER\",\"ROLE_MEMBER_RANK\",\"ROLE_MEMBER_ATTRIBUTE\",\"ROLE_COMMENT\",\"ROLE_LEAVE_MESSAGE\",\"ROLE_NAVIGATION\",\"ROLE_ARTICLEE\",\"ROLE_ARTICLE_CATEGORY\",\"ROLE_FRIEND_LINK\",\"ROLE_PAGE_TEMPLATE\",\"ROLE_MAIL_TEMPLATE\",\"ROLE_PRINT_TEMPLATE\",\"ROLE_CACHE\",\"ROLE_BUILD_HTML\",\"ROLE_ADMIN\",\"ROLE_ROLE\",\"ROLE_MESSAGE\",\"ROLE_LOG\",\"ROLE_SETTING\",\"ROLE_INSTANT_MESSAGING\",\"ROLE_PAYMENT_CONFIG\",\"ROLE_DELIVERY_TYPE\",\"ROLE_AREA\",\"ROLE_DELIVERY_CORP\",\"ROLE_DELIVERY_CENTER\",\"ROLE_DELIVERY_TEMPLATE\",\"ROLE_BASE\"]', '拥有后台管理最高权限', '', '超级管理员');
INSERT INTO `xx_role` VALUES ('4028bc743ac000ea013ac00bc68c0000', '2012-11-02 15:35:28', '2012-11-02 15:35:28', '[\"ROLE_GOODS\",\"ROLE_GOODS_NOTIFY\",\"ROLE_GOODS_CATEGORY\",\"ROLE_GOODS_TYPE\",\"ROLE_SPECIFICATION\",\"ROLE_BRAND\",\"ROLE_ORDER\",\"ROLE_WITHDRAW\",\"ROLE_PAYMENT\",\"ROLE_REFUND\",\"ROLE_SHIPPING\",\"ROLE_RESHIP\",\"ROLE_DELIVERY_CENTER\",\"ROLE_DELIVERY_TEMPLATE\",\"ROLE_MEMBER\",\"ROLE_MEMBER_RANK\",\"ROLE_MEMBER_ATTRIBUTE\",\"ROLE_COMMENT\",\"ROLE_LEAVE_MESSAGE\",\"ROLE_NAVIGATION\",\"ROLE_ARTICLEE\",\"ROLE_ARTICLE_CATEGORY\",\"ROLE_FRIEND_LINK\",\"ROLE_PAGE_TEMPLATE\",\"ROLE_MAIL_TEMPLATE\",\"ROLE_PRINT_TEMPLATE\",\"ROLE_CACHE\",\"ROLE_BUILD_HTML\",\"ROLE_ADMIN\",\"ROLE_ROLE\",\"ROLE_MESSAGE\",\"ROLE_LOG\",\"ROLE_SETTING\",\"ROLE_INSTANT_MESSAGING\",\"ROLE_PAYMENT_CONFIG\",\"ROLE_DELIVERY_TYPE\",\"ROLE_AREA\",\"ROLE_DELIVERY_CORP\",\"ROLE_BASE\"]', '', '', '管理员');

-- ----------------------------
-- Table structure for `xx_shipping`
-- ----------------------------
DROP TABLE IF EXISTS `xx_shipping`;
CREATE TABLE `xx_shipping` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `delivery_corp_name` varchar(255) NOT NULL,
  `delivery_corp_url` varchar(255) DEFAULT NULL,
  `delivery_fee` decimal(19,2) NOT NULL,
  `delivery_sn` varchar(255) DEFAULT NULL,
  `delivery_type_name` varchar(255) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `ship_address` varchar(255) NOT NULL,
  `ship_area_store` text NOT NULL,
  `ship_mobile` varchar(255) DEFAULT NULL,
  `ship_name` varchar(255) NOT NULL,
  `ship_phone` varchar(255) DEFAULT NULL,
  `ship_zip_code` varchar(255) NOT NULL,
  `shipping_sn` varchar(255) NOT NULL,
  `delivery_type_id` varchar(32) DEFAULT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shipping_sn` (`shipping_sn`),
  KEY `xx_shipping_delivery_type` (`delivery_type_id`),
  KEY `xx_shipping_order` (`order_id`),
  KEY `xx_shipping_create_date` (`create_date`),
  CONSTRAINT `xx_shipping_ibfk_1` FOREIGN KEY (`delivery_type_id`) REFERENCES `xx_delivery_type` (`id`),
  CONSTRAINT `xx_shipping_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_shipping
-- ----------------------------
INSERT INTO `xx_shipping` VALUES ('8a9182e13ab666b7013ab6acd7370007', '2012-10-31 19:55:11', '2012-10-31 19:55:11', 'xxs', '', '12.00', '', '物流1', '', 'sssaa', '{\"name\":\"黄浦区\",\"path\":\"4028bc743ab4e741013ab534172b0001,4028bc743ab4e741013ab53571d90003\",\"displayName\":\"上海黄浦区\",\"orderList\":0,\"grade\":1,\"id\":\"4028bc743ab4e741013ab53571d90003\"}', '23', '摩卡', '2342', '2343', 'FH100001', null, '8a9182e13ab666b7013ab6707b5a0002');

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
  `specification_value_store` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xx_specification_order_list` (`order_list`)
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
  `lossrate` decimal(15,5) NOT NULL,
  `memo` longtext,
  `message` longtext,
  `money` decimal(15,5) NOT NULL,
  `rememo` longtext,
  `total_money` decimal(15,5) NOT NULL,
  `withdraw_sn` varchar(255) NOT NULL,
  `withdraw_status` int(11) NOT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `withdraw_sn` (`withdraw_sn`),
  KEY `fk_withdraw_member` (`member_id`),
  CONSTRAINT `xx_withdraw_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_withdraw
-- ----------------------------
INSERT INTO `xx_withdraw` VALUES ('4028bc743abfd018013abfdd91720000', '2012-11-02 14:45:00', '2012-11-02 17:28:55', '0.00000', '50', '会员自主提现', '50.00000', null, '0.00000', 'TX100001', '1', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac06725013ac07501a30000', '2012-11-02 17:30:24', '2012-11-02 17:30:51', '0.00000', '546', '会员自主提现', '56.00000', null, '0.00000', 'TX100002', '2', '4028bc743ab48628013ab4b892a00000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac06725013ac07530d10001', '2012-11-02 17:30:36', '2012-11-04 10:32:09', '0.00000', '345', '会员自主提现', '34.00000', null, '0.00000', 'TX100003', '1', '4028bc743ab48628013ab4b892a00000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac93bcab30000', '2012-11-04 10:24:29', '2012-11-04 10:24:58', '0.00000', 'yyy', '会员自主提现', '700.00000', null, '0.00000', 'TX100004', '1', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9447fb40003', '2012-11-04 10:34:00', '2012-11-04 10:34:16', '0.99000', '欢迎', '会员自主提现', '1000.00000', null, '990.00000', 'TX100005', '1', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9d21ed40007', '2012-11-04 13:08:41', '2012-11-04 13:09:08', '0.99000', 'fghg', '会员自主提现', '50.00000', null, '49.50000', 'TX100006', '2', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9d8106f0008', '2012-11-04 13:15:11', '2012-11-04 13:16:28', '0.99000', '双方各', '会员自主提现', '80.00000', null, '79.20000', 'TX100007', '1', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9daea8a000a', '2012-11-04 13:18:18', '2012-11-04 13:18:18', '0.99000', '234', '会员自主提现', '100.00000', null, '99.00000', 'TX100008', '0', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9db047a000b', '2012-11-04 13:18:24', '2012-11-04 13:18:24', '0.99000', '34', '会员自主提现', '34.00000', null, '33.66000', 'TX100009', '0', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9db165c000c', '2012-11-04 13:18:29', '2012-11-04 13:18:29', '0.99000', '1234', '会员自主提现', '1324.00000', null, '1310.76000', 'TX100010', '0', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9db2744000d', '2012-11-04 13:18:33', '2012-11-04 13:18:33', '0.99000', '234', '会员自主提现', '123.00000', null, '121.77000', 'TX100011', '0', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9db35cb000e', '2012-11-04 13:18:37', '2012-11-04 13:18:37', '0.99000', '213', '会员自主提现', '345.00000', null, '341.55000', 'TX100012', '0', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9db4eb2000f', '2012-11-04 13:18:43', '2012-11-04 13:18:43', '0.99000', '234', '会员自主提现', '234.00000', null, '231.66000', 'TX100013', '0', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9db5fba0010', '2012-11-04 13:18:48', '2012-11-04 13:18:48', '0.99000', '2', '会员自主提现', '2.00000', null, '1.98000', 'TX100014', '0', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9db7af20011', '2012-11-04 13:18:55', '2012-11-04 13:18:55', '0.99000', '6', '会员自主提现', '66.00000', null, '65.34000', 'TX100015', '0', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9db96f60012', '2012-11-04 13:19:02', '2012-11-04 13:19:02', '0.99000', '33', '会员自主提现', '33.00000', null, '32.67000', 'TX100016', '0', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9dba8d80013', '2012-11-04 13:19:06', '2012-11-04 13:19:06', '0.99000', '234', '会员自主提现', '345.00000', null, '341.55000', 'TX100017', '0', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9dbb8980014', '2012-11-04 13:19:11', '2012-11-04 13:19:11', '0.99000', '234', '会员自主提现', '34.00000', null, '33.66000', 'TX100018', '0', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9dbc7f90015', '2012-11-04 13:19:14', '2012-11-04 14:05:09', '0.99000', '234', '会员自主提现', '23.00000', null, '22.77000', 'TX100019', '1', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9dbe0050016', '2012-11-04 13:19:21', '2012-11-04 13:19:21', '0.99000', '43', '会员自主提现', '56.00000', null, '55.44000', 'TX100020', '0', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9dc02040017', '2012-11-04 13:19:29', '2012-12-06 10:12:57', '0.99000', '2', '会员自主提现', '2.00000', null, '1.98000', 'TX100021', '1', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9dc15cb0018', '2012-11-04 13:19:34', '2012-11-04 13:58:51', '0.99000', '6', '会员自主提现', '6.00000', null, '5.94000', 'TX100022', '1', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac936a6013ac9dc35490019', '2012-11-04 13:19:42', '2012-11-04 13:35:08', '0.99000', '4534', '会员自主提现', '34.00000', null, '33.66000', 'TX100023', '1', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac9fbfb013ac9ff3fcf0000', '2012-11-04 13:57:59', '2012-11-04 14:23:01', '0.99000', '月线', '会员自主提现', '500000.00000', null, '495000.00000', 'TX100024', '2', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743ac9fbfb013aca138f840005', '2012-11-04 14:20:10', '2012-11-04 14:20:33', '0.99000', '34234', '会员自主提现', '23.00000', null, '22.77000', 'TX100025', '1', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743b742994013b7430dcab000b', '2012-12-07 15:07:37', '2012-12-07 15:07:58', '0.96000', 'ttt', '会员自主提现', '784.00000', null, '752.64000', 'TX100026', '1', '8a9183a93a92e6de013a931577bb0000');
INSERT INTO `xx_withdraw` VALUES ('4028bc743b7452db013b745645b20009', '2012-12-07 15:48:29', '2012-12-07 15:50:13', '0.96000', 'uuu', '会员自主提现', '84.00000', null, '80.64000', 'TX100027', '1', '8a9183a93a92e6de013a931577bb0000');
