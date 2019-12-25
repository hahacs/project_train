/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : sanlu

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-12-25 17:08:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `areaid` int(20) NOT NULL AUTO_INCREMENT COMMENT '地区Id',
  `areacode` varchar(50) NOT NULL COMMENT '地区编码',
  `areaname` varchar(20) NOT NULL COMMENT '地区名',
  `level` tinyint(4) DEFAULT '-1' COMMENT '地区级别（1:省份province,2:市city,3:区县district,4:街道street）',
  `citycode` varchar(50) DEFAULT NULL COMMENT '城市编码',
  `center` varchar(50) DEFAULT NULL COMMENT '城市中心点（即：经纬度坐标）',
  `parentid` int(20) DEFAULT '-1' COMMENT '地区父节点',
  PRIMARY KEY (`areaid`),
  KEY `areaCode` (`areacode`),
  KEY `parentId` (`parentid`),
  KEY `level` (`level`),
  KEY `areaName` (`areaname`)
) ENGINE=InnoDB AUTO_INCREMENT=3260 DEFAULT CHARSET=utf8 COMMENT='地区码表';

-- ----------------------------
-- Table structure for basic_unit
-- ----------------------------
DROP TABLE IF EXISTS `basic_unit`;
CREATE TABLE `basic_unit` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `title` varchar(255) DEFAULT '' COMMENT '标题',
  `remarks` varchar(255) DEFAULT '' COMMENT '描述',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for check_order
-- ----------------------------
DROP TABLE IF EXISTS `check_order`;
CREATE TABLE `check_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `checkdate` date DEFAULT NULL COMMENT '制单日期',
  `checkorder` varchar(255) DEFAULT '' COMMENT '申请单号',
  `depotorder` varchar(255) DEFAULT '' COMMENT '部门编号',
  `depotname` varchar(255) DEFAULT '' COMMENT '部门名称',
  `applicantorder` varchar(255) DEFAULT '' COMMENT '申请人编号',
  `applicantname` varchar(255) DEFAULT '' COMMENT '申请人名称',
  `applytype` varchar(255) DEFAULT '' COMMENT '申请人类型',
  `applydes` varchar(255) DEFAULT '' COMMENT '申请人明细',
  `startdate` datetime DEFAULT NULL COMMENT '开始时间',
  `enddate` datetime DEFAULT NULL COMMENT '结束时间',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `createpeople` varchar(255) DEFAULT '' COMMENT '制单人',
  `shpeople` varchar(255) DEFAULT '' COMMENT '审核人',
  `shdate` varchar(255) DEFAULT '' COMMENT '审核日期',
  `updatepeople` varchar(255) DEFAULT '' COMMENT '最后修改人',
  `updatedate` varchar(255) DEFAULT '' COMMENT '最后修改日期',
  `shstatus` int(11) DEFAULT NULL COMMENT '审核状态0、默认未审核 1 、已审核',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for check_stock
-- ----------------------------
DROP TABLE IF EXISTS `check_stock`;
CREATE TABLE `check_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `checkdate` date DEFAULT NULL COMMENT '盘点日期',
  `checkorder` varchar(255) DEFAULT '' COMMENT '盘点单号',
  `depotorder` varchar(255) DEFAULT '' COMMENT '盘点仓库编号',
  `depotname` varchar(255) DEFAULT '' COMMENT '盘点仓库名称',
  `createpeople` varchar(255) DEFAULT '' COMMENT '制单人',
  `shpeople` varchar(255) DEFAULT '' COMMENT '审核人',
  `shdate` varchar(255) DEFAULT '' COMMENT '审核时间',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `shstatus` int(11) DEFAULT '0' COMMENT '审核状态  0、未审核  1、已审核',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='盘库作业';

-- ----------------------------
-- Table structure for check_stock_product
-- ----------------------------
DROP TABLE IF EXISTS `check_stock_product`;
CREATE TABLE `check_stock_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productorder` varchar(255) DEFAULT '' COMMENT '产品编号',
  `productname` varchar(255) DEFAULT '' COMMENT '产品名称',
  `depotorder` varchar(255) DEFAULT '' COMMENT '库位编号',
  `depotname` varchar(255) DEFAULT '' COMMENT '库位名称',
  `depotnum` int(11) DEFAULT '0' COMMENT '库存数量',
  `nownum` int(11) DEFAULT '0' COMMENT '实盘数量',
  `productunit` varchar(255) DEFAULT '' COMMENT '单位',
  `profitandloss` varchar(255) DEFAULT '' COMMENT '盘盈/盘输',
  `productprice` double DEFAULT '0' COMMENT '单价',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `checkid` bigint(20) DEFAULT '0' COMMENT '盘库作业编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='盘库作业产品';

-- ----------------------------
-- Table structure for citys
-- ----------------------------
DROP TABLE IF EXISTS `citys`;
CREATE TABLE `citys` (
  `districts_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号',
  `addr_code` varchar(30) NOT NULL COMMENT '地区编号',
  `addr_name` varchar(512) NOT NULL COMMENT '地区名称',
  `father_code` varchar(30) NOT NULL COMMENT '父编号',
  `type` varchar(2) NOT NULL COMMENT '类型，01：省，02：市，03：区县',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`districts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3657 DEFAULT CHARSET=utf8 COMMENT='区县级数据字典';

-- ----------------------------
-- Table structure for company_basic
-- ----------------------------
DROP TABLE IF EXISTS `company_basic`;
CREATE TABLE `company_basic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `idnum` varchar(255) DEFAULT '' COMMENT '编号',
  `comdes` varchar(255) DEFAULT '' COMMENT '公司简称',
  `comname` varchar(255) DEFAULT '' COMMENT '公司名称',
  `regadd` varchar(255) DEFAULT '' COMMENT '注册地址',
  `country` int(11) DEFAULT '0' COMMENT '国家类型',
  `area` varchar(255) DEFAULT '' COMMENT '地区',
  `postalcode` varchar(255) DEFAULT '' COMMENT '邮政编码',
  `phone` varchar(255) DEFAULT '' COMMENT '电话',
  `fax` varchar(255) DEFAULT '' COMMENT '传真',
  `address` varchar(255) DEFAULT '' COMMENT '送货地址',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `addpeople` varchar(255) DEFAULT '' COMMENT '建档人',
  `adddate` date DEFAULT NULL COMMENT '建档日期',
  `updatepeople` varchar(255) DEFAULT '' COMMENT '最后修改人',
  `updatedate` date DEFAULT NULL COMMENT '最后修改时间',
  `isstop` int(11) DEFAULT '0' COMMENT '是否暂停使用',
  `stopdes` varchar(255) DEFAULT '' COMMENT '暂停描述',
  `openbank` varchar(255) DEFAULT '' COMMENT '开户银行',
  `bankaccount` varchar(255) DEFAULT '' COMMENT '银行账号',
  `taxaccount` varchar(255) DEFAULT '' COMMENT '税务登记号',
  `invoicehead` varchar(255) DEFAULT '' COMMENT '发票抬头',
  `invoiceadd` varchar(255) DEFAULT '' COMMENT '发票地址',
  `comeandgo` int(11) DEFAULT '0' COMMENT '禁止来往',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_code` varchar(255) NOT NULL COMMENT '编号',
  `short_name` varchar(255) DEFAULT NULL COMMENT '简称',
  `name` varchar(255) DEFAULT NULL COMMENT '名字',
  `register_address` varchar(255) DEFAULT NULL COMMENT '注册地址',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `disabling` int(11) DEFAULT NULL,
  `general_customer` tinyint(1) DEFAULT NULL COMMENT '一般客户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_basic
-- ----------------------------
DROP TABLE IF EXISTS `customer_basic`;
CREATE TABLE `customer_basic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户基本资料-基本信息',
  `customer_id` bigint(20) NOT NULL COMMENT '客户id',
  `country_id` bigint(20) DEFAULT NULL COMMENT '国家id',
  `phone` varchar(50) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL COMMENT '结算方式',
  `initial_quota` decimal(10,0) DEFAULT NULL COMMENT '期初额度调整金额',
  `initial_quota_money_type` int(20) DEFAULT NULL COMMENT '期初额度调整金额类型（人民币、美元）',
  `rush_money_date` datetime DEFAULT NULL COMMENT '催款日期',
  `shipping_address` varchar(50) DEFAULT NULL COMMENT '送货地址',
  `shipping_address_remark` varchar(500) DEFAULT NULL COMMENT '送货地址备注',
  `primary_contact` varchar(20) DEFAULT NULL COMMENT '主要联系人',
  `archivist` varchar(20) DEFAULT NULL COMMENT '建档人',
  `last_modifier` varchar(20) DEFAULT NULL COMMENT '最后修改人',
  `establish_date` datetime DEFAULT NULL COMMENT '建立日期',
  `zip_code` varchar(20) DEFAULT NULL COMMENT '邮政编码',
  `fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `credit_line` decimal(10,0) DEFAULT NULL COMMENT '信用额度',
  `credit_line_money_type` int(20) DEFAULT NULL COMMENT '信用额度类型（人民币、美元）',
  `credit_line_remark` varchar(255) DEFAULT NULL COMMENT '授信额度备注',
  `minimum_discount` double DEFAULT NULL COMMENT '最低折扣',
  `contact_number` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `document_date` datetime DEFAULT NULL COMMENT '建档日期',
  `last_modified_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `stop_use` int(11) DEFAULT '0' COMMENT '暂停使用 （1暂停使用）',
  `addtime` datetime DEFAULT NULL COMMENT '系统添加时间',
  PRIMARY KEY (`id`,`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_business_leader
-- ----------------------------
DROP TABLE IF EXISTS `customer_business_leader`;
CREATE TABLE `customer_business_leader` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户基本资料-业务负责人',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `employee_code` varchar(50) DEFAULT NULL COMMENT '员工编号',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `primary_people` varchar(50) DEFAULT NULL COMMENT '主要负责人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_contacts
-- ----------------------------
DROP TABLE IF EXISTS `customer_contacts`;
CREATE TABLE `customer_contacts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户基本资料-联系人',
  `customer_id` bigint(20) NOT NULL COMMENT '客户id',
  `primary_contacts` varchar(50) DEFAULT NULL COMMENT '主要联系人',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `department` varchar(50) DEFAULT NULL COMMENT '部门',
  `position` varchar(50) DEFAULT NULL COMMENT '职务',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `mobile_phone` varchar(20) DEFAULT NULL COMMENT '移动电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_data_maintain
-- ----------------------------
DROP TABLE IF EXISTS `customer_data_maintain`;
CREATE TABLE `customer_data_maintain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户资料维护',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `customer_no` varchar(50) DEFAULT NULL COMMENT '客户编号',
  `customer_no_str` varchar(100) DEFAULT NULL COMMENT '客户编号后面的文本框',
  `create_no` varchar(50) DEFAULT NULL COMMENT '建档编号',
  `customer_name` varchar(20) DEFAULT NULL COMMENT '客户名称',
  `create_date` datetime DEFAULT NULL COMMENT '建档日期',
  `addtime` datetime DEFAULT NULL COMMENT '系统添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_data_maintain_basic
-- ----------------------------
DROP TABLE IF EXISTS `customer_data_maintain_basic`;
CREATE TABLE `customer_data_maintain_basic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户基本资料维护-基本信息',
  `maintain_id` bigint(20) DEFAULT NULL COMMENT '资料维护id',
  `leader_people` varchar(20) DEFAULT NULL COMMENT '负责人',
  `contacts` varchar(20) DEFAULT NULL COMMENT '联系人',
  `fax` varchar(20) DEFAULT NULL COMMENT '传真',
  `delivery_address` varchar(50) DEFAULT NULL COMMENT '送货地址',
  `invoice_address` varchar(50) DEFAULT NULL COMMENT '发票地址',
  `purchase` varchar(20) DEFAULT NULL COMMENT '采购人',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `create_people` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_people_str` varchar(50) DEFAULT NULL COMMENT '创建人后面的文本框',
  `update_people` varchar(20) DEFAULT NULL COMMENT '最后修改人',
  `update_people_str` varchar(50) DEFAULT NULL COMMENT '最后修改人后面的文本框',
  `addtime` datetime DEFAULT NULL COMMENT '系统添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_data_maintain_car
-- ----------------------------
DROP TABLE IF EXISTS `customer_data_maintain_car`;
CREATE TABLE `customer_data_maintain_car` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户资料维护-车床',
  `maintain_id` bigint(20) DEFAULT NULL COMMENT '客户资料维护id',
  `lathe_type` varchar(255) DEFAULT NULL COMMENT '车床类型',
  `brand` varchar(255) DEFAULT NULL COMMENT '厂牌',
  `models` varchar(255) DEFAULT NULL COMMENT '型号',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_data_maintain_info
-- ----------------------------
DROP TABLE IF EXISTS `customer_data_maintain_info`;
CREATE TABLE `customer_data_maintain_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `maintain_id` bigint(20) DEFAULT NULL COMMENT '客户资料id',
  `start_year` varchar(50) DEFAULT NULL COMMENT '创业年度',
  `annual_turnover` varchar(20) DEFAULT NULL COMMENT '年营业额',
  `fax` varchar(20) DEFAULT NULL COMMENT '传真',
  `employee_num` int(11) DEFAULT NULL COMMENT '员工数量',
  `budget` varchar(20) DEFAULT NULL COMMENT '今年预算',
  `industry` varchar(255) DEFAULT NULL COMMENT '工业形态',
  `addtime` datetime DEFAULT NULL COMMENT '系统添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_data_maintain_production
-- ----------------------------
DROP TABLE IF EXISTS `customer_data_maintain_production`;
CREATE TABLE `customer_data_maintain_production` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户资料维护-生产资料',
  `maintain_id` bigint(20) DEFAULT NULL COMMENT '客户资料维护id',
  `production_type` varchar(255) DEFAULT NULL COMMENT '主要生产类别',
  `factory` varchar(255) DEFAULT NULL COMMENT '微型工厂',
  `vendor` varchar(255) DEFAULT NULL COMMENT '上游厂商',
  `addtime` datetime DEFAULT NULL COMMENT '系统添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_data_maintain_question
-- ----------------------------
DROP TABLE IF EXISTS `customer_data_maintain_question`;
CREATE TABLE `customer_data_maintain_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户资料维护-现有问题及意见',
  `maintain_id` bigint(20) DEFAULT NULL COMMENT '客户资料维护id',
  `type` int(11) DEFAULT NULL COMMENT '问题类型（1现有问题、2其他问题）',
  `content` varchar(255) DEFAULT NULL COMMENT '正文',
  `addtime` datetime DEFAULT NULL COMMENT '系统添加时时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_data_maintenance
-- ----------------------------
DROP TABLE IF EXISTS `customer_data_maintenance`;
CREATE TABLE `customer_data_maintenance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户基本资料-资料维护',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `document_no` varchar(255) DEFAULT NULL COMMENT '建档编号',
  `create_date` datetime DEFAULT NULL COMMENT '建档时间',
  `leader_people` varchar(255) DEFAULT NULL COMMENT '负责人',
  `purchase_people` varchar(255) DEFAULT NULL COMMENT '采购人',
  `contact` varchar(255) DEFAULT NULL COMMENT '联络人',
  `telephone` varchar(255) DEFAULT NULL COMMENT '电话',
  `fax` varchar(255) DEFAULT NULL COMMENT '传真',
  `startup_year` datetime DEFAULT NULL COMMENT '创业年度',
  `employee_number` int(11) DEFAULT NULL COMMENT '员工人数',
  `last_year_business` varchar(255) DEFAULT NULL COMMENT '去年营业',
  `year_plan` varchar(255) DEFAULT NULL COMMENT '今年计划',
  `industry` varchar(255) DEFAULT NULL COMMENT '工业形态',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_demand_goods
-- ----------------------------
DROP TABLE IF EXISTS `customer_demand_goods`;
CREATE TABLE `customer_demand_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户需求商品',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `customer_no` varchar(255) DEFAULT NULL COMMENT '客户编号',
  `customer_no_str` varchar(255) DEFAULT NULL COMMENT '客户编号备注',
  `customer_name` varchar(20) DEFAULT NULL COMMENT '客户姓名',
  `create_date` datetime DEFAULT NULL COMMENT '建档日期',
  `create_no` varchar(20) DEFAULT NULL COMMENT '建档编号',
  `customer_type` int(20) DEFAULT NULL COMMENT '客户类别',
  `zip` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  `contacts` bigint(20) DEFAULT NULL COMMENT '联系人（客户基本资料中的联系人id）',
  `phone` bigint(20) DEFAULT NULL COMMENT '联系电话',
  `fax` bigint(20) DEFAULT NULL COMMENT '传真',
  `create_people` varchar(20) DEFAULT NULL COMMENT '创建人',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_demand_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `customer_demand_goods_info`;
CREATE TABLE `customer_demand_goods_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户需求产品-商品需求详情',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `product_no` varchar(50) DEFAULT NULL COMMENT '厂牌编号',
  `product_name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `brand` varchar(50) DEFAULT NULL COMMENT '厂牌',
  `quantity_demand` int(11) DEFAULT NULL COMMENT '需求量',
  `price` decimal(10,0) DEFAULT NULL COMMENT '单价',
  `product_categories` varchar(50) DEFAULT NULL COMMENT '产品大类',
  `product_nature` varchar(50) DEFAULT NULL COMMENT '产品性质',
  `manufacture_method` varchar(50) DEFAULT NULL COMMENT '制作方式',
  `process_method` varchar(50) DEFAULT NULL COMMENT '加工材料',
  `continuity` varchar(50) DEFAULT NULL COMMENT '连续性',
  `cut_oil` varchar(50) DEFAULT NULL COMMENT '切削油',
  `use_amount` int(11) DEFAULT NULL COMMENT '使用量',
  `cut_speed` varchar(50) DEFAULT NULL COMMENT '切削速度',
  `customer_demand_goods_id` bigint(20) DEFAULT NULL COMMENT '客户需求商品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_detail_info
-- ----------------------------
DROP TABLE IF EXISTS `customer_detail_info`;
CREATE TABLE `customer_detail_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户基本资料-详情',
  `customer_id` bigint(20) NOT NULL COMMENT '客户id',
  `customer_category` int(20) DEFAULT NULL COMMENT '客户类别',
  `industry` int(20) DEFAULT NULL COMMENT '行业',
  `customer_source` int(20) DEFAULT NULL COMMENT '客户来源',
  `bank` int(20) DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(20) DEFAULT NULL COMMENT '银行账号',
  `tax_register` varchar(50) DEFAULT NULL COMMENT '税务登记号',
  `area` int(50) DEFAULT NULL COMMENT '所属区域',
  `area_info` varchar(255) DEFAULT NULL COMMENT '所属区域详细',
  `sent_back` tinyint(1) DEFAULT '0' COMMENT '销售单需回传（1需回传）',
  `region` int(50) DEFAULT NULL COMMENT '地区',
  `customer_level` int(50) DEFAULT NULL COMMENT '客户等级',
  `Company_affiliation` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `account_remark` varchar(255) DEFAULT NULL COMMENT '账款备注',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`,`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_production_category
-- ----------------------------
DROP TABLE IF EXISTS `customer_production_category`;
CREATE TABLE `customer_production_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户生产类别',
  `title` varchar(50) DEFAULT NULL COMMENT '生产类别',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `operate` varchar(50) DEFAULT NULL COMMENT '操作人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_shipping_address
-- ----------------------------
DROP TABLE IF EXISTS `customer_shipping_address`;
CREATE TABLE `customer_shipping_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customerid` bigint(20) DEFAULT NULL COMMENT '客户id',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `contact` varchar(50) DEFAULT NULL COMMENT '联系人',
  `setting` tinyint(1) DEFAULT '0' COMMENT '设置默认',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_source
-- ----------------------------
DROP TABLE IF EXISTS `customer_source`;
CREATE TABLE `customer_source` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户来源',
  `title` varchar(50) DEFAULT NULL COMMENT '客户来源名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8 COMMENT='资料设定';

-- ----------------------------
-- Table structure for department_basic
-- ----------------------------
DROP TABLE IF EXISTS `department_basic`;
CREATE TABLE `department_basic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idnum` varchar(255) DEFAULT '' COMMENT '编号',
  `depname` varchar(255) DEFAULT '' COMMENT '部门名称',
  `parentid` bigint(20) DEFAULT '0' COMMENT '隶属部门',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `addpeople` varchar(255) DEFAULT '' COMMENT '建档人',
  `adddate` date DEFAULT NULL COMMENT '建档时间',
  `updatepeople` varchar(255) DEFAULT '' COMMENT '最后修改人',
  `updatedate` date DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for depot_basic
-- ----------------------------
DROP TABLE IF EXISTS `depot_basic`;
CREATE TABLE `depot_basic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isnum` varchar(255) DEFAULT '' COMMENT '编号',
  `depname` varchar(255) DEFAULT '' COMMENT '仓库名称',
  `depfloor` varchar(255) DEFAULT '' COMMENT '楼层',
  `parentid` bigint(20) DEFAULT '0' COMMENT '隶属仓库',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `addpeople` varchar(255) DEFAULT '' COMMENT '建档人',
  `adddate` date DEFAULT NULL COMMENT '建档日期',
  `updatepeople` varchar(255) DEFAULT '' COMMENT '最后更新人',
  `updatedate` date DEFAULT NULL COMMENT '最后修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for employee_basic
-- ----------------------------
DROP TABLE IF EXISTS `employee_basic`;
CREATE TABLE `employee_basic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `idnum` varchar(255) DEFAULT '' COMMENT '员工编号',
  `jobnum` varchar(255) DEFAULT '' COMMENT '员工工号',
  `empname` varchar(255) DEFAULT '' COMMENT '员工姓名',
  `empsex` int(11) DEFAULT '1' COMMENT '员工性别1、男  2、女',
  `empcard` varchar(255) DEFAULT '' COMMENT '员工身份证',
  `englishname` varchar(255) DEFAULT '' COMMENT '英文名称',
  `country` int(11) DEFAULT '1' COMMENT '国家',
  `area` varchar(255) DEFAULT '' COMMENT '城市',
  `passportnum` varchar(255) DEFAULT '' COMMENT '护照编号',
  `birthplace` int(11) DEFAULT '0' COMMENT '出生地',
  `nation` int(11) DEFAULT '1' COMMENT '民族',
  `marital` int(11) DEFAULT '1' COMMENT '婚姻状态',
  `phone` varchar(255) DEFAULT '' COMMENT '联系电话',
  `address` varchar(255) DEFAULT '' COMMENT '地址',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `email` varchar(255) DEFAULT '' COMMENT '邮箱',
  `addpeople` varchar(255) DEFAULT '' COMMENT '建档人',
  `adddate` date DEFAULT NULL COMMENT '建档日期',
  `updatepeople` varchar(255) DEFAULT '' COMMENT '最后修改人',
  `updatedate` date DEFAULT NULL COMMENT '最后修改日期',
  `isstop` int(11) DEFAULT '0' COMMENT '暂停使用',
  `stopdes` varchar(255) DEFAULT '' COMMENT '暂停描述',
  `department` bigint(20) DEFAULT '1' COMMENT '部门编号',
  `duty` int(11) DEFAULT '1' COMMENT '职位',
  `usedate` int(11) DEFAULT '0' COMMENT '使用时长',
  `comedate` date DEFAULT NULL COMMENT '到职日期',
  `okdate` date DEFAULT NULL COMMENT '转正日期',
  `dutystatus` int(11) DEFAULT '1' COMMENT '任职状态',
  `outdate` varchar(255) DEFAULT NULL COMMENT '停职日期',
  `checknum` varchar(255) DEFAULT '' COMMENT '考勤卡号',
  `subsdiy` double DEFAULT '0' COMMENT '职位津贴',
  `grade` int(11) DEFAULT '0' COMMENT '工资等级',
  `insurance` int(11) DEFAULT '0' COMMENT '缴纳保险',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for express_collect
-- ----------------------------
DROP TABLE IF EXISTS `express_collect`;
CREATE TABLE `express_collect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `collectdate` date DEFAULT NULL COMMENT '收件日期',
  `collectorder` varchar(255) DEFAULT '' COMMENT '快递单号',
  `seeorder` varchar(255) DEFAULT '' COMMENT '入库参考单据',
  `stockorder` varchar(255) DEFAULT '' COMMENT '入库单号',
  `company` varchar(255) DEFAULT '' COMMENT '快递公司',
  `name` varchar(255) DEFAULT '' COMMENT '寄件人名称',
  `address` varchar(255) DEFAULT '' COMMENT '寄件人地址',
  `freighttype` int(11) DEFAULT '0' COMMENT '本次运费类型',
  `freightprice` double DEFAULT '0' COMMENT '本次运费',
  `ispay` int(11) DEFAULT '0' COMMENT '是否制定时已付 0、未付  1、已付',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `createpeople` varchar(255) DEFAULT '' COMMENT '建档人',
  `createdate` varchar(255) DEFAULT '' COMMENT '建档日期',
  `updatepeople` varchar(255) DEFAULT '' COMMENT '最后修改人',
  `updatedate` varchar(255) DEFAULT '' COMMENT '最后修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='快递收件\r\n';

-- ----------------------------
-- Table structure for express_mail
-- ----------------------------
DROP TABLE IF EXISTS `express_mail`;
CREATE TABLE `express_mail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `maildate` date DEFAULT NULL COMMENT '寄件日期',
  `mailorder` varchar(255) DEFAULT '' COMMENT '快递单号',
  `company` varchar(255) DEFAULT '' COMMENT '快递公司',
  `mailnum` int(11) DEFAULT NULL COMMENT '数量(件数)',
  `mailweight` double DEFAULT '0' COMMENT '重量(KG)',
  `contenttype` int(11) DEFAULT '0' COMMENT '寄托内容',
  `content` varchar(255) DEFAULT '' COMMENT '内容',
  `paymethodtype` int(11) DEFAULT '0' COMMENT '支付方式',
  `paymethod` varchar(255) DEFAULT '' COMMENT '支付方法',
  `freighttype` int(11) DEFAULT '0' COMMENT '本次运费类型',
  `freightprice` double DEFAULT '0' COMMENT '本次运费',
  `ispay` int(11) DEFAULT '0' COMMENT '是否制单时已付',
  `ismonth` int(11) DEFAULT '0' COMMENT '是否月付',
  `account` varchar(255) DEFAULT '' COMMENT '账号',
  `ensure` double DEFAULT '0' COMMENT '保洁费',
  `ensurepoint` double DEFAULT '0' COMMENT '保洁费',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `createpeople` varchar(255) DEFAULT '' COMMENT '建档人',
  `createdate` varchar(255) DEFAULT '' COMMENT '建档日期',
  `updatepeople` varchar(255) NOT NULL DEFAULT '' COMMENT '最后更新人',
  `updatedate` varchar(255) DEFAULT '' COMMENT '最后更新日期',
  `shpeople` varchar(255) DEFAULT '' COMMENT '审核人',
  `shdate` varchar(255) DEFAULT '' COMMENT '审核日期',
  `shstatus` int(11) DEFAULT '0' COMMENT '审核状态',
  `mailid` varchar(255) DEFAULT '' COMMENT '寄件公司编号',
  `mailcompany` varchar(255) DEFAULT '' COMMENT '寄件公司',
  `mailprovince` varchar(255) DEFAULT '' COMMENT '寄件公司省',
  `mailcity` varchar(255) DEFAULT '' COMMENT '寄件公司市',
  `mailarea` varchar(255) DEFAULT '' COMMENT '寄件公司区',
  `mailaddress` varchar(255) DEFAULT '' COMMENT '寄件公司地址',
  `mailpeople` varchar(255) DEFAULT '' COMMENT '寄件人',
  `mailphone` varchar(255) DEFAULT '' COMMENT '寄件人联系方式',
  `collectid` varchar(255) DEFAULT '' COMMENT '客户编号',
  `collectdes` varchar(255) DEFAULT '' COMMENT '客户名称',
  `collectcompany` varchar(255) DEFAULT '' COMMENT '收件公司',
  `collectprovince` varchar(255) DEFAULT '' COMMENT '收件省',
  `collectcity` varchar(255) DEFAULT '' COMMENT '收件市',
  `collectarea` varchar(255) DEFAULT '' COMMENT '收件区',
  `collectaddress` varchar(255) DEFAULT '' COMMENT '收件地址',
  `collectpeople` varchar(255) DEFAULT '' COMMENT '收件人',
  `collectphone` varchar(255) DEFAULT '' COMMENT '联络方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='快递寄件';

-- ----------------------------
-- Table structure for force_order
-- ----------------------------
DROP TABLE IF EXISTS `force_order`;
CREATE TABLE `force_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchaseorder` varchar(255) DEFAULT '' COMMENT '采购订单',
  `purchasedate` date DEFAULT NULL COMMENT '订单日期',
  `planorder` varchar(255) DEFAULT '' COMMENT '订货单号',
  `comedate` date DEFAULT NULL COMMENT '预计到货日期',
  `suppliernum` varchar(255) DEFAULT '' COMMENT '供应商编号',
  `suppliername` varchar(255) DEFAULT '' COMMENT '供应商名称',
  `shpeople` varchar(255) DEFAULT '' COMMENT '审核人',
  `shdate` varchar(255) DEFAULT '' COMMENT '审核时间',
  `remarks` varchar(255) DEFAULT '' COMMENT '结案备注',
  `isdel` int(11) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='强制结案';

-- ----------------------------
-- Table structure for force_product
-- ----------------------------
DROP TABLE IF EXISTS `force_product`;
CREATE TABLE `force_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `forceid` bigint(20) DEFAULT '0' COMMENT '强制结案编号',
  `pronum` varchar(255) DEFAULT '' COMMENT '产品编号',
  `proname` varchar(255) DEFAULT '' COMMENT '产品名称',
  `ordernum` int(11) DEFAULT '0' COMMENT '订单数量',
  `forcenum` int(11) DEFAULT '0' COMMENT '强制结案数量',
  `forcedate` varchar(255) DEFAULT '' COMMENT '强制结案日期',
  `forceover` int(11) DEFAULT '0' COMMENT '已强制结案',
  `stockover` int(11) DEFAULT '0' COMMENT '已入库',
  `ontheway` int(11) DEFAULT '0' COMMENT '在途数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='强制结案--采购产品';

-- ----------------------------
-- Table structure for industry
-- ----------------------------
DROP TABLE IF EXISTS `industry`;
CREATE TABLE `industry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '行业',
  `title` varchar(50) DEFAULT NULL COMMENT '行业名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inquiry_description
-- ----------------------------
DROP TABLE IF EXISTS `inquiry_description`;
CREATE TABLE `inquiry_description` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `des` varchar(255) DEFAULT '' COMMENT '描述和说明',
  `inquiryid` bigint(20) DEFAULT '0' COMMENT '询价单编号',
  `type` int(11) DEFAULT '1' COMMENT '1、备注及说明   2、报表备注(打印至报表) 默认为1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inquiry_order
-- ----------------------------
DROP TABLE IF EXISTS `inquiry_order`;
CREATE TABLE `inquiry_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdate` date DEFAULT NULL COMMENT '制单日期',
  `orders` varchar(255) DEFAULT '' COMMENT '询价单号',
  `suppliernum` varchar(255) DEFAULT '' COMMENT '订单编号',
  `suppliername` varchar(255) DEFAULT '' COMMENT '供应商简称',
  `taxs` int(11) DEFAULT '0' COMMENT '税别',
  `currencys` int(11) DEFAULT '0' COMMENT '币别',
  `replydate` date DEFAULT NULL COMMENT '回复日期',
  `validdate` date DEFAULT NULL COMMENT '有效日期',
  `purpeopletype` int(11) DEFAULT '0' COMMENT '采购负责人类型',
  `purpeople` varchar(255) DEFAULT '' COMMENT '采购负责人',
  `createpeople` varchar(255) DEFAULT '' COMMENT '制单人',
  `shpeople` varchar(255) DEFAULT '' COMMENT '审核人',
  `shdate` varchar(255) DEFAULT '' COMMENT '审核日期',
  `updatepeople` varchar(255) DEFAULT '' COMMENT '最后修改人',
  `updatedate` varchar(255) DEFAULT '' COMMENT '最后修改日期',
  `supplierinfo` varchar(255) DEFAULT '' COMMENT '供应商名称',
  `supplierconcat` varchar(255) DEFAULT '' COMMENT '供应商联系人',
  `supplierphone` varchar(255) DEFAULT '' COMMENT '联系电话',
  `supplierfax` varchar(255) DEFAULT '' COMMENT '供应商传真',
  `supplieraddress` varchar(255) DEFAULT '' COMMENT '供应商默认地址',
  `shstatus` int(11) DEFAULT '0' COMMENT '是否审核',
  `isdel` int(11) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='询价单';

-- ----------------------------
-- Table structure for inquiry_product
-- ----------------------------
DROP TABLE IF EXISTS `inquiry_product`;
CREATE TABLE `inquiry_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proisnum` varchar(255) DEFAULT '' COMMENT '产品编号',
  `proname` varchar(255) DEFAULT '' COMMENT '产品名称',
  `protype` varchar(255) DEFAULT '' COMMENT '品类',
  `pronum` int(11) DEFAULT '0' COMMENT '产品数量',
  `prounit` varchar(255) DEFAULT '' COMMENT '产品单位',
  `proprice` double DEFAULT '0' COMMENT '产品价格',
  `totalprice` double DEFAULT '0' COMMENT '金额',
  `proremark` varchar(255) DEFAULT '' COMMENT '备注',
  `inquiryid` bigint(20) DEFAULT '0' COMMENT '询价单编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='询价产品';

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '发票明细',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户编号',
  `usual` varchar(255) DEFAULT NULL COMMENT '常用',
  `title` varchar(100) DEFAULT NULL COMMENT '发票抬头',
  `address` varchar(255) DEFAULT NULL COMMENT '发票地址',
  `phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `contact` varchar(50) DEFAULT NULL COMMENT '联络人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_basic
-- ----------------------------
DROP TABLE IF EXISTS `product_basic`;
CREATE TABLE `product_basic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isnum` varchar(255) DEFAULT '' COMMENT '编号',
  `proname` varchar(255) DEFAULT '' COMMENT '产品名称',
  `pronum` varchar(255) DEFAULT '' COMMENT '产品条码',
  `invoicenum` varchar(255) DEFAULT '' COMMENT '发票品名',
  `basicunit` bigint(20) DEFAULT '1' COMMENT '基本单位',
  `protype` bigint(20) DEFAULT '1' COMMENT '产品大类',
  `normpricetype` bigint(20) DEFAULT '1' COMMENT '标准售价类型',
  `normprice` double DEFAULT '0' COMMENT '标准售价',
  `lowpricetype` bigint(20) DEFAULT '1' COMMENT '最低售价类型',
  `lowprice` double DEFAULT '0' COMMENT '最低售价',
  `pronature` bigint(20) DEFAULT '1' COMMENT '产品性质',
  `prosource` bigint(20) DEFAULT '1' COMMENT '产品来源',
  `packnum` int(11) DEFAULT '0' COMMENT '包装数量',
  `minnum` int(11) DEFAULT '0' COMMENT '最小起订数',
  `businesstype` bigint(20) DEFAULT '1' COMMENT '负责业务类型',
  `business` varchar(255) DEFAULT '' COMMENT '负责业务',
  `purchasetype` bigint(20) DEFAULT '1' COMMENT '负责采购类型',
  `purchase` varchar(255) DEFAULT '' COMMENT '负责采购',
  `maxstock` int(11) DEFAULT '0' COMMENT '最大库存量',
  `safetystock` int(11) DEFAULT '0' COMMENT '安全库存量',
  `inventoryplace` varchar(255) DEFAULT '' COMMENT '库位',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `addpeople` varchar(255) DEFAULT '' COMMENT '建档人',
  `adddate` date DEFAULT NULL COMMENT '建档日期',
  `updatepeople` varchar(255) DEFAULT '' COMMENT '最后修改人',
  `updatedate` date DEFAULT NULL COMMENT '最后修改日期',
  `costtype` bigint(20) DEFAULT '1' COMMENT '成本类型',
  `cost` double DEFAULT '0' COMMENT '成本',
  `isstop` int(11) DEFAULT '0' COMMENT '暂停使用',
  `stopdes` varchar(255) DEFAULT '' COMMENT '暂停描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_details
-- ----------------------------
DROP TABLE IF EXISTS `product_details`;
CREATE TABLE `product_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proid` bigint(20) DEFAULT '0' COMMENT '产品id',
  `declares` varchar(255) DEFAULT '' COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_stock
-- ----------------------------
DROP TABLE IF EXISTS `product_stock`;
CREATE TABLE `product_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productorder` varchar(255) DEFAULT '' COMMENT '产品编号',
  `productname` varchar(255) DEFAULT '' COMMENT '产品名称',
  `usablenum` int(11) DEFAULT '0' COMMENT '可用数量',
  `stocknum` int(11) DEFAULT '0' COMMENT '库存数量',
  `onthewaynum` int(11) DEFAULT '0' COMMENT '在途数量',
  `salenum` int(11) DEFAULT '0' COMMENT '销售未出',
  `backnum` int(11) DEFAULT '0' COMMENT '销退未入',
  `purchasenum` int(11) DEFAULT '0' COMMENT '采购未入',
  `parprice` double DEFAULT '0' COMMENT '标准售价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='产评库存表';

-- ----------------------------
-- Table structure for product_supplier
-- ----------------------------
DROP TABLE IF EXISTS `product_supplier`;
CREATE TABLE `product_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proid` bigint(20) DEFAULT '0' COMMENT '产品id',
  `supplierid` varchar(255) DEFAULT '' COMMENT '供应商编号',
  `supdes` varchar(255) DEFAULT '' COMMENT '供应商简称',
  `supply` varchar(255) DEFAULT '' COMMENT '主要供应',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `title` varchar(255) DEFAULT '' COMMENT '标题',
  `remarks` varchar(255) DEFAULT '' COMMENT '描述',
  `parent` int(11) DEFAULT '0' COMMENT '父级id',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for purchase_orders
-- ----------------------------
DROP TABLE IF EXISTS `purchase_orders`;
CREATE TABLE `purchase_orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdate` date DEFAULT NULL COMMENT '制单日期',
  `orders` varchar(255) DEFAULT '' COMMENT '采购单号',
  `suppliernum` varchar(255) DEFAULT '' COMMENT '供应商编号',
  `supplierdes` varchar(255) DEFAULT '' COMMENT '供应商简称',
  `warehouseid` varchar(255) DEFAULT '' COMMENT '产库编号',
  `warehousename` varchar(255) DEFAULT '' COMMENT '产库名称',
  `seeorders` varchar(255) DEFAULT '' COMMENT '参考单号',
  `comedate` date DEFAULT NULL COMMENT '到货日期',
  `ptax` int(11) DEFAULT '0' COMMENT '税别',
  `pcurrency` int(11) DEFAULT '0' COMMENT '币别',
  `purpeopletype` int(11) DEFAULT '0' COMMENT '采购负责类型',
  `purpeople` varchar(255) DEFAULT '' COMMENT '采购人',
  `createpeople` varchar(255) DEFAULT '' COMMENT '制单人',
  `shpeople` varchar(255) DEFAULT '' COMMENT '审核人',
  `shdate` varchar(255) DEFAULT '' COMMENT '审核日期',
  `updatepeople` varchar(255) DEFAULT '' COMMENT '最后修改人',
  `updatedate` varchar(255) DEFAULT '' COMMENT '最后修改日期',
  `suppliername` varchar(255) DEFAULT '' COMMENT '供应商名称',
  `supplierconcat` varchar(255) DEFAULT '' COMMENT '联系人',
  `supplierphone` varchar(255) DEFAULT '' COMMENT '电话',
  `supplierfax` varchar(255) DEFAULT '' COMMENT '传真',
  `supplieraddress` varchar(255) DEFAULT '' COMMENT '地址',
  `shstatus` int(11) DEFAULT '0' COMMENT '是否审核',
  `orderstatus` int(11) DEFAULT '0' COMMENT '订单状态 0、进行中 1、已完结',
  `isdel` int(11) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='采购订单';

-- ----------------------------
-- Table structure for purchase_product
-- ----------------------------
DROP TABLE IF EXISTS `purchase_product`;
CREATE TABLE `purchase_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sourseorder` varchar(255) DEFAULT '' COMMENT '来源单据',
  `orders` varchar(255) DEFAULT '' COMMENT '单据编号',
  `sort` int(11) DEFAULT '0' COMMENT '序号',
  `proorders` varchar(255) DEFAULT '' COMMENT '产品编号',
  `proname` varchar(255) DEFAULT '' COMMENT '产品名称',
  `supname` varchar(255) DEFAULT '' COMMENT '供应商名称',
  `num` int(11) DEFAULT '0' COMMENT '数量',
  `unit` varchar(255) DEFAULT '' COMMENT '单位',
  `price` double DEFAULT '0' COMMENT '单价',
  `totalprice` double DEFAULT '0' COMMENT '金额',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `forcenum` int(11) DEFAULT '0' COMMENT '已强制结案数量',
  `stockover` int(11) DEFAULT '0' COMMENT '已入库数量',
  `ontheway` int(11) DEFAULT '0' COMMENT '在途数量',
  `forcedate` varchar(255) DEFAULT '' COMMENT '强制结案日期',
  `purchaseid` bigint(20) DEFAULT '0' COMMENT '采购订单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for purchase_stock
-- ----------------------------
DROP TABLE IF EXISTS `purchase_stock`;
CREATE TABLE `purchase_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdate` date DEFAULT NULL COMMENT '制单日期',
  `stockorder` varchar(255) DEFAULT '' COMMENT '入库单号',
  `depotnum` varchar(255) DEFAULT '' COMMENT '入库仓库编号',
  `depotname` varchar(255) DEFAULT '' COMMENT '入库仓库名称',
  `depotfloor` varchar(255) DEFAULT '' COMMENT '入库仓库楼层',
  `suppliernum` varchar(255) DEFAULT '' COMMENT '供应商编号',
  `suppliername` varchar(255) DEFAULT '' COMMENT '供应商名称',
  `boxnum` varchar(255) DEFAULT '' COMMENT '装箱单号',
  `inspectnum` varchar(255) DEFAULT '' COMMENT '质检人编号',
  `inspectname` varchar(255) DEFAULT '' COMMENT '质检人名称',
  `createname` varchar(255) DEFAULT '' COMMENT '制单人',
  `shpeople` varchar(255) DEFAULT '' COMMENT '审核人',
  `shdate` varchar(255) DEFAULT '' COMMENT '审核日期',
  `updatepeople` varchar(255) DEFAULT '' COMMENT '最后修改人',
  `updatedate` varchar(255) DEFAULT '' COMMENT '最后修改日期',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `shstatus` int(11) DEFAULT '0' COMMENT '审核状态  0 、 默认   1、已审核',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for purchase_stock_product
-- ----------------------------
DROP TABLE IF EXISTS `purchase_stock_product`;
CREATE TABLE `purchase_stock_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sourseorder` varchar(255) DEFAULT '' COMMENT '来源单据',
  `orders` varchar(255) DEFAULT '' COMMENT '单号',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `seeorder` varchar(255) DEFAULT '' COMMENT '参考单号',
  `pronum` varchar(255) DEFAULT '' COMMENT '产品名称',
  `proname` varchar(255) DEFAULT '' COMMENT '产品名称',
  `stocknum` int(11) DEFAULT '0' COMMENT '入库数量',
  `units` varchar(255) DEFAULT '' COMMENT '单位',
  `depotnum` varchar(255) DEFAULT '' COMMENT '产库编号',
  `depotname` varchar(255) DEFAULT '' COMMENT '仓库名称',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `purchasestockid` bigint(20) DEFAULT '0' COMMENT '入库单编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for region_basic
-- ----------------------------
DROP TABLE IF EXISTS `region_basic`;
CREATE TABLE `region_basic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isnum` varchar(255) DEFAULT '' COMMENT '区域编码',
  `area` varchar(255) DEFAULT '' COMMENT '区域设定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for region_employee
-- ----------------------------
DROP TABLE IF EXISTS `region_employee`;
CREATE TABLE `region_employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `regionid` bigint(20) DEFAULT '0' COMMENT '区域编号',
  `empisnum` varchar(255) DEFAULT '' COMMENT '员工编号',
  `empname` varchar(255) DEFAULT '' COMMENT '员工姓名',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for remark
-- ----------------------------
DROP TABLE IF EXISTS `remark`;
CREATE TABLE `remark` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '备注及说明',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注及说明',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `typeid` int(11) DEFAULT NULL COMMENT '类型（1、客户基本资料，2、报价单，3、订货单，4、销货单，5、销货出库单）',
  `otherid` bigint(20) DEFAULT NULL COMMENT '外键id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for report_remark
-- ----------------------------
DROP TABLE IF EXISTS `report_remark`;
CREATE TABLE `report_remark` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '报表备注',
  `content` varchar(500) DEFAULT NULL COMMENT '正文',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `typeid` int(11) DEFAULT NULL COMMENT '类型（1、报价单，2、订货单，3、销货单，4、销货出库单）',
  `otherid` bigint(20) DEFAULT NULL COMMENT '外键id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sale_goods
-- ----------------------------
DROP TABLE IF EXISTS `sale_goods`;
CREATE TABLE `sale_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '销售-销货单',
  `create_date` datetime DEFAULT NULL COMMENT '制单日期',
  `sale_no` varchar(255) DEFAULT NULL COMMENT '销售单号',
  `warehouse_out` int(11) DEFAULT NULL COMMENT '出货仓库',
  `warehouse_out_str` varchar(255) DEFAULT NULL COMMENT '出货仓库描述',
  `warehouse_position` int(11) DEFAULT NULL COMMENT '仓库位置',
  `warehouse_position_str` varchar(255) DEFAULT NULL COMMENT '仓库位置描述',
  `customer_no` varchar(50) DEFAULT NULL COMMENT '客户编号',
  `customer_no_str` varchar(255) DEFAULT NULL COMMENT '客户编号描述',
  `customer_order_no` varchar(50) DEFAULT NULL COMMENT '客户订单号',
  `special_order` tinyint(1) DEFAULT NULL COMMENT '特批单',
  `special_price_order` tinyint(1) DEFAULT NULL COMMENT '特价单',
  `invalid` tinyint(1) DEFAULT NULL COMMENT '单据作废',
  `tax` varchar(20) DEFAULT NULL COMMENT '税别',
  `currency` int(11) DEFAULT NULL COMMENT '币别',
  `discount` varchar(20) DEFAULT NULL COMMENT '折扣',
  `customer_category` varchar(50) DEFAULT NULL COMMENT '客户类别',
  `sale_receivable` decimal(10,2) DEFAULT NULL COMMENT '销售应收',
  `business_leader` varchar(255) DEFAULT NULL COMMENT '业务负责',
  `business_leader_str` varchar(255) DEFAULT NULL COMMENT '业务负责描述',
  `payment` int(11) DEFAULT NULL COMMENT '支付方式',
  `made_people` varchar(50) DEFAULT NULL COMMENT '制单人',
  `delivery_status` int(11) DEFAULT NULL COMMENT '发货状态',
  `carry_method` int(11) DEFAULT NULL COMMENT '运输方式',
  `carry_method_str` varchar(255) DEFAULT NULL COMMENT '快递或运输公司',
  `weight` double DEFAULT NULL COMMENT '重量（kg）',
  `last_update` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  `last_update_str` varchar(100) DEFAULT NULL COMMENT '最后修改人描述',
  `audit` varchar(50) DEFAULT NULL COMMENT '审核人',
  `audit_str` varchar(100) DEFAULT NULL COMMENT '审核人描述',
  `customer_name` varchar(50) DEFAULT NULL COMMENT '客户姓名',
  `zip` varchar(20) DEFAULT NULL COMMENT '邮政编码',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT '送货地址',
  `invoice_title` varchar(50) DEFAULT NULL COMMENT '发票抬头',
  `invoice_address` varchar(255) DEFAULT NULL COMMENT '发票地址',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `order_audit` tinyint(1) DEFAULT '0' COMMENT '单据审核状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sale_goods_product
-- ----------------------------
DROP TABLE IF EXISTS `sale_goods_product`;
CREATE TABLE `sale_goods_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '销售-销货单-销货产品',
  `sale_goods_id` bigint(20) DEFAULT NULL COMMENT '销货单id',
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `product_name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `category` varchar(20) DEFAULT NULL COMMENT '分类',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `unit` varchar(20) DEFAULT NULL COMMENT '单位',
  `pricing` decimal(10,2) DEFAULT NULL COMMENT '定价',
  `discount` double(10,2) DEFAULT NULL COMMENT '折扣',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `warehouse_position` varchar(20) DEFAULT NULL COMMENT '库位',
  `floor` varchar(20) DEFAULT NULL COMMENT '楼层',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `outbound_num` int(11) DEFAULT NULL COMMENT '出库数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sale_offer_product
-- ----------------------------
DROP TABLE IF EXISTS `sale_offer_product`;
CREATE TABLE `sale_offer_product` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '销售-报价产品',
  `quotation_id` bigint(20) DEFAULT NULL,
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `product_name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `category` varchar(50) DEFAULT NULL COMMENT '品类',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `unit` varchar(50) DEFAULT NULL COMMENT '单位',
  `pricing` decimal(10,2) DEFAULT NULL COMMENT '定价',
  `discount` varchar(50) DEFAULT NULL COMMENT '折扣',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `userid` bigint(20) DEFAULT NULL COMMENT '添加用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sale_online_order
-- ----------------------------
DROP TABLE IF EXISTS `sale_online_order`;
CREATE TABLE `sale_online_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '销售-网上订单',
  `order_date` datetime DEFAULT NULL COMMENT '订货日期',
  `customer_no` varchar(255) DEFAULT NULL COMMENT '客户编号',
  `order_remark` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `order_no` varchar(255) DEFAULT NULL COMMENT '订货编号',
  `customer_no_str` varchar(255) DEFAULT NULL COMMENT '客户编号备注',
  `order_people` varchar(255) DEFAULT NULL COMMENT '订货人',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系人',
  `zip` varchar(255) DEFAULT NULL COMMENT '邮政编码',
  `invoice_title` varchar(255) DEFAULT NULL COMMENT '发票抬头',
  `invoice_address` varchar(255) DEFAULT NULL COMMENT '发票地址',
  `audit` varchar(255) DEFAULT NULL COMMENT '审核',
  `update_last` varchar(255) DEFAULT NULL COMMENT '最后修改人',
  `invalid_people` varchar(255) DEFAULT NULL COMMENT '作废人',
  `base_remark` varchar(255) DEFAULT NULL COMMENT '基本资料备注',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `fax` varchar(255) DEFAULT NULL COMMENT '传真',
  `delivery_address` varchar(255) DEFAULT NULL COMMENT '送货地址',
  `audit_str` varchar(255) DEFAULT NULL COMMENT '审核备注',
  `update_last_str` varchar(255) DEFAULT NULL COMMENT '最后修改人备注',
  `invalid_people_str` varchar(255) DEFAULT NULL COMMENT '作废人备注',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `invalid` tinyint(1) DEFAULT NULL COMMENT '作废',
  `order_audit` tinyint(1) DEFAULT '0' COMMENT '单据审核状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sale_online_order_product
-- ----------------------------
DROP TABLE IF EXISTS `sale_online_order_product`;
CREATE TABLE `sale_online_order_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '销售-网上订单-订货产品',
  `online_order_id` bigint(20) DEFAULT NULL COMMENT '网上订单id',
  `customer_no` varchar(11) DEFAULT NULL COMMENT '客户编号',
  `product_no` varchar(255) DEFAULT NULL COMMENT '产品编号',
  `product_name` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `category` varchar(255) DEFAULT NULL COMMENT '品类',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `unit` varchar(255) DEFAULT NULL COMMENT '单位',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `usable_num` int(11) DEFAULT NULL COMMENT '可用数量',
  `ifstock` tinyint(1) DEFAULT NULL COMMENT '是否有货',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sale_purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `sale_purchase_order`;
CREATE TABLE `sale_purchase_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '销售-订货单',
  `create_date` datetime DEFAULT NULL COMMENT '制单日期',
  `order_no` varchar(50) DEFAULT NULL COMMENT '订货单号',
  `customer_no` varchar(50) DEFAULT NULL COMMENT '客户编号',
  `warehouse_out` int(11) DEFAULT NULL COMMENT '出货仓库',
  `customer_no_str` varchar(255) DEFAULT NULL COMMENT '客户编号备注',
  `customer_order_no` varchar(255) DEFAULT NULL COMMENT '客户订单号',
  `special_order` tinyint(1) DEFAULT NULL COMMENT '特价单',
  `tax` varchar(50) DEFAULT NULL COMMENT '税别',
  `currency` int(11) DEFAULT NULL COMMENT '币别',
  `discount` varchar(50) DEFAULT NULL COMMENT '折扣',
  `invalid` tinyint(1) DEFAULT NULL COMMENT '作废',
  `customer_category` varchar(255) DEFAULT NULL COMMENT '客户类别',
  `receivable_balance` decimal(10,0) DEFAULT NULL COMMENT '应收余额',
  `business_leader` varchar(255) DEFAULT NULL COMMENT '业务负责',
  `business_leader_str` varchar(255) DEFAULT NULL COMMENT '业务负责备注',
  `payment_method` int(11) DEFAULT NULL COMMENT '结算方式',
  `made_people` varchar(255) DEFAULT NULL COMMENT '制单人',
  `audit_people` varchar(255) DEFAULT NULL COMMENT '审核人',
  `audit_people_str` varchar(255) DEFAULT NULL COMMENT '审核人备注',
  `last_update` varchar(20) DEFAULT NULL COMMENT '最后修改人',
  `last_update_str` varchar(255) DEFAULT NULL COMMENT '最后修改人备注',
  `customer_name` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `zip` varchar(20) DEFAULT NULL COMMENT '邮政编码',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `fax` varchar(20) DEFAULT NULL COMMENT '传真',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT '送货地址',
  `invoice_title` varchar(100) DEFAULT NULL COMMENT '发票抬头',
  `invoice_address` varchar(255) DEFAULT NULL COMMENT '发票地址',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `warehouse_out_str` varchar(255) DEFAULT NULL COMMENT '出货仓库备注',
  `order_audit` tinyint(1) DEFAULT '0' COMMENT '订单审核状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sale_purchase_order_product
-- ----------------------------
DROP TABLE IF EXISTS `sale_purchase_order_product`;
CREATE TABLE `sale_purchase_order_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '销售-订货单-订货产品',
  `purchase_order_id` bigint(20) DEFAULT NULL COMMENT '订货单id',
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `product_name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `category` varchar(50) DEFAULT NULL COMMENT '品类',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `unit` varchar(20) DEFAULT NULL COMMENT '单位',
  `pricing` decimal(10,2) DEFAULT NULL COMMENT '订价',
  `discount` varchar(50) DEFAULT NULL COMMENT '折扣',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `order_no` varchar(50) DEFAULT NULL COMMENT '订货单号',
  `product_source` varchar(100) DEFAULT NULL COMMENT '产品来源',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sale_quotation
-- ----------------------------
DROP TABLE IF EXISTS `sale_quotation`;
CREATE TABLE `sale_quotation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '报价单',
  `create_date` datetime DEFAULT NULL COMMENT '制单日期',
  `offer_no` varchar(50) DEFAULT NULL COMMENT '报价单号',
  `enquiry_date` datetime DEFAULT NULL COMMENT '询价日期',
  `customer_no` varchar(50) DEFAULT NULL COMMENT '客户编号',
  `customer_no_str` varchar(255) DEFAULT NULL COMMENT '客户编号备注',
  `business` varchar(50) DEFAULT NULL COMMENT '业务负责',
  `business_str` varchar(255) DEFAULT NULL COMMENT '业务负责备注',
  `tax` int(11) DEFAULT NULL COMMENT '税别',
  `discount` varchar(20) DEFAULT NULL COMMENT '折扣',
  `special_offer` tinyint(1) DEFAULT NULL COMMENT '特价单',
  `amount_receivable` varchar(50) DEFAULT NULL COMMENT '应收余额',
  `valid_until` datetime DEFAULT NULL COMMENT '有效期至',
  `currency` int(11) DEFAULT NULL COMMENT '币别',
  `single_people` varchar(50) DEFAULT NULL COMMENT '制单人',
  `audit` varchar(50) DEFAULT NULL COMMENT '审核人',
  `audit_str` varchar(255) DEFAULT NULL COMMENT '审核人备注',
  `last_modifier` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  `last_modifier_str` varchar(255) DEFAULT NULL COMMENT '最后修改人备注',
  `customer_name` varchar(50) DEFAULT NULL COMMENT '客户姓名',
  `customer_category` varchar(50) DEFAULT NULL COMMENT '客户类别',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `address` varchar(255) DEFAULT NULL COMMENT '送货地址',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `order_audit` tinyint(1) DEFAULT '0' COMMENT '单据审核状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sale_return_goods
-- ----------------------------
DROP TABLE IF EXISTS `sale_return_goods`;
CREATE TABLE `sale_return_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '销售-销售退货单',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `pinback_no` varchar(255) DEFAULT NULL COMMENT '销退单号',
  `early_document` tinyint(1) DEFAULT NULL COMMENT '前期单据',
  `customer_no` varchar(50) DEFAULT NULL COMMENT '客户编号',
  `customer_no_str` varchar(255) DEFAULT NULL COMMENT '客户编号描述',
  `business_leader` varchar(50) DEFAULT NULL COMMENT '业务负责人',
  `business_leader_str` varchar(255) DEFAULT NULL COMMENT '业务负责人描述',
  `tax` int(11) DEFAULT NULL COMMENT '税别',
  `currency` int(11) DEFAULT NULL COMMENT '币别',
  `warehouse_in` int(11) DEFAULT NULL COMMENT '入库仓库',
  `warehouse_location` int(11) DEFAULT NULL,
  `warehouse_location_str` varchar(255) DEFAULT NULL COMMENT '仓库位置描述',
  `return_reason` int(11) DEFAULT NULL COMMENT '退货原因',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `return_reason_people` varchar(50) DEFAULT NULL COMMENT '退货申请人',
  `made_people` varchar(50) DEFAULT NULL COMMENT '制单人',
  `audit_people` varchar(50) DEFAULT NULL COMMENT '审核人',
  `audit_people_str` varchar(255) DEFAULT NULL COMMENT '审核人描述',
  `last_update` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  `last_update_str` varchar(255) DEFAULT NULL COMMENT '最后修改人描述',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `order_audit` tinyint(1) DEFAULT '0' COMMENT '单据审核状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sale_return_goods_product
-- ----------------------------
DROP TABLE IF EXISTS `sale_return_goods_product`;
CREATE TABLE `sale_return_goods_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '销售-销售退货单-销退产品',
  `return_goods_id` bigint(20) DEFAULT NULL COMMENT '销售退货单id',
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `product_name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `category` varchar(50) DEFAULT NULL COMMENT '品类',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `unit` varchar(20) DEFAULT NULL COMMENT '单位',
  `pricing` decimal(10,2) DEFAULT NULL COMMENT '定价',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `source` varchar(50) DEFAULT NULL COMMENT '来源',
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单号',
  `warehouse_position` varchar(50) DEFAULT NULL COMMENT '库位',
  `floor` varchar(50) DEFAULT NULL COMMENT '楼层',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='销售-销售退货单-销退产品';

-- ----------------------------
-- Table structure for stock_change
-- ----------------------------
DROP TABLE IF EXISTS `stock_change`;
CREATE TABLE `stock_change` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `changedate` date DEFAULT NULL COMMENT '异动日期',
  `changeorder` varchar(255) DEFAULT '' COMMENT '异动单号',
  `depotorder` varchar(255) DEFAULT '' COMMENT '异动仓库编号',
  `depotname` varchar(255) DEFAULT '' COMMENT '异动仓库名称',
  `changetype` int(11) DEFAULT '0' COMMENT '异动类型',
  `peopleorder` varchar(255) DEFAULT '' COMMENT '异动申请人编号',
  `peoplename` varchar(255) DEFAULT '' COMMENT '异动申请人名称',
  `changecurrency` int(255) DEFAULT '0' COMMENT '币率',
  `changesourse` varchar(255) DEFAULT '' COMMENT '异动来源',
  `createpeople` varchar(255) DEFAULT '' COMMENT '制单人员',
  `shpeople` varchar(255) DEFAULT '' COMMENT '审核人',
  `shdate` varchar(255) DEFAULT '' COMMENT '审核时间',
  `updatepeople` varchar(255) DEFAULT '' COMMENT '最后修改人',
  `updatedate` varchar(255) DEFAULT '' COMMENT '最后修改时间',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `shstatus` int(11) DEFAULT '0' COMMENT '是否审核 默认、0      已审核、1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='库存异动表';

-- ----------------------------
-- Table structure for stock_change_product
-- ----------------------------
DROP TABLE IF EXISTS `stock_change_product`;
CREATE TABLE `stock_change_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `soursebill` varchar(255) DEFAULT '' COMMENT '来源单据',
  `sourseorder` varchar(255) DEFAULT '' COMMENT '订单编号',
  `sort` varchar(255) DEFAULT '' COMMENT '序号',
  `productorder` varchar(255) DEFAULT '' COMMENT '产品编号',
  `productname` varchar(255) DEFAULT '' COMMENT '产品名称',
  `productnum` int(11) DEFAULT '0' COMMENT '产品数量',
  `unit` varchar(255) DEFAULT '' COMMENT '单位',
  `depotorder` varchar(255) DEFAULT '' COMMENT '库位编号',
  `depotname` varchar(255) DEFAULT '' COMMENT '库位名称',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `changestockid` bigint(20) DEFAULT '0' COMMENT '库存异动编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='库存异动产品';

-- ----------------------------
-- Table structure for stock_out_sale
-- ----------------------------
DROP TABLE IF EXISTS `stock_out_sale`;
CREATE TABLE `stock_out_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '销货出库单',
  `create_date` datetime DEFAULT NULL COMMENT '制单日期',
  `outbound_no` varchar(50) DEFAULT NULL COMMENT '出库单号',
  `warehouse_in` bigint(20) DEFAULT NULL COMMENT '入库仓库',
  `warehouse_in_str` varchar(255) DEFAULT NULL COMMENT '入库仓库描述',
  `customer_no` varchar(50) DEFAULT NULL COMMENT '客户编号',
  `customer_no_str` varchar(255) DEFAULT NULL COMMENT '客户编号描述',
  `made_people` varchar(50) DEFAULT NULL COMMENT '制单人',
  `audit` varchar(50) DEFAULT NULL COMMENT '审核人',
  `audit_str` varchar(255) DEFAULT NULL COMMENT '审核人描述',
  `last_update` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  `last_update_str` varchar(255) DEFAULT NULL COMMENT '最后修改人描述',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `order_audit` tinyint(1) DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stock_out_sale_product
-- ----------------------------
DROP TABLE IF EXISTS `stock_out_sale_product`;
CREATE TABLE `stock_out_sale_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '销货出库单-产品',
  `stock_out_sale_id` bigint(20) DEFAULT NULL COMMENT '销货出库单id',
  `order_source` varchar(255) DEFAULT NULL COMMENT '单据来源',
  `order_no` varchar(255) DEFAULT NULL COMMENT '订单号',
  `product_no` varchar(255) DEFAULT NULL COMMENT '产品编号',
  `product_name` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `category` varchar(255) DEFAULT NULL COMMENT '品类',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `unit` bigint(20) DEFAULT NULL COMMENT '单位',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `warehouse_name` varchar(50) DEFAULT NULL COMMENT '仓库名称',
  `floor` varchar(50) DEFAULT NULL COMMENT '楼层',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supplier_basic
-- ----------------------------
DROP TABLE IF EXISTS `supplier_basic`;
CREATE TABLE `supplier_basic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `idnum` varchar(255) DEFAULT '' COMMENT '编号',
  `supdes` varchar(255) DEFAULT '' COMMENT '供应商简称',
  `supname` varchar(255) DEFAULT '' COMMENT '供应商名称',
  `regadd` varchar(255) DEFAULT '' COMMENT '注册地址',
  `country` int(11) DEFAULT '1' COMMENT '国家',
  `area` varchar(255) DEFAULT '' COMMENT '地区',
  `postalcode` varchar(255) DEFAULT '' COMMENT '邮政编码',
  `phonetype` int(11) DEFAULT '1' COMMENT '电话类型',
  `phone` varchar(255) DEFAULT '' COMMENT '电话',
  `faxtype` int(11) DEFAULT '1' COMMENT '传真类型',
  `fax` varchar(255) DEFAULT '' COMMENT '传真',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `addpeople` varchar(255) DEFAULT '' COMMENT '建档人',
  `adddate` date DEFAULT NULL COMMENT '建档日期',
  `updatepeople` varchar(255) DEFAULT '' COMMENT '最后修改人',
  `updatedate` date DEFAULT NULL COMMENT '最后修改日期',
  `isstop` int(11) DEFAULT '0' COMMENT '是否暂停',
  `stopdes` varchar(255) DEFAULT '' COMMENT '暂停说明',
  `comeandgo` int(11) DEFAULT '0' COMMENT '禁止来往',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supplier_contact
-- ----------------------------
DROP TABLE IF EXISTS `supplier_contact`;
CREATE TABLE `supplier_contact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `keycontact` varchar(255) DEFAULT '' COMMENT '主要联系人',
  `uname` varchar(255) DEFAULT '' COMMENT '姓名',
  `udepartment` varchar(255) DEFAULT '' COMMENT '部门',
  `ujob` varchar(255) DEFAULT '' COMMENT '职务',
  `uphone` varchar(255) DEFAULT '' COMMENT '电话',
  `ufax` varchar(255) DEFAULT '' COMMENT '传真',
  `umobile` varchar(255) DEFAULT '' COMMENT '移动电话',
  `uemail` varchar(255) DEFAULT '' COMMENT 'Email',
  `uremarks` varchar(255) DEFAULT '' COMMENT '备注',
  `ispoint` int(11) DEFAULT '0' COMMENT '是否主要联系人',
  `supplierid` bigint(20) DEFAULT '1' COMMENT '供应商编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supplier_purchaser
-- ----------------------------
DROP TABLE IF EXISTS `supplier_purchaser`;
CREATE TABLE `supplier_purchaser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `staffcode` varchar(255) DEFAULT '' COMMENT '员工编号',
  `staffid` bigint(20) DEFAULT '0' COMMENT '员工编号',
  `staffname` varchar(255) DEFAULT '' COMMENT '姓名',
  `keycontent` varchar(255) DEFAULT '' COMMENT '主要负责人',
  `staffremarks` varchar(255) DEFAULT '' COMMENT '备注',
  `ispoint` int(11) DEFAULT '0' COMMENT '是否是主要负责人',
  `supplierid` bigint(20) DEFAULT '1' COMMENT '供应商编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for transportation_inventory
-- ----------------------------
DROP TABLE IF EXISTS `transportation_inventory`;
CREATE TABLE `transportation_inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orders` varchar(255) DEFAULT '' COMMENT '装箱单号',
  `senddate` date DEFAULT NULL COMMENT '发货日期',
  `invoicenum` varchar(255) DEFAULT '' COMMENT '发票号码',
  `comedate` date DEFAULT NULL COMMENT '预计到货日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='在途库存';

-- ----------------------------
-- Table structure for transportation_product
-- ----------------------------
DROP TABLE IF EXISTS `transportation_product`;
CREATE TABLE `transportation_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentid` bigint(20) DEFAULT '0' COMMENT '在途库存编号',
  `purchaseorder` varchar(255) DEFAULT '' COMMENT '采购单号',
  `sort` int(11) DEFAULT '0' COMMENT '序号',
  `pronum` varchar(255) DEFAULT '' COMMENT '产品编号',
  `stocknum` varchar(255) DEFAULT '' COMMENT '库位',
  `boxnum` varchar(255) DEFAULT '' COMMENT '箱号',
  `thistimeontheway` int(11) DEFAULT '0' COMMENT '本次在途数量',
  `totalnum` int(11) DEFAULT '0' COMMENT '订货数量',
  `stockover` int(11) DEFAULT '0' COMMENT '已入库数量',
  `forcenum` int(11) DEFAULT '0' COMMENT '已强制结案数量',
  `ontheway` int(11) DEFAULT '0' COMMENT '已在途数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='在途产品';

-- ----------------------------
-- Table structure for t_train_main
-- ----------------------------
DROP TABLE IF EXISTS `t_train_main`;
CREATE TABLE `t_train_main` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `trainTitle` varchar(255) DEFAULT '' COMMENT '训练标题',
  `trainContent` blob COMMENT '训练内容',
  `trainType` int(11) DEFAULT NULL COMMENT '训练类型',
  `trainTimes` int(11) DEFAULT NULL COMMENT '训练次数',
  `trainAllTime` bigint(32) DEFAULT NULL COMMENT '训练总时长',
  `lastTrainTime` datetime DEFAULT NULL COMMENT '上次训练时间',
  `date_created` datetime DEFAULT NULL COMMENT '邮政编码',
  `remark` varchar(2000) DEFAULT '' COMMENT '电话',
  `planFlag` varchar(8) DEFAULT '' COMMENT '传真',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
