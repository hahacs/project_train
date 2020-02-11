/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : sanlu

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2020-02-11 10:52:24
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
INSERT INTO `t_train_plan` VALUES ('014f82fc263a4a1ab89a36b274e1bb84', '5', '2020-01-07', '2020-01-08 09:54:11', '1');
INSERT INTO `t_train_plan` VALUES ('014f82fc263a4a1ab89a36b274e1bb84', '6', '2020-01-08', '2020-01-15 09:27:45', '1');
INSERT INTO `t_train_plan` VALUES ('014f82fc263a4a1ab89a36b274e1bb84', '7', '2020-01-15', '2020-01-23 11:17:00', '1');
INSERT INTO `t_train_plan` VALUES ('014f82fc263a4a1ab89a36b274e1bb84', '8', '2020-01-16', '2020-01-25 10:46:03', '1');
INSERT INTO `t_train_plan` VALUES ('014f82fc263a4a1ab89a36b274e1bb84', '9', '2020-01-30', '2020-01-30 10:00:37', '1');
INSERT INTO `t_train_plan` VALUES ('014f82fc263a4a1ab89a36b274e1bb84', '10', '2020-01-31', '2020-02-01 09:46:56', '1');
INSERT INTO `t_train_plan` VALUES ('0bbeff3450314dfbabb3a1abca753d99', '1', '2020-01-28', '2020-01-29 10:37:13', '1');
INSERT INTO `t_train_plan` VALUES ('0bbeff3450314dfbabb3a1abca753d99', '2', '2020-01-29', '2020-01-30 10:58:04', '1');
INSERT INTO `t_train_plan` VALUES ('0bbeff3450314dfbabb3a1abca753d99', '3', '2020-01-30', '2020-01-31 09:39:50', '1');
INSERT INTO `t_train_plan` VALUES ('0bbeff3450314dfbabb3a1abca753d99', '4', '2020-02-01', '2020-02-01 10:37:59', '1');
INSERT INTO `t_train_plan` VALUES ('0bbeff3450314dfbabb3a1abca753d99', '5', '2020-02-06', '2020-02-08 11:04:29', '1');
INSERT INTO `t_train_plan` VALUES ('0bbeff3450314dfbabb3a1abca753d99', '6', '2020-02-07', '2020-02-09 10:57:19', '1');
INSERT INTO `t_train_plan` VALUES ('0bbeff3450314dfbabb3a1abca753d99', '7', '2020-02-14', null, '0');
INSERT INTO `t_train_plan` VALUES ('0bbeff3450314dfbabb3a1abca753d99', '8', '2020-02-15', null, '0');
INSERT INTO `t_train_plan` VALUES ('0bbeff3450314dfbabb3a1abca753d99', '9', '2020-02-29', null, '0');
INSERT INTO `t_train_plan` VALUES ('0bbeff3450314dfbabb3a1abca753d99', '10', '2020-03-01', null, '0');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '1', '2019-12-29', '2019-12-29 18:25:14', '1');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '2', '2019-12-30', '2019-12-30 09:17:40', '1');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '3', '2019-12-31', '2019-12-31 09:26:18', '1');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '4', '2020-01-02', '2020-01-04 17:24:52', '1');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '5', '2020-01-07', '2020-01-09 09:58:16', '1');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '6', '2020-01-08', '2020-01-15 09:37:24', '1');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '7', '2020-01-15', '2020-01-21 11:54:42', '1');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '8', '2020-01-16', '2020-01-25 11:00:53', '1');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '9', '2020-01-30', '2020-01-30 09:57:19', '1');
INSERT INTO `t_train_plan` VALUES ('2d48a9121273497bbd705fb84d7d34f0', '10', '2020-01-31', '2020-02-01 09:52:29', '1');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '1', '2020-01-04', '2020-01-04 18:52:00', '1');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '2', '2020-01-05', '2020-01-06 19:59:57', '1');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '3', '2020-01-06', '2020-01-15 09:24:50', '1');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '4', '2020-01-08', '2020-01-22 11:09:57', '1');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '5', '2020-01-13', '2020-01-23 11:43:32', '1');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '6', '2020-01-14', '2020-01-24 11:48:17', '1');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '7', '2020-01-21', '2020-01-25 11:17:11', '1');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '8', '2020-01-22', '2020-01-26 10:08:49', '1');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '9', '2020-02-05', '2020-02-07 10:13:19', '1');
INSERT INTO `t_train_plan` VALUES ('2de89308fefd43b681c99fb3d8bed7a6', '10', '2020-02-06', '2020-02-09 11:59:56', '1');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '1', '2019-12-31', '2019-12-31 10:48:56', '1');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '2', '2020-01-01', '2020-01-01 02:04:34', '1');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '3', '2020-01-02', '2020-01-04 17:05:43', '1');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '4', '2020-01-04', '2020-01-06 19:50:14', '1');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '5', '2020-01-09', '2020-01-09 10:04:27', '1');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '6', '2020-01-10', '2020-01-11 14:59:06', '1');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '7', '2020-01-17', '2020-01-23 11:33:33', '1');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '8', '2020-01-18', '2020-01-25 11:39:40', '1');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '9', '2020-02-01', '2020-02-09 11:31:42', '1');
INSERT INTO `t_train_plan` VALUES ('4f5512108b5a43a19857e1aa60578d6f', '10', '2020-02-02', null, '0');
INSERT INTO `t_train_plan` VALUES ('572c6dda73c74109b52788ffe046ec60', '1', '2020-01-29', '2020-01-30 10:21:41', '1');
INSERT INTO `t_train_plan` VALUES ('572c6dda73c74109b52788ffe046ec60', '2', '2020-01-30', '2020-01-30 22:30:27', '1');
INSERT INTO `t_train_plan` VALUES ('572c6dda73c74109b52788ffe046ec60', '3', '2020-01-31', '2020-01-31 09:32:48', '1');
INSERT INTO `t_train_plan` VALUES ('572c6dda73c74109b52788ffe046ec60', '4', '2020-02-02', '2020-02-06 09:40:14', '1');
INSERT INTO `t_train_plan` VALUES ('572c6dda73c74109b52788ffe046ec60', '5', '2020-02-07', '2020-02-07 10:35:14', '1');
INSERT INTO `t_train_plan` VALUES ('572c6dda73c74109b52788ffe046ec60', '6', '2020-02-08', '2020-02-09 11:30:02', '1');
INSERT INTO `t_train_plan` VALUES ('572c6dda73c74109b52788ffe046ec60', '7', '2020-02-15', null, '0');
INSERT INTO `t_train_plan` VALUES ('572c6dda73c74109b52788ffe046ec60', '8', '2020-02-16', null, '0');
INSERT INTO `t_train_plan` VALUES ('572c6dda73c74109b52788ffe046ec60', '9', '2020-03-01', null, '0');
INSERT INTO `t_train_plan` VALUES ('572c6dda73c74109b52788ffe046ec60', '10', '2020-03-02', null, '0');
INSERT INTO `t_train_plan` VALUES ('6478620021b94eefa05dc81790a04e50', '1', '2020-01-21', null, '0');
INSERT INTO `t_train_plan` VALUES ('6478620021b94eefa05dc81790a04e50', '2', '2020-01-22', null, '0');
INSERT INTO `t_train_plan` VALUES ('6478620021b94eefa05dc81790a04e50', '3', '2020-01-23', null, '0');
INSERT INTO `t_train_plan` VALUES ('6478620021b94eefa05dc81790a04e50', '4', '2020-01-25', null, '0');
INSERT INTO `t_train_plan` VALUES ('6478620021b94eefa05dc81790a04e50', '5', '2020-01-30', null, '0');
INSERT INTO `t_train_plan` VALUES ('6478620021b94eefa05dc81790a04e50', '6', '2020-01-31', null, '0');
INSERT INTO `t_train_plan` VALUES ('6478620021b94eefa05dc81790a04e50', '7', '2020-02-07', null, '0');
INSERT INTO `t_train_plan` VALUES ('6478620021b94eefa05dc81790a04e50', '8', '2020-02-08', null, '0');
INSERT INTO `t_train_plan` VALUES ('6478620021b94eefa05dc81790a04e50', '9', '2020-02-22', null, '0');
INSERT INTO `t_train_plan` VALUES ('6478620021b94eefa05dc81790a04e50', '10', '2020-02-23', null, '0');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '1', '2019-12-29', '2019-12-29 18:25:20', '1');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '2', '2019-12-30', '2019-12-30 08:51:37', '1');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '3', '2019-12-31', '2019-12-31 08:57:22', '1');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '4', '2020-01-02', '2020-01-01 08:26:59', '1');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '5', '2020-01-07', '2020-01-08 08:57:57', '1');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '6', '2020-01-08', '2020-01-11 15:03:09', '1');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '7', '2020-01-15', '2020-01-21 11:25:22', '1');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '8', '2020-01-16', '2020-01-23 11:54:08', '1');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '9', '2020-01-30', '2020-01-30 15:26:05', '1');
INSERT INTO `t_train_plan` VALUES ('6ca5904355cd4ebcbfd278d5db80a188', '10', '2020-01-31', '2020-02-01 10:08:52', '1');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '1', '2019-12-29', '2019-12-29 18:33:58', '1');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '2', '2019-12-30', '2019-12-30 09:23:00', '1');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '3', '2019-12-31', '2019-12-31 09:39:34', '1');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '4', '2020-01-02', '2020-01-04 17:16:50', '1');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '5', '2020-01-07', '2020-01-09 10:07:24', '1');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '6', '2020-01-08', '2020-01-23 11:28:44', '1');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '7', '2020-01-15', '2020-01-24 12:20:29', '1');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '8', '2020-01-16', '2020-01-25 11:25:42', '1');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '9', '2020-01-30', '2020-01-30 10:02:34', '1');
INSERT INTO `t_train_plan` VALUES ('6f6a7d8658fd4fd4aa16675f7c6f390a', '10', '2020-01-31', '2020-02-09 22:51:21', '1');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '1', '2020-01-01', '2020-01-01 16:00:12', '1');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '2', '2020-01-02', '2020-01-04 17:34:55', '1');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '3', '2020-01-03', '2020-01-09 10:18:15', '1');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '4', '2020-01-05', '2020-01-05 11:00:52', '1');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '5', '2020-01-10', '2020-01-12 17:38:01', '1');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '6', '2020-01-11', '2020-01-15 09:47:02', '1');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '7', '2020-01-18', '2020-01-23 11:27:18', '1');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '8', '2020-01-19', '2020-01-25 11:24:09', '1');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '9', '2020-02-02', '2020-02-09 22:47:07', '1');
INSERT INTO `t_train_plan` VALUES ('767e97eb47d54eecb5cb0ce55d5ed570', '10', '2020-02-03', null, '0');
INSERT INTO `t_train_plan` VALUES ('789779a2f3894f398d9f6711294accfe', '1', '2020-01-23', '2020-01-24 10:23:47', '1');
INSERT INTO `t_train_plan` VALUES ('789779a2f3894f398d9f6711294accfe', '2', '2020-01-24', '2020-01-25 11:04:23', '1');
INSERT INTO `t_train_plan` VALUES ('789779a2f3894f398d9f6711294accfe', '3', '2020-01-25', '2020-01-26 09:53:15', '1');
INSERT INTO `t_train_plan` VALUES ('789779a2f3894f398d9f6711294accfe', '4', '2020-01-27', '2020-01-27 10:36:00', '1');
INSERT INTO `t_train_plan` VALUES ('789779a2f3894f398d9f6711294accfe', '5', '2020-02-01', '2020-02-01 09:57:26', '1');
INSERT INTO `t_train_plan` VALUES ('789779a2f3894f398d9f6711294accfe', '6', '2020-02-02', '2020-02-06 09:43:16', '1');
INSERT INTO `t_train_plan` VALUES ('789779a2f3894f398d9f6711294accfe', '7', '2020-02-09', '2020-02-09 11:53:09', '1');
INSERT INTO `t_train_plan` VALUES ('789779a2f3894f398d9f6711294accfe', '8', '2020-02-10', '2020-02-10 11:44:12', '1');
INSERT INTO `t_train_plan` VALUES ('789779a2f3894f398d9f6711294accfe', '9', '2020-02-24', null, '0');
INSERT INTO `t_train_plan` VALUES ('789779a2f3894f398d9f6711294accfe', '10', '2020-02-25', null, '0');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '1', '2019-12-29', '2019-12-29 18:25:26', '1');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '2', '2019-12-30', '2019-12-30 08:48:15', '1');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '3', '2019-12-31', '2019-12-31 08:54:27', '1');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '4', '2020-01-02', '2020-01-01 08:18:34', '1');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '5', '2020-01-07', '2020-01-08 08:47:41', '1');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '6', '2020-01-08', '2020-01-12 17:24:55', '1');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '7', '2020-01-15', '2020-01-21 11:20:30', '1');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '8', '2020-01-16', '2020-01-23 11:50:07', '1');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '9', '2020-01-30', '2020-01-30 15:18:17', '1');
INSERT INTO `t_train_plan` VALUES ('8269821bb2f74d3aad26e70b424f95c7', '10', '2020-01-31', '2020-02-01 10:04:12', '1');
INSERT INTO `t_train_plan` VALUES ('83e480f295b04da498065d4c13b3eb52', '1', '2020-01-31', '2020-02-01 10:53:04', '1');
INSERT INTO `t_train_plan` VALUES ('83e480f295b04da498065d4c13b3eb52', '2', '2020-02-01', '2020-02-09 11:21:08', '1');
INSERT INTO `t_train_plan` VALUES ('83e480f295b04da498065d4c13b3eb52', '3', '2020-02-02', null, '0');
INSERT INTO `t_train_plan` VALUES ('83e480f295b04da498065d4c13b3eb52', '4', '2020-02-04', null, '0');
INSERT INTO `t_train_plan` VALUES ('83e480f295b04da498065d4c13b3eb52', '5', '2020-02-09', null, '0');
INSERT INTO `t_train_plan` VALUES ('83e480f295b04da498065d4c13b3eb52', '6', '2020-02-10', null, '0');
INSERT INTO `t_train_plan` VALUES ('83e480f295b04da498065d4c13b3eb52', '7', '2020-02-17', null, '0');
INSERT INTO `t_train_plan` VALUES ('83e480f295b04da498065d4c13b3eb52', '8', '2020-02-18', null, '0');
INSERT INTO `t_train_plan` VALUES ('83e480f295b04da498065d4c13b3eb52', '9', '2020-03-03', null, '0');
INSERT INTO `t_train_plan` VALUES ('83e480f295b04da498065d4c13b3eb52', '10', '2020-03-04', null, '0');
INSERT INTO `t_train_plan` VALUES ('8676d27f487245a79ea2da16c1bdbee7', '1', '2020-01-25', '2020-01-26 10:33:59', '1');
INSERT INTO `t_train_plan` VALUES ('8676d27f487245a79ea2da16c1bdbee7', '2', '2020-01-26', '2020-01-27 11:48:46', '1');
INSERT INTO `t_train_plan` VALUES ('8676d27f487245a79ea2da16c1bdbee7', '3', '2020-01-27', '2020-01-29 10:26:11', '1');
INSERT INTO `t_train_plan` VALUES ('8676d27f487245a79ea2da16c1bdbee7', '4', '2020-01-29', '2020-02-01 10:29:21', '1');
INSERT INTO `t_train_plan` VALUES ('8676d27f487245a79ea2da16c1bdbee7', '5', '2020-02-03', '2020-02-07 11:10:51', '1');
INSERT INTO `t_train_plan` VALUES ('8676d27f487245a79ea2da16c1bdbee7', '6', '2020-02-04', '2020-02-09 23:12:17', '1');
INSERT INTO `t_train_plan` VALUES ('8676d27f487245a79ea2da16c1bdbee7', '7', '2020-02-11', null, '0');
INSERT INTO `t_train_plan` VALUES ('8676d27f487245a79ea2da16c1bdbee7', '8', '2020-02-12', null, '0');
INSERT INTO `t_train_plan` VALUES ('8676d27f487245a79ea2da16c1bdbee7', '9', '2020-02-26', null, '0');
INSERT INTO `t_train_plan` VALUES ('8676d27f487245a79ea2da16c1bdbee7', '10', '2020-02-27', null, '0');
INSERT INTO `t_train_plan` VALUES ('b34330dd01db46b98c3fb46f89e1cbb2', '1', '2020-01-31', '2020-02-01 10:51:16', '1');
INSERT INTO `t_train_plan` VALUES ('b34330dd01db46b98c3fb46f89e1cbb2', '2', '2020-02-01', '2020-02-08 11:33:35', '1');
INSERT INTO `t_train_plan` VALUES ('b34330dd01db46b98c3fb46f89e1cbb2', '3', '2020-02-02', '2020-02-09 11:17:53', '1');
INSERT INTO `t_train_plan` VALUES ('b34330dd01db46b98c3fb46f89e1cbb2', '4', '2020-02-04', null, '0');
INSERT INTO `t_train_plan` VALUES ('b34330dd01db46b98c3fb46f89e1cbb2', '5', '2020-02-09', null, '0');
INSERT INTO `t_train_plan` VALUES ('b34330dd01db46b98c3fb46f89e1cbb2', '6', '2020-02-10', null, '0');
INSERT INTO `t_train_plan` VALUES ('b34330dd01db46b98c3fb46f89e1cbb2', '7', '2020-02-17', null, '0');
INSERT INTO `t_train_plan` VALUES ('b34330dd01db46b98c3fb46f89e1cbb2', '8', '2020-02-18', null, '0');
INSERT INTO `t_train_plan` VALUES ('b34330dd01db46b98c3fb46f89e1cbb2', '9', '2020-03-03', null, '0');
INSERT INTO `t_train_plan` VALUES ('b34330dd01db46b98c3fb46f89e1cbb2', '10', '2020-03-04', null, '0');
INSERT INTO `t_train_plan` VALUES ('d01a591b8ac84132a1a574e0ce3f9f99', '1', '2020-01-13', '2020-01-23 11:14:33', '1');
INSERT INTO `t_train_plan` VALUES ('d01a591b8ac84132a1a574e0ce3f9f99', '2', '2020-01-14', '2020-01-24 11:54:43', '1');
INSERT INTO `t_train_plan` VALUES ('d01a591b8ac84132a1a574e0ce3f9f99', '3', '2020-01-15', '2020-01-25 11:30:03', '1');
INSERT INTO `t_train_plan` VALUES ('d01a591b8ac84132a1a574e0ce3f9f99', '4', '2020-01-17', '2020-01-26 10:12:41', '1');
INSERT INTO `t_train_plan` VALUES ('d01a591b8ac84132a1a574e0ce3f9f99', '5', '2020-01-22', '2020-01-27 10:40:33', '1');
INSERT INTO `t_train_plan` VALUES ('d01a591b8ac84132a1a574e0ce3f9f99', '6', '2020-01-23', '2020-01-30 15:25:50', '1');
INSERT INTO `t_train_plan` VALUES ('d01a591b8ac84132a1a574e0ce3f9f99', '7', '2020-01-30', '2020-02-01 10:00:45', '1');
INSERT INTO `t_train_plan` VALUES ('d01a591b8ac84132a1a574e0ce3f9f99', '8', '2020-01-31', '2020-02-07 10:17:06', '1');
INSERT INTO `t_train_plan` VALUES ('d01a591b8ac84132a1a574e0ce3f9f99', '9', '2020-02-14', null, '0');
INSERT INTO `t_train_plan` VALUES ('d01a591b8ac84132a1a574e0ce3f9f99', '10', '2020-02-15', null, '0');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '1', '2020-01-01', '2020-01-01 16:01:09', '1');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '2', '2020-01-02', '2020-01-04 17:13:16', '1');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '3', '2020-01-03', '2020-01-06 19:48:47', '1');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '4', '2020-01-05', '2020-01-05 11:06:29', '1');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '5', '2020-01-10', '2020-01-12 17:10:24', '1');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '6', '2020-01-11', '2020-01-22 10:47:35', '1');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '7', '2020-01-18', '2020-01-23 11:59:14', '1');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '8', '2020-01-19', '2020-01-30 22:36:21', '1');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '9', '2020-02-02', '2020-02-07 10:41:04', '1');
INSERT INTO `t_train_plan` VALUES ('da68ea242b8f41bd86d4669f08a863f9', '10', '2020-02-03', null, '0');
INSERT INTO `t_train_plan` VALUES ('e2852b2b8d3f469e92da3cffb49f3f1e', '1', '2020-01-25', '2020-01-26 10:24:15', '1');
INSERT INTO `t_train_plan` VALUES ('e2852b2b8d3f469e92da3cffb49f3f1e', '2', '2020-01-26', '2020-01-27 11:26:05', '1');
INSERT INTO `t_train_plan` VALUES ('e2852b2b8d3f469e92da3cffb49f3f1e', '3', '2020-01-27', '2020-01-29 10:17:43', '1');
INSERT INTO `t_train_plan` VALUES ('e2852b2b8d3f469e92da3cffb49f3f1e', '4', '2020-01-29', '2020-02-01 10:19:42', '1');
INSERT INTO `t_train_plan` VALUES ('e2852b2b8d3f469e92da3cffb49f3f1e', '5', '2020-02-03', '2020-02-07 10:56:36', '1');
INSERT INTO `t_train_plan` VALUES ('e2852b2b8d3f469e92da3cffb49f3f1e', '6', '2020-02-04', '2020-02-09 23:03:26', '1');
INSERT INTO `t_train_plan` VALUES ('e2852b2b8d3f469e92da3cffb49f3f1e', '7', '2020-02-11', null, '0');
INSERT INTO `t_train_plan` VALUES ('e2852b2b8d3f469e92da3cffb49f3f1e', '8', '2020-02-12', null, '0');
INSERT INTO `t_train_plan` VALUES ('e2852b2b8d3f469e92da3cffb49f3f1e', '9', '2020-02-26', null, '0');
INSERT INTO `t_train_plan` VALUES ('e2852b2b8d3f469e92da3cffb49f3f1e', '10', '2020-02-27', null, '0');
INSERT INTO `t_train_plan` VALUES ('e3823e93ed4644f5913739367ec93bf7', '1', '2020-01-25', '2020-01-26 10:16:59', '1');
INSERT INTO `t_train_plan` VALUES ('e3823e93ed4644f5913739367ec93bf7', '2', '2020-01-26', '2020-01-27 10:49:44', '1');
INSERT INTO `t_train_plan` VALUES ('e3823e93ed4644f5913739367ec93bf7', '3', '2020-01-27', '2020-01-29 09:48:33', '1');
INSERT INTO `t_train_plan` VALUES ('e3823e93ed4644f5913739367ec93bf7', '4', '2020-01-29', '2020-02-01 10:14:31', '1');
INSERT INTO `t_train_plan` VALUES ('e3823e93ed4644f5913739367ec93bf7', '5', '2020-02-03', '2020-02-07 10:49:15', '1');
INSERT INTO `t_train_plan` VALUES ('e3823e93ed4644f5913739367ec93bf7', '6', '2020-02-04', '2020-02-09 22:55:58', '1');
INSERT INTO `t_train_plan` VALUES ('e3823e93ed4644f5913739367ec93bf7', '7', '2020-02-11', null, '0');
INSERT INTO `t_train_plan` VALUES ('e3823e93ed4644f5913739367ec93bf7', '8', '2020-02-12', null, '0');
INSERT INTO `t_train_plan` VALUES ('e3823e93ed4644f5913739367ec93bf7', '9', '2020-02-26', null, '0');
INSERT INTO `t_train_plan` VALUES ('e3823e93ed4644f5913739367ec93bf7', '10', '2020-02-27', null, '0');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '1', '2019-12-29', '2019-12-29 18:25:33', '1');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '2', '2019-12-30', '2019-12-30 08:59:05', '1');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '3', '2019-12-31', '2019-12-31 09:07:48', '1');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '4', '2020-01-02', '2020-01-01 08:19:31', '1');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '5', '2020-01-07', '2020-01-08 09:43:55', '1');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '6', '2020-01-08', '2020-01-11 15:03:02', '1');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '7', '2020-01-15', '2020-01-23 16:12:57', '1');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '8', '2020-01-16', '2020-01-30 15:22:46', '1');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '9', '2020-01-30', '2020-01-30 22:31:15', '1');
INSERT INTO `t_train_plan` VALUES ('ecbdd470a4fb4eae8bba5cb6d0c7051e', '10', '2020-01-31', '2020-02-01 10:06:22', '1');
INSERT INTO `t_train_plan` VALUES ('f32ed65b24654ccab7cfbfb9bc41cc6f', '1', '2020-01-24', '2020-01-25 11:37:14', '1');
INSERT INTO `t_train_plan` VALUES ('f32ed65b24654ccab7cfbfb9bc41cc6f', '2', '2020-01-25', '2020-01-26 10:00:21', '1');
INSERT INTO `t_train_plan` VALUES ('f32ed65b24654ccab7cfbfb9bc41cc6f', '3', '2020-01-26', '2020-01-27 10:45:03', '1');
INSERT INTO `t_train_plan` VALUES ('f32ed65b24654ccab7cfbfb9bc41cc6f', '4', '2020-01-28', '2020-01-28 08:24:34', '1');
INSERT INTO `t_train_plan` VALUES ('f32ed65b24654ccab7cfbfb9bc41cc6f', '5', '2020-02-02', '2020-02-06 09:27:50', '1');
INSERT INTO `t_train_plan` VALUES ('f32ed65b24654ccab7cfbfb9bc41cc6f', '6', '2020-02-03', '2020-02-07 10:21:48', '1');
INSERT INTO `t_train_plan` VALUES ('f32ed65b24654ccab7cfbfb9bc41cc6f', '7', '2020-02-10', null, '0');
INSERT INTO `t_train_plan` VALUES ('f32ed65b24654ccab7cfbfb9bc41cc6f', '8', '2020-02-11', null, '0');
INSERT INTO `t_train_plan` VALUES ('f32ed65b24654ccab7cfbfb9bc41cc6f', '9', '2020-02-25', null, '0');
INSERT INTO `t_train_plan` VALUES ('f32ed65b24654ccab7cfbfb9bc41cc6f', '10', '2020-02-26', null, '0');
INSERT INTO `t_train_plan` VALUES ('f713b113aaaf4c17a885e048860859eb', '1', '2020-01-29', '2020-01-31 09:47:12', '1');
INSERT INTO `t_train_plan` VALUES ('f713b113aaaf4c17a885e048860859eb', '2', '2020-01-30', '2020-02-01 10:42:26', '1');
INSERT INTO `t_train_plan` VALUES ('f713b113aaaf4c17a885e048860859eb', '3', '2020-01-31', '2020-02-08 11:15:54', '1');
INSERT INTO `t_train_plan` VALUES ('f713b113aaaf4c17a885e048860859eb', '4', '2020-02-02', '2020-02-09 11:10:07', '1');
INSERT INTO `t_train_plan` VALUES ('f713b113aaaf4c17a885e048860859eb', '5', '2020-02-07', null, '0');
INSERT INTO `t_train_plan` VALUES ('f713b113aaaf4c17a885e048860859eb', '6', '2020-02-08', null, '0');
INSERT INTO `t_train_plan` VALUES ('f713b113aaaf4c17a885e048860859eb', '7', '2020-02-15', null, '0');
INSERT INTO `t_train_plan` VALUES ('f713b113aaaf4c17a885e048860859eb', '8', '2020-02-16', null, '0');
INSERT INTO `t_train_plan` VALUES ('f713b113aaaf4c17a885e048860859eb', '9', '2020-03-01', null, '0');
INSERT INTO `t_train_plan` VALUES ('f713b113aaaf4c17a885e048860859eb', '10', '2020-03-02', null, '0');
