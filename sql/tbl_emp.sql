/*
Navicat MySQL Data Transfer

Source Server         : mfw
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : ssm_hrms

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2020-06-07 03:26:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_emp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp` (
  `login_name` varchar(255) NOT NULL,
  `login_password` varchar(255) NOT NULL,
  `emp_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `emp_email` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `gender` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'defult',
  `department_id` int DEFAULT '0',
  PRIMARY KEY (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO `tbl_emp` VALUES ('admin', '1234', 'name_7bebe1', '7bebe@qq.com', 'M', 'defult.jpg', '2');
INSERT INTO `tbl_emp` VALUES ('mfw', '111', '', '', '', 'defult.jpg', '0');
