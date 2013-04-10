/*
Navicat MySQL Data Transfer

Source Server         : xxs
Source Server Version : 50154
Source Host           : localhost:3306
Source Database       : card

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2013-04-11 00:22:47
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
INSERT INTO `xx_admin` VALUES ('0731dcsoft2010031200000000000017', '2011-01-01 00:00:00', '2013-04-10 23:07:20', '名臣管理员', 'xxs@163.com', '', '', '', '', '2012-12-17 14:28:34', '2013-04-10 23:07:20', '0', '127.0.0.1', 'ADMIN', '21232f297a57a5a743894a0e4a801fc3', 'admin');

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
  `is_advice` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_article_category` (`article_category_id`),
  CONSTRAINT `fk_article_article_category` FOREIGN KEY (`article_category_id`) REFERENCES `xx_article_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_article
-- ----------------------------
INSERT INTO `xx_article` VALUES ('2c9484693ddfd7a0013ddfe3fcb30000', '2013-04-06 23:08:13', '2013-04-06 23:11:13', 'admin', '<div>&lt;div class=\"tab\"&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;table width=653px cellspacing=0&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;&lt;th&gt;种类&lt;/th&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;th&gt;在线兑换率(通道1)&lt;/th&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;th&gt;在线兑换率(通道2)&lt;/th&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;th&gt;客服代销&lt;/th&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;th&gt;支持面值&lt;/th&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;&lt;td&gt;手机话费&lt;/td&gt;&lt;td&gt;/&lt;/td&gt;&lt;td&gt;/&lt;/td&gt;&lt;td&gt;咨询客服&lt;/td&gt;&lt;td&gt;手机内的话费&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;&lt;td&gt;直充Q币&lt;/td&gt;&lt;td&gt;/&lt;/td&gt;&lt;td&gt;/&lt;/td&gt;&lt;td&gt;80-84%&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;带Q币的QQ号&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;&lt;td&gt;移动神州行充值卡(含地方卡)&lt;/td&gt;&lt;td&gt;95.5%&lt;/td&gt;&lt;td&gt;95.01%&lt;/td&gt;&lt;td&gt;95-97%&lt;/td&gt;&lt;td&gt;10 20 30 50 100 300 500&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;&lt;td&gt;联通充值卡（联通一卡充）&lt;/td&gt;&lt;td&gt;95.5%&lt;/td&gt;&lt;td&gt;95.01%&lt;/td&gt;&lt;td&gt;95-97%&lt;/td&gt;&lt;td&gt;10 20 30 50 100 300 500&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;&lt;td&gt;电信充值卡（全国，地方卡咨询客服）&lt;/td&gt;&lt;td&gt;95%&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;95%&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;95-97%&lt;/td&gt;&lt;td&gt;10 20 30 50 100&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;&lt;td&gt;巨人一卡通（征途一卡通）&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;84.5%&lt;/td&gt;&lt;td&gt;83%&lt;/td&gt;&lt;td&gt;/&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;所有面值&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;&lt;td&gt;盛大一卡通&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;87%&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;83%&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;/&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;所有面值&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;&lt;td&gt;骏网一卡通&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;85%&lt;/td&gt;&lt;td&gt;83%&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;/&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;所有面值&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;&lt;td&gt;搜狐一卡通&lt;/td&gt;&lt;td&gt;83.1%&lt;/td&gt;&lt;td&gt;83%&lt;/td&gt;&lt;td&gt;/&lt;/td&gt;&lt;td&gt;5 10 15 30 40 100&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;&lt;td&gt;网易一卡通&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;84.1%&lt;/td&gt;&lt;td&gt;83%&lt;/td&gt;&lt;td&gt;/&lt;/td&gt;&lt;td&gt; 5 15 20 30 50 100&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;&lt;td&gt;完美一卡通&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;85%&lt;/td&gt;&lt;td&gt;82%&lt;/td&gt;&lt;td&gt;/&lt;/td&gt;&lt;td&gt;15 30 50 100&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;天下通一卡通&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;/&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;83%&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;/&lt;/td&gt;&lt;td&gt;5 6 10 15 30 50 100&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;纵游一卡通&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;83%&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;82%&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;/&lt;/td&gt;&lt;td&gt;5 10 15 30 50 100&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;天宏一卡通&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;83%&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;83%&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;/&lt;/td&gt;&lt;td&gt;5 10 15 20 30 50 100&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;Q币卡&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;82%&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;81%&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;/&lt;/td&gt;&lt;td&gt;5 10 15 20 30 60 100 200&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;金山一卡通&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;咨询客服&lt;/td&gt;&lt;td&gt;咨询客服&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;不固定&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;所有面值&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;光宇一卡通&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;咨询客服&lt;/td&gt;&lt;td&gt;咨询客服&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;不固定&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;所有面值&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;联众一卡通&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;咨询客服&lt;/td&gt;&lt;td&gt;咨询客服&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;不固定&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;所有面值&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;殴飞一卡通&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;咨询客服&lt;/td&gt;&lt;td&gt;咨询客服&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;86%&lt;/td&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;td&gt;所有面值&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;/table&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;/div&gt;</div>', '0', '/html/201304/352e66ff26f64356a10a4e661105b254.html', '', '', '', '', '', '3', '支持卡种', '4028bc743c286bdc013c28900dbb0008', '');
INSERT INTO `xx_article` VALUES ('4028bc743bbb05c2013bbb2611650002', '2012-12-21 09:48:52', '2013-02-28 11:27:35', 'xxs', '<div class=\"right2\">\r\n       <p>一、供货成功后提现可以多久到账？<br />\r\n       答：很负责任的回答，提现后一般10分钟内客服工作人员会进行处理，若超出以上时间可以联系客服，由于公司使用的是超级网银跨行汇款，汇出后即时到达你的银行卡，但不排除有意外情况会延迟，例如银行网银系统维护等，若出现以上情况，我们保证最迟在当天提现当日你就可以收到款项。</p>\r\n<br />\r\n<p>二、名臣回收什么类型的充值卡呢？<br />\r\n答：参见支持卡种的种类，有则回收，没有的可以咨询客服。</p>\r\n<br />\r\n<p>三、名臣福利网站怎么知道我提交的充值卡卡号和密码是正确的？ <br />\r\n名臣福利网站对接了发行卡官方网站的验证系统，它当然可以验证您的卡号和密码是否正确。 </p>\r\n<br />\r\n<p>四、你们是不是钓鱼平台，卡号和密码自己拿去充值？  <br />\r\n答：我们是正规注册经营的公司，可点击网站下方工商标志进入验证，或者到到佛山市工商局网站输入本公司注册号或全名验证。回收充值卡只是公司其中一个业务，公司网站已经到公安机关备案，且获得权威机构的可信认证，若我们有诈骗行为，您可以点击网站下方报警图标报警。您的卡号密码验证无误，充值成功后，您在本网站的预存款自动增加，即可提现。 </p>\r\n   \r\n       </div>', '0', '/html/201212/62ec638c2cc94115a783d57dc3e995f8.html', '', '', '', '有疑问？请仔细看下面解答，或者咨询客服', '常见问题', '1', '常见问题', '4028bc743c286bdc013c289277c5000a', '');
INSERT INTO `xx_article` VALUES ('4028bc743c286bdc013c28a2d78b0011', '2013-01-11 16:03:46', '2013-03-31 00:32:34', '提现说明', '<div>&lt;div class=\"right2\"&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&lt;p&gt;一、供货成功后提现可以多久到账？&lt;br /&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;答：很负责任的回答，在有客服值班时间内，提现后一般10分钟内客服工作人员会进行处理，若超出以上时间可以联系客服，由于公司使用的是超级网银跨行汇款，汇出后即时到达你的银行卡，但不排除有意外情况会延迟，例如银行网银系统维护等，若出现以上情况，我们保证最迟在当天提现当日你就可以收到款项。&lt;/p&gt;</div>\r\n<div>&lt;br /&gt;</div>\r\n<div>&lt;p&gt;二、提现时限及手续费：&lt;br /&gt;</div>\r\n<div>答：提现时间：随时提现，随时处理，没有时间限制。&lt;strong&gt;说明：&lt;/strong&gt;&lt;br /&gt;</div>\r\n<div>1. &nbsp; 我们使用的是人民银行最新的超级网银进行跨行跨地区汇款（单笔5万元以下，提现手续费率：&lt;strong&gt;&lt;u&gt;提现额大于300元免手续费，提现额小于300元每笔收手续费3元&lt;/u&gt;&lt;/strong&gt;）&lt;/p&gt;</div>\r\n<div>&lt;br /&gt;</div>\r\n<div>&lt;p&gt;三、支持哪些银行收款？ &lt;br /&gt;</div>\r\n<div>支付宝、财付通、农业银行、建设银行、 中国银行、交通银行、 招商银行、 光大银行、 民生银行、 浦发银行、 兴业银行、 中信银行 、平安银行 、广发银行 、北京银行、 上海银行、 江苏银行、 北京农商银行、 江苏农信社、 农村信用社、 杭州银行 &nbsp;&lt;/p&gt;</div>\r\n<div>&lt;br /&gt;</div>\r\n<div>&nbsp; &nbsp;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&lt;/div&gt;</div>', '52', '/html/201301/03754c8fbedf44e3bbd277e0b3dfc2d1.html', '', '', '', '提取货款说明请看下方，或者咨询客服', '提现说明', '1', '提现说明', '4028bc743c286bdc013c289277c5000a', '');
INSERT INTO `xx_article` VALUES ('4028bc743c286bdc013c28a30f250013', '2013-01-11 16:04:00', '2013-03-31 00:17:31', '联系我们', '<div>&lt;div class=\"right2\"&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&lt;center&gt;佛山市路易名臣科技有限公司&lt;/center&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&lt;center&gt;Foshan Louismansion Technology CO., Ltd.&lt;/center&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&lt;div style=\"margin-left:60px;\"&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&lt;div class=\"tab2\"&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;在线客服QQ：&lt;br /&gt;</div>\r\n<div>&lt;table width=430px cellspacing=0&gt;</div>\r\n<div>&lt;tr&gt;&lt;th&gt;编号&lt;/th&gt;&lt;th&gt;QQ号&lt;/th&gt;&lt;th&gt;职责&lt;/th&gt;&lt;/tr&gt;</div>\r\n<div>&lt;tr&gt;&lt;td&gt;客服一&lt;/td&gt;&lt;td&gt;&lt;a href=\"http://wpa.qq.com/msgrd?v=3&amp;amp;uin=554368159&amp;amp;site=qq&amp;amp;menu=yes\" target=\"_blank\"&gt;&lt;img alt=\"点击这里给我发消息\" border=\"0\" src=\"http://wpa.qq.com/pa?p=2:554368159:41\" title=\"点击这里给我发消息\" /&gt;&lt;/a&gt;554368159&lt;/td&gt;&lt;td&gt;本席负责人工收卡、问题咨询、提现问题等&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&lt;tr&gt;&lt;td&gt;客服二&lt;/td&gt;&lt;td&gt;&lt;a href=\"http://wpa.qq.com/msgrd?v=3&amp;amp;uin=854768232&amp;amp;site=qq&amp;amp;menu=yes\" target=\"_blank\"&gt;&lt;img alt=\"点击这里给我发消息\" border=\"0\" src=\"http://wpa.qq.com/pa?p=2:854768232:41\" title=\"点击这里给我发消息\" /&gt;&lt;/a&gt;854768232&lt;/td&gt;&lt;td&gt;本席负责后勤&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&lt;/table&gt;</div>\r\n<div>&lt;/div&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;地址：中国. 广东省. 佛山市禅城区江湾一路18号西区&lt;br /&gt;</div>\r\n<div>邮编：528000&lt;br /&gt;</div>\r\n<div>名臣福利网址：www.mcfl.cn &amp;nbsp;fuli.louismansion.com&lt;br /&gt;</div>\r\n<div>全国服务热线：400-611-8420&lt;br /&gt;</div>\r\n<div>固话：0757-28615113（佛山）&lt;br /&gt;</div>\r\n<div><br />\r\n</div>\r\n<div><br />\r\n</div>\r\n<div>&nbsp; &nbsp;&lt;/div&gt;</div>', '182', '/html/201301/8c73cc996c5240bc9e97cc40e4850266.html', '', '', '', '以下是我们的联系方式', '联系我们', '1', '联系我们', '4028bc743c286bdc013c289277c5000a', '');
INSERT INTO `xx_article` VALUES ('4028bc743c286bdc013c28a4128c0015', '2013-01-11 16:05:06', '2013-03-30 23:26:38', '新手上路', '<div class=\"right2\">\r\n       <p><p>&lt;div class=\"right2\"&gt;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;&lt;p&gt;一、名臣福利可以为你做什么？&lt;br /&gt;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;答：名臣福利是全国第一家在线手机充值卡和游戏点卡回购的网站，在这里你可以进行点卡供货，快速消耗你手中闲置的点卡货源。简单说，我们可以收购您手里多余的手机充值卡和游戏点卡、手机话费，把它们重新高价销售后折合成现金，然后把钱直接打到您的银行账户，这一切都通过网络进行。&lt;/p&gt;</p>\r\n<p>&lt;br /&gt;</p>\r\n<p>&lt;p&gt;二、名臣福利的交易流程:&lt;br /&gt;</p>\r\n<p>1.注册账号，进入会员中心选择“我要卖卡”进行点卡供货。&lt;br /&gt;</p>\r\n<p>2.成功提交点卡后可以点击“订单查询”查看你的点卡处理状态。&lt;br /&gt;</p>\r\n<p>3.进入会员中心首页点击我要提现，设置好收款账号后提取货款即可。&lt;/p&gt;</p>\r\n<p>&lt;br /&gt;</p>\r\n<p>&lt;p&gt;三、名臣福利如何保证回购交易的进行？ &lt;br /&gt;</p>\r\n<p>名臣福利的充值卡和点卡回购交易和现实生活中的回购交易流程一样，包括两个步骤：交货和付款 &lt;/p&gt;</p>\r\n<p>&nbsp; &nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;&lt;/div&gt;</p>\r\n</p>\r\n   \r\n       </div>', '2', '/html/201301/ad975ce72b7c483b94245d4e21d0ecb4.html', '', '', '', '如何开始在名臣福利平台卖卡供货？请仔细看下面流程', '新手上路', '1', '新手上路', '4028bc743c286bdc013c289277c5000a', '');
INSERT INTO `xx_article` VALUES ('4028bc743c286bdc013c28a44e8b0017', '2013-01-11 16:05:22', '2013-03-31 23:07:21', '公司资质', '<div>&lt;div class=\"tab_top\"&gt;名臣福利网站是“&lt;a href=\"http://baike.baidu.com/view/8467651.htm\" target=\"_blank\"&gt; 佛山市路易名臣科技有限公司&lt;/a&gt;”旗下运营的非盈利网站之一，佛山市路易名臣科技有限公司是经佛山市工商管理部门批准的合法企业，详情可以浏览公司网站，或到佛山市工商局网站查询：&lt;a target=\"_blank\" href=\"http://www.fsccgsj.gov.cn\"&gt;http://www.fsccgsj.gov.cn&lt;/a&gt; 注册号：440682000319413 企业名称：佛山市路易名臣科技有限公司 &lt;/div&gt;&nbsp;</div>\r\n<div>&nbsp; &nbsp;<span class=\"Apple-tab-span\" style=\"white-space:pre;\">	</span> &nbsp; &lt;div class=\"tab\"&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&lt;img width=\"608px\" height=\"450px\" src=\"/template/card/images/zizhi/zhizhao.jpg\"/&gt;&lt;br /&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&lt;img width=\"608px\" height=\"450px\" src=\"<span style=\"line-height:1.5;\">/template/card/</span><span style=\"line-height:1.5;\">images/zizhi/zuzhi.jpg\"/&gt;&lt;br /&gt;</span></div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;img width=\"608px\" height=\"450px\" src=\"<span style=\"line-height:1.5;\">/template/card/</span><span style=\"line-height:1.5;\">images/zizhi/suiwu.jpg\"/&gt;</span></div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp; &lt;/div&gt;</div>', '72', '/html/201301/597c10bdbaf04f75a6c676128226ddf9.html', '', '', '', '以下是公司在工商局的注册的相关证件图片', '公司资质', '1', '公司资质', '4028bc743c286bdc013c289277c5000a', '');
INSERT INTO `xx_article` VALUES ('4028bc743c65859f013c65872b4c0000', '2013-01-23 11:50:22', '2013-03-10 16:39:42', 'gg', 'ssssssssssssssssss', '9', '/html/201301/c31d9dcfed44425eb41a46c4b471d788.html', '', '', '', '公告', '公告', '1', 'eeeeeeee', '4028bc743c65859f013c6589000c0002', '');
INSERT INTO `xx_article` VALUES ('8a9180203d0cb184013d0ce3bcb00001', '2013-02-24 23:48:04', '2013-03-03 18:52:36', 'admin', 'aqqqq', '0', '/html/201302/f3ad21abce9f41fda2d84ff154c34d3f.html', '', '', '', '', '', '1', 'qrtwqerewt', '4028bc743c65859f013c6589000c0002', '');
INSERT INTO `xx_article` VALUES ('8a9180203d0cb184013d0cec45f30006', '2013-02-24 23:57:23', '2013-03-11 23:49:36', 'admin', '欢迎欢迎广利名称福利官网网站！', '0', '/html/201302/2804d90fad7643c98b17f2371bfcf6c3.html', '', '', '', '', '', '1', '名臣福利新系统上线优惠让利', '4028bc743c286bdc013c289277c5000a', '');
INSERT INTO `xx_article` VALUES ('8a9181383c55f633013c56c8a3d20002', '2013-01-20 15:07:35', '2013-03-30 23:56:09', '商务合作', '<div>&lt;div class=\"right2\"&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&lt;div style=\"margin-left:60px;\"&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;&lt;div class=\"tab2\"&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;一、各银行网关、第三方账户支付、声讯/短信支付、神州行卡/联通卡/电信卡支付以及其它卡类支付等。&lt;br /&gt;</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;二、其他合作。</div>\r\n<div>&nbsp; &nbsp; &nbsp; &nbsp;联系方式：</div>\r\n<div>&lt;table width=450px cellspacing=0&gt;</div>\r\n<div>&lt;tr&gt;&lt;th&gt;邮箱&lt;/th&gt;&lt;th&gt;QQ号&lt;/th&gt;&lt;th&gt;职责&lt;/th&gt;&lt;/tr&gt;</div>\r\n<div>&lt;tr&gt;&lt;td&gt;305912949@qq.com&lt;/td&gt;&lt;td&gt;305912949&lt;/td&gt;&lt;td&gt;只负责支付业务、支付渠道合作，QQ验证消息“支付业务合作”，其他问题请咨询在线客服&lt;/td&gt;&lt;/tr&gt;</div>\r\n<div>&lt;/table&gt;</div>\r\n<div>&lt;/div&gt;</div>', '65', '/html/201301/dba7e39e0d674a7dba8e2af25ab10ff1.html', '', '', '', '以下是商务的联系方式，只负责业务合作咨询。', '商务合作', '1', '商务合作', '4028bc743c286bdc013c289277c5000a', '');

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
INSERT INTO `xx_article_category` VALUES ('4028bc743c286bdc013c28900dbb0008', '2013-01-11 15:43:14', '2013-02-28 10:53:08', '0', '名臣福利', '名臣福利', '名臣福利', '5', '4028bc743c286bdc013c28900dbb0008', 'mcfl', null);
INSERT INTO `xx_article_category` VALUES ('4028bc743c286bdc013c289277c5000a', '2013-01-11 15:45:53', '2013-02-28 10:52:27', '0', '帮助中心', '帮助中心', '帮助中心', '7', '4028bc743c286bdc013c289277c5000a', 'help', null);
INSERT INTO `xx_article_category` VALUES ('4028bc743c65859f013c6589000c0002', '2013-01-23 11:52:22', '2013-01-23 11:52:22', '0', '网站公告', '网站公告', '网站公告', '1', '4028bc743c65859f013c6589000c0002', 'advice', null);

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
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88a15b0f0001', '2012-10-22 21:20:06', '2013-01-16 13:17:10', '', '/upload/image/201301/8b44c616b14747eb98d07e9862edf171.gif', '骏网一卡通', '1', 'http://127.0.0.1:8080/card/cards!detail.action');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ac6eb10002', '2012-10-22 21:32:12', '2013-01-16 13:18:07', '', '/upload/image/201301/b91d11e3a7224dd28a46c26858b84e65.gif', '盛大卡', '2', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88aca0800003', '2012-10-22 21:32:25', '2013-03-24 09:33:44', '', null, '移动充值卡', '3', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88acc1ef0004', '2012-10-22 21:32:34', '2012-10-31 11:50:55', null, '', '征途卡', '4', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88acef930005', '2012-10-22 21:32:45', '2012-10-22 21:32:45', null, '', 'Q币卡', '5', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ad18e10006', '2012-10-22 21:32:56', '2012-10-22 21:32:56', null, '', '联通卡', '6', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ad3c100007', '2012-10-22 21:33:05', '2013-03-24 09:35:05', '', null, '久游一卡通', '7', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ad61df0008', '2012-10-22 21:33:15', '2012-10-22 21:33:15', null, '', '易宝e卡通', '8', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ad845a0009', '2012-10-22 21:33:23', '2013-03-24 09:34:24', '', null, '网易一卡通', '9', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88ada7f6000a', '2012-10-22 21:33:33', '2013-03-24 09:34:35', '', null, '完美一卡通', '10', '');
INSERT INTO `xx_brand` VALUES ('8ae4839c3a887878013a88add167000b', '2012-10-22 21:33:43', '2013-03-24 09:36:07', '', null, '搜狐一卡通', '11', '');
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
  `order_list` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cards_sn` (`cards_sn`),
  KEY `fk_cards_brand` (`brand_id`),
  CONSTRAINT `fk_cards_brand` FOREIGN KEY (`brand_id`) REFERENCES `xx_brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_cards
-- ----------------------------
INSERT INTO `xx_cards` VALUES ('4028bc743bb6fee6013bb755fd4b0001', '2012-12-20 16:02:44', '2013-02-03 15:32:40', null, 'SN_B4A01EABE4F9', '/html/201212/28ee1eadf73640598a42c42a46c484ef.html', 'Q币卡', '', '', '', '', '', 'Q币卡', 'Q币卡', '腾讯Q币卡', '5.00000', '0', '8ae4839c3a887878013a88acef930005', '3');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c51dac90001', '2013-01-15 11:47:42', '2013-02-03 14:43:54', null, 'SN_D0126B004D0A', '/html/201301/9d062d85f8d34897a53f2757d7c5e7ec.html', '', '', '', '', '', '', '移动充值卡', '移动充值卡', '移动充值卡', '10.00000', '0', '8ae4839c3a887878013a88aca0800003', '1');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c5692200004', '2013-01-15 11:52:52', '2013-02-03 14:44:14', null, 'SN_F42E3ABC8BA1', '/html/201301/ab78d5c8c64443b5a8784e4462d4dd35.html', '', '', '', '', '', '', '联通充值卡', '联通充值卡', '联通充值卡', '20.00000', '0', '8ae4839c3a887878013a88ad18e10006', '2');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c56fe760007', '2013-01-15 11:53:19', '2013-03-24 09:46:22', null, 'SN_18971B95668C', '/html/201301/a880c53a0504406c827c97f6d0b8558a.html', '', '', '', '', '', '', '电信充值卡', '电信充值卡', '电信充值卡', '50.00000', '0', '8ae4839c3a887878013a88ae0511000c', '10');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c573891000a', '2013-01-15 11:53:34', '2013-01-17 11:11:43', null, 'SN_CAFA738E7712', '/html/201301/9a846286bb924d2e949e20fc7df3fcad.html', '', '', '', '', '', '', '骏网一卡通', '骏网一卡通', '骏网一卡通', '5.00000', '0', '8ae4839c3a887878013a88a15b0f0001', '5');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c5794ea000d', '2013-01-15 11:53:58', '2013-01-16 20:32:59', null, 'SN_9CA2F3FF4FC1', '/html/201301/ee17750e915c4a23ac5b1ae6f89b9c23.html', '', '', '', '', '', '', '盛大一卡通', '盛大一卡通', '盛大一卡通', '5.00000', '0', '8ae4839c3a887878013a88ac6eb10002', '6');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c57dd7c0010', '2013-01-15 11:54:16', '2013-01-16 20:31:24', null, 'SN_D6018790CFE4', '/html/201301/926981d5c75c48788b3898c046ab1bca.html', '', '', '', '', '', '', '巨人(征途)一卡通', '巨人(征途)一卡通', '巨人(征途)一卡通', '5.00000', '0', '8ae4839c3a887878013a88acc1ef0004', '7');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c58d71e0015', '2013-01-15 11:55:20', '2013-01-16 20:28:03', null, 'SN_9D312A3C7C81', '/html/201301/0b9d62c35e0643ada94b738b8e5d7ce9.html', '', '', '', '', '', '', '易宝e卡通', '易宝e卡通', '易宝e卡通', '2.00000', '0', '8ae4839c3a887878013a88ad61df0008', '8');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c5902060018', '2013-01-15 11:55:31', '2013-01-16 20:24:15', null, 'SN_E3D0639EC16F', '/html/201301/dd567ea9ba4e403e88812119dafad952.html', '', '', '', '', '', '', '完美一卡通', '完美一卡通', '完美一卡通', '15.00000', '0', '8ae4839c3a887878013a88ada7f6000a', '9');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c593eb2001b', '2013-01-15 11:55:47', '2013-02-03 15:03:51', null, 'SN_B40AECA9CBB7', '/html/201301/8e4cccc882af4937bc899c21ef29d6de.html', '', '', '', '', '', '', '搜狐一卡通', '搜狐一卡通', '搜狐一卡通', '5.00000', '0', '8ae4839c3a887878013a88add167000b', '4');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c597801001e', '2013-01-15 11:56:01', '2013-01-16 19:29:18', null, 'SN_5403A3D0491C', '/html/201301/afecf5917b7943eb8522358dc4995238.html', '', '', '', '', '', '', '天下通一卡通', '天下通一卡通', '天下通一卡通', '5.00000', '0', '8ae4839c3a887878013a88ae4be5000e', '11');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c59ae340021', '2013-01-15 11:56:15', '2013-01-16 19:28:05', null, 'SN_0507F5D87570', '/html/201301/776d2824cf724f4c83fd850a84eddf25.html', '', '', '', '', '', '', '纵游一卡通', '纵游一卡通', '纵游一卡通', '5.00000', '0', '8ae4839c3a887878013a88ae29c8000d', '12');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c59df180024', '2013-01-15 11:56:28', '2013-01-16 19:26:57', null, 'SN_7D6758D39206', '/html/201301/e0b899631c414de1801af4744aa1aebf.html', '', '', '', '', '', '', '天宏一卡通', '天宏一卡通', '天宏一卡通', '5.00000', '0', '8ae4839c3a887878013a88ae757d000f', '13');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c5a1c310027', '2013-01-15 11:56:43', '2013-01-16 19:25:07', null, 'SN_402A5B739469', '/html/201301/fd8f77ae780d4887bc79ce2506fb9e42.html', '', '', '', '', '', '', '久游一卡通', '久游一卡通', '久游一卡通', '5.00000', '0', '8ae4839c3a887878013a88ad3c100007', '14');
INSERT INTO `xx_cards` VALUES ('4028bc743c3c4340013c3c5a4d05002a', '2013-01-15 11:56:56', '2013-01-16 19:20:18', null, 'SN_9A06259F2474', '/html/201301/744887a269a04ca2b3ce5f234a91443c.html', '', '', '', '', '', '', '网易一卡通', '网易一卡通', '网易一卡通', '10.00000', '0', '8ae4839c3a887878013a88ad845a0009', '15');

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
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c51dac90001', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c5692200004', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c56fe760007', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c573891000a', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c5794ea000d', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c57dd7c0010', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c58d71e0015', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c5902060018', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c593eb2001b', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c597801001e', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c59ae340021', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c59df180024', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c5a1c310027', '8ae4839c3a887878013a889ad43a0000');
INSERT INTO `xx_cards_specification` VALUES ('4028bc743c3c4340013c3c5a4d05002a', '8ae4839c3a887878013a889ad43a0000');

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
INSERT INTO `xx_deposit` VALUES ('4028bc743c23b04e013c23b53a850000', '2013-01-10 17:05:45', '2013-01-10 17:05:45', '3400.00', '400.00', '0.00', '2', null, null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c3d7a21013c3d8c3b130002', '2013-01-15 17:31:05', '2013-01-15 17:31:05', '3006.00', '0.00', '44.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c3d7a21013c3d8c5d020003', '2013-01-15 17:31:14', '2013-01-15 17:31:14', '2806.00', '0.00', '200.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c3d7a21013c3d8c6dcb0004', '2013-01-15 17:31:18', '2013-01-15 17:31:18', '2706.00', '0.00', '100.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42bb3d6e0075', '2013-01-16 17:40:32', '2013-01-16 17:40:32', '2361.00', '0.00', '345.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42bb59040076', '2013-01-16 17:40:39', '2013-01-16 17:40:39', '2262.00', '0.00', '99.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42bd8a9a0077', '2013-01-16 17:43:03', '2013-01-16 17:43:03', '2163.00', '0.00', '99.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42be4afc0078', '2013-01-16 17:43:52', '2013-01-16 17:43:52', '2064.00', '0.00', '99.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42c3c37f007a', '2013-01-16 17:49:51', '2013-01-16 17:49:51', '2063.00', '0.00', '1.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42c48930007c', '2013-01-16 17:50:41', '2013-01-16 17:50:41', '2058.00', '0.00', '5.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42c5c52b0082', '2013-01-16 17:52:02', '2013-01-16 17:52:02', '2004.00', '0.00', '54.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42c7d5100083', '2013-01-16 17:54:18', '2013-01-16 17:54:18', '2000.00', '0.00', '4.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42c86dd50084', '2013-01-16 17:54:57', '2013-01-16 17:54:57', '1957.00', '0.00', '43.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42c8b1f20085', '2013-01-16 17:55:14', '2013-01-16 17:55:14', '1924.00', '0.00', '33.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743c42784e013c42c94f3c0086', '2013-01-16 17:55:54', '2013-01-16 17:55:54', '1922.00', '0.00', '2.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('4028bc743d3dbdf7013d3dd5d2cc0008', '2013-03-06 11:54:16', '2013-03-06 11:54:16', '1066.00', '0.00', '345.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('8a8f82cc3d59ef2c013d5a066eac0003', '2013-03-11 23:16:43', '2013-03-11 23:16:43', '300.00', '300.00', '0.00', '2', null, null, null, '8a8f82cc3d5936a7013d599155fc0000');
INSERT INTO `xx_deposit` VALUES ('8a8f82cc3d59ef2c013d5a0b88ae0005', '2013-03-11 23:22:18', '2013-03-11 23:22:18', '999.00', '0.00', '67.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('8a9181263c33448b013c3349d79d0002', '2013-01-13 17:42:22', '2013-01-13 17:42:22', '3230.00', '0.00', '170.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('8a9181263c33448b013c3349f0160003', '2013-01-13 17:42:29', '2013-01-13 17:42:29', '3050.00', '0.00', '180.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('8a9181383c571fbe013c5747623f0005', '2013-01-20 17:26:01', '2013-01-20 17:26:01', '1877.00', '0.00', '45.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('8a9181383c571fbe013c574dd9cf0007', '2013-01-20 17:33:05', '2013-01-20 17:33:05', '1821.00', '0.00', '56.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('8a9181383c57f8bb013c58027d430002', '2013-01-20 20:50:23', '2013-01-20 20:50:23', '1744.00', '0.00', '77.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('8a9183be3ce89927013ce8ac55940001', '2013-02-17 23:01:13', '2013-02-17 23:01:13', '1411.00', '0.00', '333.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('ff8080813d8323f4013d8338fd440005', '2013-03-19 23:16:22', '2013-03-19 23:16:22', '909.00', '0.00', '90.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_deposit` VALUES ('ff8080813d8323f4013d833cad440006', '2013-03-19 23:20:24', '2013-03-19 23:20:24', '354.00', '0.00', '555.00', '5', '0.97', null, null, '8a9182fc3ba86bc8013ba9782de60001');

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
INSERT INTO `xx_friend_link` VALUES ('4028bc743c286bdc013c288103340000', '2013-01-11 15:26:49', '2013-01-14 20:45:01', '/upload/image/201301/3ebb3ca020924a32a23720f08ffa71da.gif', '移动神州行', '1', 'http://www.10086.com');
INSERT INTO `xx_friend_link` VALUES ('4028bc743c286bdc013c288156a40001', '2013-01-11 15:27:10', '2013-01-14 20:45:33', '/upload/image/201301/24fe754d4c0c4a72bf5e2ce3c20c7eb3.gif', '中国联通', '2', 'http://www.10010.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c39186c2b0000', '2013-01-14 20:46:07', '2013-01-14 20:46:07', '/upload/image/201301/8ccf5485e6aa48a8b53c380b416cd305.gif', '中国电信', '3', 'http://www.ct10000.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c3918ab100001', '2013-01-14 20:46:23', '2013-01-14 20:46:23', '/upload/image/201301/a475ace0a6d34428b464bc162ed3afa6.gif', '腾讯一卡通', '4', 'http://www.qq.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c3918fce20002', '2013-01-14 20:46:44', '2013-01-14 20:46:44', '/upload/image/201301/d8f910c2f96e449a8ff19f55490d0c8e.gif', '骏网一卡通', '5', 'http://www.jcard.cn');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c391932530003', '2013-01-14 20:46:58', '2013-01-14 20:46:58', '/upload/image/201301/280aac66116141cc8401219077193117.gif', '盛大一卡通', '6', 'http://www.snda.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c391966480004', '2013-01-14 20:47:11', '2013-01-14 20:47:11', '/upload/image/201301/d467b8d2350f41429ed515a1bd739e68.gif', '搜狐一卡通', '8', 'http://www.sohu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c391998db0005', '2013-01-14 20:47:24', '2013-01-14 20:47:24', '/upload/image/201301/ebc9f05cd7cf4e29a967a82d6c0952c1.gif', '网易一卡通', '9', 'http://www.163.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c3919d7f30006', '2013-01-14 20:47:40', '2013-01-14 20:47:40', '/upload/image/201301/b26219c765a74345b8e8d393dfbe4675.gif', '巨人一卡通', '10', 'http://www.ztgame.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c391a6e070007', '2013-01-14 20:48:18', '2013-01-14 20:48:18', '/upload/image/201301/a5d3567823e2467d8f098a75b19cd0de.gif', '久游一卡通', '11', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c391ac1040008', '2013-01-14 20:48:40', '2013-01-14 20:48:40', '/upload/image/201301/6ab9a41718444517bdd623ca6751629c.gif', '完美一卡通', '12', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c391b227d0009', '2013-01-14 20:49:05', '2013-01-14 20:49:05', '/upload/image/201301/6e764258aea94225bf8b47ac2dfb3f79.gif', '纵游一卡通', '13', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c391bfa06000a', '2013-01-14 20:50:00', '2013-01-14 20:50:00', null, '天下一卡通', '14', 'http://www.baidu.com');
INSERT INTO `xx_friend_link` VALUES ('8a9482c33c38949a013c391c3e3e000b', '2013-01-14 20:50:17', '2013-01-14 20:50:17', '/upload/image/201301/761b742bc27344aab9737e7a420e43da.gif', '天宏一卡通', '14', 'http://www.baidu.com');

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
INSERT INTO `xx_instant_messaging` VALUES ('8a9181383c55f633013c560f784b0000', '2013-01-20 11:45:19', '2013-01-20 11:45:19', '0', '1', '客服1', '704442497');

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
INSERT INTO `xx_leave_message` VALUES ('4028bc743c6fd935013c706074b60002', '2013-01-25 14:23:55', '2013-01-25 14:23:55', '555', '555', '127.0.0.1', '555', null, null);

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
INSERT INTO `xx_log` VALUES ('2c9484693ddfd7a0013ddfe400f80001', '2013-04-06 23:08:14', '2013-04-06 23:08:14', 'net.xxs.action.admin.ArticleAction', 'save', '添加文章: 支持卡种', '127.0.0.1', '添加文章', 'admin');
INSERT INTO `xx_log` VALUES ('2c9484693ddfd7a0013ddfe5eb0a0003', '2013-04-06 23:10:19', '2013-04-06 23:10:19', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 支持卡种', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('2c9484693ddfd7a0013ddfe6bc4e0004', '2013-04-06 23:11:13', '2013-04-06 23:11:13', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 支持卡种', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743bb257ca013bb264d4be0001', '2012-12-19 17:00:50', '2012-12-19 17:00:50', 'net.xxs.action.admin.CardsCategoryAction', 'save', '添加充值卡分类: 222', '127.0.0.1', '添加充值卡分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743bb6fee6013bb75600b60004', '2012-12-20 16:02:45', '2012-12-20 16:02:45', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: Q币卡', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743bbb05c2013bbb25d5e20001', '2012-12-21 09:48:37', '2012-12-21 09:48:37', 'net.xxs.action.admin.ArticleCategoryAction', 'save', '添加文章分类: 新手上路', '127.0.0.1', '添加文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743bbb05c2013bbb2613390003', '2012-12-21 09:48:52', '2012-12-21 09:48:52', 'net.xxs.action.admin.ArticleAction', 'save', '添加文章: 新手上路', '127.0.0.1', '添加文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c142aaf013c14324c2c0000', '2013-01-07 16:48:26', '2013-01-07 16:48:26', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c1da22d013c1da8d2eb0002', '2013-01-09 12:54:28', '2013-01-09 12:54:28', 'net.xxs.action.admin.OrderAction', 'completed', '订单编号: DD100049', '127.0.0.1', '订单完成', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c2281e9013c228868250001', '2013-01-10 11:37:10', '2013-01-10 11:37:10', 'net.xxs.action.admin.OrderAction', 'completed', '订单编号: DD100048', '127.0.0.1', '订单完成', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c236a6b013c2399edb10000', '2013-01-10 16:35:55', '2013-01-10 16:35:55', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c236a6b013c239bf44e0001', '2013-01-10 16:38:08', '2013-01-10 16:38:08', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c236a6b013c239c4d6b0002', '2013-01-10 16:38:31', '2013-01-10 16:38:31', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c236a6b013c23a11c310003', '2013-01-10 16:43:46', '2013-01-10 16:43:46', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c23b04e013c23b53ab40001', '2013-01-10 17:05:45', '2013-01-10 17:05:45', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c23b04e013c23b6e3630002', '2013-01-10 17:07:33', '2013-01-10 17:07:33', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c23b04e013c23cd45db0003', '2013-01-10 17:32:00', '2013-01-10 17:32:00', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c288e82f40003', '2013-01-11 15:41:33', '2013-01-11 15:41:33', 'net.xxs.action.admin.ArticleCategoryAction', 'save', '添加文章分类: 收卡价格', '127.0.0.1', '添加文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c288f32fb0005', '2013-01-11 15:42:18', '2013-01-11 15:42:18', 'net.xxs.action.admin.ArticleCategoryAction', 'save', '添加文章分类: 名臣公益', '127.0.0.1', '添加文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c288f935a0007', '2013-01-11 15:42:43', '2013-01-11 15:42:43', 'net.xxs.action.admin.ArticleCategoryAction', 'save', '添加文章分类: 交易保障', '127.0.0.1', '添加文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c28900df90009', '2013-01-11 15:43:14', '2013-01-11 15:43:14', 'net.xxs.action.admin.ArticleCategoryAction', 'save', '添加文章分类: 关于我们', '127.0.0.1', '添加文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c28927813000b', '2013-01-11 15:45:53', '2013-01-11 15:45:53', 'net.xxs.action.admin.ArticleCategoryAction', 'save', '添加文章分类: 成功案例', '127.0.0.1', '添加文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c28a2d8d30012', '2013-01-11 16:03:46', '2013-01-11 16:03:46', 'net.xxs.action.admin.ArticleAction', 'save', '添加文章: 成功案例', '127.0.0.1', '添加文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c28a30ff10014', '2013-01-11 16:04:00', '2013-01-11 16:04:00', 'net.xxs.action.admin.ArticleAction', 'save', '添加文章: 联系我们', '127.0.0.1', '添加文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c28a413660016', '2013-01-11 16:05:07', '2013-01-11 16:05:07', 'net.xxs.action.admin.ArticleAction', 'save', '添加文章: 新手上路', '127.0.0.1', '添加文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c286bdc013c28a44f750018', '2013-01-11 16:05:22', '2013-01-11 16:05:22', 'net.xxs.action.admin.ArticleAction', 'save', '添加文章: 收卡价格', '127.0.0.1', '添加文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c50225b0000', '2013-01-15 11:45:50', '2013-01-15 11:45:50', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 腾讯Q币卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c51dc6f0003', '2013-01-15 11:47:43', '2013-01-15 11:47:43', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 移动充值卡', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c5693480006', '2013-01-15 11:52:52', '2013-01-15 11:52:52', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 联通充值卡', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c57000c0009', '2013-01-15 11:53:20', '2013-01-15 11:53:20', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 电信充值卡', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c5739ba000c', '2013-01-15 11:53:34', '2013-01-15 11:53:34', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 骏网一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c579603000f', '2013-01-15 11:53:58', '2013-01-15 11:53:58', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 盛大一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c57dec40012', '2013-01-15 11:54:17', '2013-01-15 11:54:17', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 巨人(征途)一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c57ff4c0013', '2013-01-15 11:54:25', '2013-01-15 11:54:25', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 巨人(征途)一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c581e4d0014', '2013-01-15 11:54:33', '2013-01-15 11:54:33', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 盛大一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c58d8370017', '2013-01-15 11:55:21', '2013-01-15 11:55:21', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 易宝e卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c5903fa001a', '2013-01-15 11:55:32', '2013-01-15 11:55:32', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 完美一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c593fea001d', '2013-01-15 11:55:47', '2013-01-15 11:55:47', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 搜狐一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c5979690020', '2013-01-15 11:56:02', '2013-01-15 11:56:02', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 天下通一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c59af5d0023', '2013-01-15 11:56:16', '2013-01-15 11:56:16', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 纵游一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c59e0310026', '2013-01-15 11:56:28', '2013-01-15 11:56:28', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 天宏一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c5a1d690029', '2013-01-15 11:56:44', '2013-01-15 11:56:44', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 久游一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c3c4340013c3c5a4e6c002c', '2013-01-15 11:56:56', '2013-01-15 11:56:56', 'net.xxs.action.admin.CardsAction', 'save', '添加充值卡: 网易一卡通', '127.0.0.1', '添加充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c42784e013c42824ec8000a', '2013-01-16 16:38:21', '2013-01-16 16:38:21', 'net.xxs.action.admin.OrderAction', 'completed', '订单编号: DD100080', '127.0.0.1', '订单完成', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c46743a013c467da27a0008', '2013-01-17 11:11:44', '2013-01-17 11:11:44', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 骏网一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c5b15e5013c5b3b1c3e0000', '2013-01-21 11:51:06', '2013-01-21 11:51:06', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c604c36013c60a9231b0005', '2013-01-22 13:09:22', '2013-01-22 13:09:22', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c604c36013c60aeab100006', '2013-01-22 13:15:25', '2013-01-22 13:15:25', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c604c36013c60aec9750007', '2013-01-22 13:15:33', '2013-01-22 13:15:33', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c604c36013c60aee7ab0008', '2013-01-22 13:15:40', '2013-01-22 13:15:40', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c604c36013c60b152140009', '2013-01-22 13:18:19', '2013-01-22 13:18:19', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c604c36013c60b17626000a', '2013-01-22 13:18:28', '2013-01-22 13:18:28', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 112233', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c65859f013c65872d400001', '2013-01-23 11:50:23', '2013-01-23 11:50:23', 'net.xxs.action.admin.ArticleAction', 'save', '添加文章: eeeeeeee', '127.0.0.1', '添加文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c65859f013c658900890003', '2013-01-23 11:52:22', '2013-01-23 11:52:22', 'net.xxs.action.admin.ArticleCategoryAction', 'save', '添加文章分类: 网站公告', '127.0.0.1', '添加文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c65859f013c658921500004', '2013-01-23 11:52:31', '2013-01-23 11:52:31', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: eeeeeeee', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743c6f3698013c6f3908b80004', '2013-01-25 09:01:14', '2013-01-25 09:01:14', 'net.xxs.action.admin.OrderAction', 'completed', '订单编号: DD100012', '127.0.0.1', '订单完成', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743d09c365013d09c8f0f00000', '2013-02-24 09:19:56', '2013-02-24 09:19:56', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: eeeeeeee', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743d1e8f29013d1eb715a70000', '2013-02-28 10:52:27', '2013-02-28 10:52:27', 'net.xxs.action.admin.ArticleCategoryAction', 'update', '编辑文章分类: 帮助中心', '127.0.0.1', '编辑文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743d1e8f29013d1eb7b5520001', '2013-02-28 10:53:08', '2013-02-28 10:53:08', 'net.xxs.action.admin.ArticleCategoryAction', 'update', '编辑文章分类: 名臣福利', '127.0.0.1', '编辑文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743d1e8f29013d1ed23ea80002', '2013-02-28 11:22:07', '2013-02-28 11:22:07', 'net.xxs.action.admin.ArticleCategoryAction', 'delete', '删除文章分类: 交易保障', '127.0.0.1', '删除文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743d1e8f29013d1ed24f510003', '2013-02-28 11:22:12', '2013-02-28 11:22:12', 'net.xxs.action.admin.ArticleCategoryAction', 'delete', '删除文章分类: 名臣公益', '127.0.0.1', '删除文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743d1e8f29013d1ed25c710004', '2013-02-28 11:22:15', '2013-02-28 11:22:15', 'net.xxs.action.admin.ArticleCategoryAction', 'delete', '删除文章分类: 收卡价格', '127.0.0.1', '删除文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743d1e8f29013d1ed26eef0005', '2013-02-28 11:22:20', '2013-02-28 11:22:20', 'net.xxs.action.admin.ArticleCategoryAction', 'delete', '删除文章分类: 新手上路', '127.0.0.1', '删除文章分类', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743d1e8f29013d1ed5971a0006', '2013-02-28 11:25:47', '2013-02-28 11:25:47', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 新手上路', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743d1e8f29013d1ed741200007', '2013-02-28 11:27:36', '2013-02-28 11:27:36', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 常见问题', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743d1e8f29013d1ed863690008', '2013-02-28 11:28:50', '2013-02-28 11:28:50', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 提现说明', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743d1e8f29013d1ed98c770009', '2013-02-28 11:30:06', '2013-02-28 11:30:06', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 联系我们', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743d1e8f29013d1eda6776000a', '2013-02-28 11:31:02', '2013-02-28 11:31:02', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 商务合作', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743d1e8f29013d1edc648e000b', '2013-02-28 11:33:12', '2013-02-28 11:33:12', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 公司资质', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743d99e919013d9a118e200008', '2013-03-24 09:44:34', '2013-03-24 09:44:34', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 电信充值卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('4028bc743d99e919013d9a1333250009', '2013-03-24 09:46:22', '2013-03-24 09:46:22', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 电信充值卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f80983dbb02ce013dbbe859f50000', '2013-03-30 23:26:39', '2013-03-30 23:26:39', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 新手上路', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f80983dbb02ce013dbbe90a450001', '2013-03-30 23:27:24', '2013-03-30 23:27:24', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 提现说明', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f80983dbb02ce013dbbea4a900002', '2013-03-30 23:28:46', '2013-03-30 23:28:46', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 公司资质', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f80983dbb02ce013dbbed53ce0003', '2013-03-30 23:32:05', '2013-03-30 23:32:05', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 公司资质', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f80983dbb02ce013dbbee823e0004', '2013-03-30 23:33:23', '2013-03-30 23:33:23', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 公司资质', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f80983dbb02ce013dbbf204f60005', '2013-03-30 23:37:13', '2013-03-30 23:37:13', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 公司资质', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f80983dbb02ce013dbbf378a60006', '2013-03-30 23:38:48', '2013-03-30 23:38:48', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 公司资质', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f80983dbb02ce013dbbf4ac900007', '2013-03-30 23:40:07', '2013-03-30 23:40:07', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 公司资质', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f80983dbb02ce013dbbf5b2660008', '2013-03-30 23:41:14', '2013-03-30 23:41:14', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 公司资质', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f80983dbb02ce013dbc204c6c0009', '2013-03-31 00:27:46', '2013-03-31 00:27:46', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 提现说明', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f80983dbb02ce013dbc2142e5000a', '2013-03-31 00:28:49', '2013-03-31 00:28:49', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 提现说明', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f80983dbb02ce013dbc22e244000b', '2013-03-31 00:30:35', '2013-03-31 00:30:35', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 提现说明', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f80983dbb02ce013dbc24337e000c', '2013-03-31 00:32:01', '2013-03-31 00:32:01', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 提现说明', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f80983dbb02ce013dbc24b359000d', '2013-03-31 00:32:34', '2013-03-31 00:32:34', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 提现说明', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f81ff3c9e2f64013c9e35400f0000', '2013-02-03 11:59:15', '2013-02-03 11:59:15', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 腾讯Q币卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f81ff3c9e2f64013c9ecc04030001', '2013-02-03 14:43:56', '2013-02-03 14:43:56', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 移动充值卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f81ff3c9e2f64013c9ecc4f880002', '2013-02-03 14:44:15', '2013-02-03 14:44:15', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 联通充值卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f81ff3c9ed8aa013c9ede42e10000', '2013-02-03 15:03:52', '2013-02-03 15:03:52', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 搜狐一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f81ff3c9ed8aa013c9edf30b60001', '2013-02-03 15:04:52', '2013-02-03 15:04:52', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 电信充值卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f81ff3c9ed8aa013c9edf6c4a0002', '2013-02-03 15:05:07', '2013-02-03 15:05:07', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 电信充值卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f81ff3c9ed8aa013c9ef87fad0003', '2013-02-03 15:32:31', '2013-02-03 15:32:31', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 腾讯Q币卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f81ff3c9ed8aa013c9ef8a5570004', '2013-02-03 15:32:40', '2013-02-03 15:32:40', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 腾讯Q币卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f82ad3d87c40f013d87dd78390013', '2013-03-20 20:54:31', '2013-03-20 20:54:31', 'net.xxs.action.admin.OrderAction', 'completed', '订单编号: DD100163', '127.0.0.1', '订单完成', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f82cc3d59ef2c013d59fff0410000', '2013-03-11 23:09:38', '2013-03-11 23:09:38', 'net.xxs.action.admin.SettingAction', 'update', null, '127.0.0.1', '系统设置', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f82cc3d59ef2c013d5a0062510001', '2013-03-11 23:10:07', '2013-03-11 23:10:07', 'net.xxs.action.admin.SettingAction', 'update', null, '127.0.0.1', '系统设置', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f82cc3d59ef2c013d5a00a85c0002', '2013-03-11 23:10:25', '2013-03-11 23:10:25', 'net.xxs.action.admin.SettingAction', 'update', null, '127.0.0.1', '系统设置', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f82cc3d59ef2c013d5a066efa0004', '2013-03-11 23:16:43', '2013-03-11 23:16:43', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 4444', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f82cc3d59ef2c013d5a23a4ea0008', '2013-03-11 23:48:38', '2013-03-11 23:48:38', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 名臣福利新系统上线优惠让利', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a8f82cc3d59ef2c013d5a2489270009', '2013-03-11 23:49:36', '2013-03-11 23:49:36', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 名臣福利新系统上线优惠让利', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a9180203d0cb184013d0ce3bdfe0002', '2013-02-24 23:48:04', '2013-02-24 23:48:04', 'net.xxs.action.admin.ArticleAction', 'save', '添加文章: 可否支持银行卡进行在线支付', '127.0.0.1', '添加文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a9180203d0cb184013d0ce782ca0003', '2013-02-24 23:52:11', '2013-02-24 23:52:11', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 可否支持银行卡进行在线支付', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a9180203d0cb184013d0ce7f2570004', '2013-02-24 23:52:40', '2013-02-24 23:52:40', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: qrtwqerewt', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a9180203d0cb184013d0ce9ec500005', '2013-02-24 23:54:49', '2013-02-24 23:54:49', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: qrtwqerewt', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a9180203d0cb184013d0cec46db0007', '2013-02-24 23:57:24', '2013-02-24 23:57:24', 'net.xxs.action.admin.ArticleAction', 'save', '添加文章: 名臣福利新系统上线优惠让利', '127.0.0.1', '添加文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a9180203d1bffed013d1c2bd6a80001', '2013-02-27 23:01:07', '2013-02-27 23:01:07', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 联系我们', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a9180203d1c2e04013d1c34eea10000', '2013-02-27 23:11:03', '2013-02-27 23:11:03', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 成功案例', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a9181243d5254ea013d5358cba10006', '2013-03-10 16:09:21', '2013-03-10 16:09:21', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('8a9181243d5254ea013d535a842f0007', '2013-03-10 16:11:13', '2013-03-10 16:11:13', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('8a9181243d5254ea013d535c875e0008', '2013-03-10 16:13:25', '2013-03-10 16:13:25', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('8a9181243d5254ea013d535f0dce0009', '2013-03-10 16:16:11', '2013-03-10 16:16:11', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('8a9181383c55f633013c56a4f47d0001', '2013-01-20 14:28:36', '2013-01-20 14:28:36', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 收卡价格', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a9181383c55f633013c56c8a5c40003', '2013-01-20 15:07:35', '2013-01-20 15:07:35', 'net.xxs.action.admin.ArticleAction', 'save', '添加文章: aaa', '127.0.0.1', '添加文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a9181383c571fbe013c572a8f450000', '2013-01-20 16:54:32', '2013-01-20 16:54:32', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 新手上路', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a9181383c57c9d3013c57cae0120000', '2013-01-20 19:49:38', '2013-01-20 19:49:38', 'net.xxs.action.admin.SettingAction', 'update', null, '127.0.0.1', '系统设置', 'admin');
INSERT INTO `xx_log` VALUES ('8a9181383c57c9d3013c57caf2d50001', '2013-01-20 19:49:43', '2013-01-20 19:49:43', 'net.xxs.action.admin.SettingAction', 'update', null, '127.0.0.1', '系统设置', 'admin');
INSERT INTO `xx_log` VALUES ('8a9182c43dc070fa013dc0f879e10000', '2013-03-31 23:02:22', '2013-03-31 23:02:22', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 公司资质', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a9182c43dc070fa013dc0fa68ac0001', '2013-03-31 23:04:29', '2013-03-31 23:04:29', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 公司资质', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a9182c43dc070fa013dc0fac91b0002', '2013-03-31 23:04:53', '2013-03-31 23:04:53', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 公司资质', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a9182c43dc070fa013dc0fd0a260003', '2013-03-31 23:07:21', '2013-03-31 23:07:21', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 公司资质', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('8a9182fc3ba86bc8013ba9782e800002', '2012-12-17 23:25:23', '2012-12-17 23:25:23', 'net.xxs.action.admin.MemberAction', 'save', '添加会员: 123123', '127.0.0.1', '添加会员', 'admin');
INSERT INTO `xx_log` VALUES ('8a9182fc3ba86bc8013ba97939a00004', '2012-12-17 23:26:32', '2012-12-17 23:26:32', 'net.xxs.action.admin.MemberAction', 'update', '编辑会员: 123123', '127.0.0.1', '编辑会员', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c431697d50005', '2013-01-16 19:20:19', '2013-01-16 19:20:19', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 网易一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c431afe23000a', '2013-01-16 19:25:08', '2013-01-16 19:25:08', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 久游一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c431cace90012', '2013-01-16 19:26:58', '2013-01-16 19:26:58', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 天宏一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c431db6e30019', '2013-01-16 19:28:06', '2013-01-16 19:28:06', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 纵游一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c431ed1d90021', '2013-01-16 19:29:18', '2013-01-16 19:29:18', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 天下通一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c43502e7c0028', '2013-01-16 20:23:13', '2013-01-16 20:23:13', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 搜狐一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c435120fa002d', '2013-01-16 20:24:15', '2013-01-16 20:24:15', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 完美一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c43549c040039', '2013-01-16 20:28:03', '2013-01-16 20:28:03', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 易宝e卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c4357aeea004c', '2013-01-16 20:31:25', '2013-01-16 20:31:25', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 巨人(征途)一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c43591f4f0055', '2013-01-16 20:32:59', '2013-01-16 20:32:59', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 盛大一卡通', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c435ac6340058', '2013-01-16 20:34:47', '2013-01-16 20:34:47', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 电信充值卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c435b9980005f', '2013-01-16 20:35:42', '2013-01-16 20:35:42', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 联通充值卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c4308a2013c435d43c10068', '2013-01-16 20:37:31', '2013-01-16 20:37:31', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 移动充值卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae4834e3c43653d013c436869520006', '2013-01-16 20:49:41', '2013-01-16 20:49:41', 'net.xxs.action.admin.CardsAction', 'update', '编辑充值卡: 腾讯Q币卡', '127.0.0.1', '编辑充值卡', 'admin');
INSERT INTO `xx_log` VALUES ('8ae484093bd1e9bd013bd2053e570001', '2012-12-25 20:24:17', '2012-12-25 20:24:17', 'net.xxs.action.admin.OrderAction', 'completed', '订单编号: DD100037', '127.0.0.1', '订单完成', 'admin');
INSERT INTO `xx_log` VALUES ('ff8080813d2e73ca013d2fe199ef0003', '2013-03-03 18:52:26', '2013-03-03 18:52:26', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: eeeeeeee', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('ff8080813d2e73ca013d2fe1be4d0004', '2013-03-03 18:52:36', '2013-03-03 18:52:36', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: qrtwqerewt', '127.0.0.1', '编辑文章', 'admin');
INSERT INTO `xx_log` VALUES ('ff8080813d2e73ca013d2fe1e1ca0005', '2013-03-03 18:52:45', '2013-03-03 18:52:45', 'net.xxs.action.admin.ArticleAction', 'update', '编辑文章: 名臣福利新系统上线优惠让利', '127.0.0.1', '编辑文章', 'admin');

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
  `withdraw_pwd` varchar(255) DEFAULT NULL,
  `member_business_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_member_member_rank` (`member_rank_id`),
  KEY `fk_member_member_business` (`member_business_id`),
  CONSTRAINT `fk_member_member_rank` FOREIGN KEY (`member_rank_id`) REFERENCES `xx_member_rank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member
-- ----------------------------
INSERT INTO `xx_member` VALUES ('297e62b93bd214af013bd21a73550000', '2012-12-25 20:47:27', '2013-01-22 13:15:40', '123', '2012-12-27 00:00:00', '0.00000', '123456@qq.com', '0', '', '', null, '2013-01-19 16:40:02', '0', '127.0.0.1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '234', '123123', '4297f44b13955235245b2497399d7a93', null, '123123', '112233', '127.0.0.1', null, null, '0', '112233', '123123', '402881833054c381013054d08bed0001', null, '4028bc743c6fd935013c6fda34cb0000');
INSERT INTO `xx_member` VALUES ('2c9484693ddfd7a0013de01df3610005', '2013-04-07 00:11:32', '2013-04-07 00:17:28', null, null, '0.00000', '4444@qq.com', null, '', '', null, '2013-04-07 00:17:28', '0', '127.0.0.1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'dbc4d84bfcfe2284ba11beffb853a8c4', null, null, '4444', '127.0.0.1', null, null, '0', '44441', null, '0731dcsoft2010031200000000000010', null, null);
INSERT INTO `xx_member` VALUES ('4028bc743d99e919013d99f14b460000', '2013-03-24 09:09:20', '2013-03-24 09:09:20', null, null, '0.00000', '123123@qq.com', null, '', '', null, '2013-03-24 09:09:20', '0', '127.0.0.1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'f5bbc8de146c67b44babbf4e6584cc0', null, null, '123123', '127.0.0.1', null, null, '0', '123123123', null, '0731dcsoft2010031200000000000010', null, null);
INSERT INTO `xx_member` VALUES ('8a8f82cc3d5936a7013d599155fc0000', '2013-03-11 21:08:49', '2013-03-11 23:16:43', 'qqq', null, '300.00000', '4444@qq.com', null, '', '', null, '2013-03-11 21:08:49', '0', '127.0.0.1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'dbc4d84bfcfe2284ba11beffb853a8c4', null, null, '123123', '127.0.0.1', null, null, '0', '4444', null, '0731dcsoft2010031200000000000010', null, null);
INSERT INTO `xx_member` VALUES ('8a8f82cc3d5936a7013d59c871d20001', '2013-03-11 22:09:01', '2013-03-31 00:42:14', '123', '2013-03-25 00:00:00', '0.00000', '11@qq.cp', '0', '', '', null, '2013-03-31 00:42:14', '0', '127.0.0.1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '111', '123', 'b59c67bf196a4758191e42f76670ceba', null, '123', '123123', '127.0.0.1', '888', '888', '0', '1111', '123', '0731dcsoft2010031200000000000010', '81dc9bdb52d04dc2036dbd8313ed055', null);
INSERT INTO `xx_member` VALUES ('8a9182fc3ba86bc8013ba9782de60001', '2012-12-17 23:25:23', '2013-04-07 00:14:47', '河南郑州', '2012-12-20 00:00:00', '354.00000', '123@qq.com', '0', '', '', '2013-03-10 16:02:04', '2013-04-07 00:14:47', '5', '127.0.0.1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '123', '123', '4297f44b13955235245b2497399d7a93', '1363001476462_1c82ee98c80043f88fafd9772bccb9c941d19fdef54350167a12424da9b1b', '123', '112233', '127.0.0.1', '333', '333', '0', '123123', '213', '402881833054c381013054d08bed0001', null, '4028bc743c6fd935013c702324ab0001');
INSERT INTO `xx_member` VALUES ('8ae481b53d886107013d88673d590001', '2013-03-20 23:25:00', '2013-03-20 23:25:41', '2222', null, '0.00000', 'tttt@qq.com', null, '', '', null, '2013-03-20 23:25:00', '0', '127.0.0.1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '123', '123', '32bfe6fcff51e53bd74e7ba1d622b2', null, null, '123123', '127.0.0.1', null, null, '0', 'tttt', null, '0731dcsoft2010031200000000000010', null, null);

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
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000005', '2011-01-01 00:00:00', '2013-01-20 15:43:57', '0', '', '', '地址', null, '4', '3', '3');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000006', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '邮编', '', '5', '4', '4');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000007', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '电话', '', '6', '5', '5');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000008', '2011-01-01 00:00:00', '2011-01-01 00:00:00', '0', '', '', '手机', '', '7', '6', '6');
INSERT INTO `xx_member_attribute` VALUES ('0731dcsoft2010031200000000000009', '2011-01-01 00:00:00', '2013-01-10 16:36:05', '0', '', '', '推荐人', null, '8', '7', '7');

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
INSERT INTO `xx_member_bank` VALUES ('4028bc743c604c36013c60644d960003', '2013-01-22 11:54:11', '2013-03-19 22:35:53', '666', '666', '666', '666', '', null, '666', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_member_bank` VALUES ('8a8f82de3d5e89c6013d5efe12740026', '2013-03-12 22:25:42', '2013-03-25 23:11:33', '北京市', '财付通', '财付通', '12341234', '', null, '12311234', '8a8f82cc3d5936a7013d59c871d20001');
INSERT INTO `xx_member_bank` VALUES ('8a9181383c571fbe013c5737cd510002', '2013-01-20 17:09:00', '2013-03-25 23:10:53', '23234', '23423', '1341234', '26273672366@qq.com', '', null, '张三', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_member_bank` VALUES ('eeee', '2013-01-08 14:25:15', '2013-03-25 23:10:53', '郑州', '中信银行北环路', '中信银行', '1876276253753563', '', null, '123123', '8a9182fc3ba86bc8013ba9782de60001');

-- ----------------------------
-- Table structure for `xx_member_discount`
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_discount`;
CREATE TABLE `xx_member_discount` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `brand_id` varchar(32) DEFAULT NULL,
  `member_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_member_discount_member` (`member_id`),
  KEY `fk_member_discount_brand` (`brand_id`),
  CONSTRAINT `fk_member_discount_brand` FOREIGN KEY (`brand_id`) REFERENCES `xx_brand` (`id`),
  CONSTRAINT `fk_member_discount_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_discount
-- ----------------------------
INSERT INTO `xx_member_discount` VALUES ('ff8080813dc150a1013dc154e6800000', '2013-04-01 00:43:19', '2013-04-01 00:51:30', '0.031', '8ae4839c3a887878013a88ae4be5000e', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_member_discount` VALUES ('ff8080813dc150a1013dc158d2a60001', '2013-04-01 00:47:36', '2013-04-01 00:49:34', '0.02', '8ae4839c3a887878013a88ae4be5000e', '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_member_discount` VALUES ('ff8080813dc150a1013dc15cb0e40002', '2013-04-01 00:51:50', '2013-04-01 00:51:50', '0.03', '8ae4839c3a887878013a88ada7f6000a', '8a9182fc3ba86bc8013ba9782de60001');

-- ----------------------------
-- Table structure for `xx_member_log`
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_log`;
CREATE TABLE `xx_member_log` (
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
-- Records of xx_member_log
-- ----------------------------
INSERT INTO `xx_member_log` VALUES ('2c9484693ddf6233013ddfd4f9be0000', '2013-04-06 22:51:50', '2013-04-06 22:51:50', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d0a09e8013d0a0d39680000', '2013-02-24 10:34:31', '2013-02-24 10:34:31', 'net.xxs.action.card.MemberAction', 'login', '会员登录ID: 8a9182fc3ba86bc8013ba9782de60001', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d0a09e8013d0a12f4b10001', '2013-02-24 10:40:47', '2013-02-24 10:40:47', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d0a09e8013d0a13ace50002', '2013-02-24 10:41:34', '2013-02-24 10:41:34', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d0a17b2013d0a1b8f350000', '2013-02-24 10:50:11', '2013-02-24 10:50:11', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d0a17b2013d0a1e8f840001', '2013-02-24 10:53:27', '2013-02-24 10:53:27', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d0a17b2013d0a23853b0002', '2013-02-24 10:58:52', '2013-02-24 10:58:52', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d0a17b2013d0a3893ac0003', '2013-02-24 11:21:52', '2013-02-24 11:21:52', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d0b3351013d0b34dc5a0000', '2013-02-24 15:57:26', '2013-02-24 15:57:26', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d0b3351013d0b3ed8330001', '2013-02-24 16:08:20', '2013-02-24 16:08:20', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d0b5317013d0b557d510000', '2013-02-24 16:33:04', '2013-02-24 16:33:04', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d0b813d013d0b8230110000', '2013-02-24 17:21:54', '2013-02-24 17:21:54', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d1ef61c013d1f4bfe610000', '2013-02-28 13:35:06', '2013-02-28 13:35:06', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d1ef61c013d1f75af3b0001', '2013-02-28 14:20:39', '2013-02-28 14:20:39', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d20238c013d20249af40000', '2013-02-28 17:31:42', '2013-02-28 17:31:42', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d235d03013d238f53f90000', '2013-03-01 09:27:08', '2013-03-01 09:27:08', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d235d03013d23b63a870001', '2013-03-01 10:09:37', '2013-03-01 10:09:37', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d235d03013d23b6a94f0002', '2013-03-01 10:10:06', '2013-03-01 10:10:06', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d235d03013d24157e780004', '2013-03-01 11:53:41', '2013-03-01 11:53:41', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d235d03013d24c348460005', '2013-03-01 15:03:30', '2013-03-01 15:03:30', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d235d03013d24e0db810006', '2013-03-01 15:35:48', '2013-03-01 15:35:48', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d235d03013d24e6a1f50007', '2013-03-01 15:42:07', '2013-03-01 15:42:07', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d235d03013d2504b9540008', '2013-03-01 16:14:59', '2013-03-01 16:14:59', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d3856b8013d3874c3d20003', '2013-03-05 10:50:09', '2013-03-05 10:50:09', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d394afd013d39651dca0000', '2013-03-05 15:12:40', '2013-03-05 15:12:40', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d3dbdf7013d3dc4ea8d0000', '2013-03-06 11:35:48', '2013-03-06 11:35:48', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d3e84b4013d3e8584370000', '2013-03-06 15:06:10', '2013-03-06 15:06:10', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d42b0e6013d42cf8f660000', '2013-03-07 11:05:31', '2013-03-07 11:05:31', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d43789d013d438e016d0000', '2013-03-07 14:33:32', '2013-03-07 14:33:32', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d5718d0013d57e7948c0002', '2013-03-11 13:23:47', '2013-03-11 13:23:47', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d99e919013d9a0ba4e10001', '2013-03-24 09:38:07', '2013-03-24 09:38:07', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d9a4d37013d9a4d7d440000', '2013-03-24 10:50:02', '2013-03-24 10:50:02', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d9a7f0a013d9a81acf20000', '2013-03-24 11:47:02', '2013-03-24 11:47:02', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d9a7f0a013d9adc977b0009', '2013-03-24 13:26:20', '2013-03-24 13:26:20', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743d9a7f0a013d9b176fd00012', '2013-03-24 14:30:37', '2013-03-24 14:30:37', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743da5b0f3013da5b15f930000', '2013-03-26 15:54:57', '2013-03-26 15:54:57', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743da5b0f3013da5fb31e30019', '2013-03-26 17:15:35', '2013-03-26 17:15:35', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743da625e1013da62654cc0000', '2013-03-26 18:02:42', '2013-03-26 18:02:42', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743daadc60013daadca8ae0000', '2013-03-27 16:00:20', '2013-03-27 16:00:20', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743daaddc5013daade3a1c0000', '2013-03-27 16:02:03', '2013-03-27 16:02:03', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743daed1f3013daed6b5c60000', '2013-03-28 10:32:19', '2013-03-28 10:32:19', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('4028bc743dc33acb013dc342227c0000', '2013-04-01 09:42:04', '2013-04-01 09:42:04', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a8f80133d536876013d5368cb9a0000', '2013-03-10 16:26:49', '2013-03-10 16:26:49', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a8f80983dbb02ce013dbc28ebc1000e', '2013-03-31 00:37:11', '2013-03-31 00:37:11', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a8f80983dbb02ce013dbc2c62c8000f', '2013-03-31 00:40:58', '2013-03-31 00:40:58', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a8f80983dbb02ce013dbc2d8cc00010', '2013-03-31 00:42:14', '2013-03-31 00:42:14', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 1111', '127.0.0.1', '会员登录', '1111');
INSERT INTO `xx_member_log` VALUES ('8a8f82cc3d5936a7013d59cc03f50002', '2013-03-11 22:12:55', '2013-03-11 22:12:55', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a8f82cc3d5936a7013d59dd2a010005', '2013-03-11 22:31:39', '2013-03-11 22:31:39', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a8f82cc3d59ef2c013d5a0d5d6e0006', '2013-03-11 23:24:18', '2013-03-11 23:24:18', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a8f82cc3d59ef2c013d5a0f49f30007', '2013-03-11 23:26:24', '2013-03-11 23:26:24', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a8f82de3d5e89c6013d5e99ab590000', '2013-03-12 20:36:02', '2013-03-12 20:36:02', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a8f82de3d5e89c6013d5ef20e780025', '2013-03-12 22:12:34', '2013-03-12 22:12:34', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a8f82de3d5f0026013d5f074c180000', '2013-03-12 22:35:46', '2013-03-12 22:35:46', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 1111', '127.0.0.1', '会员登录', '1111');
INSERT INTO `xx_member_log` VALUES ('8a8f82de3d5f0ce4013d5f123d330000', '2013-03-12 22:47:43', '2013-03-12 22:47:43', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 1111', '127.0.0.1', '会员登录', '1111');
INSERT INTO `xx_member_log` VALUES ('8a9180203d0cb184013d0cbe8e480000', '2013-02-24 23:07:27', '2013-02-24 23:07:27', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9180203d1ba1a4013d1bea5a6c0000', '2013-02-27 21:49:36', '2013-02-27 21:49:36', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9180203d1bffed013d1c0bf4410000', '2013-02-27 22:26:18', '2013-02-27 22:26:18', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9180943d49f08e013d49f7d0cd0000', '2013-03-08 20:26:50', '2013-03-08 20:26:50', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9180943d49fba2013d49fd06e00000', '2013-03-08 20:32:31', '2013-03-08 20:32:31', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9181243d5254ea013d525b7dd60000', '2013-03-10 11:32:40', '2013-03-10 11:32:40', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9181243d5254ea013d526a86f20001', '2013-03-10 11:49:05', '2013-03-10 11:49:05', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9181243d5254ea013d527278500002', '2013-03-10 11:57:46', '2013-03-10 11:57:46', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9181243d5254ea013d52747d110003', '2013-03-10 11:59:58', '2013-03-10 11:59:58', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9181243d5254ea013d528a41820004', '2013-03-10 12:23:45', '2013-03-10 12:23:45', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9181243d5254ea013d530345860005', '2013-03-10 14:35:56', '2013-03-10 14:35:56', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9181243d5254ea013d535f897d000a', '2013-03-10 16:16:42', '2013-03-10 16:16:42', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9182d53da1d400013da1e7de400000', '2013-03-25 22:16:00', '2013-03-25 22:16:00', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9182d53da1ef55013da1efb5070000', '2013-03-25 22:24:34', '2013-03-25 22:24:34', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9182d53da1ef55013da1f0081e0001', '2013-03-25 22:24:55', '2013-03-25 22:24:55', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9182d53da1f91f013da1fb76d20000', '2013-03-25 22:37:24', '2013-03-25 22:37:24', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9182d53da1f91f013da1fe078e0001', '2013-03-25 22:40:12', '2013-03-25 22:40:12', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9182d53da1f91f013da21a08820002', '2013-03-25 23:10:47', '2013-03-25 23:10:47', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9182d53da25181013da2521ece0000', '2013-03-26 00:12:03', '2013-03-26 00:12:03', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a9182d53da25923013da259837e0000', '2013-03-26 00:20:08', '2013-03-26 00:20:08', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a91838c3db9dcfc013db9e9fca20000', '2013-03-30 14:09:12', '2013-03-30 14:09:12', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a91838c3db9dcfc013dba0ce43f0001', '2013-03-30 14:47:19', '2013-03-30 14:47:19', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a91838c3db9dcfc013dba0de22a0002', '2013-03-30 14:48:24', '2013-03-30 14:48:24', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a91838c3dba19fd013dba73fa0f0000', '2013-03-30 16:39:55', '2013-03-30 16:39:55', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8a91838c3dba19fd013dba745e3f0001', '2013-03-30 16:40:21', '2013-03-30 16:40:21', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 1111', '127.0.0.1', '会员登录', '1111');
INSERT INTO `xx_member_log` VALUES ('8ae481b53d886107013d8861f5260000', '2013-03-20 23:19:13', '2013-03-20 23:19:13', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('8ae481b53d886a58013d886b47060000', '2013-03-20 23:29:24', '2013-03-20 23:29:24', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('ff8080813d25e4ac013d25e5bb3b0000', '2013-03-01 20:20:45', '2013-03-01 20:20:45', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('ff8080813d25e4ac013d25e84d010001', '2013-03-01 20:23:33', '2013-03-01 20:23:33', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('ff8080813d2e73ca013d2e75e6f20000', '2013-03-03 12:15:11', '2013-03-03 12:15:11', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('ff8080813d2e73ca013d2fd39b100001', '2013-03-03 18:37:09', '2013-03-03 18:37:09', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('ff8080813d2e73ca013d2fdf6aff0002', '2013-03-03 18:50:03', '2013-03-03 18:50:03', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('ff8080813d2fe2c9013d300c69970000', '2013-03-03 19:39:12', '2013-03-03 19:39:12', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('ff8080813d830ac2013d830bd7ea0000', '2013-03-19 22:27:04', '2013-03-19 22:27:04', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('ff8080813d830ac2013d830c93ab0001', '2013-03-19 22:27:52', '2013-03-19 22:27:52', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('ff8080813d830ac2013d830d035b0002', '2013-03-19 22:28:20', '2013-03-19 22:28:20', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('ff8080813d8323f4013d83245d2a0000', '2013-03-19 22:53:51', '2013-03-19 22:53:51', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('ff8080813d8323f4013d8330f6a30001', '2013-03-19 23:07:36', '2013-03-19 23:07:36', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('ff8080813d8323f4013d835515970007', '2013-03-19 23:47:04', '2013-03-19 23:47:04', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('ff8080813d8323f4013d835539a10008', '2013-03-19 23:47:13', '2013-03-19 23:47:13', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');
INSERT INTO `xx_member_log` VALUES ('ff8080813d8323f4013d83a648d80015', '2013-03-20 01:15:45', '2013-03-20 01:15:45', 'net.xxs.action.card.MemberAction', 'login', '会员登录: 123123', '127.0.0.1', '会员登录', '123123');

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
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `score` (`score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_rank
-- ----------------------------
INSERT INTO `xx_member_rank` VALUES ('0731dcsoft2010031200000000000010', '2012-12-19 10:52:48', '2012-12-20 16:49:57', '0.01', '', '0.96', '普通会员', '0');
INSERT INTO `xx_member_rank` VALUES ('402881833054c381013054d08bed0001', '2011-01-01 00:00:00', '2012-11-05 09:12:49', '0.01', '', '0.97', '一级会员', '2000');
INSERT INTO `xx_member_rank` VALUES ('402881833054c381013054d0bf800002', '2011-01-01 00:00:00', '2012-12-20 16:48:23', '0.01', '', '0.98', '二级会员', '5000');
INSERT INTO `xx_member_rank` VALUES ('402881833054c381013054d103ec0003', '2011-01-01 00:00:00', '2012-12-20 16:49:57', '0.01', '', '0.99', '三级会员', '10000');

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
INSERT INTO `xx_message` VALUES ('4028bc743c1da22d013c1da6a1c30000', '2013-01-09 12:52:05', '2013-01-09 12:52:05', '123123', '0', '', '', '112222', null, '8a9182fc3ba86bc8013ba9782de60001');
INSERT INTO `xx_message` VALUES ('4028bc743c28120c013c281863540000', '2013-01-11 13:32:32', '2013-01-20 17:00:30', '123123', '0', '', '', '112222', '8a9182fc3ba86bc8013ba9782de60001', null);
INSERT INTO `xx_message` VALUES ('8a9181383c571fbe013c573022f30001', '2013-01-20 17:00:38', '2013-01-20 17:00:38', '123123', '0', '', '', '112222', null, '8a9182fc3ba86bc8013ba9782de60001');

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
INSERT INTO `xx_navigation` VALUES ('2c9484693ddfd7a0013ddfe456980002', '2013-04-06 23:08:36', '2013-04-10 22:45:10', '', '', '支持卡种', '1', '2', '${base}/html/201304/352e66ff26f64356a10a4e661105b254.html');
INSERT INTO `xx_navigation` VALUES ('4028bc743bac0d54013bacbb0f14000d', '2012-12-18 14:37:18', '2013-04-10 22:46:16', '', '', '首        页', '1', '1', '${base}/');
INSERT INTO `xx_navigation` VALUES ('4028bc743bac0d54013bacbb688e000e', '2012-12-18 14:37:41', '2013-03-10 16:47:45', '', '', '名臣公益', '0', '1', '${base}/html/201301/dba7e39e0d674a7dba8e2af25ab10ff1.html');
INSERT INTO `xx_navigation` VALUES ('4028bc743c286bdc013c28931dc9000c', '2013-01-11 15:46:35', '2013-03-05 10:27:17', '', '', '公司资质', '1', '3', '${base}/html/201301/597c10bdbaf04f75a6c676128226ddf9.html');
INSERT INTO `xx_navigation` VALUES ('4028bc743c286bdc013c28982ed8000d', '2013-01-11 15:52:07', '2013-03-05 10:40:02', '', '', '商务合作', '1', '4', '${base}/html/201301/dba7e39e0d674a7dba8e2af25ab10ff1.html');
INSERT INTO `xx_navigation` VALUES ('4028bc743c286bdc013c2898de04000f', '2013-01-11 15:52:52', '2013-03-10 16:47:09', '', '', '客服QQ', '0', '2', '${base}/html/201301/8c73cc996c5240bc9e97cc40e4850266.html');
INSERT INTO `xx_navigation` VALUES ('4028bc743c286bdc013c28993e930010', '2013-01-11 15:53:17', '2013-04-10 22:45:19', '', '', '联系我们', '1', '5', '${base}/html/201301/8c73cc996c5240bc9e97cc40e4850266.html');
INSERT INTO `xx_navigation` VALUES ('8a9181263c31adc7013c31c753280000', '2013-01-13 10:40:12', '2013-04-06 23:09:13', '', '', '成功案例', '1', '7', '${base}/card/deposit_success.htm');
INSERT INTO `xx_navigation` VALUES ('ff8080813d82df03013d82fb7e890000', '2013-03-19 22:09:12', '2013-03-19 22:09:12', '', '', '关于名臣福利', '2', '1', '${base}/html/201301/8c73cc996c5240bc9e97cc40e4850266.html');
INSERT INTO `xx_navigation` VALUES ('ff8080813d82df03013d82fc20920001', '2013-03-19 22:09:54', '2013-03-19 22:09:54', '', '', '商务合作', '2', '2', '${base}/html/201301/dba7e39e0d674a7dba8e2af25ab10ff1.html');
INSERT INTO `xx_navigation` VALUES ('ff8080813d82df03013d82fc8b480002', '2013-03-19 22:10:21', '2013-03-19 22:10:21', '', '', '帮助中心', '2', '3', '${base}/html/201301/ad975ce72b7c483b94245d4e21d0ecb4.html');
INSERT INTO `xx_navigation` VALUES ('ff8080813d82df03013d82fd08f20003', '2013-03-19 22:10:53', '2013-03-19 22:10:53', '', '', '联系我们', '2', '4', '${base}/html/201301/8c73cc996c5240bc9e97cc40e4850266.html');
INSERT INTO `xx_navigation` VALUES ('ff8080813d82df03013d82fd8aef0004', '2013-03-19 22:11:27', '2013-03-19 22:11:27', '', '', '服务协议', '2', '5', '${base}/html/201301/03754c8fbedf44e3bbd277e0b3dfc2d1.html');

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
  `member_id` varchar(32) DEFAULT NULL,
  `payment_config_id` varchar(32) DEFAULT NULL,
  `amount` decimal(15,5) NOT NULL,
  `card_num` varchar(255) NOT NULL,
  `card_pwd` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(15,5) NOT NULL,
  `product_sn` varchar(255) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `ret_code` varchar(100) DEFAULT NULL,
  `ret_msg` varchar(100) DEFAULT NULL,
  `card_code` varchar(255) NOT NULL,
  `card_discount` decimal(19,2) NOT NULL,
  `pay_sn` varchar(255) DEFAULT NULL,
  `deposit_id` varchar(32) DEFAULT NULL,
  `bank_account` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `member_discount` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `fk_order_member` (`member_id`),
  KEY `fk_order_payment_config` (`payment_config_id`),
  KEY `fk_order_product` (`product_id`),
  KEY `fk_order_deposit` (`deposit_id`),
  CONSTRAINT `fk_order_deposit` FOREIGN KEY (`deposit_id`) REFERENCES `xx_deposit` (`id`),
  CONSTRAINT `fk_order_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `fk_order_payment_config` FOREIGN KEY (`payment_config_id`) REFERENCES `xx_payment_config` (`id`),
  CONSTRAINT `fk_order_product` FOREIGN KEY (`product_id`) REFERENCES `xx_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_order
-- ----------------------------
INSERT INTO `xx_order` VALUES ('4028bc743c663f39013c66421d740001', '2013-01-23 15:14:34', '2013-01-25 09:01:14', '8ae4839c3a887878013a88aca0800003', null, 'DD100012', '2', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '2345234', '2435234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743c6f3698013c6f386d340000', '2013-01-25 09:00:34', '2013-01-25 09:00:35', '8ae4839c3a887878013a88aca0800003', null, 'DD100013', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '444', '444', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743c6f3698013c6f399f6b0005', '2013-01-25 09:01:52', '2013-01-25 09:01:53', '8ae4839c3a887878013a88aca0800003', null, 'DD100014', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '66', '666', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '-1', '', 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743c6f3698013c6f4fe13b0008', '2013-01-25 09:26:11', '2013-01-25 09:26:11', '8ae4839c3a887878013a88ad18e10006', null, 'DD100015', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '100.00000', '701201004210014', '7006070872040597487', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '8ae4834e3c4308a2013c435b98ef005c', '2006', '订单号重复', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743c6f3698013c6f518b03000b', '2013-01-25 09:28:00', '2013-01-25 09:28:00', '8ae4839c3a887878013a88ad18e10006', null, 'DD100016', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '100.00000', '701201004210014', '7006070872040597487', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '8ae4834e3c4308a2013c435b98ef005c', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743c6f612c013c6f6201cc0000', '2013-01-25 09:45:59', '2013-01-25 09:45:59', '8ae4839c3a887878013a88aca0800003', null, 'DD100017', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '5678', '56785678', '移动充值卡 [20元]', '20.00000', 'SN_E1B7A69B1095', '8ae4834e3c4308a2013c435d42a60060', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d394afd013d39b3cb450001', '2013-03-05 16:38:37', '2013-03-05 16:38:37', '8ae4839c3a887878013a88aca0800003', null, 'DD100018', '1', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '12341234', '21341234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d394afd013d39b762370003', '2013-03-05 16:42:32', '2013-03-05 16:42:32', '8ae4839c3a887878013a88aca0800003', null, 'DD100019', '1', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1341234', '21341234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d394afd013d39b7643a0005', '2013-03-05 16:42:32', '2013-03-05 16:42:32', '8ae4839c3a887878013a88aca0800003', null, 'DD100020', '1', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1341234', '21341234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d394afd013d39d8b8930007', '2013-03-05 17:18:57', '2013-03-07 14:16:45', '8ae4839c3a887878013a88aca0800003', null, 'DD100021', '1', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1234', '1234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d394afd013d39d8ba390009', '2013-03-05 17:18:57', '2013-03-07 14:06:59', '8ae4839c3a887878013a88aca0800003', null, 'DD100022', '1', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1234', '1234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d3dbdf7013d3dc52a450002', '2013-03-06 11:36:04', '2013-03-06 11:36:04', '8ae4839c3a887878013a88aca0800003', null, 'DD100023', '1', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '134', '13241', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d3dbdf7013d3dcc46a50004', '2013-03-06 11:43:50', '2013-03-07 11:18:04', '8ae4839c3a887878013a88aca0800003', null, 'DD100024', '1', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '1232222', '33333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2007', '数据非法', '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d3dbdf7013d3dcc487a0006', '2013-03-06 11:43:50', '2013-03-07 11:59:57', '8ae4839c3a887878013a88aca0800003', null, 'DD100025', '1', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '1232222', '33333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2007', '数据非法', '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d4398ba4c0002', '2013-03-07 14:45:15', '2013-03-07 14:45:24', '8ae4839c3a887878013a88aca0800003', null, 'DD100026', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '111111111', '22222222222', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d439942c60004', '2013-03-07 14:45:50', '2013-03-07 14:45:50', '8ae4839c3a887878013a88aca0800003', null, 'DD100027', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '13241234', '13241234123', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d439944d90006', '2013-03-07 14:45:50', '2013-03-07 14:45:51', '8ae4839c3a887878013a88aca0800003', null, 'DD100028', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '111111111', '22222222222', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43a038350008', '2013-03-07 14:53:26', '2013-03-07 14:53:26', '8ae4839c3a887878013a88aca0800003', null, 'DD100029', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '22222222', '333333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43a041e9000a', '2013-03-07 14:53:28', '2013-03-07 14:53:29', '8ae4839c3a887878013a88aca0800003', null, 'DD100030', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '5555555555555', '6666666', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43a15cee000c', '2013-03-07 14:54:41', '2013-03-07 14:54:41', '8ae4839c3a887878013a88aca0800003', null, 'DD100031', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '22222222', '333333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43a15f11000e', '2013-03-07 14:54:41', '2013-03-07 14:54:42', '8ae4839c3a887878013a88aca0800003', null, 'DD100032', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '5555555555555', '6666666', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43a2717b0010', '2013-03-07 14:55:52', '2013-03-07 14:55:52', '8ae4839c3a887878013a88aca0800003', null, 'DD100033', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '22222222', '333333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43a273ae0012', '2013-03-07 14:55:52', '2013-03-07 14:55:52', '8ae4839c3a887878013a88aca0800003', null, 'DD100034', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '5555555555555', '6666666', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43a40e810014', '2013-03-07 14:57:37', '2013-03-07 14:57:38', '8ae4839c3a887878013a88aca0800003', null, 'DD100035', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '566666666', '33333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43a412b80016', '2013-03-07 14:57:39', '2013-03-07 14:57:39', '8ae4839c3a887878013a88aca0800003', null, 'DD100036', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '4444444444', '555555555', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43a64b910018', '2013-03-07 15:00:04', '2013-03-07 15:00:04', '8ae4839c3a887878013a88aca0800003', null, 'DD100037', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '566666666', '33333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2007', '数据非法', '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43a64d65001a', '2013-03-07 15:00:05', '2013-03-07 15:00:05', '8ae4839c3a887878013a88aca0800003', null, 'DD100038', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '4444444444', '555555555', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2007', '数据非法', '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43a6666c001c', '2013-03-07 15:00:11', '2013-03-07 15:00:12', '8ae4839c3a887878013a88aca0800003', null, 'DD100039', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '566666666', '33333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '-1', '', 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43a667b4001e', '2013-03-07 15:00:11', '2013-03-07 15:00:12', '8ae4839c3a887878013a88aca0800003', null, 'DD100040', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '4444444444', '555555555', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '-1', '', 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b0b3b00020', '2013-03-07 15:11:26', '2013-03-07 15:11:26', '8ae4839c3a887878013a88aca0800003', null, 'DD100041', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1313222222222222', '333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b0b5f20022', '2013-03-07 15:11:27', '2013-03-07 15:11:27', '8ae4839c3a887878013a88aca0800003', null, 'DD100042', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1313222222222222', '333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b0b8a20024', '2013-03-07 15:11:27', '2013-03-07 15:11:28', '8ae4839c3a887878013a88aca0800003', null, 'DD100043', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1313222222222222', '333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b0b9bb0026', '2013-03-07 15:11:28', '2013-03-07 15:11:28', '8ae4839c3a887878013a88aca0800003', null, 'DD100044', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1313222222222222', '333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b0ba770028', '2013-03-07 15:11:28', '2013-03-07 15:11:28', '8ae4839c3a887878013a88aca0800003', null, 'DD100045', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1313222222222222', '333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b0bb42002a', '2013-03-07 15:11:28', '2013-03-07 15:11:28', '8ae4839c3a887878013a88aca0800003', null, 'DD100046', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1313222222222222', '333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b0bc1c002c', '2013-03-07 15:11:28', '2013-03-07 15:11:29', '8ae4839c3a887878013a88aca0800003', null, 'DD100047', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1313222222222222', '333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b0bcd8002e', '2013-03-07 15:11:28', '2013-03-07 15:11:29', '8ae4839c3a887878013a88aca0800003', null, 'DD100048', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1313222222222222', '333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b0c2d30030', '2013-03-07 15:11:30', '2013-03-07 15:11:30', '8ae4839c3a887878013a88aca0800003', null, 'DD100049', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1313222222222222', '333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b0c3210032', '2013-03-07 15:11:30', '2013-03-07 15:11:30', '8ae4839c3a887878013a88aca0800003', null, 'DD100050', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1313222222222222', '333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b0c3500034', '2013-03-07 15:11:30', '2013-03-07 15:11:30', '8ae4839c3a887878013a88aca0800003', null, 'DD100051', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1313222222222222', '333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b0c3ae0036', '2013-03-07 15:11:30', '2013-03-07 15:11:30', '8ae4839c3a887878013a88aca0800003', null, 'DD100052', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1313222222222222', '333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b0c3ae0037', '2013-03-07 15:11:30', '2013-03-07 15:11:30', '8ae4839c3a887878013a88aca0800003', null, 'DD100053', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1313222222222222', '333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b0c42b003a', '2013-03-07 15:11:30', '2013-03-07 15:11:30', '8ae4839c3a887878013a88aca0800003', null, 'DD100054', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1313222222222222', '333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b0c43b003c', '2013-03-07 15:11:30', '2013-03-07 15:11:31', '8ae4839c3a887878013a88aca0800003', null, 'DD100055', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1313222222222222', '333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b0c44a003d', '2013-03-07 15:11:30', '2013-03-07 15:11:31', '8ae4839c3a887878013a88aca0800003', null, 'DD100056', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1313222222222222', '333333333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3ef340040', '2013-03-07 15:14:58', '2013-03-07 15:14:58', '8ae4839c3a887878013a88aca0800003', null, 'DD100057', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f54e0042', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100058', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f57d0044', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100059', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f59d0045', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100060', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f5bc0048', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100061', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f5bc0049', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100062', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f5fa004c', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100063', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f648004e', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100064', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f6970050', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100065', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f6b60051', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100066', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f6d50053', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100067', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f7040056', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100068', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f7140057', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100069', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f742005a', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100070', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f7a0005c', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100071', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f7ee005e', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100072', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f81d0060', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100073', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f82d0061', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100074', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f85c0063', '2013-03-07 15:15:00', '2013-03-07 15:15:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100075', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b3f89a0066', '2013-03-07 15:15:00', '2013-03-07 15:15:01', '8ae4839c3a887878013a88aca0800003', null, 'DD100076', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b535be0068', '2013-03-07 15:16:22', '2013-03-07 15:16:22', '8ae4839c3a887878013a88aca0800003', null, 'DD100077', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b53afd006a', '2013-03-07 15:16:23', '2013-03-07 15:16:23', '8ae4839c3a887878013a88aca0800003', null, 'DD100078', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b53b4c006c', '2013-03-07 15:16:23', '2013-03-07 15:16:23', '8ae4839c3a887878013a88aca0800003', null, 'DD100079', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b53b5b006d', '2013-03-07 15:16:23', '2013-03-07 15:16:23', '8ae4839c3a887878013a88aca0800003', null, 'DD100080', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b53b8a0070', '2013-03-07 15:16:23', '2013-03-07 15:16:23', '8ae4839c3a887878013a88aca0800003', null, 'DD100081', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b53b9a0071', '2013-03-07 15:16:23', '2013-03-07 15:16:23', '8ae4839c3a887878013a88aca0800003', null, 'DD100082', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b53b9a0072', '2013-03-07 15:16:23', '2013-03-07 15:16:23', '8ae4839c3a887878013a88aca0800003', null, 'DD100083', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b53c650076', '2013-03-07 15:16:23', '2013-03-07 15:16:24', '8ae4839c3a887878013a88aca0800003', null, 'DD100084', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b53d300078', '2013-03-07 15:16:23', '2013-03-07 15:16:24', '8ae4839c3a887878013a88aca0800003', null, 'DD100085', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b53d400079', '2013-03-07 15:16:24', '2013-03-07 15:16:24', '8ae4839c3a887878013a88aca0800003', null, 'DD100086', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b53d4f007a', '2013-03-07 15:16:24', '2013-03-07 15:16:24', '8ae4839c3a887878013a88aca0800003', null, 'DD100087', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b53dcc007e', '2013-03-07 15:16:24', '2013-03-07 15:16:24', '8ae4839c3a887878013a88aca0800003', null, 'DD100088', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b53dcc007f', '2013-03-07 15:16:24', '2013-03-07 15:16:24', '8ae4839c3a887878013a88aca0800003', null, 'DD100089', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b53e1a0082', '2013-03-07 15:16:24', '2013-03-07 15:16:24', '8ae4839c3a887878013a88aca0800003', null, 'DD100090', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b53eb70084', '2013-03-07 15:16:24', '2013-03-07 15:16:24', '8ae4839c3a887878013a88aca0800003', null, 'DD100091', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11925110103023132', '111387516814561221', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2020', '提交次数过多', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b6f9190086', '2013-03-07 15:18:17', '2013-03-07 15:18:17', '8ae4839c3a887878013a88aca0800003', null, 'DD100092', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b6fef50088', '2013-03-07 15:18:19', '2013-03-07 15:18:19', '8ae4839c3a887878013a88aca0800003', null, 'DD100093', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b6ff33008a', '2013-03-07 15:18:19', '2013-03-07 15:18:19', '8ae4839c3a887878013a88aca0800003', null, 'DD100094', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b6ff81008c', '2013-03-07 15:18:19', '2013-03-07 15:18:19', '8ae4839c3a887878013a88aca0800003', null, 'DD100095', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b6ffa0008e', '2013-03-07 15:18:19', '2013-03-07 15:18:19', '8ae4839c3a887878013a88aca0800003', null, 'DD100096', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b6ffb0008f', '2013-03-07 15:18:19', '2013-03-07 15:18:19', '8ae4839c3a887878013a88aca0800003', null, 'DD100097', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b6ffdf0091', '2013-03-07 15:18:19', '2013-03-07 15:18:19', '8ae4839c3a887878013a88aca0800003', null, 'DD100098', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b7001d0094', '2013-03-07 15:18:19', '2013-03-07 15:18:19', '8ae4839c3a887878013a88aca0800003', null, 'DD100099', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b7002d0095', '2013-03-07 15:18:19', '2013-03-07 15:18:19', '8ae4839c3a887878013a88aca0800003', null, 'DD100100', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b7006c0098', '2013-03-07 15:18:19', '2013-03-07 15:18:19', '8ae4839c3a887878013a88aca0800003', null, 'DD100101', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b7009a009a', '2013-03-07 15:18:19', '2013-03-07 15:18:19', '8ae4839c3a887878013a88aca0800003', null, 'DD100102', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b700ba009b', '2013-03-07 15:18:19', '2013-03-07 15:18:19', '8ae4839c3a887878013a88aca0800003', null, 'DD100103', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b700e9009d', '2013-03-07 15:18:19', '2013-03-07 15:18:19', '8ae4839c3a887878013a88aca0800003', null, 'DD100104', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b7013700a0', '2013-03-07 15:18:19', '2013-03-07 15:18:19', '8ae4839c3a887878013a88aca0800003', null, 'DD100105', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b7015600a2', '2013-03-07 15:18:19', '2013-03-07 15:18:19', '8ae4839c3a887878013a88aca0800003', null, 'DD100106', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b7018500a4', '2013-03-07 15:18:19', '2013-03-07 15:18:19', '8ae4839c3a887878013a88aca0800003', null, 'DD100107', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b701b400a6', '2013-03-07 15:18:19', '2013-03-07 15:18:20', '8ae4839c3a887878013a88aca0800003', null, 'DD100108', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b701f200a8', '2013-03-07 15:18:19', '2013-03-07 15:18:20', '8ae4839c3a887878013a88aca0800003', null, 'DD100109', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b7020200a9', '2013-03-07 15:18:19', '2013-03-07 15:18:20', '8ae4839c3a887878013a88aca0800003', null, 'DD100110', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d43789d013d43b7023100ac', '2013-03-07 15:18:19', '2013-03-07 15:18:20', '8ae4839c3a887878013a88aca0800003', null, 'DD100111', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111111111', '1111111111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d5718d0013d57e249910000', '2013-03-11 13:18:00', '2013-03-11 13:18:01', '8ae4839c3a887878013a88aca0800003', null, 'DD100126', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111', '1111', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d5718d0013d57f4e9730003', '2013-03-11 13:38:21', '2013-03-11 13:38:21', '8ae4839c3a887878013a88aca0800003', null, 'DD100127', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '123412341234', '12333212', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d5718d0013d57f4eb770005', '2013-03-11 13:38:21', '2013-03-11 13:38:21', '8ae4839c3a887878013a88aca0800003', null, 'DD100128', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1234123', '421432143', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d5718d0013d57f4f1ef0007', '2013-03-11 13:38:23', '2013-03-11 13:38:23', '8ae4839c3a887878013a88aca0800003', null, 'DD100129', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '12341234', '234234234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a51eef60002', '2013-03-24 10:54:53', '2013-03-24 10:54:54', '8ae4839c3a887878013a88aca0800003', null, 'DD100165', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '381201020475959', '3803544517341346129', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a5291be0004', '2013-03-24 10:55:35', '2013-03-24 10:55:35', '8ae4839c3a887878013a88ad18e10006', null, 'DD100166', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '381201020475959', '3803544517341346129', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '2005', '该卡密已经有被使用的记录', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a532b5e0006', '2013-03-24 10:56:14', '2013-03-24 10:56:14', '8ae4839c3a887878013a88aca0800003', null, 'DD100167', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '381201020475959', '3803544517341346129', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a5393eb0008', '2013-03-24 10:56:41', '2013-03-24 10:56:41', '8ae4839c3a887878013a88ad18e10006', null, 'DD100168', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '381201020475959', '3803544517341346129', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '2005', '该卡密已经有被使用的记录', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a53941a0009', '2013-03-24 10:56:41', '2013-03-24 10:56:41', '8ae4839c3a887878013a88ad18e10006', null, 'DD100169', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '381201020476185', '3809195879761068547', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '2005', '该卡密已经有被使用的记录', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a539439000b', '2013-03-24 10:56:41', '2013-03-24 10:56:41', '8ae4839c3a887878013a88ad18e10006', null, 'DD100170', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '381201020475682', '3801431748036123817', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '2005', '该卡密已经有被使用的记录', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a539449000d', '2013-03-24 10:56:41', '2013-03-24 10:56:41', '8ae4839c3a887878013a88ad18e10006', null, 'DD100171', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '981301576694795', '9801062963549790850', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '2005', '该卡密已经有被使用的记录', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a5446ff0010', '2013-03-24 10:57:27', '2013-03-24 10:57:28', '8ae4839c3a887878013a88ad18e10006', null, 'DD100172', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '20.00000', '381201020475959', '3803544517341346129', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a54472e0012', '2013-03-24 10:57:27', '2013-03-24 10:57:28', '8ae4839c3a887878013a88ad18e10006', null, 'DD100173', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '20.00000', '381201020476185', '3809195879761068547', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a54477c0014', '2013-03-24 10:57:27', '2013-03-24 10:57:28', '8ae4839c3a887878013a88ad18e10006', null, 'DD100174', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '20.00000', '381201020475682', '3801431748036123817', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a54479b0016', '2013-03-24 10:57:27', '2013-03-24 10:57:28', '8ae4839c3a887878013a88ad18e10006', null, 'DD100175', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '20.00000', '981301576694795', '9801062963549790850', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a5d66430018', '2013-03-24 11:07:25', '2013-03-24 11:07:25', '8ae4839c3a887878013a88ad18e10006', null, 'DD100176', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '100.00000', '381201020475959', '3803544517341346129', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '8ae4834e3c4308a2013c435b98ef005c', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a5d6672001a', '2013-03-24 11:07:25', '2013-03-24 11:07:25', '8ae4839c3a887878013a88ad18e10006', null, 'DD100177', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '100.00000', '381201020475682', '3801431748036123817', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '8ae4834e3c4308a2013c435b98ef005c', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a5d6691001b', '2013-03-24 11:07:25', '2013-03-24 11:07:25', '8ae4839c3a887878013a88ad18e10006', null, 'DD100178', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '100.00000', '981301576694795', '9801062963549790850', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '8ae4834e3c4308a2013c435b98ef005c', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a5d66b1001e', '2013-03-24 11:07:25', '2013-03-24 11:07:25', '8ae4839c3a887878013a88ad18e10006', null, 'DD100179', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '100.00000', '381201020476185', '3809195879761068547', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '8ae4834e3c4308a2013c435b98ef005c', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a5ebd770020', '2013-03-24 11:08:52', '2013-03-24 11:08:53', '8ae4839c3a887878013a88aca0800003', null, 'DD100180', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '134', '134', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '-1', '', 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a64d17e0022', '2013-03-24 11:15:31', '2013-03-24 11:15:31', '8ae4839c3a887878013a88aca0800003', null, 'DD100181', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '981301576694795', '9801062963549790850', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a65059e0024', '2013-03-24 11:15:44', '2013-03-24 11:15:44', '8ae4839c3a887878013a88aca0800003', null, 'DD100182', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '981301576694795', '9801062963549790850', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '-1', '', 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a6828b80026', '2013-03-24 11:19:10', '2013-03-24 11:19:10', '8ae4839c3a887878013a88ad18e10006', null, 'DD100183', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '20.00000', '134', '1324', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a6926af0028', '2013-03-24 11:20:15', '2013-03-24 11:20:15', '8ae4839c3a887878013a88ad18e10006', null, 'DD100184', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '20.00000', '12322', '22222', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a6c534f002a', '2013-03-24 11:23:43', '2013-03-24 11:23:43', '8ae4839c3a887878013a88ad18e10006', null, 'DD100185', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '20.00000', '555', '555', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a6d78b4002c', '2013-03-24 11:24:58', '2013-03-24 11:24:58', '8ae4839c3a887878013a88ad18e10006', null, 'DD100186', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '20.00000', '5534', '345', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a723692002e', '2013-03-24 11:30:09', '2013-03-24 11:30:09', '8ae4839c3a887878013a88aca0800003', null, 'DD100187', '1', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '444', '444', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a74141c0030', '2013-03-24 11:32:11', '2013-03-24 11:32:11', '8ae4839c3a887878013a88aca0800003', null, 'DD100188', '1', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '444', '444', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a7dac490032', '2013-03-24 11:42:40', '2013-03-24 11:42:40', '8ae4839c3a887878013a88aca0800003', null, 'DD100189', '1', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '444', '444', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a4d37013d9a7de4fd0034', '2013-03-24 11:42:54', '2013-03-24 11:42:54', '8ae4839c3a887878013a88aca0800003', null, 'DD100190', '1', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '444', '444', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9a81ffb50001', '2013-03-24 11:47:23', '2013-03-24 11:47:27', '8ae4839c3a887878013a88aca0800003', null, 'DD100191', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '134', '1234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9a82203d0003', '2013-03-24 11:47:32', '2013-03-24 11:47:32', '8ae4839c3a887878013a88aca0800003', null, 'DD100192', '1', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '324123', '41234123', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9a83d0db0005', '2013-03-24 11:49:22', '2013-03-24 11:49:35', '8ae4839c3a887878013a88aca0800003', null, 'DD100193', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '324123', '41234123', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '917', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9a86f9540007', '2013-03-24 11:52:49', '2013-03-24 11:52:51', '8ae4839c3a887878013a88ad18e10006', null, 'DD100194', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '100.00000', '381201020475959', '3803544517341346129', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '8ae4834e3c4308a2013c435b98ef005c', '917', null, '1', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9adcad74000a', '2013-03-24 13:26:26', '2013-03-24 13:26:26', '8ae4839c3a887878013a88aca0800003', null, 'DD100195', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', 'qwer', 'qew', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '917', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9ade26f5000c', '2013-03-24 13:28:03', '2013-03-24 13:28:03', '8ae4839c3a887878013a88aca0800003', null, 'DD100196', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '324', '5245', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '917', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9ade4d78000e', '2013-03-24 13:28:12', '2013-03-24 13:28:13', '8ae4839c3a887878013a88aca0800003', null, 'DD100197', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '245', '2435', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '917', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9adee3300010', '2013-03-24 13:28:51', '2013-03-24 13:28:51', '8ae4839c3a887878013a88aca0800003', null, 'DD100198', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', 'qwer', 'qer', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b179ba30013', '2013-03-24 14:30:48', '2013-03-24 14:30:48', '8ae4839c3a887878013a88aca0800003', null, 'DD100199', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '12341', '2341234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b17edd90015', '2013-03-24 14:31:09', '2013-03-24 14:31:09', '8ae4839c3a887878013a88aca0800003', null, 'DD100200', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '1234', '1234123', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '-1', '', 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b1816be0017', '2013-03-24 14:31:19', '2013-03-24 14:31:20', '8ae4839c3a887878013a88aca0800003', null, 'DD100201', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '4523', '4524', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '917', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b194e060019', '2013-03-24 14:32:39', '2013-03-24 14:32:39', '8ae4839c3a887878013a88aca0800003', null, 'DD100202', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '381201020475959', '3803544517341346129', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b194e73001b', '2013-03-24 14:32:39', '2013-03-24 14:32:39', '8ae4839c3a887878013a88aca0800003', null, 'DD100203', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '981301576694795', '9801062963549790850', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b194e92001c', '2013-03-24 14:32:39', '2013-03-24 14:32:39', '8ae4839c3a887878013a88aca0800003', null, 'DD100204', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '381201020475682', '3801431748036123817', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b194ea2001e', '2013-03-24 14:32:39', '2013-03-24 14:32:39', '8ae4839c3a887878013a88aca0800003', null, 'DD100205', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '381201020476185', '3809195879761068547', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b19698d0021', '2013-03-24 14:32:46', '2013-03-24 14:32:46', '8ae4839c3a887878013a88aca0800003', null, 'DD100206', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '381201020475959', '3803544517341346129', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '-1', '', 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b1969ac0022', '2013-03-24 14:32:46', '2013-03-24 14:32:46', '8ae4839c3a887878013a88aca0800003', null, 'DD100207', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '381201020475682', '3801431748036123817', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '-1', '', 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b1969db0025', '2013-03-24 14:32:46', '2013-03-24 14:32:47', '8ae4839c3a887878013a88aca0800003', null, 'DD100208', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '981301576694795', '9801062963549790850', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '-1', '', 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b1969ea0026', '2013-03-24 14:32:46', '2013-03-24 14:32:47', '8ae4839c3a887878013a88aca0800003', null, 'DD100209', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '381201020476185', '3809195879761068547', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '-1', '', 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b197b4f0029', '2013-03-24 14:32:51', '2013-03-24 14:32:51', '8ae4839c3a887878013a88aca0800003', null, 'DD100210', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '381201020475959', '3803544517341346129', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '917', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b197b7e002b', '2013-03-24 14:32:51', '2013-03-24 14:32:51', '8ae4839c3a887878013a88aca0800003', null, 'DD100211', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '981301576694795', '9801062963549790850', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '917', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b197b8e002c', '2013-03-24 14:32:51', '2013-03-24 14:32:51', '8ae4839c3a887878013a88aca0800003', null, 'DD100212', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '381201020476185', '3809195879761068547', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '917', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b197b9e002e', '2013-03-24 14:32:51', '2013-03-24 14:32:51', '8ae4839c3a887878013a88aca0800003', null, 'DD100213', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '381201020475682', '3801431748036123817', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '917', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b1a01770031', '2013-03-24 14:33:25', '2013-03-24 14:33:25', '8ae4839c3a887878013a88ad18e10006', null, 'DD100214', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '381201020475959', '3803544517341346129', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '2005', '该卡密已经有被使用的记录', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b1a01b60033', '2013-03-24 14:33:25', '2013-03-24 14:33:25', '8ae4839c3a887878013a88ad18e10006', null, 'DD100215', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '381201020475682', '3801431748036123817', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '2005', '该卡密已经有被使用的记录', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b1a01e50034', '2013-03-24 14:33:25', '2013-03-24 14:33:25', '8ae4839c3a887878013a88ad18e10006', null, 'DD100216', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '981301576694795', '9801062963549790850', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '2005', '该卡密已经有被使用的记录', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b1a01f40036', '2013-03-24 14:33:25', '2013-03-24 14:33:25', '8ae4839c3a887878013a88ad18e10006', null, 'DD100217', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '381201020476185', '3809195879761068547', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '2005', '该卡密已经有被使用的记录', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b1a0dfa0039', '2013-03-24 14:33:28', '2013-03-24 14:33:29', '8ae4839c3a887878013a88ad18e10006', null, 'DD100218', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '20.00000', '381201020475959', '3803544517341346129', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b1a0e29003b', '2013-03-24 14:33:28', '2013-03-24 14:33:29', '8ae4839c3a887878013a88ad18e10006', null, 'DD100219', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '20.00000', '381201020476185', '3809195879761068547', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b1a0e58003d', '2013-03-24 14:33:28', '2013-03-24 14:33:29', '8ae4839c3a887878013a88ad18e10006', null, 'DD100220', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '20.00000', '981301576694795', '9801062963549790850', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b1a0e68003e', '2013-03-24 14:33:28', '2013-03-24 14:33:29', '8ae4839c3a887878013a88ad18e10006', null, 'DD100221', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '20.00000', '381201020475682', '3801431748036123817', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b1a152e0041', '2013-03-24 14:33:30', '2013-03-24 14:33:30', '8ae4839c3a887878013a88ad18e10006', null, 'DD100222', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '20.00000', '981301576694795', '9801062963549790850', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '917', null, '1', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b1a154d0042', '2013-03-24 14:33:30', '2013-03-24 14:33:30', '8ae4839c3a887878013a88ad18e10006', null, 'DD100223', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '20.00000', '381201020475682', '3801431748036123817', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '917', null, '1', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b1a156d0044', '2013-03-24 14:33:30', '2013-03-24 14:33:30', '8ae4839c3a887878013a88ad18e10006', null, 'DD100224', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '20.00000', '381201020476185', '3809195879761068547', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '917', null, '1', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b1a156d0046', '2013-03-24 14:33:30', '2013-03-24 14:33:30', '8ae4839c3a887878013a88ad18e10006', null, 'DD100225', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '20.00000', '381201020475959', '3803544517341346129', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '917', null, '1', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b21e5f90049', '2013-03-24 14:42:02', '2013-03-24 14:42:03', '8ae4839c3a887878013a88ad18e10006', null, 'DD100226', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '20.00000', '381201020475959', '3803544517341346129', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '917', null, '1', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b21e618004a', '2013-03-24 14:42:02', '2013-03-24 14:42:03', '8ae4839c3a887878013a88ad18e10006', null, 'DD100227', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '20.00000', '381201020475682', '3801431748036123817', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '917', null, '1', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b21e657004d', '2013-03-24 14:42:02', '2013-03-24 14:42:03', '8ae4839c3a887878013a88ad18e10006', null, 'DD100228', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '20.00000', '381201020476185', '3809195879761068547', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '917', null, '1', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743d9a7f0a013d9b21e667004e', '2013-03-24 14:42:02', '2013-03-24 14:42:03', '8ae4839c3a887878013a88ad18e10006', null, 'DD100229', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '20.00000', '981301576694795', '9801062963549790850', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '917', null, '1', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5a51b013da5a68d8e0000', '2013-03-26 15:43:08', '2013-03-26 15:43:08', '8ae4839c3a887878013a88aca0800003', null, 'DD100238', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '100.00000', '1234', '22222', '移动充值卡 [100元]', '100.00000', 'SN_5C0F8D8476A6', '8ae4834e3c4308a2013c435d430a0063', '917', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5a51b013da5af63c30002', '2013-03-26 15:52:47', '2013-03-26 15:52:47', '8ae4839c3a887878013a88aca0800003', null, 'DD100239', '1', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '24352', '345243', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5a51b013da5b027610004', '2013-03-26 15:53:37', '2013-03-26 15:53:37', '8ae4839c3a887878013a88aca0800003', null, 'DD100240', '1', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '24352', '452345', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5b0f3013da5b175ca0001', '2013-03-26 15:55:03', '2013-03-26 15:55:03', '8ae4839c3a887878013a88aca0800003', null, 'DD100241', '1', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '2435', '2345', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5b0f3013da5b25f7e0003', '2013-03-26 15:56:03', '2013-03-26 15:56:03', '8ae4839c3a887878013a88ad18e10006', null, 'DD100242', '1', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '20.00000', '12341', '234123', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', null, null, '1', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5b0f3013da5bc522f0005', '2013-03-26 16:06:55', '2013-03-26 16:06:55', '8ae4839c3a887878013a88ad18e10006', null, 'DD100243', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '20.00000', '1234', '1324', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '917', null, '1', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5b0f3013da5be9ceb0007', '2013-03-26 16:09:25', '2013-03-26 16:09:25', '8ae4839c3a887878013a88aca0800003', null, 'DD100244', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '20.00000', '1234111', '12342222', '移动充值卡 [20元]', '20.00000', 'SN_E1B7A69B1095', '8ae4834e3c4308a2013c435d42a60060', '917', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5b0f3013da5c214db0009', '2013-03-26 16:13:12', '2013-03-26 16:13:12', '8ae4839c3a887878013a88aca0800003', null, 'DD100245', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '2452', '435245234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '101', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5b0f3013da5cb3c2e000b', '2013-03-26 16:23:12', '2013-03-26 16:23:12', '8ae4839c3a887878013a88aca0800003', null, 'DD100246', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '1234', '13241234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '101', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5b0f3013da5d10ef6000d', '2013-03-26 16:29:34', '2013-03-26 16:29:34', '8ae4839c3a887878013a88aca0800003', null, 'DD100247', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '1234', '123', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '104', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5b0f3013da5d19983000f', '2013-03-26 16:30:09', '2013-03-26 16:30:09', '8ae4839c3a887878013a88ad18e10006', null, 'DD100248', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '100.00000', '381201020475959', '3803544517341346129', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '8ae4834e3c4308a2013c435b98ef005c', '915', null, '1', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5b0f3013da5d1e65b0011', '2013-03-26 16:30:29', '2013-03-26 16:30:29', '8ae4839c3a887878013a88aca0800003', null, 'DD100249', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '300.00000', '381201020475959', '3803544517341346129', '移动充值卡 [300元]', '300.00000', 'SN_2E6AC980F291', '8ae4834e3c4308a2013c435d434f0065', '915', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5b0f3013da5d73acc0013', '2013-03-26 16:36:18', '2013-03-26 16:36:18', '8ae4839c3a887878013a88aca0800003', null, 'DD100250', '1', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '381201020475959', '3803544517341346129', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '200', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5b0f3013da5d8ad960015', '2013-03-26 16:37:53', '2013-03-26 16:37:54', '8ae4839c3a887878013a88aca0800003', null, 'DD100251', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '23141', '2341234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '-1', '', 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5b0f3013da5dece6f0017', '2013-03-26 16:44:35', '2013-03-26 16:44:35', '8ae4839c3a887878013a88aca0800003', null, 'DD100252', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '1234', '1234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '-1', '', 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5b0f3013da5fb7296001a', '2013-03-26 17:15:52', '2013-03-26 17:15:52', '8ae4839c3a887878013a88aca0800003', null, 'DD100253', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '2345234', '52345', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '-1', '', 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5b0f3013da6103e03001c', '2013-03-26 17:38:35', '2013-03-26 17:38:35', '8ae4839c3a887878013a88aca0800003', null, 'DD100254', '1', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '15412345234', '523452345', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5b0f3013da6223c56001e', '2013-03-26 17:58:14', '2013-03-26 17:58:14', '8ae4839c3a887878013a88aca0800003', null, 'DD100255', '1', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '2452', '3452345', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da5b0f3013da62322ce0020', '2013-03-26 17:59:13', '2013-03-26 17:59:13', '8ae4839c3a887878013a88aca0800003', null, 'DD100256', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '2452', '3452345', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '-1', '', 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743da625e1013da62736710001', '2013-03-26 18:03:40', '2013-03-26 18:03:40', '8ae4839c3a887878013a88aca0800003', null, 'DD100257', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '12341324', '1341234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '-1', '', 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743daa389c013daa3b41f50000', '2013-03-27 13:04:03', '2013-03-27 13:04:03', '8ae4839c3a887878013a88ad18e10006', null, 'DD100258', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '20.00000', '3451234', '52345234', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743daa389c013daa3be24c0002', '2013-03-27 13:04:44', '2013-03-27 13:04:44', '8ae4839c3a887878013a88aca0800003', null, 'DD100259', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '20.00000', '1324', '12341', '移动充值卡 [20元]', '20.00000', 'SN_E1B7A69B1095', '8ae4834e3c4308a2013c435d42a60060', '-1', '', 'szx-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743daa389c013daa3dfec30004', '2013-03-27 13:07:02', '2013-03-27 13:07:02', '8ae4839c3a887878013a88aca0800003', null, 'DD100260', '1', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '1234', '1234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '1', '', 'szx', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743daa389c013daa4167810006', '2013-03-27 13:10:45', '2013-03-27 13:10:46', '8ae4839c3a887878013a88ad18e10006', null, 'DD100261', '1', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '30.00000', '444444', '5555555', '联通充值卡 [30元]', '30.00000', 'SN_453B3C4096A6', '8ae4834e3c4308a2013c435b989e005a', '1', '', 'unicom', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743daa389c013daa41bb3e0008', '2013-03-27 13:11:07', '2013-03-27 13:11:07', '8ae4839c3a887878013a88ad18e10006', null, 'DD100262', '1', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '30.00000', '1341234123', '5134151', '联通充值卡 [30元]', '30.00000', 'SN_453B3C4096A6', '8ae4834e3c4308a2013c435b989e005a', '1', '', 'unicom', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743daa389c013daa41bb4e0009', '2013-03-27 13:11:07', '2013-03-27 13:11:07', '8ae4839c3a887878013a88ad18e10006', null, 'DD100263', '1', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '30.00000', '31354352345', '243523452', '联通充值卡 [30元]', '30.00000', 'SN_453B3C4096A6', '8ae4834e3c4308a2013c435b989e005a', '1', '', 'unicom', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('4028bc743daa389c013daa46af9d000c', '2013-03-27 13:16:32', '2013-03-27 13:16:33', '8ae4839c3a887878013a88ad18e10006', null, 'DD100264', '1', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '100.00000', '381201020475959', '3803544517341346129', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '8ae4834e3c4308a2013c435b98ef005c', '1', '', 'unicom', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82ad3d87c40f013d87d02a440000', '2013-03-20 20:39:59', '2013-03-20 20:40:00', '8ae4839c3a887878013a88aca0800003', null, 'DD100156', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '32342', '4234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82ad3d87c40f013d87d042ed0002', '2013-03-20 20:40:05', '2013-03-20 20:40:05', '8ae4839c3a887878013a88aca0800003', null, 'DD100157', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '431234', '1234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82ad3d87c40f013d87d050cd0004', '2013-03-20 20:40:09', '2013-03-20 20:40:09', '8ae4839c3a887878013a88aca0800003', null, 'DD100158', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '345', '2345234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82ad3d87c40f013d87d9cb460006', '2013-03-20 20:50:30', '2013-03-20 20:50:30', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100159', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '15.00000', 'wetrwert', 'wertwert', '完美一卡通 [15元]', '15.00000', 'SN_4BBDD696108B', '8ae4834e3c4308a2013c43511f6f0029', '2010', '充值卡无效', '000801', '0.85', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82ad3d87c40f013d87da0c110008', '2013-03-20 20:50:46', '2013-03-20 20:50:47', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100160', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '15.00000', 'wetrwert', 'wertwert', '完美一卡通 [15元]', '15.00000', 'SN_4BBDD696108B', '8ae4834e3c4308a2013c43511f6f0029', '2010', '充值卡无效', '000801', '0.85', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82ad3d87c40f013d87daabc1000a', '2013-03-20 20:51:27', '2013-03-20 20:51:27', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100161', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '15.00000', 'wetrwert', 'wertwert', '完美一卡通 [15元]', '15.00000', 'SN_4BBDD696108B', '8ae4834e3c4308a2013c43511f6f0029', '2010', '充值卡无效', '000801', '0.85', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82ad3d87c40f013d87dab0c1000c', '2013-03-20 20:51:29', '2013-03-20 20:51:30', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100162', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '15.00000', 'wetrwert', 'wertwert', '完美一卡通 [15元]', '15.00000', 'SN_4BBDD696108B', '8ae4834e3c4308a2013c43511f6f0029', '2010', '充值卡无效', '000801', '0.85', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82ad3d87c40f013d87daea3b000e', '2013-03-20 20:51:43', '2013-03-20 20:54:31', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100163', '2', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '15.00000', 'wetrwert', 'wertwert', '完美一卡通 [15元]', '15.00000', 'SN_4BBDD696108B', '8ae4834e3c4308a2013c43511f6f0029', '2010', '充值卡无效', '000801', '0.85', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82ad3d87c40f013d87daef790010', '2013-03-20 20:51:45', '2013-03-20 20:51:45', '8ae4839c3a887878013a88ada7f6000a', null, 'DD100164', '3', '20.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '15.00000', 'wetrwert', 'wertwert', '完美一卡通 [15元]', '15.00000', 'SN_4BBDD696108B', '8ae4834e3c4308a2013c43511f6f0029', '2010', '充值卡无效', '000801', '0.85', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82cc3d5936a7013d59cd129b0003', '2013-03-11 22:14:04', '2013-03-11 23:18:27', '8ae4839c3a887878013a88aca0800003', null, 'DD100130', '1', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1111', '2222', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2014', '不存在该笔订单', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5ebd81010001', '2013-03-12 21:15:10', '2013-03-12 21:15:11', '8ae4839c3a887878013a88aca0800003', null, 'DD100131', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', 'eeeeee', 'eeee', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5ebeb8340003', '2013-03-12 21:16:30', '2013-03-12 21:17:30', '8ae4839c3a887878013a88aca0800003', null, 'DD100132', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '12312', '3123123', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5ebeecd70005', '2013-03-12 21:16:43', '2013-03-12 21:16:43', '8ae4839c3a887878013a88aca0800003', null, 'DD100133', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '11111', '2222222', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5ebeefd50007', '2013-03-12 21:16:44', '2013-03-12 21:16:44', '8ae4839c3a887878013a88aca0800003', null, 'DD100134', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '123123', '12312312', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5ed24baa0009', '2013-03-12 21:37:53', '2013-03-12 21:37:53', '8ae4839c3a887878013a88aca0800003', null, 'DD100135', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '12341234', '123412341234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5ed24e95000b', '2013-03-12 21:37:53', '2013-03-12 21:37:53', '8ae4839c3a887878013a88aca0800003', null, 'DD100136', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1222222222', '123412341234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5ed87c17000d', '2013-03-12 21:44:38', '2013-03-12 21:44:56', '8ae4839c3a887878013a88aca0800003', null, 'DD100137', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '234234', '23423423', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5edc10ce000f', '2013-03-12 21:48:33', '2013-03-12 21:48:33', '8ae4839c3a887878013a88aca0800003', null, 'DD100138', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '123123123', '123123123', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5ee1af3d0011', '2013-03-12 21:54:41', '2013-03-12 21:54:41', '8ae4839c3a887878013a88aca0800003', null, 'DD100139', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1341234', '13241234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5ee265c10013', '2013-03-12 21:55:28', '2013-03-12 21:56:28', '8ae4839c3a887878013a88aca0800003', null, 'DD100140', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '23452345', '23452345', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5ee2b8620015', '2013-03-12 21:55:49', '2013-03-12 21:55:49', '8ae4839c3a887878013a88aca0800003', null, 'DD100141', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '3333', '3333', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5ee3157b0017', '2013-03-12 21:56:13', '2013-03-12 21:56:13', '8ae4839c3a887878013a88aca0800003', null, 'DD100142', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', 'ttttt', 'werwqer', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5ee40d8a0019', '2013-03-12 21:57:16', '2013-03-12 21:58:17', '8ae4839c3a887878013a88aca0800003', null, 'DD100143', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', 'weqrqw', 'erqwer', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5ee4266d001b', '2013-03-12 21:57:23', '2013-03-12 21:57:23', '8ae4839c3a887878013a88aca0800003', null, 'DD100144', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '2343', '2345', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5ee53072001d', '2013-03-12 21:58:31', '2013-03-12 21:59:31', '8ae4839c3a887878013a88aca0800003', null, 'DD100145', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', 'weqrqw', 'erqwer', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5ee64c31001f', '2013-03-12 21:59:43', '2013-03-12 21:59:49', '8ae4839c3a887878013a88aca0800003', null, 'DD100146', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', 'qrqwerqw', 'erqwerqwer', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5ee709580021', '2013-03-12 22:00:32', '2013-03-12 22:01:32', '8ae4839c3a887878013a88aca0800003', null, 'DD100147', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', 'qwerqwer', 'qwerqwer', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a8f82de3d5e89c6013d5eee26fd0023', '2013-03-12 22:08:18', '2013-03-12 22:09:18', '8ae4839c3a887878013a88aca0800003', null, 'DD100148', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '234234', '234234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9180943d49fba2013d49fee1d10013', '2013-03-08 20:34:33', '2013-03-08 20:34:34', '8ae4839c3a887878013a88aca0800003', null, 'DD100112', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '4444444444444444', '55555', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9180943d49fba2013d49fee1f30015', '2013-03-08 20:34:33', '2013-03-08 20:34:34', '8ae4839c3a887878013a88aca0800003', null, 'DD100113', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '4444444444444444', '55555', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9180943d49fba2013d49fee2090016', '2013-03-08 20:34:33', '2013-03-08 20:34:34', '8ae4839c3a887878013a88aca0800003', null, 'DD100114', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '4444444444444444', '55555', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9180943d49fba2013d49fee2390019', '2013-03-08 20:34:33', '2013-03-08 20:34:34', '8ae4839c3a887878013a88aca0800003', null, 'DD100115', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '4444444444444444', '55555', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9180943d49fba2013d49fee26b001a', '2013-03-08 20:34:33', '2013-03-08 20:34:34', '8ae4839c3a887878013a88aca0800003', null, 'DD100116', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '4444444444444444', '55555', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9180943d49fba2013d49fee29b001d', '2013-03-08 20:34:33', '2013-03-08 20:34:34', '8ae4839c3a887878013a88aca0800003', null, 'DD100117', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '4444444444444444', '55555', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9180943d49fba2013d49fee64d001f', '2013-03-08 20:34:34', '2013-03-08 20:34:34', '8ae4839c3a887878013a88aca0800003', null, 'DD100118', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '4444444444444444', '55555', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9180943d49fba2013d4a1438ef0021', '2013-03-08 20:57:52', '2013-03-08 20:57:52', '8ae4839c3a887878013a88ad18e10006', null, 'DD100119', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '少时诵诗书', 'aaaaaa', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '2003', '签名失败', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9180943d49fba2013d4a143fb00023', '2013-03-08 20:57:53', '2013-03-08 20:57:53', '8ae4839c3a887878013a88ad18e10006', null, 'DD100120', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '少时诵诗书', 'aaaaaa', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '2003', '签名失败', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9180943d49fba2013d4a18c43c0025', '2013-03-08 21:02:49', '2013-03-08 21:02:50', '8ae4839c3a887878013a88ad18e10006', null, 'DD100121', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '100.00000', '381201020475959', '3803544517341346129', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '8ae4834e3c4308a2013c435b98ef005c', '2005', '该卡密已经有被使用的记录', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9180943d49fba2013d4a18cd640027', '2013-03-08 21:02:52', '2013-03-08 21:02:52', '8ae4839c3a887878013a88ad18e10006', null, 'DD100122', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '100.00000', '381201020475682', '3801431748036123817', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '8ae4834e3c4308a2013c435b98ef005c', '2005', '该卡密已经有被使用的记录', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9180943d49fba2013d4a18cd790028', '2013-03-08 21:02:52', '2013-03-08 21:02:52', '8ae4839c3a887878013a88ad18e10006', null, 'DD100123', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '100.00000', '381201020476185', '3809195879761068547', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '8ae4834e3c4308a2013c435b98ef005c', '2005', '该卡密已经有被使用的记录', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9180943d49fba2013d4a23d448002b', '2013-03-08 21:14:54', '2013-03-08 21:14:54', '8ae4839c3a887878013a88ad18e10006', null, 'DD100124', '1', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '100.00000', '381201020475959', '3803544517341346129', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '8ae4834e3c4308a2013c435b98ef005c', null, null, '1', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9180943d49fba2013d4a33b254002d', '2013-03-08 21:32:14', '2013-03-08 21:32:16', '8ae4839c3a887878013a88ad18e10006', null, 'DD100125', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '100.00000', '981301576694795', '9801062963549790850', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '8ae4834e3c4308a2013c435b98ef005c', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9182d53da1ef55013da1f12b5c0005', '2013-03-25 22:26:09', '2013-03-25 22:26:10', '8ae4839c3a887878013a88ad18e10006', null, 'DD100230', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '20.00000', '1312342', '2341234', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '2010', '充值卡无效', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9182d53da1ef55013da1f1fc6d0007', '2013-03-25 22:27:03', '2013-03-25 22:27:04', '8ae4839c3a887878013a88ad18e10006', null, 'DD100231', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '100.00000', '381201020475959', '3803544517341346129', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '8ae4834e3c4308a2013c435b98ef005c', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9182d53da1f91f013da231d8eb0004', '2013-03-25 23:36:48', '2013-03-25 23:36:49', '8ae4839c3a887878013a88aca0800003', null, 'DD100232', '3', '0.00000', '通道1', '8a8f82cc3d5936a7013d59c871d20001', '4028bc743bac0d54013baca8e1350001', '10.00000', '381201020475682', '3801431748036123817', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9182d53da1f91f013da23232770006', '2013-03-25 23:37:11', '2013-03-25 23:37:11', '8ae4839c3a887878013a88ad18e10006', null, 'DD100233', '3', '0.00000', '通道1', '8a8f82cc3d5936a7013d59c871d20001', '4028bc743bac0d54013baca8e1350001', '20.00000', '381201020475682', '3801431748036123817', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '2005', '该卡密已经有被使用的记录', '000201', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9182d53da25181013da2526fb20001', '2013-03-26 00:12:24', '2013-03-26 00:12:24', '8ae4839c3a887878013a88ad18e10006', null, 'DD100234', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '20.00000', '381201020475682', '3801431748036123817', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '917', null, '1', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9182d53da25923013da259c02c0001', '2013-03-26 00:20:23', '2013-03-26 00:20:23', '8ae4839c3a887878013a88ad18e10006', null, 'DD100235', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '20.00000', '381201020475682', '3801431748036123817', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '917', null, '1', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9182d53da25923013da25c306a0003', '2013-03-26 00:23:03', '2013-03-26 00:23:03', '8ae4839c3a887878013a88ad18e10006', null, 'DD100236', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '100.00000', '381201020475682', '3801431748036123817', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '8ae4834e3c4308a2013c435b98ef005c', '917', null, '1', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a9182d53da25923013da25ec46c0005', '2013-03-26 00:25:52', '2013-03-26 00:25:53', '8ae4839c3a887878013a88ad18e10006', null, 'DD100237', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '20.00000', '381201020475959', '3803544517341346129', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '8ae4834e3c4308a2013c435b979d0059', '-1', '', 'unicom-net', '0.96', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('8a91838c3dba892b013dba89fb120000', '2013-03-30 17:03:57', '2013-03-30 17:03:58', '8ae4839c3a887878013a88aca0800003', null, 'DD100265', '3', '0.00000', '通道3', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743d235d03013d23d5aaee0003', '10.00000', '2523', '452345', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '104', null, '0', '0.95', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('ff8080813d8323f4013d833258d70002', '2013-03-19 23:09:07', '2013-03-19 23:09:07', '8ae4839c3a887878013a88aca0800003', null, 'DD100149', '1', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '12222', '2222', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('ff8080813d8323f4013d83703a9d0009', '2013-03-20 00:16:43', '2013-03-20 00:16:43', '8ae4839c3a887878013a88aca0800003', null, 'DD100150', '1', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '123412412', '3412341234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', null, null, '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('ff8080813d8323f4013d8393c271000b', '2013-03-20 00:55:31', '2013-03-20 00:55:32', '8ae4839c3a887878013a88acef930005', null, 'DD100151', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '5.00000', 'qweqwerq', '234123', '腾讯Q币卡 [5元]', '5.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2010', '充值卡无效', '000701', '0.82', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('ff8080813d8323f4013d839425cb000d', '2013-03-20 00:55:57', '2013-03-20 00:55:57', '8ae4839c3a887878013a88acef930005', null, 'DD100152', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '5.00000', 'qweqwerq', '234123', '腾讯Q币卡 [5元]', '5.00000', 'SN_A18F88A39EA3', '4028bc743bb6fee6013bb755fed20002', '2010', '充值卡无效', '000701', '0.82', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('ff8080813d8323f4013d83956315000f', '2013-03-20 00:57:18', '2013-03-20 00:57:18', '8ae4839c3a887878013a88aca0800003', null, 'DD100153', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '234234', '12341234', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('ff8080813d8323f4013d8397ebf10011', '2013-03-20 01:00:04', '2013-03-20 01:00:04', '8ae4839c3a887878013a88aca0800003', null, 'DD100154', '3', '0.00000', '通道1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8e1350001', '10.00000', '1234123', 'qwerqwer', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '2010', '充值卡无效', '000101', '0.97', null, null, null, null, null);
INSERT INTO `xx_order` VALUES ('ff8080813d8323f4013d839817ce0013', '2013-03-20 01:00:15', '2013-03-20 01:00:16', '8ae4839c3a887878013a88aca0800003', null, 'DD100155', '3', '0.00000', '通道2', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743bac0d54013baca8729d0000', '10.00000', '1234123', 'qwerqwer', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '4028bc743c3c4340013c3c51db950002', '-1', '', 'szx-net', '0.96', null, null, null, null, null);

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
INSERT INTO `xx_order_log` VALUES ('4028bc743c663f39013c66421d930002', '2013-01-23 15:14:34', '2013-01-23 15:14:34', null, null, '0', 'DD100012', '4028bc743c663f39013c66421d740001');
INSERT INTO `xx_order_log` VALUES ('4028bc743c6f3698013c6f386d630001', '2013-01-25 09:00:34', '2013-01-25 09:00:34', null, null, '0', 'DD100013', '4028bc743c6f3698013c6f386d340000');
INSERT INTO `xx_order_log` VALUES ('4028bc743c6f3698013c6f39088a0003', '2013-01-25 09:01:14', '2013-01-25 09:01:14', '订单完成,获得积分: ', 'admin', '3', 'DD100012', '4028bc743c663f39013c66421d740001');
INSERT INTO `xx_order_log` VALUES ('4028bc743c6f3698013c6f399f7a0006', '2013-01-25 09:01:52', '2013-01-25 09:01:52', null, null, '0', 'DD100014', '4028bc743c6f3698013c6f399f6b0005');
INSERT INTO `xx_order_log` VALUES ('4028bc743c6f3698013c6f4fe15a0009', '2013-01-25 09:26:11', '2013-01-25 09:26:11', null, null, '0', 'DD100015', '4028bc743c6f3698013c6f4fe13b0008');
INSERT INTO `xx_order_log` VALUES ('4028bc743c6f3698013c6f518b42000c', '2013-01-25 09:28:00', '2013-01-25 09:28:00', null, null, '0', 'DD100016', '4028bc743c6f3698013c6f518b03000b');
INSERT INTO `xx_order_log` VALUES ('4028bc743c6f612c013c6f6201eb0001', '2013-01-25 09:45:59', '2013-01-25 09:45:59', null, null, '0', 'DD100017', '4028bc743c6f612c013c6f6201cc0000');
INSERT INTO `xx_order_log` VALUES ('4028bc743d394afd013d39b3cb730002', '2013-03-05 16:38:37', '2013-03-05 16:38:37', null, null, '0', 'DD100018', '4028bc743d394afd013d39b3cb450001');
INSERT INTO `xx_order_log` VALUES ('4028bc743d394afd013d39b762560004', '2013-03-05 16:42:32', '2013-03-05 16:42:32', null, null, '0', 'DD100019', '4028bc743d394afd013d39b762370003');
INSERT INTO `xx_order_log` VALUES ('4028bc743d394afd013d39b764590006', '2013-03-05 16:42:32', '2013-03-05 16:42:32', null, null, '0', 'DD100020', '4028bc743d394afd013d39b7643a0005');
INSERT INTO `xx_order_log` VALUES ('4028bc743d394afd013d39d8b8a30008', '2013-03-05 17:18:57', '2013-03-05 17:18:57', null, null, '0', 'DD100021', '4028bc743d394afd013d39d8b8930007');
INSERT INTO `xx_order_log` VALUES ('4028bc743d394afd013d39d8ba59000a', '2013-03-05 17:18:57', '2013-03-05 17:18:57', null, null, '0', 'DD100022', '4028bc743d394afd013d39d8ba390009');
INSERT INTO `xx_order_log` VALUES ('4028bc743d3dbdf7013d3dc52a740003', '2013-03-06 11:36:04', '2013-03-06 11:36:04', null, null, '0', 'DD100023', '4028bc743d3dbdf7013d3dc52a450002');
INSERT INTO `xx_order_log` VALUES ('4028bc743d3dbdf7013d3dcc46c40005', '2013-03-06 11:43:50', '2013-03-06 11:43:50', null, null, '0', 'DD100024', '4028bc743d3dbdf7013d3dcc46a50004');
INSERT INTO `xx_order_log` VALUES ('4028bc743d3dbdf7013d3dcc49060007', '2013-03-06 11:43:51', '2013-03-06 11:43:51', null, null, '0', 'DD100025', '4028bc743d3dbdf7013d3dcc487a0006');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d4398c3c20003', '2013-03-07 14:45:17', '2013-03-07 14:45:17', null, null, '0', 'DD100026', '4028bc743d43789d013d4398ba4c0002');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d439942e50005', '2013-03-07 14:45:50', '2013-03-07 14:45:50', null, null, '0', 'DD100027', '4028bc743d43789d013d439942c60004');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d439944f80007', '2013-03-07 14:45:50', '2013-03-07 14:45:50', null, null, '0', 'DD100028', '4028bc743d43789d013d439944d90006');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43a038540009', '2013-03-07 14:53:26', '2013-03-07 14:53:26', null, null, '0', 'DD100029', '4028bc743d43789d013d43a038350008');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43a04208000b', '2013-03-07 14:53:28', '2013-03-07 14:53:28', null, null, '0', 'DD100030', '4028bc743d43789d013d43a041e9000a');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43a15d0d000d', '2013-03-07 14:54:41', '2013-03-07 14:54:41', null, null, '0', 'DD100031', '4028bc743d43789d013d43a15cee000c');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43a15f21000f', '2013-03-07 14:54:41', '2013-03-07 14:54:41', null, null, '0', 'DD100032', '4028bc743d43789d013d43a15f11000e');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43a2719a0011', '2013-03-07 14:55:52', '2013-03-07 14:55:52', null, null, '0', 'DD100033', '4028bc743d43789d013d43a2717b0010');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43a273cd0013', '2013-03-07 14:55:52', '2013-03-07 14:55:52', null, null, '0', 'DD100034', '4028bc743d43789d013d43a273ae0012');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43a40ea10015', '2013-03-07 14:57:37', '2013-03-07 14:57:37', null, null, '0', 'DD100035', '4028bc743d43789d013d43a40e810014');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43a412d70017', '2013-03-07 14:57:39', '2013-03-07 14:57:39', null, null, '0', 'DD100036', '4028bc743d43789d013d43a412b80016');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43a64bb00019', '2013-03-07 15:00:04', '2013-03-07 15:00:04', null, null, '0', 'DD100037', '4028bc743d43789d013d43a64b910018');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43a64d75001b', '2013-03-07 15:00:05', '2013-03-07 15:00:05', null, null, '0', 'DD100038', '4028bc743d43789d013d43a64d65001a');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43a6668b001d', '2013-03-07 15:00:11', '2013-03-07 15:00:11', null, null, '0', 'DD100039', '4028bc743d43789d013d43a6666c001c');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43a667d3001f', '2013-03-07 15:00:11', '2013-03-07 15:00:11', null, null, '0', 'DD100040', '4028bc743d43789d013d43a667b4001e');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b0b3cf0021', '2013-03-07 15:11:26', '2013-03-07 15:11:26', null, null, '0', 'DD100041', '4028bc743d43789d013d43b0b3b00020');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b0b6020023', '2013-03-07 15:11:27', '2013-03-07 15:11:27', null, null, '0', 'DD100042', '4028bc743d43789d013d43b0b5f20022');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b0b8f00025', '2013-03-07 15:11:27', '2013-03-07 15:11:27', null, null, '0', 'DD100043', '4028bc743d43789d013d43b0b8a20024');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b0ba190027', '2013-03-07 15:11:28', '2013-03-07 15:11:28', null, null, '0', 'DD100044', '4028bc743d43789d013d43b0b9bb0026');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b0bae40029', '2013-03-07 15:11:28', '2013-03-07 15:11:28', null, null, '0', 'DD100045', '4028bc743d43789d013d43b0ba770028');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b0bb80002b', '2013-03-07 15:11:28', '2013-03-07 15:11:28', null, null, '0', 'DD100046', '4028bc743d43789d013d43b0bb42002a');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b0bc6b002d', '2013-03-07 15:11:28', '2013-03-07 15:11:28', null, null, '0', 'DD100047', '4028bc743d43789d013d43b0bc1c002c');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b0bcf7002f', '2013-03-07 15:11:29', '2013-03-07 15:11:29', null, null, '0', 'DD100048', '4028bc743d43789d013d43b0bcd8002e');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b0c2e30031', '2013-03-07 15:11:30', '2013-03-07 15:11:30', null, null, '0', 'DD100049', '4028bc743d43789d013d43b0c2d30030');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b0c3310033', '2013-03-07 15:11:30', '2013-03-07 15:11:30', null, null, '0', 'DD100050', '4028bc743d43789d013d43b0c3210032');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b0c36f0035', '2013-03-07 15:11:30', '2013-03-07 15:11:30', null, null, '0', 'DD100051', '4028bc743d43789d013d43b0c3500034');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b0c3cd0038', '2013-03-07 15:11:30', '2013-03-07 15:11:30', null, null, '0', 'DD100052', '4028bc743d43789d013d43b0c3ae0036');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b0c3fc0039', '2013-03-07 15:11:30', '2013-03-07 15:11:30', null, null, '0', 'DD100053', '4028bc743d43789d013d43b0c3ae0037');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b0c43b003b', '2013-03-07 15:11:30', '2013-03-07 15:11:30', null, null, '0', 'DD100054', '4028bc743d43789d013d43b0c42b003a');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b0c469003e', '2013-03-07 15:11:30', '2013-03-07 15:11:30', null, null, '0', 'DD100055', '4028bc743d43789d013d43b0c43b003c');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b0c479003f', '2013-03-07 15:11:30', '2013-03-07 15:11:30', null, null, '0', 'DD100056', '4028bc743d43789d013d43b0c44a003d');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3ef530041', '2013-03-07 15:14:58', '2013-03-07 15:14:58', null, null, '0', 'DD100057', '4028bc743d43789d013d43b3ef340040');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f56e0043', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100058', '4028bc743d43789d013d43b3f54e0042');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f59d0046', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100059', '4028bc743d43789d013d43b3f57d0044');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f5ac0047', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100060', '4028bc743d43789d013d43b3f59d0045');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f5db004a', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100061', '4028bc743d43789d013d43b3f5bc0048');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f5fa004b', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100062', '4028bc743d43789d013d43b3f5bc0049');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f629004d', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100063', '4028bc743d43789d013d43b3f5fa004c');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f677004f', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100064', '4028bc743d43789d013d43b3f648004e');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f6d50052', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100065', '4028bc743d43789d013d43b3f6970050');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f6e50054', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100066', '4028bc743d43789d013d43b3f6b60051');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f6f40055', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100067', '4028bc743d43789d013d43b3f6d50053');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f7330058', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100068', '4028bc743d43789d013d43b3f7040056');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f7330059', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100069', '4028bc743d43789d013d43b3f7140057');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f771005b', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100070', '4028bc743d43789d013d43b3f742005a');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f7cf005d', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100071', '4028bc743d43789d013d43b3f7a0005c');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f81d005f', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100072', '4028bc743d43789d013d43b3f7ee005e');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f83c0062', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100073', '4028bc743d43789d013d43b3f81d0060');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f87b0064', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100075', '4028bc743d43789d013d43b3f85c0063');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f88b0065', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100074', '4028bc743d43789d013d43b3f82d0061');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b3f8e80067', '2013-03-07 15:15:00', '2013-03-07 15:15:00', null, null, '0', 'DD100076', '4028bc743d43789d013d43b3f89a0066');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b535dd0069', '2013-03-07 15:16:22', '2013-03-07 15:16:22', null, null, '0', 'DD100077', '4028bc743d43789d013d43b535be0068');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b53b1d006b', '2013-03-07 15:16:23', '2013-03-07 15:16:23', null, null, '0', 'DD100078', '4028bc743d43789d013d43b53afd006a');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b53b6b006e', '2013-03-07 15:16:23', '2013-03-07 15:16:23', null, null, '0', 'DD100079', '4028bc743d43789d013d43b53b4c006c');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b53b7a006f', '2013-03-07 15:16:23', '2013-03-07 15:16:23', null, null, '0', 'DD100080', '4028bc743d43789d013d43b53b5b006d');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b53bf70073', '2013-03-07 15:16:23', '2013-03-07 15:16:23', null, null, '0', 'DD100082', '4028bc743d43789d013d43b53b9a0071');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b53bf70074', '2013-03-07 15:16:23', '2013-03-07 15:16:23', null, null, '0', 'DD100083', '4028bc743d43789d013d43b53b9a0072');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b53bf70075', '2013-03-07 15:16:23', '2013-03-07 15:16:23', null, null, '0', 'DD100081', '4028bc743d43789d013d43b53b8a0070');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b53ce20077', '2013-03-07 15:16:23', '2013-03-07 15:16:23', null, null, '0', 'DD100084', '4028bc743d43789d013d43b53c650076');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b53d9d007b', '2013-03-07 15:16:24', '2013-03-07 15:16:24', null, null, '0', 'DD100085', '4028bc743d43789d013d43b53d300078');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b53d9d007c', '2013-03-07 15:16:24', '2013-03-07 15:16:24', null, null, '0', 'DD100086', '4028bc743d43789d013d43b53d400079');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b53dbd007d', '2013-03-07 15:16:24', '2013-03-07 15:16:24', null, null, '0', 'DD100087', '4028bc743d43789d013d43b53d4f007a');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b53dfb0080', '2013-03-07 15:16:24', '2013-03-07 15:16:24', null, null, '0', 'DD100088', '4028bc743d43789d013d43b53dcc007e');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b53dfb0081', '2013-03-07 15:16:24', '2013-03-07 15:16:24', null, null, '0', 'DD100089', '4028bc743d43789d013d43b53dcc007f');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b53e590083', '2013-03-07 15:16:24', '2013-03-07 15:16:24', null, null, '0', 'DD100090', '4028bc743d43789d013d43b53e1a0082');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b53f340085', '2013-03-07 15:16:24', '2013-03-07 15:16:24', null, null, '0', 'DD100091', '4028bc743d43789d013d43b53eb70084');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b6f9280087', '2013-03-07 15:18:17', '2013-03-07 15:18:17', null, null, '0', 'DD100092', '4028bc743d43789d013d43b6f9190086');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b6ff140089', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100093', '4028bc743d43789d013d43b6fef50088');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b6ff52008b', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100094', '4028bc743d43789d013d43b6ff33008a');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b6ff91008d', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100095', '4028bc743d43789d013d43b6ff81008c');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b6ffcf0090', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100096', '4028bc743d43789d013d43b6ffa0008e');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b6ffdf0092', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100097', '4028bc743d43789d013d43b6ffb0008f');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b6fffe0093', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100098', '4028bc743d43789d013d43b6ffdf0091');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b7003d0096', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100099', '4028bc743d43789d013d43b7001d0094');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b7005c0097', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100100', '4028bc743d43789d013d43b7002d0095');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b7008b0099', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100101', '4028bc743d43789d013d43b7006c0098');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b700e9009c', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100102', '4028bc743d43789d013d43b7009a009a');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b700f8009e', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100103', '4028bc743d43789d013d43b700ba009b');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b70108009f', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100104', '4028bc743d43789d013d43b700e9009d');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b7015600a1', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100105', '4028bc743d43789d013d43b7013700a0');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b7017500a3', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100106', '4028bc743d43789d013d43b7015600a2');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b701a400a5', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100107', '4028bc743d43789d013d43b7018500a4');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b701d300a7', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100108', '4028bc743d43789d013d43b701b400a6');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b7022100aa', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100109', '4028bc743d43789d013d43b701f200a8');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b7023100ab', '2013-03-07 15:18:19', '2013-03-07 15:18:19', null, null, '0', 'DD100110', '4028bc743d43789d013d43b7020200a9');
INSERT INTO `xx_order_log` VALUES ('4028bc743d43789d013d43b7026000ad', '2013-03-07 15:18:20', '2013-03-07 15:18:20', null, null, '0', 'DD100111', '4028bc743d43789d013d43b7023100ac');
INSERT INTO `xx_order_log` VALUES ('4028bc743d5718d0013d57e249df0001', '2013-03-11 13:18:00', '2013-03-11 13:18:00', null, null, '0', 'DD100126', '4028bc743d5718d0013d57e249910000');
INSERT INTO `xx_order_log` VALUES ('4028bc743d5718d0013d57f4e9930004', '2013-03-11 13:38:21', '2013-03-11 13:38:21', null, null, '0', 'DD100127', '4028bc743d5718d0013d57f4e9730003');
INSERT INTO `xx_order_log` VALUES ('4028bc743d5718d0013d57f4eb870006', '2013-03-11 13:38:21', '2013-03-11 13:38:21', null, null, '0', 'DD100128', '4028bc743d5718d0013d57f4eb770005');
INSERT INTO `xx_order_log` VALUES ('4028bc743d5718d0013d57f4f20f0008', '2013-03-11 13:38:23', '2013-03-11 13:38:23', null, null, '0', 'DD100129', '4028bc743d5718d0013d57f4f1ef0007');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a51ef250003', '2013-03-24 10:54:53', '2013-03-24 10:54:53', null, null, '0', 'DD100165', '4028bc743d9a4d37013d9a51eef60002');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a5291cd0005', '2013-03-24 10:55:35', '2013-03-24 10:55:35', null, null, '0', 'DD100166', '4028bc743d9a4d37013d9a5291be0004');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a532b6d0007', '2013-03-24 10:56:14', '2013-03-24 10:56:14', null, null, '0', 'DD100167', '4028bc743d9a4d37013d9a532b5e0006');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a539439000a', '2013-03-24 10:56:41', '2013-03-24 10:56:41', null, null, '0', 'DD100168', '4028bc743d9a4d37013d9a5393eb0008');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a539449000c', '2013-03-24 10:56:41', '2013-03-24 10:56:41', null, null, '0', 'DD100169', '4028bc743d9a4d37013d9a53941a0009');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a539468000e', '2013-03-24 10:56:41', '2013-03-24 10:56:41', null, null, '0', 'DD100171', '4028bc743d9a4d37013d9a539449000d');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a539478000f', '2013-03-24 10:56:41', '2013-03-24 10:56:41', null, null, '0', 'DD100170', '4028bc743d9a4d37013d9a539439000b');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a54471e0011', '2013-03-24 10:57:27', '2013-03-24 10:57:27', null, null, '0', 'DD100172', '4028bc743d9a4d37013d9a5446ff0010');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a54474d0013', '2013-03-24 10:57:27', '2013-03-24 10:57:27', null, null, '0', 'DD100173', '4028bc743d9a4d37013d9a54472e0012');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a54478c0015', '2013-03-24 10:57:27', '2013-03-24 10:57:27', null, null, '0', 'DD100174', '4028bc743d9a4d37013d9a54477c0014');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a5447ab0017', '2013-03-24 10:57:27', '2013-03-24 10:57:27', null, null, '0', 'DD100175', '4028bc743d9a4d37013d9a54479b0016');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a5d66720019', '2013-03-24 11:07:25', '2013-03-24 11:07:25', null, null, '0', 'DD100176', '4028bc743d9a4d37013d9a5d66430018');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a5d66a1001c', '2013-03-24 11:07:25', '2013-03-24 11:07:25', null, null, '0', 'DD100177', '4028bc743d9a4d37013d9a5d6672001a');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a5d66a1001d', '2013-03-24 11:07:25', '2013-03-24 11:07:25', null, null, '0', 'DD100178', '4028bc743d9a4d37013d9a5d6691001b');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a5d66df001f', '2013-03-24 11:07:25', '2013-03-24 11:07:25', null, null, '0', 'DD100179', '4028bc743d9a4d37013d9a5d66b1001e');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a5ebd960021', '2013-03-24 11:08:53', '2013-03-24 11:08:53', null, null, '0', 'DD100180', '4028bc743d9a4d37013d9a5ebd770020');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a64d19e0023', '2013-03-24 11:15:31', '2013-03-24 11:15:31', null, null, '0', 'DD100181', '4028bc743d9a4d37013d9a64d17e0022');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a6505ae0025', '2013-03-24 11:15:44', '2013-03-24 11:15:44', null, null, '0', 'DD100182', '4028bc743d9a4d37013d9a65059e0024');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a6828d70027', '2013-03-24 11:19:10', '2013-03-24 11:19:10', null, null, '0', 'DD100183', '4028bc743d9a4d37013d9a6828b80026');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a6926de0029', '2013-03-24 11:20:15', '2013-03-24 11:20:15', null, null, '0', 'DD100184', '4028bc743d9a4d37013d9a6926af0028');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a6c538d002b', '2013-03-24 11:23:43', '2013-03-24 11:23:43', null, null, '0', 'DD100185', '4028bc743d9a4d37013d9a6c534f002a');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a6d78d3002d', '2013-03-24 11:24:58', '2013-03-24 11:24:58', null, null, '0', 'DD100186', '4028bc743d9a4d37013d9a6d78b4002c');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a7236b1002f', '2013-03-24 11:30:09', '2013-03-24 11:30:09', null, null, '0', 'DD100187', '4028bc743d9a4d37013d9a723692002e');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a74143b0031', '2013-03-24 11:32:11', '2013-03-24 11:32:11', null, null, '0', 'DD100188', '4028bc743d9a4d37013d9a74141c0030');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a7dac690033', '2013-03-24 11:42:40', '2013-03-24 11:42:40', null, null, '0', 'DD100189', '4028bc743d9a4d37013d9a7dac490032');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a4d37013d9a7de50d0035', '2013-03-24 11:42:54', '2013-03-24 11:42:54', null, null, '0', 'DD100190', '4028bc743d9a4d37013d9a7de4fd0034');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9a81ffd50002', '2013-03-24 11:47:23', '2013-03-24 11:47:23', null, null, '0', 'DD100191', '4028bc743d9a7f0a013d9a81ffb50001');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9a82205d0004', '2013-03-24 11:47:32', '2013-03-24 11:47:32', null, null, '0', 'DD100192', '4028bc743d9a7f0a013d9a82203d0003');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9a83d10a0006', '2013-03-24 11:49:22', '2013-03-24 11:49:22', null, null, '0', 'DD100193', '4028bc743d9a7f0a013d9a83d0db0005');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9a86f9730008', '2013-03-24 11:52:49', '2013-03-24 11:52:49', null, null, '0', 'DD100194', '4028bc743d9a7f0a013d9a86f9540007');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9adcad93000b', '2013-03-24 13:26:26', '2013-03-24 13:26:26', null, null, '0', 'DD100195', '4028bc743d9a7f0a013d9adcad74000a');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9ade2714000d', '2013-03-24 13:28:03', '2013-03-24 13:28:03', null, null, '0', 'DD100196', '4028bc743d9a7f0a013d9ade26f5000c');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9ade4d97000f', '2013-03-24 13:28:12', '2013-03-24 13:28:12', null, null, '0', 'DD100197', '4028bc743d9a7f0a013d9ade4d78000e');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9adee35f0011', '2013-03-24 13:28:51', '2013-03-24 13:28:51', null, null, '0', 'DD100198', '4028bc743d9a7f0a013d9adee3300010');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b179bc20014', '2013-03-24 14:30:48', '2013-03-24 14:30:48', null, null, '0', 'DD100199', '4028bc743d9a7f0a013d9b179ba30013');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b17ee080016', '2013-03-24 14:31:09', '2013-03-24 14:31:09', null, null, '0', 'DD100200', '4028bc743d9a7f0a013d9b17edd90015');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b1816ed0018', '2013-03-24 14:31:20', '2013-03-24 14:31:20', null, null, '0', 'DD100201', '4028bc743d9a7f0a013d9b1816be0017');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b194e25001a', '2013-03-24 14:32:39', '2013-03-24 14:32:39', null, null, '0', 'DD100202', '4028bc743d9a7f0a013d9b194e060019');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b194ea2001d', '2013-03-24 14:32:39', '2013-03-24 14:32:39', null, null, '0', 'DD100203', '4028bc743d9a7f0a013d9b194e73001b');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b194eb2001f', '2013-03-24 14:32:39', '2013-03-24 14:32:39', null, null, '0', 'DD100204', '4028bc743d9a7f0a013d9b194e92001c');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b194ec10020', '2013-03-24 14:32:39', '2013-03-24 14:32:39', null, null, '0', 'DD100205', '4028bc743d9a7f0a013d9b194ea2001e');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b1969ac0023', '2013-03-24 14:32:46', '2013-03-24 14:32:46', null, null, '0', 'DD100206', '4028bc743d9a7f0a013d9b19698d0021');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b1969cb0024', '2013-03-24 14:32:46', '2013-03-24 14:32:46', null, null, '0', 'DD100207', '4028bc743d9a7f0a013d9b1969ac0022');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b196a190027', '2013-03-24 14:32:46', '2013-03-24 14:32:46', null, null, '0', 'DD100209', '4028bc743d9a7f0a013d9b1969ea0026');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b196a190028', '2013-03-24 14:32:46', '2013-03-24 14:32:46', null, null, '0', 'DD100208', '4028bc743d9a7f0a013d9b1969db0025');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b197b5f002a', '2013-03-24 14:32:51', '2013-03-24 14:32:51', null, null, '0', 'DD100210', '4028bc743d9a7f0a013d9b197b4f0029');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b197b8e002d', '2013-03-24 14:32:51', '2013-03-24 14:32:51', null, null, '0', 'DD100211', '4028bc743d9a7f0a013d9b197b7e002b');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b197bad002f', '2013-03-24 14:32:51', '2013-03-24 14:32:51', null, null, '0', 'DD100212', '4028bc743d9a7f0a013d9b197b8e002c');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b197bbd0030', '2013-03-24 14:32:51', '2013-03-24 14:32:51', null, null, '0', 'DD100213', '4028bc743d9a7f0a013d9b197b9e002e');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b1a01960032', '2013-03-24 14:33:25', '2013-03-24 14:33:25', null, null, '0', 'DD100214', '4028bc743d9a7f0a013d9b1a01770031');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b1a01e50035', '2013-03-24 14:33:25', '2013-03-24 14:33:25', null, null, '0', 'DD100215', '4028bc743d9a7f0a013d9b1a01b60033');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b1a01f40037', '2013-03-24 14:33:25', '2013-03-24 14:33:25', null, null, '0', 'DD100216', '4028bc743d9a7f0a013d9b1a01e50034');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b1a02040038', '2013-03-24 14:33:25', '2013-03-24 14:33:25', null, null, '0', 'DD100217', '4028bc743d9a7f0a013d9b1a01f40036');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b1a0e1a003a', '2013-03-24 14:33:28', '2013-03-24 14:33:28', null, null, '0', 'DD100218', '4028bc743d9a7f0a013d9b1a0dfa0039');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b1a0e48003c', '2013-03-24 14:33:28', '2013-03-24 14:33:28', null, null, '0', 'DD100219', '4028bc743d9a7f0a013d9b1a0e29003b');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b1a0e77003f', '2013-03-24 14:33:28', '2013-03-24 14:33:28', null, null, '0', 'DD100220', '4028bc743d9a7f0a013d9b1a0e58003d');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b1a0e870040', '2013-03-24 14:33:28', '2013-03-24 14:33:28', null, null, '0', 'DD100221', '4028bc743d9a7f0a013d9b1a0e68003e');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b1a155d0043', '2013-03-24 14:33:30', '2013-03-24 14:33:30', null, null, '0', 'DD100222', '4028bc743d9a7f0a013d9b1a152e0041');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b1a156d0045', '2013-03-24 14:33:30', '2013-03-24 14:33:30', null, null, '0', 'DD100223', '4028bc743d9a7f0a013d9b1a154d0042');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b1a15bb0047', '2013-03-24 14:33:30', '2013-03-24 14:33:30', null, null, '0', 'DD100225', '4028bc743d9a7f0a013d9b1a156d0046');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b1a15da0048', '2013-03-24 14:33:30', '2013-03-24 14:33:30', null, null, '0', 'DD100224', '4028bc743d9a7f0a013d9b1a156d0044');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b21e618004b', '2013-03-24 14:42:02', '2013-03-24 14:42:02', null, null, '0', 'DD100226', '4028bc743d9a7f0a013d9b21e5f90049');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b21e628004c', '2013-03-24 14:42:02', '2013-03-24 14:42:02', null, null, '0', 'DD100227', '4028bc743d9a7f0a013d9b21e618004a');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b21e667004f', '2013-03-24 14:42:02', '2013-03-24 14:42:02', null, null, '0', 'DD100228', '4028bc743d9a7f0a013d9b21e657004d');
INSERT INTO `xx_order_log` VALUES ('4028bc743d9a7f0a013d9b21e6860050', '2013-03-24 14:42:03', '2013-03-24 14:42:03', null, null, '0', 'DD100229', '4028bc743d9a7f0a013d9b21e667004e');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5a51b013da5a68ddc0001', '2013-03-26 15:43:08', '2013-03-26 15:43:08', null, null, '0', 'DD100238', '4028bc743da5a51b013da5a68d8e0000');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5a51b013da5af63d20003', '2013-03-26 15:52:47', '2013-03-26 15:52:47', null, null, '0', 'DD100239', '4028bc743da5a51b013da5af63c30002');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5a51b013da5b027900005', '2013-03-26 15:53:37', '2013-03-26 15:53:37', null, null, '0', 'DD100240', '4028bc743da5a51b013da5b027610004');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5b0f3013da5b175e90002', '2013-03-26 15:55:03', '2013-03-26 15:55:03', null, null, '0', 'DD100241', '4028bc743da5b0f3013da5b175ca0001');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5b0f3013da5b25f9e0004', '2013-03-26 15:56:03', '2013-03-26 15:56:03', null, null, '0', 'DD100242', '4028bc743da5b0f3013da5b25f7e0003');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5b0f3013da5bc524f0006', '2013-03-26 16:06:55', '2013-03-26 16:06:55', null, null, '0', 'DD100243', '4028bc743da5b0f3013da5bc522f0005');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5b0f3013da5be9d290008', '2013-03-26 16:09:25', '2013-03-26 16:09:25', null, null, '0', 'DD100244', '4028bc743da5b0f3013da5be9ceb0007');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5b0f3013da5c214fa000a', '2013-03-26 16:13:12', '2013-03-26 16:13:12', null, null, '0', 'DD100245', '4028bc743da5b0f3013da5c214db0009');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5b0f3013da5cb3c4d000c', '2013-03-26 16:23:12', '2013-03-26 16:23:12', null, null, '0', 'DD100246', '4028bc743da5b0f3013da5cb3c2e000b');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5b0f3013da5d10f16000e', '2013-03-26 16:29:34', '2013-03-26 16:29:34', null, null, '0', 'DD100247', '4028bc743da5b0f3013da5d10ef6000d');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5b0f3013da5d199b20010', '2013-03-26 16:30:09', '2013-03-26 16:30:09', null, null, '0', 'DD100248', '4028bc743da5b0f3013da5d19983000f');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5b0f3013da5d1e6a90012', '2013-03-26 16:30:29', '2013-03-26 16:30:29', null, null, '0', 'DD100249', '4028bc743da5b0f3013da5d1e65b0011');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5b0f3013da5d73adb0014', '2013-03-26 16:36:18', '2013-03-26 16:36:18', null, null, '0', 'DD100250', '4028bc743da5b0f3013da5d73acc0013');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5b0f3013da5d8adb50016', '2013-03-26 16:37:53', '2013-03-26 16:37:53', null, null, '0', 'DD100251', '4028bc743da5b0f3013da5d8ad960015');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5b0f3013da5dece8e0018', '2013-03-26 16:44:35', '2013-03-26 16:44:35', null, null, '0', 'DD100252', '4028bc743da5b0f3013da5dece6f0017');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5b0f3013da5fb72b5001b', '2013-03-26 17:15:52', '2013-03-26 17:15:52', null, null, '0', 'DD100253', '4028bc743da5b0f3013da5fb7296001a');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5b0f3013da6103e22001d', '2013-03-26 17:38:35', '2013-03-26 17:38:35', null, null, '0', 'DD100254', '4028bc743da5b0f3013da6103e03001c');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5b0f3013da6223c75001f', '2013-03-26 17:58:14', '2013-03-26 17:58:14', null, null, '0', 'DD100255', '4028bc743da5b0f3013da6223c56001e');
INSERT INTO `xx_order_log` VALUES ('4028bc743da5b0f3013da62322dd0021', '2013-03-26 17:59:13', '2013-03-26 17:59:13', null, null, '0', 'DD100256', '4028bc743da5b0f3013da62322ce0020');
INSERT INTO `xx_order_log` VALUES ('4028bc743da625e1013da62736910002', '2013-03-26 18:03:40', '2013-03-26 18:03:40', null, null, '0', 'DD100257', '4028bc743da625e1013da62736710001');
INSERT INTO `xx_order_log` VALUES ('4028bc743daa389c013daa3b42240001', '2013-03-27 13:04:03', '2013-03-27 13:04:03', null, null, '0', 'DD100258', '4028bc743daa389c013daa3b41f50000');
INSERT INTO `xx_order_log` VALUES ('4028bc743daa389c013daa3be28a0003', '2013-03-27 13:04:44', '2013-03-27 13:04:44', null, null, '0', 'DD100259', '4028bc743daa389c013daa3be24c0002');
INSERT INTO `xx_order_log` VALUES ('4028bc743daa389c013daa3dff010005', '2013-03-27 13:07:02', '2013-03-27 13:07:02', null, null, '0', 'DD100260', '4028bc743daa389c013daa3dfec30004');
INSERT INTO `xx_order_log` VALUES ('4028bc743daa389c013daa4167a00007', '2013-03-27 13:10:45', '2013-03-27 13:10:45', null, null, '0', 'DD100261', '4028bc743daa389c013daa4167810006');
INSERT INTO `xx_order_log` VALUES ('4028bc743daa389c013daa41bb5e000a', '2013-03-27 13:11:07', '2013-03-27 13:11:07', null, null, '0', 'DD100262', '4028bc743daa389c013daa41bb3e0008');
INSERT INTO `xx_order_log` VALUES ('4028bc743daa389c013daa41bb6d000b', '2013-03-27 13:11:07', '2013-03-27 13:11:07', null, null, '0', 'DD100263', '4028bc743daa389c013daa41bb4e0009');
INSERT INTO `xx_order_log` VALUES ('4028bc743daa389c013daa46afbd000d', '2013-03-27 13:16:32', '2013-03-27 13:16:32', null, null, '0', 'DD100264', '4028bc743daa389c013daa46af9d000c');
INSERT INTO `xx_order_log` VALUES ('8a8f82ad3d87c40f013d87d02af40001', '2013-03-20 20:39:59', '2013-03-20 20:39:59', null, null, '0', 'DD100156', '8a8f82ad3d87c40f013d87d02a440000');
INSERT INTO `xx_order_log` VALUES ('8a8f82ad3d87c40f013d87d043140003', '2013-03-20 20:40:05', '2013-03-20 20:40:05', null, null, '0', 'DD100157', '8a8f82ad3d87c40f013d87d042ed0002');
INSERT INTO `xx_order_log` VALUES ('8a8f82ad3d87c40f013d87d051240005', '2013-03-20 20:40:09', '2013-03-20 20:40:09', null, null, '0', 'DD100158', '8a8f82ad3d87c40f013d87d050cd0004');
INSERT INTO `xx_order_log` VALUES ('8a8f82ad3d87c40f013d87d9cb6d0007', '2013-03-20 20:50:30', '2013-03-20 20:50:30', null, null, '0', 'DD100159', '8a8f82ad3d87c40f013d87d9cb460006');
INSERT INTO `xx_order_log` VALUES ('8a8f82ad3d87c40f013d87da0c2e0009', '2013-03-20 20:50:46', '2013-03-20 20:50:46', null, null, '0', 'DD100160', '8a8f82ad3d87c40f013d87da0c110008');
INSERT INTO `xx_order_log` VALUES ('8a8f82ad3d87c40f013d87daabe1000b', '2013-03-20 20:51:27', '2013-03-20 20:51:27', null, null, '0', 'DD100161', '8a8f82ad3d87c40f013d87daabc1000a');
INSERT INTO `xx_order_log` VALUES ('8a8f82ad3d87c40f013d87dab509000d', '2013-03-20 20:51:30', '2013-03-20 20:51:30', null, null, '0', 'DD100162', '8a8f82ad3d87c40f013d87dab0c1000c');
INSERT INTO `xx_order_log` VALUES ('8a8f82ad3d87c40f013d87daea6f000f', '2013-03-20 20:51:43', '2013-03-20 20:51:43', null, null, '0', 'DD100163', '8a8f82ad3d87c40f013d87daea3b000e');
INSERT INTO `xx_order_log` VALUES ('8a8f82ad3d87c40f013d87daef980011', '2013-03-20 20:51:45', '2013-03-20 20:51:45', null, null, '0', 'DD100164', '8a8f82ad3d87c40f013d87daef790010');
INSERT INTO `xx_order_log` VALUES ('8a8f82ad3d87c40f013d87dd78170012', '2013-03-20 20:54:31', '2013-03-20 20:54:31', '订单完成,获得积分: ', 'admin', '3', 'DD100163', '8a8f82ad3d87c40f013d87daea3b000e');
INSERT INTO `xx_order_log` VALUES ('8a8f82cc3d5936a7013d59cd131c0004', '2013-03-11 22:14:04', '2013-03-11 22:14:04', null, null, '0', 'DD100130', '8a8f82cc3d5936a7013d59cd129b0003');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5ebd81770002', '2013-03-12 21:15:10', '2013-03-12 21:15:10', null, null, '0', 'DD100131', '8a8f82de3d5e89c6013d5ebd81010001');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5ebeb8550004', '2013-03-12 21:16:30', '2013-03-12 21:16:30', null, null, '0', 'DD100132', '8a8f82de3d5e89c6013d5ebeb8340003');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5ebeed290006', '2013-03-12 21:16:43', '2013-03-12 21:16:43', null, null, '0', 'DD100133', '8a8f82de3d5e89c6013d5ebeecd70005');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5ebeeffb0008', '2013-03-12 21:16:44', '2013-03-12 21:16:44', null, null, '0', 'DD100134', '8a8f82de3d5e89c6013d5ebeefd50007');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5ed24be4000a', '2013-03-12 21:37:53', '2013-03-12 21:37:53', null, null, '0', 'DD100135', '8a8f82de3d5e89c6013d5ed24baa0009');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5ed24eb6000c', '2013-03-12 21:37:53', '2013-03-12 21:37:53', null, null, '0', 'DD100136', '8a8f82de3d5e89c6013d5ed24e95000b');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5ed88964000e', '2013-03-12 21:44:42', '2013-03-12 21:44:42', null, null, '0', 'DD100137', '8a8f82de3d5e89c6013d5ed87c17000d');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5edc10f60010', '2013-03-12 21:48:33', '2013-03-12 21:48:33', null, null, '0', 'DD100138', '8a8f82de3d5e89c6013d5edc10ce000f');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5ee1af5b0012', '2013-03-12 21:54:41', '2013-03-12 21:54:41', null, null, '0', 'DD100139', '8a8f82de3d5e89c6013d5ee1af3d0011');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5ee265e70014', '2013-03-12 21:55:28', '2013-03-12 21:55:28', null, null, '0', 'DD100140', '8a8f82de3d5e89c6013d5ee265c10013');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5ee2b8df0016', '2013-03-12 21:55:49', '2013-03-12 21:55:49', null, null, '0', 'DD100141', '8a8f82de3d5e89c6013d5ee2b8620015');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5ee315a30018', '2013-03-12 21:56:13', '2013-03-12 21:56:13', null, null, '0', 'DD100142', '8a8f82de3d5e89c6013d5ee3157b0017');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5ee40df6001a', '2013-03-12 21:57:16', '2013-03-12 21:57:16', null, null, '0', 'DD100143', '8a8f82de3d5e89c6013d5ee40d8a0019');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5ee426b4001c', '2013-03-12 21:57:23', '2013-03-12 21:57:23', null, null, '0', 'DD100144', '8a8f82de3d5e89c6013d5ee4266d001b');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5ee530a7001e', '2013-03-12 21:58:31', '2013-03-12 21:58:31', null, null, '0', 'DD100145', '8a8f82de3d5e89c6013d5ee53072001d');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5ee655ea0020', '2013-03-12 21:59:46', '2013-03-12 21:59:46', null, null, '0', 'DD100146', '8a8f82de3d5e89c6013d5ee64c31001f');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5ee7097d0022', '2013-03-12 22:00:32', '2013-03-12 22:00:32', null, null, '0', 'DD100147', '8a8f82de3d5e89c6013d5ee709580021');
INSERT INTO `xx_order_log` VALUES ('8a8f82de3d5e89c6013d5eee27480024', '2013-03-12 22:08:18', '2013-03-12 22:08:18', null, null, '0', 'DD100148', '8a8f82de3d5e89c6013d5eee26fd0023');
INSERT INTO `xx_order_log` VALUES ('8a9180943d49fba2013d49fee1f30014', '2013-03-08 20:34:33', '2013-03-08 20:34:33', null, null, '0', 'DD100112', '8a9180943d49fba2013d49fee1d10013');
INSERT INTO `xx_order_log` VALUES ('8a9180943d49fba2013d49fee2320017', '2013-03-08 20:34:33', '2013-03-08 20:34:33', null, null, '0', 'DD100114', '8a9180943d49fba2013d49fee2090016');
INSERT INTO `xx_order_log` VALUES ('8a9180943d49fba2013d49fee2350018', '2013-03-08 20:34:33', '2013-03-08 20:34:33', null, null, '0', 'DD100113', '8a9180943d49fba2013d49fee1f30015');
INSERT INTO `xx_order_log` VALUES ('8a9180943d49fba2013d49fee27a001b', '2013-03-08 20:34:33', '2013-03-08 20:34:33', null, null, '0', 'DD100115', '8a9180943d49fba2013d49fee2390019');
INSERT INTO `xx_order_log` VALUES ('8a9180943d49fba2013d49fee299001c', '2013-03-08 20:34:33', '2013-03-08 20:34:33', null, null, '0', 'DD100116', '8a9180943d49fba2013d49fee26b001a');
INSERT INTO `xx_order_log` VALUES ('8a9180943d49fba2013d49fee2f2001e', '2013-03-08 20:34:33', '2013-03-08 20:34:33', null, null, '0', 'DD100117', '8a9180943d49fba2013d49fee29b001d');
INSERT INTO `xx_order_log` VALUES ('8a9180943d49fba2013d49fee6770020', '2013-03-08 20:34:34', '2013-03-08 20:34:34', null, null, '0', 'DD100118', '8a9180943d49fba2013d49fee64d001f');
INSERT INTO `xx_order_log` VALUES ('8a9180943d49fba2013d4a1439100022', '2013-03-08 20:57:52', '2013-03-08 20:57:52', null, null, '0', 'DD100119', '8a9180943d49fba2013d4a1438ef0021');
INSERT INTO `xx_order_log` VALUES ('8a9180943d49fba2013d4a143fd50024', '2013-03-08 20:57:53', '2013-03-08 20:57:53', null, null, '0', 'DD100120', '8a9180943d49fba2013d4a143fb00023');
INSERT INTO `xx_order_log` VALUES ('8a9180943d49fba2013d4a18c4690026', '2013-03-08 21:02:49', '2013-03-08 21:02:49', null, null, '0', 'DD100121', '8a9180943d49fba2013d4a18c43c0025');
INSERT INTO `xx_order_log` VALUES ('8a9180943d49fba2013d4a18cd8d0029', '2013-03-08 21:02:52', '2013-03-08 21:02:52', null, null, '0', 'DD100122', '8a9180943d49fba2013d4a18cd640027');
INSERT INTO `xx_order_log` VALUES ('8a9180943d49fba2013d4a18cda3002a', '2013-03-08 21:02:52', '2013-03-08 21:02:52', null, null, '0', 'DD100123', '8a9180943d49fba2013d4a18cd790028');
INSERT INTO `xx_order_log` VALUES ('8a9180943d49fba2013d4a23d46f002c', '2013-03-08 21:14:54', '2013-03-08 21:14:54', null, null, '0', 'DD100124', '8a9180943d49fba2013d4a23d448002b');
INSERT INTO `xx_order_log` VALUES ('8a9180943d49fba2013d4a33b27b002e', '2013-03-08 21:32:14', '2013-03-08 21:32:14', null, null, '0', 'DD100125', '8a9180943d49fba2013d4a33b254002d');
INSERT INTO `xx_order_log` VALUES ('8a9182d53da1ef55013da1f12bef0006', '2013-03-25 22:26:10', '2013-03-25 22:26:10', null, null, '0', 'DD100230', '8a9182d53da1ef55013da1f12b5c0005');
INSERT INTO `xx_order_log` VALUES ('8a9182d53da1ef55013da1f1fca80008', '2013-03-25 22:27:03', '2013-03-25 22:27:03', null, null, '0', 'DD100231', '8a9182d53da1ef55013da1f1fc6d0007');
INSERT INTO `xx_order_log` VALUES ('8a9182d53da1f91f013da231d91a0005', '2013-03-25 23:36:48', '2013-03-25 23:36:48', null, null, '0', 'DD100232', '8a9182d53da1f91f013da231d8eb0004');
INSERT INTO `xx_order_log` VALUES ('8a9182d53da1f91f013da23232a60007', '2013-03-25 23:37:11', '2013-03-25 23:37:11', null, null, '0', 'DD100233', '8a9182d53da1f91f013da23232770006');
INSERT INTO `xx_order_log` VALUES ('8a9182d53da25181013da2526ff80002', '2013-03-26 00:12:24', '2013-03-26 00:12:24', null, null, '0', 'DD100234', '8a9182d53da25181013da2526fb20001');
INSERT INTO `xx_order_log` VALUES ('8a9182d53da25923013da259c0640002', '2013-03-26 00:20:23', '2013-03-26 00:20:23', null, null, '0', 'DD100235', '8a9182d53da25923013da259c02c0001');
INSERT INTO `xx_order_log` VALUES ('8a9182d53da25923013da25c30de0004', '2013-03-26 00:23:03', '2013-03-26 00:23:03', null, null, '0', 'DD100236', '8a9182d53da25923013da25c306a0003');
INSERT INTO `xx_order_log` VALUES ('8a9182d53da25923013da25ec4990006', '2013-03-26 00:25:52', '2013-03-26 00:25:52', null, null, '0', 'DD100237', '8a9182d53da25923013da25ec46c0005');
INSERT INTO `xx_order_log` VALUES ('8a91838c3dba892b013dba89fba00001', '2013-03-30 17:03:57', '2013-03-30 17:03:57', null, null, '0', 'DD100265', '8a91838c3dba892b013dba89fb120000');
INSERT INTO `xx_order_log` VALUES ('ff8080813d8323f4013d833259220003', '2013-03-19 23:09:07', '2013-03-19 23:09:07', null, null, '0', 'DD100149', 'ff8080813d8323f4013d833258d70002');
INSERT INTO `xx_order_log` VALUES ('ff8080813d8323f4013d837041e5000a', '2013-03-20 00:16:45', '2013-03-20 00:16:45', null, null, '0', 'DD100150', 'ff8080813d8323f4013d83703a9d0009');
INSERT INTO `xx_order_log` VALUES ('ff8080813d8323f4013d8393c2c4000c', '2013-03-20 00:55:31', '2013-03-20 00:55:31', null, null, '0', 'DD100151', 'ff8080813d8323f4013d8393c271000b');
INSERT INTO `xx_order_log` VALUES ('ff8080813d8323f4013d839425f3000e', '2013-03-20 00:55:57', '2013-03-20 00:55:57', null, null, '0', 'DD100152', 'ff8080813d8323f4013d839425cb000d');
INSERT INTO `xx_order_log` VALUES ('ff8080813d8323f4013d839563350010', '2013-03-20 00:57:18', '2013-03-20 00:57:18', null, null, '0', 'DD100153', 'ff8080813d8323f4013d83956315000f');
INSERT INTO `xx_order_log` VALUES ('ff8080813d8323f4013d8397ec200012', '2013-03-20 01:00:04', '2013-03-20 01:00:04', null, null, '0', 'DD100154', 'ff8080813d8323f4013d8397ebf10011');
INSERT INTO `xx_order_log` VALUES ('ff8080813d8323f4013d839817ee0014', '2013-03-20 01:00:15', '2013-03-20 01:00:15', null, null, '0', 'DD100155', 'ff8080813d8323f4013d839817ce0013');

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
INSERT INTO `xx_payment_config` VALUES ('4028bc743bac0d54013baca8729d0000', '2012-12-18 14:16:58', '2013-03-26 17:52:45', '10011842896', 'bkl7rfb9lx90f3ket5rbrabcvffqjet7pt994fkdh3ig3oynlrvffeja4nvj', '<span style=\"color:#666666;font-family:\'tahoma, Arial, 宋体, Verdana, sans-serif\';\"><span style=\"line-height:25px;\">通道2</span></span>', '', '', '通道2', '2', '2', '0.00000', '0', 'yeepayforzy');
INSERT INTO `xx_payment_config` VALUES ('4028bc743bac0d54013baca8e1350001', '2012-12-18 14:17:27', '2013-03-07 16:37:34', 'A830527', 'SQgcsSPePCmYwjIXNOBaUs8u99mL7vN8', '<span style=\"color:#666666;font-family:\'tahoma, Arial, 宋体, Verdana, sans-serif\';\"><span style=\"line-height:25px;\">通道1</span></span>', '', '', '通道1', '1', '2', '0.00000', '0', 'ofpay');
INSERT INTO `xx_payment_config` VALUES ('4028bc743d235d03013d23d5aaee0003', '2013-03-01 10:43:58', '2013-03-01 10:43:58', '181686', 'lj7qosczbmgy68idn95lb8ugdnh64cxht5o7g21m8duc0zcmdp', '通道3', '', '', '通道3', '3', '2', '0.00000', '0', 'szfpay');

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
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacaced380003', '2012-12-18 14:21:52', '2013-01-17 10:42:02', '000101', '0.9700', null, 'admin', '8ae4839c3a887878013a88aca0800003', '4028bc743bac0d54013baca8e1350001', '10,20,30,50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacad51510004', '2012-12-18 14:22:17', '2013-01-17 10:42:23', '000201', '0.9600', null, 'admin', '8ae4839c3a887878013a88ad18e10006', '4028bc743bac0d54013baca8e1350001', '10,20,30,50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb048980005', '2012-12-18 14:25:32', '2013-01-17 11:08:32', '000501', '0.8550', null, 'admin', '8ae4839c3a887878013a88a15b0f0001', '4028bc743bac0d54013baca8e1350001', '5,6,10,15,30,50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb11b0b0006', '2012-12-18 14:26:26', '2013-01-17 10:43:28', '000601', '0.8700', null, 'admin', '8ae4839c3a887878013a88ac6eb10002', '4028bc743bac0d54013baca8e1350001', '5,10,15,25,30,35,45,50,100,300,350,1000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb174950007', '2012-12-18 14:26:49', '2013-01-17 10:43:54', '000701', '0.8150', null, 'admin', '8ae4839c3a887878013a88acef930005', '4028bc743bac0d54013baca8e1350001', '5,10,15,30,60,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb1f9550008', '2012-12-18 14:27:23', '2013-01-17 10:44:20', '000801', '0.8500', null, 'admin', '8ae4839c3a887878013a88ada7f6000a', '4028bc743bac0d54013baca8e1350001', '15,30,50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb2b5140009', '2012-12-18 14:28:11', '2013-01-17 10:44:52', '000901', '0.8500', null, 'admin', '8ae4839c3a887878013a88acc1ef0004', '4028bc743bac0d54013baca8e1350001', '10,15,20,25,30,50,60,100,300,468,500');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb31b9e000a', '2012-12-18 14:28:37', '2013-01-17 10:45:12', '001001', '0.8500', null, 'admin', '8ae4839c3a887878013a88ad845a0009', '4028bc743bac0d54013baca8e1350001', '5,10,15,20,30,50');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb3a792000b', '2012-12-18 14:29:13', '2013-01-17 10:45:27', '001101', '0.8550', null, 'admin', '8ae4839c3a887878013a88add167000b', '4028bc743bac0d54013baca8e1350001', '5,10,15,30,40,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacb4087e000c', '2012-12-18 14:29:38', '2013-01-17 10:45:44', '001201', '0.8200', null, 'admin', '8ae4839c3a887878013a88ad3c100007', '4028bc743bac0d54013baca8e1350001', '5,10,20,25,30,50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc6897e000f', '2012-12-18 14:49:50', '2013-03-27 13:09:58', 'szx', '0.9600', null, 'admin', '8ae4839c3a887878013a88aca0800003', '4028bc743bac0d54013baca8729d0000', '10,20,30,50,100,200,300,500,1000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc6e4410010', '2012-12-18 14:50:13', '2013-03-24 09:27:10', 'unicom', '0.9600', null, 'admin', '8ae4839c3a887878013a88ad18e10006', '4028bc743bac0d54013baca8729d0000', '20,30,50,100,300,500');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc74c510011', '2012-12-18 14:50:40', '2013-03-24 09:30:56', 'telecom', '0.9600', null, 'admin', '8ae4839c3a887878013a88ae0511000c', '4028bc743bac0d54013baca8729d0000', '50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc7e1db0012', '2012-12-18 14:51:18', '2012-12-18 14:51:18', 'junnet', '0.8500', null, 'admin', '8ae4839c3a887878013a88a15b0f0001', '4028bc743bac0d54013baca8729d0000', '0');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc821640013', '2012-12-18 14:51:35', '2013-03-24 09:25:22', 'sndacard', '0.8500', null, 'admin', '8ae4839c3a887878013a88ac6eb10002', '4028bc743bac0d54013baca8729d0000', '5,10,30,35,45,100,350,1000');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc87f340014', '2012-12-18 14:51:59', '2013-03-24 09:26:31', 'zhengtu', '0.8500', null, 'admin', '8ae4839c3a887878013a88acc1ef0004', '4028bc743bac0d54013baca8729d0000', '5,10,15,18,20,25,30,50,60,68,100,120,180,208,250,300,468,500');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc8d9d70015', '2012-12-18 14:52:22', '2013-03-24 09:29:11', 'ypcard', '0.8900', null, 'admin', '8ae4839c3a887878013a88ad61df0008', '4028bc743bac0d54013baca8729d0000', '2,5,7,9,10,15,20,25,30,50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc9340d0016', '2012-12-18 14:52:45', '2013-03-24 09:30:08', 'wanmei', '0.8500', null, 'admin', '8ae4839c3a887878013a88ada7f6000a', '4028bc743bac0d54013baca8729d0000', '15,30,50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc991500017', '2012-12-18 14:53:09', '2013-03-24 09:30:36', 'sohu', '0.8400', null, 'admin', '8ae4839c3a887878013a88add167000b', '4028bc743bac0d54013baca8729d0000', '5,10,15,30,40,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacc9e5a90018', '2012-12-18 14:53:30', '2013-03-24 09:31:28', 'tianxia', '0.8400', null, 'admin', '8ae4839c3a887878013a88ae4be5000e', '4028bc743bac0d54013baca8729d0000', '5,6,10,15,30,50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacca1b400019', '2012-12-18 14:53:44', '2013-03-24 09:31:59', 'zongyou', '0.8400', null, 'admin', '8ae4839c3a887878013a88ae29c8000d', '4028bc743bac0d54013baca8729d0000', '5,10,15,30,50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacca6885001a', '2012-12-18 14:54:04', '2013-03-24 09:32:33', 'tianhong', '0.8400', null, 'admin', '8ae4839c3a887878013a88ae757d000f', '4028bc743bac0d54013baca8729d0000', '5,10,15,20,30,50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013bacca9ec8001b', '2012-12-18 14:54:18', '2013-03-24 09:27:37', 'qqcard', '0.8200', null, 'admin', '8ae4839c3a887878013a88acef930005', '4028bc743bac0d54013baca8729d0000', '5,10,15,20,30,60,100,200');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013baccae16f001c', '2012-12-18 14:54:35', '2013-03-24 09:28:06', 'jiuyou', '0.8100', null, 'admin', '8ae4839c3a887878013a88ad3c100007', '4028bc743bac0d54013baca8729d0000', '5,10,30,50');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743bac0d54013baccb17d0001d', '2012-12-18 14:54:49', '2013-03-24 09:29:43', 'netease', '0.8400', null, 'admin', '8ae4839c3a887878013a88ad845a0009', '4028bc743bac0d54013baca8729d0000', '10,15,20,30,50');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743c46743a013c467b38ec0000', '2013-01-17 11:09:06', '2013-01-17 11:09:23', '000301', '0.9600', null, 'admin', '8ae4839c3a887878013a88ae0511000c', '4028bc743bac0d54013baca8e1350001', '10,20,30,50,100');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743d3856b8013d3873e3a30000', '2013-03-05 10:49:11', '2013-03-24 09:42:23', '0', '0.9500', null, 'admin', '8ae4839c3a887878013a88aca0800003', '4028bc743d235d03013d23d5aaee0003', '10,20,30,50,100,300,500');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743d3856b8013d387430ba0001', '2013-03-05 10:49:31', '2013-03-24 09:42:00', '1', '0.9500', null, 'admin', '8ae4839c3a887878013a88ad18e10006', '4028bc743d235d03013d23d5aaee0003', '20,30,50,100,300,500');
INSERT INTO `xx_payment_discount` VALUES ('4028bc743d3856b8013d387465e30002', '2013-03-05 10:49:45', '2013-03-24 09:41:28', '2', '0.9500', null, 'admin', '8ae4839c3a887878013a88ae0511000c', '4028bc743d235d03013d23d5aaee0003', '10,20,30,50,100,200,300,500');

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
INSERT INTO `xx_product` VALUES ('4028bc743bb6fee6013bb755fed20002', '2012-12-20 16:02:44', '2013-01-16 20:49:41', '', '', '腾讯Q币卡 [5元]', '5.00000', 'SN_A18F88A39EA3', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"orderList\":2,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('4028bc743bb6fee6013bb75600880003', '2012-12-20 16:02:45', '2013-01-16 20:49:41', '', '', '腾讯Q币卡 [10元]', '10.00000', 'SN_EA47F87C7C44', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"orderList\":6,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('4028bc743c3c4340013c3c51db950002', '2013-01-15 11:47:43', '2013-02-03 14:43:54', '', '', '移动充值卡 [10元]', '10.00000', 'SN_0E1F5B480D30', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"orderList\":6,\"imagePath\":null}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('4028bc743c46743a013c467da1220001', '2013-01-17 11:11:43', '2013-01-17 11:11:43', '', '', '骏网一卡通 [5元]', '5.00000', 'SN_50903096ECAC', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"orderList\":2,\"imagePath\":null}]', '4028bc743c3c4340013c3c573891000a');
INSERT INTO `xx_product` VALUES ('4028bc743c46743a013c467da1ae0002', '2013-01-17 11:11:44', '2013-01-17 11:11:44', '', '', '骏网一卡通 [6元]', '6.00000', 'SN_AB0FE0196582', '[{\"name\":\"6元\",\"id\":\"b782681bb2d84adfb44f7f52fc1865fe\",\"orderList\":3,\"imagePath\":null}]', '4028bc743c3c4340013c3c573891000a');
INSERT INTO `xx_product` VALUES ('4028bc743c46743a013c467da1be0003', '2013-01-17 11:11:44', '2013-01-17 11:11:44', '', '', '骏网一卡通 [10元]', '10.00000', 'SN_396B256EFC2D', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"orderList\":6,\"imagePath\":null}]', '4028bc743c3c4340013c3c573891000a');
INSERT INTO `xx_product` VALUES ('4028bc743c46743a013c467da1ce0004', '2013-01-17 11:11:44', '2013-01-17 11:11:44', '', '', '骏网一卡通 [15元]', '15.00000', 'SN_255FADA5497B', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"orderList\":7,\"imagePath\":null}]', '4028bc743c3c4340013c3c573891000a');
INSERT INTO `xx_product` VALUES ('4028bc743c46743a013c467da1ed0005', '2013-01-17 11:11:44', '2013-01-17 11:11:44', '', '', '骏网一卡通 [30元]', '30.00000', 'SN_C13BEA07D2ED', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"orderList\":11,\"imagePath\":null}]', '4028bc743c3c4340013c3c573891000a');
INSERT INTO `xx_product` VALUES ('4028bc743c46743a013c467da20c0006', '2013-01-17 11:11:44', '2013-01-17 11:11:44', '', '', '骏网一卡通 [50元]', '50.00000', 'SN_BACA644FEF93', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"orderList\":15,\"imagePath\":null}]', '4028bc743c3c4340013c3c573891000a');
INSERT INTO `xx_product` VALUES ('4028bc743c46743a013c467da22b0007', '2013-01-17 11:11:44', '2013-01-17 11:11:44', '', '', '骏网一卡通 [100元]', '100.00000', 'SN_97B9F95E285A', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"orderList\":18,\"imagePath\":null}]', '4028bc743c3c4340013c3c573891000a');
INSERT INTO `xx_product` VALUES ('4028bc743d99e919013d9a118d840002', '2013-03-24 09:44:34', '2013-03-24 09:46:21', '', '', '电信充值卡 [10元]', '10.00000', 'SN_60064CD56349', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"orderList\":6,\"imagePath\":null}]', '4028bc743c3c4340013c3c56fe760007');
INSERT INTO `xx_product` VALUES ('4028bc743d99e919013d9a118d930003', '2013-03-24 09:44:34', '2013-03-24 09:46:21', '', '', '电信充值卡 [20元]', '20.00000', 'SN_C92A77D15B3E', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"orderList\":9,\"imagePath\":null}]', '4028bc743c3c4340013c3c56fe760007');
INSERT INTO `xx_product` VALUES ('4028bc743d99e919013d9a118dc20004', '2013-03-24 09:44:34', '2013-03-24 09:46:21', '', '', '电信充值卡 [30元]', '30.00000', 'SN_90E9A55C5579', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"orderList\":11,\"imagePath\":null}]', '4028bc743c3c4340013c3c56fe760007');
INSERT INTO `xx_product` VALUES ('4028bc743d99e919013d9a118dd20005', '2013-03-24 09:44:34', '2013-03-24 09:46:21', '', '', '电信充值卡 [200元]', '200.00000', 'SN_0F9EBA467168', '[{\"name\":\"200元\",\"id\":\"ad57f9d532e44555b4c999ecd20b1b1b\",\"orderList\":21,\"imagePath\":null}]', '4028bc743c3c4340013c3c56fe760007');
INSERT INTO `xx_product` VALUES ('4028bc743d99e919013d9a118df10006', '2013-03-24 09:44:34', '2013-03-24 09:46:21', '', '', '电信充值卡 [300元]', '300.00000', 'SN_B6C3E0D1665E', '[{\"name\":\"300元\",\"id\":\"4025aae4e0964371a22d9227aebd51f3\",\"orderList\":24,\"imagePath\":null}]', '4028bc743c3c4340013c3c56fe760007');
INSERT INTO `xx_product` VALUES ('4028bc743d99e919013d9a118e010007', '2013-03-24 09:44:34', '2013-03-24 09:46:22', '', '', '电信充值卡 [500元]', '500.00000', 'SN_F17A0435B293', '[{\"name\":\"500元\",\"id\":\"05acf907cd0447218f4e615b83709282\",\"orderList\":27,\"imagePath\":null}]', '4028bc743c3c4340013c3c56fe760007');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4316949a0000', '2013-01-16 19:20:18', '2013-01-16 19:20:18', '', '', '网易一卡通 [10元]', '10.00000', 'SN_F67CE9DD9AA5', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c5a4d05002a');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431695c00001', '2013-01-16 19:20:19', '2013-01-16 19:20:19', '', '', '网易一卡通 [15元]', '15.00000', 'SN_A5D5BD7BC6D4', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"imagePath\":null,\"orderList\":7}]', '4028bc743c3c4340013c3c5a4d05002a');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431696000002', '2013-01-16 19:20:19', '2013-01-16 19:20:19', '', '', '网易一卡通 [20元]', '20.00000', 'SN_3A7B33D148FF', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"imagePath\":null,\"orderList\":9}]', '4028bc743c3c4340013c3c5a4d05002a');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431696290003', '2013-01-16 19:20:19', '2013-01-16 19:20:19', '', '', '网易一卡通 [30元]', '30.00000', 'SN_7A44B45BA5B1', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c5a4d05002a');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431697970004', '2013-01-16 19:20:19', '2013-01-16 19:20:19', '', '', '网易一卡通 [50元]', '50.00000', 'SN_BA1D9EBBDED1', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c5a4d05002a');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431afcc40006', '2013-01-16 19:25:07', '2013-01-16 19:25:07', '', '', '久游一卡通 [5元]', '5.00000', 'SN_DEACA0922E18', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"imagePath\":null,\"orderList\":2}]', '4028bc743c3c4340013c3c5a1c310027');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431afda80007', '2013-01-16 19:25:07', '2013-01-16 19:25:07', '', '', '久游一卡通 [10元]', '10.00000', 'SN_A0DE687FE5D6', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c5a1c310027');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431afdd70008', '2013-01-16 19:25:07', '2013-01-16 19:25:07', '', '', '久游一卡通 [30元]', '30.00000', 'SN_F3530C973FFB', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c5a1c310027');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431afdfc0009', '2013-01-16 19:25:07', '2013-01-16 19:25:07', '', '', '久游一卡通 [50元]', '50.00000', 'SN_7E6D5C460594', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c5a1c310027');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431caacb000b', '2013-01-16 19:26:57', '2013-01-16 19:26:57', '', '', '天宏一卡通 [5元]', '5.00000', 'SN_FFEBF1EC6F96', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"imagePath\":null,\"orderList\":2}]', '4028bc743c3c4340013c3c59df180024');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431cabea000c', '2013-01-16 19:26:58', '2013-01-16 19:26:58', '', '', '天宏一卡通 [10元]', '10.00000', 'SN_93494BA751BA', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c59df180024');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431cac1c000d', '2013-01-16 19:26:58', '2013-01-16 19:26:58', '', '', '天宏一卡通 [15元]', '15.00000', 'SN_EC7D52E1FBCA', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"imagePath\":null,\"orderList\":7}]', '4028bc743c3c4340013c3c59df180024');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431cac41000e', '2013-01-16 19:26:58', '2013-01-16 19:26:58', '', '', '天宏一卡通 [20元]', '20.00000', 'SN_4CEBF3D3D37D', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"imagePath\":null,\"orderList\":9}]', '4028bc743c3c4340013c3c59df180024');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431cac6c000f', '2013-01-16 19:26:58', '2013-01-16 19:26:58', '', '', '天宏一卡通 [30元]', '30.00000', 'SN_BEB0597FD710', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c59df180024');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431cac990010', '2013-01-16 19:26:58', '2013-01-16 19:26:58', '', '', '天宏一卡通 [50元]', '50.00000', 'SN_F0CB2B2438B8', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c59df180024');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431cacc70011', '2013-01-16 19:26:58', '2013-01-16 19:26:58', '', '', '天宏一卡通 [100元]', '100.00000', 'SN_C0F32C1417B2', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c59df180024');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431db51a0013', '2013-01-16 19:28:05', '2013-01-16 19:28:05', '', '', '纵游一卡通 [5元]', '5.00000', 'SN_C6BC682212A5', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"imagePath\":null,\"orderList\":2}]', '4028bc743c3c4340013c3c59ae340021');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431db61f0014', '2013-01-16 19:28:06', '2013-01-16 19:28:06', '', '', '纵游一卡通 [10元]', '10.00000', 'SN_AACFB167DA20', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c59ae340021');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431db64e0015', '2013-01-16 19:28:06', '2013-01-16 19:28:06', '', '', '纵游一卡通 [15元]', '15.00000', 'SN_9100DAAF4DB8', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"imagePath\":null,\"orderList\":7}]', '4028bc743c3c4340013c3c59ae340021');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431db6760016', '2013-01-16 19:28:06', '2013-01-16 19:28:06', '', '', '纵游一卡通 [30元]', '30.00000', 'SN_80D11C11831F', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c59ae340021');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431db69b0017', '2013-01-16 19:28:06', '2013-01-16 19:28:06', '', '', '纵游一卡通 [50元]', '50.00000', 'SN_9C5C4EB3CC2B', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c59ae340021');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431db6bd0018', '2013-01-16 19:28:06', '2013-01-16 19:28:06', '', '', '纵游一卡通 [100元]', '100.00000', 'SN_54408A463BE6', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c59ae340021');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431ecfb5001a', '2013-01-16 19:29:18', '2013-01-16 19:29:18', '', '', '天下通一卡通 [5元]', '5.00000', 'SN_08A46C1D6F75', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"imagePath\":null,\"orderList\":2}]', '4028bc743c3c4340013c3c597801001e');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431ed0d5001b', '2013-01-16 19:29:18', '2013-01-16 19:29:18', '', '', '天下通一卡通 [10元]', '10.00000', 'SN_A110E47F697A', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c597801001e');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431ed101001c', '2013-01-16 19:29:18', '2013-01-16 19:29:18', '', '', '天下通一卡通 [15元]', '15.00000', 'SN_F1BB8781EA63', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"imagePath\":null,\"orderList\":7}]', '4028bc743c3c4340013c3c597801001e');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431ed12b001d', '2013-01-16 19:29:18', '2013-01-16 19:29:18', '', '', '天下通一卡通 [20元]', '20.00000', 'SN_A6FD3C3FC403', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"imagePath\":null,\"orderList\":9}]', '4028bc743c3c4340013c3c597801001e');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431ed158001e', '2013-01-16 19:29:18', '2013-01-16 19:29:18', '', '', '天下通一卡通 [30元]', '30.00000', 'SN_1A492BBF6966', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c597801001e');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431ed186001f', '2013-01-16 19:29:18', '2013-01-16 19:29:18', '', '', '天下通一卡通 [50元]', '50.00000', 'SN_EFB8028DDDBA', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c597801001e');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c431ed1a70020', '2013-01-16 19:29:18', '2013-01-16 19:29:18', '', '', '天下通一卡通 [100元]', '100.00000', 'SN_550C6D1600E4', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c597801001e');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43502c4f0022', '2013-01-16 20:23:13', '2013-02-03 15:03:51', '', '', '搜狐一卡通 [5元]', '5.00000', 'SN_01C4164A2680', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"orderList\":2,\"imagePath\":null}]', '4028bc743c3c4340013c3c593eb2001b');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43502d980023', '2013-01-16 20:23:13', '2013-02-03 15:03:51', '', '', '搜狐一卡通 [10元]', '10.00000', 'SN_D7452EE979DE', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"orderList\":6,\"imagePath\":null}]', '4028bc743c3c4340013c3c593eb2001b');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43502dc90024', '2013-01-16 20:23:13', '2013-02-03 15:03:51', '', '', '搜狐一卡通 [15元]', '15.00000', 'SN_6FB041C596A2', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"orderList\":7,\"imagePath\":null}]', '4028bc743c3c4340013c3c593eb2001b');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43502df10025', '2013-01-16 20:23:13', '2013-02-03 15:03:51', '', '', '搜狐一卡通 [30元]', '30.00000', 'SN_351EFEB1CFB0', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"orderList\":11,\"imagePath\":null}]', '4028bc743c3c4340013c3c593eb2001b');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43502e1e0026', '2013-01-16 20:23:13', '2013-02-03 15:03:51', '', '', '搜狐一卡通 [40元]', '40.00000', 'SN_7065A467B353', '[{\"name\":\"40元\",\"id\":\"0fb15579801b495aaec443489d1c29d3\",\"orderList\":13,\"imagePath\":null}]', '4028bc743c3c4340013c3c593eb2001b');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43502e4b0027', '2013-01-16 20:23:13', '2013-02-03 15:03:51', '', '', '搜狐一卡通 [100元]', '100.00000', 'SN_85EAD9048763', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"orderList\":18,\"imagePath\":null}]', '4028bc743c3c4340013c3c593eb2001b');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43511f6f0029', '2013-01-16 20:24:15', '2013-01-16 20:24:15', '', '', '完美一卡通 [15元]', '15.00000', 'SN_4BBDD696108B', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"imagePath\":null,\"orderList\":7}]', '4028bc743c3c4340013c3c5902060018');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4351207a002a', '2013-01-16 20:24:15', '2013-01-16 20:24:15', '', '', '完美一卡通 [30元]', '30.00000', 'SN_1C2603EE7917', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c5902060018');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4351209f002b', '2013-01-16 20:24:15', '2013-01-16 20:24:15', '', '', '完美一卡通 [50元]', '50.00000', 'SN_2DED070B2B0F', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c5902060018');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435120cb002c', '2013-01-16 20:24:15', '2013-01-16 20:24:15', '', '', '完美一卡通 [100元]', '100.00000', 'SN_1E5F52118675', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c5902060018');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435498ac002e', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [2元]', '2.00000', 'SN_D5671C07FD14', '[{\"name\":\"2元\",\"id\":\"865f79cb441b4d96b78a726da915983a\",\"imagePath\":null,\"orderList\":1}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549a1e002f', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [5元]', '5.00000', 'SN_C10914462053', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"imagePath\":null,\"orderList\":2}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549a640030', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [7元]', '7.00000', 'SN_F9773330109B', '[{\"name\":\"7元\",\"id\":\"5ee91ba755c94429b431e53062103395\",\"imagePath\":null,\"orderList\":4}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549a9d0031', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [9元]', '9.00000', 'SN_E60FC49DB545', '[{\"name\":\"9元\",\"id\":\"a0ac41cf920941f89dac8bf56536cdfb\",\"imagePath\":null,\"orderList\":5}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549ac70032', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [10元]', '10.00000', 'SN_56E2A7007B63', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549af40033', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [15元]', '15.00000', 'SN_8AE6B25840CF', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"imagePath\":null,\"orderList\":7}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549b250034', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [20元]', '20.00000', 'SN_F81766CA9551', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"imagePath\":null,\"orderList\":9}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549b570035', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [25元]', '25.00000', 'SN_C3ACD3B234E3', '[{\"name\":\"25元\",\"id\":\"41df081483264e2e961b5139380f4dc8\",\"imagePath\":null,\"orderList\":10}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549b850036', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [30元]', '30.00000', 'SN_3DF286995DFC', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549ba60037', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [50元]', '50.00000', 'SN_669F86EAD444', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43549bd20038', '2013-01-16 20:28:03', '2013-01-16 20:28:03', '', '', '易宝e卡通 [100元]', '100.00000', 'SN_435B620B5B28', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c58d71e0015');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ab19003a', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [5元]', '5.00000', 'SN_4051A5B93447', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"imagePath\":null,\"orderList\":2}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ac10003b', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [10元]', '10.00000', 'SN_B95DDBD3E3E7', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ac2f003c', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [15元]', '15.00000', 'SN_8731B89F4554', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"imagePath\":null,\"orderList\":7}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ac59003d', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [18元]', '18.00000', 'SN_81C864017BF6', '[{\"name\":\"18元\",\"id\":\"ed813458e5554f68b7e0236395813aaa\",\"imagePath\":null,\"orderList\":8}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ac80003e', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [20元]', '20.00000', 'SN_EBB978FA32E3', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"imagePath\":null,\"orderList\":9}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357acaa003f', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [25元]', '25.00000', 'SN_764A7BC60991', '[{\"name\":\"25元\",\"id\":\"41df081483264e2e961b5139380f4dc8\",\"imagePath\":null,\"orderList\":10}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357acd60040', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [30元]', '30.00000', 'SN_C729BA08BFE1', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357acf70041', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [50元]', '50.00000', 'SN_7367ACF90E17', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"imagePath\":null,\"orderList\":15}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ad190042', '2013-01-16 20:31:24', '2013-01-16 20:31:24', '', '', '巨人(征途)一卡通 [60元]', '60.00000', 'SN_F4680D684402', '[{\"name\":\"60元\",\"id\":\"bc51a8c55a0448a3b3b0399e2e849dad\",\"imagePath\":null,\"orderList\":16}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ad480043', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [68元]', '68.00000', 'SN_9DC24BD702BC', '[{\"name\":\"68元\",\"id\":\"e082743847604fc7b877334583949589\",\"imagePath\":null,\"orderList\":17}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ad790044', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [100元]', '100.00000', 'SN_25505C1933FF', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ada30045', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [120元]', '120.00000', 'SN_28118EECC168', '[{\"name\":\"120元\",\"id\":\"a5ad7d399b6545a884633fd61a3c1b64\",\"imagePath\":null,\"orderList\":19}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ade10046', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [180元]', '180.00000', 'SN_05D4FA2031B1', '[{\"name\":\"180元\",\"id\":\"39e664a67acc41efab0412d3d6da6514\",\"imagePath\":null,\"orderList\":20}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ae0a0047', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [208元]', '208.00000', 'SN_F33A272C2FD0', '[{\"name\":\"208元\",\"id\":\"754c8ba67078496a9c316d17268c35bb\",\"imagePath\":null,\"orderList\":22}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ae360048', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [250元]', '250.00000', 'SN_7B01E93C5910', '[{\"name\":\"250元\",\"id\":\"54c23e4ed7384e9283430df68b8864ec\",\"imagePath\":null,\"orderList\":23}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ae620049', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [300元]', '300.00000', 'SN_47B54BE687A5', '[{\"name\":\"300元\",\"id\":\"4025aae4e0964371a22d9227aebd51f3\",\"imagePath\":null,\"orderList\":24}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357ae90004a', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [468元]', '468.00000', 'SN_6CFDAD77F9FE', '[{\"name\":\"468元\",\"id\":\"a7286eec8d63489383732ddc0e941f51\",\"imagePath\":null,\"orderList\":26}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c4357aebb004b', '2013-01-16 20:31:25', '2013-01-16 20:31:25', '', '', '巨人(征途)一卡通 [500元]', '500.00000', 'SN_A741AEF08975', '[{\"name\":\"500元\",\"id\":\"05acf907cd0447218f4e615b83709282\",\"imagePath\":null,\"orderList\":27}]', '4028bc743c3c4340013c3c57dd7c0010');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43591cd4004d', '2013-01-16 20:32:59', '2013-01-16 20:32:59', '', '', '盛大一卡通 [5元]', '5.00000', 'SN_0B396FB86B5D', '[{\"name\":\"5元\",\"id\":\"e1182b360b994f66b20463403408c642\",\"imagePath\":null,\"orderList\":2}]', '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43591e18004e', '2013-01-16 20:32:59', '2013-01-16 20:32:59', '', '', '盛大一卡通 [10元]', '10.00000', 'SN_893D968D4C29', '[{\"name\":\"10元\",\"id\":\"d65d88104fab4dbd89171f75d5ef652b\",\"imagePath\":null,\"orderList\":6}]', '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43591e42004f', '2013-01-16 20:32:59', '2013-01-16 20:32:59', '', '', '盛大一卡通 [30元]', '30.00000', 'SN_F69808C7B72E', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"imagePath\":null,\"orderList\":11}]', '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43591e6d0050', '2013-01-16 20:32:59', '2013-01-16 20:32:59', '', '', '盛大一卡通 [35元]', '35.00000', 'SN_85B2CB9666BF', '[{\"name\":\"35元\",\"id\":\"41993db6d27c443cae3fbd8737c2450a\",\"imagePath\":null,\"orderList\":12}]', '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43591e980051', '2013-01-16 20:32:59', '2013-01-16 20:32:59', '', '', '盛大一卡通 [45元]', '45.00000', 'SN_D93C7D0D261F', '[{\"name\":\"45元\",\"id\":\"ec5ed899785245a8b59156a33a05fc8e\",\"imagePath\":null,\"orderList\":14}]', '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43591ec60052', '2013-01-16 20:32:59', '2013-01-16 20:32:59', '', '', '盛大一卡通 [100元]', '100.00000', 'SN_5B6C371E316E', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"imagePath\":null,\"orderList\":18}]', '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43591ef60053', '2013-01-16 20:32:59', '2013-01-16 20:32:59', '', '', '盛大一卡通 [350元]', '350.00000', 'SN_5D08F1ADFF27', '[{\"name\":\"350元\",\"id\":\"ac638b8b77cb4cc8847db6da803a8eb5\",\"imagePath\":null,\"orderList\":25}]', '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c43591f230054', '2013-01-16 20:32:59', '2013-01-16 20:32:59', '', '', '盛大一卡通 [1000元]', '1000.00000', 'SN_618E1D9D47B5', '[{\"name\":\"1000元\",\"id\":\"10fbd47637c941c7ba2b8809c93976ae\",\"imagePath\":null,\"orderList\":28}]', '4028bc743c3c4340013c3c5794ea000d');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435ac4de0056', '2013-01-16 20:34:47', '2013-02-03 15:04:52', '', '', '电信充值卡 [50元]', '50.00000', 'SN_A1CA1A9D7B1F', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"orderList\":15,\"imagePath\":null}]', '4028bc743c3c4340013c3c56fe760007');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435ac5ff0057', '2013-01-16 20:34:47', '2013-02-03 15:04:52', '', '', '电信充值卡 [100元]', '100.00000', 'SN_56B073FCF91A', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"orderList\":18,\"imagePath\":null}]', '4028bc743c3c4340013c3c56fe760007');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435b979d0059', '2013-01-16 20:35:41', '2013-02-03 14:44:14', '', '', '联通充值卡 [20元]', '20.00000', 'SN_A3807C2D7941', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"orderList\":9,\"imagePath\":null}]', '4028bc743c3c4340013c3c5692200004');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435b989e005a', '2013-01-16 20:35:41', '2013-02-03 14:44:14', '', '', '联通充值卡 [30元]', '30.00000', 'SN_453B3C4096A6', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"orderList\":11,\"imagePath\":null}]', '4028bc743c3c4340013c3c5692200004');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435b98c5005b', '2013-01-16 20:35:41', '2013-02-03 14:44:15', '', '', '联通充值卡 [50元]', '50.00000', 'SN_7AF8516D2A47', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"orderList\":15,\"imagePath\":null}]', '4028bc743c3c4340013c3c5692200004');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435b98ef005c', '2013-01-16 20:35:41', '2013-02-03 14:44:15', '', '', '联通充值卡 [100元]', '100.00000', 'SN_7864C9FC94CB', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"orderList\":18,\"imagePath\":null}]', '4028bc743c3c4340013c3c5692200004');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435b991b005d', '2013-01-16 20:35:41', '2013-02-03 14:44:15', '', '', '联通充值卡 [300元]', '300.00000', 'SN_9A32BF1BBBC3', '[{\"name\":\"300元\",\"id\":\"4025aae4e0964371a22d9227aebd51f3\",\"orderList\":24,\"imagePath\":null}]', '4028bc743c3c4340013c3c5692200004');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435b9947005e', '2013-01-16 20:35:42', '2013-02-03 14:44:15', '', '', '联通充值卡 [500元]', '500.00000', 'SN_70ECC99B0493', '[{\"name\":\"500元\",\"id\":\"05acf907cd0447218f4e615b83709282\",\"orderList\":27,\"imagePath\":null}]', '4028bc743c3c4340013c3c5692200004');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435d42a60060', '2013-01-16 20:37:30', '2013-02-03 14:43:55', '', '', '移动充值卡 [20元]', '20.00000', 'SN_E1B7A69B1095', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"orderList\":9,\"imagePath\":null}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435d42c90061', '2013-01-16 20:37:30', '2013-02-03 14:43:55', '', '', '移动充值卡 [30元]', '30.00000', 'SN_3BC824E8AC7B', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"orderList\":11,\"imagePath\":null}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435d42e70062', '2013-01-16 20:37:30', '2013-02-03 14:43:55', '', '', '移动充值卡 [50元]', '50.00000', 'SN_C31040D0C000', '[{\"name\":\"50元\",\"id\":\"3e60baa4c70841e19be58af765bf63dc\",\"orderList\":15,\"imagePath\":null}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435d430a0063', '2013-01-16 20:37:31', '2013-02-03 14:43:55', '', '', '移动充值卡 [100元]', '100.00000', 'SN_5C0F8D8476A6', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"orderList\":18,\"imagePath\":null}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435d432c0064', '2013-01-16 20:37:31', '2013-02-03 14:43:55', '', '', '移动充值卡 [200元]', '200.00000', 'SN_3D5A67DF17BE', '[{\"name\":\"200元\",\"id\":\"ad57f9d532e44555b4c999ecd20b1b1b\",\"orderList\":21,\"imagePath\":null}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435d434f0065', '2013-01-16 20:37:31', '2013-02-03 14:43:55', '', '', '移动充值卡 [300元]', '300.00000', 'SN_2E6AC980F291', '[{\"name\":\"300元\",\"id\":\"4025aae4e0964371a22d9227aebd51f3\",\"orderList\":24,\"imagePath\":null}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435d43790066', '2013-01-16 20:37:31', '2013-02-03 14:43:55', '', '', '移动充值卡 [500元]', '500.00000', 'SN_CE3D4FA7FA51', '[{\"name\":\"500元\",\"id\":\"05acf907cd0447218f4e615b83709282\",\"orderList\":27,\"imagePath\":null}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c4308a2013c435d439b0067', '2013-01-16 20:37:31', '2013-02-03 14:43:55', '', '', '移动充值卡 [1000元]', '1000.00000', 'SN_651B5837687C', '[{\"name\":\"1000元\",\"id\":\"10fbd47637c941c7ba2b8809c93976ae\",\"orderList\":28,\"imagePath\":null}]', '4028bc743c3c4340013c3c51dac90001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c43653d013c436868130000', '2013-01-16 20:49:41', '2013-01-16 20:49:41', '', '', '腾讯Q币卡 [15元]', '15.00000', 'SN_4D153F2E2F48', '[{\"name\":\"15元\",\"id\":\"d6f1fb40e5414810be29361af8a388dc\",\"orderList\":7,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c43653d013c436868510001', '2013-01-16 20:49:41', '2013-01-16 20:49:41', '', '', '腾讯Q币卡 [20元]', '20.00000', 'SN_3B63B4B8594F', '[{\"name\":\"20元\",\"id\":\"0d2bf0fe19d643658ae1e473d43d46f5\",\"orderList\":9,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c43653d013c436868800002', '2013-01-16 20:49:41', '2013-01-16 20:49:41', '', '', '腾讯Q币卡 [30元]', '30.00000', 'SN_1F2B86B87E40', '[{\"name\":\"30元\",\"id\":\"acc42a461a8f49e6a9ce94ea1b4bf130\",\"orderList\":11,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c43653d013c436868bd0003', '2013-01-16 20:49:41', '2013-01-16 20:49:41', '', '', '腾讯Q币卡 [60元]', '60.00000', 'SN_90564C5A38A6', '[{\"name\":\"60元\",\"id\":\"bc51a8c55a0448a3b3b0399e2e849dad\",\"orderList\":16,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c43653d013c436868e80004', '2013-01-16 20:49:41', '2013-01-16 20:49:41', '', '', '腾讯Q币卡 [100元]', '100.00000', 'SN_E71907EE3833', '[{\"name\":\"100元\",\"id\":\"80efc4e5aea04199a8aebb96ca4b4d70\",\"orderList\":18,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');
INSERT INTO `xx_product` VALUES ('8ae4834e3c43653d013c4368691a0005', '2013-01-16 20:49:41', '2013-01-16 20:49:41', '', '', '腾讯Q币卡 [200元]', '200.00000', 'SN_7B8993EA98B5', '[{\"name\":\"200元\",\"id\":\"ad57f9d532e44555b4c999ecd20b1b1b\",\"orderList\":21,\"imagePath\":null}]', '4028bc743bb6fee6013bb755fd4b0001');

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
INSERT INTO `xx_role` VALUES ('4028bc743ac000ea013ac00bc68c0000', '2012-11-02 15:35:28', '2013-04-01 00:24:28', '[\"ROLE_CARDS\",\"ROLE_SPECIFICATION\",\"ROLE_BRAND\",\"ROLE_ORDER\",\"ROLE_ORDERQUERY\",\"ROLE_WITHDRAW\",\"ROLE_MEMBER\",\"ROLE_MEMBER_DISCOUNT\",\"ROLE_MEMBER_RANK\",\"ROLE_MEMBER_ATTRIBUTE\",\"ROLE_MEMBER_BANK\",\"ROLE_NAVIGATION\",\"ROLE_ARTICLEE\",\"ROLE_ARTICLE_CATEGORY\",\"ROLE_FRIEND_LINK\",\"ROLE_PAGE_TEMPLATE\",\"ROLE_MAIL_TEMPLATE\",\"ROLE_CACHE\",\"ROLE_BUILD_HTML\",\"ROLE_ADMIN\",\"ROLE_ROLE\",\"ROLE_LOG\",\"ROLE_REPORT\",\"ROLE_SETTING\",\"ROLE_PAYMENT_CONFIG\",\"ROLE_BASE\"]', '', '', '管理员');

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
  `member_bank_id` varchar(32) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `banknum` varchar(255) DEFAULT NULL,
  `openname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `withdraw_sn` (`withdraw_sn`),
  KEY `fk_withdraw_member` (`member_id`),
  KEY `fk_withdraw_memberBank` (`member_bank_id`),
  CONSTRAINT `fk_withdraw_member` FOREIGN KEY (`member_id`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `fk_withdraw_memberBank` FOREIGN KEY (`member_bank_id`) REFERENCES `xx_member_bank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_withdraw
-- ----------------------------
INSERT INTO `xx_withdraw` VALUES ('4028bc743c604c36013c6051cd420000', '2013-01-22 11:33:59', '2013-03-19 23:24:31', '0.97', 'rrr', '会员自主提现', '20.00', null, '19.40', 'TX100007', '2', '8a9182fc3ba86bc8013ba9782de60001', '8a9181383c571fbe013c5737cd510002', '1341234', '26273672366@qq.com', '张三');
INSERT INTO `xx_withdraw` VALUES ('4028bc743c604c36013c606560bb0004', '2013-01-22 11:55:22', '2013-03-11 23:22:18', '0.97', '666', '会员自主提现', '67.00', null, '64.99', 'TX100008', '1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743c604c36013c60644d960003', '666', '666', '666');
INSERT INTO `xx_withdraw` VALUES ('4028bc743d99e919013d9a4c5e95000a', '2013-03-24 10:48:49', '2013-03-24 10:48:49', '0.97', null, '会员自主提现', '2.00', null, '1.94', 'TX100013', '0', '8a9182fc3ba86bc8013ba9782de60001', 'eeee', '中信银行', '1876276253753563', '123123');
INSERT INTO `xx_withdraw` VALUES ('4028bc743d9a4d37013d9a4deef90001', '2013-03-24 10:50:31', '2013-03-24 10:50:31', '0.97', null, '会员自主提现', '3.00', null, '2.91', 'TX100014', '0', '8a9182fc3ba86bc8013ba9782de60001', 'eeee', '中信银行', '1876276253753563', '123123');
INSERT INTO `xx_withdraw` VALUES ('8a9181383c571fbe013c5739fb2f0003', '2013-01-20 17:11:23', '2013-01-20 17:18:08', '0.97', '323432', '会员自主提现', '2334.00', null, '2263.98', 'TX100001', '2', '8a9182fc3ba86bc8013ba9782de60001', '8a9181383c571fbe013c5737cd510002', '1341234', '26273672366@qq.com', '张三');
INSERT INTO `xx_withdraw` VALUES ('8a9181383c571fbe013c5741dc2f0004', '2013-01-20 17:19:59', '2013-01-20 17:26:01', '0.97', '3333', '会员自主提现', '45.00', null, '43.65', 'TX100002', '1', '8a9182fc3ba86bc8013ba9782de60001', '8a9181383c571fbe013c5737cd510002', '1341234', '26273672366@qq.com', '张三');
INSERT INTO `xx_withdraw` VALUES ('8a9181383c571fbe013c574db2bf0006', '2013-01-20 17:32:55', '2013-01-20 17:33:05', '0.97', '4444', '会员自主提现', '56.00', null, '54.32', 'TX100003', '1', '8a9182fc3ba86bc8013ba9782de60001', '8a9181383c571fbe013c5737cd510002', '1341234', '26273672366@qq.com', '张三');
INSERT INTO `xx_withdraw` VALUES ('8a9181383c571fbe013c574e9fd40008', '2013-01-20 17:33:56', '2013-01-20 17:35:12', '0.97', '222', '会员自主提现', '1.00', null, '0.97', 'TX100004', '2', '8a9182fc3ba86bc8013ba9782de60001', '8a9181383c571fbe013c5737cd510002', '1341234', '26273672366@qq.com', '张三');
INSERT INTO `xx_withdraw` VALUES ('8a9181383c57f8bb013c57fa4a2d0000', '2013-01-20 20:41:26', '2013-01-22 11:31:26', '0.97', '', '会员自主提现', '3333.00', null, '3233.01', 'TX100005', '2', '8a9182fc3ba86bc8013ba9782de60001', '8a9181383c571fbe013c5737cd510002', '1341234', '26273672366@qq.com', '张三');
INSERT INTO `xx_withdraw` VALUES ('8a9181383c57f8bb013c57fa68e60001', '2013-01-20 20:41:34', '2013-01-20 20:50:23', '0.97', '', '会员自主提现', '77.00', null, '74.69', 'TX100006', '1', '8a9182fc3ba86bc8013ba9782de60001', '8a9181383c571fbe013c5737cd510002', '1341234', '26273672366@qq.com', '张三');
INSERT INTO `xx_withdraw` VALUES ('8a9182d53da1f91f013da22dec810003', '2013-03-25 23:32:31', '2013-03-25 23:32:31', '0.96', null, '会员自主提现', '22.00', null, '21.12', 'TX100015', '0', '8a8f82cc3d5936a7013d59c871d20001', '8a8f82de3d5e89c6013d5efe12740026', '财付通', '12341234', '12311234');
INSERT INTO `xx_withdraw` VALUES ('8a9182fd3c862e94013c86eb44ce0000', '2013-01-29 23:27:11', '2013-03-19 23:20:24', '0.97', '', '会员自主提现', '555.00', null, '538.35', 'TX100009', '1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743c604c36013c60644d960003', '666', '666', '666');
INSERT INTO `xx_withdraw` VALUES ('8a9182fd3c862e94013c86eb64db0001', '2013-01-29 23:27:19', '2013-03-06 11:54:16', '0.97', '345', '会员自主提现', '345.00', null, '334.65', 'TX100010', '1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743c604c36013c60644d960003', '666', '666', '666');
INSERT INTO `xx_withdraw` VALUES ('8a9183be3ce89927013ce8a785f00000', '2013-02-17 22:55:58', '2013-02-17 23:01:13', '0.97', null, '会员自主提现', '333.00', null, '323.01', 'TX100011', '1', '8a9182fc3ba86bc8013ba9782de60001', '4028bc743c604c36013c60644d960003', '666', '666', '666');
INSERT INTO `xx_withdraw` VALUES ('ff8080813d8323f4013d83386b5d0004', '2013-03-19 23:15:45', '2013-03-19 23:16:23', '0.97', null, '会员自主提现', '90.00', null, '87.30', 'TX100012', '1', '8a9182fc3ba86bc8013ba9782de60001', '8a9181383c571fbe013c5737cd510002', '1341234', '26273672366@qq.com', '张三');
