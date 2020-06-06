/*
Navicat MySQL Data Transfer

Source Server         : mfw
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : ssm_hrms

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2020-06-07 03:26:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_environmental_monitoring
-- ----------------------------
DROP TABLE IF EXISTS `tbl_environmental_monitoring`;
CREATE TABLE `tbl_environmental_monitoring` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_name` varchar(255) DEFAULT NULL,
  `monitoring_time` datetime DEFAULT NULL,
  `temperature` varchar(255) DEFAULT NULL,
  `humidity` varchar(255) DEFAULT NULL,
  `dust_concentration` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_environmental_monitoring
-- ----------------------------
INSERT INTO `tbl_environmental_monitoring` VALUES ('1', '设备a', '2020-06-04 23:33:23', '25', '46', '6.5');
INSERT INTO `tbl_environmental_monitoring` VALUES ('2', '设备a', '2020-06-04 23:34:40', '20', '46', '6.5');
INSERT INTO `tbl_environmental_monitoring` VALUES ('3', '设备a', '2020-06-05 23:35:11', '22', '22', '4.6');
INSERT INTO `tbl_environmental_monitoring` VALUES ('4', '设备b', '2020-06-04 03:05:13', '25', '44', '3.2');
INSERT INTO `tbl_environmental_monitoring` VALUES ('5', '设备c', '2020-06-04 03:06:22', '14', '22', '5.6');
INSERT INTO `tbl_environmental_monitoring` VALUES ('6', '设备c', '2020-06-04 03:07:05', '15', '55', '3.8');
INSERT INTO `tbl_environmental_monitoring` VALUES ('7', '设备a', '2020-06-05 03:22:39', '16', '44', '22');
