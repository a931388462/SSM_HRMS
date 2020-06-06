/*
Navicat MySQL Data Transfer

Source Server         : mfw
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : ssm_hrms

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2020-06-07 03:26:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_dept
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept` (
  `dept_id` int NOT NULL DEFAULT '0',
  `dept_name` varchar(255) NOT NULL DEFAULT '',
  `dept_leader` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dept
-- ----------------------------
INSERT INTO `tbl_dept` VALUES ('1', '管理部', 'Tomsom');
INSERT INTO `tbl_dept` VALUES ('0', '开发部', 'Sam');
