/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : sanlu

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-12-31 17:47:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for data_setting
-- ----------------------------
DROP TABLE IF EXISTS `data_setting`;
CREATE TABLE `data_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `title` varchar(255) DEFAULT '' COMMENT '名称',
  `isdel` int(11) DEFAULT '0' COMMENT '是否删除',
  `remarks` varchar(255) DEFAULT '' COMMENT '描述',
  `parentid` bigint(20) DEFAULT '0' COMMENT '父级id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8 COMMENT='资料设定';

-- ----------------------------
-- Records of data_setting
-- ----------------------------
INSERT INTO `data_setting` VALUES ('1', '0', '发货状态', '0', '', '0');
INSERT INTO `data_setting` VALUES ('2', '0', '业务地区', '0', '', '0');
INSERT INTO `data_setting` VALUES ('3', '0', '货运方式', '0', '', '0');
INSERT INTO `data_setting` VALUES ('4', '0', '开户银行', '0', '', '0');
INSERT INTO `data_setting` VALUES ('5', '0', '基本单位', '0', '', '0');
INSERT INTO `data_setting` VALUES ('6', '0', '产品大类', '0', '', '0');
INSERT INTO `data_setting` VALUES ('7', '0', '货币单位', '0', '', '0');
INSERT INTO `data_setting` VALUES ('8', '0', '产品性质', '0', '', '0');
INSERT INTO `data_setting` VALUES ('9', '0', '产品来源', '0', '', '0');
INSERT INTO `data_setting` VALUES ('10', '0', '客户类别', '0', '', '0');
INSERT INTO `data_setting` VALUES ('11', '0', '行业', '0', '', '0');
INSERT INTO `data_setting` VALUES ('12', '0', '地区', '0', '', '0');
INSERT INTO `data_setting` VALUES ('13', '0', '客户来源', '0', '', '0');
INSERT INTO `data_setting` VALUES ('14', '0', '客户等级', '0', '', '0');
INSERT INTO `data_setting` VALUES ('15', '0', '部门', '0', '', '0');
INSERT INTO `data_setting` VALUES ('16', '0', '职务', '0', '', '0');
INSERT INTO `data_setting` VALUES ('17', '0', '出生地', '0', '', '0');
INSERT INTO `data_setting` VALUES ('18', '0', '民族', '0', '', '0');
INSERT INTO `data_setting` VALUES ('19', '0', '退货原因', '0', '', '0');
INSERT INTO `data_setting` VALUES ('20', '0', '收款方式', '0', '', '0');
INSERT INTO `data_setting` VALUES ('21', '0', '电话', '0', '', '0');
INSERT INTO `data_setting` VALUES ('22', '0', '传真', '0', '', '0');
INSERT INTO `data_setting` VALUES ('23', '0', '备注及说明', '0', '', '0');
INSERT INTO `data_setting` VALUES ('24', '0', '发货状态', '0', '', '0');
INSERT INTO `data_setting` VALUES ('25', '0', '销退备注', '0', '', '0');
INSERT INTO `data_setting` VALUES ('26', '0', '收款备注', '0', '', '0');
INSERT INTO `data_setting` VALUES ('27', '0', '所属公司', '0', '', '0');
INSERT INTO `data_setting` VALUES ('28', '0', '国家', '0', '', '0');
INSERT INTO `data_setting` VALUES ('29', '0', '出货仓库', '0', '', '0');
INSERT INTO `data_setting` VALUES ('30', '0', '运输方式', '0', '', '0');
INSERT INTO `data_setting` VALUES ('200', '1', '正常发货', '0', '', '1');
INSERT INTO `data_setting` VALUES ('201', '2', '暂缓发货', '0', '', '1');
INSERT INTO `data_setting` VALUES ('202', '3', '当天件', '0', '', '1');
INSERT INTO `data_setting` VALUES ('203', '4', '限时当天件', '0', '', '1');
INSERT INTO `data_setting` VALUES ('204', '5', '暂未出', '0', '', '1');
INSERT INTO `data_setting` VALUES ('205', '6', '已作废', '0', '', '1');
INSERT INTO `data_setting` VALUES ('206', '7', '客户自提', '0', '', '1');
INSERT INTO `data_setting` VALUES ('207', '8', '留货', '0', '', '1');
INSERT INTO `data_setting` VALUES ('208', '9', '寄客户', '0', '', '1');
INSERT INTO `data_setting` VALUES ('209', '10', '业务自提', '0', '', '1');
INSERT INTO `data_setting` VALUES ('210', '1', '斤', '0', '', '5');
INSERT INTO `data_setting` VALUES ('211', '2', '公斤', '0', '', '5');
INSERT INTO `data_setting` VALUES ('212', '3', '件', '0', '', '5');
INSERT INTO `data_setting` VALUES ('213', '4', '片', '0', '', '5');
INSERT INTO `data_setting` VALUES ('214', '5', '台', '0', '', '5');
INSERT INTO `data_setting` VALUES ('215', '6', '箱', '0', '', '5');
INSERT INTO `data_setting` VALUES ('216', '7', '只', '0', '', '5');
INSERT INTO `data_setting` VALUES ('217', '8', '支', '0', '', '5');
INSERT INTO `data_setting` VALUES ('218', '9', '组', '0', '', '5');
INSERT INTO `data_setting` VALUES ('219', '10', '根', '0', '', '5');
INSERT INTO `data_setting` VALUES ('220', '1', 'ABH替换式', '0', '', '6');
INSERT INTO `data_setting` VALUES ('221', '2', 'ABS小径搪刀', '0', '', '6');
INSERT INTO `data_setting` VALUES ('222', '3', 'ABBS精搪头刀杆', '0', '', '6');
INSERT INTO `data_setting` VALUES ('223', '1', 'RMB', '0', '人民币', '7');
INSERT INTO `data_setting` VALUES ('224', '2', 'USD', '0', '美金', '7');
INSERT INTO `data_setting` VALUES ('225', '3', 'EUR', '0', '欧元', '7');
INSERT INTO `data_setting` VALUES ('226', '4', 'CAD', '0', '加币', '7');
INSERT INTO `data_setting` VALUES ('227', '5', 'JPY', '0', '日币', '7');
INSERT INTO `data_setting` VALUES ('228', '1', '中国银行', '0', '大银行（首选）', '4');
INSERT INTO `data_setting` VALUES ('229', '2', '工商银行', '0', '', '4');
INSERT INTO `data_setting` VALUES ('230', '3', '招商银行', '0', '范围广', '4');
INSERT INTO `data_setting` VALUES ('231', '4', '上海银行', '0', '可靠性高', '4');
INSERT INTO `data_setting` VALUES ('232', '1', '一级客户', '0', '', '14');
INSERT INTO `data_setting` VALUES ('233', '2', '二级客户', '0', '', '14');
INSERT INTO `data_setting` VALUES ('234', '3', '普通客户', '0', '', '14');
INSERT INTO `data_setting` VALUES ('235', '4', 'VIP客户', '0', '', '14');
INSERT INTO `data_setting` VALUES ('236', '1', '中国', '0', 'Chain', '28');
INSERT INTO `data_setting` VALUES ('237', '2', '日本', '0', '', '28');
INSERT INTO `data_setting` VALUES ('238', '3', '美国', '0', '', '28');
INSERT INTO `data_setting` VALUES ('239', '4', '印度尼西亚', '0', '', '28');
INSERT INTO `data_setting` VALUES ('240', '5', '新加坡', '0', '', '28');
INSERT INTO `data_setting` VALUES ('241', '6', '瑞士', '0', '', '28');
INSERT INTO `data_setting` VALUES ('242', '7', '荷兰', '0', '', '28');
INSERT INTO `data_setting` VALUES ('243', '1', '供应商', '0', '', '9');
INSERT INTO `data_setting` VALUES ('244', '2', '自制', '0', '', '9');
INSERT INTO `data_setting` VALUES ('245', '1', '加工品', '0', '', '8');
INSERT INTO `data_setting` VALUES ('246', '2', '性质2', '0', '', '8');
INSERT INTO `data_setting` VALUES ('247', '3', '性质3', '0', '', '8');
INSERT INTO `data_setting` VALUES ('248', '1', '中国', '0', '', '17');
INSERT INTO `data_setting` VALUES ('249', '1', '汉族', '0', '', '18');
INSERT INTO `data_setting` VALUES ('250', '1', '人事部', '0', '', '15');
INSERT INTO `data_setting` VALUES ('251', '2', '采购部', '0', '', '15');
INSERT INTO `data_setting` VALUES ('252', '3', '销售部', '0', '', '15');
INSERT INTO `data_setting` VALUES ('253', '4', '财务部', '0', '', '15');
INSERT INTO `data_setting` VALUES ('254', '1', '经理', '0', '', '16');
INSERT INTO `data_setting` VALUES ('255', '2', '副经理', '0', '', '16');
INSERT INTO `data_setting` VALUES ('256', '3', '主管', '0', '', '16');
INSERT INTO `data_setting` VALUES ('257', '4', '组长', '0', '', '16');
INSERT INTO `data_setting` VALUES ('258', '5', '员工', '0', '', '16');
INSERT INTO `data_setting` VALUES ('259', '1', '转账', '0', '', '20');
INSERT INTO `data_setting` VALUES ('260', '2', '现金', '0', '', '20');
INSERT INTO `data_setting` VALUES ('261', '2', '陆家嘴一号仓', '0', '', '29');
INSERT INTO `data_setting` VALUES ('262', '1', '武汉仓', '0', '', '29');
INSERT INTO `data_setting` VALUES ('263', '3', '昆山仓', '0', '', '29');
INSERT INTO `data_setting` VALUES ('264', '1', '快递', '0', '', '30');
INSERT INTO `data_setting` VALUES ('265', '2', '陆运', '0', '', '30');
INSERT INTO `data_setting` VALUES ('266', '3', '空运', '0', '', '30');
INSERT INTO `data_setting` VALUES ('267', '1', '质量问题', '0', '', '19');
INSERT INTO `data_setting` VALUES ('268', '2', '拍错', '0', '', '19');
INSERT INTO `data_setting` VALUES ('269', '3', '个人原因', '0', '', '19');
INSERT INTO `data_setting` VALUES ('270', '1', '目标客户', '0', '', '10');
INSERT INTO `data_setting` VALUES ('271', '2', '潜在客户', '0', '', '10');
INSERT INTO `data_setting` VALUES ('272', '3', '普通客户', '0', '', '10');
INSERT INTO `data_setting` VALUES ('273', '1', '制造业', '0', '', '11');
INSERT INTO `data_setting` VALUES ('274', '2', '纺织业', '0', '', '11');
INSERT INTO `data_setting` VALUES ('275', '3', '化工业', '0', '', '11');
INSERT INTO `data_setting` VALUES ('276', '1', '朋友介绍', '0', '', '13');
INSERT INTO `data_setting` VALUES ('277', '2', '广告', '0', '', '13');
INSERT INTO `data_setting` VALUES ('278', '3', '运营积累', '0', '', '13');
INSERT INTO `data_setting` VALUES ('331', '1', '代码', '0', '', '33');
INSERT INTO `data_setting` VALUES ('332', '2', '数据库', '0', '', '33');
INSERT INTO `data_setting` VALUES ('333', '3', '演讲', '0', '', '33');
INSERT INTO `data_setting` VALUES ('334', '4', '操作', '0', '', '33');
