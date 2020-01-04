/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : sanlu

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2020-01-04 19:03:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_train_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_train_plan`;
CREATE TABLE `t_train_plan` (
  `id` varchar(32) NOT NULL COMMENT 'uuid',
  `serialno` bigint(32) NOT NULL COMMENT '序号',
  `planTime` date DEFAULT NULL COMMENT '计划训练时间',
  `trainTime` datetime DEFAULT NULL COMMENT '实际训练时间',
  `trainFlag` varchar(8) DEFAULT '0' COMMENT '是否已训练，0否，1是',
  PRIMARY KEY (`id`,`serialno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_train_plan
-- ----------------------------
INSERT INTO `t_train_plan` VALUES ('014f82fc263a4a1ab89a36b274e1bb84', '1', '2019-12-29', '2019-12-29 18:25:05', '1');
INSERT INTO `t_train_plan` VALUES ('014f82fc263a4a1ab89a36b274e1bb84', '2', '2019-12-30', '2019-12-30 09:20:40', '1');
INSERT INTO `t_train_plan` VALUES ('014f82fc263a4a1ab89a36b274e1bb84', '3', '2019-12-31', '2019-12-31 09:36:29', '1');
INSERT INTO `t_train_plan` VALUES ('014f82fc263a4a1ab89a36b274e1bb84', '4', '2020-01-02', '2020-01-04 17:01:44', '1');
INSERT INTO `t_train_plan` VALUES ('014f82fc263a4a1ab89a36b274e1bb84', '5', '2020-01-07', null, '0');
INSERT INTO `t_train_plan` VALUES ('014f82fc263a4a1ab89a36b274e1bb84', '6', '2020-01-08', null, '0');
INSERT INTO `t_train_plan` VALUES ('014f82fc263a4a1ab89a36b274e1bb84', '7', '2020-01-15', null, '0');
INSERT INTO `t_train_plan` VALUES ('014f82fc263a4a1ab89a36b274e1bb84', '8', '2020-01-16', null, '0');
INSERT INTO `t_train_plan` VALUES ('014f82fc263a4a1ab89a36b274e1bb84', '9', '2020-01-30', null, '0');
INSERT INTO `t_train_plan` VALUES ('014f82fc263a4a1ab89a36b274e1bb84', '10', '2020-01-31', null, '0');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '1', '2019-12-29', '2019-12-29 18:25:14', '1');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '2', '2019-12-30', '2019-12-30 09:17:40', '1');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '3', '2019-12-31', '2019-12-31 09:26:18', '1');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '4', '2020-01-02', '2020-01-04 17:24:52', '1');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '5', '2020-01-07', null, '0');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '6', '2020-01-08', null, '0');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '7', '2020-01-15', null, '0');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '8', '2020-01-16', null, '0');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '9', '2020-01-30', null, '0');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '10', '2020-01-31', null, '0');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '1', '2020-01-04', '2020-01-04 18:52:00', '1');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '2', '2020-01-05', null, '0');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '3', '2020-01-06', null, '0');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '4', '2020-01-08', null, '0');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '5', '2020-01-13', null, '0');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '6', '2020-01-14', null, '0');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '7', '2020-01-21', null, '0');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '8', '2020-01-22', null, '0');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '9', '2020-02-05', null, '0');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '10', '2020-02-06', null, '0');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '1', '2019-12-31', '2019-12-31 10:48:56', '1');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '2', '2020-01-01', '2020-01-01 02:04:34', '1');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '3', '2020-01-02', '2020-01-04 17:05:43', '1');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '4', '2020-01-04', null, '0');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '5', '2020-01-09', null, '0');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '6', '2020-01-10', null, '0');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '7', '2020-01-17', null, '0');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '8', '2020-01-18', null, '0');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '9', '2020-02-01', null, '0');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '10', '2020-02-02', null, '0');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '1', '2019-12-29', '2019-12-29 18:25:20', '1');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '2', '2019-12-30', '2019-12-30 08:51:37', '1');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '3', '2019-12-31', '2019-12-31 08:57:22', '1');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '4', '2020-01-02', '2020-01-01 08:26:59', '1');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '5', '2020-01-07', null, '0');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '6', '2020-01-08', null, '0');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '7', '2020-01-15', null, '0');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '8', '2020-01-16', null, '0');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '9', '2020-01-30', null, '0');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '10', '2020-01-31', null, '0');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '1', '2019-12-29', '2019-12-29 18:33:58', '1');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '2', '2019-12-30', '2019-12-30 09:23:00', '1');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '3', '2019-12-31', '2019-12-31 09:39:34', '1');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '4', '2020-01-02', '2020-01-04 17:16:50', '1');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '5', '2020-01-07', null, '0');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '6', '2020-01-08', null, '0');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '7', '2020-01-15', null, '0');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '8', '2020-01-16', null, '0');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '9', '2020-01-30', null, '0');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '10', '2020-01-31', null, '0');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '1', '2020-01-01', '2020-01-01 16:00:12', '1');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '2', '2020-01-02', '2020-01-04 17:34:55', '1');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '3', '2020-01-03', null, '0');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '4', '2020-01-05', null, '0');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '5', '2020-01-10', null, '0');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '6', '2020-01-11', null, '0');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '7', '2020-01-18', null, '0');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '8', '2020-01-19', null, '0');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '9', '2020-02-02', null, '0');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '10', '2020-02-03', null, '0');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '1', '2019-12-29', '2019-12-29 18:25:26', '1');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '2', '2019-12-30', '2019-12-30 08:48:15', '1');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '3', '2019-12-31', '2019-12-31 08:54:27', '1');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '4', '2020-01-02', '2020-01-01 08:18:34', '1');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '5', '2020-01-07', null, '0');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '6', '2020-01-08', null, '0');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '7', '2020-01-15', null, '0');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '8', '2020-01-16', null, '0');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '9', '2020-01-30', null, '0');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '10', '2020-01-31', null, '0');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '1', '2020-01-01', '2020-01-01 16:01:09', '1');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '2', '2020-01-02', '2020-01-04 17:13:16', '1');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '3', '2020-01-03', null, '0');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '4', '2020-01-05', null, '0');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '5', '2020-01-10', null, '0');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '6', '2020-01-11', null, '0');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '7', '2020-01-18', null, '0');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '8', '2020-01-19', null, '0');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '9', '2020-02-02', null, '0');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '10', '2020-02-03', null, '0');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '1', '2019-12-29', '2019-12-29 18:25:33', '1');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '2', '2019-12-30', '2019-12-30 08:59:05', '1');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '3', '2019-12-31', '2019-12-31 09:07:48', '1');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '4', '2020-01-02', '2020-01-01 08:19:31', '1');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '5', '2020-01-07', null, '0');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '6', '2020-01-08', null, '0');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '7', '2020-01-15', null, '0');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '8', '2020-01-16', null, '0');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '9', '2020-01-30', null, '0');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '10', '2020-01-31', null, '0');
