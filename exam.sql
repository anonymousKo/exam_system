/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : exam

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2019-01-28 13:02:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account_profile
-- ----------------------------
DROP TABLE IF EXISTS `account_profile`;
CREATE TABLE `account_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `uid` varchar(22) DEFAULT NULL,
  `user_src` int(11) NOT NULL,
  `user_status` int(11) NOT NULL,
  `unionid` varchar(32) DEFAULT NULL,
  `openid` varchar(32) DEFAULT NULL,
  `wxid` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `sex` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `avatar` varchar(60) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `province` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `location` varchar(60) DEFAULT NULL,
  `is_upgrade` int(11) NOT NULL,
  `upgrade_time` datetime(6) DEFAULT NULL,
  `expire_time` datetime(6) DEFAULT NULL,
  `upgrade_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  UNIQUE KEY `account_profile_name_email_52e79ff2_uniq` (`name`,`email`),
  KEY `account_profile_status_cef42cf5` (`status`),
  KEY `account_profile_user_src_28c2847b` (`user_src`),
  KEY `account_profile_unionid_1021e9fa` (`unionid`),
  KEY `account_profile_openid_06478752` (`openid`),
  KEY `account_profile_name_13db32ec` (`name`),
  KEY `account_profile_email_df723ccb` (`email`),
  KEY `account_profile_phone_923990b3` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_profile
-- ----------------------------
INSERT INTO `account_profile` VALUES ('1', '1', '2018-12-28 07:50:21.608328', '2018-12-28 07:50:21.608328', '8HnNnQvHYnx5scAziG2fjm', '11', '1', null, null, null, 'andy', 'andy@mrsoft.com', '1', '0', null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `account_profile` VALUES ('2', '1', '2018-12-28 07:52:26.010664', '2018-12-28 07:54:29.933482', 'aqrdnYGL4a4XduUozLPg6Y', '33', '1', null, null, null, '老冯', '694798056@qq.com', '1', '0', null, null, '18910441510', null, null, null, null, '0', null, null, '0');
INSERT INTO `account_profile` VALUES ('3', '1', '2019-01-07 05:55:44.566914', '2019-01-11 08:30:41.232462', '2ASBWWkp3gu4RwvQeEmKzQ', '33', '1', null, null, null, 'MR', 'fengchunlong0510@163.com', '1', '0', null, null, '13578982158', null, null, null, null, '0', null, null, '0');

-- ----------------------------
-- Table structure for account_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `account_userinfo`;
CREATE TABLE `account_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `kind_id` varchar(32) DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  `name` varchar(24) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `wxid` varchar(24) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `pid` varchar(18) DEFAULT NULL,
  `graduated_from` varchar(60) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_userinfo_kind_id_uid_5acd2411_uniq` (`kind_id`,`uid`),
  KEY `account_userinfo_status_5adcd90c` (`status`),
  KEY `account_userinfo_kind_id_e4d2497b` (`kind_id`),
  KEY `account_userinfo_uid_c2ca5208` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_userinfo
-- ----------------------------
INSERT INTO `account_userinfo` VALUES ('1', '1', '2018-12-28 09:51:25.747072', '2018-12-28 09:51:25.755069', 'tvAnb6frD7426Ga4P8RYUU', 'aqrdnYGL4a4XduUozLPg6Y', '郭靖', null, '0', '18910441212', null, null, null, null, '卫星广场');
INSERT INTO `account_userinfo` VALUES ('2', '1', '2019-01-07 06:21:22.698788', '2019-01-07 06:21:22.708782', 'tvAnb6frD7426Ga4P8RYUU', '2ASBWWkp3gu4RwvQeEmKzQ', '老冯', null, '0', '18910441510', null, null, null, null, '卫星广场');
INSERT INTO `account_userinfo` VALUES ('3', '1', '2019-01-11 05:43:26.066785', '2019-01-11 05:43:26.068771', 'Zpfv7E2wM4aoapDpymZzBD', 'aqrdnYGL4a4XduUozLPg6Y', '孙悟空', '男', '20', '18910121313', null, null, null, '西游记', null);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 用户信息', '7', 'add_profile');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 用户信息', '7', 'change_profile');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 用户信息', '7', 'delete_profile');
INSERT INTO `auth_permission` VALUES ('28', 'Can view 用户信息', '7', 'view_profile');
INSERT INTO `auth_permission` VALUES ('29', 'Can add 用户登记信息', '8', 'add_userinfo');
INSERT INTO `auth_permission` VALUES ('30', 'Can change 用户登记信息', '8', 'change_userinfo');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete 用户登记信息', '8', 'delete_userinfo');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 用户登记信息', '8', 'view_userinfo');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 应用配置信息', '9', 'add_appconfiginfo');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 应用配置信息', '9', 'change_appconfiginfo');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 应用配置信息', '9', 'delete_appconfiginfo');
INSERT INTO `auth_permission` VALUES ('36', 'Can view 应用配置信息', '9', 'view_appconfiginfo');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 出题账户', '10', 'add_businessaccountinfo');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 出题账户', '10', 'change_businessaccountinfo');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 出题账户', '10', 'delete_businessaccountinfo');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 出题账户', '10', 'view_businessaccountinfo');
INSERT INTO `auth_permission` VALUES ('41', 'Can add 应用信息', '11', 'add_businessappinfo');
INSERT INTO `auth_permission` VALUES ('42', 'Can change 应用信息', '11', 'change_businessappinfo');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete 应用信息', '11', 'delete_businessappinfo');
INSERT INTO `auth_permission` VALUES ('44', 'Can view 应用信息', '11', 'view_businessappinfo');
INSERT INTO `auth_permission` VALUES ('45', 'Can add 用户信息图片配置', '12', 'add_userinfoimage');
INSERT INTO `auth_permission` VALUES ('46', 'Can change 用户信息图片配置', '12', 'change_userinfoimage');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete 用户信息图片配置', '12', 'delete_userinfoimage');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 用户信息图片配置', '12', 'view_userinfoimage');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 用户信息字段正则表达式', '13', 'add_userinforegex');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 用户信息字段正则表达式', '13', 'change_userinforegex');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 用户信息字段正则表达式', '13', 'delete_userinforegex');
INSERT INTO `auth_permission` VALUES ('52', 'Can view 用户信息字段正则表达式', '13', 'view_userinforegex');
INSERT INTO `auth_permission` VALUES ('53', 'Can add 题库', '14', 'add_bankinfo');
INSERT INTO `auth_permission` VALUES ('54', 'Can change 题库', '14', 'change_bankinfo');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete 题库', '14', 'delete_bankinfo');
INSERT INTO `auth_permission` VALUES ('56', 'Can view 题库', '14', 'view_bankinfo');
INSERT INTO `auth_permission` VALUES ('57', 'Can add 选择题', '15', 'add_choiceinfo');
INSERT INTO `auth_permission` VALUES ('58', 'Can change 选择题', '15', 'change_choiceinfo');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete 选择题', '15', 'delete_choiceinfo');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 选择题', '15', 'view_choiceinfo');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 比赛类别信息', '16', 'add_competitionkindinfo');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 比赛类别信息', '16', 'change_competitionkindinfo');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 比赛类别信息', '16', 'delete_competitionkindinfo');
INSERT INTO `auth_permission` VALUES ('64', 'Can view 比赛类别信息', '16', 'view_competitionkindinfo');
INSERT INTO `auth_permission` VALUES ('65', 'Can add 比赛问题记录', '17', 'add_competitionqainfo');
INSERT INTO `auth_permission` VALUES ('66', 'Can change 比赛问题记录', '17', 'change_competitionqainfo');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete 比赛问题记录', '17', 'delete_competitionqainfo');
INSERT INTO `auth_permission` VALUES ('68', 'Can view 比赛问题记录', '17', 'view_competitionqainfo');
INSERT INTO `auth_permission` VALUES ('69', 'Can add 填空题', '18', 'add_fillinblankinfo');
INSERT INTO `auth_permission` VALUES ('70', 'Can change 填空题', '18', 'change_fillinblankinfo');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete 填空题', '18', 'delete_fillinblankinfo');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 填空题', '18', 'view_fillinblankinfo');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$120000$23BauSj9jWAu$hYQJj/ABVDYgKnyEsguZHhyDF6VafJtgp+TDb8URM+Q=', '2019-01-26 07:02:29.666868', '1', 'mr', '', '', 'mr@mrsoft.com', '1', '1', '2018-12-27 09:09:06.609709');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$36000$0upVS8ZDshqM$LKP7C9XO7BaVjlcxXvKGhw62FzgZqLUIWVh38drMuvs=', null, '0', 'andy', '', '', 'andy@mrsoft.com', '0', '0', '2018-12-28 07:50:21.345479');
INSERT INTO `auth_user` VALUES ('4', 'pbkdf2_sha256$120000$DBpo6LMN3AoM$kxdqY51njDXptEZipMJOr4jRFCTDTP2q0r0kb6GF14I=', '2019-01-28 00:40:59.512021', '0', '694798056', '', '', '694798056@qq.com', '1', '1', '2018-12-28 07:52:25.816762');
INSERT INTO `auth_user` VALUES ('5', 'pbkdf2_sha256$120000$d8OYqpEJXgxs$yS16gV5GtC13CPDkvn1FGwo6iou2s/0Jiuc48mW0coI=', '2019-01-11 08:24:50.558389', '0', 'fengchunlong0510', '', '', 'fengchunlong0510@163.com', '1', '1', '2019-01-07 05:55:44.326051');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for business_appconfiginfo
-- ----------------------------
DROP TABLE IF EXISTS `business_appconfiginfo`;
CREATE TABLE `business_appconfiginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `app_id` varchar(32) NOT NULL,
  `app_name` varchar(40) DEFAULT NULL,
  `rule_text` longtext,
  `is_show_userinfo` tinyint(1) NOT NULL,
  `userinfo_fields` varchar(128) DEFAULT NULL,
  `option_fields` varchar(128) DEFAULT NULL,
  `userinfo_field_names` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_appconfiginfo_status_23f940ab` (`status`),
  KEY `business_appconfiginfo_app_id_2366db42` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_appconfiginfo
-- ----------------------------
INSERT INTO `business_appconfiginfo` VALUES ('2', '1', '2018-12-28 09:45:58.407103', '2018-12-28 09:45:58.407103', 'QM8EYzDNdZtrtyqmGxbY9A', '老冯的码场——古诗词大赛', '如有作弊，取消比赛', '1', 'name#phone#address', '', '姓名#手机号#地址');
INSERT INTO `business_appconfiginfo` VALUES ('3', '1', '2019-01-11 05:41:50.866373', '2019-01-26 07:04:52.005763', 'xVnZRUkwGpZ2v8yEWqwqZG', '七年级历史题', '开卷考试', '1', 'name#sex#age#phone#graduated_from', null, '姓名#性别#年龄#手机号#毕业院校');
INSERT INTO `business_appconfiginfo` VALUES ('4', '1', '2019-01-11 08:35:35.907596', '2019-01-11 08:35:35.907596', 'roXjNHKxHiEcLbQuwWhFMb', '2014年全国计算机等级《二级JAVA》命题预测试卷', '', '0', '', '', '');

-- ----------------------------
-- Table structure for business_businessaccountinfo
-- ----------------------------
DROP TABLE IF EXISTS `business_businessaccountinfo`;
CREATE TABLE `business_businessaccountinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `account_id` varchar(22) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `company_name` varchar(60) DEFAULT NULL,
  `company_description` longtext,
  `company_username` varchar(32) DEFAULT NULL,
  `company_phone` varchar(16) DEFAULT NULL,
  `company_location` longtext,
  `company_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `business_businessaccountinfo_status_09dd4294` (`status`),
  KEY `business_businessaccountinfo_account_id_00a2690c` (`account_id`),
  KEY `business_businessaccountinfo_company_phone_01c42098` (`company_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_businessaccountinfo
-- ----------------------------
INSERT INTO `business_businessaccountinfo` VALUES ('1', '1', '2018-12-28 07:54:29.964463', '2018-12-28 07:54:29.964463', 'LMVV59cNPM58DwiBmnZKLQ', '694798056@qq.com', '老冯的码场', null, '老冯', '18910441510', null, '0');
INSERT INTO `business_businessaccountinfo` VALUES ('2', '1', '2019-01-11 08:30:41.241474', '2019-01-11 08:30:41.241474', 'twVhE4BFaxxyjL46EMf5hR', 'fengchunlong0510@163.com', '明日科技', null, 'MR', '13578982158', null, '0');

-- ----------------------------
-- Table structure for business_businessappinfo
-- ----------------------------
DROP TABLE IF EXISTS `business_businessappinfo`;
CREATE TABLE `business_businessappinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `account_id` varchar(32) NOT NULL,
  `app_id` varchar(22) NOT NULL,
  `app_name` varchar(40) DEFAULT NULL,
  `app_description` longtext,
  PRIMARY KEY (`id`),
  KEY `business_businessappinfo_status_c6858221` (`status`),
  KEY `business_businessappinfo_account_id_15798b98` (`account_id`),
  KEY `business_businessappinfo_app_id_7385168b` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_businessappinfo
-- ----------------------------
INSERT INTO `business_businessappinfo` VALUES ('2', '1', '2018-12-28 09:45:58.401109', '2018-12-28 09:45:58.401109', 'LMVV59cNPM58DwiBmnZKLQ', 'QM8EYzDNdZtrtyqmGxbY9A', '老冯的码场——古诗词大赛', null);
INSERT INTO `business_businessappinfo` VALUES ('3', '1', '2019-01-11 05:41:50.836347', '2019-01-11 05:41:50.836347', 'LMVV59cNPM58DwiBmnZKLQ', 'xVnZRUkwGpZ2v8yEWqwqZG', '七年级历史题', null);
INSERT INTO `business_businessappinfo` VALUES ('4', '1', '2019-01-11 08:35:35.894603', '2019-01-11 08:35:35.894603', 'twVhE4BFaxxyjL46EMf5hR', 'roXjNHKxHiEcLbQuwWhFMb', '2014年全国计算机等级《二级JAVA》命题预测试卷', null);

-- ----------------------------
-- Table structure for business_userinfoimage
-- ----------------------------
DROP TABLE IF EXISTS `business_userinfoimage`;
CREATE TABLE `business_userinfoimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `uii_name` varchar(32) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `sex` varchar(60) DEFAULT NULL,
  `age` varchar(60) DEFAULT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `wxid` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `pid` varchar(60) DEFAULT NULL,
  `graduated_from` varchar(60) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `resume` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_userinfoimage_status_7072fef4` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_userinfoimage
-- ----------------------------

-- ----------------------------
-- Table structure for business_userinforegex
-- ----------------------------
DROP TABLE IF EXISTS `business_userinforegex`;
CREATE TABLE `business_userinforegex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `field_name` varchar(16) DEFAULT NULL,
  `regex` varchar(40) DEFAULT NULL,
  `description` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `business_userinforegex_status_a2e28d05` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_userinforegex
-- ----------------------------

-- ----------------------------
-- Table structure for competition_bankinfo
-- ----------------------------
DROP TABLE IF EXISTS `competition_bankinfo`;
CREATE TABLE `competition_bankinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `bank_id` varchar(22) DEFAULT NULL,
  `choice_num` int(11) NOT NULL,
  `fillinblank_num` int(11) NOT NULL,
  `bank_type` int(11) NOT NULL,
  `kind_num` int(11) NOT NULL,
  `partin_num` int(11) NOT NULL,
  `bank_name` varchar(40) DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `competition_bankinfo_status_528ddf4a` (`status`),
  KEY `competition_bankinfo_bank_id_87352246` (`bank_id`),
  KEY `competition_bankinfo_uid_b0d74e2a` (`uid`),
  KEY `competition_bankinfo_account_id_939bd8f3` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition_bankinfo
-- ----------------------------
INSERT INTO `competition_bankinfo` VALUES ('20', '1', '2018-12-28 08:30:19.970854', '2019-01-08 07:56:55.891668', 'M6VrSVv2XNR9WZnu7nhcJ6', '25', '36', '2', '0', '12', '古诗词大赛', 'aqrdnYGL4a4XduUozLPg6Y', null);
INSERT INTO `competition_bankinfo` VALUES ('21', '1', '2019-01-11 05:40:20.031902', '2019-01-26 07:20:40.566769', 'H8sepoh9ZdsoSA4GQXGwGR', '40', '0', '1', '0', '2', '七年级历史复习试题', 'aqrdnYGL4a4XduUozLPg6Y', null);
INSERT INTO `competition_bankinfo` VALUES ('28', '1', '2019-01-11 07:21:23.789030', '2019-01-11 07:21:24.096840', 'wrDZTV776KWNcCiV945FBm', '150', '0', '3', '0', '0', '国家宪法知识竞答', 'aqrdnYGL4a4XduUozLPg6Y', null);
INSERT INTO `competition_bankinfo` VALUES ('29', '1', '2019-01-11 07:24:06.245999', '2019-01-11 07:24:06.278976', 'uGdoqXTkmVhRb2dv2EEncB', '20', '0', '1', '0', '0', '心理学专业考研', 'aqrdnYGL4a4XduUozLPg6Y', null);
INSERT INTO `competition_bankinfo` VALUES ('30', '1', '2019-01-11 07:27:38.817606', '2019-01-11 08:35:46.811973', 'mixSJyMz98EHfNJ3GwRtj9', '32', '0', '0', '0', '1', '2014年全国计算机等级《二级JAVA》命题预测试卷', 'aqrdnYGL4a4XduUozLPg6Y', null);

-- ----------------------------
-- Table structure for competition_choiceinfo
-- ----------------------------
DROP TABLE IF EXISTS `competition_choiceinfo`;
CREATE TABLE `competition_choiceinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `audio_url` varchar(255) DEFAULT NULL,
  `audio_time` int(11) NOT NULL,
  `bank_id` varchar(32) DEFAULT NULL,
  `ctype` int(11) NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `item1` varchar(255) DEFAULT NULL,
  `item2` varchar(255) DEFAULT NULL,
  `item3` varchar(255) DEFAULT NULL,
  `item4` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `competition_choiceinfo_status_dd6aa9e9` (`status`),
  KEY `competition_choiceinfo_bank_id_019a8691` (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition_choiceinfo
-- ----------------------------
INSERT INTO `competition_choiceinfo` VALUES ('1', '1', '2018-12-28 08:30:20.137774', '2018-12-28 08:30:20.137774', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '商女不知亡国恨下一句是？', '隔江犹唱后庭花', '隔江犹闻笙竹宴', '铁马冰河入梦来', '一弦一柱思华年', '江枫渔火对愁眠', '');
INSERT INTO `competition_choiceinfo` VALUES ('2', '1', '2018-12-28 08:30:20.142755', '2018-12-28 08:30:20.142755', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '龙舟是为了纪念哪位文化名人的？', '屈原', '陈独秀', '李白', '纳兰性德', '屈原', '');
INSERT INTO `competition_choiceinfo` VALUES ('3', '1', '2018-12-28 08:30:20.142755', '2018-12-28 08:30:20.142755', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '元宵又称为上元节，那么下元节是几月几号？', '十月十五', '六月十五', '十二月十五', '十月十五', '七月十五', '');
INSERT INTO `competition_choiceinfo` VALUES ('4', '1', '2018-12-28 08:30:20.143755', '2018-12-28 08:30:20.143755', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '北京是在哪个朝代建都的？', '元朝', '清朝', '明朝', '汉朝', '元朝', '');
INSERT INTO `competition_choiceinfo` VALUES ('5', '1', '2018-12-28 08:30:20.146753', '2018-12-28 08:30:20.146753', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '唐宋散文八大家不包括以下哪一位人物？', '李白', '苏轼', '苏辙', '李白', '王安石', '');
INSERT INTO `competition_choiceinfo` VALUES ('6', '1', '2018-12-28 08:30:20.147753', '2018-12-28 08:30:20.147753', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '清明上河图的作者是哪一个朝代的人？', '北宋', '南宋', '北宋', '晚唐', '元朝', '');
INSERT INTO `competition_choiceinfo` VALUES ('7', '1', '2018-12-28 08:30:20.148752', '2018-12-28 08:30:20.148752', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '天子呼来不上船，自称臣是酒中仙。说的是哪一位人物？', '李白', '杜甫', '王之涣', '李白', '贾岛', '');
INSERT INTO `competition_choiceinfo` VALUES ('8', '1', '2018-12-28 08:30:20.148752', '2018-12-28 08:30:20.148752', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '晏殊的《浣溪沙》中的“无可奈何花落去”的下句是', '似曾相识燕归来 ', '似曾相识鸟归来', '似曾相识雁归来', '似曾相识燕归来 ', '', '');
INSERT INTO `competition_choiceinfo` VALUES ('9', '1', '2018-12-28 08:30:20.149751', '2018-12-28 08:30:20.149751', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '《七步诗》的作者是', '曹植 ', '曹操 ', '曹丕', '曹植 ', '', '');
INSERT INTO `competition_choiceinfo` VALUES ('10', '1', '2018-12-28 08:30:20.149751', '2018-12-28 08:30:20.149751', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '杜甫的《春夜喜雨》中的“晓看红湿处”的下句是', '花重锦官城', '花重绵阳城', '花重锦州成', '花重锦官城', '', '');
INSERT INTO `competition_choiceinfo` VALUES ('11', '1', '2018-12-28 08:30:20.150752', '2018-12-28 08:30:20.150752', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '把“春风”比作“剪刀”的是哪首诗', '咏柳', '忆江南', '滁州西涧', '咏柳', '游园不值', '');
INSERT INTO `competition_choiceinfo` VALUES ('12', '1', '2018-12-28 08:30:20.151751', '2018-12-28 08:30:20.151751', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '“横看成岭侧成峰,远近高低各不同.”诗中写的名胜是', '庐山', '泰山', '华山', '黄山', '庐山', '');
INSERT INTO `competition_choiceinfo` VALUES ('13', '1', '2018-12-28 08:30:20.151751', '2018-12-28 08:30:20.151751', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '“解落三秋叶,能开二月花.过江千尺浪,入竹万竿斜.”这首诗写的是', '风', '花', '风', '竹', '水', '');
INSERT INTO `competition_choiceinfo` VALUES ('14', '1', '2018-12-28 08:30:20.152750', '2018-12-28 08:30:20.152750', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '“但使龙城飞将在,不教胡马度”', '阴山', '阴山', '边关', '燕山', '', '');
INSERT INTO `competition_choiceinfo` VALUES ('15', '1', '2018-12-28 08:30:20.152750', '2018-12-28 08:30:20.152750', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '“海内存知己,天涯若比邻”是谁的诗句.', '王勃', '王勃', '李白', '白居易', '', '');
INSERT INTO `competition_choiceinfo` VALUES ('16', '1', '2018-12-28 08:30:20.153749', '2018-12-28 08:30:20.153749', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '“停车坐爱枫林晚,霜叶红于二月花”中“坐”的意思是', '因为', '因为', '坐下', '座位', '', '');
INSERT INTO `competition_choiceinfo` VALUES ('17', '1', '2018-12-28 08:30:20.153749', '2018-12-28 08:30:20.153749', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '杜牧的《江南春》中“南朝四百八十寺”的下句是', '多少楼台烟雨中', '多少楼台烟波中', '多少楼台风雨中', '多少楼台烟雨中', '', '');
INSERT INTO `competition_choiceinfo` VALUES ('18', '1', '2018-12-28 08:30:20.154749', '2018-12-28 08:30:20.154749', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '“独在异乡为异客,每逢佳节倍思亲”是谁的诗句.', '王维', '王维', '王之涣', '王勃', '', '');
INSERT INTO `competition_choiceinfo` VALUES ('19', '1', '2018-12-28 08:30:20.154749', '2018-12-28 08:30:20.154749', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '《天净沙·秋思》是一首小令,作者是元代的', '马致远', '张养浩', '马致远', '元好问', '', '');
INSERT INTO `competition_choiceinfo` VALUES ('20', '1', '2018-12-28 08:30:20.155748', '2018-12-28 08:30:20.155748', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '“野火烧不尽,春风吹又生”一句出自', '白居易《赋得古原草送别》', '白居易《赋得古原草送别》', '王昌龄《出塞》 ', '杜牧《江南春》', '', '');
INSERT INTO `competition_choiceinfo` VALUES ('21', '1', '2018-12-28 08:30:20.155748', '2018-12-28 08:30:20.155748', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '“忽如一夜春风来,千树万树梨花开”写的是', '雪景', '春色', '梨花 ', '雪景', '', '');
INSERT INTO `competition_choiceinfo` VALUES ('22', '1', '2018-12-28 08:30:20.156748', '2018-12-28 08:30:20.156748', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '“春蚕到死丝方尽,蜡炬成灰泪始干”出自谁的《无题》', '李商隐', '李贺', '李清照 ', '李商隐', '', '');
INSERT INTO `competition_choiceinfo` VALUES ('23', '1', '2018-12-28 08:30:20.156748', '2018-12-28 08:30:20.156748', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '“无边落木萧萧下,不尽长江滚滚来”出自杜甫的', '《登高》', '《茅屋为秋风所破歌》', '《登高》', '《蜀相》', '', '');
INSERT INTO `competition_choiceinfo` VALUES ('24', '1', '2018-12-28 08:30:20.157748', '2018-12-28 08:30:20.157748', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '龚自珍《己亥杂诗》“落红不是无情物,化作春泥更护花”句中,“红”是指', '花 ', '红色', '花 ', '树叶', '', '');
INSERT INTO `competition_choiceinfo` VALUES ('25', '1', '2018-12-28 08:30:20.158748', '2018-12-28 08:30:20.158748', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '“别时容易见时难”“相见时难别亦难”分别是谁的诗句', '李煜', '柳永', '李煜', '李清照', '李商隐', '');
INSERT INTO `competition_choiceinfo` VALUES ('26', '1', '2019-01-11 05:40:20.208855', '2019-01-11 05:40:20.208855', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '下列哪一古代人类遗址，把我国的人类历史推进到大约170万年前(　　)', '元谋人遗址', '元谋人遗址', '北京人遗址', '山顶洞人遗址', '半坡聚落遗址', '');
INSERT INTO `competition_choiceinfo` VALUES ('27', '1', '2019-01-11 05:40:20.217837', '2019-01-11 05:40:20.217837', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '根据片段联想：①发现于周口店的龙骨山②能够直立行走③已经使用火④过着群居生活，题中所述的这一远古人类是(　　)', '北京人', '元谋人', '北京人', '蓝田人', '山顶洞人', '');
INSERT INTO `competition_choiceinfo` VALUES ('28', '1', '2019-01-11 05:40:20.218838', '2019-01-11 05:40:20.218838', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '下列有关我国境内远古人类及其生活情况的叙述，不正确的是(　　)', '上古人类的外貌跟现代人没有差别', '元谋人是目前已知的最早人类', '北京人 使用打制石器', '山顶洞人掌握了磨光和钻孔技术', '上古人类的外貌跟现代人没有差别', '');
INSERT INTO `competition_choiceinfo` VALUES ('29', '1', '2019-01-11 05:40:20.219837', '2019-01-11 05:40:20.219837', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '元谋人、北京 人、山顶洞人都是我国境内著名的原始人类。获得他们生产生活的第一手资料，要通过(　　)', '考古发掘', '神话传说', '史书记载', '学者推断', '考古发掘', '');
INSERT INTO `competition_choiceinfo` VALUES ('30', '1', '2019-01-11 05:40:20.220836', '2019-01-11 05:40:20.220836', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '“民以食为天”，从野食充饥到农耕种植是人类生活史上的飞跃。世界上最早种植粟的远古居民是(　　)', '半坡人', '北京人', '半坡人', '元谋人', '河姆渡人', '');
INSERT INTO `competition_choiceinfo` VALUES ('31', '1', '2019-01-11 05:40:20.263811', '2019-01-11 05:40:20.263811', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '半坡遗址是我国重要的原始农耕村落遗址之一，其原始居民(　　)', '主要粮食作物是粟', '距今约一百七十万年', '生活在北京周口店', '住着干栏式的房子', '主要粮食作物是粟', '');
INSERT INTO `competition_choiceinfo` VALUES ('32', '1', '2019-01-11 05:40:20.264811', '2019-01-11 05:40:20.264811', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '南方地区气候潮湿闷热，在远古时代有哪一远古人群建造干栏式房屋，为自己提供一个比较舒适的居住环境(　　)', '河姆渡人', '北京人', '山顶洞人', '河姆渡人', '半坡人', '');
INSERT INTO `competition_choiceinfo` VALUES ('33', '1', '2019-01-11 05:40:20.264811', '2019-01-11 05:40:20.264811', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '1973年，浙江省余姚市农民在建排涝站挖地基时，意外地发现一处原始时期人类生活遗址。遗址中有稻谷、稻秆堆积。这处遗址是(　　)', '河姆渡人遗址', '北京人遗址', '山顶洞人遗址', '半坡人遗址', '河姆渡人遗址', '');
INSERT INTO `competition_choiceinfo` VALUES ('34', '1', '2019-01-11 05:40:20.265811', '2019-01-11 05:40:20.265811', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '一代伟人孙中山的诗句“中华开国五千年，神州轩辕自古传。”反映了我们经常讲的“上下五千年”的历史是从下面哪一人物开始(　　)', '黄帝', '炎帝', '大禹', '黄帝', '舜', '');
INSERT INTO `competition_choiceinfo` VALUES ('35', '1', '2019-01-11 05:40:20.266830', '2019-01-11 05:40:20.266830', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '世界华人炎帝故里寻根节每年固定在炎帝诞辰农历四月廿六举办，该节已成为海峡两岸同胞乃至全球华人华侨交流互动的重要平台。下列传说中的发明创造与炎帝无关的一项是(　　)', '建造宫室，制作衣裳', '首创耒耜，种植五谷', '建造宫室，制作衣裳', '制作陶器，发明纺织', '学会煮盐，教民通商', '');
INSERT INTO `competition_choiceinfo` VALUES ('36', '1', '2019-01-11 05:40:20.267808', '2019-01-11 05:40:20.267808', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '黄帝被称为“中华民族之父”，下列关于黄帝时期的发明正确的一组是(　　)', '伶伦——乐谱', '仓颉——缫丝', '隶首——文字', '嫘祖——算盘', '伶伦——乐谱', '');
INSERT INTO `competition_choiceinfo` VALUES ('37', '1', '2019-01-11 05:40:20.267808', '2019-01-11 05:40:20.267808', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '舜当上部落首领的方式是(　　)', '通过禅让制度，大家推荐继位', '通过部落战争，战胜其他部落', '凭借家族特权，继承首领位置', '治水建立功业，人民拥戴上台', '通过禅让制度，大家推荐继位', '');
INSERT INTO `competition_choiceinfo` VALUES ('38', '1', '2019-01-11 05:40:20.268808', '2019-01-11 05:40:20.268808', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '如果拍摄一部原始社会部落联盟时期的电视连续剧，能够出现的情节是(　　)', '大禹治水“三过家门而不入”', '炎帝发明指南车打败蚩尤', '尧发明了文字', '年老的禹经过考察让位于舜', '大禹治水“三过家门而不入”', '');
INSERT INTO `competition_choiceinfo` VALUES ('39', '1', '2019-01-11 05:40:20.269808', '2019-01-11 05:40:20.269808', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '“禹传子”“家天下”说明我国古代的哪一制度开始遭到完全破坏(　　)', '禅让制', '分封制', '世袭制', '禅让制', '宗法制', '');
INSERT INTO `competition_choiceinfo` VALUES ('40', '1', '2019-01-11 05:40:20.269808', '2019-01-11 05:40:20.269808', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '国家是阶级统治的工具。中国历史上出现最早的国家距今已有(　　)', '4000年左右', '2000年左右', '3000年左右', '4000年左右', '5000年左右', '');
INSERT INTO `competition_choiceinfo` VALUES ('41', '1', '2019-01-11 05:40:20.270827', '2019-01-11 05:40:20.270827', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '“封建亲戚，以藩屏周。”说明西周时期实行分封制的主要目的是(　　)', '巩固周王的统治', '分割诸侯的兵力', '保证国家的兵源', '巩固周王的统治', '保证国家的财政收入', '');
INSERT INTO `competition_choiceinfo` VALUES ('42', '1', '2019-01-11 05:40:20.271807', '2019-01-11 05:40:20.271807', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '据《史记》记载，禹年老时，推荐伯益作为继承人，但禹的儿子启却举兵杀死伯益，继承了父亲的位置。从材料中能得到的准确信息（　　）', ' 世袭制代替禅让制', ' 伯益建立夏朝', ' 世袭制代替禅让制', ' 夏朝的建立标志着我国封建社会的开始', ' 启是夏朝第一代君主', '');
INSERT INTO `competition_choiceinfo` VALUES ('43', '1', '2019-01-11 05:40:20.271807', '2019-01-11 05:40:20.271807', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '2011年3月底，中国国家博物馆新馆开馆，世界现存最大的青铜器、“中华第一鼎”正式移驻该馆。“中华第一鼎”指的是（　　）', ' 司母戊鼎', ' 司母戊鼎', ' 毛公鼎', ' 大盂铜鼎', ' 商朝虎耳铜鼎', '');
INSERT INTO `competition_choiceinfo` VALUES ('44', '1', '2019-01-11 05:40:20.272806', '2019-01-11 05:40:20.272806', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '下列哪一古代人类遗址，把我国的人类历史推进到大约170万年前    (　 　)', '元谋人遗址', '元谋人遗址', '北京人遗址', '山顶洞人遗址', '半坡聚落遗址', '');
INSERT INTO `competition_choiceinfo` VALUES ('45', '1', '2019-01-11 05:40:20.272806', '2019-01-11 05:40:20.272806', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '根据片段联想：①发现于周口店的龙骨山②能够直立行走③已经使用火④过着群居生活，题中所述的这一远古人类是                      (　　 )', '北京人', '元谋人', '北京人', '蓝田人', '山顶洞人', '');
INSERT INTO `competition_choiceinfo` VALUES ('46', '1', '2019-01-11 05:40:20.273805', '2019-01-11 05:40:20.273805', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '“民以食为天”，从野食充饥到农耕种植是人类生活史上的飞跃。世界上最早种植粟的远古居民是                              (　 　)', '半坡人', '北京人', '半坡人', '元谋人', '河姆渡人', '');
INSERT INTO `competition_choiceinfo` VALUES ('47', '1', '2019-01-11 05:40:20.274805', '2019-01-11 05:40:20.274805', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '南方地区气候潮湿闷热，在远古时代有哪一远古人群建造干栏式房屋，为自己提供一个比较舒适的居住环境                          (　　 )', '河姆渡人', '北京人', '山顶洞人', '河姆渡人', '半坡人', '');
INSERT INTO `competition_choiceinfo` VALUES ('48', '1', '2019-01-11 05:40:20.274805', '2019-01-11 05:40:20.274805', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '一代伟人孙中山的诗句“中华开国五千年，神州轩辕自古传。”反映了我们经常讲的“上下五千年”的历史是从下面哪一人物开始                (　 　)', '黄帝', '炎帝', '大禹', '黄帝', '舜', '');
INSERT INTO `competition_choiceinfo` VALUES ('49', '1', '2019-01-11 05:40:20.275804', '2019-01-11 05:40:20.275804', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '舜当上部落首领的方式是                      (  　)', '通过禅让制度，大家推荐继位', '通过部落战争，战胜其他部落', '凭借家族特权，继承首领位置', '治水建立功业，人民拥戴上台', '通过禅让制度，大家推荐继位', '');
INSERT INTO `competition_choiceinfo` VALUES ('50', '1', '2019-01-11 05:40:20.275804', '2019-01-11 05:40:20.275804', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '“公天下”变为“家天下”的重要标志是               (   )', '王位世袭制代替禅让制', '氏族公社的公有制变为私有制', '氏族公社内部发生贫富分化', '部落之间出现激烈的战争', '王位世袭制代替禅让制', '');
INSERT INTO `competition_choiceinfo` VALUES ('51', '1', '2019-01-11 05:40:20.276804', '2019-01-11 05:40:20.276804', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '公元前841年，（   ） 与民争利，引起“国人暴动”。       （   ）', '周厉王', '汤', '周武王', '周厉王', '周文王', '');
INSERT INTO `competition_choiceinfo` VALUES ('52', '1', '2019-01-11 05:40:20.277803', '2019-01-11 05:40:20.277803', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '春秋后期，铁制农具和（   ）出现，促进了农业上的深耕细作。   （   ）', '牛耕', '耧车', '水排', '牛耕', '曲辕犁', '');
INSERT INTO `competition_choiceinfo` VALUES ('53', '1', '2019-01-11 05:40:20.277803', '2019-01-11 05:40:20.277803', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '“秦……以为周制微弱，终为诸侯所丧，故不立尺土之封。”“周制”是指西周实行的', '分封制', '禅让制', '分封制', '郡县制', '世袭制', '');
INSERT INTO `competition_choiceinfo` VALUES ('54', '1', '2019-01-11 05:40:20.278803', '2019-01-11 05:40:20.278803', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '春秋时期第一个霸主是                                  （   ）', '齐桓公', '齐桓公', '晋文公', '楚庄王', '越王勾践', '');
INSERT INTO `competition_choiceinfo` VALUES ('55', '1', '2019-01-11 05:40:20.279802', '2019-01-11 05:40:20.279802', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '中国几千年历史凝结有许多成语故事，其中不少闪烁着睿智的光芒，成为传统文化的瑰宝。“围魏救赵”的故事发生在下列哪 一历史时期              （   ）', '战国', '西周', '春秋', '战国', '秦汉', '');
INSERT INTO `competition_choiceinfo` VALUES ('56', '1', '2019-01-11 05:40:20.279802', '2019-01-11 05:40:20.279802', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '2013年，汉字听写大会在CCTV1播出，至今已举办六期。它使传承华夏文明的信念得以凝聚，汉字书写美德的观念得以传递。下列有关中国文字的叙述，不正确的是（   ）', '黄帝发明的文字使用至今', '黄帝发明的文字使用至今', '甲骨文是我国已知最早的汉字', '我国有文字记载的历史，从商朝开始', '秦朝的“书同文”对文字的规范化使用有重要意义', '');
INSERT INTO `competition_choiceinfo` VALUES ('57', '1', '2019-01-11 05:40:20.280801', '2019-01-11 05:40:20.280801', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '“中华开国五千年，神州轩辕自古传，创造指南车，平定蚩尤乱。”文中“轩辕”指的是                                  (   )', '黄帝', '黄帝', '禹', '启', '汤', '');
INSERT INTO `competition_choiceinfo` VALUES ('58', '1', '2019-01-11 05:40:20.281800', '2019-01-11 05:40:20.281800', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '帝王世代沿袭的王位世袭制在中国延续了近四千年，父子相传、兄终弟及……对中国社会影响深远。这种制度开始于                      （   ）', '禹传子，家天下', '舜传位于禹', '禹传子，家天下', '秦始皇统一六国', '汉武帝大一统', '');
INSERT INTO `competition_choiceinfo` VALUES ('59', '1', '2019-01-11 05:40:20.281800', '2019-01-11 05:40:20.282801', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '商朝多次迁都，到商王（   ）时迁到殷', '盘庚', '汤', '武丁', '盘庚', '纣', '');
INSERT INTO `competition_choiceinfo` VALUES ('60', '1', '2019-01-11 05:40:20.282801', '2019-01-11 05:40:20.282801', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '春秋时期，一些诸侯国设置县、郡，委派官员管理，由此产生的影响是   （   ）', '分封制逐步遭到瓦解', '周王室的统治势力大减', '分封制逐步遭到瓦解', '原有的土地制度逐渐遭到破话', '诸侯竞相争霸，操控政治局面', '');
INSERT INTO `competition_choiceinfo` VALUES ('61', '1', '2019-01-11 05:40:20.283800', '2019-01-11 05:40:20.283800', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '春秋时期，社会经济发展的表现不包括                 （   ）', '出现纸质货币', '出现铁制农具和牛耕', '出现一些水利工程', '手工业规模扩大，专业化程度提高', '出现纸质货币', '');
INSERT INTO `competition_choiceinfo` VALUES ('62', '1', '2019-01-11 05:40:20.360768', '2019-01-11 05:40:20.360768', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '(2014•内蒙巴彦淖尔市前旗四中七上期末卷•3)下列史实，标志着我国世袭制代替禅让制的是(　　)', ' 禹传子，家天下', ' 尧传位于舜', ' 舜传位于禹', ' 禹传子，家天下', '启打败有扈氏', '');
INSERT INTO `competition_choiceinfo` VALUES ('63', '1', '2019-01-11 05:40:20.361756', '2019-01-11 05:40:20.361756', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '(2018•北京海淀区七上期末卷•8)公元前770年，周平王迁都洛邑(今洛阳)，东周开始。在时间的表述方法上还可以写作(　　)', '公元前8世纪早期', '公元前7世纪早期', '公元前7世纪末期', '公元前8世纪早期', '公元前8世纪末期', '');
INSERT INTO `competition_choiceinfo` VALUES ('64', '1', '2019-01-11 05:40:20.362755', '2019-01-11 05:40:20.362755', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '清明上河图的作者是哪一个朝代的人？', '北宋', '南宋', '北宋', '晚唐', '元朝', '');
INSERT INTO `competition_choiceinfo` VALUES ('65', '1', '2019-01-11 05:40:20.362755', '2019-01-11 05:40:20.362755', '', null, '0', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '天子呼来不上船，自称臣是酒中仙。说的是哪一位人物？', '李白', '杜甫', '王之涣', '李白', '贾岛', '');
INSERT INTO `competition_choiceinfo` VALUES ('66', '1', '2019-01-11 07:21:23.817999', '2019-01-11 07:21:23.817999', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '我国现行宪法是由第五届全国人民代表大会第五次会议于（  ）年通过的。', '1982', '1954', '1975', '1978', '1982', '');
INSERT INTO `competition_choiceinfo` VALUES ('67', '1', '2019-01-11 07:21:23.820997', '2019-01-11 07:21:23.820997', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '我国现行宪法除序言外，有一百三十八条，其四个修正案共有（  ）条。', '三十一', '三十', '三十一', '二十', '二十一', '');
INSERT INTO `competition_choiceinfo` VALUES ('68', '1', '2019-01-11 07:21:23.822011', '2019-01-11 07:21:23.822011', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '根据我国宪法规定，国家保护和改善生活环境和（  ），防治污染和其他公害。', '生态环境', '生态平衡', '生存环境', '自然环境', '生态环境', '');
INSERT INTO `competition_choiceinfo` VALUES ('69', '1', '2019-01-11 07:21:23.822996', '2019-01-11 07:21:23.822996', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '我国宪法规定，（  ）是我国的根本制度。', '社会主义制度', '人民民主专政', '生产资料公有制', '社会主义制度', '人民代表大会制度', '');
INSERT INTO `competition_choiceinfo` VALUES ('70', '1', '2019-01-11 07:21:23.824010', '2019-01-11 07:21:23.824010', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '我国宪法规定，国家推行计划生育，使人口的增长同经济和（  ）相适应。', '社会发展计划', '社会发展', '社会资源的增长', '生态环境', '社会发展计划', '');
INSERT INTO `competition_choiceinfo` VALUES ('71', '1', '2019-01-11 07:21:23.825018', '2019-01-11 07:21:23.825018', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '社会主义初级阶段，国家坚持（  ）的分配制度。', '按劳分配为主体，多种分配方式并存', '按劳分配', '按劳分配与按需分配相结合', '按需分配', '按劳分配为主体，多种分配方式并存', '');
INSERT INTO `competition_choiceinfo` VALUES ('72', '1', '2019-01-11 07:21:23.826004', '2019-01-11 07:21:23.826004', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '（  ）年通过的宪法修正案增加了“中国共产党领导的多党合作和政治协商制度将长期存在和发展”的规定。', '1993', '1999', '1993', '1988', '1982', '');
INSERT INTO `competition_choiceinfo` VALUES ('73', '1', '2019-01-11 07:21:23.826994', '2019-01-11 07:21:23.826994', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '中国坚持独立自主的对外政策，坚持互相尊重（  ）、互不侵犯、互不干涉内政、平等互利、和平共处五项原则。', '主权和领土完整', '主权', '领土', '主权和领空', '主权和领土完整', '');
INSERT INTO `competition_choiceinfo` VALUES ('74', '1', '2019-01-11 07:21:23.827994', '2019-01-11 07:21:23.827994', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '一切国家机关和武装力量、各政党和各社会团体、各企业事业组织，都必须以（  ）为根本的活动准则。', '宪法和法律', '宪法和法律', '党章', '章程', '法规', '');
INSERT INTO `competition_choiceinfo` VALUES ('75', '1', '2019-01-11 07:21:23.828997', '2019-01-11 07:21:23.828997', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '中华人民共和国的一切权力属于（  ）。', '人民', '公民', '人民', '人民代表大会', '工农联盟', '');
INSERT INTO `competition_choiceinfo` VALUES ('76', '1', '2019-01-11 07:21:23.828997', '2019-01-11 07:21:23.828997', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '在法律规定范围内的个体经济、私营经济等非公有制经济是社会主义市场经济的（  ）。', '重要组成部分', '重要组成部分', '必要补充', '重要基础', '最具活力、最有前途的部分', '');
INSERT INTO `competition_choiceinfo` VALUES ('77', '1', '2019-01-11 07:21:23.829993', '2019-01-11 07:21:23.829993', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '在我国，国民经济中的主导力量是（  ）。', '国有经济', '国有经济', '集体经济', '私营经济', '个体经济', '');
INSERT INTO `competition_choiceinfo` VALUES ('78', '1', '2019-01-11 07:21:23.830992', '2019-01-11 07:21:23.830992', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '国家保护城乡集体经济组织的合法权利和利益，（  ）集体经济的发展。', '鼓励、指导和帮助', '保障', '监督、管理和指导', '保护', '鼓励、指导和帮助', '');
INSERT INTO `competition_choiceinfo` VALUES ('79', '1', '2019-01-11 07:21:23.830992', '2019-01-11 07:21:23.830992', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '中华人民共和国的国家机构实行（  ）的原则。', '民主集中制', '单一制', '议行合一', '民主集中制', '三权分立', '');
INSERT INTO `competition_choiceinfo` VALUES ('80', '1', '2019-01-11 07:21:23.831991', '2019-01-11 07:21:23.831991', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '各少数民族聚居的地方实行（  ），设立自治机关，行使自治权。各民族自治地方都是中华人民共和国不可分离的部分。', '区域自治', '区域自治', '民族自治', '基层群众自治', '特殊的经济制度', '');
INSERT INTO `competition_choiceinfo` VALUES ('81', '1', '2019-01-11 07:21:23.831991', '2019-01-11 07:21:23.831991', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '“中华人民共和国实行依法治国，建设社会主义法治国家。”是（  ）年通过的宪法修正案规定的。', '1999', '1988', '1993', '1999', '2004', '');
INSERT INTO `competition_choiceinfo` VALUES ('82', '1', '2019-01-11 07:21:23.832990', '2019-01-11 07:21:23.832990', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '国家在社会主义初级阶段的基本经济制度是（  ）。', '坚持以公有制为主体、多种所有制经济共同发展', '坚持以公有制为主体、多种所有制经济共同发展', '坚持按劳分配为主体、多种分配方式并存的分配制度', '坚持以全民所有制为主体、集体和其他经济成份共同发展', '坚持公有制的主体地位', '');
INSERT INTO `competition_choiceinfo` VALUES ('83', '1', '2019-01-11 07:21:23.833990', '2019-01-11 07:21:23.833990', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '我国宪法规定，宪法的修改，由全国人民代表大会常务委员会或者（  ）以上的全国人民代表大会代表提议，并由全国人民代表大会以全体代表的（ ）以上多数通过。', '五分之一，三分之二', '四分之一，三分之二', '三分之一，三分之二', '五分之一，三分之二', '四分之一，二分之一', '');
INSERT INTO `competition_choiceinfo` VALUES ('84', '1', '2019-01-11 07:21:23.833990', '2019-01-11 07:21:23.833990', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '宪法以（  ）的形式确认了中国各族人民奋斗的成果，规定了国家的根本制度和根本任务，是国家的根本法，具有最高的法律效力。', '法律', '序言', '法律', '文件', '决议', '');
INSERT INTO `competition_choiceinfo` VALUES ('85', '1', '2019-01-11 07:21:23.863972', '2019-01-11 07:21:23.863972', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '中央和地方的国家机构职权的划分，遵循在中央的统一领导下，充分发挥地方的（  ）的原则。', '主动性、积极性', '主动性、积极性', '主动性、能动性', '积极性、创造性', '能动性、创造性', '');
INSERT INTO `competition_choiceinfo` VALUES ('86', '1', '2019-01-11 07:21:23.864972', '2019-01-11 07:21:23.864972', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '人民检察院是国家的（  ）。', '法律监督机关', '监察机关', '法律监督机关', '法律检察机关', '纪律检察机关', '');
INSERT INTO `competition_choiceinfo` VALUES ('87', '1', '2019-01-11 07:21:23.864972', '2019-01-11 07:21:23.864972', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '我国从（  ）年开始采用宪法修正案的方式对现行宪法进行修改。', '1988年', '1986年', '1988年', '1993年', '1995年', '');
INSERT INTO `competition_choiceinfo` VALUES ('88', '1', '2019-01-11 07:21:23.865971', '2019-01-11 07:21:23.865971', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '到目前为止，我国对现行宪法进行了（  ）次修改。', '四', '一', '两', '三', '四', '');
INSERT INTO `competition_choiceinfo` VALUES ('89', '1', '2019-01-11 07:21:23.866971', '2019-01-11 07:21:23.866971', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '设立特别行政区的法律依据是（  ）。', '宪法第三十一条', '宪法序言', '宪法第三十一条', '中英联合声明', '香港基本法', '');
INSERT INTO `competition_choiceinfo` VALUES ('90', '1', '2019-01-11 07:21:23.866971', '2019-01-11 07:21:23.866971', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '有权决定特别行政区设立的国家机关是（  ）。', '全国人民代表大会', '全国人民代表大会', '全国人大常委会', '国务院', '国家主席', '');
INSERT INTO `competition_choiceinfo` VALUES ('91', '1', '2019-01-11 07:21:23.867970', '2019-01-11 07:21:23.867970', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '最高人民法院院长由（  ）选举和罢免', '全国人民代表大会', '全国人民代表大会', '全国人大常委会', '国家主席', '国务院', '');
INSERT INTO `competition_choiceinfo` VALUES ('92', '1', '2019-01-11 07:21:23.868969', '2019-01-11 07:21:23.868969', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '（  ）领导全国武装力量。', '中华人民共和国中央军事委员会', '中华人民共和国中央军事委员会', '国务院', '国防部', '国家主席', '');
INSERT INTO `competition_choiceinfo` VALUES ('93', '1', '2019-01-11 07:21:23.868969', '2019-01-11 07:21:23.868969', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '国家（  ）非公有制经济的发展，并对非公有制经济依法实行监督和管理。', '鼓励、支持和引导', '保障、鼓励和支持', '鼓励 、引导和帮助', '引导、支持和保障', '鼓励、支持和引导', '');
INSERT INTO `competition_choiceinfo` VALUES ('94', '1', '2019-01-11 07:21:23.869971', '2019-01-11 07:21:23.869971', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '任何组织或者个人不得侵占、买卖或者以其他形式非法转让土地。土地的（  ）可以依照法律的规定转让。', '使用权', '所有权', '使用权', '占有权', '收益权', '');
INSERT INTO `competition_choiceinfo` VALUES ('95', '1', '2019-01-11 07:21:23.869971', '2019-01-11 07:21:23.869971', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '国家举办各种学校，普及（  ），发展中等教育、职业教育和高等教育，并且发展学前教育。', '初等义务教育', '初级义务教育', '中级义务教育', '初等义务教育', '初等教育', '');
INSERT INTO `competition_choiceinfo` VALUES ('96', '1', '2019-01-11 07:21:23.870968', '2019-01-11 07:21:23.870968', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '国家推广全国通用的（  ）。', '普通话', '普通话', '北京话', '广东话', '湖南话', '');
INSERT INTO `competition_choiceinfo` VALUES ('97', '1', '2019-01-11 07:21:23.871968', '2019-01-11 07:21:23.871968', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '一切国家机关实行（  ）的原则，实行工作责任制，实行工作人员的培训和考核制度，不断提高工作质量和工作效率，反对官僚主义。', '精简', '创新', '精简', '考试', '轮岗', '');
INSERT INTO `competition_choiceinfo` VALUES ('98', '1', '2019-01-11 07:21:23.871968', '2019-01-11 07:21:23.871968', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '国家在必要时得设立特别行政区。在特别行政区内实行的制度按照具体情况由（  ）以法律规定。', '全国人民代表大会', '全国人民代表大会', '中央人民政府', '全国人大常委会', '国务院', '');
INSERT INTO `competition_choiceinfo` VALUES ('99', '1', '2019-01-11 07:21:23.872967', '2019-01-11 07:21:23.872967', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '中华人民共和国对于因为（  ）原因要求避难的外国人，可以给予受庇护的权利。', '政治', '经济', '政治', '军事', '宗教', '');
INSERT INTO `competition_choiceinfo` VALUES ('100', '1', '2019-01-11 07:21:23.873967', '2019-01-11 07:21:23.873967', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '凡具有中华人民共和国国籍的人都是中华人民共和国（  ）。', '公民', '人民', '居民', '公民', '国民', '');
INSERT INTO `competition_choiceinfo` VALUES ('101', '1', '2019-01-11 07:21:23.874966', '2019-01-11 07:21:23.874966', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '任何公民，非经（  ）批准或者决定或者（ ）决定，并由（ ）执行，不受逮捕。', '人民检察院，人民法院，公安机关', '人民检察院，人民法院，公安机关', '人民法院，人民检察院，公安机关', '人民法院，公安机关，人民检察院', '公安机关，人民检察院，人民法院', '');
INSERT INTO `competition_choiceinfo` VALUES ('102', '1', '2019-01-11 07:21:23.874966', '2019-01-11 07:21:23.874966', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '除因国家安全或者追查刑事犯罪的需要，由公安机关或者（  ）依照法律规定的程序对通信进行检查外，任何组织或者个人不得以任何理由侵犯公民的通信自由和通信秘密。', '检察机关', '监察机关', '司法机关', '检察机关', '其他执法机关', '');
INSERT INTO `competition_choiceinfo` VALUES ('103', '1', '2019-01-11 07:21:23.875965', '2019-01-11 07:21:23.875965', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '行使国家立法权的机关是（  ）。', '全国人民代表大会和全国人民代表大会常务委员会', '全国人民代表大会', '全国人民代表大会常务委员会', '全国人民代表大会和全国人民代表大会常务委员会', '全国人民代表大会、全国人民代表大会常务委员会和国务院', '');
INSERT INTO `competition_choiceinfo` VALUES ('104', '1', '2019-01-11 07:21:23.876965', '2019-01-11 07:21:23.876965', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '全国人民代表大会由省、自治区、直辖市、特别行政区和（  ）选出的代表组成。', '军队', '军队', '少数民族地区', '各社会团体', '各行业协会', '');
INSERT INTO `competition_choiceinfo` VALUES ('105', '1', '2019-01-11 07:21:23.876965', '2019-01-11 07:21:23.876965', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '我国宪法规定，全国人大常委会的组成人员中，应当有适当名额的（  ）。', '少数民族代表', '行政人员代表', '司法机关人员代表', '社会团体代表', '少数民族代表', '');
INSERT INTO `competition_choiceinfo` VALUES ('106', '1', '2019-01-11 07:21:23.877964', '2019-01-11 07:21:23.877964', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '由全国人民代表大会决定人选，不由全国人民代表大会选举的是（  ）。', '国务院副总理', '中华人民共和国副主席', '最高人民法院院长', '国务院副总理', '最高人民检察院检察长', '');
INSERT INTO `competition_choiceinfo` VALUES ('107', '1', '2019-01-11 07:21:23.878964', '2019-01-11 07:21:23.878964', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '全国人民代表大会任期届满的（  ），全国人民代表大会常务委员会必须完成下届全国人民代表大会代表的选举。', '两个月以前', '两个月以前', '两个月以内', '一个月以前', '一个月以内', '');
INSERT INTO `competition_choiceinfo` VALUES ('108', '1', '2019-01-11 07:21:23.878964', '2019-01-11 07:21:23.878964', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '在我国，有权制定和修改刑事、民事、国家机构的和其他的基本法律的是（  ）。', '全国人民代表大会', '全国人民代表大会和全国人民代表大会常务委员会', '全国人民代表大会', '全国人民代表大会常务委员会', '全国人民代表大会、全国人民代表大会常务委员会和国务院', '');
INSERT INTO `competition_choiceinfo` VALUES ('109', '1', '2019-01-11 07:21:23.879963', '2019-01-11 07:21:23.879963', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '宪法规定,（  ）行使监督宪法实施的职权。', '全国人民代表大会及其常委会', '全国人民代表大会', '全国人大常委会', '全国人民代表大会及其常委会', '各民主党派', '');
INSERT INTO `competition_choiceinfo` VALUES ('110', '1', '2019-01-11 07:21:23.879963', '2019-01-11 07:21:23.879963', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '宪法规定：“父母有抚养教育未成年子女的义务，（  ）。”', '成年子女有赡养扶助父母的义务', '子女有赡养扶助父母的义务', '成年子女有赡养扶助年老父母的义务', '子女有赡养扶助丧失劳动能力的父母的义务', '成年子女有赡养扶助父母的义务', '');
INSERT INTO `competition_choiceinfo` VALUES ('111', '1', '2019-01-11 07:21:23.880963', '2019-01-11 07:21:23.880963', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '居民委员会、村民委员会主任、副主任和委员由（  ）。', '居民选举', '街道办事处任命', '居民选举', '选民选举', '群众推荐上级任命', '');
INSERT INTO `competition_choiceinfo` VALUES ('112', '1', '2019-01-11 07:21:23.880963', '2019-01-11 07:21:23.880963', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '按照我国宪法的规定，国务院对各部、各委员会发布的不适当的命令、指示和规章有权（  ）。', '改变或者撤销', '改变', '变更或撤销', '改变或者撤销', '重新发布', '');
INSERT INTO `competition_choiceinfo` VALUES ('113', '1', '2019-01-11 07:21:23.881963', '2019-01-11 07:21:23.881963', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '自治州、自治县区域划分由（  ）审批。', '国务院', '自治区人民代表大会', '国务院', '自治区人民政府', '全国人大常委会', '');
INSERT INTO `competition_choiceinfo` VALUES ('114', '1', '2019-01-11 07:21:23.882962', '2019-01-11 07:21:23.882962', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '最高人民法院（  ）地方各级人民法院的审判工作，最高人民检察院（A）地方各级人民检察院的工作。', '监督，领导', '监督，领导', '领导，领导', '领导，监督', '监督，监督', '');
INSERT INTO `competition_choiceinfo` VALUES ('115', '1', '2019-01-11 07:21:23.882962', '2019-01-11 07:21:23.882962', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '我国宪法的解释权属于（  ）。', '全国人大常委会', '全国人民代表大会', '国务院', '全国人大常委会', '全国人民代表大会法律委员会', '');
INSERT INTO `competition_choiceinfo` VALUES ('116', '1', '2019-01-11 07:21:23.883961', '2019-01-11 07:21:23.883961', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '中华人民共和国主席代表中华人民共和国，进行国事活动，接受外国使节；根据（  ），派遣和召回驻外全权代表，批准和废除同外国缔结的条约和重要协定。', '全国人民代表大会常务委员会的决定', '全国人民代表大会的决定', '全国人民代表大会常务委员会的决定', '国务院的决定', '全国人民代表大会和全国人民代表大会常务委员会的决定', '');
INSERT INTO `competition_choiceinfo` VALUES ('117', '1', '2019-01-11 07:21:23.884968', '2019-01-11 07:21:23.884968', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '乡、民族乡、镇的人民代表大会每届任期（  ）。', '五年', '五年', '四年', '三年', '两年', '');
INSERT INTO `competition_choiceinfo` VALUES ('118', '1', '2019-01-11 07:21:23.884968', '2019-01-11 07:21:23.884968', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '中华人民共和国国徽中间是五星照耀下的天安门，周围是（  ）。', '谷穗和齿轮', '镰刀和斧头', '锤子和斧头', '镰刀和齿轮', '谷穗和齿轮', '');
INSERT INTO `competition_choiceinfo` VALUES ('119', '1', '2019-01-11 07:21:23.885960', '2019-01-11 07:21:23.885960', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '自治区的自治条例和单行条例需（  ）生效。', '报全国人大常委会批准后', '报全国人大常委会备案后', '报全国人大常委会批准后', '报全国人大常委会和国务院备案后', '报国务院批准后', '');
INSERT INTO `competition_choiceinfo` VALUES ('120', '1', '2019-01-11 07:21:23.886959', '2019-01-11 07:21:23.886959', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '宪法规定，中华人民共和国是工人阶级领导的，以工农联盟为基础的（  ）的社会主义国家。', '人民民主专政', '无产阶级专政', '民主共和', '多党合作', '人民民主专政', '');
INSERT INTO `competition_choiceinfo` VALUES ('121', '1', '2019-01-11 07:21:23.886959', '2019-01-11 07:21:23.886959', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '居民委员会是（  ）。', '基层群众性自治组织', '基层自治性群众组织', '基层群众性自治组织', '基层政权机关', '基层政权机关的派出机关', '');
INSERT INTO `competition_choiceinfo` VALUES ('122', '1', '2019-01-11 07:21:23.887960', '2019-01-11 07:21:23.887960', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '国务院总理人选由（  ）提名,全国人民代表大会决定。', '国家主席', '全国人大常委会', '全国人民代表大会主席团', '中共中央总书记', '国家主席', '');
INSERT INTO `competition_choiceinfo` VALUES ('123', '1', '2019-01-11 07:21:23.888959', '2019-01-11 07:21:23.888959', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '我国公民有受教育的（  ）。', '权利和义务', '权利和义务', '责任', '要求', '权力', '');
INSERT INTO `competition_choiceinfo` VALUES ('124', '1', '2019-01-11 07:21:23.888959', '2019-01-11 07:21:23.888959', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '有权决定特赦的国家机关是（  ）。', '全国人民代表大会常务委员会', '全国人民代表大会代表大会', '全国人民代表大会常务委员会', '国务院', '最高人民法院', '');
INSERT INTO `competition_choiceinfo` VALUES ('125', '1', '2019-01-11 07:21:23.889958', '2019-01-11 07:21:23.889958', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '全国人民代表大会常务委员会的重要日常工作由（  ）处理。', '委员长会议', '委员长', '委员长会议', '秘书长', '各专门委员会', '');
INSERT INTO `competition_choiceinfo` VALUES ('126', '1', '2019-01-11 07:21:23.890958', '2019-01-11 07:21:23.890958', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '中国人民政治协商会议是有广泛代表性的（  ）。', '统一战线组织', '法律监督机关', '中央国家机关', '民主党派组织', '统一战线组织', '');
INSERT INTO `competition_choiceinfo` VALUES ('127', '1', '2019-01-11 07:21:23.890958', '2019-01-11 07:21:23.890958', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '在全国人民代表大会开会期间，非经（  ）的许可，全国人民代表大会代表不受逮捕或者刑事审判。', '全国人民代表大会会议主席团', '全国人民代表大会会议主席团', '全国人民代表大会', '委员长会议', '全国人民代表大会常务委员会', '');
INSERT INTO `competition_choiceinfo` VALUES ('128', '1', '2019-01-11 07:21:23.891964', '2019-01-11 07:21:23.891964', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '宪法规定，我国的人民法院是（  ）。', '国家的审判机关', '国家的司法机关', '国家的法律监督机关', '国家的仲裁机关', '国家的审判机关', '');
INSERT INTO `competition_choiceinfo` VALUES ('129', '1', '2019-01-11 07:21:23.891964', '2019-01-11 07:21:23.891964', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '宪法规定，中央军委主席（  ）。', '对全国人民代表大会和全国人民代表大会常务委员会负责', '对全国人民代表大会负责', '对全国人民代表大会负责并报告工作', '对全国人民代表大会和全国人民代表大会常务委员会负责', '对全国人民代表大会常务委员会负责并报告工作', '');
INSERT INTO `competition_choiceinfo` VALUES ('130', '1', '2019-01-11 07:21:23.892957', '2019-01-11 07:21:23.892957', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '自治区主席、自治州州长、自治县县长由（  ）担任。', '实行区域自治的民族的公民', '实行区域自治的民族的公民', '实行区域自治的民族的人民', '少数民族的公民', '自治地方的各民族公民', '');
INSERT INTO `competition_choiceinfo` VALUES ('131', '1', '2019-01-11 07:21:23.893956', '2019-01-11 07:21:23.893956', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '（  ）行使撤销省、自治区、直辖市国家权力机关制定的同宪法、法律和行政法规相抵触的地方性法规和决议的职权。', '全国人民代表大会常务委员会', '全国人民代表大会', '全国人民代表大会常务委员会', '国务院', '最高人民检察院', '');
INSERT INTO `competition_choiceinfo` VALUES ('132', '1', '2019-01-11 07:21:23.893956', '2019-01-11 07:21:23.893956', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '依照宪法规定，中华人民共和国主席、副主席都缺位的时候，由全国人民代表大会补选。在补选以前，应由（  ）暂时代理主席职位。', '全国人民代表大会常务委员会委员长', '最高人民法院院长', '中央军事委员会主席', '国务院总理', '全国人民代表大会常务委员会委员长', '');
INSERT INTO `competition_choiceinfo` VALUES ('133', '1', '2019-01-11 07:21:23.894955', '2019-01-11 07:21:23.894955', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '不属于民族自治地方的自治机关的是（  ）。', '四川省北川羌族自治县人民法院', '内蒙古自治区人民代表大会', '湖南省湘西土家族苗族自治州人民政府', '四川省北川羌族自治县人民法院', '海南省白沙黎族自治县人民政府', '');
INSERT INTO `competition_choiceinfo` VALUES ('134', '1', '2019-01-11 07:21:23.894955', '2019-01-11 07:21:23.894955', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '在全国人民代表大会闭会期间，全国人大常委会根据最高人民法院院长的提请，可以任免除（  ）以外的人员。', '高级人民法院院长', '高级人民法院院长', '军事法院院长', '最高人民法院副院长', '最高人民法院审判员', '');
INSERT INTO `competition_choiceinfo` VALUES ('135', '1', '2019-01-11 07:21:23.895954', '2019-01-11 07:21:23.895954', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '我国的宪法修正案以（  ）的形式公布施行。', '中华人民共和国全国人民代表大会公告', '中华人民共和国主席令', '中华人民共和国全国人民代表大会公告', '中华人民共和国全国人民代表大会常务委员会公报', '国务院令', '');
INSERT INTO `competition_choiceinfo` VALUES ('136', '1', '2019-01-11 07:21:23.896954', '2019-01-11 07:21:23.896954', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '居民委员会、村民委员会同基层政权的相互关系由（  ）规定。', '法律', '宪法', '法律', '行政法规', '民政部门', '');
INSERT INTO `competition_choiceinfo` VALUES ('137', '1', '2019-01-11 07:21:23.896954', '2019-01-11 07:21:23.896954', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '（  ）有权依照法律规定的程序提出对国务院或者国务院各部、各委员会的质询案。', '全国人民代表大会代表，全国人民代表大会常务委员会组成人员', '省人大代表', '市人大代表', '全国人民代表大会代表，全国人民代表大会常务委员会组成人员', '最高人民检察院', '');
INSERT INTO `competition_choiceinfo` VALUES ('138', '1', '2019-01-11 07:21:23.945951', '2019-01-11 07:21:23.945951', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '关于罢免全国人民代表大会代表，表述正确的是（  ）。', '原选举单位有权依照法律规定的程序罢免本单位选出的代表', '全国人民代表大会有权罢免全国人民代表大会代表', '原选举单位有权依照法律规定的程序罢免本单位选出的代表', '全国人民代表大会主席团有权罢免全国人民代表大会代表', '县人民代表大会有权依照法律规定的程序罢免本地区的全国人民代表大会代表', '');
INSERT INTO `competition_choiceinfo` VALUES ('139', '1', '2019-01-11 07:21:23.946938', '2019-01-11 07:21:23.946938', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '下列人员中，不属于国务院组成人员的是（  ）。', '国务院外事办公室主任', '国务院外事办公室主任', '国务委员', '副总理', '各部部长', '');
INSERT INTO `competition_choiceinfo` VALUES ('140', '1', '2019-01-11 07:21:23.947944', '2019-01-11 07:21:23.947944', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '国务院审计机关在（  ）领导下，依照法律规定独立行使审计监督权，不受其他行政机关、社会团体和个人的干涉。', '国务院总理', '国务院总理', '全国人大常委会委员长', '国家主席', '全国政协主席', '');
INSERT INTO `competition_choiceinfo` VALUES ('141', '1', '2019-01-11 07:21:23.948943', '2019-01-11 07:21:23.948943', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '在不同宪法、法律、行政法规相抵触的前提下，可以制定地方性法规的是（  ）。', '天津市人民代表大会常务委员会', '安徽省人民政府', '安徽省肥西县人民代表大会', '天津市人民代表大会常务委员会', '上海张江高新技术产业开发区管理委员会', '');
INSERT INTO `competition_choiceinfo` VALUES ('142', '1', '2019-01-11 07:21:23.948943', '2019-01-11 07:21:23.948943', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '各民族公民都有用（  ）语言文字进行诉讼的权利', '本民族', '当地通用的', '本民族', '其他民族', '自己通晓的', '');
INSERT INTO `competition_choiceinfo` VALUES ('143', '1', '2019-01-11 07:21:23.949924', '2019-01-11 07:21:23.949924', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '省辖市人民代表大会常务委员会的组成人员可以担任的职位是（  ）。', '市委政法委书记', '市委政法委书记', '市司法局局长', '市中级人民法院院长', '市人民检察院检察长', '');
INSERT INTO `competition_choiceinfo` VALUES ('144', '1', '2019-01-11 07:21:23.950923', '2019-01-11 07:21:23.950923', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '广西壮族自治区人民代表大会有权制定（  ）。', '自治条例和单行条例', '法律', '自治条例和单行条例', '政府规章', '行政法规', '');
INSERT INTO `competition_choiceinfo` VALUES ('145', '1', '2019-01-11 07:21:23.956920', '2019-01-11 07:21:23.956920', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '人民法院、人民检察院和公安机关办理（  ），应当分工负责，互相配合，互相制约，以保证准确有效地执行法律。', '刑事案件', '刑事案件', '民事案件', '经济案件', '行政案件', '');
INSERT INTO `competition_choiceinfo` VALUES ('146', '1', '2019-01-11 07:21:23.957932', '2019-01-11 07:21:23.957932', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '县级以上的地方各级人民代表大会常务委员会对本级人民政府、人民法院、人民检察院行使（  ）。', '监督权', '指导权', '监督权', '批评建议权', '管理权', '');
INSERT INTO `competition_choiceinfo` VALUES ('147', '1', '2019-01-11 07:21:23.958937', '2019-01-11 07:21:23.958937', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '最高人民检察院副检察长、检察委员会委员、检察员和军事检察院检察长由（  ）。', '最高人民检察院检察长提请全国人民代表大会常务委员会任免', '最高人民检察院检察长任免', '最高人民检察院检察长提请全国人民代表大会任免', '最高人民检察院检察长提请全国人民代表大会常务委员会任免', '全国人民代表大会常务委员会任免', '');
INSERT INTO `competition_choiceinfo` VALUES ('148', '1', '2019-01-11 07:21:23.958937', '2019-01-11 07:21:23.958937', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '有权决定乡、民族乡、镇的建置和区域划分的有（  ）。', '省人民政府', '国务院', '省人民政府', '省辖市人民政府', '县人民政府', '');
INSERT INTO `competition_choiceinfo` VALUES ('149', '1', '2019-01-11 07:21:23.959917', '2019-01-11 07:21:23.959917', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '地方各级人民政府是地方各级国家权力机关的（  ），是地方各级国家行政机关。', '执行机关', '下属机关', '行政机关', '监督机关', '执行机关', '');
INSERT INTO `competition_choiceinfo` VALUES ('150', '1', '2019-01-11 07:21:23.960917', '2019-01-11 07:21:23.960917', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '宪法规定，我国享有选举权和被选举权的人是（  ）。', '年满18周岁未被依法剥夺政治权利的公民', '全体公民', '全体人民', '18周岁以上的公民', '年满18周岁未被依法剥夺政治权利的公民', '');
INSERT INTO `competition_choiceinfo` VALUES ('151', '1', '2019-01-11 07:21:23.960917', '2019-01-11 07:21:23.960917', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '全国人民代表大会每年举行一次，由（  ）召集。', '全国人民代表大会常务委员会', '全国人民代表大会常务委员会', '全国人民代表大会主席团', '委员长会议', '委员长', '');
INSERT INTO `competition_choiceinfo` VALUES ('152', '1', '2019-01-11 07:21:23.961917', '2019-01-11 07:21:23.961917', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '在全国人民代表大会闭会期间，全国人民代表大会常务委员会有权审查和批准国民经济和社会发展计划、国家预算在执行过程中所必须作的（  ）调整方案。', '部分', '整体', '部分', '重大', '个别', '');
INSERT INTO `competition_choiceinfo` VALUES ('153', '1', '2019-01-11 07:21:23.962916', '2019-01-11 07:21:23.962916', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '中华人民共和国公民在（  ）的情况下，有从国家和社会获得物质帮助的权利。', '年老、疾病或者丧失劳动能力', '欠债', '受伤害', '年老、疾病或者丧失劳动能力', '未成年', '');
INSERT INTO `competition_choiceinfo` VALUES ('154', '1', '2019-01-11 07:21:23.962916', '2019-01-11 07:21:23.962916', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '国务院实行（  ）负责制。', '总理', '国务院全体会议', '国务院常务会议', '总理', '集体', '');
INSERT INTO `competition_choiceinfo` VALUES ('155', '1', '2019-01-11 07:21:23.963916', '2019-01-11 07:21:23.963916', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '关于民族自治地方的人民代表大会的立法权限，下列表述中正确的是（  ）。', '自治区、自治州、自治县的人民代表大会有权依照当地民族的政治、经济和文化的特点，制定自治条例和单行条例', '自治区、自治州、自治县的人民代表大会有权依照当地民族的政治、经济和文化的特点，制定自治条例和单行条例', '自治州的人民代表大会及其常务委员会有权制定单行条例', '自治县的人民代表大会有权制定地方性法规', '自治区人民代表大会常务委员会有权制定自治条例', '');
INSERT INTO `competition_choiceinfo` VALUES ('156', '1', '2019-01-11 07:21:23.963916', '2019-01-11 07:21:23.963916', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '爱国统一战线由中国共产党领导，有各民主党派和各人民团体参加，包括全体社会主义劳动者、社会主义事业的建设者、拥护社会主义的爱国者和拥护（  ）的爱国者。', '祖国统一', '中国共产党', '祖国统一', '中华民族', '人民民主专政', '');
INSERT INTO `competition_choiceinfo` VALUES ('157', '1', '2019-01-11 07:21:23.964935', '2019-01-11 07:21:23.964935', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '农村集体经济组织实行（  ）为基础、统分结合的双层经营体制。', '家庭承包经营', '家庭承包经营', '个人承包经营', '分田到户', '个体经营', '');
INSERT INTO `competition_choiceinfo` VALUES ('158', '1', '2019-01-11 07:21:23.965914', '2019-01-11 07:21:23.965914', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '农村的宅基地和自留地、自留山，属于（  ）所有。', '集体', '国家', '农户', '集体', '全民', '');
INSERT INTO `competition_choiceinfo` VALUES ('159', '1', '2019-01-11 07:21:23.965914', '2019-01-11 07:21:23.965914', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '集体经济组织实行（  ），依照法律规定选举和罢免管理人员，决定经营管理的重大问题。', '民主管理', '民主决策', '共同经营', '民主监督', '民主管理', '');
INSERT INTO `competition_choiceinfo` VALUES ('160', '1', '2019-01-11 07:21:23.966913', '2019-01-11 07:21:23.966913', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '下列有关宗教信仰自由的表述中，不正确的有（  ）。', '少数民族聚居区的学校应该开设宗教课程', '任何组织和个人不得强制公民信仰宗教或者不信仰宗教', '少数民族聚居区的学校应该开设宗教课程', '不得歧视信仰宗教的公民和不信仰宗教的公民', '宗教团体和宗教事务不受外国势力的支配', '');
INSERT INTO `competition_choiceinfo` VALUES ('161', '1', '2019-01-11 07:21:23.967913', '2019-01-11 07:21:23.967913', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '决定战争和和平的问题的国家机关是（  ）。', '全国人民代表大会', '全国人民代表大会', '全国人民代表大会常务委员会', '国家主席', '国务院', '');
INSERT INTO `competition_choiceinfo` VALUES ('162', '1', '2019-01-11 07:21:23.967913', '2019-01-11 07:21:23.967913', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '有关全国人民代表大会常务委员会的任免权的表述中，不正确的为（  ）。', '在全国人民代表大会闭会期间，任免最高人民检察院助理检察员', '在全国人民代表大会闭会期间，根据国务院总理的提名，决定部长的人选', '根据最高人民法院院长的提请，任免最高人民法院审判员', '在全国人民代表大会闭会期间，任免最高人民检察院助理检察员', '决定驻外全权代表的任免', '');
INSERT INTO `competition_choiceinfo` VALUES ('163', '1', '2019-01-11 07:21:23.968932', '2019-01-11 07:21:23.968932', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '（  ）统一领导全国地方各级国家行政机关的工作，规定中央和省、自治区、直辖市的国家行政机关的职权的具体划分。', '国务院', '全国人民代表大会', '国务院', '全国人民代表大会常务委员会', '国家主席', '');
INSERT INTO `competition_choiceinfo` VALUES ('164', '1', '2019-01-11 07:21:23.969912', '2019-01-11 07:21:23.969912', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '中华人民共和国建立初期曾起到过临时宪法作用的是（  ）', '《中国人民政治协商会议共同纲领》', '《中国人民政治协商会议共同纲领》', '《中国人民政治协商会议章程》', '《政务院及所属各机关组织通则》', '《各界人民代表会议组织通则》', '');
INSERT INTO `competition_choiceinfo` VALUES ('165', '1', '2019-01-11 07:21:23.969912', '2019-01-11 07:21:23.969912', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '2004年宪法修正案作出了（  ）条修改。', '十四', '十', '十二', '十四', '十五', '');
INSERT INTO `competition_choiceinfo` VALUES ('166', '1', '2019-01-11 07:21:23.970911', '2019-01-11 07:21:23.970911', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '国家建立健全同（  ）相适应的社会保障制度。', '经济发展水平', '经济发展水平', '财政状况', '社会发展', '公民需要', '');
INSERT INTO `competition_choiceinfo` VALUES ('167', '1', '2019-01-11 07:21:23.971910', '2019-01-11 07:21:23.971910', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '（  ）首次将社会主义市场经济写入宪法。', '1993年宪法修正案', '1982年宪法', '1988年修正案', '1993年宪法修正案', '1999年宪法修正案', '');
INSERT INTO `competition_choiceinfo` VALUES ('168', '1', '2019-01-11 07:21:23.971910', '2019-01-11 07:21:23.971910', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '全国人民代表大会会议每年举行一次。如果全国人民代表大会认为有必要，或者有（  ）以上的全国人民代表大会代表提议，可以临时召集全国人民代表大会会议。', '五分之一', '八分之一', '七分之一', '六分之一', '五分之一', '');
INSERT INTO `competition_choiceinfo` VALUES ('169', '1', '2019-01-11 07:21:23.972910', '2019-01-11 07:21:23.972910', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '“我国正处于社会主义初级阶段”是在（  ）中确认的。', '1993年宪法修正案', '1999年宪法修正案', '1982年宪法', '1988年宪法修正案', '1993年宪法修正案', '');
INSERT INTO `competition_choiceinfo` VALUES ('170', '1', '2019-01-11 07:21:23.972910', '2019-01-11 07:21:23.972910', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '“我国将长期处于社会主义初级阶段”是在（  ）中确认的。', '1999年宪法修正案', '2004年宪法修正案', '1988年宪法修正案', '1993年宪法修正案', '1999年宪法修正案', '');
INSERT INTO `competition_choiceinfo` VALUES ('171', '1', '2019-01-11 07:21:23.973909', '2019-01-11 07:21:23.973909', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '（  ）宪法修正案把邓小平理论载入宪法。', '1999年', '1988年', '1993年', '1999年', '2004年', '');
INSERT INTO `competition_choiceinfo` VALUES ('172', '1', '2019-01-11 07:21:23.974909', '2019-01-11 07:21:23.974909', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '全国人民代表大会每届任期（  ）。', '五年', '三年', '五年', '两年', '四年', '');
INSERT INTO `competition_choiceinfo` VALUES ('173', '1', '2019-01-11 07:21:23.974909', '2019-01-11 07:21:23.974909', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '全国法制宣传日是每年的（  ），也就是现行宪法颁布施行纪念日。', '12月4日', '12月1日', '12月20日', '12月4日', '12月8日', '');
INSERT INTO `competition_choiceinfo` VALUES ('174', '1', '2019-01-11 07:21:23.975909', '2019-01-11 07:21:23.975909', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '全国人民代表大会举行会议的时候，（  ）主持会议。', '选举主席团', '选举主席团', '全国人民代表大会常务委员会', '全国人民代表大会会议主席团', '全国人民代表大会常务委员会委员长', '');
INSERT INTO `competition_choiceinfo` VALUES ('175', '1', '2019-01-11 07:21:23.976908', '2019-01-11 07:21:23.976908', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '地方各级人民法院对（  ）负责。', '产生它的国家权力机关', '产生它的国家权力机关', '同级人民政府', '上级人民法院', '同级党委', '');
INSERT INTO `competition_choiceinfo` VALUES ('176', '1', '2019-01-11 07:21:23.976908', '2019-01-11 07:21:23.976908', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '地方各级人民检察院对（  ）负责。', '产生它的国家权力机关和上级人民检察院', '产生它的国家权力机关和上级人民检察院', '最高人民检察院', '同级人民政府', '同级党委', '');
INSERT INTO `competition_choiceinfo` VALUES ('177', '1', '2019-01-11 07:21:23.977908', '2019-01-11 07:21:23.977908', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '国务院总理、副总理、国务委员连续任职最长是 （  ）。', '两届', '一届', '两届', '三届', '四届', '');
INSERT INTO `competition_choiceinfo` VALUES ('178', '1', '2019-01-11 07:21:23.978907', '2019-01-11 07:21:23.978907', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '十届全国人民代表大会第二次会议通过的《中华人民共和国宪法修正案》，首次将（  ） 写入宪法。', '政治文明', '物质文明', '政治文明', '精神文明', '制度文明', '');
INSERT INTO `competition_choiceinfo` VALUES ('179', '1', '2019-01-11 07:21:23.978907', '2019-01-11 07:21:23.978907', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '人民代表大会制度的核心内容和实质是（  ）', '国家的一切权力属于人民', '国家的一切权力属于人民', '工人阶级领导', '国内各民族一律平等', '少数服从多数', '');
INSERT INTO `competition_choiceinfo` VALUES ('180', '1', '2019-01-11 07:21:23.979906', '2019-01-11 07:21:23.979906', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '依我国现行宪法的规定，城市的土地属于（  ）；农村和城市郊区的土地，除由法律规定属于国家所有的以外，属于（ ）。', '国家所有、集体所有', '国家所有、集体所有', '国家所有；国家所有', '集体所有；集体所有', '集体所有；国家所有', '');
INSERT INTO `competition_choiceinfo` VALUES ('181', '1', '2019-01-11 07:21:23.979906', '2019-01-11 07:21:23.979906', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '决定全国或者个别省、自治区、直辖市进入紧急状态的职权由（  ）行使。', '全国人民代表大会常务委员会', '全国人民代表大会常务委员会', '国务院', '中央军委', '国家主席', '');
INSERT INTO `competition_choiceinfo` VALUES ('182', '1', '2019-01-11 07:21:23.980906', '2019-01-11 07:21:23.980906', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '（  ）主持全国人民代表大会常务委员会的工作，召集全国人民代表大会常务委员会会议。', '全国人民代表大会常务委员会委员长', '全国人民代表大会常务委员会委员长', '全国人民代表大会常务委员会秘书长', '全国人民代表大会常务委员会主席团', '全国人民代表大会常务委员会委员长会议', '');
INSERT INTO `competition_choiceinfo` VALUES ('183', '1', '2019-01-11 07:21:23.981905', '2019-01-11 07:21:23.981905', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '宪法规定，依法服兵役和参加民兵组织是我国公民的（  ）。', '光荣义务', '神圣权利', '光荣义务', '权利和义务', '神圣职责', '');
INSERT INTO `competition_choiceinfo` VALUES ('184', '1', '2019-01-11 07:21:23.981905', '2019-01-11 07:21:23.981905', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '根据现行宪法规定，关于公民权利，下列选项正确的是（  ）。', '国家尊重和保障人权', '劳动、受教育和依法服兵役既是公民的基本权利又是公民的基本义务', '受教育权是一部分公民的权利', '公民在年老、疾病或者未丧失劳动能力的情况下，有从国家和社会获得物质帮助的权利', '国家尊重和保障人权', '');
INSERT INTO `competition_choiceinfo` VALUES ('185', '1', '2019-01-11 07:21:23.982904', '2019-01-11 07:21:23.982904', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '根据我国宪法关于公民基本权利的规定，下列说法正确的是（  ）。', '我国公民被剥夺政治权利的，其出版自由也被剥夺', '我国公民在年老、疾病或者不想劳动时有获得物质帮助的权利', '我国公民被剥夺政治权利的，其出版自由也被剥夺', '我国公民有信仰宗教与公开传教的自由', '我国公民私有财产不受侵犯', '');
INSERT INTO `competition_choiceinfo` VALUES ('186', '1', '2019-01-11 07:21:23.983904', '2019-01-11 07:21:23.983904', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '我国现行宪法规定，中华人民共和国全国武装力量由（  ）领导。', '中央军委', '中央军委', '中央军委主席', '国务院', '全国人民代表大会和国务院', '');
INSERT INTO `competition_choiceinfo` VALUES ('187', '1', '2019-01-11 07:21:24.070855', '2019-01-11 07:21:24.070855', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '根据宪法规定，有选举权和被选举权的年满（  ）周岁的中华人民共和国公民可以被选为中华人民共和国主席副主席。', '45', '50', '40', '35', '45', '');
INSERT INTO `competition_choiceinfo` VALUES ('188', '1', '2019-01-11 07:21:24.078850', '2019-01-11 07:21:24.078850', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '我国宪法规定，中华人民共和国的国家机构实行（  ）。', '民主集中制', '首长责任制', '民主集中制', '分工协作制', '议行合一制', '');
INSERT INTO `competition_choiceinfo` VALUES ('189', '1', '2019-01-11 07:21:24.079850', '2019-01-11 07:21:24.079850', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '根据我国宪法规定，全国人民代表大会和全国人大常委会认为必要时，可以组织关于特定问题的（  ） 。', '调查委员会', '专门委员会', '调查委员会', '临时委员会', '审议委员会', '');
INSERT INTO `competition_choiceinfo` VALUES ('190', '1', '2019-01-11 07:21:24.079850', '2019-01-11 07:21:24.079850', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '根据宪法规定，我国驻外全权代表由（  ）任免决定。', '全国人民代表大会常务委员会', '国家主席', '全国人民代表大会常务委员会', '全国人民代表大会', '国家主席和全国人大常委会', '');
INSERT INTO `competition_choiceinfo` VALUES ('191', '1', '2019-01-11 07:21:24.080848', '2019-01-11 07:21:24.080848', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '依照宪法,（  ）应当向全国人民代表大会报告工作。', '全国人大常委会', '中华人民共和国主席', '中央军委主席', '全国人大常委会', '中国人民政治协商会议', '');
INSERT INTO `competition_choiceinfo` VALUES ('192', '1', '2019-01-11 07:21:24.081848', '2019-01-11 07:21:24.081848', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '根据我国宪法规定， 全国人民代表大会常务委员会有权部分修改（  ）。', '法律', '宪法', '香港特别行政区法律', '法律', '国际条约', '');
INSERT INTO `competition_choiceinfo` VALUES ('193', '1', '2019-01-11 07:21:24.081848', '2019-01-11 07:21:24.081848', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '地方各级人民代表大会和地方各级人民政府组织法于1979年制定，此后经过（  ）次修改。', '四次', '两次', '三次', '四次', '五次', '');
INSERT INTO `competition_choiceinfo` VALUES ('194', '1', '2019-01-11 07:21:24.082847', '2019-01-11 07:21:24.082847', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '省、自治区、直辖市的人民代表大会根据本行政区域的具体情况和实际需要，在不同宪法、法律、行政法规相抵触的前提下，可以制定和颁布地方性法规，报（  ）备案。', '全国人民代表大会常务委员会和国务院', '全国人民代表大会和国务院', '全国人民代表大会有关专门委员会', '全国人民代表大会', '全国人民代表大会常务委员会和国务院', '');
INSERT INTO `competition_choiceinfo` VALUES ('195', '1', '2019-01-11 07:21:24.083846', '2019-01-11 07:21:24.083846', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '县级人民代表大会举行会议的时候，（  ）以上代表联名，可以提出对县人大常委会组成人员的罢免案。', '十分之一', '三十分之一', '四十分之一', '十分之一', '二十分之一', '');
INSERT INTO `competition_choiceinfo` VALUES ('196', '1', '2019-01-11 07:21:24.083846', '2019-01-11 07:21:24.084846', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '根据地方组织法规定，下列哪一选项是正确的（  ）。', '县级以上的地方各级人民代表大会可以组织关于特定问题的调查委员会', '县级以上的地方各级人民代表大会常务委员会由主任、副主任若干人，秘书长、委员若干人组成', '县级以上的地方各级人民代表大会常务委员会根据需要，可以设法制（政法）委员会等专门委员会', '县级以上的地方各级人民代表大会可以组织关于特定问题的调查委员会', '县级以上的地方各级人民代表大会会议由本级人民代表大会常务委员会召集并主持', '');
INSERT INTO `competition_choiceinfo` VALUES ('197', '1', '2019-01-11 07:21:24.084846', '2019-01-11 07:21:24.084846', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '下列关于常务委员会组成人员的名额中哪一选项正确 （  ）。', '自治州十九人至四十一人', '直辖市不超过八十五人', '自治州十九人至四十一人', '市辖区不超过二十七人', '设区的市不超过四十一人', '');
INSERT INTO `competition_choiceinfo` VALUES ('198', '1', '2019-01-11 07:21:24.085845', '2019-01-11 07:21:24.085845', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '省、自治区的人民政府所在地的市制定的地方性法规，需报省、自治区的人民代表大会常务委员会（  ）后施行。', '批准', '批准', '备案', '核准', '许可', '');
INSERT INTO `competition_choiceinfo` VALUES ('199', '1', '2019-01-11 07:21:24.085845', '2019-01-11 07:21:24.085845', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '主任会议或者（  ）以上的常务委员会组成人员书面联名，可以向本级人民代表大会常务委员会提议组织关于特定问题的调查委员会，由全体会议决定。', '五分之一', '七分之一', '八分之一', '五分之一', '十分之一', '');
INSERT INTO `competition_choiceinfo` VALUES ('200', '1', '2019-01-11 07:21:24.086864', '2019-01-11 07:21:24.086864', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '省、自治区的人民政府所在地的市人民代表大会制定的地方性法规，报（  ）批准后施行。', '省、自治区的人民代表大会常务委员会', '省、自治区的人民代表大会常务委员会', '省、自治区的人民代表大会', '省、自治区的人民代表大会有关专门委员会', '全国人民代表大会常务委员会', '');
INSERT INTO `competition_choiceinfo` VALUES ('201', '1', '2019-01-11 07:21:24.087847', '2019-01-11 07:21:24.087847', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '经国务院批准的较大的市的人民代表大会制定地方性法规，报省、自治区的人民代表大会常务委员会批准后施行，并由省、自治区的人民代表大会常务委员会报（  ）和国务院备案。', '全国人民代表大会常务委员会', '省、自治区的人民代表大会', '全国人民代表大会有关专门委员会', '全国人民代表大会', '全国人民代表大会常务委员会', '');
INSERT INTO `competition_choiceinfo` VALUES ('202', '1', '2019-01-11 07:21:24.087847', '2019-01-11 07:21:24.087847', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '经过（  ）以上代表提议，可以临时召集本级人民代表大会会议。', '五分之一', '三分之一', '四分之一', '五分之一', '十分之一', '');
INSERT INTO `competition_choiceinfo` VALUES ('203', '1', '2019-01-11 07:21:24.088858', '2019-01-11 07:21:24.088858', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '县级以上的地方各级人民代表大会会议由（  ）召集。', '本级人民代表大会常务委员会', '本级人民代表大会常务委员会', '本级人民代表大会主席团', '本级人民代表大会常务委员会主任', '本级人民代表大会常务委员会秘书长', '');
INSERT INTO `competition_choiceinfo` VALUES ('204', '1', '2019-01-11 07:21:24.089843', '2019-01-11 07:21:24.089843', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '市人民代表大会可以（  ）同级人民政府不适当的决定和命令。', '撤销', '撤销', '改变', '改变或者撤销', '', '');
INSERT INTO `competition_choiceinfo` VALUES ('205', '1', '2019-01-11 07:21:24.089843', '2019-01-11 07:21:24.089843', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '乡、民族乡、镇的人民代表大会（  ）在本级人民代表大会闭会期间负责联系本级人民代表大会代表。', '主席、副主席', '主席团', '主席、副主席', '秘书长', '代表小组', '');
INSERT INTO `competition_choiceinfo` VALUES ('206', '1', '2019-01-11 07:21:24.090842', '2019-01-11 07:21:24.090842', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '县级以上的地方各级人民代表大会举行会议时，由（  ）主持会议。', '主席团', '秘书长', '本级人民代表大会常务委员会', '主席团', '主任会议', '');
INSERT INTO `competition_choiceinfo` VALUES ('207', '1', '2019-01-11 07:21:24.091844', '2019-01-11 07:21:24.091844', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '县级以上的地方各级人民代表大会代表（  ）以上联名，可以向本级人民代表大会提出属于本级人民代表大会职权范围内的议案。', '十人', '五人', '八人', '三人', '十人', '');
INSERT INTO `competition_choiceinfo` VALUES ('208', '1', '2019-01-11 07:21:24.092857', '2019-01-11 07:21:24.092857', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '根据地方组织法的规定，下列做法正确的是（  ）。', '国务院可以改变或者撤销省政府不适当的决定、命令', '国务院可以改变或者撤销省政府不适当的决定、命令', '省级人民代表大会可以改变或者撤销本级人民政府不适当的决定、命令', '省人大常委会可以改变或者撤销市级人大及其常委会不适当的决议', '省人大常委会可以改变或者撤销本级人民政府不适当的决定、命令', '');
INSERT INTO `competition_choiceinfo` VALUES ('209', '1', '2019-01-11 07:21:24.092857', '2019-01-11 07:21:24.092857', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '乡、民族乡、镇的人民代表大会代表向本级人民代表大会提出的对各方面工作的建议、批评和意见，由本级人民代表大会（  ）交有关机关和组织研究处理并负责答复。', '主席团', '秘书长', '主席', '主席团', '副主席', '');
INSERT INTO `competition_choiceinfo` VALUES ('210', '1', '2019-01-11 07:21:24.093843', '2019-01-11 07:21:24.093843', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '根据地方组织法的规定，下列哪种说法是错误的 （  ）。', '县人大常委会由本级人民代表大会在代表中选举主任、副主任若干人、秘书长和委员若干人组成', '县人大常委会的主任、副主任不得担任国家行政机关、审判机关和检察机关的职务', '县人大常委会由本级人民代表大会在代表中选举主任、副主任若干人、秘书长和委员若干人组成', '乡、民族乡、镇的人民代表大会主席、副主席不得担任国家行政机关的职务', '省人大常委会由本级人民代表大会在代表中选举主任、副主任若干人、秘书长、委员若干人组成', '');
INSERT INTO `competition_choiceinfo` VALUES ('211', '1', '2019-01-11 07:21:24.093843', '2019-01-11 07:21:24.093843', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '地方各级人民代表大会进行选举和通过决议，以全体代表的过（  ）通过。', '半数', '四分之一', '半数', '五分之一', '三分之一', '');
INSERT INTO `competition_choiceinfo` VALUES ('212', '1', '2019-01-11 07:21:24.094855', '2019-01-11 07:21:24.094855', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '省、自治区、直辖市的人民代表大会代表（  ）以上书面联名，可以提出本级人民代表大会常务委员会组成人员，人民政府领导人员，人民法院院长，人民检察院检察长的候选人。', '三十人', '三十人', '二十五人', '二十人', '十人', '');
INSERT INTO `competition_choiceinfo` VALUES ('213', '1', '2019-01-11 07:21:24.095854', '2019-01-11 07:21:24.095854', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '省、自治区、直辖市、自治州、设区的市的人民代表大会代表受（  ）的监督。', '原选举单位', '选民', '代表小组', '原选举单位', '主席团', '');
INSERT INTO `competition_choiceinfo` VALUES ('214', '1', '2019-01-11 07:21:24.095854', '2019-01-11 07:21:24.095854', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '代表的罢免必须由原选举单位以（  ）的过半数通过，或者由原选区以选民的过半数通过。', '全体代表', '参加会议代表', '全体代表', '选民', '参加会议选民', '');
INSERT INTO `competition_choiceinfo` VALUES ('215', '1', '2019-01-11 07:21:24.096840', '2019-01-11 07:21:24.096840', '', null, '0', 'wrDZTV776KWNcCiV945FBm', '1', '县级以上的地方各级人民代表大会常务委员会是本级人民代表大会的（  ），对本级人民代表大会负责并报告工作。', '常设机关', '常设机关', '工作机构', '执行机关', '工作部门', '');
INSERT INTO `competition_choiceinfo` VALUES ('216', '1', '2019-01-11 07:24:06.260986', '2019-01-11 07:24:06.260986', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '心理过程包括（  ）', '认识过程、情感过程、意志过程', '认识过程、情感过程、行为过程', '知觉过程、情感过程、行为过程', '感觉过程、知觉过程、意志过程', '认识过程、情感过程、意志过程', '');
INSERT INTO `competition_choiceinfo` VALUES ('217', '1', '2019-01-11 07:24:06.261998', '2019-01-11 07:24:06.261998', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '用信息加工的观点来研究人的感觉、知觉、记忆、思维等心理过程的心理观点是（  ）。', '认知的观点', '行为的观点', '生物学的观点', '现象学的观点', '认知的观点', '');
INSERT INTO `competition_choiceinfo` VALUES ('218', '1', '2019-01-11 07:24:06.262985', '2019-01-11 07:24:06.262985', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '去过几次小朋友的家，就能画出具体的路线图来。认知发展到哪一阶段的儿童能做到这种程度（  ）。', '前运算阶段', '感知运动阶段', '前运算阶段', '具体运算阶段', '形式运算阶段', '');
INSERT INTO `competition_choiceinfo` VALUES ('219', '1', '2019-01-11 07:24:06.263984', '2019-01-11 07:24:06.263984', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '下面不属于内部感觉的是 （  ）。', '痛觉', '动觉', '痛觉', '平衡觉', '内部感觉', '');
INSERT INTO `competition_choiceinfo` VALUES ('220', '1', '2019-01-11 07:24:06.263984', '2019-01-11 07:24:06.263984', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '（  ）认为，不同性质的感觉是由不同的神经元传递信息的', '特异化理论', '神经特殊能量学说', '模式理论', '特异化理论', '行波理论', '');
INSERT INTO `competition_choiceinfo` VALUES ('221', '1', '2019-01-11 07:24:06.265990', '2019-01-11 07:24:06.265990', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '下列哪个现象反映的是视觉适应（  ）', '值夜班的消防员佩戴红色眼镜在室内灯光下活动', '夜幕下，蓝色物体要比黄色物体更亮一些', '不管是白天还是夜晚，看到树叶的颜色总是绿色的', '直升机的螺旋桨高速旋转后，不再能观察到每片桨叶', '值夜班的消防员佩戴红色眼镜在室内灯光下活动', '');
INSERT INTO `competition_choiceinfo` VALUES ('222', '1', '2019-01-11 07:24:06.266996', '2019-01-11 07:24:06.266996', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '（  ）能够很好地解释在某些情况下人为什么对一些刺激“视而不见，充耳不闻”现象', '过滤器理论', '衰减理论', '过滤器理论', '认知资源理论', '双加工理论', '');
INSERT INTO `competition_choiceinfo` VALUES ('223', '1', '2019-01-11 07:24:06.266996', '2019-01-11 07:24:06.266996', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '人在每一瞬间，将心理活动选择了某些对象而忽略了另一些对象，这一特点指的是注意的（  ）', '指向性', '指向性', '集中性', '目的性', '能动性', '');
INSERT INTO `competition_choiceinfo` VALUES ('224', '1', '2019-01-11 07:24:06.267996', '2019-01-11 07:24:06.267996', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '幼儿获得概念的主要方式是（  ）', '典型事例', '典型事例', '定义', '言语讲解和概括', '概念名称的组合', '');
INSERT INTO `competition_choiceinfo` VALUES ('225', '1', '2019-01-11 07:24:06.268984', '2019-01-11 07:24:06.268984', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '学习形成两个或更多的刺激与反应联结，即形成一系列的刺激与反应联结的是（  ）', '连锁学习', '连锁学习', '信号学习', '辨别学习', '概念学习', '');
INSERT INTO `competition_choiceinfo` VALUES ('226', '1', '2019-01-11 07:24:06.269994', '2019-01-11 07:24:06.269994', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '具有加工信息和与存储信息双重功能的记忆是（  ）', '工作记忆', '感觉记忆', '短时记忆', '工作记忆', '长时记忆', '');
INSERT INTO `competition_choiceinfo` VALUES ('227', '1', '2019-01-11 07:24:06.270980', '2019-01-11 07:24:06.270980', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '内容效度主要用于考察（  ）的有效性', '成绩、技能测验', '智力测验', '人格测验', '特殊能力测验', '成绩、技能测验', '');
INSERT INTO `competition_choiceinfo` VALUES ('228', '1', '2019-01-11 07:24:06.271994', '2019-01-11 07:24:06.271994', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '既影响信度又影响效度的误差是（  ）', '随机误差', '随机误差', '系统误差', '抽样误差', '评分误差', '');
INSERT INTO `competition_choiceinfo` VALUES ('229', '1', '2019-01-11 07:24:06.272979', '2019-01-11 07:24:06.272979', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '考察学生某次考试的分数与教师评定学术等级之间的相关程度，应采用（  ）', '斯皮儿曼等级相关', '积差相关', '斯皮儿曼等级相关', '肯德尔和谐系数', '二列相关', '');
INSERT INTO `competition_choiceinfo` VALUES ('230', '1', '2019-01-11 07:24:06.273979', '2019-01-11 07:24:06.273979', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '创造性思维的主要成分是（  ）', '发散思维', '集中思维', '抽象思维', '发散思维', '直觉思维', '');
INSERT INTO `competition_choiceinfo` VALUES ('231', '1', '2019-01-11 07:24:06.274981', '2019-01-11 07:24:06.274981', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '语言材料所负载的信息在头脑中存在的方式是（  ）', '语言的表征', '语言的加工', '语言的理解', '语言的表征', '语言的产生', '');
INSERT INTO `competition_choiceinfo` VALUES ('232', '1', '2019-01-11 07:24:06.275977', '2019-01-11 07:24:06.275977', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '人的一切心理活动，都要通过（  ）的活动来实现', '神经系统', '神经系统', '感觉器官', '大脑皮层', '传到神经', '');
INSERT INTO `competition_choiceinfo` VALUES ('233', '1', '2019-01-11 07:24:06.276977', '2019-01-11 07:24:06.276977', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '看书时用红色笔画重点是利用知觉的（  ）', '选择性', '选择性', '理解性', '恒常性', '整体性', '');
INSERT INTO `competition_choiceinfo` VALUES ('234', '1', '2019-01-11 07:24:06.277977', '2019-01-11 07:24:06.277977', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '在“目标熟悉性和任务难度对前瞻性记忆的影响”这一研究中,自变量是（  ）', '目标熟悉性和任务难度', '目标熟悉性', '任务难度', '前瞻性记忆', '目标熟悉性和任务难度', '');
INSERT INTO `competition_choiceinfo` VALUES ('235', '1', '2019-01-11 07:24:06.277977', '2019-01-11 07:24:06.277977', '', null, '0', 'uGdoqXTkmVhRb2dv2EEncB', '1', '下列哪一个不属于形状和方向错觉（  ）', '潘佐错觉', '佐尔拉错觉', '冯特错觉', '爱因斯坦错觉', '潘佐错觉', '');
INSERT INTO `competition_choiceinfo` VALUES ('236', '1', '2019-01-11 07:27:38.852586', '2019-01-11 07:27:38.852586', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '下列关于System类的叙述中，错误的是（　　）。', 'System类中没有定义属性', 'System类是一个final类', 'System类不能实例化', 'System类中没有定义属性', 'System类主要提供了系统环境参数的访问', '');
INSERT INTO `competition_choiceinfo` VALUES ('237', '1', '2019-01-11 07:27:38.854581', '2019-01-11 07:27:38.854581', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '结构化程序设计的3种基本结构是（　　）。', '顺序、选择和循环', '过程、子程序和分程序', '顺序、选择和循环', '递归、堆栈和队列', '调用、返回和转移', '');
INSERT INTO `competition_choiceinfo` VALUES ('238', '1', '2019-01-11 07:27:38.891550', '2019-01-11 07:27:38.891550', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '下列选项中不属于结构化程序设计原则的是（　　）。', '可封装', '可封装', '自顶向下', '模块化', '逐步求精', '');
INSERT INTO `competition_choiceinfo` VALUES ('239', '1', '2019-01-11 07:27:38.892568', '2019-01-11 07:27:38.892568', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '下列构造方法的调用方式中，正确的是（　　）。', '只能通过new自动调用', '按照－般方法调用', '由用户直接调用', '只能通过new自动调用', '被系统调用', '');
INSERT INTO `competition_choiceinfo` VALUES ('240', '1', '2019-01-11 07:27:38.893562', '2019-01-11 07:27:38.893562', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '下列代表十六进制整数的是（　　）。', 'OXA6', 'OXA6', '1234L', '－840', '0144', '');
INSERT INTO `competition_choiceinfo` VALUES ('241', '1', '2019-01-11 07:27:38.893562', '2019-01-11 07:27:38.893562', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', 'Java程序默认引用的包是（　　）。', 'java．lang包', 'java．text包', 'java．awt包', 'java．lang包', 'java．util包', '');
INSERT INTO `competition_choiceinfo` VALUES ('242', '1', '2019-01-11 07:27:38.894549', '2019-01-11 07:27:38.894549', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '数据库管理系统中负责数据模式定义的语言是（　　）。', '数据定义语言', '数据定义语言', '数据管理语言', '数据操纵语言', '数据控制语言', '');
INSERT INTO `competition_choiceinfo` VALUES ('243', '1', '2019-01-11 07:27:38.895566', '2019-01-11 07:27:38.895566', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '下列叙述中正确的是（　　）。', '双向链表是非线性结构', '有－个以上根结点的数据结构不－定是非线性结构', '只有－个根结点的数据结构不－定是线性结构', '循环链表是非线性结构', '双向链表是非线性结构', '');
INSERT INTO `competition_choiceinfo` VALUES ('244', '1', '2019-01-11 07:27:38.896550', '2019-01-11 07:27:38.896550', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '－个工作人员可以使用多台计算机，而－台计算机可被多个人使用，则实体工作人员与实体计算机之间的联系是（　　）。', '多对多', '－对－', '－对多', '多对多', '多对－', '');
INSERT INTO `competition_choiceinfo` VALUES ('245', '1', '2019-01-11 07:27:38.897562', '2019-01-11 07:27:38.897562', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '下列叙述中，正确的是（　　）。', 'Java语言的标识符是区分大小写的', 'Java语言的标识符是区分大小写的', '源文件名与public类名可以不相同', '源文件的扩展名为．jar', '源文件中public类的数目不限', '');
INSERT INTO `competition_choiceinfo` VALUES ('246', '1', '2019-01-11 07:27:38.897562', '2019-01-11 07:27:38.897562', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '为使Java程序独立于平台，Java虚拟机把字节码与各个操作系统及硬件（　　）。', '分开', '分开', '结合', '联系', '融合', '');
INSERT INTO `competition_choiceinfo` VALUES ('247', '1', '2019-01-11 07:27:38.898561', '2019-01-11 07:27:38.898561', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '下列命令中，是Java编译命令的是（　　）。', 'javac', 'javac', 'java', 'javadoc', 'appletviewer', '');
INSERT INTO `competition_choiceinfo` VALUES ('248', '1', '2019-01-11 07:27:38.898561', '2019-01-11 07:27:38.898561', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '当使用SomeThread t＝new SomeThread（　　）创建一个线程时，下列叙述中正确的是（　　）。', 'SomeThread类是Thread类的子类', 'SomeThread类是包含run（　　）方法的任意Java类', 'SomeThread类－定要实现Runnable接口', 'SomeThread类是Thread类的子类', 'SomeThread类是Thread类的子类并且要实现Run－nable接口', '');
INSERT INTO `competition_choiceinfo` VALUES ('249', '1', '2019-01-11 07:27:38.899564', '2019-01-11 07:27:38.899564', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '按层次次序将一棵有n个结点的完全二叉树的所有结点从1～n编号，当i≤n/2时，编号为i的结点的左子树的编号是（　　）。', '2i', '2i－1', '2i', '2i＋1', '不确定', '');
INSERT INTO `competition_choiceinfo` VALUES ('250', '1', '2019-01-11 07:27:38.900564', '2019-01-11 07:27:38.900564', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '在软件开发中，需求分析阶段产生的主要文档是（　　）。', '软件需求规格说明书', '软件集成测试计划', '软件详细设计说明书', '用户手册', '软件需求规格说明书', '');
INSERT INTO `competition_choiceinfo` VALUES ('251', '1', '2019-01-11 07:27:38.900564', '2019-01-11 07:27:38.900564', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '下列关于面向对象的论述中，正确的是（　　）。', '面由对象是指以对象为中心，分析、设计和实现应用程序的机制', '面由对象是指以对象为中心，分析、设计和实现应用程序的机制', '面向对象是指以功能为中心，分析、设计和实现应用程序的机制', '面向对象仅适用于程序设计阶段', '面向对象是－种程序设计语言', '');
INSERT INTO `competition_choiceinfo` VALUES ('252', '1', '2019-01-11 07:27:38.901544', '2019-01-11 07:27:38.901544', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '在读取二进制数据文件的记录时，为了提高效率常常使用的－种辅助类是（　　）。', 'StringBuffer', 'InputStream', 'FilelnputStream', 'StringBuffer', 'BufferedReader', '');
INSERT INTO `competition_choiceinfo` VALUES ('253', '1', '2019-01-11 07:27:38.902562', '2019-01-11 07:27:38.902562', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '下列关于链式存储结构的叙述中，不正确的是（　　）。', '可以通过计算确定第i个结点的存储地址', '结点除自身信息外还包括指针域，因此存储密度小于顺序存储结构', '逻辑上相邻的结点物理上不必相邻', '可以通过计算确定第i个结点的存储地址', '插人、删除运算操作方便，不必移动结点', '');
INSERT INTO `competition_choiceinfo` VALUES ('254', '1', '2019-01-11 07:27:38.902562', '2019-01-11 07:27:38.902562', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '软件生命周期可分为定义阶段，开发阶段和维护阶段。详细设计属于（　　）。', '开发阶段', '定义阶段', '开发阶段', '维护阶段', '上述三个阶段', '');
INSERT INTO `competition_choiceinfo` VALUES ('255', '1', '2019-01-11 07:27:38.903543', '2019-01-11 07:27:38.903543', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '下列关于实型变量书写正确的是（　　）。', '1．2e3', 'E3', '2e0．3', '1．2e3', '1．2E0．3', '');
INSERT INTO `competition_choiceinfo` VALUES ('256', '1', '2019-01-11 07:27:38.904565', '2019-01-11 07:27:38.904565', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '线性表L＝(a1，a2，a3，…ai，…an)，下列说法正确的是（　　）。', '除第一个元素和最后一个元素外，其余每个元素都有且只有一个直接前继和直接后继', '每个元素都有一个直接前件和直接后件', '线性表中至少要有一个元素', '表中诸元素的排列顺序必须是由小到大或由大到小', '除第一个元素和最后一个元素外，其余每个元素都有且只有一个直接前继和直接后继', '');
INSERT INTO `competition_choiceinfo` VALUES ('257', '1', '2019-01-11 07:27:38.905542', '2019-01-11 07:27:38.905542', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '设计程序时，应采纳的原则之－是（　　）。', '程序的结构应有助于读者的理解', '程序的结构应有助于读者的理解', '不限制goto语句的使用', '减少或取消注释行', '程序越短越好', '');
INSERT INTO `competition_choiceinfo` VALUES ('258', '1', '2019-01-11 07:27:38.905542', '2019-01-11 07:27:38.905542', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '在－所大学中，每个系都有自己的局域网，则连接各个系的校园网（　　）。', '还是局域网', '是广域网', '还是局域网', '是地区网', '这些局域网不能互连', '');
INSERT INTO `competition_choiceinfo` VALUES ('259', '1', '2019-01-11 07:27:38.906541', '2019-01-11 07:27:38.906541', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '下面属于面向对象语言的是（　　）。', 'Java语言', 'Java语言', '机器语言', 'C语言', '汇编语言', '');
INSERT INTO `competition_choiceinfo` VALUES ('260', '1', '2019-01-11 07:27:38.906541', '2019-01-11 07:27:38.906541', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '下列Java组件中，不属于容器的是（　　）。', 'Label', 'Panel', 'Window', 'Frame', 'Label', '');
INSERT INTO `competition_choiceinfo` VALUES ('261', '1', '2019-01-11 07:27:38.907541', '2019-01-11 07:27:38.907541', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '下列关于正则表达式的说法，不正确的是（　　）。', '在J2SE 1．4中的正则表达式包名为java．util．regex', '在J2SE 1．4中的正则表达式包中有－个Pattern类', '在J2SE 1．4中的正则表达式包中有－个Macher类', '在J2SE 1．4中的正则表达式包名为java．util．regex', '以上说法都不对', '');
INSERT INTO `competition_choiceinfo` VALUES ('262', '1', '2019-01-11 07:27:38.908540', '2019-01-11 07:27:38.908540', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', 'Java中定义常量的保留字是（　　）。', 'final', 'const', 'final', 'finally', 'native', '');
INSERT INTO `competition_choiceinfo` VALUES ('263', '1', '2019-01-11 07:27:38.908540', '2019-01-11 07:27:38.908540', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '设数组data[0…m]作为循环队列s q的存储空间，front为队头指针，rear为队尾指针，则执行出队操作的语句为（　　）。', 'S q↑．front：＝(S q↑．front＋1)%maxsize；', 'S q↑．front：＝s q↑．front＋1；', 'S q↑．front：＝(S q↑．front＋1)%maxsize；', 'S q↑．rear：＝(S q↑．rear＋1)%maxsize；', 'S q↑．front：＝(s q↑．front＋1)%(maxsize＋1)；', '');
INSERT INTO `competition_choiceinfo` VALUES ('264', '1', '2019-01-11 07:27:38.909539', '2019-01-11 07:27:38.909539', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', 'Java的核心包中，提供编程应用的基本类的包是（　　）。', 'java．lang', 'java．lang', 'java．util', 'java．applet', 'java．rmi', '');
INSERT INTO `competition_choiceinfo` VALUES ('265', '1', '2019-01-11 07:27:38.909539', '2019-01-11 07:27:38.909539', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '下列不属于虚拟机执行过程的特点的是（　　）。', '代码安全检查', '多线程', '动态连接', '异常处理', '代码安全检查', '');
INSERT INTO `competition_choiceinfo` VALUES ('266', '1', '2019-01-11 07:27:38.910538', '2019-01-11 07:27:38.910538', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '数据流程图(DFD图)是（　　）。', '面向对象方法的需求分析工具', '软件概要没计的工具', '软件详细设计的工具', '结构化方法的需求分析工具', '面向对象方法的需求分析工具', '');
INSERT INTO `competition_choiceinfo` VALUES ('267', '1', '2019-01-11 07:27:38.910538', '2019-01-11 07:27:38.910538', '', null, '0', 'mixSJyMz98EHfNJ3GwRtj9', '1', '下列关于Java多线程并发控制机制的叙述中，错误的是（　　）。', '线程之间的交互，提倡采用suspend（　　）/resume（　　）方法', 'Java中对共享数据操作的并发控制是采用加锁技术', '线程之间的交互，提倡采用suspend（　　）/resume（　　）方法', '共享数据的访问权限都必须定义为private', 'Java中没有提供检测与避免死锁的专门机制，但程序员可以采用某些策略防止死锁的发生', '');

-- ----------------------------
-- Table structure for competition_competitionkindinfo
-- ----------------------------
DROP TABLE IF EXISTS `competition_competitionkindinfo`;
CREATE TABLE `competition_competitionkindinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `kind_id` varchar(22) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `app_id` varchar(32) DEFAULT NULL,
  `bank_id` varchar(32) DEFAULT NULL,
  `kind_type` int(11) NOT NULL,
  `kind_name` varchar(32) DEFAULT NULL,
  `sponsor_name` varchar(60) DEFAULT NULL,
  `total_score` int(11) NOT NULL,
  `question_num` int(11) NOT NULL,
  `cop_startat` datetime(6) NOT NULL,
  `period_time` int(11) NOT NULL,
  `cop_finishat` datetime(6) DEFAULT NULL,
  `total_partin_num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `competition_competitionkindinfo_status_481c1948` (`status`),
  KEY `competition_competitionkindinfo_kind_id_6389e9c2` (`kind_id`),
  KEY `competition_competitionkindinfo_account_id_efc0a359` (`account_id`),
  KEY `competition_competitionkindinfo_app_id_78c25478` (`app_id`),
  KEY `competition_competitionkindinfo_bank_id_f8a0ba8c` (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition_competitionkindinfo
-- ----------------------------
INSERT INTO `competition_competitionkindinfo` VALUES ('2', '1', '2018-12-28 09:45:58.411099', '2019-01-08 07:56:55.890658', 'tvAnb6frD7426Ga4P8RYUU', 'LMVV59cNPM58DwiBmnZKLQ', 'QM8EYzDNdZtrtyqmGxbY9A', 'M6VrSVv2XNR9WZnu7nhcJ6', '2', '老冯的码场——古诗词大赛', '老冯的码场', '100', '10', '2018-12-28 09:42:00.000000', '5', '2019-01-31 09:42:00.000000', '12');
INSERT INTO `competition_competitionkindinfo` VALUES ('3', '1', '2019-01-11 05:41:50.892436', '2019-01-26 08:04:30.433824', 'Zpfv7E2wM4aoapDpymZzBD', 'LMVV59cNPM58DwiBmnZKLQ', 'xVnZRUkwGpZ2v8yEWqwqZG', 'H8sepoh9ZdsoSA4GQXGwGR', '1', '七年级历史题', '老冯的码场', '100', '10', '2019-01-11 05:40:00.000000', '1', '2019-01-31 05:40:00.000000', '2');
INSERT INTO `competition_competitionkindinfo` VALUES ('4', '1', '2019-01-11 08:35:35.914592', '2019-01-11 08:35:46.804977', '9Gn9VFQv3iuEPyguBwz4V3', 'twVhE4BFaxxyjL46EMf5hR', 'roXjNHKxHiEcLbQuwWhFMb', 'mixSJyMz98EHfNJ3GwRtj9', '0', '2014年全国计算机等级《二级JAVA》命题预测试卷', '明日科技', '100', '10', '2019-01-11 08:35:04.000000', '20', '2019-01-31 08:35:04.000000', '1');

-- ----------------------------
-- Table structure for competition_competitionqainfo
-- ----------------------------
DROP TABLE IF EXISTS `competition_competitionqainfo`;
CREATE TABLE `competition_competitionqainfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `kind_id` varchar(32) DEFAULT NULL,
  `qa_id` varchar(22) DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  `qsrecord` longtext,
  `asrecord` longtext,
  `aslogrecord` longtext,
  `started_stamp` bigint(20) NOT NULL,
  `finished_stamp` bigint(20) NOT NULL,
  `expend_time` int(11) NOT NULL,
  `started` tinyint(1) NOT NULL,
  `finished` tinyint(1) NOT NULL,
  `correct_num` int(11) NOT NULL,
  `incorrect_num` int(11) NOT NULL,
  `total_num` int(11) NOT NULL,
  `score` double NOT NULL,
  `correct_list` varchar(10000) DEFAULT NULL,
  `wrong_list` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `competition_competitionqainfo_kind_id_10b82c49` (`kind_id`),
  KEY `competition_competitionqainfo_qa_id_3e2673ba` (`qa_id`),
  KEY `competition_competitionqainfo_uid_d8905edc` (`uid`),
  KEY `competition_competitionqainfo_started_f1ffb449` (`started`),
  KEY `competition_competitionqainfo_finished_b77ac7ad` (`finished`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition_competitionqainfo
-- ----------------------------
INSERT INTO `competition_competitionqainfo` VALUES ('1', '1', '2018-12-28 09:51:26.258945', '2018-12-28 09:51:34.652486', 'tvAnb6frD7426Ga4P8RYUU', 'i8MvoUYKz8gPykg7qk3VdF', 'aqrdnYGL4a4XduUozLPg6Y', '[\'离离原上草，##。野火烧不尽，春风吹又生。《赋得古原草送别》唐·白居易\', \'“独在异乡为异客,每逢佳节倍思亲”是谁的诗句.\', \'迟日江山丽，春风花草香。##，沙暧睡鸳鸯。《绝句》唐·杜甫\', \'慈母手中线，##，谁言寸草心，报得三春晖。《游子吟》唐·孟郊\', \'千里黄云白日曛，北风吹雁雪纷纷。莫愁前路无知已，##?《别董大》唐·高适\', \'人闲##落，夜静春山空。\', \'不知细叶谁裁出，##。《咏柳》唐·贺知章\', \'远上寒山石径斜，##。停车坐爱枫林晚，霜叶红于二月花。《山行》唐·杜牧\', \'墙角数枝梅，凌寒独自开。##，为有暗香来。《梅花》北宋·王安石\', \'“解落三秋叶,能开二月花.过江千尺浪,入竹万竿斜.”这首诗写的是\']', '[\'一岁一枯荣\', \'王维\', \'泥融飞燕子\', \'游子身上衣\', \'天下谁人不识君\', \'桂花\', \'二月春风似剪刀\', \'白云生处有人家\', \'遥知不是雪\', \'风\']', '[\'f_24,\', \'c_18,\', \'f_22,\', \'f_11,\', \'f_27,\', \'f_6,\', \'f_20,\', \'f_29,\', \'f_32,\', \'c_13,\']', '1545961886258', '1545961894619', '8361', '1', '1', '0', '10', '10', '0', '[]', '[[\'c_18\', \'\'], [\'c_13\', \'\']]');
INSERT INTO `competition_competitionqainfo` VALUES ('2', '0', '2018-12-29 02:59:46.919118', '2018-12-29 02:59:46.919118', 'tvAnb6frD7426Ga4P8RYUU', 'xXT6oq5auuJ4YYkrtf7xK9', 'aqrdnYGL4a4XduUozLPg6Y', '[\'人闲##落，夜静春山空。\', \'杜甫的《春夜喜雨》中的“晓看红湿处”的下句是\', \'湖光秋月两相和,##。 遥望洞庭山水色,白银盘里一青螺。《望洞庭》唐·刘禹锡\', \'“停车坐爱枫林晚,霜叶红于二月花”中“坐”的意思是\', \'##，映日荷花别样红。《晓出净慈寺送林子方》南宋·杨万里\', \'两岸猿声啼不住，##。《早发白帝城》唐·李白\', \'“独在异乡为异客,每逢佳节倍思亲”是谁的诗句.\', \'千里黄云白日曛，北风吹雁雪纷纷。莫愁前路无知已，##?《别董大》唐·高适\', \'“海内存知己,天涯若比邻”是谁的诗句.\', \'龙舟是为了纪念哪位文化名人的？\']', '[\'桂花\', \'花重锦官城\', \'潭面无风镜未磨\', \'因为\', \'接天莲叶无穷碧\', \'轻舟已过万重山\', \'王维\', \'天下谁人不识君\', \'王勃\', \'屈原\']', null, '1546023586919', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('3', '0', '2019-01-02 03:14:45.279401', '2019-01-02 03:14:45.279401', 'tvAnb6frD7426Ga4P8RYUU', 'r84MjvdpHnQFZG79GN8ufd', 'aqrdnYGL4a4XduUozLPg6Y', '[\'不识##真面目，只缘身在此山中\', \'千山鸟飞绝，##。孤舟蓑笠翁，独钓寒江雪。《江雪》唐·柳宗元\', \'##，早有蜻蜓立上头。《小池》南宋·杨万里\', \'“无边落木萧萧下,不尽长江滚滚来”出自杜甫的\', \'劝君更尽一杯酒，##。《送元二使安西》唐·王维\', \'补全诗句：到现在，乡愁是一湾##，我在这头，大陆在那头。\', \'黑云翻墨未遮山， 白雨跳珠乱入船。##，望湖楼下水如天。《六月二十七日望湖楼醉书》北宋·苏轼\', \'采##东篱下，悠然见南山。\', \'两岸猿声啼不住，##。《早发白帝城》唐·李白\', \'昼出耘田夜绩麻，##。童孙未解供耕织，也傍桑阴学种瓜。《四时田园杂兴》南宋·范成大\']', '[\'庐山\', \'万径人踪灭\', \'小荷才露尖尖角\', \'《登高》\', \'西出阳关无故人\', \'浅浅的海峡\', \' 卷地风来忽吹散\', \'菊\', \'轻舟已过万重山\', \'村庄儿女各当家\']', null, '1546370085277', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('4', '0', '2019-01-02 03:16:51.852015', '2019-01-02 03:16:51.852015', 'tvAnb6frD7426Ga4P8RYUU', 'TSxfeST4dTYMcsUrMpCm2b', 'aqrdnYGL4a4XduUozLPg6Y', '[\'独坐幽篁里，##。深林人不知，明月来相照。《竹里馆》唐·王维\', \'慈母手中线，##，谁言寸草心，报得三春晖。《游子吟》唐·孟郊\', \'君住长江南，我住长江北，##，共饮长江水\', \'“停车坐爱枫林晚,霜叶红于二月花”中“坐”的意思是\', \'把“春风”比作“剪刀”的是哪首诗\', \'墙角数枝梅，凌寒独自开。##，为有暗香来。《梅花》北宋·王安石\', \'##，笑问客从何处来?《回乡偶书》唐·贺知章\', \'清明上河图的作者是哪一个朝代的人？\', \'“海内存知己,天涯若比邻”是谁的诗句.\', \'杜牧的《江南春》中“南朝四百八十寺”的下句是\']', '[\'弹琴复长啸\', \'游子身上衣\', \'日日思君不见君\', \'因为\', \'咏柳\', \'遥知不是雪\', \'儿童相见不相识\', \'北宋\', \'王勃\', \'多少楼台烟雨中\']', null, '1546370211852', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('5', '0', '2019-01-04 05:57:14.657678', '2019-01-04 05:57:14.657678', 'tvAnb6frD7426Ga4P8RYUU', 'TKqBZFCBdY7uVHL9vm64Cd', 'aqrdnYGL4a4XduUozLPg6Y', '[\'##，笑问客从何处来?《回乡偶书》唐·贺知章\', \'爆竹声中一岁除，##。千门万户曈曈日，总把新桃换旧符 。《元日》北宋·王安石\', \'《七步诗》的作者是\', \'把“春风”比作“剪刀”的是哪首诗\', \'##，欲饮琵琶马上催。醉卧沙场君莫笑， 古来征战几人回。《凉州词》唐·王翰\', \'##，更上一层楼。《登鹳雀楼》唐·王之涣\', \'千山鸟飞绝，##。孤舟蓑笠翁，独钓寒江雪。《江雪》唐·柳宗元\', \'李白的《渡荆门送别》一诗中，写出诗人渡过荆门进入楚地看到江水冲出山峦向着原野奔腾而去的壮阔景色的诗句是:##，江入大荒流\', \'《天净沙·秋思》是一首小令,作者是元代的\', \'杜甫的《春夜喜雨》中的“晓看红湿处”的下句是\']', '[\'儿童相见不相识\', \'春风送暖入屠苏\', \'曹植\\u2002\', \'咏柳\', \'葡萄美酒夜光杯\', \'欲穷千里目\', \'万径人踪灭\', \'山随平野尽\', \'马致远\', \'花重锦官城\']', null, '1546552634657', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('6', '0', '2019-01-04 06:06:47.045411', '2019-01-04 06:06:47.045411', 'tvAnb6frD7426Ga4P8RYUU', 'gEEP4NwouMRyGFkzCTQebe', 'aqrdnYGL4a4XduUozLPg6Y', '[\'商女不知亡国恨下一句是？\', \'远上寒山石径斜，##。停车坐爱枫林晚，霜叶红于二月花。《山行》唐·杜牧\', \'##，欲饮琵琶马上催。醉卧沙场君莫笑， 古来征战几人回。《凉州词》唐·王翰\', \'有情##含春泪，无力蔷薇卧晚枝。\', \'##，万里长征人未还。但使龙城飞将在，不教胡马渡阴山!《出塞》唐·王昌龄\', \'劝君更尽一杯酒，##。《送元二使安西》唐·王维\', \'君住长江南，我住长江北，##，共饮长江水\', \'不识##真面目，只缘身在此山中\', \'千里黄云白日曛，北风吹雁雪纷纷。莫愁前路无知已，##?《别董大》唐·高适\', \'龙舟是为了纪念哪位文化名人的？\']', '[\'隔江犹唱后庭花\', \'白云生处有人家\', \'葡萄美酒夜光杯\', \'芍药\', \'秦时明月汉时关\', \'西出阳关无故人\', \'日日思君不见君\', \'庐山\', \'天下谁人不识君\', \'屈原\']', null, '1546553207044', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('7', '0', '2019-01-04 06:13:58.006130', '2019-01-04 06:13:58.006130', 'tvAnb6frD7426Ga4P8RYUU', '6VQdZz4tnBCZCjbehVFHPi', 'aqrdnYGL4a4XduUozLPg6Y', '[\'龙舟是为了纪念哪位文化名人的？\', \'“别时容易见时难”“相见时难别亦难”分别是谁的诗句\', \'采##东篱下，悠然见南山。\', \'“解落三秋叶,能开二月花.过江千尺浪,入竹万竿斜.”这首诗写的是\', \'不识##真面目，只缘身在此山中\', \'两岸猿声啼不住，##。《早发白帝城》唐·李白\', \'北京是在哪个朝代建都的？\', \'##，将军夜引弓。平明寻白羽，没在石棱中。《塞下曲》唐·卢纶\', \'劝君更尽一杯酒，##。《送元二使安西》唐·王维\', \'向晚意不适，驱车登古原。##，只是近黄昏。《乐游原》唐·李商隐\']', '[\'屈原\', \'李煜、柳永\', \'菊\', \'风\', \'庐山\', \'轻舟已过万重山\', \'元朝\', \'林暗草惊风\', \'西出阳关无故人\', \'夕阳无限好\']', null, '1546553638005', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('8', '0', '2019-01-04 06:17:54.295714', '2019-01-04 06:17:54.295714', 'tvAnb6frD7426Ga4P8RYUU', '6Y8Hgbu8ypghz5VoNruRk8', 'aqrdnYGL4a4XduUozLPg6Y', '[\'“无边落木萧萧下,不尽长江滚滚来”出自杜甫的\', \'《七步诗》的作者是\', \'##，千朵万朵压枝低。《江畔独步寻花》唐·杜甫\', \'千山鸟飞绝，##。孤舟蓑笠翁，独钓寒江雪。《江雪》唐·柳宗元\', \'清明上河图的作者是哪一个朝代的人？\', \'向晚意不适，驱车登古原。##，只是近黄昏。《乐游原》唐·李商隐\', \'杜牧的《江南春》中“南朝四百八十寺”的下句是\', \'李白的《渡荆门送别》一诗中，写出诗人渡过荆门进入楚地看到江水冲出山峦向着原野奔腾而去的壮阔景色的诗句是:##，江入大荒流\', \'补全诗句：到现在，乡愁是一湾##，我在这头，大陆在那头。\', \'“海内存知己,天涯若比邻”是谁的诗句.\']', '[\'《登高》\', \'曹植\\u2002\', \'黄四娘家花满蹊\', \'万径人踪灭\', \'北宋\', \'夕阳无限好\', \'多少楼台烟雨中\', \'山随平野尽\', \'浅浅的海峡\', \'王勃\']', null, '1546553874295', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('9', '0', '2019-01-04 06:25:10.943684', '2019-01-04 06:25:10.943684', 'tvAnb6frD7426Ga4P8RYUU', 'u3APweuicE75PhqGBFyovW', 'aqrdnYGL4a4XduUozLPg6Y', '[\'“春蚕到死丝方尽,蜡炬成灰泪始干”出自谁的《无题》\', \'“但使龙城飞将在,不教胡马度”\', \'空山不见人，但闻人语响。##，复照青苔上。《鹿柴》唐·王维\', \'把“春风”比作“剪刀”的是哪首诗\', \'“独在异乡为异客,每逢佳节倍思亲”是谁的诗句.\', \'“停车坐爱枫林晚,霜叶红于二月花”中“坐”的意思是\', \'##，早有蜻蜓立上头。《小池》南宋·杨万里\', \'清明上河图的作者是哪一个朝代的人？\', \'“野火烧不尽,春风吹又生”一句出自\', \'有情##含春泪，无力蔷薇卧晚枝。\']', '[\'李商隐\', \'阴山\', \'返景入深林\', \'咏柳\', \'王维\', \'因为\', \'小荷才露尖尖角\', \'北宋\', \'白居易《赋得古原草送别》\', \'芍药\']', null, '1546554310942', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('10', '0', '2019-01-04 06:29:40.238017', '2019-01-04 06:29:40.238017', 'tvAnb6frD7426Ga4P8RYUU', 'PaGjiw4byStKnoXEKnFZ3V', 'aqrdnYGL4a4XduUozLPg6Y', '[\'空山不见人，但闻人语响。##，复照青苔上。《鹿柴》唐·王维\', \'##，欲饮琵琶马上催。醉卧沙场君莫笑， 古来征战几人回。《凉州词》唐·王翰\', \'湖光秋月两相和,##。 遥望洞庭山水色,白银盘里一青螺。《望洞庭》唐·刘禹锡\', \'“忽如一夜春风来,千树万树梨花开”写的是\', \'“无边落木萧萧下,不尽长江滚滚来”出自杜甫的\', \'离离原上草，##。野火烧不尽，春风吹又生。《赋得古原草送别》唐·白居易\', \'“海内存知己,天涯若比邻”是谁的诗句.\', \'商女不知亡国恨下一句是？\', \'远上寒山石径斜，##。停车坐爱枫林晚，霜叶红于二月花。《山行》唐·杜牧\', \'千山鸟飞绝，##。孤舟蓑笠翁，独钓寒江雪。《江雪》唐·柳宗元\']', '[\'返景入深林\', \'葡萄美酒夜光杯\', \'潭面无风镜未磨\', \'雪景\', \'《登高》\', \'一岁一枯荣\', \'王勃\', \'隔江犹唱后庭花\', \'白云生处有人家\', \'万径人踪灭\']', null, '1546554580237', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('11', '0', '2019-01-04 06:36:22.273145', '2019-01-04 06:36:22.273145', 'tvAnb6frD7426Ga4P8RYUU', 'x936NiNcfQrCXe4puHwZUF', 'aqrdnYGL4a4XduUozLPg6Y', '[\'##，将军夜引弓。平明寻白羽，没在石棱中。《塞下曲》唐·卢纶\', \'##，一行白鸳上青天。窗含西岭千秋雪，门泊东吴万里船。《绝句》唐·杜甫\', \'把“春风”比作“剪刀”的是哪首诗\', \'“停车坐爱枫林晚,霜叶红于二月花”中“坐”的意思是\', \'《七步诗》的作者是\', \'天子呼来不上船，自称臣是酒中仙。说的是哪一位人物？\', \'晏殊的《浣溪沙》中的“无可奈何花落去”的下句是\', \'清明上河图的作者是哪一个朝代的人？\', \'飞流直下三千尺，##。《望庐山瀑布》唐·李白\', \'##，千朵万朵压枝低。《江畔独步寻花》唐·杜甫\']', '[\'林暗草惊风\', \'两个黄鹂鸣翠柳\', \'咏柳\', \'因为\', \'曹植\\u2002\', \'李白\', \'似曾相识燕归来\\u2002\', \'北宋\', \'疑是银河落九天\', \'黄四娘家花满蹊\']', null, '1546554982273', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('12', '0', '2019-01-04 06:37:27.515538', '2019-01-04 06:37:27.516539', 'tvAnb6frD7426Ga4P8RYUU', 'qr53E27C2CXhyJXnHCWWoY', 'aqrdnYGL4a4XduUozLPg6Y', '[\'“忽如一夜春风来,千树万树梨花开”写的是\', \'李白的《渡荆门送别》一诗中，写出诗人渡过荆门进入楚地看到江水冲出山峦向着原野奔腾而去的壮阔景色的诗句是:##，江入大荒流\', \'爆竹声中一岁除，##。千门万户曈曈日，总把新桃换旧符 。《元日》北宋·王安石\', \'日出江花红胜火，##，能不忆江南?《忆江南》唐·白居易\', \'有情##含春泪，无力蔷薇卧晚枝。\', \'##，笑问客从何处来?《回乡偶书》唐·贺知章\', \'北京是在哪个朝代建都的？\', \'两岸猿声啼不住，##。《早发白帝城》唐·李白\', \'“解落三秋叶,能开二月花.过江千尺浪,入竹万竿斜.”这首诗写的是\', \'空山不见人，但闻人语响。##，复照青苔上。《鹿柴》唐·王维\']', '[\'雪景\', \'山随平野尽\', \'春风送暖入屠苏\', \'春来江水绿如蓝\', \'芍药\', \'儿童相见不相识\', \'元朝\', \'轻舟已过万重山\', \'风\', \'返景入深林\']', null, '1546555047512', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('13', '0', '2019-01-04 06:44:59.342503', '2019-01-04 06:44:59.342503', 'tvAnb6frD7426Ga4P8RYUU', 'cVAbH3F2no8Y2Eq83GBBXE', 'aqrdnYGL4a4XduUozLPg6Y', '[\'##，欲饮琵琶马上催。醉卧沙场君莫笑， 古来征战几人回。《凉州词》唐·王翰\', \'空山不见人，但闻人语响。##，复照青苔上。《鹿柴》唐·王维\', \'天子呼来不上船，自称臣是酒中仙。说的是哪一位人物？\', \'有情##含春泪，无力蔷薇卧晚枝。\', \'补全诗句：到现在，乡愁是一湾##，我在这头，大陆在那头。\', \'“野火烧不尽,春风吹又生”一句出自\', \'天似穹庐，笼盖四野。天苍苍，##，风吹草低见牛羊。《敕勒歌》北朝民歌\', \'两岸猿声啼不住，##。《早发白帝城》唐·李白\', \'采##东篱下，悠然见南山。\', \'“但使龙城飞将在,不教胡马度”\']', '[\'葡萄美酒夜光杯\', \'返景入深林\', \'李白\', \'芍药\', \'浅浅的海峡\', \'白居易《赋得古原草送别》\', \'野茫茫\', \'轻舟已过万重山\', \'菊\', \'阴山\']', null, '1546555499342', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('14', '0', '2019-01-04 06:45:02.831595', '2019-01-04 06:45:02.831595', 'tvAnb6frD7426Ga4P8RYUU', 'BBB7Af8LGHs9EeVWHRRfdZ', 'aqrdnYGL4a4XduUozLPg6Y', '[\'杜甫的《春夜喜雨》中的“晓看红湿处”的下句是\', \'杜牧的《江南春》中“南朝四百八十寺”的下句是\', \'远上寒山石径斜，##。停车坐爱枫林晚，霜叶红于二月花。《山行》唐·杜牧\', \'唐宋散文八大家不包括以下哪一位人物？\', \'清明上河图的作者是哪一个朝代的人？\', \'“横看成岭侧成峰,远近高低各不同.”诗中写的名胜是\', \'“野火烧不尽,春风吹又生”一句出自\', \'“解落三秋叶,能开二月花.过江千尺浪,入竹万竿斜.”这首诗写的是\', \'不知细叶谁裁出，##。《咏柳》唐·贺知章\', \'空山不见人，但闻人语响。##，复照青苔上。《鹿柴》唐·王维\']', '[\'花重锦官城\', \'多少楼台烟雨中\', \'白云生处有人家\', \'李白\', \'北宋\', \'庐山\', \'白居易《赋得古原草送别》\', \'风\', \'二月春风似剪刀\', \'返景入深林\']', null, '1546555502830', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('15', '0', '2019-01-04 06:46:17.087634', '2019-01-04 06:46:17.087634', 'tvAnb6frD7426Ga4P8RYUU', 'Tkq489zBkaRnuer9EJTLtW', 'aqrdnYGL4a4XduUozLPg6Y', '[\'昼出耘田夜绩麻，##。童孙未解供耕织，也傍桑阴学种瓜。《四时田园杂兴》南宋·范成大\', \'“海内存知己,天涯若比邻”是谁的诗句.\', \'两岸猿声啼不住，##。《早发白帝城》唐·李白\', \'龚自珍《己亥杂诗》“落红不是无情物,化作春泥更护花”句中,“红”是指\', \'向晚意不适，驱车登古原。##，只是近黄昏。《乐游原》唐·李商隐\', \'空山不见人，但闻人语响。##，复照青苔上。《鹿柴》唐·王维\', \'“忽如一夜春风来,千树万树梨花开”写的是\', \'《七步诗》的作者是\', \'##，映日荷花别样红。《晓出净慈寺送林子方》南宋·杨万里\', \'把“春风”比作“剪刀”的是哪首诗\']', '[\'村庄儿女各当家\', \'王勃\', \'轻舟已过万重山\', \'花\\xa0\', \'夕阳无限好\', \'返景入深林\', \'雪景\', \'曹植\\u2002\', \'接天莲叶无穷碧\', \'咏柳\']', null, '1546555577086', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('16', '0', '2019-01-04 06:46:20.691044', '2019-01-04 06:46:20.691044', 'tvAnb6frD7426Ga4P8RYUU', '4xWkdWZTh4TiqRYco7d6nC', 'aqrdnYGL4a4XduUozLPg6Y', '[\'“解落三秋叶,能开二月花.过江千尺浪,入竹万竿斜.”这首诗写的是\', \'墙角数枝梅，凌寒独自开。##，为有暗香来。《梅花》北宋·王安石\', \'##，早有蜻蜓立上头。《小池》南宋·杨万里\', \'“独在异乡为异客,每逢佳节倍思亲”是谁的诗句.\', \'##，将军夜引弓。平明寻白羽，没在石棱中。《塞下曲》唐·卢纶\', \'湖光秋月两相和,##。 遥望洞庭山水色,白银盘里一青螺。《望洞庭》唐·刘禹锡\', \'不知细叶谁裁出，##。《咏柳》唐·贺知章\', \'昼出耘田夜绩麻，##。童孙未解供耕织，也傍桑阴学种瓜。《四时田园杂兴》南宋·范成大\', \'“春蚕到死丝方尽,蜡炬成灰泪始干”出自谁的《无题》\', \'“别时容易见时难”“相见时难别亦难”分别是谁的诗句\']', '[\'风\', \'遥知不是雪\', \'小荷才露尖尖角\', \'王维\', \'林暗草惊风\', \'潭面无风镜未磨\', \'二月春风似剪刀\', \'村庄儿女各当家\', \'李商隐\', \'李煜、柳永\']', null, '1546555580691', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('17', '0', '2019-01-04 06:49:47.394400', '2019-01-04 06:49:47.394400', 'tvAnb6frD7426Ga4P8RYUU', 'UYLN9T6mwyLttFkbwXEPyF', 'aqrdnYGL4a4XduUozLPg6Y', '[\'杜甫的《春夜喜雨》中的“晓看红湿处”的下句是\', \'##，映日荷花别样红。《晓出净慈寺送林子方》南宋·杨万里\', \'##，将军夜引弓。平明寻白羽，没在石棱中。《塞下曲》唐·卢纶\', \'李白的《渡荆门送别》一诗中，写出诗人渡过荆门进入楚地看到江水冲出山峦向着原野奔腾而去的壮阔景色的诗句是:##，江入大荒流\', \'唐宋散文八大家不包括以下哪一位人物？\', \'杜牧的《江南春》中“南朝四百八十寺”的下句是\', \'“独在异乡为异客,每逢佳节倍思亲”是谁的诗句.\', \'采##东篱下，悠然见南山。\', \'“无边落木萧萧下,不尽长江滚滚来”出自杜甫的\', \'远上寒山石径斜，##。停车坐爱枫林晚，霜叶红于二月花。《山行》唐·杜牧\']', '[\'花重锦官城\', \'接天莲叶无穷碧\', \'林暗草惊风\', \'山随平野尽\', \'李白\', \'多少楼台烟雨中\', \'王维\', \'菊\', \'《登高》\', \'白云生处有人家\']', null, '1546555787394', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('18', '0', '2019-01-04 07:13:53.038825', '2019-01-04 07:13:53.038825', 'tvAnb6frD7426Ga4P8RYUU', 'Em37frsSS6bH9Kbmcc4DjU', 'aqrdnYGL4a4XduUozLPg6Y', '[\'清明上河图的作者是哪一个朝代的人？\', \'千里黄云白日曛，北风吹雁雪纷纷。莫愁前路无知已，##?《别董大》唐·高适\', \'君住长江南，我住长江北，##，共饮长江水\', \'杜甫的《春夜喜雨》中的“晓看红湿处”的下句是\', \'不识##真面目，只缘身在此山中\', \'唐宋散文八大家不包括以下哪一位人物？\', \'爆竹声中一岁除，##。千门万户曈曈日，总把新桃换旧符 。《元日》北宋·王安石\', \'“忽如一夜春风来,千树万树梨花开”写的是\', \'元宵又称为上元节，那么下元节是几月几号？\', \'“独在异乡为异客,每逢佳节倍思亲”是谁的诗句.\']', '[\'北宋\', \'天下谁人不识君\', \'日日思君不见君\', \'花重锦官城\', \'庐山\', \'李白\', \'春风送暖入屠苏\', \'雪景\', \'十月十五\', \'王维\']', null, '1546557233038', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('19', '0', '2019-01-04 07:26:06.962121', '2019-01-04 07:26:06.962121', 'tvAnb6frD7426Ga4P8RYUU', 'pJK4VY2KxNfCMJQWfVUEpa', 'aqrdnYGL4a4XduUozLPg6Y', '[\'向晚意不适，驱车登古原。##，只是近黄昏。《乐游原》唐·李商隐\', \'昼出耘田夜绩麻，##。童孙未解供耕织，也傍桑阴学种瓜。《四时田园杂兴》南宋·范成大\', \'慈母手中线，##，谁言寸草心，报得三春晖。《游子吟》唐·孟郊\', \'“无边落木萧萧下,不尽长江滚滚来”出自杜甫的\', \'日出江花红胜火，##，能不忆江南?《忆江南》唐·白居易\', \'“解落三秋叶,能开二月花.过江千尺浪,入竹万竿斜.”这首诗写的是\', \'“停车坐爱枫林晚,霜叶红于二月花”中“坐”的意思是\', \'龚自珍《己亥杂诗》“落红不是无情物,化作春泥更护花”句中,“红”是指\', \'“横看成岭侧成峰,远近高低各不同.”诗中写的名胜是\', \'晏殊的《浣溪沙》中的“无可奈何花落去”的下句是\']', '[\'夕阳无限好\', \'村庄儿女各当家\', \'游子身上衣\', \'《登高》\', \'春来江水绿如蓝\', \'风\', \'因为\', \'花\\xa0\', \'庐山\', \'似曾相识燕归来\\u2002\']', null, '1546557966962', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('20', '2', '2019-01-04 07:27:02.111588', '2019-01-04 08:30:03.726849', 'tvAnb6frD7426Ga4P8RYUU', '7bbQucc9XJGwEihKqtMdGf', 'aqrdnYGL4a4XduUozLPg6Y', '[\'李白的《渡荆门送别》一诗中，写出诗人渡过荆门进入楚地看到江水冲出山峦向着原野奔腾而去的壮阔景色的诗句是:##，江入大荒流\', \'离离原上草，##。野火烧不尽，春风吹又生。《赋得古原草送别》唐·白居易\', \'天子呼来不上船，自称臣是酒中仙。说的是哪一位人物？\', \'劝君更尽一杯酒，##。《送元二使安西》唐·王维\', \'“别时容易见时难”“相见时难别亦难”分别是谁的诗句\', \'远上寒山石径斜，##。停车坐爱枫林晚，霜叶红于二月花。《山行》唐·杜牧\', \'千山鸟飞绝，##。孤舟蓑笠翁，独钓寒江雪。《江雪》唐·柳宗元\', \'##，早有蜻蜓立上头。《小池》南宋·杨万里\', \'##，笑问客从何处来?《回乡偶书》唐·贺知章\', \'清明上河图的作者是哪一个朝代的人？\']', '[\'山随平野尽\', \'一岁一枯荣\', \'李白\', \'西出阳关无故人\', \'李煜、柳永\', \'白云生处有人家\', \'万径人踪灭\', \'小荷才露尖尖角\', \'儿童相见不相识\', \'北宋\']', '[\'f_3,\', \'f_24,\', \'c_7,\', \'f_23,\', \'c_25,\', \'f_29,\', \'f_36,\', \'f_18,\', \'f_9,\', \'c_6,\']', '1546558022110', '1546561803699', '3781589', '1', '1', '0', '10', '10', '0', '[]', '[[\'c_7\', \'\'], [\'c_25\', \'\'], [\'c_6\', \'\']]');
INSERT INTO `competition_competitionqainfo` VALUES ('21', '0', '2019-01-04 07:28:04.631781', '2019-01-04 07:28:04.631781', 'tvAnb6frD7426Ga4P8RYUU', 'fqX9Wuiot3kD2S7GX22XeV', 'aqrdnYGL4a4XduUozLPg6Y', '[\'《七步诗》的作者是\', \'李白的《渡荆门送别》一诗中，写出诗人渡过荆门进入楚地看到江水冲出山峦向着原野奔腾而去的壮阔景色的诗句是:##，江入大荒流\', \'##，早有蜻蜓立上头。《小池》南宋·杨万里\', \'“横看成岭侧成峰,远近高低各不同.”诗中写的名胜是\', \'千里黄云白日曛，北风吹雁雪纷纷。莫愁前路无知已，##?《别董大》唐·高适\', \'##，映日荷花别样红。《晓出净慈寺送林子方》南宋·杨万里\', \'清明上河图的作者是哪一个朝代的人？\', \'“但使龙城飞将在,不教胡马度”\', \'向晚意不适，驱车登古原。##，只是近黄昏。《乐游原》唐·李商隐\', \'晏殊的《浣溪沙》中的“无可奈何花落去”的下句是\']', '[\'曹植\\u2002\', \'山随平野尽\', \'小荷才露尖尖角\', \'庐山\', \'天下谁人不识君\', \'接天莲叶无穷碧\', \'北宋\', \'阴山\', \'夕阳无限好\', \'似曾相识燕归来\\u2002\']', null, '1546558084631', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('22', '0', '2019-01-04 07:29:16.060578', '2019-01-04 07:29:16.060578', 'tvAnb6frD7426Ga4P8RYUU', 'JQpWDHpffeUbianxozaazV', 'aqrdnYGL4a4XduUozLPg6Y', '[\'爆竹声中一岁除，##。千门万户曈曈日，总把新桃换旧符 。《元日》北宋·王安石\', \'把“春风”比作“剪刀”的是哪首诗\', \'采##东篱下，悠然见南山。\', \'北京是在哪个朝代建都的？\', \'##，将军夜引弓。平明寻白羽，没在石棱中。《塞下曲》唐·卢纶\', \'杜牧的《江南春》中“南朝四百八十寺”的下句是\', \'##，更上一层楼。《登鹳雀楼》唐·王之涣\', \'劝君更尽一杯酒，##。《送元二使安西》唐·王维\', \'元宵又称为上元节，那么下元节是几月几号？\', \'唐宋散文八大家不包括以下哪一位人物？\']', '[\'春风送暖入屠苏\', \'咏柳\', \'菊\', \'元朝\', \'林暗草惊风\', \'多少楼台烟雨中\', \'欲穷千里目\', \'西出阳关无故人\', \'十月十五\', \'李白\']', null, '1546558156059', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('23', '0', '2019-01-04 07:30:23.811715', '2019-01-04 07:30:23.811715', 'tvAnb6frD7426Ga4P8RYUU', '8b3iZXiEeooAKJH6v8yRk6', 'aqrdnYGL4a4XduUozLPg6Y', '[\'##，欲饮琵琶马上催。醉卧沙场君莫笑， 古来征战几人回。《凉州词》唐·王翰\', \'元宵又称为上元节，那么下元节是几月几号？\', \'龚自珍《己亥杂诗》“落红不是无情物,化作春泥更护花”句中,“红”是指\', \'《七步诗》的作者是\', \'独坐幽篁里，##。深林人不知，明月来相照。《竹里馆》唐·王维\', \'##，将军夜引弓。平明寻白羽，没在石棱中。《塞下曲》唐·卢纶\', \'远上寒山石径斜，##。停车坐爱枫林晚，霜叶红于二月花。《山行》唐·杜牧\', \'清明上河图的作者是哪一个朝代的人？\', \'杜甫的《春夜喜雨》中的“晓看红湿处”的下句是\', \'杜牧的《江南春》中“南朝四百八十寺”的下句是\']', '[\'葡萄美酒夜光杯\', \'十月十五\', \'花\\xa0\', \'曹植\\u2002\', \'弹琴复长啸\', \'林暗草惊风\', \'白云生处有人家\', \'北宋\', \'花重锦官城\', \'多少楼台烟雨中\']', null, '1546558223809', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('24', '0', '2019-01-04 07:48:16.516476', '2019-01-04 07:48:16.516476', 'tvAnb6frD7426Ga4P8RYUU', 'ugDcKXR8izWXFfzxftZSQN', 'aqrdnYGL4a4XduUozLPg6Y', '[\'《七步诗》的作者是\', \'千山鸟飞绝，##。孤舟蓑笠翁，独钓寒江雪。《江雪》唐·柳宗元\', \'两岸猿声啼不住，##。《早发白帝城》唐·李白\', \'“海内存知己,天涯若比邻”是谁的诗句.\', \'“解落三秋叶,能开二月花.过江千尺浪,入竹万竿斜.”这首诗写的是\', \'黑云翻墨未遮山， 白雨跳珠乱入船。##，望湖楼下水如天。《六月二十七日望湖楼醉书》北宋·苏轼\', \'独坐幽篁里，##。深林人不知，明月来相照。《竹里馆》唐·王维\', \'##，映日荷花别样红。《晓出净慈寺送林子方》南宋·杨万里\', \'不识##真面目，只缘身在此山中\', \'人闲##落，夜静春山空。\']', '[\'曹植\\u2002\', \'万径人踪灭\', \'轻舟已过万重山\', \'王勃\', \'风\', \' 卷地风来忽吹散\', \'弹琴复长啸\', \'接天莲叶无穷碧\', \'庐山\', \'桂花\']', null, '1546559296516', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('25', '0', '2019-01-04 07:48:25.884595', '2019-01-04 07:48:25.884595', 'tvAnb6frD7426Ga4P8RYUU', '7QErp6LdA4cbmbomMpC5pZ', 'aqrdnYGL4a4XduUozLPg6Y', '[\'“海内存知己,天涯若比邻”是谁的诗句.\', \'##，更上一层楼。《登鹳雀楼》唐·王之涣\', \'天似穹庐，笼盖四野。天苍苍，##，风吹草低见牛羊。《敕勒歌》北朝民歌\', \'##，万里长征人未还。但使龙城飞将在，不教胡马渡阴山!《出塞》唐·王昌龄\', \'千山鸟飞绝，##。孤舟蓑笠翁，独钓寒江雪。《江雪》唐·柳宗元\', \'劝君更尽一杯酒，##。《送元二使安西》唐·王维\', \'##，千朵万朵压枝低。《江畔独步寻花》唐·杜甫\', \'##，笑问客从何处来?《回乡偶书》唐·贺知章\', \'千里黄云白日曛，北风吹雁雪纷纷。莫愁前路无知已，##?《别董大》唐·高适\', \'##，一行白鸳上青天。窗含西岭千秋雪，门泊东吴万里船。《绝句》唐·杜甫\']', '[\'王勃\', \'欲穷千里目\', \'野茫茫\', \'秦时明月汉时关\', \'万径人踪灭\', \'西出阳关无故人\', \'黄四娘家花满蹊\', \'儿童相见不相识\', \'天下谁人不识君\', \'两个黄鹂鸣翠柳\']', null, '1546559305883', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('26', '0', '2019-01-04 07:48:45.612332', '2019-01-04 07:48:45.612332', 'tvAnb6frD7426Ga4P8RYUU', 'o53v9tcwhkdT27Piy633SM', 'aqrdnYGL4a4XduUozLPg6Y', '[\'##，早有蜻蜓立上头。《小池》南宋·杨万里\', \'“别时容易见时难”“相见时难别亦难”分别是谁的诗句\', \'慈母手中线，##，谁言寸草心，报得三春晖。《游子吟》唐·孟郊\', \'晏殊的《浣溪沙》中的“无可奈何花落去”的下句是\', \'“独在异乡为异客,每逢佳节倍思亲”是谁的诗句.\', \'日出江花红胜火，##，能不忆江南?《忆江南》唐·白居易\', \'龙舟是为了纪念哪位文化名人的？\', \'##，映日荷花别样红。《晓出净慈寺送林子方》南宋·杨万里\', \'采##东篱下，悠然见南山。\', \'##，千朵万朵压枝低。《江畔独步寻花》唐·杜甫\']', '[\'小荷才露尖尖角\', \'李煜、柳永\', \'游子身上衣\', \'似曾相识燕归来\\u2002\', \'王维\', \'春来江水绿如蓝\', \'屈原\', \'接天莲叶无穷碧\', \'菊\', \'黄四娘家花满蹊\']', null, '1546559325612', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('27', '0', '2019-01-04 07:52:52.647181', '2019-01-04 07:52:52.647181', 'tvAnb6frD7426Ga4P8RYUU', '7HYmSRwiXajAUFuEqadGDg', 'aqrdnYGL4a4XduUozLPg6Y', '[\'北京是在哪个朝代建都的？\', \'人闲##落，夜静春山空。\', \'《天净沙·秋思》是一首小令,作者是元代的\', \'不识##真面目，只缘身在此山中\', \'“忽如一夜春风来,千树万树梨花开”写的是\', \'“别时容易见时难”“相见时难别亦难”分别是谁的诗句\', \'昼出耘田夜绩麻，##。童孙未解供耕织，也傍桑阴学种瓜。《四时田园杂兴》南宋·范成大\', \'##，更上一层楼。《登鹳雀楼》唐·王之涣\', \'千里黄云白日曛，北风吹雁雪纷纷。莫愁前路无知已，##?《别董大》唐·高适\', \'采##东篱下，悠然见南山。\']', '[\'元朝\', \'桂花\', \'马致远\', \'庐山\', \'雪景\', \'李煜、柳永\', \'村庄儿女各当家\', \'欲穷千里目\', \'天下谁人不识君\', \'菊\']', null, '1546559572646', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('28', '0', '2019-01-04 07:53:29.502099', '2019-01-04 07:53:29.502099', 'tvAnb6frD7426Ga4P8RYUU', 'bkxAe9dBjw4KexLhKyYqEh', 'aqrdnYGL4a4XduUozLPg6Y', '[\'君住长江南，我住长江北，##，共饮长江水\', \'清明上河图的作者是哪一个朝代的人？\', \'有情##含春泪，无力蔷薇卧晚枝。\', \'湖光秋月两相和,##。 遥望洞庭山水色,白银盘里一青螺。《望洞庭》唐·刘禹锡\', \'商女不知亡国恨下一句是？\', \'采##东篱下，悠然见南山。\', \'迟日江山丽，春风花草香。##，沙暧睡鸳鸯。《绝句》唐·杜甫\', \'##，欲饮琵琶马上催。醉卧沙场君莫笑， 古来征战几人回。《凉州词》唐·王翰\', \'##，将军夜引弓。平明寻白羽，没在石棱中。《塞下曲》唐·卢纶\', \'“无边落木萧萧下,不尽长江滚滚来”出自杜甫的\']', '[\'日日思君不见君\', \'北宋\', \'芍药\', \'潭面无风镜未磨\', \'隔江犹唱后庭花\', \'菊\', \'泥融飞燕子\', \'葡萄美酒夜光杯\', \'林暗草惊风\', \'《登高》\']', null, '1546559609502', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('29', '0', '2019-01-04 07:57:03.720985', '2019-01-04 07:57:03.720985', 'tvAnb6frD7426Ga4P8RYUU', 'p26eQ3VefWwmWv3ypr55W6', 'aqrdnYGL4a4XduUozLPg6Y', '[\'慈母手中线，##，谁言寸草心，报得三春晖。《游子吟》唐·孟郊\', \'黑云翻墨未遮山， 白雨跳珠乱入船。##，望湖楼下水如天。《六月二十七日望湖楼醉书》北宋·苏轼\', \'《天净沙·秋思》是一首小令,作者是元代的\', \'“海内存知己,天涯若比邻”是谁的诗句.\', \'《七步诗》的作者是\', \'离离原上草，##。野火烧不尽，春风吹又生。《赋得古原草送别》唐·白居易\', \'昼出耘田夜绩麻，##。童孙未解供耕织，也傍桑阴学种瓜。《四时田园杂兴》南宋·范成大\', \'##，笑问客从何处来?《回乡偶书》唐·贺知章\', \'北京是在哪个朝代建都的？\', \'杜牧的《江南春》中“南朝四百八十寺”的下句是\']', '[\'游子身上衣\', \' 卷地风来忽吹散\', \'马致远\', \'王勃\', \'曹植\\u2002\', \'一岁一枯荣\', \'村庄儿女各当家\', \'儿童相见不相识\', \'元朝\', \'多少楼台烟雨中\']', null, '1546559823720', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('30', '0', '2019-01-04 08:03:48.601291', '2019-01-04 08:03:48.601291', 'tvAnb6frD7426Ga4P8RYUU', 'maJMxnNaQsnxrVfxqEYJEC', 'aqrdnYGL4a4XduUozLPg6Y', '[\'龙舟是为了纪念哪位文化名人的？\', \'黑云翻墨未遮山， 白雨跳珠乱入船。##，望湖楼下水如天。《六月二十七日望湖楼醉书》北宋·苏轼\', \'千里黄云白日曛，北风吹雁雪纷纷。莫愁前路无知已，##?《别董大》唐·高适\', \'##，千朵万朵压枝低。《江畔独步寻花》唐·杜甫\', \'“横看成岭侧成峰,远近高低各不同.”诗中写的名胜是\', \'##，早有蜻蜓立上头。《小池》南宋·杨万里\', \'##，将军夜引弓。平明寻白羽，没在石棱中。《塞下曲》唐·卢纶\', \'“海内存知己,天涯若比邻”是谁的诗句.\', \'“解落三秋叶,能开二月花.过江千尺浪,入竹万竿斜.”这首诗写的是\', \'##，映日荷花别样红。《晓出净慈寺送林子方》南宋·杨万里\']', '[\'屈原\', \' 卷地风来忽吹散\', \'天下谁人不识君\', \'黄四娘家花满蹊\', \'庐山\', \'小荷才露尖尖角\', \'林暗草惊风\', \'王勃\', \'风\', \'接天莲叶无穷碧\']', null, '1546560228600', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('31', '0', '2019-01-04 08:04:22.722911', '2019-01-04 08:04:22.722911', 'tvAnb6frD7426Ga4P8RYUU', 'UoF8KTPEUgv4EToRhRpV37', 'aqrdnYGL4a4XduUozLPg6Y', '[\'远上寒山石径斜，##。停车坐爱枫林晚，霜叶红于二月花。《山行》唐·杜牧\', \'湖光秋月两相和,##。 遥望洞庭山水色,白银盘里一青螺。《望洞庭》唐·刘禹锡\', \'“春蚕到死丝方尽,蜡炬成灰泪始干”出自谁的《无题》\', \'杜甫的《春夜喜雨》中的“晓看红湿处”的下句是\', \'劝君更尽一杯酒，##。《送元二使安西》唐·王维\', \'杜牧的《江南春》中“南朝四百八十寺”的下句是\', \'有情##含春泪，无力蔷薇卧晚枝。\', \'“野火烧不尽,春风吹又生”一句出自\', \'独坐幽篁里，##。深林人不知，明月来相照。《竹里馆》唐·王维\', \'“停车坐爱枫林晚,霜叶红于二月花”中“坐”的意思是\']', '[\'白云生处有人家\', \'潭面无风镜未磨\', \'李商隐\', \'花重锦官城\', \'西出阳关无故人\', \'多少楼台烟雨中\', \'芍药\', \'白居易《赋得古原草送别》\', \'弹琴复长啸\', \'因为\']', null, '1546560262722', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('32', '1', '2019-01-04 08:04:33.511416', '2019-01-04 08:04:50.032825', 'tvAnb6frD7426Ga4P8RYUU', 'CTxihSEsgHBm2digpkSwVT', 'aqrdnYGL4a4XduUozLPg6Y', '[\'爆竹声中一岁除，##。千门万户曈曈日，总把新桃换旧符 。《元日》北宋·王安石\', \'“别时容易见时难”“相见时难别亦难”分别是谁的诗句\', \'湖光秋月两相和,##。 遥望洞庭山水色,白银盘里一青螺。《望洞庭》唐·刘禹锡\', \'千山鸟飞绝，##。孤舟蓑笠翁，独钓寒江雪。《江雪》唐·柳宗元\', \'“忽如一夜春风来,千树万树梨花开”写的是\', \'##，欲饮琵琶马上催。醉卧沙场君莫笑， 古来征战几人回。《凉州词》唐·王翰\', \'有情##含春泪，无力蔷薇卧晚枝。\', \'迟日江山丽，春风花草香。##，沙暧睡鸳鸯。《绝句》唐·杜甫\', \'黑云翻墨未遮山， 白雨跳珠乱入船。##，望湖楼下水如天。《六月二十七日望湖楼醉书》北宋·苏轼\', \'昼出耘田夜绩麻，##。童孙未解供耕织，也傍桑阴学种瓜。《四时田园杂兴》南宋·范成大\']', '[\'春风送暖入屠苏\', \'李煜、柳永\', \'潭面无风镜未磨\', \'万径人踪灭\', \'雪景\', \'葡萄美酒夜光杯\', \'芍药\', \'泥融飞燕子\', \' 卷地风来忽吹散\', \'村庄儿女各当家\']', '[\'f_12,\', \'c_25,\', \'f_33,\', \'f_36,\', \'c_21,\', \'f_26,\', \'f_5,\', \'f_22,\', \'f_17,\', \'f_19,\']', '1546560273510', '1546560289967', '16457', '1', '1', '0', '10', '10', '0', '[]', '[[\'c_25\', \'\'], [\'c_21\', \'\']]');
INSERT INTO `competition_competitionqainfo` VALUES ('33', '2', '2019-01-04 08:10:09.230917', '2019-01-04 08:15:38.256394', 'tvAnb6frD7426Ga4P8RYUU', 'VQL6ycauVpWZoD6LoUXcDk', 'aqrdnYGL4a4XduUozLPg6Y', '[\'李白的《渡荆门送别》一诗中，写出诗人渡过荆门进入楚地看到江水冲出山峦向着原野奔腾而去的壮阔景色的诗句是:##，江入大荒流\', \'爆竹声中一岁除，##。千门万户曈曈日，总把新桃换旧符 。《元日》北宋·王安石\', \'“横看成岭侧成峰,远近高低各不同.”诗中写的名胜是\', \'昼出耘田夜绩麻，##。童孙未解供耕织，也傍桑阴学种瓜。《四时田园杂兴》南宋·范成大\', \'两岸猿声啼不住，##。《早发白帝城》唐·李白\', \'湖光秋月两相和,##。 遥望洞庭山水色,白银盘里一青螺。《望洞庭》唐·刘禹锡\', \'空山不见人，但闻人语响。##，复照青苔上。《鹿柴》唐·王维\', \'唐宋散文八大家不包括以下哪一位人物？\', \'晏殊的《浣溪沙》中的“无可奈何花落去”的下句是\', \'“忽如一夜春风来,千树万树梨花开”写的是\']', '[\'山随平野尽\', \'春风送暖入屠苏\', \'庐山\', \'村庄儿女各当家\', \'轻舟已过万重山\', \'潭面无风镜未磨\', \'返景入深林\', \'李白\', \'似曾相识燕归来\\u2002\', \'雪景\']', '[\'f_3,\', \'f_12,\', \'c_12,D\', \'f_19,\', \'f_15,轻舟已过万重山\', \'f_33,\', \'f_25,\', \'c_5,\', \'c_8,\', \'c_21,\']', '1546560609229', '1546560938225', '328996', '1', '1', '2', '8', '10', '20', '[[\'c_12\', \'D\']]', '[[\'c_5\', \'\'], [\'c_8\', \'\'], [\'c_21\', \'\']]');
INSERT INTO `competition_competitionqainfo` VALUES ('34', '1', '2019-01-04 08:22:20.755140', '2019-01-04 08:22:27.990304', 'tvAnb6frD7426Ga4P8RYUU', 'Ezu5DZaLDGWv5f3tefxr5D', 'aqrdnYGL4a4XduUozLPg6Y', '[\'远上寒山石径斜，##。停车坐爱枫林晚，霜叶红于二月花。《山行》唐·杜牧\', \'君住长江南，我住长江北，##，共饮长江水\', \'黑云翻墨未遮山， 白雨跳珠乱入船。##，望湖楼下水如天。《六月二十七日望湖楼醉书》北宋·苏轼\', \'北京是在哪个朝代建都的？\', \'不知细叶谁裁出，##。《咏柳》唐·贺知章\', \'天似穹庐，笼盖四野。天苍苍，##，风吹草低见牛羊。《敕勒歌》北朝民歌\', \'“春蚕到死丝方尽,蜡炬成灰泪始干”出自谁的《无题》\', \'千山鸟飞绝，##。孤舟蓑笠翁，独钓寒江雪。《江雪》唐·柳宗元\', \'##，欲饮琵琶马上催。醉卧沙场君莫笑， 古来征战几人回。《凉州词》唐·王翰\', \'##，一行白鸳上青天。窗含西岭千秋雪，门泊东吴万里船。《绝句》唐·杜甫\']', '[\'白云生处有人家\', \'日日思君不见君\', \' 卷地风来忽吹散\', \'元朝\', \'二月春风似剪刀\', \'野茫茫\', \'李商隐\', \'万径人踪灭\', \'葡萄美酒夜光杯\', \'两个黄鹂鸣翠柳\']', '[\'f_29,\', \'f_2,\', \'f_17,\', \'c_4,\', \'f_20,\', \'f_8,\', \'c_22,\', \'f_36,\', \'f_26,\', \'f_30,\']', '1546561340754', '1546561347932', '7178', '1', '1', '0', '10', '10', '0', '[]', '[[\'c_4\', \'\'], [\'c_22\', \'\']]');
INSERT INTO `competition_competitionqainfo` VALUES ('35', '1', '2019-01-04 08:31:30.891101', '2019-01-04 08:31:55.673058', 'tvAnb6frD7426Ga4P8RYUU', 'tmTSXpJH4Hp5oedAsABMSe', 'aqrdnYGL4a4XduUozLPg6Y', '[\'两岸猿声啼不住，##。《早发白帝城》唐·李白\', \'晏殊的《浣溪沙》中的“无可奈何花落去”的下句是\', \'“横看成岭侧成峰,远近高低各不同.”诗中写的名胜是\', \'##，更上一层楼。《登鹳雀楼》唐·王之涣\', \'有情##含春泪，无力蔷薇卧晚枝。\', \'爆竹声中一岁除，##。千门万户曈曈日，总把新桃换旧符 。《元日》北宋·王安石\', \'清明上河图的作者是哪一个朝代的人？\', \'迟日江山丽，春风花草香。##，沙暧睡鸳鸯。《绝句》唐·杜甫\', \'补全诗句：到现在，乡愁是一湾##，我在这头，大陆在那头。\', \'“独在异乡为异客,每逢佳节倍思亲”是谁的诗句.\']', '[\'轻舟已过万重山\', \'似曾相识燕归来\\u2002\', \'庐山\', \'欲穷千里目\', \'芍药\', \'春风送暖入屠苏\', \'北宋\', \'泥融飞燕子\', \'浅浅的海峡\', \'王维\']', '[\'f_15,\', \'c_8,\', \'c_12,\', \'f_13,\', \'f_5,\', \'f_12,\', \'c_6,B\', \'f_22,\', \'f_1,\', \'c_18,A\']', '1546561890891', '1546561915646', '24755', '1', '1', '2', '8', '10', '20', '[[\'c_6\', \'B\'], [\'c_18\', \'A\']]', '[[\'c_8\', \'\'], [\'c_12\', \'\']]');
INSERT INTO `competition_competitionqainfo` VALUES ('36', '2', '2019-01-04 08:35:45.068250', '2019-01-04 08:47:21.010612', 'tvAnb6frD7426Ga4P8RYUU', 'HhGR9ZEvYfPeRz3ykUQnDZ', 'aqrdnYGL4a4XduUozLPg6Y', '[\'千里黄云白日曛，北风吹雁雪纷纷。莫愁前路无知已，##?《别董大》唐·高适\', \'“忽如一夜春风来,千树万树梨花开”写的是\', \'劝君更尽一杯酒，##。《送元二使安西》唐·王维\', \'商女不知亡国恨下一句是？\', \'“别时容易见时难”“相见时难别亦难”分别是谁的诗句\', \'##，早有蜻蜓立上头。《小池》南宋·杨万里\', \'黑云翻墨未遮山， 白雨跳珠乱入船。##，望湖楼下水如天。《六月二十七日望湖楼醉书》北宋·苏轼\', \'湖光秋月两相和,##。 遥望洞庭山水色,白银盘里一青螺。《望洞庭》唐·刘禹锡\', \'不识##真面目，只缘身在此山中\', \'“但使龙城飞将在,不教胡马度”\']', '[\'天下谁人不识君\', \'雪景\', \'西出阳关无故人\', \'隔江犹唱后庭花\', \'李煜、柳永\', \'小荷才露尖尖角\', \' 卷地风来忽吹散\', \'潭面无风镜未磨\', \'庐山\', \'阴山\']', '[\'f_27,\', \'c_21,\', \'f_23,\', \'c_1,\', \'c_25,\', \'f_18,\', \'f_17,\', \'f_33,\', \'f_4,\', \'c_14,\']', '1546562145066', '1546562840983', '695917', '1', '1', '0', '10', '10', '0', '[]', '[[\'c_21\', \'\'], [\'c_1\', \'\'], [\'c_25\', \'\'], [\'c_14\', \'\']]');
INSERT INTO `competition_competitionqainfo` VALUES ('37', '2', '2019-01-04 08:59:07.344288', '2019-01-04 09:10:26.945351', 'tvAnb6frD7426Ga4P8RYUU', 'MS4cReSBgCeQT5HwjKPvjR', 'aqrdnYGL4a4XduUozLPg6Y', '[\'不识##真面目，只缘身在此山中\', \'《天净沙·秋思》是一首小令,作者是元代的\', \'李白的《渡荆门送别》一诗中，写出诗人渡过荆门进入楚地看到江水冲出山峦向着原野奔腾而去的壮阔景色的诗句是:##，江入大荒流\', \'离离原上草，##。野火烧不尽，春风吹又生。《赋得古原草送别》唐·白居易\', \'“海内存知己,天涯若比邻”是谁的诗句.\', \'##，万里长征人未还。但使龙城飞将在，不教胡马渡阴山!《出塞》唐·王昌龄\', \'慈母手中线，##，谁言寸草心，报得三春晖。《游子吟》唐·孟郊\', \'商女不知亡国恨下一句是？\', \'“忽如一夜春风来,千树万树梨花开”写的是\', \'《七步诗》的作者是\']', '[\'庐山\', \'马致远\', \'山随平野尽\', \'一岁一枯荣\', \'王勃\', \'秦时明月汉时关\', \'游子身上衣\', \'隔江犹唱后庭花\', \'雪景\', \'曹植\\u2002\']', '[\'f_4,\', \'c_19,\', \'f_3,\', \'f_24,\', \'c_15,\', \'f_28,\', \'f_11,\', \'c_1,\', \'c_21,\', \'c_9,\']', '1546563547344', '1546564226911', '679567', '1', '1', '0', '10', '10', '0', '[]', '[[\'c_19\', \'\'], [\'c_15\', \'\'], [\'c_1\', \'\'], [\'c_21\', \'\'], [\'c_9\', \'\']]');
INSERT INTO `competition_competitionqainfo` VALUES ('38', '1', '2019-01-04 09:36:43.641364', '2019-01-04 09:36:55.414693', 'tvAnb6frD7426Ga4P8RYUU', 'X3PGXc7dxff86qeJwJ7mCo', 'aqrdnYGL4a4XduUozLPg6Y', '[\'千山鸟飞绝，##。孤舟蓑笠翁，独钓寒江雪。《江雪》唐·柳宗元\', \'龚自珍《己亥杂诗》“落红不是无情物,化作春泥更护花”句中,“红”是指\', \'“但使龙城飞将在,不教胡马度”\', \'“停车坐爱枫林晚,霜叶红于二月花”中“坐”的意思是\', \'晏殊的《浣溪沙》中的“无可奈何花落去”的下句是\', \'昼出耘田夜绩麻，##。童孙未解供耕织，也傍桑阴学种瓜。《四时田园杂兴》南宋·范成大\', \'离离原上草，##。野火烧不尽，春风吹又生。《赋得古原草送别》唐·白居易\', \'迟日江山丽，春风花草香。##，沙暧睡鸳鸯。《绝句》唐·杜甫\', \'##，一行白鸳上青天。窗含西岭千秋雪，门泊东吴万里船。《绝句》唐·杜甫\', \'两岸猿声啼不住，##。《早发白帝城》唐·李白\']', '[\'万径人踪灭\', \'花\\xa0\', \'阴山\', \'因为\', \'似曾相识燕归来\\u2002\', \'村庄儿女各当家\', \'一岁一枯荣\', \'泥融飞燕子\', \'两个黄鹂鸣翠柳\', \'轻舟已过万重山\']', '[\'f_36,\', \'c_24,\', \'c_14,\', \'c_16,\', \'c_8,\', \'f_19,\', \'f_24,\', \'f_22,\', \'f_30,\', \'f_15,\']', '1546565803641', '1546565815379', '11738', '1', '1', '0', '10', '10', '0', '[]', '[[\'c_24\', \'\'], [\'c_14\', \'\'], [\'c_16\', \'\'], [\'c_8\', \'\']]');
INSERT INTO `competition_competitionqainfo` VALUES ('39', '0', '2019-01-04 09:57:21.258505', '2019-01-04 09:57:21.258505', 'tvAnb6frD7426Ga4P8RYUU', '9GLU6VrMVjhHeeDF4KDyz7', 'aqrdnYGL4a4XduUozLPg6Y', '[\'“野火烧不尽,春风吹又生”一句出自\', \'飞流直下三千尺，##。《望庐山瀑布》唐·李白\', \'“忽如一夜春风来,千树万树梨花开”写的是\', \'“解落三秋叶,能开二月花.过江千尺浪,入竹万竿斜.”这首诗写的是\', \'龚自珍《己亥杂诗》“落红不是无情物,化作春泥更护花”句中,“红”是指\', \'离离原上草，##。野火烧不尽，春风吹又生。《赋得古原草送别》唐·白居易\', \'##，欲饮琵琶马上催。醉卧沙场君莫笑， 古来征战几人回。《凉州词》唐·王翰\', \'不知细叶谁裁出，##。《咏柳》唐·贺知章\', \'墙角数枝梅，凌寒独自开。##，为有暗香来。《梅花》北宋·王安石\', \'《天净沙·秋思》是一首小令,作者是元代的\']', '[\'白居易《赋得古原草送别》\', \'疑是银河落九天\', \'雪景\', \'风\', \'花\\xa0\', \'一岁一枯荣\', \'葡萄美酒夜光杯\', \'二月春风似剪刀\', \'遥知不是雪\', \'马致远\']', null, '1546567041257', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('40', '1', '2019-01-04 09:57:31.941158', '2019-01-04 09:57:42.964102', 'tvAnb6frD7426Ga4P8RYUU', 'EcWdXhhjPJqsksaAzco6Rc', 'aqrdnYGL4a4XduUozLPg6Y', '[\'采##东篱下，悠然见南山。\', \'“别时容易见时难”“相见时难别亦难”分别是谁的诗句\', \'把“春风”比作“剪刀”的是哪首诗\', \'“但使龙城飞将在,不教胡马度”\', \'两岸猿声啼不住，##。《早发白帝城》唐·李白\', \'元宵又称为上元节，那么下元节是几月几号？\', \'“横看成岭侧成峰,远近高低各不同.”诗中写的名胜是\', \'不知细叶谁裁出，##。《咏柳》唐·贺知章\', \'“独在异乡为异客,每逢佳节倍思亲”是谁的诗句.\', \'##，早有蜻蜓立上头。《小池》南宋·杨万里\']', '[\'菊\', \'李煜、柳永\', \'咏柳\', \'阴山\', \'轻舟已过万重山\', \'十月十五\', \'庐山\', \'二月春风似剪刀\', \'王维\', \'小荷才露尖尖角\']', '[\'f_7,\', \'c_25,\', \'c_11,\', \'c_14,\', \'f_15,\', \'c_3,\', \'c_12,\', \'f_20,\', \'c_18,\', \'f_18,\']', '1546567051941', '1546567062923', '10982', '1', '1', '0', '10', '10', '0', '[]', '[[\'c_25\', \'\'], [\'c_11\', \'\'], [\'c_14\', \'\'], [\'c_3\', \'\'], [\'c_12\', \'\'], [\'c_18\', \'\']]');
INSERT INTO `competition_competitionqainfo` VALUES ('41', '0', '2019-01-07 01:13:11.372797', '2019-01-07 01:13:11.372797', 'tvAnb6frD7426Ga4P8RYUU', 'HoPdk5Wq8Ak68pLBDDgvQi', 'aqrdnYGL4a4XduUozLPg6Y', '[\'独坐幽篁里，##。深林人不知，明月来相照。《竹里馆》唐·王维\', \'“无边落木萧萧下,不尽长江滚滚来”出自杜甫的\', \'“独在异乡为异客,每逢佳节倍思亲”是谁的诗句.\', \'杜甫的《春夜喜雨》中的“晓看红湿处”的下句是\', \'“别时容易见时难”“相见时难别亦难”分别是谁的诗句\', \'“忽如一夜春风来,千树万树梨花开”写的是\', \'清明上河图的作者是哪一个朝代的人？\', \'##，映日荷花别样红。《晓出净慈寺送林子方》南宋·杨万里\', \'采##东篱下，悠然见南山。\', \'北京是在哪个朝代建都的？\']', '[\'弹琴复长啸\', \'《登高》\', \'王维\', \'花重锦官城\', \'李煜、柳永\', \'雪景\', \'北宋\', \'接天莲叶无穷碧\', \'菊\', \'元朝\']', null, '1546794791371', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('42', '0', '2019-01-07 01:21:35.923956', '2019-01-07 01:21:35.923956', 'tvAnb6frD7426Ga4P8RYUU', 'h4GZDxUCPHbqrHf8XrZVpS', 'aqrdnYGL4a4XduUozLPg6Y', '[\'爆竹声中一岁除，##。千门万户曈曈日，总把新桃换旧符 。《元日》北宋·王安石\', \'人闲##落，夜静春山空。\', \'##，将军夜引弓。平明寻白羽，没在石棱中。《塞下曲》唐·卢纶\', \'“别时容易见时难”“相见时难别亦难”分别是谁的诗句\', \'商女不知亡国恨下一句是？\', \'##，万里长征人未还。但使龙城飞将在，不教胡马渡阴山!《出塞》唐·王昌龄\', \'##，早有蜻蜓立上头。《小池》南宋·杨万里\', \'把“春风”比作“剪刀”的是哪首诗\', \'飞流直下三千尺，##。《望庐山瀑布》唐·李白\', \'千山鸟飞绝，##。孤舟蓑笠翁，独钓寒江雪。《江雪》唐·柳宗元\']', '[\'春风送暖入屠苏\', \'桂花\', \'林暗草惊风\', \'李煜、柳永\', \'隔江犹唱后庭花\', \'秦时明月汉时关\', \'小荷才露尖尖角\', \'咏柳\', \'疑是银河落九天\', \'万径人踪灭\']', null, '1546795295922', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('43', '0', '2019-01-07 01:23:39.894234', '2019-01-07 01:23:39.895230', 'tvAnb6frD7426Ga4P8RYUU', 'UQSQFj8EePS72qGXtHm4S4', 'aqrdnYGL4a4XduUozLPg6Y', '[\'##，千朵万朵压枝低。《江畔独步寻花》唐·杜甫\', \'唐宋散文八大家不包括以下哪一位人物？\', \'两岸猿声啼不住，##。《早发白帝城》唐·李白\', \'空山不见人，但闻人语响。##，复照青苔上。《鹿柴》唐·王维\', \'杜牧的《江南春》中“南朝四百八十寺”的下句是\', \'飞流直下三千尺，##。《望庐山瀑布》唐·李白\', \'劝君更尽一杯酒，##。《送元二使安西》唐·王维\', \'远上寒山石径斜，##。停车坐爱枫林晚，霜叶红于二月花。《山行》唐·杜牧\', \'晏殊的《浣溪沙》中的“无可奈何花落去”的下句是\', \'龙舟是为了纪念哪位文化名人的？\']', '[\'黄四娘家花满蹊\', \'李白\', \'轻舟已过万重山\', \'返景入深林\', \'多少楼台烟雨中\', \'疑是银河落九天\', \'西出阳关无故人\', \'白云生处有人家\', \'似曾相识燕归来\\u2002\', \'屈原\']', null, '1546795419893', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('44', '0', '2019-01-07 05:38:57.971765', '2019-01-07 05:38:57.971765', 'tvAnb6frD7426Ga4P8RYUU', '67UXCr9zZNHDTeheChitHn', 'aqrdnYGL4a4XduUozLPg6Y', '[\'杜牧的《江南春》中“南朝四百八十寺”的下句是\', \'日出江花红胜火，##，能不忆江南?《忆江南》唐·白居易\', \'千山鸟飞绝，##。孤舟蓑笠翁，独钓寒江雪。《江雪》唐·柳宗元\', \'不知细叶谁裁出，##。《咏柳》唐·贺知章\', \'##，万里长征人未还。但使龙城飞将在，不教胡马渡阴山!《出塞》唐·王昌龄\', \'不识##真面目，只缘身在此山中\', \'“横看成岭侧成峰,远近高低各不同.”诗中写的名胜是\', \'李白的《渡荆门送别》一诗中，写出诗人渡过荆门进入楚地看到江水冲出山峦向着原野奔腾而去的壮阔景色的诗句是:##，江入大荒流\', \'《天净沙·秋思》是一首小令,作者是元代的\', \'两岸猿声啼不住，##。《早发白帝城》唐·李白\']', '[\'多少楼台烟雨中\', \'春来江水绿如蓝\', \'万径人踪灭\', \'二月春风似剪刀\', \'秦时明月汉时关\', \'庐山\', \'庐山\', \'山随平野尽\', \'马致远\', \'轻舟已过万重山\']', null, '1546810737970', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('45', '0', '2019-01-07 06:15:09.401543', '2019-01-07 06:15:09.401543', 'tvAnb6frD7426Ga4P8RYUU', 'qoxjTMohkteRCp3q59bxt4', 'aqrdnYGL4a4XduUozLPg6Y', '[\'##，万里长征人未还。但使龙城飞将在，不教胡马渡阴山!《出塞》唐·王昌龄\', \'千里黄云白日曛，北风吹雁雪纷纷。莫愁前路无知已，##?《别董大》唐·高适\', \'“解落三秋叶,能开二月花.过江千尺浪,入竹万竿斜.”这首诗写的是\', \'补全诗句：到现在，乡愁是一湾##，我在这头，大陆在那头。\', \'“忽如一夜春风来,千树万树梨花开”写的是\', \'迟日江山丽，春风花草香。##，沙暧睡鸳鸯。《绝句》唐·杜甫\', \'千山鸟飞绝，##。孤舟蓑笠翁，独钓寒江雪。《江雪》唐·柳宗元\', \'黑云翻墨未遮山， 白雨跳珠乱入船。##，望湖楼下水如天。《六月二十七日望湖楼醉书》北宋·苏轼\', \'“别时容易见时难”“相见时难别亦难”分别是谁的诗句\', \'##，一行白鸳上青天。窗含西岭千秋雪，门泊东吴万里船。《绝句》唐·杜甫\']', '[\'秦时明月汉时关\', \'天下谁人不识君\', \'风\', \'浅浅的海峡\', \'雪景\', \'泥融飞燕子\', \'万径人踪灭\', \' 卷地风来忽吹散\', \'李煜\', \'两个黄鹂鸣翠柳\']', null, '1546812909401', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('46', '1', '2019-01-07 06:21:23.149530', '2019-01-07 06:24:10.461824', 'tvAnb6frD7426Ga4P8RYUU', 'TwJ4GHLT4vqh9LLGVTdqHR', '2ASBWWkp3gu4RwvQeEmKzQ', '[\'爆竹声中一岁除，##。千门万户曈曈日，总把新桃换旧符 。《元日》北宋·王安石\', \'独坐幽篁里，##。深林人不知，明月来相照。《竹里馆》唐·王维\', \'黑云翻墨未遮山， 白雨跳珠乱入船。##，望湖楼下水如天。《六月二十七日望湖楼醉书》北宋·苏轼\', \'清明上河图的作者是哪一个朝代的人？\', \'空山不见人，但闻人语响。##，复照青苔上。《鹿柴》唐·王维\', \'龙舟是为了纪念哪位文化名人的？\', \'千里黄云白日曛，北风吹雁雪纷纷。莫愁前路无知已，##?《别董大》唐·高适\', \'“横看成岭侧成峰,远近高低各不同.”诗中写的名胜是\', \'君住长江南，我住长江北，##，共饮长江水\', \'墙角数枝梅，凌寒独自开。##，为有暗香来。《梅花》北宋·王安石\']', '[\'春风送暖入屠苏\', \'弹琴复长啸\', \' 卷地风来忽吹散\', \'北宋\', \'返景入深林\', \'屈原\', \'天下谁人不识君\', \'庐山\', \'日日思君不见君\', \'遥知不是雪\']', '[\'f_12,春风送暖入屠苏\', \'f_31,弹琴复长啸\', \'f_17,卷地风来忽吹散\', \'c_6,B\', \'f_25,返景入深林\', \'c_2,D\', \'f_27,天下谁人不识君\', \'c_12,D\', \'f_2,日日思君不見君\', \'f_32,遥知不是雪\']', '1546813283148', '1546813450432', '167284', '1', '1', '8', '2', '10', '80', '[[\'c_6\', \'B\'], [\'c_2\', \'D\'], [\'c_12\', \'D\']]', '[]');
INSERT INTO `competition_competitionqainfo` VALUES ('47', '0', '2019-01-07 10:05:24.704638', '2019-01-07 10:05:24.705638', 'tvAnb6frD7426Ga4P8RYUU', 'Ef6xy5fyxh3CWBF5GFcjbC', 'aqrdnYGL4a4XduUozLPg6Y', '[\'商女不知亡国恨下一句是？\', \'湖光秋月两相和,##。 遥望洞庭山水色,白银盘里一青螺。《望洞庭》唐·刘禹锡\', \'《天净沙·秋思》是一首小令,作者是元代的\', \'“独在异乡为异客,每逢佳节倍思亲”是谁的诗句.\', \'##，一行白鸳上青天。窗含西岭千秋雪，门泊东吴万里船。《绝句》唐·杜甫\', \'“无边落木萧萧下,不尽长江滚滚来”出自杜甫的\', \'日出江花红胜火，##，能不忆江南?《忆江南》唐·白居易\', \'天子呼来不上船，自称臣是酒中仙。说的是哪一位人物？\', \'爆竹声中一岁除，##。千门万户曈曈日，总把新桃换旧符 。《元日》北宋·王安石\', \'《七步诗》的作者是\']', '[\'隔江犹唱后庭花\', \'潭面无风镜未磨\', \'马致远\', \'王维\', \'两个黄鹂鸣翠柳\', \'《登高》\', \'春来江水绿如蓝\', \'李白\', \'春风送暖入屠苏\', \'曹植\\u2002\']', null, '1546826724704', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('48', '0', '2019-01-08 02:54:24.860938', '2019-01-08 02:54:24.860938', 'tvAnb6frD7426Ga4P8RYUU', '9YtrA7zCugXHB7QhXoFWJM', 'aqrdnYGL4a4XduUozLPg6Y', '[\'晏殊的《浣溪沙》中的“无可奈何花落去”的下句是\', \'黑云翻墨未遮山， 白雨跳珠乱入船。##，望湖楼下水如天。《六月二十七日望湖楼醉书》北宋·苏轼\', \'独坐幽篁里，##。深林人不知，明月来相照。《竹里馆》唐·王维\', \'##，将军夜引弓。平明寻白羽，没在石棱中。《塞下曲》唐·卢纶\', \'不知细叶谁裁出，##。《咏柳》唐·贺知章\', \'李白的《渡荆门送别》一诗中，写出诗人渡过荆门进入楚地看到江水冲出山峦向着原野奔腾而去的壮阔景色的诗句是:##，江入大荒流\', \'杜甫的《春夜喜雨》中的“晓看红湿处”的下句是\', \'劝君更尽一杯酒，##。《送元二使安西》唐·王维\', \'飞流直下三千尺，##。《望庐山瀑布》唐·李白\', \'商女不知亡国恨下一句是？\']', '[\'似曾相识燕归来\\u2002\', \' 卷地风来忽吹散\', \'弹琴复长啸\', \'林暗草惊风\', \'二月春风似剪刀\', \'山随平野尽\', \'花重锦官城\', \'西出阳关无故人\', \'疑是银河落九天\', \'隔江犹唱后庭花\']', null, '1546887264860', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('49', '1', '2019-01-08 07:56:20.176664', '2019-01-08 07:56:55.892667', 'tvAnb6frD7426Ga4P8RYUU', 'J9dcpbVLPix5YVfCYkLEge', '2ASBWWkp3gu4RwvQeEmKzQ', '[\'元宵又称为上元节，那么下元节是几月几号？\', \'“海内存知己,天涯若比邻”是谁的诗句.\', \'飞流直下三千尺，##。《望庐山瀑布》唐·李白\', \'“解落三秋叶,能开二月花.过江千尺浪,入竹万竿斜.”这首诗写的是\', \'龙舟是为了纪念哪位文化名人的？\', \'爆竹声中一岁除，##。千门万户曈曈日，总把新桃换旧符 。《元日》北宋·王安石\', \'##，早有蜻蜓立上头。《小池》南宋·杨万里\', \'唐宋散文八大家不包括以下哪一位人物？\', \'商女不知亡国恨下一句是？\', \'“别时容易见时难”“相见时难别亦难”分别是谁的诗句\']', '[\'十月十五\', \'王勃\', \'疑是银河落九天\', \'风\', \'屈原\', \'春风送暖入屠苏\', \'小荷才露尖尖角\', \'李白\', \'隔江犹唱后庭花\', \'李煜\']', '[\'c_3,A\', \'c_15,A\', \'f_14,疑是银河落九天\', \'c_13,\', \'c_2,\', \'f_12,\', \'f_18,\', \'c_5,\', \'c_1,\', \'c_25,\']', '1546905380175', '1546905415862', '35687', '1', '1', '2', '8', '10', '20', '[[\'c_15\', \'A\']]', '[[\'c_13\', \'\'], [\'c_2\', \'\'], [\'c_5\', \'\'], [\'c_1\', \'\'], [\'c_25\', \'\']]');
INSERT INTO `competition_competitionqainfo` VALUES ('50', '0', '2019-01-09 07:23:16.422424', '2019-01-09 07:23:16.422424', 'tvAnb6frD7426Ga4P8RYUU', 'JvA9EjMjaSjD5tF3LCgL9U', '2ASBWWkp3gu4RwvQeEmKzQ', '[\'千里黄云白日曛，北风吹雁雪纷纷。莫愁前路无知已，##?《别董大》唐·高适\', \'##，映日荷花别样红。《晓出净慈寺送林子方》南宋·杨万里\', \'##，笑问客从何处来?《回乡偶书》唐·贺知章\', \'元宵又称为上元节，那么下元节是几月几号？\', \'##，欲饮琵琶马上催。醉卧沙场君莫笑， 古来征战几人回。《凉州词》唐·王翰\', \'龚自珍《己亥杂诗》“落红不是无情物,化作春泥更护花”句中,“红”是指\', \'两岸猿声啼不住，##。《早发白帝城》唐·李白\', \'爆竹声中一岁除，##。千门万户曈曈日，总把新桃换旧符 。《元日》北宋·王安石\', \'晏殊的《浣溪沙》中的“无可奈何花落去”的下句是\', \'墙角数枝梅，凌寒独自开。##，为有暗香来。《梅花》北宋·王安石\']', '[\'天下谁人不识君\', \'接天莲叶无穷碧\', \'儿童相见不相识\', \'十月十五\', \'葡萄美酒夜光杯\', \'花\\xa0\', \'轻舟已过万重山\', \'春风送暖入屠苏\', \'似曾相识燕归来\\u2002\', \'遥知不是雪\']', null, '1546989796421', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('51', '0', '2019-01-09 07:38:37.478976', '2019-01-09 07:38:37.478976', 'tvAnb6frD7426Ga4P8RYUU', 'USL2ZYUX4qSudTRbJNAruZ', '2ASBWWkp3gu4RwvQeEmKzQ', '[\'“海内存知己,天涯若比邻”是谁的诗句.\', \'补全诗句：到现在，乡愁是一湾##，我在这头，大陆在那头。\', \'不知细叶谁裁出，##。《咏柳》唐·贺知章\', \'北京是在哪个朝代建都的？\', \'远上寒山石径斜，##。停车坐爱枫林晚，霜叶红于二月花。《山行》唐·杜牧\', \'《七步诗》的作者是\', \'“解落三秋叶,能开二月花.过江千尺浪,入竹万竿斜.”这首诗写的是\', \'昼出耘田夜绩麻，##。童孙未解供耕织，也傍桑阴学种瓜。《四时田园杂兴》南宋·范成大\', \'天似穹庐，笼盖四野。天苍苍，##，风吹草低见牛羊。《敕勒歌》北朝民歌\', \'“横看成岭侧成峰,远近高低各不同.”诗中写的名胜是\']', '[\'王勃\', \'浅浅的海峡\', \'二月春风似剪刀\', \'元朝\', \'白云生处有人家\', \'曹植\\u2002\', \'风\', \'村庄儿女各当家\', \'野茫茫\', \'庐山\']', null, '1546990717478', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('52', '0', '2019-01-09 07:39:55.075532', '2019-01-09 07:39:55.075532', 'tvAnb6frD7426Ga4P8RYUU', 'H4nVT24EGrYRCC4nhbwgKA', '2ASBWWkp3gu4RwvQeEmKzQ', '[\'把“春风”比作“剪刀”的是哪首诗\', \'“横看成岭侧成峰,远近高低各不同.”诗中写的名胜是\', \'不知细叶谁裁出，##。《咏柳》唐·贺知章\', \'##，更上一层楼。《登鹳雀楼》唐·王之涣\', \'湖光秋月两相和,##。 遥望洞庭山水色,白银盘里一青螺。《望洞庭》唐·刘禹锡\', \'##，欲饮琵琶马上催。醉卧沙场君莫笑， 古来征战几人回。《凉州词》唐·王翰\', \'“野火烧不尽,春风吹又生”一句出自\', \'龙舟是为了纪念哪位文化名人的？\', \'##，一行白鸳上青天。窗含西岭千秋雪，门泊东吴万里船。《绝句》唐·杜甫\', \'##，笑问客从何处来?《回乡偶书》唐·贺知章\']', '[\'咏柳\', \'庐山\', \'二月春风似剪刀\', \'欲穷千里目\', \'潭面无风镜未磨\', \'葡萄美酒夜光杯\', \'白居易《赋得古原草送别》\', \'屈原\', \'两个黄鹂鸣翠柳\', \'儿童相见不相识\']', null, '1546990795075', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('53', '0', '2019-01-09 07:52:20.237321', '2019-01-09 07:52:20.237321', 'tvAnb6frD7426Ga4P8RYUU', 'uUbh2tmzDXF6uXtFWN6zCf', 'aqrdnYGL4a4XduUozLPg6Y', '[\'慈母手中线，##，谁言寸草心，报得三春晖。《游子吟》唐·孟郊\', \'##，万里长征人未还。但使龙城飞将在，不教胡马渡阴山!《出塞》唐·王昌龄\', \'日出江花红胜火，##，能不忆江南?《忆江南》唐·白居易\', \'##，笑问客从何处来?《回乡偶书》唐·贺知章\', \'商女不知亡国恨下一句是？\', \'##，一行白鸳上青天。窗含西岭千秋雪，门泊东吴万里船。《绝句》唐·杜甫\', \'晏殊的《浣溪沙》中的“无可奈何花落去”的下句是\', \'采##东篱下，悠然见南山。\', \'有情##含春泪，无力蔷薇卧晚枝。\', \'昼出耘田夜绩麻，##。童孙未解供耕织，也傍桑阴学种瓜。《四时田园杂兴》南宋·范成大\']', '[\'游子身上衣\', \'秦时明月汉时关\', \'春来江水绿如蓝\', \'儿童相见不相识\', \'隔江犹唱后庭花\', \'两个黄鹂鸣翠柳\', \'似曾相识燕归来\\u2002\', \'菊\', \'芍药\', \'村庄儿女各当家\']', null, '1546991540236', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('54', '1', '2019-01-11 05:43:26.363685', '2019-01-11 05:43:51.570240', 'Zpfv7E2wM4aoapDpymZzBD', 'TqSmY2eDuUZJcKzmYQsgBf', 'aqrdnYGL4a4XduUozLPg6Y', '[\'2011年3月底，中国国家博物馆新馆开馆，世界现存最大的青铜器、“中华第一鼎”正式移驻该馆。“中华第一鼎”指的是（\\u3000\\u3000）\', \'1973年，浙江省余姚市农民在建排涝站挖地基时，意外地发现一处原始时期人类生活遗址。遗址中有稻谷、稻秆堆积。这处遗址是(\\u3000\\u3000)\', \'春秋时期，一些诸侯国设置县、郡，委派官员管理，由此产生的影响是   （   ）\', \'舜当上部落首领的方式是(\\u3000\\u3000)\', \'下列哪一古代人类遗址，把我国的人类历史推进到大约170万年前(\\u3000\\u3000)\', \'公元前841年，（   ） 与民争利，引起“国人暴动”。       （   ）\', \'春秋后期，铁制农具和（   ）出现，促进了农业上的深耕细作。   （   ）\', \'“民以食为天”，从野食充饥到农耕种植是人类生活史上的飞跃。世界上最早种植粟的远古居民是(\\u3000\\u3000)\', \'春秋时期第一个霸主是                                  （   ）\', \'“秦……以为周制微弱，终为诸侯所丧，故不立尺土之封。”“周制”是指西周实行的\']', '[\' 司母戊鼎\', \'河姆渡人遗址\', \'分封制逐步遭到瓦解\', \'通过禅让制度，大家推荐继位\', \'元谋人遗址\', \'周厉王\', \'牛耕\', \'半坡人\', \'齐桓公\', \'分封制\']', '[\'c_43,B\', \'c_33,C\', \'c_60,B\', \'c_37,B\', \'c_26,B\', \'c_51,B\', \'c_52,C\', \'c_30,B\', \'c_54,B\', \'c_53,B\']', '1547156606362', '1547156631508', '25146', '1', '1', '4', '6', '10', '40', '[[\'c_60\', \'B\'], [\'c_52\', \'C\'], [\'c_30\', \'B\'], [\'c_53\', \'B\']]', '[]');
INSERT INTO `competition_competitionqainfo` VALUES ('55', '0', '2019-01-11 08:07:13.513873', '2019-01-11 08:07:13.513873', 'tvAnb6frD7426Ga4P8RYUU', 'LfF7WvabUMot8qkBaeNQYV', '2ASBWWkp3gu4RwvQeEmKzQ', '[\'日出江花红胜火，##，能不忆江南?《忆江南》唐·白居易\', \'##，将军夜引弓。平明寻白羽，没在石棱中。《塞下曲》唐·卢纶\', \'墙角数枝梅，凌寒独自开。##，为有暗香来。《梅花》北宋·王安石\', \'空山不见人，但闻人语响。##，复照青苔上。《鹿柴》唐·王维\', \'龙舟是为了纪念哪位文化名人的？\', \'劝君更尽一杯酒，##。《送元二使安西》唐·王维\', \'不知细叶谁裁出，##。《咏柳》唐·贺知章\', \'两岸猿声啼不住，##。《早发白帝城》唐·李白\', \'##，一行白鸳上青天。窗含西岭千秋雪，门泊东吴万里船。《绝句》唐·杜甫\', \'##，万里长征人未还。但使龙城飞将在，不教胡马渡阴山!《出塞》唐·王昌龄\']', '[\'春来江水绿如蓝\', \'林暗草惊风\', \'遥知不是雪\', \'返景入深林\', \'屈原\', \'西出阳关无故人\', \'二月春风似剪刀\', \'轻舟已过万重山\', \'两个黄鹂鸣翠柳\', \'秦时明月汉时关\']', null, '1547165233512', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('56', '1', '2019-01-11 08:35:37.962258', '2019-01-11 08:35:46.814973', '9Gn9VFQv3iuEPyguBwz4V3', '92MjTQX3FgAe4uw5CiRSFX', '2ASBWWkp3gu4RwvQeEmKzQ', '[\'数据库管理系统中负责数据模式定义的语言是（\\u3000\\u3000）。\', \'下列选项中不属于结构化程序设计原则的是（\\u3000\\u3000）。\', \'设计程序时，应采纳的原则之－是（\\u3000\\u3000）。\', \'下列关于正则表达式的说法，不正确的是（\\u3000\\u3000）。\', \'下列关于实型变量书写正确的是（\\u3000\\u3000）。\', \'下面属于面向对象语言的是（\\u3000\\u3000）。\', \'下列关于Java多线程并发控制机制的叙述中，错误的是（\\u3000\\u3000）。\', \'下列不属于虚拟机执行过程的特点的是（\\u3000\\u3000）。\', \'设数组data[0…m]作为循环队列s q的存储空间，front为队头指针，rear为队尾指针，则执行出队操作的语句为（\\u3000\\u3000）。\', \'下列叙述中，正确的是（\\u3000\\u3000）。\']', '[\'数据定义语言\', \'可封装\', \'程序的结构应有助于读者的理解\', \'在J2SE 1．4中的正则表达式包名为java．util．regex\', \'1．2e3\', \'Java语言\', \'线程之间的交互，提倡采用suspend（\\u3000\\u3000）/resume（\\u3000\\u3000）方法\', \'代码安全检查\', \'S q↑．front：＝(S q↑．front＋1)%maxsize；\', \'Java语言的标识符是区分大小写的\']', '[\'c_242,A\', \'c_238,B\', \'c_257,C\', \'c_261,\', \'c_255,\', \'c_259,\', \'c_267,\', \'c_265,\', \'c_263,\', \'c_245,\']', '1547166937961', '1547166946772', '8811', '1', '1', '1', '9', '10', '10', '[[\'c_242\', \'A\']]', '[[\'c_261\', \'\'], [\'c_255\', \'\'], [\'c_259\', \'\'], [\'c_267\', \'\'], [\'c_265\', \'\'], [\'c_263\', \'\'], [\'c_245\', \'\']]');
INSERT INTO `competition_competitionqainfo` VALUES ('57', '0', '2019-01-12 02:44:17.133162', '2019-01-12 02:44:17.134158', '9Gn9VFQv3iuEPyguBwz4V3', 'X7Bx8NhucobZCvpfZesGpn', 'aqrdnYGL4a4XduUozLPg6Y', '[\'下列不属于虚拟机执行过程的特点的是（\\u3000\\u3000）。\', \'结构化程序设计的3种基本结构是（\\u3000\\u3000）。\', \'设计程序时，应采纳的原则之－是（\\u3000\\u3000）。\', \'设数组data[0…m]作为循环队列s q的存储空间，front为队头指针，rear为队尾指针，则执行出队操作的语句为（\\u3000\\u3000）。\', \'下列叙述中，正确的是（\\u3000\\u3000）。\', \'在软件开发中，需求分析阶段产生的主要文档是（\\u3000\\u3000）。\', \'下列关于System类的叙述中，错误的是（\\u3000\\u3000）。\', \'下列Java组件中，不属于容器的是（\\u3000\\u3000）。\', \'为使Java程序独立于平台，Java虚拟机把字节码与各个操作系统及硬件（\\u3000\\u3000）。\', \'数据库管理系统中负责数据模式定义的语言是（\\u3000\\u3000）。\']', '[\'代码安全检查\', \'顺序、选择和循环\', \'程序的结构应有助于读者的理解\', \'S q↑．front：＝(S q↑．front＋1)%maxsize；\', \'Java语言的标识符是区分大小写的\', \'软件需求规格说明书\', \'System类中没有定义属性\', \'Label\', \'分开\', \'数据定义语言\']', null, '1547232257133', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('58', '0', '2019-01-12 06:46:08.466292', '2019-01-12 06:46:08.466292', '9Gn9VFQv3iuEPyguBwz4V3', 'eYyJsTkJHJJaX8Ev7J7pZ2', 'aqrdnYGL4a4XduUozLPg6Y', '[\'在－所大学中，每个系都有自己的局域网，则连接各个系的校园网（\\u3000\\u3000）。\', \'在读取二进制数据文件的记录时，为了提高效率常常使用的－种辅助类是（\\u3000\\u3000）。\', \'下列选项中不属于结构化程序设计原则的是（\\u3000\\u3000）。\', \'下列构造方法的调用方式中，正确的是（\\u3000\\u3000）。\', \'线性表L＝(a1，a2，a3，…ai，…an)，下列说法正确的是（\\u3000\\u3000）。\', \'下列叙述中正确的是（\\u3000\\u3000）。\', \'在软件开发中，需求分析阶段产生的主要文档是（\\u3000\\u3000）。\', \'设数组data[0…m]作为循环队列s q的存储空间，front为队头指针，rear为队尾指针，则执行出队操作的语句为（\\u3000\\u3000）。\', \'下列代表十六进制整数的是（\\u3000\\u3000）。\', \'软件生命周期可分为定义阶段，开发阶段和维护阶段。详细设计属于（\\u3000\\u3000）。\']', '[\'还是局域网\', \'StringBuffer\', \'可封装\', \'只能通过new自动调用\', \'除第一个元素和最后一个元素外，其余每个元素都有且只有一个直接前继和直接后继\', \'双向链表是非线性结构\', \'软件需求规格说明书\', \'S q↑．front：＝(S q↑．front＋1)%maxsize；\', \'OXA6\', \'开发阶段\']', null, '1547246768465', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('59', '0', '2019-01-26 06:53:48.811554', '2019-01-26 06:53:48.811554', '9Gn9VFQv3iuEPyguBwz4V3', '8sg4brko8sEEVsxiztwYxF', 'aqrdnYGL4a4XduUozLPg6Y', '[\'下面属于面向对象语言的是（\\u3000\\u3000）。\', \'下列关于System类的叙述中，错误的是（\\u3000\\u3000）。\', \'线性表L＝(a1，a2，a3，…ai，…an)，下列说法正确的是（\\u3000\\u3000）。\', \'数据流程图(DFD图)是（\\u3000\\u3000）。\', \'Java的核心包中，提供编程应用的基本类的包是（\\u3000\\u3000）。\', \'按层次次序将一棵有n个结点的完全二叉树的所有结点从1～n编号，当i≤n/2时，编号为i的结点的左子树的编号是（\\u3000\\u3000）。\', \'设计程序时，应采纳的原则之－是（\\u3000\\u3000）。\', \'在软件开发中，需求分析阶段产生的主要文档是（\\u3000\\u3000）。\', \'数据库管理系统中负责数据模式定义的语言是（\\u3000\\u3000）。\', \'下列不属于虚拟机执行过程的特点的是（\\u3000\\u3000）。\']', '[\'Java语言\', \'System类中没有定义属性\', \'除第一个元素和最后一个元素外，其余每个元素都有且只有一个直接前继和直接后继\', \'面向对象方法的需求分析工具\', \'java．lang\', \'2i\', \'程序的结构应有助于读者的理解\', \'软件需求规格说明书\', \'数据定义语言\', \'代码安全检查\']', null, '1548456828810', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('60', '0', '2019-01-26 06:53:56.815226', '2019-01-26 06:53:56.815226', 'Zpfv7E2wM4aoapDpymZzBD', 'CZX8Vz4jJdHoXNLLsxQY5P', 'aqrdnYGL4a4XduUozLPg6Y', '[\'春秋时期第一个霸主是                                  （   ）\', \'舜当上部落首领的方式是(\\u3000\\u3000)\', \'黄帝被称为“中华民族之父”，下列关于黄帝时期的发明正确的一组是(\\u3000\\u3000)\', \'下列有关我国境内远古人类及其生活情况的叙述，不正确的是(\\u3000\\u3000)\', \'2013年，汉字听写大会在CCTV1播出，至今已举办六期。它使传承华夏文明的信念得以凝聚，汉字书写美德的观念得以传递。下列有关中国文字的叙述，不正确的是（   ）\', \'南方地区气候潮湿闷热，在远古时代有哪一远古人群建造干栏式房屋，为自己提供一个比较舒适的居住环境(\\u3000\\u3000)\', \'帝王世代沿袭的王位世袭制在中国延续了近四千年，父子相传、兄终弟及……对中国社会影响深远。这种制度开始于                      （   ）\', \'根据片段联想：①发现于周口店的龙骨山②能够直立行走③已经使用火④过着群居生活，题中所述的这一远古人类是(\\u3000\\u3000)\', \'下列哪一古代人类遗址，把我国的人类历史推进到大约170万年前(\\u3000\\u3000)\', \'半坡遗址是我国重要的原始农耕村落遗址之一，其原始居民(\\u3000\\u3000)\']', '[\'齐桓公\', \'通过禅让制度，大家推荐继位\', \'伶伦——乐谱\', \'上古人类的外貌跟现代人没有差别\', \'黄帝发明的文字使用至今\', \'河姆渡人\', \'禹传子，家天下\', \'北京人\', \'元谋人遗址\', \'主要粮食作物是粟\']', null, '1548456836815', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('61', '0', '2019-01-26 07:06:20.155386', '2019-01-26 07:06:20.156361', 'Zpfv7E2wM4aoapDpymZzBD', 'Stt6wngzxM3F2c6i8uPjAY', 'aqrdnYGL4a4XduUozLPg6Y', '[\'帝王世代沿袭的王位世袭制在中国延续了近四千年，父子相传、兄终弟及……对中国社会影响深远。这种制度开始于                      （   ）\', \'舜当上部落首领的方式是                      (  \\u3000)\', \'世界华人炎帝故里寻根节每年固定在炎帝诞辰农历四月廿六举办，该节已成为海峡两岸同胞乃至全球华人华侨交流互动的重要平台。下列传说中的发明创造与炎帝无关的一项是(\\u3000\\u3000)\', \'2011年3月底，中国国家博物馆新馆开馆，世界现存最大的青铜器、“中华第一鼎”正式移驻该馆。“中华第一鼎”指的是（\\u3000\\u3000）\', \'中国几千年历史凝结有许多成语故事，其中不少闪烁着睿智的光芒，成为传统文化的瑰宝。“围魏救赵”的故事发生在下列哪 一历史时期              （   ）\', \'“禹传子”“家天下”说明我国古代的哪一制度开始遭到完全破坏(\\u3000\\u3000)\', \'“公天下”变为“家天下”的重要标志是               (   )\', \'2013年，汉字听写大会在CCTV1播出，至今已举办六期。它使传承华夏文明的信念得以凝聚，汉字书写美德的观念得以传递。下列有关中国文字的叙述，不正确的是（   ）\', \'下列哪一古代人类遗址，把我国的人类历史推进到大约170万年前    (\\u3000 \\u3000)\', \'黄帝被称为“中华民族之父”，下列关于黄帝时期的发明正确的一组是(\\u3000\\u3000)\']', '[\'禹传子，家天下\', \'通过禅让制度，大家推荐继位\', \'建造宫室，制作衣裳\', \' 司母戊鼎\', \'战国\', \'禅让制\', \'王位世袭制代替禅让制\', \'黄帝发明的文字使用至今\', \'元谋人遗址\', \'伶伦——乐谱\']', null, '1548457580155', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('62', '1', '2019-01-26 07:19:48.634708', '2019-01-26 07:20:40.579459', 'Zpfv7E2wM4aoapDpymZzBD', 'htD3DAvtF7J8mZUSZ8WqhZ', 'aqrdnYGL4a4XduUozLPg6Y', '[\'下列哪一古代人类遗址，把我国的人类历史推进到大约170万年前(\\u3000\\u3000)\', \'(2014•内蒙巴彦淖尔市前旗四中七上期末卷•3)下列史实，标志着我国世袭制代替禅让制的是(\\u3000\\u3000)\', \'2011年3月底，中国国家博物馆新馆开馆，世界现存最大的青铜器、“中华第一鼎”正式移驻该馆。“中华第一鼎”指的是（\\u3000\\u3000）\', \'(2018•北京海淀区七上期末卷•8)公元前770年，周平王迁都洛邑(今洛阳)，东周开始。在时间的表述方法上还可以写作(\\u3000\\u3000)\', \'黄帝被称为“中华民族之父”，下列关于黄帝时期的发明正确的一组是(\\u3000\\u3000)\', \'“中华开国五千年，神州轩辕自古传，创造指南车，平定蚩尤乱。”文中“轩辕”指的是                                  (   )\', \'舜当上部落首领的方式是                      (  \\u3000)\', \'世界华人炎帝故里寻根节每年固定在炎帝诞辰农历四月廿六举办，该节已成为海峡两岸同胞乃至全球华人华侨交流互动的重要平台。下列传说中的发明创造与炎帝无关的一项是(\\u3000\\u3000)\', \'据《史记》记载，禹年老时，推荐伯益作为继承人，但禹的儿子启却举兵杀死伯益，继承了父亲的位置。从材料中能得到的准确信息（\\u3000\\u3000）\', \'公元前841年，（   ） 与民争利，引起“国人暴动”。       （   ）\']', '[\'元谋人遗址\', \' 禹传子，家天下\', \' 司母戊鼎\', \'公元前8世纪早期\', \'伶伦——乐谱\', \'黄帝\', \'通过禅让制度，大家推荐继位\', \'建造宫室，制作衣裳\', \' 世袭制代替禅让制\', \'周厉王\']', '[\'c_26,B\', \'c_62,C\', \'c_43,B\', \'c_63,\', \'c_36,\', \'c_57,\', \'c_49,\', \'c_35,\', \'c_42,\', \'c_51,\']', '1548458388633', '1548458440530', '51897', '1', '1', '1', '9', '10', '10', '[[\'c_62\', \'C\']]', '[[\'c_63\', \'\'], [\'c_36\', \'\'], [\'c_57\', \'\'], [\'c_49\', \'\'], [\'c_35\', \'\'], [\'c_42\', \'\'], [\'c_51\', \'\']]');
INSERT INTO `competition_competitionqainfo` VALUES ('63', '0', '2019-01-26 07:21:28.786527', '2019-01-26 07:21:28.786527', 'tvAnb6frD7426Ga4P8RYUU', '77rnaSTeCmGWiqdMF3KKua', 'aqrdnYGL4a4XduUozLPg6Y', '[\'“春蚕到死丝方尽,蜡炬成灰泪始干”出自谁的《无题》\', \'迟日江山丽，春风花草香。##，沙暧睡鸳鸯。《绝句》唐·杜甫\', \'##，千朵万朵压枝低。《江畔独步寻花》唐·杜甫\', \'把“春风”比作“剪刀”的是哪首诗\', \'##，映日荷花别样红。《晓出净慈寺送林子方》南宋·杨万里\', \'不识##真面目，只缘身在此山中\', \'补全诗句：到现在，乡愁是一湾##，我在这头，大陆在那头。\', \'##，一行白鸳上青天。窗含西岭千秋雪，门泊东吴万里船。《绝句》唐·杜甫\', \'商女不知亡国恨下一句是？\', \'##，早有蜻蜓立上头。《小池》南宋·杨万里\']', '[\'李商隐\', \'泥融飞燕子\', \'黄四娘家花满蹊\', \'咏柳\', \'接天莲叶无穷碧\', \'庐山\', \'浅浅的海峡\', \'两个黄鹂鸣翠柳\', \'隔江犹唱后庭花\', \'小荷才露尖尖角\']', null, '1548458488786', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('64', '0', '2019-01-26 07:22:00.819728', '2019-01-26 07:22:00.819728', 'tvAnb6frD7426Ga4P8RYUU', 'DRpYgKs2AWyaeTuvYzvP4k', 'aqrdnYGL4a4XduUozLPg6Y', '[\'元宵又称为上元节，那么下元节是几月几号？\', \'李白的《渡荆门送别》一诗中，写出诗人渡过荆门进入楚地看到江水冲出山峦向着原野奔腾而去的壮阔景色的诗句是:##，江入大荒流\', \'“忽如一夜春风来,千树万树梨花开”写的是\', \'人闲##落，夜静春山空。\', \'天子呼来不上船，自称臣是酒中仙。说的是哪一位人物？\', \'千里黄云白日曛，北风吹雁雪纷纷。莫愁前路无知已，##?《别董大》唐·高适\', \'“但使龙城飞将在,不教胡马度”\', \'采##东篱下，悠然见南山。\', \'昼出耘田夜绩麻，##。童孙未解供耕织，也傍桑阴学种瓜。《四时田园杂兴》南宋·范成大\', \'“海内存知己,天涯若比邻”是谁的诗句.\']', '[\'十月十五\', \'山随平野尽\', \'雪景\', \'桂花\', \'李白\', \'天下谁人不识君\', \'阴山\', \'菊\', \'村庄儿女各当家\', \'王勃\']', null, '1548458520819', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('65', '0', '2019-01-26 07:22:27.200091', '2019-01-26 07:22:27.200091', '9Gn9VFQv3iuEPyguBwz4V3', 'hcUiswmvFGQ5FjHKoRybxX', 'aqrdnYGL4a4XduUozLPg6Y', '[\'下列叙述中，正确的是（\\u3000\\u3000）。\', \'下列选项中不属于结构化程序设计原则的是（\\u3000\\u3000）。\', \'Java中定义常量的保留字是（\\u3000\\u3000）。\', \'按层次次序将一棵有n个结点的完全二叉树的所有结点从1～n编号，当i≤n/2时，编号为i的结点的左子树的编号是（\\u3000\\u3000）。\', \'在－所大学中，每个系都有自己的局域网，则连接各个系的校园网（\\u3000\\u3000）。\', \'下列叙述中正确的是（\\u3000\\u3000）。\', \'下列关于Java多线程并发控制机制的叙述中，错误的是（\\u3000\\u3000）。\', \'下列Java组件中，不属于容器的是（\\u3000\\u3000）。\', \'下面属于面向对象语言的是（\\u3000\\u3000）。\', \'软件生命周期可分为定义阶段，开发阶段和维护阶段。详细设计属于（\\u3000\\u3000）。\']', '[\'Java语言的标识符是区分大小写的\', \'可封装\', \'final\', \'2i\', \'还是局域网\', \'双向链表是非线性结构\', \'线程之间的交互，提倡采用suspend（\\u3000\\u3000）/resume（\\u3000\\u3000）方法\', \'Label\', \'Java语言\', \'开发阶段\']', null, '1548458547199', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('66', '0', '2019-01-26 07:22:33.365966', '2019-01-26 07:22:33.365966', '9Gn9VFQv3iuEPyguBwz4V3', 'X4dogyfkchj9iiFpeJDSFN', 'aqrdnYGL4a4XduUozLPg6Y', '[\'为使Java程序独立于平台，Java虚拟机把字节码与各个操作系统及硬件（\\u3000\\u3000）。\', \'下列关于正则表达式的说法，不正确的是（\\u3000\\u3000）。\', \'下面属于面向对象语言的是（\\u3000\\u3000）。\', \'下列代表十六进制整数的是（\\u3000\\u3000）。\', \'下列不属于虚拟机执行过程的特点的是（\\u3000\\u3000）。\', \'下列关于实型变量书写正确的是（\\u3000\\u3000）。\', \'数据库管理系统中负责数据模式定义的语言是（\\u3000\\u3000）。\', \'下列关于System类的叙述中，错误的是（\\u3000\\u3000）。\', \'下列关于Java多线程并发控制机制的叙述中，错误的是（\\u3000\\u3000）。\', \'在－所大学中，每个系都有自己的局域网，则连接各个系的校园网（\\u3000\\u3000）。\']', '[\'分开\', \'在J2SE 1．4中的正则表达式包名为java．util．regex\', \'Java语言\', \'OXA6\', \'代码安全检查\', \'1．2e3\', \'数据定义语言\', \'System类中没有定义属性\', \'线程之间的交互，提倡采用suspend（\\u3000\\u3000）/resume（\\u3000\\u3000）方法\', \'还是局域网\']', null, '1548458553365', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('67', '0', '2019-01-26 07:24:02.783026', '2019-01-26 07:24:02.783026', '9Gn9VFQv3iuEPyguBwz4V3', 'w6SZShrsuHSTACptPwrWcN', 'aqrdnYGL4a4XduUozLPg6Y', '[\'在软件开发中，需求分析阶段产生的主要文档是（\\u3000\\u3000）。\', \'下列关于面向对象的论述中，正确的是（\\u3000\\u3000）。\', \'下列关于System类的叙述中，错误的是（\\u3000\\u3000）。\', \'数据流程图(DFD图)是（\\u3000\\u3000）。\', \'下列Java组件中，不属于容器的是（\\u3000\\u3000）。\', \'下列不属于虚拟机执行过程的特点的是（\\u3000\\u3000）。\', \'下面属于面向对象语言的是（\\u3000\\u3000）。\', \'下列命令中，是Java编译命令的是（\\u3000\\u3000）。\', \'线性表L＝(a1，a2，a3，…ai，…an)，下列说法正确的是（\\u3000\\u3000）。\', \'Java的核心包中，提供编程应用的基本类的包是（\\u3000\\u3000）。\']', '[\'软件需求规格说明书\', \'面由对象是指以对象为中心，分析、设计和实现应用程序的机制\', \'System类中没有定义属性\', \'面向对象方法的需求分析工具\', \'Label\', \'代码安全检查\', \'Java语言\', \'javac\', \'除第一个元素和最后一个元素外，其余每个元素都有且只有一个直接前继和直接后继\', \'java．lang\']', null, '1548458642783', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('68', '0', '2019-01-26 07:24:12.714230', '2019-01-26 07:24:12.714230', 'tvAnb6frD7426Ga4P8RYUU', 'xN5crHpxdwjRjHP8hS8Ywa', 'aqrdnYGL4a4XduUozLPg6Y', '[\'墙角数枝梅，凌寒独自开。##，为有暗香来。《梅花》北宋·王安石\', \'日出江花红胜火，##，能不忆江南?《忆江南》唐·白居易\', \'晏殊的《浣溪沙》中的“无可奈何花落去”的下句是\', \'“停车坐爱枫林晚,霜叶红于二月花”中“坐”的意思是\', \'天子呼来不上船，自称臣是酒中仙。说的是哪一位人物？\', \'千里黄云白日曛，北风吹雁雪纷纷。莫愁前路无知已，##?《别董大》唐·高适\', \'劝君更尽一杯酒，##。《送元二使安西》唐·王维\', \'独坐幽篁里，##。深林人不知，明月来相照。《竹里馆》唐·王维\', \'飞流直下三千尺，##。《望庐山瀑布》唐·李白\', \'千山鸟飞绝，##。孤舟蓑笠翁，独钓寒江雪。《江雪》唐·柳宗元\']', '[\'遥知不是雪\', \'春来江水绿如蓝\', \'似曾相识燕归来\\u2002\', \'因为\', \'李白\', \'天下谁人不识君\', \'西出阳关无故人\', \'弹琴复长啸\', \'疑是银河落九天\', \'万径人踪灭\']', null, '1548458652713', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('69', '0', '2019-01-26 07:24:35.747668', '2019-01-26 07:24:35.747668', 'tvAnb6frD7426Ga4P8RYUU', '9V5fyGHcYkY2J3nPbkUc8H', 'aqrdnYGL4a4XduUozLPg6Y', '[\'##，映日荷花别样红。《晓出净慈寺送林子方》南宋·杨万里\', \'千山鸟飞绝，##。孤舟蓑笠翁，独钓寒江雪。《江雪》唐·柳宗元\', \'“但使龙城飞将在,不教胡马度”\', \'空山不见人，但闻人语响。##，复照青苔上。《鹿柴》唐·王维\', \'劝君更尽一杯酒，##。《送元二使安西》唐·王维\', \'飞流直下三千尺，##。《望庐山瀑布》唐·李白\', \'商女不知亡国恨下一句是？\', \'“忽如一夜春风来,千树万树梨花开”写的是\', \'李白的《渡荆门送别》一诗中，写出诗人渡过荆门进入楚地看到江水冲出山峦向着原野奔腾而去的壮阔景色的诗句是:##，江入大荒流\', \'##，万里长征人未还。但使龙城飞将在，不教胡马渡阴山!《出塞》唐·王昌龄\']', '[\'接天莲叶无穷碧\', \'万径人踪灭\', \'阴山\', \'返景入深林\', \'西出阳关无故人\', \'疑是银河落九天\', \'隔江犹唱后庭花\', \'雪景\', \'山随平野尽\', \'秦时明月汉时关\']', null, '1548458675746', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('70', '0', '2019-01-26 07:27:03.902638', '2019-01-26 07:27:03.902638', 'Zpfv7E2wM4aoapDpymZzBD', 'mkYNBsctVFM4B8nENyBFVR', 'aqrdnYGL4a4XduUozLPg6Y', '[\'据《史记》记载，禹年老时，推荐伯益作为继承人，但禹的儿子启却举兵杀死伯益，继承了父亲的位置。从材料中能得到的准确信息（\\u3000\\u3000）\', \'根据片段联想：①发现于周口店的龙骨山②能够直立行走③已经使用火④过着群居生活，题中所述的这一远古人类是(\\u3000\\u3000)\', \'南方地区气候潮湿闷热，在远古时代有哪一远古人群建造干栏式房屋，为自己提供一个比较舒适的居住环境                          (\\u3000\\u3000 )\', \'舜当上部落首领的方式是(\\u3000\\u3000)\', \'世界华人炎帝故里寻根节每年固定在炎帝诞辰农历四月廿六举办，该节已成为海峡两岸同胞乃至全球华人华侨交流互动的重要平台。下列传说中的发明创造与炎帝无关的一项是(\\u3000\\u3000)\', \'帝王世代沿袭的王位世袭制在中国延续了近四千年，父子相传、兄终弟及……对中国社会影响深远。这种制度开始于                      （   ）\', \'(2014•内蒙巴彦淖尔市前旗四中七上期末卷•3)下列史实，标志着我国世袭制代替禅让制的是(\\u3000\\u3000)\', \'国家是阶级统治的工具。中国历史上出现最早的国家距今已有(\\u3000\\u3000)\', \'1973年，浙江省余姚市农民在建排涝站挖地基时，意外地发现一处原始时期人类生活遗址。遗址中有稻谷、稻秆堆积。这处遗址是(\\u3000\\u3000)\', \'“禹传子”“家天下”说明我国古代的哪一制度开始遭到完全破坏(\\u3000\\u3000)\']', '[\' 世袭制代替禅让制\', \'北京人\', \'河姆渡人\', \'通过禅让制度，大家推荐继位\', \'建造宫室，制作衣裳\', \'禹传子，家天下\', \' 禹传子，家天下\', \'4000年左右\', \'河姆渡人遗址\', \'禅让制\']', null, '1548458823901', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('71', '0', '2019-01-26 07:31:37.392014', '2019-01-26 07:31:37.392014', 'Zpfv7E2wM4aoapDpymZzBD', 'ATc54UaAhZ8k5rh4ezfrwL', 'aqrdnYGL4a4XduUozLPg6Y', '[\'(2018•北京海淀区七上期末卷•8)公元前770年，周平王迁都洛邑(今洛阳)，东周开始。在时间的表述方法上还可以写作(\\u3000\\u3000)\', \'公元前841年，（   ） 与民争利，引起“国人暴动”。       （   ）\', \'“禹传子”“家天下”说明我国古代的哪一制度开始遭到完全破坏(\\u3000\\u3000)\', \'商朝多次迁都，到商王（   ）时迁到殷\', \'根据片段联想：①发现于周口店的龙骨山②能够直立行走③已经使用火④过着群居生活，题中所述的这一远古人类是                      (\\u3000\\u3000 )\', \'世界华人炎帝故里寻根节每年固定在炎帝诞辰农历四月廿六举办，该节已成为海峡两岸同胞乃至全球华人华侨交流互动的重要平台。下列传说中的发明创造与炎帝无关的一项是(\\u3000\\u3000)\', \'帝王世代沿袭的王位世袭制在中国延续了近四千年，父子相传、兄终弟及……对中国社会影响深远。这种制度开始于                      （   ）\', \'春秋时期，一些诸侯国设置县、郡，委派官员管理，由此产生的影响是   （   ）\', \'据《史记》记载，禹年老时，推荐伯益作为继承人，但禹的儿子启却举兵杀死伯益，继承了父亲的位置。从材料中能得到的准确信息（\\u3000\\u3000）\', \'一代伟人孙中山的诗句“中华开国五千年，神州轩辕自古传。”反映了我们经常讲的“上下五千年”的历史是从下面哪一人物开始(\\u3000\\u3000)\']', '[\'公元前8世纪早期\', \'周厉王\', \'禅让制\', \'盘庚\', \'北京人\', \'建造宫室，制作衣裳\', \'禹传子，家天下\', \'分封制逐步遭到瓦解\', \' 世袭制代替禅让制\', \'黄帝\']', null, '1548459097392', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('72', '0', '2019-01-26 07:31:47.308797', '2019-01-26 07:31:47.308797', 'Zpfv7E2wM4aoapDpymZzBD', 'kWgsJBrrJeJ3xGFLxcLGEc', 'aqrdnYGL4a4XduUozLPg6Y', '[\'一代伟人孙中山的诗句“中华开国五千年，神州轩辕自古传。”反映了我们经常讲的“上下五千年”的历史是从下面哪一人物开始(\\u3000\\u3000)\', \'根据片段联想：①发现于周口店的龙骨山②能够直立行走③已经使用火④过着群居生活，题中所述的这一远古人类是                      (\\u3000\\u3000 )\', \'如果拍摄一部原始社会部落联盟时期的电视连续剧，能够出现的情节是(\\u3000\\u3000)\', \'下列哪一古代人类遗址，把我国的人类历史推进到大约170万年前    (\\u3000 \\u3000)\', \'下列哪一古代人类遗址，把我国的人类历史推进到大约170万年前(\\u3000\\u3000)\', \'南方地区气候潮湿闷热，在远古时代有哪一远古人群建造干栏式房屋，为自己提供一个比较舒适的居住环境(\\u3000\\u3000)\', \'黄帝被称为“中华民族之父”，下列关于黄帝时期的发明正确的一组是(\\u3000\\u3000)\', \'商朝多次迁都，到商王（   ）时迁到殷\', \'春秋时期，社会经济发展的表现不包括                 （   ）\', \'“封建亲戚，以藩屏周。”说明西周时期实行分封制的主要目的是(\\u3000\\u3000)\']', '[\'黄帝\', \'北京人\', \'大禹治水“三过家门而不入”\', \'元谋人遗址\', \'元谋人遗址\', \'河姆渡人\', \'伶伦——乐谱\', \'盘庚\', \'出现纸质货币\', \'巩固周王的统治\']', null, '1548459107307', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('73', '0', '2019-01-26 08:04:14.615152', '2019-01-26 08:04:14.615152', 'Zpfv7E2wM4aoapDpymZzBD', 'EnHhYv6NDdeRNRcYwpCVsA', 'aqrdnYGL4a4XduUozLPg6Y', '[\'商朝多次迁都，到商王（   ）时迁到殷\', \'中国几千年历史凝结有许多成语故事，其中不少闪烁着睿智的光芒，成为传统文化的瑰宝。“围魏救赵”的故事发生在下列哪 一历史时期              （   ）\', \'“秦……以为周制微弱，终为诸侯所丧，故不立尺土之封。”“周制”是指西周实行的\', \'根据片段联想：①发现于周口店的龙骨山②能够直立行走③已经使用火④过着群居生活，题中所述的这一远古人类是                      (\\u3000\\u3000 )\', \'帝王世代沿袭的王位世袭制在中国延续了近四千年，父子相传、兄终弟及……对中国社会影响深远。这种制度开始于                      （   ）\', \'公元前841年，（   ） 与民争利，引起“国人暴动”。       （   ）\', \'国家是阶级统治的工具。中国历史上出现最早的国家距今已有(\\u3000\\u3000)\', \'南方地区气候潮湿闷热，在远古时代有哪一远古人群建造干栏式房屋，为自己提供一个比较舒适的居住环境(\\u3000\\u3000)\', \'“民以食为天”，从野食充饥到农耕种植是人类生活史上的飞跃。世界上最早种植粟的远古居民是(\\u3000\\u3000)\', \'一代伟人孙中山的诗句“中华开国五千年，神州轩辕自古传。”反映了我们经常讲的“上下五千年”的历史是从下面哪一人物开始(\\u3000\\u3000)\']', '[\'盘庚\', \'战国\', \'分封制\', \'北京人\', \'禹传子，家天下\', \'周厉王\', \'4000年左右\', \'河姆渡人\', \'半坡人\', \'黄帝\']', null, '1548461054614', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('74', '0', '2019-01-26 08:04:33.815473', '2019-01-26 08:04:33.815473', 'Zpfv7E2wM4aoapDpymZzBD', 'VUfuo3kJnyPg3VTZC5kzvK', 'aqrdnYGL4a4XduUozLPg6Y', '[\'一代伟人孙中山的诗句“中华开国五千年，神州轩辕自古传。”反映了我们经常讲的“上下五千年”的历史是从下面哪一人物开始(\\u3000\\u3000)\', \'“中华开国五千年，神州轩辕自古传，创造指南车，平定蚩尤乱。”文中“轩辕”指的是                                  (   )\', \'“禹传子”“家天下”说明我国古代的哪一制度开始遭到完全破坏(\\u3000\\u3000)\', \'春秋时期第一个霸主是                                  （   ）\', \'(2014•内蒙巴彦淖尔市前旗四中七上期末卷•3)下列史实，标志着我国世袭制代替禅让制的是(\\u3000\\u3000)\', \'南方地区气候潮湿闷热，在远古时代有哪一远古人群建造干栏式房屋，为自己提供一个比较舒适的居住环境(\\u3000\\u3000)\', \'“民以食为天”，从野食充饥到农耕种植是人类生活史上的飞跃。世界上最早种植粟的远古居民是                              (\\u3000 \\u3000)\', \'公元前841年，（   ） 与民争利，引起“国人暴动”。       （   ）\', \'帝王世代沿袭的王位世袭制在中国延续了近四千年，父子相传、兄终弟及……对中国社会影响深远。这种制度开始于                      （   ）\', \'舜当上部落首领的方式是                      (  \\u3000)\']', '[\'黄帝\', \'黄帝\', \'禅让制\', \'齐桓公\', \' 禹传子，家天下\', \'河姆渡人\', \'半坡人\', \'周厉王\', \'禹传子，家天下\', \'通过禅让制度，大家推荐继位\']', null, '1548461073815', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('75', '0', '2019-01-26 08:09:12.193664', '2019-01-26 08:09:12.193664', 'Zpfv7E2wM4aoapDpymZzBD', 'oqDmRtZPZzfADpkrwqzKE5', 'aqrdnYGL4a4XduUozLPg6Y', '[\'如果拍摄一部原始社会部落联盟时期的电视连续剧，能够出现的情节是(\\u3000\\u3000)\', \'下列有关我国境内远古人类及其生活情况的叙述，不正确的是(\\u3000\\u3000)\', \'2013年，汉字听写大会在CCTV1播出，至今已举办六期。它使传承华夏文明的信念得以凝聚，汉字书写美德的观念得以传递。下列有关中国文字的叙述，不正确的是（   ）\', \'一代伟人孙中山的诗句“中华开国五千年，神州轩辕自古传。”反映了我们经常讲的“上下五千年”的历史是从下面哪一人物开始                (\\u3000 \\u3000)\', \'半坡遗址是我国重要的原始农耕村落遗址之一，其原始居民(\\u3000\\u3000)\', \'舜当上部落首领的方式是(\\u3000\\u3000)\', \'帝王世代沿袭的王位世袭制在中国延续了近四千年，父子相传、兄终弟及……对中国社会影响深远。这种制度开始于                      （   ）\', \'黄帝被称为“中华民族之父”，下列关于黄帝时期的发明正确的一组是(\\u3000\\u3000)\', \'清明上河图的作者是哪一个朝代的人？\', \'“封建亲戚，以藩屏周。”说明西周时期实行分封制的主要目的是(\\u3000\\u3000)\']', '[\'大禹治水“三过家门而不入”\', \'上古人类的外貌跟现代人没有差别\', \'黄帝发明的文字使用至今\', \'黄帝\', \'主要粮食作物是粟\', \'通过禅让制度，大家推荐继位\', \'禹传子，家天下\', \'伶伦——乐谱\', \'北宋\', \'巩固周王的统治\']', null, '1548461352193', '0', '0', '1', '0', '0', '0', '10', '0', null, null);
INSERT INTO `competition_competitionqainfo` VALUES ('76', '0', '2019-01-28 00:41:04.678476', '2019-01-28 00:41:04.678476', '9Gn9VFQv3iuEPyguBwz4V3', 'wEdvkvjZFS9mUKmRBzSXhJ', 'aqrdnYGL4a4XduUozLPg6Y', '[\'在－所大学中，每个系都有自己的局域网，则连接各个系的校园网（\\u3000\\u3000）。\', \'下列不属于虚拟机执行过程的特点的是（\\u3000\\u3000）。\', \'下列关于实型变量书写正确的是（\\u3000\\u3000）。\', \'下列关于面向对象的论述中，正确的是（\\u3000\\u3000）。\', \'数据库管理系统中负责数据模式定义的语言是（\\u3000\\u3000）。\', \'为使Java程序独立于平台，Java虚拟机把字节码与各个操作系统及硬件（\\u3000\\u3000）。\', \'当使用SomeThread t＝new SomeThread（\\u3000\\u3000）创建一个线程时，下列叙述中正确的是（\\u3000\\u3000）。\', \'Java程序默认引用的包是（\\u3000\\u3000）。\', \'下列关于正则表达式的说法，不正确的是（\\u3000\\u3000）。\', \'结构化程序设计的3种基本结构是（\\u3000\\u3000）。\']', '[\'还是局域网\', \'代码安全检查\', \'1．2e3\', \'面由对象是指以对象为中心，分析、设计和实现应用程序的机制\', \'数据定义语言\', \'分开\', \'SomeThread类是Thread类的子类\', \'java．lang包\', \'在J2SE 1．4中的正则表达式包名为java．util．regex\', \'顺序、选择和循环\']', null, '1548607264678', '0', '0', '1', '0', '0', '0', '10', '0', null, null);

-- ----------------------------
-- Table structure for competition_fillinblankinfo
-- ----------------------------
DROP TABLE IF EXISTS `competition_fillinblankinfo`;
CREATE TABLE `competition_fillinblankinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `audio_url` varchar(255) DEFAULT NULL,
  `audio_time` int(11) NOT NULL,
  `bank_id` varchar(32) DEFAULT NULL,
  `ctype` int(11) NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `competition_fillinblankinfo_status_903a1b01` (`status`),
  KEY `competition_fillinblankinfo_bank_id_c7404b1d` (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition_fillinblankinfo
-- ----------------------------
INSERT INTO `competition_fillinblankinfo` VALUES ('1', '1', '2018-12-28 08:30:20.139758', '2018-12-28 08:30:20.139758', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '补全诗句：到现在，乡愁是一湾##，我在这头，大陆在那头。', '浅浅的海峡', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('2', '1', '2018-12-28 08:30:20.141756', '2018-12-28 08:30:20.141756', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '君住长江南，我住长江北，##，共饮长江水', '日日思君不见君', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('3', '1', '2018-12-28 08:30:20.144754', '2018-12-28 08:30:20.144754', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '李白的《渡荆门送别》一诗中，写出诗人渡过荆门进入楚地看到江水冲出山峦向着原野奔腾而去的壮阔景色的诗句是:##，江入大荒流', '山随平野尽', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('4', '1', '2018-12-28 08:30:20.144754', '2018-12-28 08:30:20.144754', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '不识##真面目，只缘身在此山中', '庐山', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('5', '1', '2018-12-28 08:30:20.145753', '2018-12-28 08:30:20.145753', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '有情##含春泪，无力蔷薇卧晚枝。', '芍药', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('6', '1', '2018-12-28 08:30:20.145753', '2018-12-28 08:30:20.145753', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '人闲##落，夜静春山空。', '桂花', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('7', '1', '2018-12-28 08:30:20.146753', '2018-12-28 08:30:20.146753', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '采##东篱下，悠然见南山。', '菊', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('8', '1', '2018-12-28 08:30:20.158748', '2018-12-28 08:30:20.158748', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '天似穹庐，笼盖四野。天苍苍，##，风吹草低见牛羊。《敕勒歌》北朝民歌', '野茫茫', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('9', '1', '2018-12-28 08:30:20.159746', '2018-12-28 08:30:20.159746', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '##，笑问客从何处来?《回乡偶书》唐·贺知章', '儿童相见不相识', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('10', '1', '2018-12-28 08:30:20.160746', '2018-12-28 08:30:20.160746', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '日出江花红胜火，##，能不忆江南?《忆江南》唐·白居易', '春来江水绿如蓝', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('11', '1', '2018-12-28 08:30:20.160746', '2018-12-28 08:30:20.160746', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '慈母手中线，##，谁言寸草心，报得三春晖。《游子吟》唐·孟郊', '游子身上衣', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('12', '1', '2018-12-28 08:30:20.161745', '2018-12-28 08:30:20.161745', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '爆竹声中一岁除，##。千门万户曈曈日，总把新桃换旧符 。《元日》北宋·王安石', '春风送暖入屠苏', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('13', '1', '2018-12-28 08:30:20.162744', '2018-12-28 08:30:20.162744', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '##，更上一层楼。《登鹳雀楼》唐·王之涣', '欲穷千里目', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('14', '1', '2018-12-28 08:30:20.162744', '2018-12-28 08:30:20.162744', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '飞流直下三千尺，##。《望庐山瀑布》唐·李白', '疑是银河落九天', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('15', '1', '2018-12-28 08:30:20.163743', '2018-12-28 08:30:20.163743', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '两岸猿声啼不住，##。《早发白帝城》唐·李白', '轻舟已过万重山', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('16', '1', '2018-12-28 08:30:20.163743', '2018-12-28 08:30:20.163743', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '##，千朵万朵压枝低。《江畔独步寻花》唐·杜甫', '黄四娘家花满蹊', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('17', '1', '2018-12-28 08:30:20.164744', '2018-12-28 08:30:20.164744', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '黑云翻墨未遮山， 白雨跳珠乱入船。##，望湖楼下水如天。《六月二十七日望湖楼醉书》北宋·苏轼', ' 卷地风来忽吹散', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('18', '1', '2018-12-28 08:30:20.164744', '2018-12-28 08:30:20.164744', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '##，早有蜻蜓立上头。《小池》南宋·杨万里', '小荷才露尖尖角', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('19', '1', '2018-12-28 08:30:20.165743', '2018-12-28 08:30:20.165743', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '昼出耘田夜绩麻，##。童孙未解供耕织，也傍桑阴学种瓜。《四时田园杂兴》南宋·范成大', '村庄儿女各当家', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('20', '1', '2018-12-28 08:30:20.165743', '2018-12-28 08:30:20.166742', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '不知细叶谁裁出，##。《咏柳》唐·贺知章', '二月春风似剪刀', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('21', '1', '2018-12-28 08:30:20.166742', '2018-12-28 08:30:20.166742', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '##，映日荷花别样红。《晓出净慈寺送林子方》南宋·杨万里', '接天莲叶无穷碧', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('22', '1', '2018-12-28 08:30:20.167742', '2018-12-28 08:30:20.167742', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '迟日江山丽，春风花草香。##，沙暧睡鸳鸯。《绝句》唐·杜甫', '泥融飞燕子', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('23', '1', '2018-12-28 08:30:20.167742', '2018-12-28 08:30:20.167742', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '劝君更尽一杯酒，##。《送元二使安西》唐·王维', '西出阳关无故人', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('24', '1', '2018-12-28 08:30:20.168741', '2018-12-28 08:30:20.168741', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '离离原上草，##。野火烧不尽，春风吹又生。《赋得古原草送别》唐·白居易', '一岁一枯荣', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('25', '1', '2018-12-28 08:30:20.168741', '2018-12-28 08:30:20.168741', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '空山不见人，但闻人语响。##，复照青苔上。《鹿柴》唐·王维', '返景入深林', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('26', '1', '2018-12-28 08:30:20.169740', '2018-12-28 08:30:20.169740', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '##，欲饮琵琶马上催。醉卧沙场君莫笑， 古来征战几人回。《凉州词》唐·王翰', '葡萄美酒夜光杯', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('27', '1', '2018-12-28 08:30:20.169740', '2018-12-28 08:30:20.169740', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '千里黄云白日曛，北风吹雁雪纷纷。莫愁前路无知已，##?《别董大》唐·高适', '天下谁人不识君', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('28', '1', '2018-12-28 08:30:20.170740', '2018-12-28 08:30:20.170740', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '##，万里长征人未还。但使龙城飞将在，不教胡马渡阴山!《出塞》唐·王昌龄', '秦时明月汉时关', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('29', '1', '2018-12-28 08:30:20.171739', '2018-12-28 08:30:20.171739', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '远上寒山石径斜，##。停车坐爱枫林晚，霜叶红于二月花。《山行》唐·杜牧', '白云生处有人家', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('30', '1', '2018-12-28 08:30:20.171739', '2018-12-28 08:30:20.171739', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '##，一行白鸳上青天。窗含西岭千秋雪，门泊东吴万里船。《绝句》唐·杜甫', '两个黄鹂鸣翠柳', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('31', '1', '2018-12-28 08:30:20.172738', '2018-12-28 08:30:20.172738', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '独坐幽篁里，##。深林人不知，明月来相照。《竹里馆》唐·王维', '弹琴复长啸', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('32', '1', '2018-12-28 08:30:20.172738', '2018-12-28 08:30:20.172738', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '墙角数枝梅，凌寒独自开。##，为有暗香来。《梅花》北宋·王安石', '遥知不是雪', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('33', '1', '2018-12-28 08:30:20.173737', '2018-12-28 08:30:20.173737', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '湖光秋月两相和,##。 遥望洞庭山水色,白银盘里一青螺。《望洞庭》唐·刘禹锡', '潭面无风镜未磨', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('34', '1', '2018-12-28 08:30:20.173737', '2018-12-28 08:30:20.173737', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '向晚意不适，驱车登古原。##，只是近黄昏。《乐游原》唐·李商隐', '夕阳无限好', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('35', '1', '2018-12-28 08:30:20.174738', '2018-12-28 08:30:20.174738', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '##，将军夜引弓。平明寻白羽，没在石棱中。《塞下曲》唐·卢纶', '林暗草惊风', '');
INSERT INTO `competition_fillinblankinfo` VALUES ('36', '1', '2018-12-28 08:30:20.174738', '2018-12-28 08:30:20.174738', '', null, '0', 'M6VrSVv2XNR9WZnu7nhcJ6', '1', '千山鸟飞绝，##。孤舟蓑笠翁，独钓寒江雪。《江雪》唐·柳宗元', '万径人踪灭', '');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2018-12-28 08:46:40.273583', '1', 'BusinessAppInfo object (1)', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2018-12-28 08:49:26.030227', '1', 'AppConfigInfo object (1)', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2018-12-28 08:52:12.556570', '1', 'CompetitionKindInfo object (1)', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2019-01-02 02:29:36.925578', '2', 'CompetitionKindInfo object (2)', '2', '[{\"changed\": {\"fields\": [\"cop_finishat\"]}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2019-01-03 08:09:29.449336', '1', 'CompetitionKindInfo object (1)', '2', '[{\"changed\": {\"fields\": [\"cop_finishat\"]}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2019-01-11 08:41:43.909184', '1', 'BusinessAppInfo object', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2019-01-11 08:42:21.552617', '1', 'AppConfigInfo object', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2019-01-11 08:44:01.888521', '1', 'CompetitionKindInfo object (1)', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2019-01-26 07:04:52.009681', '3', 'AppConfigInfo object (3)', '2', '[]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2019-01-26 07:06:14.074426', '3', 'CompetitionKindInfo object (3)', '2', '[{\"changed\": {\"fields\": [\"period_time\", \"cop_finishat\"]}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2019-01-26 08:04:30.437742', '3', 'CompetitionKindInfo object (3)', '2', '[{\"changed\": {\"fields\": [\"period_time\"]}}]', '16', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('7', 'account', 'profile');
INSERT INTO `django_content_type` VALUES ('8', 'account', 'userinfo');
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('9', 'business', 'appconfiginfo');
INSERT INTO `django_content_type` VALUES ('10', 'business', 'businessaccountinfo');
INSERT INTO `django_content_type` VALUES ('11', 'business', 'businessappinfo');
INSERT INTO `django_content_type` VALUES ('12', 'business', 'userinfoimage');
INSERT INTO `django_content_type` VALUES ('13', 'business', 'userinforegex');
INSERT INTO `django_content_type` VALUES ('14', 'competition', 'bankinfo');
INSERT INTO `django_content_type` VALUES ('15', 'competition', 'choiceinfo');
INSERT INTO `django_content_type` VALUES ('16', 'competition', 'competitionkindinfo');
INSERT INTO `django_content_type` VALUES ('17', 'competition', 'competitionqainfo');
INSERT INTO `django_content_type` VALUES ('18', 'competition', 'fillinblankinfo');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'account', '0001_initial', '2018-12-27 09:05:05.543225');
INSERT INTO `django_migrations` VALUES ('2', 'account', '0002_userinfo_resume', '2018-12-27 09:05:05.963970');
INSERT INTO `django_migrations` VALUES ('3', 'account', '0003_auto_20180404_1528', '2018-12-27 09:05:06.014941');
INSERT INTO `django_migrations` VALUES ('4', 'account', '0004_auto_20180405_2320', '2018-12-27 09:05:06.114884');
INSERT INTO `django_migrations` VALUES ('5', 'account', '0005_auto_20180411_2311', '2018-12-27 09:05:07.091849');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0001_initial', '2018-12-27 09:05:07.568548');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0001_initial', '2018-12-27 09:05:15.121225');
INSERT INTO `django_migrations` VALUES ('8', 'admin', '0001_initial', '2018-12-27 09:05:16.614372');
INSERT INTO `django_migrations` VALUES ('9', 'admin', '0002_logentry_remove_auto_add', '2018-12-27 09:05:16.679353');
INSERT INTO `django_migrations` VALUES ('10', 'admin', '0003_logentry_add_action_flag_choices', '2018-12-27 09:05:16.777294');
INSERT INTO `django_migrations` VALUES ('11', 'contenttypes', '0002_remove_content_type_name', '2018-12-27 09:05:18.550287');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0002_alter_permission_name_max_length', '2018-12-27 09:05:19.573717');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0003_alter_user_email_max_length', '2018-12-27 09:05:20.491196');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0004_alter_user_username_opts', '2018-12-27 09:05:20.537172');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0005_alter_user_last_login_null', '2018-12-27 09:05:21.378669');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0006_require_contenttypes_0002', '2018-12-27 09:05:21.425643');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0007_alter_validators_add_error_messages', '2018-12-27 09:05:21.495616');
INSERT INTO `django_migrations` VALUES ('18', 'auth', '0008_alter_user_username_max_length', '2018-12-27 09:05:22.255182');
INSERT INTO `django_migrations` VALUES ('19', 'auth', '0009_alter_user_last_name_max_length', '2018-12-27 09:05:23.055729');
INSERT INTO `django_migrations` VALUES ('20', 'business', '0001_initial', '2018-12-27 09:05:26.703630');
INSERT INTO `django_migrations` VALUES ('21', 'business', '0002_appconfiginfo_file_fields', '2018-12-27 09:05:27.042444');
INSERT INTO `django_migrations` VALUES ('22', 'business', '0003_userinfoimage_resume', '2018-12-27 09:05:27.300297');
INSERT INTO `django_migrations` VALUES ('23', 'business', '0004_auto_20180401_2221', '2018-12-27 09:05:28.093843');
INSERT INTO `django_migrations` VALUES ('24', 'business', '0005_auto_20180405_2320', '2018-12-27 09:05:28.602552');
INSERT INTO `django_migrations` VALUES ('25', 'business', '0006_remove_businessaccountinfo_password', '2018-12-27 09:05:29.401099');
INSERT INTO `django_migrations` VALUES ('26', 'business', '0007_remove_appconfiginfo_file_fields', '2018-12-27 09:05:30.219614');
INSERT INTO `django_migrations` VALUES ('27', 'business', '0008_remove_appconfiginfo_userinfo_field_names', '2018-12-27 09:05:30.968186');
INSERT INTO `django_migrations` VALUES ('28', 'business', '0009_appconfiginfo_userinfo_field_names', '2018-12-27 09:05:31.330007');
INSERT INTO `django_migrations` VALUES ('29', 'competition', '0001_initial', '2018-12-27 09:05:37.574435');
INSERT INTO `django_migrations` VALUES ('30', 'competition', '0002_auto_20180328_2246', '2018-12-27 09:05:38.399977');
INSERT INTO `django_migrations` VALUES ('31', 'competition', '0003_auto_20180401_2159', '2018-12-27 09:05:39.737211');
INSERT INTO `django_migrations` VALUES ('32', 'competition', '0004_auto_20180404_1528', '2018-12-27 09:05:40.848563');
INSERT INTO `django_migrations` VALUES ('33', 'competition', '0005_bankinfo_account_id', '2018-12-27 09:05:41.473205');
INSERT INTO `django_migrations` VALUES ('34', 'competition', '0006_auto_20180416_2151', '2018-12-27 09:05:42.023902');
INSERT INTO `django_migrations` VALUES ('35', 'sessions', '0001_initial', '2018-12-27 09:05:42.523604');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1ydrlt30cg6iio9jpgmad961rffiolm6', 'YjM5MjdmMTFmNTBiNmE3NmQ3YTg4ZWYxYTVmM2VlYjRkYTM4MjkwODp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYzBjNDc5NmQ4MTZhMDA3NzE3OWFkNGQwOGE1YWY5ODU5NzA1MmRhIiwidWlkIjoiMkFTQldXa3AzZ3U0Und2UWVFbUt6USIsInVzZXJuYW1lIjoiZmVuZ2NodW5sb25nMDUxMCJ9', '2019-01-10 01:17:11.039957');
INSERT INTO `django_session` VALUES ('20moje1p6lh56g0q9g0olyxjzj0z83jd', 'YjA4OWNmMmEzYzNkMWYxNzNhYWU3OTgzZDU5OGUxZWZkM2E5YTY0Zjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NDkzMTFlY2VhZTEzM2Q5ZDlkMDJhNmI5NDg1NjE3OGVjYTBkOWM2IiwidWlkIjoiYXFyZG5ZR0w0YTRYZHVVb3pMUGc2WSIsInVzZXJuYW1lIjoiXHU4MDAxXHU1MWFmIn0=', '2019-01-05 06:49:36.557903');
INSERT INTO `django_session` VALUES ('2qc7xrcjpqtq2bt2ngubn933mgo8qgw7', 'N2U0ZDQ2MTRiODI5MWQxOWE5OGI0YzAxMzkwMzkyMWEyMmYyNzUxMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZjgxNmNjZGI2MTNiZjJmNWQwMzFjOWJkZTM0NmI1MGEwODM4YWExIiwidWlkIjoiYXFyZG5ZR0w0YTRYZHVVb3pMUGc2WSIsInVzZXJuYW1lIjoiXHU4MDAxXHU1MWFmIn0=', '2018-12-29 08:53:08.349174');
INSERT INTO `django_session` VALUES ('38xrk05titv1oaidu8d3zxxm6sqircs3', 'N2U0ZDQ2MTRiODI5MWQxOWE5OGI0YzAxMzkwMzkyMWEyMmYyNzUxMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZjgxNmNjZGI2MTNiZjJmNWQwMzFjOWJkZTM0NmI1MGEwODM4YWExIiwidWlkIjoiYXFyZG5ZR0w0YTRYZHVVb3pMUGc2WSIsInVzZXJuYW1lIjoiXHU4MDAxXHU1MWFmIn0=', '2019-01-03 02:30:48.020902');
INSERT INTO `django_session` VALUES ('4sila3jdrh21duob9m3pkl8dddkbqy7h', 'NjZjZGVkNjI2OWEzOTIzNzYzM2JiZjVhYThkNjliNzA5MzM3NDIwNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZTU0Mzc1NThlODhhMTU5YTc2NjA0ZTNkZjNjNzBjMWQzNThlYWE2In0=', '2018-12-29 09:29:32.519871');
INSERT INTO `django_session` VALUES ('4yw43gq304um66z0mgx7jcuwnl9e2c0m', 'NTNiYTJkMGRlMDQ3YmUxYmM4MGQxNTUwY2ZlNDc1MzI4MTU2NzRmMTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNmJlYTQ1MmE0YmQ4YmM5YTAzNmM2M2M0Zjg5NzBkYWY3N2NkOGMwIiwidWlkIjoiYXFyZG5ZR0w0YTRYZHVVb3pMUGc2WSIsInVzZXJuYW1lIjoiXHU4MDAxXHU1MWFmIn0=', '2019-01-10 08:04:00.313387');
INSERT INTO `django_session` VALUES ('76jyc78a9lj6o54jd5syqxeorhu5ldw6', 'NDc2MjA2NzQwMGVkNGJmNjgxYmQ0ZjlkMWQ3OWViNTlmZmUwMjYxZTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NzdhMTRlZTE2OGMwNTY3NDYyYjVhMmQxODBlNmQzMzQzNzI5MzYxIiwidWlkIjoiYXFyZG5ZR0w0YTRYZHVVb3pMUGc2WSIsInVzZXJuYW1lIjoiXHU4MDAxXHU1MWFmIn0=', '2019-01-13 06:39:25.373859');
INSERT INTO `django_session` VALUES ('7a93eujut6wgmce8yqweucnhyhmy22xs', 'YTY2NDg4NzhjYzg4NmUzMTkwM2UxOThmY2ZjNTBlMjk2ZTM3MDI4ZDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOGQ5ZDJlYThkNDkwOGQ2ZTM0NWVlZWE1YjM5M2NjZDIyOTkzNzY0IiwidWlkIjoiYXFyZG5ZR0w0YTRYZHVVb3pMUGc2WSIsInVzZXJuYW1lIjoiXHU4MDAxXHU1MWFmIn0=', '2019-01-09 08:24:36.737379');
INSERT INTO `django_session` VALUES ('8sd2o8ndoq2pvv624fiepnb311x70g67', 'NDc2MjA2NzQwMGVkNGJmNjgxYmQ0ZjlkMWQ3OWViNTlmZmUwMjYxZTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NzdhMTRlZTE2OGMwNTY3NDYyYjVhMmQxODBlNmQzMzQzNzI5MzYxIiwidWlkIjoiYXFyZG5ZR0w0YTRYZHVVb3pMUGc2WSIsInVzZXJuYW1lIjoiXHU4MDAxXHU1MWFmIn0=', '2019-01-27 06:53:34.259622');
INSERT INTO `django_session` VALUES ('9pusmtozn1cafo3ii4g1ldoy8i5y2gy3', 'YTY2NDg4NzhjYzg4NmUzMTkwM2UxOThmY2ZjNTBlMjk2ZTM3MDI4ZDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOGQ5ZDJlYThkNDkwOGQ2ZTM0NWVlZWE1YjM5M2NjZDIyOTkzNzY0IiwidWlkIjoiYXFyZG5ZR0w0YTRYZHVVb3pMUGc2WSIsInVzZXJuYW1lIjoiXHU4MDAxXHU1MWFmIn0=', '2019-01-09 08:39:53.679089');
INSERT INTO `django_session` VALUES ('azth7wje7yje97dyckw2x13ivdae75n2', 'YTY2NDg4NzhjYzg4NmUzMTkwM2UxOThmY2ZjNTBlMjk2ZTM3MDI4ZDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOGQ5ZDJlYThkNDkwOGQ2ZTM0NWVlZWE1YjM5M2NjZDIyOTkzNzY0IiwidWlkIjoiYXFyZG5ZR0w0YTRYZHVVb3pMUGc2WSIsInVzZXJuYW1lIjoiXHU4MDAxXHU1MWFmIn0=', '2019-01-10 07:43:27.085401');
INSERT INTO `django_session` VALUES ('ddf48xcxsbnchzi37eumtrymqyaij4hl', 'YjM5MjdmMTFmNTBiNmE3NmQ3YTg4ZWYxYTVmM2VlYjRkYTM4MjkwODp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYzBjNDc5NmQ4MTZhMDA3NzE3OWFkNGQwOGE1YWY5ODU5NzA1MmRhIiwidWlkIjoiMkFTQldXa3AzZ3U0Und2UWVFbUt6USIsInVzZXJuYW1lIjoiZmVuZ2NodW5sb25nMDUxMCJ9', '2019-01-08 06:09:32.534839');
INSERT INTO `django_session` VALUES ('fdgvdmsr0x1m5mgjsw9kdzokirrs36om', 'NmU2M2Y4ZWZjMmNmZGE4NjhmZGU0YmUwODQwYTBmMjE2ZDNlMzUyMTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzM2YxM2NlNzlmMWIyMzYzNmNhODNjY2VhYmZiODliZmM4YWRlMzE4IiwidWlkIjoiYXFyZG5ZR0w0YTRYZHVVb3pMUGc2WSIsInVzZXJuYW1lIjoiXHU4MDAxXHU1MWFmIn0=', '2019-01-08 06:15:06.323893');
INSERT INTO `django_session` VALUES ('fssusym7rnbjj8laf09qxeu8ius5qk2y', 'YWMwYzdkMDY3NjQ5OTQzNTU0YzgwODFiYzVhZjIxOTFmNjE1NTNkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyOWZhNjUyNTA5NWE3ZGNmZDI5ZGQxN2JlNjg1MmQ5NTgzMzg1YjZlIn0=', '2019-01-27 07:02:29.726424');
INSERT INTO `django_session` VALUES ('jpgmadx0omn5bczd5p28xvuaosy1vonm', 'NDE4YjYzOTk5NjFjNzFjMGRiMDhmNzQ2ZDY0ZDM4NTIyZGEzYjk0Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MDk4NWU1MmJiM2QyZDQ0NzNjMDExZWNjYzA1N2M1YWI0NTM3M2QxIn0=', '2019-01-12 08:40:48.861088');
INSERT INTO `django_session` VALUES ('lpjdpj7qc0ags6x8gx3dgjt60j2lerwu', 'NjBmYzY2NzQ5MTdhNDZhNDc1Y2ZjZWE2ZDBhYzkxMDc4OTk0OTgxYTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNDAwZmIyMWExMDViYjcxZjJjYjU1MjdiNjgxNzVlM2QyNTc3NmQ5IiwidWlkIjoiYXFyZG5ZR0w0YTRYZHVVb3pMUGc2WSIsInVzZXJuYW1lIjoiXHU4MDAxXHU1MWFmIn0=', '2019-01-05 05:33:28.898195');
INSERT INTO `django_session` VALUES ('nk1vm6hgrpu9272iymh8ki64ti6tu7mo', 'YjM5MjdmMTFmNTBiNmE3NmQ3YTg4ZWYxYTVmM2VlYjRkYTM4MjkwODp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYzBjNDc5NmQ4MTZhMDA3NzE3OWFkNGQwOGE1YWY5ODU5NzA1MmRhIiwidWlkIjoiMkFTQldXa3AzZ3U0Und2UWVFbUt6USIsInVzZXJuYW1lIjoiZmVuZ2NodW5sb25nMDUxMCJ9', '2019-01-09 07:00:40.238056');
INSERT INTO `django_session` VALUES ('sjg2vqhhfediba5aofkfl6czvrv4gixf', 'NDc2MjA2NzQwMGVkNGJmNjgxYmQ0ZjlkMWQ3OWViNTlmZmUwMjYxZTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NzdhMTRlZTE2OGMwNTY3NDYyYjVhMmQxODBlNmQzMzQzNzI5MzYxIiwidWlkIjoiYXFyZG5ZR0w0YTRYZHVVb3pMUGc2WSIsInVzZXJuYW1lIjoiXHU4MDAxXHU1MWFmIn0=', '2019-01-13 06:39:25.113004');
INSERT INTO `django_session` VALUES ('t4jjrez0cs6bo7zx4dqt8pylfrsiumel', 'NjZjZGVkNjI2OWEzOTIzNzYzM2JiZjVhYThkNjliNzA5MzM3NDIwNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZTU0Mzc1NThlODhhMTU5YTc2NjA0ZTNkZjNjNzBjMWQzNThlYWE2In0=', '2018-12-30 07:20:43.745096');
INSERT INTO `django_session` VALUES ('xqict12k4ckumjtpu09wk0rdzfkp93n7', 'N2U0ZDQ2MTRiODI5MWQxOWE5OGI0YzAxMzkwMzkyMWEyMmYyNzUxMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZjgxNmNjZGI2MTNiZjJmNWQwMzFjOWJkZTM0NmI1MGEwODM4YWExIiwidWlkIjoiYXFyZG5ZR0w0YTRYZHVVb3pMUGc2WSIsInVzZXJuYW1lIjoiXHU4MDAxXHU1MWFmIn0=', '2019-01-05 05:17:21.437538');
INSERT INTO `django_session` VALUES ('yf3z39qj1b7009ymop6rvzo10e33k8cy', 'YjM5MjdmMTFmNTBiNmE3NmQ3YTg4ZWYxYTVmM2VlYjRkYTM4MjkwODp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYzBjNDc5NmQ4MTZhMDA3NzE3OWFkNGQwOGE1YWY5ODU5NzA1MmRhIiwidWlkIjoiMkFTQldXa3AzZ3U0Und2UWVFbUt6USIsInVzZXJuYW1lIjoiZmVuZ2NodW5sb25nMDUxMCJ9', '2019-01-09 03:25:55.376661');
