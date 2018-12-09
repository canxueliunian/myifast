/*
Navicat MySQL Data Transfer

Source Server         : ceshi
Source Server Version : 50716
Source Host           : 192.168.10.18:3306
Source Database       : qingji

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-12-09 17:41:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app_demo_base
-- ----------------------------
DROP TABLE IF EXISTS `app_demo_base`;
CREATE TABLE `app_demo_base` (
  `id` bigint(20) NOT NULL COMMENT '编号',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `publish` datetime DEFAULT NULL COMMENT '发布时间',
  `content` mediumtext COMMENT '正文',
  `deleted` bit(1) DEFAULT b'0' COMMENT '删除',
  `version` smallint(6) DEFAULT '0' COMMENT '版本',
  `createAt` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `createBy` bigint(20) DEFAULT NULL COMMENT '创建者',
  `updateBy` bigint(20) DEFAULT NULL COMMENT '更新者',
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基础表';

-- ----------------------------
-- Records of app_demo_base
-- ----------------------------
INSERT INTO `app_demo_base` VALUES ('1027118616500408321', 'Vue 2.0 Hello World', '2018-08-17 11:59:00', '这是我的征文', '\0', '7', '2018-08-08 17:05:35', '2018-08-22 15:34:46', '1', '1', null);

-- ----------------------------
-- Table structure for db_order
-- ----------------------------
DROP TABLE IF EXISTS `db_order`;
CREATE TABLE `db_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '店长id',
  `order_unit` varchar(64) DEFAULT NULL COMMENT '订单用户(门店名称)',
  `linkman_id` bigint(64) DEFAULT NULL COMMENT '联系人id',
  `linkman_name` varchar(64) DEFAULT NULL COMMENT '联系人id',
  `linkman_phone` varchar(11) DEFAULT NULL COMMENT '手机',
  `task_num` int(11) DEFAULT '0' COMMENT '包含任务数',
  `work_num` int(11) DEFAULT '0' COMMENT '分配人员数量',
  `qualified` int(255) DEFAULT NULL COMMENT '订单状态',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '订单结束时间',
  `status` int(11) DEFAULT '1' COMMENT '1为正常 0为删除',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `checkTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_phone` (`linkman_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of db_order
-- ----------------------------
INSERT INTO `db_order` VALUES ('1', '23', '23', '22', null, '0', '0', null, null, null, '1', null, null, null);

-- ----------------------------
-- Table structure for db_order_worker
-- ----------------------------
DROP TABLE IF EXISTS `db_order_worker`;
CREATE TABLE `db_order_worker` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `worker_id` bigint(20) DEFAULT NULL COMMENT '工作人员id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='订单分配人员关联表';

-- ----------------------------
-- Records of db_order_worker
-- ----------------------------

-- ----------------------------
-- Table structure for db_shopowner
-- ----------------------------
DROP TABLE IF EXISTS `db_shopowner`;
CREATE TABLE `db_shopowner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '店长id',
  `name` varchar(64) DEFAULT NULL COMMENT '用户名',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机',
  `attendance` int(11) DEFAULT NULL COMMENT '人员状态  0为正常，1为休假',
  `open_id` varchar(64) DEFAULT NULL COMMENT '微信id',
  `status` int(11) DEFAULT NULL COMMENT '账户状态   0为正常，1为停用，-1为删除',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `pickup` varchar(255) DEFAULT NULL COMMENT '销售对接人 此处待定',
  `img_path` varchar(255) DEFAULT NULL COMMENT '头像路径',
  `wechat` varchar(255) DEFAULT NULL COMMENT '微信',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_open_id` (`open_id`),
  UNIQUE KEY `index_phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店长表';

-- ----------------------------
-- Records of db_shopowner
-- ----------------------------

-- ----------------------------
-- Table structure for db_task
-- ----------------------------
DROP TABLE IF EXISTS `db_task`;
CREATE TABLE `db_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '店长id',
  `order_id` bigint(64) DEFAULT NULL COMMENT '订单id',
  `linkman_id` bigint(64) DEFAULT NULL COMMENT '联系人id',
  `linkman_name` varchar(64) DEFAULT NULL COMMENT '联系人id',
  `linkman_phone` varchar(11) DEFAULT NULL COMMENT '手机',
  `workman_id` bigint(20) DEFAULT NULL COMMENT '清洁人员id',
  `workman_name` varchar(64) DEFAULT NULL COMMENT '清洁人员name',
  `workman_phone` varchar(64) DEFAULT NULL COMMENT '清洁人员phone',
  `qualified` int(255) DEFAULT NULL COMMENT '订单状态',
  `order_time` datetime DEFAULT NULL COMMENT '订单时间',
  `begin_time` datetime DEFAULT NULL COMMENT '订单开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '订单结束时间',
  `status` int(11) DEFAULT '1' COMMENT '1为正常 0为删除',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_phone` (`linkman_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of db_task
-- ----------------------------

-- ----------------------------
-- Table structure for db_unit
-- ----------------------------
DROP TABLE IF EXISTS `db_unit`;
CREATE TABLE `db_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '门店id',
  `unitNo` varchar(255) DEFAULT NULL COMMENT '酒店编码',
  `unitType` varchar(255) DEFAULT NULL COMMENT '门店类型 LS : 连锁酒店 DT 单体酒店',
  `unitName` varchar(255) NOT NULL DEFAULT '' COMMENT '门店名称',
  `roomNum` int(11) DEFAULT NULL COMMENT '房间数量',
  `provinceId` bigint(20) DEFAULT NULL COMMENT '省id',
  `provinceName` varchar(255) DEFAULT NULL COMMENT '省name',
  `cityId` bigint(11) DEFAULT NULL COMMENT '城市id',
  `cityName` varchar(255) DEFAULT NULL COMMENT '城市name',
  `districtId` bigint(11) DEFAULT NULL COMMENT '地区id',
  `districtName` varchar(11) DEFAULT NULL COMMENT '地区name',
  `detailAdress` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `gmtCreate` datetime DEFAULT NULL,
  `gmtModify` datetime DEFAULT NULL,
  `workerNum` int(11) DEFAULT '0' COMMENT '绑定清洁师数量',
  `checkTime` datetime DEFAULT NULL COMMENT '审核时间',
  `checkStatus` int(11) DEFAULT '1' COMMENT '0 审核通过 1 未通过',
  `linkMan` varchar(255) DEFAULT NULL COMMENT '联系人',
  `linkWay` int(11) DEFAULT NULL COMMENT '联系方式',
  `contactMan` varchar(255) DEFAULT NULL COMMENT '销售对接人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='酒店门店信息表';

-- ----------------------------
-- Records of db_unit
-- ----------------------------
INSERT INTO `db_unit` VALUES ('1', '111', 'LS', 'Test酒店', null, null, null, null, null, null, null, null, '0', '2018-12-06 14:18:13', null, '0', '2018-12-21 14:18:31', '1', null, null, null);
INSERT INTO `db_unit` VALUES ('2', '111', 'LS', 'Test酒店', null, null, null, null, null, null, null, null, '0', '2018-12-06 14:18:13', null, '0', '2018-12-21 14:18:31', '1', null, null, null);

-- ----------------------------
-- Table structure for db_unitrole_type
-- ----------------------------
DROP TABLE IF EXISTS `db_unitrole_type`;
CREATE TABLE `db_unitrole_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '门店id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `role_status` int(11) DEFAULT NULL COMMENT '角色状态 0 正常 -1 关闭',
  `status` int(11) DEFAULT '0',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='门店类型表';

-- ----------------------------
-- Records of db_unitrole_type
-- ----------------------------
INSERT INTO `db_unitrole_type` VALUES ('1', 'aaa', 'qq', '22', '0', null, null);

-- ----------------------------
-- Table structure for db_worker
-- ----------------------------
DROP TABLE IF EXISTS `db_worker`;
CREATE TABLE `db_worker` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '员工id',
  `workNo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '工牌号',
  `workName` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '员工姓名',
  `platformNo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '平台编号',
  `workType` int(11) DEFAULT NULL COMMENT '员工类型',
  `phone` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '手机',
  `openId` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'openid',
  `wechat` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '微信',
  `imgPath` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像路径',
  `mininumSalary` decimal(10,0) DEFAULT '0' COMMENT '保底工资',
  `status` int(11) DEFAULT '1',
  `gmtCreate` datetime DEFAULT NULL,
  `gmtModify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=sjis COMMENT='清洁人员注册表';

-- ----------------------------
-- Records of db_worker
-- ----------------------------
INSERT INTO `db_worker` VALUES ('2', '2', 'zuobbb', '2', '2', '13566669994', null, '263', null, '0', '1', '2018-12-04 15:00:52', '2018-12-04 15:23:51');
INSERT INTO `db_worker` VALUES ('3', '3', 'zuoccc', '3', '2', '13566669997', null, '263', null, '0', '1', '2018-12-04 15:02:55', '2018-12-04 15:23:45');
INSERT INTO `db_worker` VALUES ('5', '2', 'zuoddd', '2', '1', '13566669998', null, '263', null, '0', '1', '2018-12-04 15:08:00', '2018-12-04 15:23:33');
INSERT INTO `db_worker` VALUES ('14', '4', 'zuo333', '2', '2', '13566669999', null, '263', null, '0', '1', '2018-12-04 15:12:22', '2018-12-04 15:12:22');
INSERT INTO `db_worker` VALUES ('16', '2', 'zuofff', '2', '2', '13566669996', null, '263', null, '0', '1', '2018-12-04 15:36:58', '2018-12-04 15:36:58');

-- ----------------------------
-- Table structure for db_worker_unit
-- ----------------------------
DROP TABLE IF EXISTS `db_worker_unit`;
CREATE TABLE `db_worker_unit` (
  `id` int(11) NOT NULL,
  `workId` int(11) DEFAULT NULL,
  `unitId` int(11) DEFAULT NULL,
  `contractTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of db_worker_unit
-- ----------------------------

-- ----------------------------
-- Table structure for db_workrole_type
-- ----------------------------
DROP TABLE IF EXISTS `db_workrole_type`;
CREATE TABLE `db_workrole_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '门店id',
  `name` varchar(255) NOT NULL COMMENT '角色名称',
  `roleDesc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `roleStatus` int(11) DEFAULT '0' COMMENT '角色状态 0 正常  1 禁用',
  `status` int(11) DEFAULT '0' COMMENT '数据状态 0 正常 1 删除状态',
  `gmtCreate` datetime DEFAULT NULL,
  `gmtModify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='员工角色表';

-- ----------------------------
-- Records of db_workrole_type
-- ----------------------------
INSERT INTO `db_workrole_type` VALUES ('1', '232', '普通用户123333', '1', '0', '2018-12-06 10:17:27', '2018-12-06 11:05:14');
INSERT INTO `db_workrole_type` VALUES ('5', '测试', '测试描述', '1', '0', '2018-12-06 10:48:26', '2018-12-06 11:07:29');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `k` varchar(100) DEFAULT NULL COMMENT '键',
  `v` varchar(1000) DEFAULT NULL COMMENT '值',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `kvType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('2', 'oss_qiniu', '{\"AccessKey\" : \"8-HMj9EgGNIP-xuOCpSzTn-OMyGOFtR3TxLdn4Uu\",\"SecretKey\" : \"SjpGg3V6PsMdJgn42PeEd5Ik-6aNyuwdqV5CPM6A\",\"bucket\" : \"ifast\",\"AccessUrl\" : \"http://p6r7ke2jc.bkt.clouddn.com/\"}', '七牛对象存储配置', '2018-04-06 14:31:26', '4300');
INSERT INTO `sys_config` VALUES ('3', 'author', 'canxue', '代码生成器配置', '2018-05-27 19:57:04', '4401');
INSERT INTO `sys_config` VALUES ('4', 'email', 'izenglong@163.com', '代码生成器配置', '2018-05-27 19:57:04', '4401');
INSERT INTO `sys_config` VALUES ('5', 'package', 'com.ifast.workerunit', '代码生成器配置', '2018-05-27 19:57:04', '4401');
INSERT INTO `sys_config` VALUES ('6', 'autoRemovePre', 'true', '代码生成器配置', '2018-05-27 19:57:04', '4401');
INSERT INTO `sys_config` VALUES ('7', 'tablePrefix', 'db', '代码生成器配置', '2018-05-27 19:57:04', '4401');
INSERT INTO `sys_config` VALUES ('8', 'tinyint', 'Integer', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('9', 'smallint', 'Integer', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('10', 'mediumint', 'Integer', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('11', 'int', 'Integer', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('12', 'integer', 'Integer', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('13', 'bigint', 'Long', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('14', 'float', 'Float', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('15', 'double', 'Double', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('16', 'decimal', 'BigDecimal', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('17', 'bit', 'Boolean', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('18', 'char', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('19', 'varchar', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('20', 'tinytext', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('21', 'text', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('22', 'mediumtext', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('23', 'longtext', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('24', 'date', 'Date', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('25', 'datetime', 'Date', '代码生成器配置', '2018-05-27 19:57:04', '4400');
INSERT INTO `sys_config` VALUES ('26', 'timestamp', 'Date', '代码生成器配置', '2018-05-27 19:57:04', '4400');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentId` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `orderNum` int(11) DEFAULT NULL COMMENT '排序',
  `delFlag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('6', '0', '研发部', '1', '1');
INSERT INTO `sys_dept` VALUES ('7', '6', '研发一部', '1', '1');
INSERT INTO `sys_dept` VALUES ('8', '6', '研发二部', '2', '1');
INSERT INTO `sys_dept` VALUES ('9', '0', '销售部', '2', '1');
INSERT INTO `sys_dept` VALUES ('11', '0', '产品部', '3', '1');
INSERT INTO `sys_dept` VALUES ('12', '11', '产品一部', '1', '1');
INSERT INTO `sys_dept` VALUES ('13', '0', '测试部', '5', '1');
INSERT INTO `sys_dept` VALUES ('14', '13', '测试一部', '1', '1');
INSERT INTO `sys_dept` VALUES ('15', '13', '测试二部', '2', '1');
INSERT INTO `sys_dept` VALUES ('16', '9', '销售一部', '0', '1');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `parentId` bigint(64) DEFAULT '0' COMMENT '父级编号',
  `createBy` int(64) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateBy` bigint(64) DEFAULT NULL COMMENT '更新者',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `delFlag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`),
  KEY `sys_dict_del_flag` (`delFlag`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '正常', '0', 'del_flag', '删除标记', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('3', '显示', '1', 'show_hide', '显示/隐藏', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('4', '隐藏', '0', 'show_hide', '显示/隐藏', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('5', '是', '1', 'yes_no', '是/否', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('6', '否', '0', 'yes_no', '是/否', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('7', '红色', 'red', 'color', '颜色值', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('8', '绿色', 'green', 'color', '颜色值', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('9', '蓝色', 'blue', 'color', '颜色值', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('10', '黄色', 'yellow', 'color', '颜色值', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('11', '橙色', 'orange', 'color', '颜色值', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('12', '默认主题', 'default', 'theme', '主题方案', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('13', '天蓝主题', 'cerulean', 'theme', '主题方案', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('14', '橙色主题', 'readable', 'theme', '主题方案', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('15', '红色主题', 'united', 'theme', '主题方案', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('16', 'Flat主题', 'flat', 'theme', '主题方案', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('17', '国家', '1', 'sys_area_type', '区域类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('18', '省份、直辖市', '2', 'sys_area_type', '区域类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('19', '地市', '3', 'sys_area_type', '区域类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('20', '区县', '4', 'sys_area_type', '区域类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('21', '公司', '1', 'sys_office_type', '机构类型', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('22', '部门', '2', 'sys_office_type', '机构类型', '70', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('23', '小组', '3', 'sys_office_type', '机构类型', '80', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('24', '其它', '4', 'sys_office_type', '机构类型', '90', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('25', '综合部', '1', 'sys_office_common', '快捷通用部门', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('26', '开发部', '2', 'sys_office_common', '快捷通用部门', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('27', '人力部', '3', 'sys_office_common', '快捷通用部门', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('28', '一级', '1', 'sys_office_grade', '机构等级', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('29', '二级', '2', 'sys_office_grade', '机构等级', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('30', '三级', '3', 'sys_office_grade', '机构等级', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('31', '四级', '4', 'sys_office_grade', '机构等级', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('32', '所有数据', '1', 'sys_data_scope', '数据范围', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('33', '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('34', '所在公司数据', '3', 'sys_data_scope', '数据范围', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('35', '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('36', '所在部门数据', '5', 'sys_data_scope', '数据范围', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('37', '仅本人数据', '8', 'sys_data_scope', '数据范围', '90', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('38', '按明细设置', '9', 'sys_data_scope', '数据范围', '100', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('39', '系统管理', '1', 'sys_user_type', '用户类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('40', '部门经理', '2', 'sys_user_type', '用户类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('41', '普通用户', '3', 'sys_user_type', '用户类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('42', '基础主题', 'basic', 'cms_theme', '站点主题', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('43', '蓝色主题', 'blue', 'cms_theme', '站点主题', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('44', '红色主题', 'red', 'cms_theme', '站点主题', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('45', '文章模型', 'article', 'cms_module', '栏目模型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('46', '图片模型', 'picture', 'cms_module', '栏目模型', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('47', '下载模型', 'download', 'cms_module', '栏目模型', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('48', '链接模型', 'link', 'cms_module', '栏目模型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('49', '专题模型', 'special', 'cms_module', '栏目模型', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('50', '默认展现方式', '0', 'cms_show_modes', '展现方式', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('51', '首栏目内容列表', '1', 'cms_show_modes', '展现方式', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('52', '栏目第一条内容', '2', 'cms_show_modes', '展现方式', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('53', '发布', '0', 'cms_del_flag', '内容状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('54', '删除', '1', 'cms_del_flag', '内容状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('55', '审核', '2', 'cms_del_flag', '内容状态', '15', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('56', '首页焦点图', '1', 'cms_posid', '推荐位', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('57', '栏目页文章推荐', '2', 'cms_posid', '推荐位', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('58', '咨询', '1', 'cms_guestbook', '留言板分类', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('59', '建议', '2', 'cms_guestbook', '留言板分类', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('60', '投诉', '3', 'cms_guestbook', '留言板分类', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('61', '其它', '4', 'cms_guestbook', '留言板分类', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('62', '公休', '1', 'oa_leave_type', '请假类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('63', '病假', '2', 'oa_leave_type', '请假类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('64', '事假', '3', 'oa_leave_type', '请假类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('65', '调休', '4', 'oa_leave_type', '请假类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('66', '婚假', '5', 'oa_leave_type', '请假类型', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('67', '接入日志', '1', 'sys_log_type', '日志类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('68', '异常日志', '2', 'sys_log_type', '日志类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('69', '请假流程', 'leave', 'act_type', '流程类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('70', '审批测试流程', 'test_audit', 'act_type', '流程类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('71', '分类1', '1', 'act_category', '流程分类', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('72', '分类2', '2', 'act_category', '流程分类', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('73', '增删改查', 'crud', 'gen_category', '代码生成分类', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('74', '增删改查（包含从表）', 'crud_many', 'gen_category', '代码生成分类', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('75', '树结构', 'tree', 'gen_category', '代码生成分类', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('80', 'Between', 'between', 'gen_query_type', '查询方式', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('81', 'Like', 'like', 'gen_query_type', '查询方式', '60', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('82', 'Left Like', 'left_like', 'gen_query_type', '查询方式', '70', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'Right Like', 'right_like', 'gen_query_type', '查询方式', '80', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('84', '文本框', 'input', 'gen_show_type', '字段生成方案', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('85', '文本域', 'textarea', 'gen_show_type', '字段生成方案', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('86', '下拉框', 'select', 'gen_show_type', '字段生成方案', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('87', '复选框', 'checkbox', 'gen_show_type', '字段生成方案', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('88', '单选框', 'radiobox', 'gen_show_type', '字段生成方案', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('89', '日期选择', 'dateselect', 'gen_show_type', '字段生成方案', '60', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('90', '人员选择', 'userselect', 'gen_show_type', '字段生成方案', '70', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('91', '部门选择', 'officeselect', 'gen_show_type', '字段生成方案', '80', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('92', '区域选择', 'areaselect', 'gen_show_type', '字段生成方案', '90', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('95', '仅持久层', 'dao', 'gen_category', '代码生成分类\0\0', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('96', '男', '1', 'sex', '性别', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('97', '女', '2', 'sex', '性别', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('100', 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('105', '会议通告', '1', 'oa_notify_type', '通知通告类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('106', '奖惩通告', '2', 'oa_notify_type', '通知通告类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('107', '活动通告', '3', 'oa_notify_type', '通知通告类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('108', '草稿', '0', 'oa_notify_status', '通知通告状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('109', '发布', '1', 'oa_notify_status', '通知通告状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('110', '未读', '0', 'oa_notify_read', '通知通告状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('111', '已读', '1', 'oa_notify_read', '通知通告状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('112', '草稿', '0', 'oa_notify_status', '通知通告状态', '10', '0', '1', null, '1', null, '', '0');
INSERT INTO `sys_dict` VALUES ('113', '删除', '0', 'del_flag', '删除标记', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('118', '关于', 'about', 'blog_type', '博客类型', null, null, null, null, null, null, '全url是:/blog/open/page/about', '');
INSERT INTO `sys_dict` VALUES ('119', '交流', 'communication', 'blog_type', '博客类型', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('120', '文章', 'article', 'blog_type', '博客类型', null, null, null, null, null, null, '', '');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `gmtCreate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1065433739618689185 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1062944760748122114', '1', 'admin', '??', '3605', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-15 13:45:53');
INSERT INTO `sys_log` VALUES ('1062944760748122115', '1', 'admin', '??', '66', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-15 13:45:54');
INSERT INTO `sys_log` VALUES ('1062945118669053954', '1', 'admin', '????', '286', 'POST /sys/user/save', '{\"userId\":[\"\"],\"name\":[\"????\"],\"username\":[\"canxue\"],\"password\":[\"123456\"],\"deptId\":[\"7\"],\"deptName\":[\"????\"],\"email\":[\"1419761729@qq.com\"],\"status\":[\"1\"],\"roleIds\":[\"56\"],\"role\":[\"56\"]}', '127.0.0.1', '2018-11-15 13:47:20');
INSERT INTO `sys_log` VALUES ('1062945789325680642', '1', 'admin', '????', '158', 'POST /sys/user/remove', '{\"id\":[\"1062945117511426049\"]}', '127.0.0.1', '2018-11-15 13:49:59');
INSERT INTO `sys_log` VALUES ('1062945838956879873', '1', 'admin', '????', '223', 'POST /sys/user/save', '{\"userId\":[\"\"],\"name\":[\"????\"],\"username\":[\"canxue\"],\"password\":[\"123456\"],\"deptId\":[\"\"],\"deptName\":[\"\"],\"email\":[\"1419761729@qq.com\"],\"status\":[\"1\"],\"roleIds\":[\"56\"],\"role\":[\"56\"]}', '127.0.0.1', '2018-11-15 13:50:11');
INSERT INTO `sys_log` VALUES ('1062947890235785218', '1', 'admin', '登录', '163', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-15 13:58:20');
INSERT INTO `sys_log` VALUES ('1062947935223889922', '1', 'admin', '删除用户', '157', 'POST /sys/user/remove', '{\"id\":[\"1062945838017355778\"]}', '127.0.0.1', '2018-11-15 13:58:31');
INSERT INTO `sys_log` VALUES ('1062948021446197250', '1', 'admin', '更新用户', '371', 'POST /sys/user/update', '{\"id\":[\"1034088697579159554\"],\"name\":[\"user\"],\"username\":[\"appUser\"],\"deptId\":[\"12\"],\"deptName\":[\"产品一部\"],\"email\":[\"appUser@ifast.com\"],\"status\":[\"1\"],\"roleIds\":[\"1034088931742957569\"],\"role\":[\"1034088931742957569\"]}', '127.0.0.1', '2018-11-15 13:58:52');
INSERT INTO `sys_log` VALUES ('1062948204124913665', '1', 'admin', '保存用户', '249', 'POST /sys/user/save', '{\"userId\":[\"\"],\"name\":[\"残雪流年\"],\"username\":[\"test0\"],\"password\":[\"123456\"],\"deptId\":[\"\"],\"deptName\":[\"\"],\"email\":[\"1419761729@qq.com\"],\"status\":[\"1\"],\"roleIds\":[\"56\"],\"role\":[\"56\"]}', '127.0.0.1', '2018-11-15 13:59:35');
INSERT INTO `sys_log` VALUES ('1062948651145445377', '1', 'admin', '更新菜单', '92', 'POST /sys/menu/update', '{\"parentId\":[\"0\"],\"id\":[\"1034089959238385666\"],\"type\":[\"2\"],\"name\":[\"api测试-用户更新\"],\"url\":[\"\"],\"perms\":[\"api:user:update\"],\"orderNum\":[\"\"],\"icon\":[\"\"]}', '127.0.0.1', '2018-11-15 14:01:22');
INSERT INTO `sys_log` VALUES ('1062948833954185217', '1', 'admin', '保存菜单', '73', 'POST /sys/menu/save', '{\"parentId\":[\"0\"],\"type\":[\"0\"],\"name\":[\"房间管理\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"fa fa-suitcase\"]}', '127.0.0.1', '2018-11-15 14:02:05');
INSERT INTO `sys_log` VALUES ('1062949113122865153', '1', 'admin', '更新菜单', '91', 'POST /sys/menu/update', '{\"parentId\":[\"0\"],\"id\":[\"1062948833631223809\"],\"type\":[\"1\"],\"name\":[\"房间管理\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"fa fa-suitcase\"]}', '127.0.0.1', '2018-11-15 14:03:12');
INSERT INTO `sys_log` VALUES ('1062949263572549633', '1', 'admin', '更新菜单', '687', 'POST /sys/menu/update', '{\"parentId\":[\"0\"],\"id\":[\"1\"],\"type\":[\"0\"],\"name\":[\"基础管理\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-bars\"]}', '127.0.0.1', '2018-11-15 14:03:48');
INSERT INTO `sys_log` VALUES ('1062949323089723394', '1', 'admin', '更新菜单', '84', 'POST /sys/menu/update', '{\"parentId\":[\"1\"],\"id\":[\"71\"],\"type\":[\"1\"],\"name\":[\"文件管理\"],\"url\":[\"/common/sysFile\"],\"perms\":[\"oss:file:file\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-folder-open\"]}', '127.0.0.1', '2018-11-15 14:04:02');
INSERT INTO `sys_log` VALUES ('1062949558360817665', '1', 'admin', '保存菜单', '75', 'POST /sys/menu/save', '{\"parentId\":[\"1062948833631223809\"],\"type\":[\"1\"],\"name\":[\"单个房间\"],\"url\":[\"/home\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"\"]}', '127.0.0.1', '2018-11-15 14:04:58');
INSERT INTO `sys_log` VALUES ('1062950067083792386', '1', 'admin', '登录', '164', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-15 14:06:59');
INSERT INTO `sys_log` VALUES ('1062950378766716929', '1', 'admin', '保存菜单', '88', 'POST /sys/menu/save', '{\"parentId\":[\"3\"],\"type\":[\"1\"],\"name\":[\"测试内容\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"fa fa-barcode\"]}', '127.0.0.1', '2018-11-15 14:08:14');
INSERT INTO `sys_log` VALUES ('1062954424814653442', '1', 'admin', '登录', '83', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-15 14:24:18');
INSERT INTO `sys_log` VALUES ('1062955007227318273', '1', 'admin', '删除菜单', '213', 'POST /sys/menu/remove', '{\"id\":[\"1062948833631223809\"]}', '127.0.0.1', '2018-11-15 14:26:37');
INSERT INTO `sys_log` VALUES ('1062955027188011010', '1', 'admin', '删除菜单', '203', 'POST /sys/menu/remove', '{\"id\":[\"1034089959238385666\"]}', '127.0.0.1', '2018-11-15 14:26:42');
INSERT INTO `sys_log` VALUES ('1062955050827108354', '1', 'admin', '删除菜单', '76', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876354\"]}', '127.0.0.1', '2018-11-15 14:26:48');
INSERT INTO `sys_log` VALUES ('1062955073224691713', '1', 'admin', '删除菜单', '83', 'POST /sys/menu/remove', '{\"id\":[\"1062949558046244866\"]}', '127.0.0.1', '2018-11-15 14:26:53');
INSERT INTO `sys_log` VALUES ('1062955142594285569', '1', 'admin', '更新菜单', '563', 'POST /sys/menu/update', '{\"parentId\":[\"0\"],\"id\":[\"199\"],\"type\":[\"0\"],\"name\":[\"微信公众号\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-file-code-o\"]}', '127.0.0.1', '2018-11-15 14:27:09');
INSERT INTO `sys_log` VALUES ('1062955260210958338', '1', 'admin', '保存菜单', '205', 'POST /sys/menu/save', '{\"parentId\":[\"0\"],\"type\":[\"0\"],\"name\":[\"房间管理\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"fa fa-anchor\"]}', '127.0.0.1', '2018-11-15 14:27:37');
INSERT INTO `sys_log` VALUES ('1062955419179274241', '1', 'admin', '更新角色', '2639', 'POST /sys/role/update', '{\"id\":[\"1\"],\"menuIds\":[\"193,194,195,196,197,79,80,81,83,176,177,178,179,180,207,208,209,210,211,20,21,22,61,12,13,14,24,25,26,15,55,56,62,74,75,76,48,72,28,29,30,57,92,71,78,175,206,1,2,6,7,73,77,27,91,1062955259346931713,-1,3\"],\"roleName\":[\"超级用户角色\"],\"remark\":[\"超级管理员\"]}', '127.0.0.1', '2018-11-15 14:28:15');
INSERT INTO `sys_log` VALUES ('1062956392924696577', '1', 'admin', '根据数据表生成代码', '1036', 'GET /common/generator/code/app_demo_base', '{}', '127.0.0.1', '2018-11-15 14:32:08');
INSERT INTO `sys_log` VALUES ('1062966957411782657', '1', 'admin', '登录', '89', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-15 15:14:06');
INSERT INTO `sys_log` VALUES ('1062967006246064129', '1', 'admin', '登录', '2121', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-15 15:14:18');
INSERT INTO `sys_log` VALUES ('1063325683570208770', '1', 'admin', '登录', '148', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-16 14:59:33');
INSERT INTO `sys_log` VALUES ('1065080274375237634', '1', 'admin', '登录', '67', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-21 11:11:40');
INSERT INTO `sys_log` VALUES ('1065080568836349953', '1', 'admin', '根据数据表生成代码', '151', 'GET /common/generator/code/db_workrole_type', '{}', '127.0.0.1', '2018-11-21 11:12:51');
INSERT INTO `sys_log` VALUES ('1065080816161873921', '1', 'admin', '更新代码生成配置', '507', 'POST /common/generator/update', '{\"author\":[\"Aron\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.ifast\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-11-21 11:13:49');
INSERT INTO `sys_log` VALUES ('1065080865432363010', '1', 'admin', '根据数据表生成代码', '50', 'GET /common/generator/code/db_workrole_type', '{}', '127.0.0.1', '2018-11-21 11:14:01');
INSERT INTO `sys_log` VALUES ('1065081348885106689', '1', 'admin', '登录', '85', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-21 11:15:56');
INSERT INTO `sys_log` VALUES ('1065081657119825921', '1', 'admin', '更新代码生成配置', '422', 'POST /common/generator/update', '{\"author\":[\"Aron\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.worktype\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-11-21 11:17:10');
INSERT INTO `sys_log` VALUES ('1065081704603541505', '1', 'admin', '根据数据表生成代码', '44', 'GET /common/generator/code/db_workrole_type', '{}', '127.0.0.1', '2018-11-21 11:17:21');
INSERT INTO `sys_log` VALUES ('1065087867945013249', '1', 'admin', '登录', '15', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-21 11:41:51');
INSERT INTO `sys_log` VALUES ('1065123191475232770', '1', 'admin', '登录', '62', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-21 14:02:13');
INSERT INTO `sys_log` VALUES ('1065123244239577090', '1', 'admin', '根据数据表生成代码', '63', 'GET /common/generator/code/db_workrole_type', '{}', '127.0.0.1', '2018-11-21 14:02:25');
INSERT INTO `sys_log` VALUES ('1065123639615643650', '1', 'admin', '更新代码生成配置', '414', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.ifast.qingji.workruletype\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-11-21 14:03:59');
INSERT INTO `sys_log` VALUES ('1065123670817071105', '1', 'admin', '根据数据表生成代码', '71', 'GET /common/generator/code/db_workrole_type', '{}', '127.0.0.1', '2018-11-21 14:04:07');
INSERT INTO `sys_log` VALUES ('1065124023688060930', '1', 'admin', '更新代码生成配置', '400', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.ifast.workruletype\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-11-21 14:05:31');
INSERT INTO `sys_log` VALUES ('1065124037889974273', '1', 'admin', '根据数据表生成代码', '47', 'GET /common/generator/code/db_workrole_type', '{}', '127.0.0.1', '2018-11-21 14:05:34');
INSERT INTO `sys_log` VALUES ('1065125486808584193', '1', 'admin', '登录', '28', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-21 14:11:20');
INSERT INTO `sys_log` VALUES ('1065125647379124226', '1', 'admin', '更新代码生成配置', '566', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.ifast.worker\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-11-21 14:11:58');
INSERT INTO `sys_log` VALUES ('1065125730766082049', '1', 'admin', '更新代码生成配置', '529', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.ifast.worker\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-11-21 14:12:18');
INSERT INTO `sys_log` VALUES ('1065125733194584066', '1', 'admin', '更新代码生成配置', '525', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.ifast.worker\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-11-21 14:12:19');
INSERT INTO `sys_log` VALUES ('1065125744770863105', '1', 'admin', '登录', '11', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-21 14:12:21');
INSERT INTO `sys_log` VALUES ('1065125810977951745', '1', 'admin', '更新代码生成配置', '486', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.ifast.worker\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-11-21 14:12:37');
INSERT INTO `sys_log` VALUES ('1065125846826668033', '1', 'admin', '根据数据表生成代码', '474', 'GET /common/generator/code/db_workrole_type', '{}', '127.0.0.1', '2018-11-21 14:12:46');
INSERT INTO `sys_log` VALUES ('1065127504910536705', '1', 'admin', '根据数据表生成代码', '70', 'GET /common/generator/code/db_worker', '{}', '127.0.0.1', '2018-11-21 14:19:21');
INSERT INTO `sys_log` VALUES ('1065129078042480642', '1', 'admin', '登录', '57', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-21 14:25:36');
INSERT INTO `sys_log` VALUES ('1065129697495044098', '1', 'admin', '更新角色', '84', 'POST /sys/role/update', '{\"id\":[\"1\"],\"menuIds\":[\"193,194,195,196,197,79,80,81,83,176,177,178,179,180,207,208,209,210,211,20,21,22,61,12,13,14,24,25,26,15,55,56,62,74,75,76,48,72,28,29,30,57,92,1062955259346931713,71,78,175,206,2,6,7,73,77,27,91,1062955259346931714,1062955259346931715,1062955259346931716,1062955259346931717,1062955259346931718,1062955259346931719,1,-1,3\"],\"roleName\":[\"超级用户角色\"],\"remark\":[\"超级管理员\"]}', '127.0.0.1', '2018-11-21 14:28:04');
INSERT INTO `sys_log` VALUES ('1065131740666843138', '1', 'admin', '登录', '30', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-21 14:36:11');
INSERT INTO `sys_log` VALUES ('1065133926313955330', '1', 'admin', '登录', '55', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-21 14:44:52');
INSERT INTO `sys_log` VALUES ('1065135711682383874', '1', 'admin', '登录', '58', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-21 14:51:58');
INSERT INTO `sys_log` VALUES ('1065135801687953410', '1', 'admin', '添加员工角色表', '7347', 'POST /workruletype/workroleType/save', '{\"name\":[\"残雪流年li\"],\"roleDesc\":[\"正常\"],\"roleStatus\":[\"0\"],\"status\":[\"2\"],\"gmtCreate\":[\"\"],\"gmtModify\":[\"\"]}', '127.0.0.1', '2018-11-21 14:52:19');
INSERT INTO `sys_log` VALUES ('1065135801687953411', '1', 'admin', '登录', '66', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-21 15:00:50');
INSERT INTO `sys_log` VALUES ('1065135801687953412', '1', 'admin', '添加员工角色表', '5646', 'POST /workruletype/workroleType/save', '{\"name\":[\"残雪流年li\"],\"roleDesc\":[\"22\"],\"roleStatus\":[\"1\"],\"status\":[\"\"],\"gmtCreate\":[\"\"],\"gmtModify\":[\"\"]}', '127.0.0.1', '2018-11-21 15:01:13');
INSERT INTO `sys_log` VALUES ('1065135801687953413', '1', 'admin', '添加员工角色表', '12682', 'POST /workruletype/workroleType/save', '{\"name\":[\"残雪流年li2\"],\"roleDesc\":[\"正常\"],\"roleStatus\":[\"0\"],\"status\":[\"\"],\"gmtCreate\":[\"\"],\"gmtModify\":[\"\"]}', '127.0.0.1', '2018-11-21 15:08:18');
INSERT INTO `sys_log` VALUES ('1065135801687953414', '1', 'admin', '登录', '62', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-21 15:22:05');
INSERT INTO `sys_log` VALUES ('1065135801687953415', '1', 'admin', '添加员工角色表', '11771', 'POST /workruletype/workroleType/save', '{\"name\":[\"残雪流年li\"],\"roleDesc\":[\"正常\"],\"roleStatus\":[\"0\"],\"status\":[\"\"],\"gmtCreate\":[\"\"],\"gmtModify\":[\"\"]}', '127.0.0.1', '2018-11-21 15:22:37');
INSERT INTO `sys_log` VALUES ('1065135801687953416', '1', 'admin', '登录', '22', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-21 15:27:13');
INSERT INTO `sys_log` VALUES ('1065135801687953417', '1', 'admin', '登录', '495', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-21 17:06:29');
INSERT INTO `sys_log` VALUES ('1065135801687953418', '1', 'admin', '更新代码生成配置', '536', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.ifast.worker\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-11-21 17:10:05');
INSERT INTO `sys_log` VALUES ('1065135801687953419', '1', 'admin', '根据数据表生成代码', '269', 'GET /common/generator/code/db_worker', '{}', '127.0.0.1', '2018-11-21 17:10:13');
INSERT INTO `sys_log` VALUES ('1065135801687953420', '1', 'admin', '登录', '93', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-22 10:04:46');
INSERT INTO `sys_log` VALUES ('1065135801687953421', '1', 'admin', '登录', '58', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-22 10:10:54');
INSERT INTO `sys_log` VALUES ('1065135801687953422', '1', 'admin', '登录', '65', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-22 10:23:17');
INSERT INTO `sys_log` VALUES ('1065135801687953423', '1', 'admin', '保存菜单', '14', 'POST /sys/menu/save', '{\"parentId\":[\"1\"],\"type\":[\"0\"],\"name\":[\"角色管理\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"fa fa-address-card-o\"]}', '127.0.0.1', '2018-11-22 10:28:58');
INSERT INTO `sys_log` VALUES ('1065135801687953424', '1', 'admin', '更新角色', '106', 'POST /sys/role/update', '{\"id\":[\"1\"],\"menuIds\":[\"193,194,195,196,197,79,80,81,83,176,177,178,179,180,207,208,209,210,211,1062955259346931715,1062955259346931716,1062955259346931717,1062955259346931718,1062955259346931719,20,21,22,61,12,13,14,24,25,26,15,55,56,62,74,75,76,48,72,28,29,30,57,92,1062955259346931713,71,78,175,206,1062955259346931714,2,6,7,73,77,27,91,1062955259346931720,1062955259346931722,1062955259346931723,1062955259346931724,1062955259346931725,1062955259346931726,1062955259346931721,1,-1,3\"],\"roleName\":[\"超级用户角色\"],\"remark\":[\"超级管理员\"]}', '127.0.0.1', '2018-11-22 10:30:40');
INSERT INTO `sys_log` VALUES ('1065135801687953425', '1', 'admin', '删除菜单', '11', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931713\"]}', '127.0.0.1', '2018-11-22 10:30:57');
INSERT INTO `sys_log` VALUES ('1065135801687953426', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"206\"]}', '127.0.0.1', '2018-11-22 10:31:24');
INSERT INTO `sys_log` VALUES ('1065135801687953427', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931721\"]}', '127.0.0.1', '2018-11-22 10:32:30');
INSERT INTO `sys_log` VALUES ('1065135801687953428', '1', 'admin', '更新菜单', '16', 'POST /sys/menu/update', '{\"parentId\":[\"1\"],\"id\":[\"175\"],\"type\":[\"1\"],\"name\":[\"系统配置\"],\"url\":[\"/common/config\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-gear\"]}', '127.0.0.1', '2018-11-22 10:32:49');
INSERT INTO `sys_log` VALUES ('1065135801687953429', '1', 'admin', '更新菜单', '85', 'POST /sys/menu/update', '{\"parentId\":[\"1\"],\"id\":[\"175\"],\"type\":[\"1\"],\"name\":[\"系统配置\"],\"url\":[\"/common/config\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-cogs\"]}', '127.0.0.1', '2018-11-22 10:33:04');
INSERT INTO `sys_log` VALUES ('1065135801687953430', '1', 'admin', '删除菜单', '11', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931714\"]}', '127.0.0.1', '2018-11-22 10:33:12');
INSERT INTO `sys_log` VALUES ('1065135801687953431', '1', 'admin', '更新代码生成配置', '427', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.ifast.workroleType\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-11-22 10:33:55');
INSERT INTO `sys_log` VALUES ('1065433542222159874', '1', 'admin', '登录', '89', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-22 10:35:26');
INSERT INTO `sys_log` VALUES ('1065433739618689026', '1', 'admin', '根据数据表生成代码', '430', 'GET /common/generator/code/app_demo_base', '{}', '127.0.0.1', '2018-11-22 10:36:13');
INSERT INTO `sys_log` VALUES ('1065433739618689027', '1', 'admin', '根据数据表生成代码', '295', 'GET /common/generator/code/db_workrole_type', '{}', '127.0.0.1', '2018-11-22 10:41:47');
INSERT INTO `sys_log` VALUES ('1065433739618689028', '1', 'admin', '更新菜单', '11', 'POST /sys/menu/update', '{\"parentId\":[\"1\"],\"id\":[\"1062955259346931720\"],\"type\":[\"0\"],\"name\":[\"角色管理\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"fa fa-address-book-o\"]}', '127.0.0.1', '2018-11-22 10:42:14');
INSERT INTO `sys_log` VALUES ('1065433739618689029', '1', 'admin', '更新菜单', '11', 'POST /sys/menu/update', '{\"parentId\":[\"1\"],\"id\":[\"1062955259346931720\"],\"type\":[\"0\"],\"name\":[\"角色管理\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"fa fa-address-book\"]}', '127.0.0.1', '2018-11-22 10:42:34');
INSERT INTO `sys_log` VALUES ('1065433739618689030', '1', 'admin', '更新菜单', '11', 'POST /sys/menu/update', '{\"parentId\":[\"1062955259346931720\"],\"id\":[\"1062955259346931727\"],\"type\":[\"1\"],\"name\":[\"员工角色表\"],\"url\":[\"/workroleType/workroleType\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-address-card-o\"]}', '127.0.0.1', '2018-11-22 10:44:12');
INSERT INTO `sys_log` VALUES ('1065433739618689031', '1', 'admin', '更新角色', '41', 'POST /sys/role/update', '{\"id\":[\"1\"],\"menuIds\":[\"193,194,195,196,197,79,80,81,83,176,177,178,179,180,20,21,22,61,12,13,14,24,25,26,15,55,56,62,74,75,76,48,72,28,29,30,57,92,71,78,175,2,6,7,73,77,27,91,1062955259346931720,1062955259346931728,1062955259346931729,1062955259346931730,1062955259346931731,1062955259346931732,1062955259346931727,1,-1,3\"],\"roleName\":[\"超级用户角色\"],\"remark\":[\"超级管理员\"]}', '127.0.0.1', '2018-11-22 10:44:31');
INSERT INTO `sys_log` VALUES ('1065433739618689032', '1', 'admin', '更新菜单', '10', 'POST /sys/menu/update', '{\"parentId\":[\"1062955259346931720\"],\"id\":[\"1062955259346931727\"],\"type\":[\"1\"],\"name\":[\"员工角色表\"],\"url\":[\"/workroleType/workroleType\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-address-card-o\"]}', '127.0.0.1', '2018-11-22 10:45:18');
INSERT INTO `sys_log` VALUES ('1065433739618689033', '1', 'admin', '更新菜单', '12', 'POST /sys/menu/update', '{\"parentId\":[\"1\"],\"id\":[\"1062955259346931720\"],\"type\":[\"0\"],\"name\":[\"角色管理\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"fa fa-address-book\"]}', '127.0.0.1', '2018-11-22 10:45:29');
INSERT INTO `sys_log` VALUES ('1065433739618689034', '1', 'admin', '保存菜单', '85', 'POST /sys/menu/save', '{\"parentId\":[\"1\"],\"type\":[\"0\"],\"name\":[\"测试内容\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"\"]}', '127.0.0.1', '2018-11-22 10:46:35');
INSERT INTO `sys_log` VALUES ('1065433739618689035', '1', 'admin', '保存菜单', '16', 'POST /sys/menu/save', '{\"parentId\":[\"1062955259346931733\"],\"type\":[\"1\"],\"name\":[\"测试内容儿童\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"\"]}', '127.0.0.1', '2018-11-22 10:46:52');
INSERT INTO `sys_log` VALUES ('1065433739618689036', '1', 'admin', '更新角色', '38', 'POST /sys/role/update', '{\"id\":[\"1\"],\"menuIds\":[\"-1,193,194,195,196,197,79,80,81,83,176,177,178,179,180,1062955259346931728,1062955259346931729,1062955259346931730,1062955259346931731,1062955259346931732,1062955259346931727,1062955259346931734,71,78,175,1062955259346931720,1062955259346931733,20,21,22,61,12,13,14,24,25,26,15,55,56,62,74,75,76,2,6,7,73,1062950378410201090,48,72,28,29,30,27,57,92,98,182,183,184,185,186,188,189,190,191,192,205,181,187,1,3,77,91,97,199\"],\"roleName\":[\"超级用户角色\"],\"remark\":[\"超级管理员\"]}', '127.0.0.1', '2018-11-22 10:47:06');
INSERT INTO `sys_log` VALUES ('1065433739618689037', '1', 'admin', '更新角色', '35', 'POST /sys/role/update', '{\"id\":[\"1\"],\"menuIds\":[\"193,194,195,196,197,79,80,81,83,176,177,178,179,180,1062955259346931728,1062955259346931729,1062955259346931730,1062955259346931731,1062955259346931732,1062955259346931734,20,21,22,61,12,13,14,24,25,26,15,55,56,62,74,75,76,1062950378410201090,48,72,28,29,30,57,92,98,71,78,175,1062955259346931727,1062955259346931720,1062955259346931733,1,2,6,7,73,3,77,27,91,97,-1\"],\"roleName\":[\"超级用户角色\"],\"remark\":[\"超级管理员\"]}', '127.0.0.1', '2018-11-22 10:48:51');
INSERT INTO `sys_log` VALUES ('1065433739618689038', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931720\"]}', '127.0.0.1', '2018-11-22 10:49:37');
INSERT INTO `sys_log` VALUES ('1065433739618689039', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931733\"]}', '127.0.0.1', '2018-11-22 10:49:59');
INSERT INTO `sys_log` VALUES ('1065433739618689040', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931715\"]}', '127.0.0.1', '2018-11-22 10:50:33');
INSERT INTO `sys_log` VALUES ('1065433739618689041', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"207\"]}', '127.0.0.1', '2018-11-22 10:50:38');
INSERT INTO `sys_log` VALUES ('1065433739618689042', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931734\"]}', '127.0.0.1', '2018-11-22 10:50:43');
INSERT INTO `sys_log` VALUES ('1065433739618689043', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931732\"]}', '127.0.0.1', '2018-11-22 10:50:46');
INSERT INTO `sys_log` VALUES ('1065433739618689044', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"211\"]}', '127.0.0.1', '2018-11-22 10:50:49');
INSERT INTO `sys_log` VALUES ('1065433739618689045', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931718\"]}', '127.0.0.1', '2018-11-22 10:50:52');
INSERT INTO `sys_log` VALUES ('1065433739618689046', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931731\"]}', '127.0.0.1', '2018-11-22 10:50:55');
INSERT INTO `sys_log` VALUES ('1065433739618689047', '1', 'admin', '删除菜单', '9', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931727\"]}', '127.0.0.1', '2018-11-22 10:50:58');
INSERT INTO `sys_log` VALUES ('1065433739618689048', '1', 'admin', '删除菜单', '19', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931722\"]}', '127.0.0.1', '2018-11-22 10:51:01');
INSERT INTO `sys_log` VALUES ('1065433739618689049', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"208\"]}', '127.0.0.1', '2018-11-22 10:51:05');
INSERT INTO `sys_log` VALUES ('1065433739618689050', '1', 'admin', '删除菜单', '9', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931716\"]}', '127.0.0.1', '2018-11-22 10:51:09');
INSERT INTO `sys_log` VALUES ('1065433739618689051', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931730\"]}', '127.0.0.1', '2018-11-22 10:51:14');
INSERT INTO `sys_log` VALUES ('1065433739618689052', '1', 'admin', '删除菜单', '11', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931729\"]}', '127.0.0.1', '2018-11-22 10:51:18');
INSERT INTO `sys_log` VALUES ('1065433739618689053', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931719\"]}', '127.0.0.1', '2018-11-22 10:51:20');
INSERT INTO `sys_log` VALUES ('1065433739618689054', '1', 'admin', '删除菜单', '9', 'POST /sys/menu/remove', '{\"id\":[\"209\"]}', '127.0.0.1', '2018-11-22 10:51:27');
INSERT INTO `sys_log` VALUES ('1065433739618689055', '1', 'admin', '删除菜单', '11', 'POST /sys/menu/remove', '{\"id\":[\"210\"]}', '127.0.0.1', '2018-11-22 10:51:31');
INSERT INTO `sys_log` VALUES ('1065433739618689056', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931717\"]}', '127.0.0.1', '2018-11-22 10:51:33');
INSERT INTO `sys_log` VALUES ('1065433739618689057', '1', 'admin', '删除菜单', '9', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931728\"]}', '127.0.0.1', '2018-11-22 10:51:37');
INSERT INTO `sys_log` VALUES ('1065433739618689058', '1', 'admin', '删除菜单', '9', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931726\"]}', '127.0.0.1', '2018-11-22 10:51:39');
INSERT INTO `sys_log` VALUES ('1065433739618689059', '1', 'admin', '删除菜单', '9', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931725\"]}', '127.0.0.1', '2018-11-22 10:51:41');
INSERT INTO `sys_log` VALUES ('1065433739618689060', '1', 'admin', '删除菜单', '15', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931724\"]}', '127.0.0.1', '2018-11-22 10:51:43');
INSERT INTO `sys_log` VALUES ('1065433739618689061', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931723\"]}', '127.0.0.1', '2018-11-22 10:51:46');
INSERT INTO `sys_log` VALUES ('1065433739618689062', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062950378410201090\"]}', '127.0.0.1', '2018-11-22 10:51:53');
INSERT INTO `sys_log` VALUES ('1065433739618689063', '1', 'admin', '保存菜单', '14', 'POST /sys/menu/save', '{\"parentId\":[\"0\"],\"type\":[\"0\"],\"name\":[\"角色管理\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"\"],\"icon\":[\"fa fa-address-book\"]}', '127.0.0.1', '2018-11-22 10:52:44');
INSERT INTO `sys_log` VALUES ('1065433739618689064', '1', 'admin', '更新角色', '35', 'POST /sys/role/update', '{\"id\":[\"1\"],\"menuIds\":[\"193,194,195,196,197,79,80,81,83,176,177,178,179,180,20,21,22,61,12,13,14,24,25,26,15,55,56,62,74,75,76,48,72,28,29,30,57,92,98,71,78,175,1,2,6,7,73,3,77,27,91,97,1062955259346931735,1062955259346931737,1062955259346931738,1062955259346931739,1062955259346931740,1062955259346931741,1062955259346931736,-1\"],\"roleName\":[\"超级用户角色\"],\"remark\":[\"超级管理员\"]}', '127.0.0.1', '2018-11-22 10:56:28');
INSERT INTO `sys_log` VALUES ('1065433739618689065', '1', 'admin', '更新菜单', '11', 'POST /sys/menu/update', '{\"parentId\":[\"1062955259346931735\"],\"id\":[\"1062955259346931736\"],\"type\":[\"1\"],\"name\":[\"员工角色表\"],\"url\":[\"/workroleType/workroleType\"],\"perms\":[\"workruletype:workroleType:workroleType\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-file-code-o\"]}', '127.0.0.1', '2018-11-22 11:08:20');
INSERT INTO `sys_log` VALUES ('1065433739618689066', '1', 'admin', '登录', '17', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-22 11:27:49');
INSERT INTO `sys_log` VALUES ('1065433739618689067', '1', 'admin', '更新菜单', '11', 'POST /sys/menu/update', '{\"parentId\":[\"1062955259346931735\"],\"id\":[\"1062955259346931736\"],\"type\":[\"1\"],\"name\":[\"员工角色表\"],\"url\":[\"/workroletype/workroleType\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-file-code-o\"]}', '127.0.0.1', '2018-11-22 11:28:20');
INSERT INTO `sys_log` VALUES ('1065433739618689068', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931736\"]}', '127.0.0.1', '2018-11-22 11:30:05');
INSERT INTO `sys_log` VALUES ('1065433739618689069', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931737\"]}', '127.0.0.1', '2018-11-22 11:30:10');
INSERT INTO `sys_log` VALUES ('1065433739618689070', '1', 'admin', '删除菜单', '15', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931741\"]}', '127.0.0.1', '2018-11-22 11:30:13');
INSERT INTO `sys_log` VALUES ('1065433739618689071', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931740\"]}', '127.0.0.1', '2018-11-22 11:30:16');
INSERT INTO `sys_log` VALUES ('1065433739618689072', '1', 'admin', '删除菜单', '11', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931739\"]}', '127.0.0.1', '2018-11-22 11:30:19');
INSERT INTO `sys_log` VALUES ('1065433739618689073', '1', 'admin', '删除菜单', '11', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931738\"]}', '127.0.0.1', '2018-11-22 11:30:22');
INSERT INTO `sys_log` VALUES ('1065433739618689074', '1', 'admin', '更新代码生成配置', '388', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.ifast.workroletype\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-11-22 11:30:54');
INSERT INTO `sys_log` VALUES ('1065433739618689075', '1', 'admin', '根据数据表生成代码', '63', 'GET /common/generator/code/db_workrole_type', '{}', '127.0.0.1', '2018-11-22 11:31:02');
INSERT INTO `sys_log` VALUES ('1065433739618689076', '1', 'admin', '更新角色', '33', 'POST /sys/role/update', '{\"id\":[\"1\"],\"menuIds\":[\"193,194,195,196,197,79,80,81,83,176,177,178,179,180,20,21,22,61,12,13,14,24,25,26,15,55,56,62,74,75,76,48,72,28,29,30,57,92,98,71,78,175,1,2,6,7,73,3,77,27,91,97,1062955259346931735,1062955259346931743,1062955259346931744,1062955259346931745,1062955259346931746,1062955259346931747,1062955259346931742,-1\"],\"roleName\":[\"超级用户角色\"],\"remark\":[\"超级管理员\"]}', '127.0.0.1', '2018-11-22 11:34:18');
INSERT INTO `sys_log` VALUES ('1065433739618689077', '1', 'admin', '更新菜单', '12', 'POST /sys/menu/update', '{\"parentId\":[\"1062955259346931735\"],\"id\":[\"1062955259346931742\"],\"type\":[\"1\"],\"name\":[\"员工角色表\"],\"url\":[\"/workroletype/workroleType\"],\"perms\":[\"workruletype:workroleType:workroleType\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-file-code-o\"]}', '127.0.0.1', '2018-11-22 11:39:15');
INSERT INTO `sys_log` VALUES ('1065433739618689078', '1', 'admin', '登录', '52', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-22 11:42:36');
INSERT INTO `sys_log` VALUES ('1065433739618689079', '1', 'admin', '登录', '45', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-22 11:43:07');
INSERT INTO `sys_log` VALUES ('1065433739618689080', '1', 'admin', '更新菜单', '19', 'POST /sys/menu/update', '{\"parentId\":[\"1062955259346931735\"],\"id\":[\"1062955259346931742\"],\"type\":[\"1\"],\"name\":[\"员工角色表\"],\"url\":[\"/workruletype/workroleType\"],\"perms\":[\"workruletype:workroleType:workroleType\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-file-code-o\"]}', '127.0.0.1', '2018-11-22 11:45:17');
INSERT INTO `sys_log` VALUES ('1065433739618689081', '1', 'admin', '登录', '122', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-27 11:02:53');
INSERT INTO `sys_log` VALUES ('1065433739618689082', '-1', '', '登录', '19126', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-27 11:03:10');
INSERT INTO `sys_log` VALUES ('1065433739618689083', '1', 'admin', '登录', '63', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-27 11:17:10');
INSERT INTO `sys_log` VALUES ('1065433739618689084', '1', 'admin', '登录', '16', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-27 11:44:07');
INSERT INTO `sys_log` VALUES ('1065433739618689085', '1', 'admin', '登录', '27', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-27 13:56:37');
INSERT INTO `sys_log` VALUES ('1065433739618689086', '1', 'admin', '根据数据表生成代码', '1208', 'GET /common/generator/code/db_worker', '{}', '127.0.0.1', '2018-11-27 13:56:49');
INSERT INTO `sys_log` VALUES ('1065433739618689087', '1', 'admin', '登录', '153', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-27 14:10:31');
INSERT INTO `sys_log` VALUES ('1065433739618689088', '1', 'admin', '更新代码生成配置', '527', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.ifast.worker\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-11-27 14:10:54');
INSERT INTO `sys_log` VALUES ('1065433739618689089', '1', 'admin', '更新代码生成配置', '487', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.ifast.worker\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-11-27 14:11:01');
INSERT INTO `sys_log` VALUES ('1065433739618689090', '1', 'admin', '根据数据表生成代码', '234', 'GET /common/generator/code/db_worker', '{}', '127.0.0.1', '2018-11-27 14:11:45');
INSERT INTO `sys_log` VALUES ('1065433739618689091', '1', 'admin', '登录', '1649', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-27 16:23:46');
INSERT INTO `sys_log` VALUES ('1065433739618689092', '1', 'admin', '登录', '33', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-27 16:23:46');
INSERT INTO `sys_log` VALUES ('1065433739618689093', '1', 'admin', '登录', '146', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-28 13:53:14');
INSERT INTO `sys_log` VALUES ('1065433739618689094', '1', 'admin', '删除菜单', '11', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931748\"]}', '127.0.0.1', '2018-11-28 14:06:53');
INSERT INTO `sys_log` VALUES ('1065433739618689095', '1', 'admin', '删除菜单', '9', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931749\"]}', '127.0.0.1', '2018-11-28 14:07:27');
INSERT INTO `sys_log` VALUES ('1065433739618689096', '1', 'admin', '删除菜单', '11', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931750\"]}', '127.0.0.1', '2018-11-28 14:07:35');
INSERT INTO `sys_log` VALUES ('1065433739618689097', '1', 'admin', '删除菜单', '15', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931751\"]}', '127.0.0.1', '2018-11-28 14:07:37');
INSERT INTO `sys_log` VALUES ('1065433739618689098', '1', 'admin', '删除菜单', '14', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931752\"]}', '127.0.0.1', '2018-11-28 14:07:40');
INSERT INTO `sys_log` VALUES ('1065433739618689099', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931753\"]}', '127.0.0.1', '2018-11-28 14:07:43');
INSERT INTO `sys_log` VALUES ('1065433739618689100', '1', 'admin', '更新菜单', '38', 'POST /sys/menu/update', '{\"parentId\":[\"1062955259346931735\"],\"id\":[\"1062955259346931760\"],\"type\":[\"1\"],\"name\":[\"员工管理\"],\"url\":[\"/worker/worker\"],\"perms\":[\"worker:worker:worker\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-file-code-o\"]}', '127.0.0.1', '2018-11-28 14:09:25');
INSERT INTO `sys_log` VALUES ('1065433739618689101', '1', 'admin', '更新菜单', '22', 'POST /sys/menu/update', '{\"parentId\":[\"1062955259346931735\"],\"id\":[\"1062955259346931760\"],\"type\":[\"1\"],\"name\":[\"员工管理\"],\"url\":[\"/worker/worker/worker\"],\"perms\":[\"worker:worker:worker\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-file-code-o\"]}', '127.0.0.1', '2018-11-28 14:15:45');
INSERT INTO `sys_log` VALUES ('1065433739618689102', '1', 'admin', '登录', '62', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-28 14:20:04');
INSERT INTO `sys_log` VALUES ('1065433739618689103', '1', 'admin', '更新角色', '73', 'POST /sys/role/update', '{\"id\":[\"1\"],\"menuIds\":[\"193,194,195,196,197,79,80,81,83,176,177,178,179,180,20,21,22,61,12,13,14,24,25,26,15,55,56,62,74,75,76,48,72,28,29,30,57,92,98,1062955259346931743,1062955259346931744,1062955259346931745,1062955259346931746,1062955259346931747,71,78,175,1,2,6,7,73,3,77,27,91,97,1062955259346931742,1062955259346931760,1062955259346931761,1062955259346931762,1062955259346931763,1062955259346931764,1062955259346931765,1062955259346931735,-1\"],\"roleName\":[\"超级用户角色\"],\"remark\":[\"超级管理员\"]}', '127.0.0.1', '2018-11-28 14:25:36');
INSERT INTO `sys_log` VALUES ('1065433739618689104', '1', 'admin', '登录', '67', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-28 14:32:22');
INSERT INTO `sys_log` VALUES ('1065433739618689105', '1', 'admin', '登录', '62', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-28 14:42:42');
INSERT INTO `sys_log` VALUES ('1065433739618689106', '1', 'admin', '登录', '15', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-28 14:56:04');
INSERT INTO `sys_log` VALUES ('1065433739618689107', '1', 'admin', '登录', '23', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-28 15:16:58');
INSERT INTO `sys_log` VALUES ('1065433739618689108', '1', 'admin', '登录', '123', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-28 17:24:25');
INSERT INTO `sys_log` VALUES ('1065433739618689109', '1', 'admin', '登录', '166', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-29 12:43:37');
INSERT INTO `sys_log` VALUES ('1065433739618689110', '-1', '', '登录', '19304', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-29 12:43:51');
INSERT INTO `sys_log` VALUES ('1065433739618689111', '1', 'admin', '登录', '2473', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-29 15:55:44');
INSERT INTO `sys_log` VALUES ('1065433739618689112', '1', 'admin', '登录', '1517', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-29 15:55:44');
INSERT INTO `sys_log` VALUES ('1065433739618689113', '1', 'admin', '登录', '916', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-29 15:55:45');
INSERT INTO `sys_log` VALUES ('1065433739618689114', '1', 'admin', '登录', '244', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-29 15:55:45');
INSERT INTO `sys_log` VALUES ('1065433739618689115', '1', 'admin', '登录', '337', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-29 15:55:45');
INSERT INTO `sys_log` VALUES ('1065433739618689116', '1', 'admin', '登录', '255', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-29 15:55:45');
INSERT INTO `sys_log` VALUES ('1065433739618689117', '1', 'admin', '登录', '187', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-29 15:59:18');
INSERT INTO `sys_log` VALUES ('1065433739618689118', '1', 'admin', '登录', '16', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-29 16:00:47');
INSERT INTO `sys_log` VALUES ('1065433739618689119', '1', 'admin', '登录', '120', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-04 15:00:13');
INSERT INTO `sys_log` VALUES ('1065433739618689120', '1', 'admin', '添加清洁人员注册表', '104', 'POST /worker/worker/save', '{\"workno\":[\"2\"],\"workname\":[\"zuobbb\"],\"platformno\":[\"2\"],\"workType\":[\"2\"],\"phone\":[\"13566669994\"],\"wechat\":[\"263\"]}', '127.0.0.1', '2018-12-04 15:00:52');
INSERT INTO `sys_log` VALUES ('1065433739618689121', '1', 'admin', '添加清洁人员注册表', '30', 'POST /worker/worker/save', '{\"workno\":[\"3\"],\"workname\":[\"zuoccc\"],\"platformno\":[\"3\"],\"workType\":[\"2\"],\"phone\":[\"13566669997\"],\"wechat\":[\"263\"]}', '127.0.0.1', '2018-12-04 15:02:55');
INSERT INTO `sys_log` VALUES ('1065433739618689122', '1', 'admin', '添加清洁人员注册表', '6910', 'POST /worker/worker/save', '{\"workno\":[\"2\"],\"workname\":[\"zuoddd\"],\"platformno\":[\"2\"],\"workType\":[\"2\"],\"phone\":[\"13566669998\"],\"wechat\":[\"263\"]}', '127.0.0.1', '2018-12-04 15:08:07');
INSERT INTO `sys_log` VALUES ('1065433739618689123', '1', 'admin', '添加清洁人员注册表', '29', 'POST /worker/worker/save', '{\"workno\":[\"4\"],\"workname\":[\"zuo333\"],\"platformno\":[\"2\"],\"worktype\":[\"2\"],\"phone\":[\"13566669999\"],\"wechat\":[\"263\"]}', '127.0.0.1', '2018-12-04 15:12:22');
INSERT INTO `sys_log` VALUES ('1065433739618689124', '1', 'admin', '修改清洁人员注册表', '2244', 'POST /worker/worker/update', '{\"id\":[\"5\"],\"workno\":[\"2\"],\"workname\":[\"zuoddd\"],\"platformno\":[\"2\"],\"worktype\":[\"1\"],\"phone\":[\"13566669998\"],\"wechat\":[\"263\"]}', '127.0.0.1', '2018-12-04 15:23:35');
INSERT INTO `sys_log` VALUES ('1065433739618689125', '1', 'admin', '修改清洁人员注册表', '27', 'POST /worker/worker/update', '{\"id\":[\"3\"],\"workno\":[\"3\"],\"workname\":[\"zuoccc\"],\"platformno\":[\"3\"],\"worktype\":[\"2\"],\"phone\":[\"13566669997\"],\"wechat\":[\"263\"]}', '127.0.0.1', '2018-12-04 15:23:45');
INSERT INTO `sys_log` VALUES ('1065433739618689126', '1', 'admin', '修改清洁人员注册表', '28', 'POST /worker/worker/update', '{\"id\":[\"2\"],\"workno\":[\"2\"],\"workname\":[\"zuobbb\"],\"platformno\":[\"2\"],\"worktype\":[\"2\"],\"phone\":[\"13566669994\"],\"wechat\":[\"263\"]}', '127.0.0.1', '2018-12-04 15:23:51');
INSERT INTO `sys_log` VALUES ('1065433739618689127', '1', 'admin', '登录', '15', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-04 15:34:24');
INSERT INTO `sys_log` VALUES ('1065433739618689128', '1', 'admin', '添加清洁人员注册表', '27', 'POST /worker/worker/save', '{\"workno\":[\"2\"],\"workname\":[\"zuofff\"],\"platformno\":[\"2\"],\"worktype\":[\"2\"],\"phone\":[\"13566669996\"],\"wechat\":[\"263\"],\"mininumsalary\":[\"\"]}', '127.0.0.1', '2018-12-04 15:36:58');
INSERT INTO `sys_log` VALUES ('1065433739618689129', '1', 'admin', '登录', '69', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-05 10:43:16');
INSERT INTO `sys_log` VALUES ('1065433739618689130', '1', 'admin', '根据数据表生成代码', '189', 'GET /common/generator/code/db_workrole_type', '{}', '127.0.0.1', '2018-12-05 10:45:33');
INSERT INTO `sys_log` VALUES ('1065433739618689131', '1', 'admin', '更新代码生成配置', '463', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.ifast.workroletype\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-12-05 10:46:31');
INSERT INTO `sys_log` VALUES ('1065433739618689132', '1', 'admin', '根据数据表生成代码', '56', 'GET /common/generator/code/db_workrole_type', '{}', '127.0.0.1', '2018-12-05 10:46:35');
INSERT INTO `sys_log` VALUES ('1065433739618689133', '1', 'admin', '删除菜单', '14', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931742\"]}', '127.0.0.1', '2018-12-05 10:50:54');
INSERT INTO `sys_log` VALUES ('1065433739618689134', '1', 'admin', '删除菜单', '11', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931747\"]}', '127.0.0.1', '2018-12-05 10:50:59');
INSERT INTO `sys_log` VALUES ('1065433739618689135', '1', 'admin', '删除菜单', '12', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931746\"]}', '127.0.0.1', '2018-12-05 10:51:01');
INSERT INTO `sys_log` VALUES ('1065433739618689136', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931745\"]}', '127.0.0.1', '2018-12-05 10:51:05');
INSERT INTO `sys_log` VALUES ('1065433739618689137', '1', 'admin', '删除菜单', '12', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931744\"]}', '127.0.0.1', '2018-12-05 10:51:07');
INSERT INTO `sys_log` VALUES ('1065433739618689138', '1', 'admin', '删除菜单', '10', 'POST /sys/menu/remove', '{\"id\":[\"1062955259346931743\"]}', '127.0.0.1', '2018-12-05 10:51:10');
INSERT INTO `sys_log` VALUES ('1065433739618689139', '1', 'admin', '更新角色', '49', 'POST /sys/role/update', '{\"id\":[\"1\"],\"menuIds\":[\"193,194,195,196,197,79,80,81,83,176,177,178,179,180,20,21,22,61,12,13,14,24,25,26,15,55,56,62,74,75,76,48,72,28,29,30,57,92,98,1062955259346931761,1062955259346931762,1062955259346931763,1062955259346931764,1062955259346931765,71,78,175,1,2,6,7,73,3,77,27,91,97,1062955259346931760,1062955259346931772,1062955259346931773,1062955259346931774,1062955259346931775,1062955259346931776,1062955259346931777,-1,1062955259346931735\"],\"roleName\":[\"超级用户角色\"],\"remark\":[\"超级管理员\"]}', '127.0.0.1', '2018-12-05 10:54:09');
INSERT INTO `sys_log` VALUES ('1065433739618689140', '1', 'admin', '登录', '61', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-05 11:03:49');
INSERT INTO `sys_log` VALUES ('1065433739618689141', '1', 'admin', '登录', '63', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-05 11:08:04');
INSERT INTO `sys_log` VALUES ('1065433739618689142', '1', 'admin', '登录', '63', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-05 11:30:56');
INSERT INTO `sys_log` VALUES ('1065433739618689143', '1', 'admin', '根据数据表生成代码', '44392', 'GET /common/generator/code/db_workrole_type', '{}', '127.0.0.1', '2018-12-05 11:31:48');
INSERT INTO `sys_log` VALUES ('1065433739618689144', '1', 'admin', '根据数据表生成代码', '66', 'GET /common/generator/code/db_workrole_type', '{}', '127.0.0.1', '2018-12-05 11:32:55');
INSERT INTO `sys_log` VALUES ('1065433739618689145', '1', 'admin', '登录', '293', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-05 11:48:19');
INSERT INTO `sys_log` VALUES ('1065433739618689146', '1', 'admin', '登录', '62', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-05 13:45:42');
INSERT INTO `sys_log` VALUES ('1065433739618689147', '1', 'admin', '删除清洁人员注册表', '342', 'POST /worker/worker/remove', '{\"id\":[\"1\"]}', '127.0.0.1', '2018-12-05 13:52:06');
INSERT INTO `sys_log` VALUES ('1065433739618689148', '1', 'admin', '登录', '72', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-05 14:10:48');
INSERT INTO `sys_log` VALUES ('1065433739618689149', '1', 'admin', '登录', '71', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-06 09:48:06');
INSERT INTO `sys_log` VALUES ('1065433739618689150', '1', 'admin', '登录', '14', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-06 10:12:08');
INSERT INTO `sys_log` VALUES ('1065433739618689151', '1', 'admin', '删除员工角色表', '69', 'POST /workroletype/workroleType/remove', '{\"id\":[\"2\"]}', '127.0.0.1', '2018-12-06 10:22:30');
INSERT INTO `sys_log` VALUES ('1065433739618689152', '1', 'admin', '添加员工角色表', '31', 'POST /workroletype/workroleType/save', '{\"name\":[\"小李\"],\"roleDesc\":[\"普通用户\"],\"roleStatus\":[\"0\"]}', '127.0.0.1', '2018-12-06 10:23:11');
INSERT INTO `sys_log` VALUES ('1065433739618689153', '1', 'admin', '登录', '84', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-06 10:35:42');
INSERT INTO `sys_log` VALUES ('1065433739618689154', '1', 'admin', '删除员工角色表', '38', 'POST /workroletype/workroleType/remove', '{\"id\":[\"3\"]}', '127.0.0.1', '2018-12-06 10:35:52');
INSERT INTO `sys_log` VALUES ('1065433739618689155', '1', 'admin', '删除员工角色表', '3607', 'POST /workroletype/workroleType/remove', '{\"id\":[\"3\"]}', '127.0.0.1', '2018-12-06 10:36:41');
INSERT INTO `sys_log` VALUES ('1065433739618689156', '1', 'admin', '修改员工角色表', '35', 'POST /workroletype/workroleType/update', '{\"id\":[\"1\"],\"name\":[\"232\"],\"roleDesc\":[\"普通用户123333\"],\"roleStatus\":[\"0\"]}', '127.0.0.1', '2018-12-06 10:37:08');
INSERT INTO `sys_log` VALUES ('1065433739618689157', '1', 'admin', '添加员工角色表', '31', 'POST /workroletype/workroleType/save', '{\"name\":[\"残雪流年li2\"],\"roleDesc\":[\"测试\"],\"roleStatus\":[\"1\"]}', '127.0.0.1', '2018-12-06 10:46:37');
INSERT INTO `sys_log` VALUES ('1065433739618689158', '1', 'admin', '修改员工角色表', '38', 'POST /workroletype/workroleType/update', '{\"id\":[\"4\"],\"name\":[\"残雪流年li2\"],\"roleDesc\":[\"测试\"],\"roleStatus\":[\"0\"]}', '127.0.0.1', '2018-12-06 10:47:03');
INSERT INTO `sys_log` VALUES ('1065433739618689159', '1', 'admin', '删除员工角色表', '6994', 'POST /workroletype/workroleType/remove', '{\"id\":[\"4\"]}', '127.0.0.1', '2018-12-06 10:47:14');
INSERT INTO `sys_log` VALUES ('1065433739618689160', '1', 'admin', '添加员工角色表', '9145', 'POST /workroletype/workroleType/save', '{\"name\":[\"测试\"],\"roleDesc\":[\"测试描述\"],\"roleStatus\":[\"0\"]}', '127.0.0.1', '2018-12-06 10:48:26');
INSERT INTO `sys_log` VALUES ('1065433739618689161', '1', 'admin', '修改员工角色表', '9757', 'POST /workroletype/workroleType/update', '{\"id\":[\"5\"],\"name\":[\"测试\"],\"roleDesc\":[\"测试描述\"],\"roleStatus\":[\"0\"]}', '127.0.0.1', '2018-12-06 10:57:31');
INSERT INTO `sys_log` VALUES ('1065433739618689162', '1', 'admin', '登录', '79', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-06 11:03:43');
INSERT INTO `sys_log` VALUES ('1065433739618689163', '1', 'admin', '修改员工角色表', '12773', 'POST /workroletype/workroleType/update', '{\"id\":[\"5\"],\"name\":[\"测试\"],\"roleDesc\":[\"测试描述\"],\"roleStatus\":[\"1\"]}', '127.0.0.1', '2018-12-06 11:04:07');
INSERT INTO `sys_log` VALUES ('1065433739618689164', '1', 'admin', '修改员工角色表', '12583', 'POST /workroletype/workroleType/update', '{\"id\":[\"1\"],\"name\":[\"232\"],\"roleDesc\":[\"普通用户123333\"],\"roleStatus\":[\"1\"]}', '127.0.0.1', '2018-12-06 11:05:16');
INSERT INTO `sys_log` VALUES ('1065433739618689165', '1', 'admin', '修改员工角色表', '5328', 'POST /workroletype/workroleType/update', '{\"id\":[\"5\"],\"name\":[\"测试\"],\"roleDesc\":[\"测试描述\"],\"roleStatus\":[\"0\"]}', '127.0.0.1', '2018-12-06 11:06:14');
INSERT INTO `sys_log` VALUES ('1065433739618689166', '1', 'admin', '修改员工角色表', '28', 'POST /workroletype/workroleType/update', '{\"id\":[\"5\"],\"name\":[\"测试\"],\"roleDesc\":[\"测试描述\"],\"roleStatus\":[\"1\"]}', '127.0.0.1', '2018-12-06 11:07:29');
INSERT INTO `sys_log` VALUES ('1065433739618689167', '1', 'admin', '登录', '85', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-06 13:49:30');
INSERT INTO `sys_log` VALUES ('1065433739618689168', '1', 'admin', '登录', '10', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-06 13:49:30');
INSERT INTO `sys_log` VALUES ('1065433739618689169', '1', 'admin', '更新代码生成配置', '495', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.ifast.unit\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-12-06 13:50:11');
INSERT INTO `sys_log` VALUES ('1065433739618689170', '1', 'admin', '根据数据表生成代码', '769', 'GET /common/generator/code/db_unit', '{}', '127.0.0.1', '2018-12-06 13:50:25');
INSERT INTO `sys_log` VALUES ('1065433739618689171', '1', 'admin', '登录', '73', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-06 14:03:14');
INSERT INTO `sys_log` VALUES ('1065433739618689172', '1', 'admin', '更新角色', '58', 'POST /sys/role/update', '{\"id\":[\"1\"],\"menuIds\":[\"193,194,195,196,197,79,80,81,83,176,177,178,179,180,20,21,22,61,12,13,14,24,25,26,15,55,56,62,74,75,76,48,72,28,29,30,57,92,98,1062955259346931761,1062955259346931762,1062955259346931763,1062955259346931764,1062955259346931765,1062955259346931773,1062955259346931774,1062955259346931775,1062955259346931776,1062955259346931777,71,78,175,1,2,6,7,73,3,77,27,91,97,1062955259346931760,1062955259346931772,1062955259346931778,1062955259346931779,1062955259346931780,1062955259346931781,1062955259346931782,1062955259346931783,-1,1062955259346931735\"],\"roleName\":[\"超级用户角色\"],\"remark\":[\"超级管理员\"]}', '127.0.0.1', '2018-12-06 14:04:45');
INSERT INTO `sys_log` VALUES ('1065433739618689173', '1', 'admin', '登录', '70', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-06 14:15:45');
INSERT INTO `sys_log` VALUES ('1065433739618689174', '1', 'admin', '登录', '71', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-06 15:30:05');
INSERT INTO `sys_log` VALUES ('1065433739618689175', '1', 'admin', '登录', '152', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-06 15:50:00');
INSERT INTO `sys_log` VALUES ('1065433739618689176', '1', 'admin', '根据数据表生成代码', '393', 'GET /common/generator/code/db_worker_unit', '{}', '127.0.0.1', '2018-12-06 15:50:20');
INSERT INTO `sys_log` VALUES ('1065433739618689177', '1', 'admin', '更新代码生成配置', '483', 'POST /common/generator/update', '{\"author\":[\"canxue\"],\"email\":[\"izenglong@163.com\"],\"package\":[\"com.ifast.workerunit\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"db\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-12-06 15:50:55');
INSERT INTO `sys_log` VALUES ('1065433739618689178', '1', 'admin', '根据数据表生成代码', '65', 'GET /common/generator/code/db_worker_unit', '{}', '127.0.0.1', '2018-12-06 15:51:00');
INSERT INTO `sys_log` VALUES ('1065433739618689179', '1', 'admin', '登录', '107', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '10.10.11.122', '2018-12-06 17:15:34');
INSERT INTO `sys_log` VALUES ('1065433739618689180', '1', 'admin', '登录', '15', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-06 17:45:53');
INSERT INTO `sys_log` VALUES ('1065433739618689181', '1', 'admin', '登录', '332', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-06 17:47:43');
INSERT INTO `sys_log` VALUES ('1065433739618689182', '1', 'admin', '登录', '22', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-06 18:06:28');
INSERT INTO `sys_log` VALUES ('1065433739618689183', '1', 'admin', '登录', '22', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-06 18:12:51');
INSERT INTO `sys_log` VALUES ('1065433739618689184', '1', 'admin', '登录', '73', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-12-06 18:14:55');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentId` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `orderNum` int(11) DEFAULT NULL COMMENT '排序',
  `gmtCreate` datetime DEFAULT NULL COMMENT '创建时间',
  `gmtModified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1062955259346931784 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '基础管理', '', '', '0', 'fa fa-bars', '0', '2017-08-09 22:49:47', null);
INSERT INTO `sys_menu` VALUES ('2', '3', '系统菜单', 'sys/menu/', 'sys:menu:menu', '1', 'fa fa-th-list', '2', '2017-08-09 22:55:15', null);
INSERT INTO `sys_menu` VALUES ('3', '0', '系统管理', null, null, '0', 'fa fa-desktop', '1', '2017-08-09 23:06:55', '2017-08-14 14:13:43');
INSERT INTO `sys_menu` VALUES ('6', '3', '用户管理', 'sys/user/', 'sys:user:user', '1', 'fa fa-user', '0', '2017-08-10 14:12:11', null);
INSERT INTO `sys_menu` VALUES ('7', '3', '角色管理', 'sys/role', 'sys:role:role', '1', 'fa fa-paw', '1', '2017-08-10 14:13:19', null);
INSERT INTO `sys_menu` VALUES ('12', '6', '新增', '', 'sys:user:add', '2', '', '0', '2017-08-14 10:51:35', null);
INSERT INTO `sys_menu` VALUES ('13', '6', '编辑', '', 'sys:user:edit', '2', '', '0', '2017-08-14 10:52:06', null);
INSERT INTO `sys_menu` VALUES ('14', '6', '删除', null, 'sys:user:remove', '2', null, '0', '2017-08-14 10:52:24', null);
INSERT INTO `sys_menu` VALUES ('15', '7', '新增', '', 'sys:role:add', '2', '', '0', '2017-08-14 10:56:37', null);
INSERT INTO `sys_menu` VALUES ('20', '2', '新增', '', 'sys:menu:add', '2', '', '0', '2017-08-14 10:59:32', null);
INSERT INTO `sys_menu` VALUES ('21', '2', '编辑', '', 'sys:menu:edit', '2', '', '0', '2017-08-14 10:59:56', null);
INSERT INTO `sys_menu` VALUES ('22', '2', '删除', '', 'sys:menu:remove', '2', '', '0', '2017-08-14 11:00:26', null);
INSERT INTO `sys_menu` VALUES ('24', '6', '批量删除', '', 'sys:user:batchRemove', '2', '', '0', '2017-08-14 17:27:18', null);
INSERT INTO `sys_menu` VALUES ('25', '6', '停用', null, 'sys:user:disable', '2', null, '0', '2017-08-14 17:27:43', null);
INSERT INTO `sys_menu` VALUES ('26', '6', '重置密码', '', 'sys:user:resetPwd', '2', '', '0', '2017-08-14 17:28:34', null);
INSERT INTO `sys_menu` VALUES ('27', '91', '系统日志', 'common/log', 'common:log', '1', 'fa fa-warning', '0', '2017-08-14 22:11:53', null);
INSERT INTO `sys_menu` VALUES ('28', '27', '刷新', null, 'sys:log:list', '2', null, '0', '2017-08-14 22:30:22', null);
INSERT INTO `sys_menu` VALUES ('29', '27', '删除', null, 'sys:log:remove', '2', null, '0', '2017-08-14 22:30:43', null);
INSERT INTO `sys_menu` VALUES ('30', '27', '清空', null, 'sys:log:clear', '2', null, '0', '2017-08-14 22:31:02', null);
INSERT INTO `sys_menu` VALUES ('48', '77', '代码生成', 'common/generator', 'common:generator', '1', 'fa fa-code', '3', null, null);
INSERT INTO `sys_menu` VALUES ('55', '7', '编辑', '', 'sys:role:edit', '2', '', null, null, null);
INSERT INTO `sys_menu` VALUES ('56', '7', '删除', '', 'sys:role:remove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('57', '91', '运行监控', '/druid/index.html', '', '1', 'fa fa-caret-square-o-right', '1', null, null);
INSERT INTO `sys_menu` VALUES ('61', '2', '批量删除', '', 'sys:menu:batchRemove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('62', '7', '批量删除', '', 'sys:role:batchRemove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('71', '1', '文件管理', '/common/sysFile', 'oss:file:file', '1', 'fa fa-folder-open', '2', null, null);
INSERT INTO `sys_menu` VALUES ('72', '77', '计划任务', 'common/job', 'common:taskScheduleJob', '1', 'fa fa-hourglass-1', '4', null, null);
INSERT INTO `sys_menu` VALUES ('73', '3', '部门管理', '/sys/dept', 'system:sysDept:sysDept', '1', 'fa fa-users', '3', null, null);
INSERT INTO `sys_menu` VALUES ('74', '73', '增加', '/sys/dept/add', 'system:sysDept:add', '2', null, '1', null, null);
INSERT INTO `sys_menu` VALUES ('75', '73', '刪除', 'sys/dept/remove', 'system:sysDept:remove', '2', null, '2', null, null);
INSERT INTO `sys_menu` VALUES ('76', '73', '编辑', '/sys/dept/edit', 'system:sysDept:edit', '2', null, '3', null, null);
INSERT INTO `sys_menu` VALUES ('77', '0', '系统工具', '', '', '0', 'fa fa-gear', '4', null, null);
INSERT INTO `sys_menu` VALUES ('78', '1', '数据字典', '/common/sysDict', 'common:sysDict:sysDict', '1', 'fa fa-book', '1', null, null);
INSERT INTO `sys_menu` VALUES ('79', '78', '增加', '/common/sysDict/add', 'common:sysDict:add', '2', null, '2', null, null);
INSERT INTO `sys_menu` VALUES ('80', '78', '编辑', '/common/sysDict/edit', 'common:sysDict:edit', '2', null, '2', null, null);
INSERT INTO `sys_menu` VALUES ('81', '78', '删除', '/common/sysDict/remove', 'common:sysDict:remove', '2', '', '3', null, null);
INSERT INTO `sys_menu` VALUES ('83', '78', '批量删除', '/common/sysDict/batchRemove', 'common:sysDict:batchRemove', '2', '', '4', null, null);
INSERT INTO `sys_menu` VALUES ('91', '0', '系统监控', '', '', '0', 'fa fa-video-camera', '5', null, null);
INSERT INTO `sys_menu` VALUES ('92', '91', '在线用户', 'sys/online', '', '1', 'fa fa-user', null, null, null);
INSERT INTO `sys_menu` VALUES ('97', '0', '图表管理', '', '', '0', 'fa fa-bar-chart', '7', null, null);
INSERT INTO `sys_menu` VALUES ('98', '97', '百度chart', '/chart/graph_echarts.html', '', '1', 'fa fa-area-chart', null, null, null);
INSERT INTO `sys_menu` VALUES ('175', '1', '系统配置', '/common/config', '', '1', 'fa fa-cogs', '6', null, null);
INSERT INTO `sys_menu` VALUES ('176', '175', '查看', null, 'common:config:config', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('177', '175', '新增', null, 'common:config:add', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('178', '175', '修改', null, 'common:config:edit', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('179', '175', '删除', null, 'common:config:remove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('180', '175', '批量删除', null, 'common:config:batchRemove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('181', '199', '公众号管理', '/wxmp/mpConfig', null, '1', 'fa fa-file-code-o', '6', null, null);
INSERT INTO `sys_menu` VALUES ('182', '181', '查看', null, 'wxmp:mpConfig:mpConfig', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('183', '181', '新增', null, 'wxmp:mpConfig:add', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('184', '181', '修改', null, 'wxmp:mpConfig:edit', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('185', '181', '删除', null, 'wxmp:mpConfig:remove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('186', '181', '批量删除', null, 'wxmp:mpConfig:batchRemove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('187', '199', '微信粉丝表', '/wxmp/mpFans', null, '1', 'fa fa-file-code-o', '6', null, null);
INSERT INTO `sys_menu` VALUES ('188', '187', '查看', null, 'wxmp:mpFans:mpFans', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('189', '187', '新增', null, 'wxmp:mpFans:add', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('190', '187', '修改', null, 'wxmp:mpFans:edit', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('191', '187', '删除', null, 'wxmp:mpFans:remove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('192', '187', '批量删除', null, 'wxmp:mpFans:batchRemove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('193', '71', '增加', '/common/sysFile/add', 'oss:file:add', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('194', '71', '列表', '/common/sysFile/list', 'oss:file:list', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('195', '71', '编辑', '/common/sysFile/edit', 'oss:file:update', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('196', '71', '查询', '/common/sysFile/info', 'oss:file:info', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('197', '71', '删除', '/common/sysFile/remove', 'oss:file:remove', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('199', '0', '微信公众号', '', '', '0', 'fa fa-file-code-o', '3', null, null);
INSERT INTO `sys_menu` VALUES ('205', '187', '同步', null, 'wxmp:mpFans:sync', '2', 'fa fa-refresh', '5', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931735', '0', '角色管理', '', '', '0', 'fa fa-address-book', null, null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931760', '1062955259346931735', '员工管理', '/worker/worker', 'worker:worker:worker', '1', 'fa fa-file-code-o', '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931761', '1062955259346931760', '查看', null, 'worker:worker:worker', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931762', '1062955259346931760', '新增', null, 'worker:worker:add', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931763', '1062955259346931760', '修改', null, 'worker:worker:edit', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931764', '1062955259346931760', '删除', null, 'worker:worker:remove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931765', '1062955259346931760', '批量删除', null, 'worker:worker:batchRemove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931766', '1062955259346931735', '清洁师管理', '/worker/worker', null, '1', 'fa fa-file-code-o', '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931767', '1062955259346931766', '查看', null, 'worker:worker:worker', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931768', '1062955259346931766', '新增', null, 'worker:worker:add', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931769', '1062955259346931766', '修改', null, 'worker:worker:edit', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931770', '1062955259346931766', '删除', null, 'worker:worker:remove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931771', '1062955259346931766', '批量删除', null, 'worker:worker:batchRemove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931772', '1062955259346931735', '员工角色表', '/workroletype/workroleType', null, '1', 'fa fa-file-code-o', '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931773', '1062955259346931772', '查看', null, 'workroletype:workroleType:workroleType', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931774', '1062955259346931772', '新增', null, 'workroletype:workroleType:add', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931775', '1062955259346931772', '修改', null, 'workroletype:workroleType:edit', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931776', '1062955259346931772', '删除', null, 'workroletype:workroleType:remove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931777', '1062955259346931772', '批量删除', null, 'workroletype:workroleType:batchRemove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931778', '1062955259346931735', '用户管理', '/unit/unit', null, '1', 'fa fa-file-code-o', '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931779', '1062955259346931778', '查看', null, 'unit:unit:unit', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931780', '1062955259346931778', '新增', null, 'unit:unit:add', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931781', '1062955259346931778', '修改', null, 'unit:unit:edit', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931782', '1062955259346931778', '删除', null, 'unit:unit:remove', '2', null, '6', null, null);
INSERT INTO `sys_menu` VALUES ('1062955259346931783', '1062955259346931778', '批量删除', null, 'unit:unit:batchRemove', '2', null, '6', null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `roleSign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `userIdCreate` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmtCreate` datetime DEFAULT NULL COMMENT '创建时间',
  `gmtModified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1034088931742957570 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级用户角色', 'adminRole', '超级管理员', '2', '2017-08-12 00:43:52', '2017-08-12 19:14:59');
INSERT INTO `sys_role` VALUES ('56', '普通用户', null, '普通用户', null, null, null);
INSERT INTO `sys_role` VALUES ('1034088931742957569', '前端API', 'apiRole', '前端API', null, null, null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleId` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menuId` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5262 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('367', '44', '1');
INSERT INTO `sys_role_menu` VALUES ('368', '44', '32');
INSERT INTO `sys_role_menu` VALUES ('369', '44', '33');
INSERT INTO `sys_role_menu` VALUES ('370', '44', '34');
INSERT INTO `sys_role_menu` VALUES ('371', '44', '35');
INSERT INTO `sys_role_menu` VALUES ('372', '44', '28');
INSERT INTO `sys_role_menu` VALUES ('373', '44', '29');
INSERT INTO `sys_role_menu` VALUES ('374', '44', '30');
INSERT INTO `sys_role_menu` VALUES ('375', '44', '38');
INSERT INTO `sys_role_menu` VALUES ('376', '44', '4');
INSERT INTO `sys_role_menu` VALUES ('377', '44', '27');
INSERT INTO `sys_role_menu` VALUES ('378', '45', '38');
INSERT INTO `sys_role_menu` VALUES ('379', '46', '3');
INSERT INTO `sys_role_menu` VALUES ('380', '46', '20');
INSERT INTO `sys_role_menu` VALUES ('381', '46', '21');
INSERT INTO `sys_role_menu` VALUES ('382', '46', '22');
INSERT INTO `sys_role_menu` VALUES ('383', '46', '23');
INSERT INTO `sys_role_menu` VALUES ('384', '46', '11');
INSERT INTO `sys_role_menu` VALUES ('385', '46', '12');
INSERT INTO `sys_role_menu` VALUES ('386', '46', '13');
INSERT INTO `sys_role_menu` VALUES ('387', '46', '14');
INSERT INTO `sys_role_menu` VALUES ('388', '46', '24');
INSERT INTO `sys_role_menu` VALUES ('389', '46', '25');
INSERT INTO `sys_role_menu` VALUES ('390', '46', '26');
INSERT INTO `sys_role_menu` VALUES ('391', '46', '15');
INSERT INTO `sys_role_menu` VALUES ('392', '46', '2');
INSERT INTO `sys_role_menu` VALUES ('393', '46', '6');
INSERT INTO `sys_role_menu` VALUES ('394', '46', '7');
INSERT INTO `sys_role_menu` VALUES ('598', '50', '38');
INSERT INTO `sys_role_menu` VALUES ('632', '38', '42');
INSERT INTO `sys_role_menu` VALUES ('737', '51', '38');
INSERT INTO `sys_role_menu` VALUES ('738', '51', '39');
INSERT INTO `sys_role_menu` VALUES ('739', '51', '40');
INSERT INTO `sys_role_menu` VALUES ('740', '51', '41');
INSERT INTO `sys_role_menu` VALUES ('741', '51', '4');
INSERT INTO `sys_role_menu` VALUES ('742', '51', '32');
INSERT INTO `sys_role_menu` VALUES ('743', '51', '33');
INSERT INTO `sys_role_menu` VALUES ('744', '51', '34');
INSERT INTO `sys_role_menu` VALUES ('745', '51', '35');
INSERT INTO `sys_role_menu` VALUES ('746', '51', '27');
INSERT INTO `sys_role_menu` VALUES ('747', '51', '28');
INSERT INTO `sys_role_menu` VALUES ('748', '51', '29');
INSERT INTO `sys_role_menu` VALUES ('749', '51', '30');
INSERT INTO `sys_role_menu` VALUES ('750', '51', '1');
INSERT INTO `sys_role_menu` VALUES ('1064', '54', '53');
INSERT INTO `sys_role_menu` VALUES ('1095', '55', '2');
INSERT INTO `sys_role_menu` VALUES ('1096', '55', '6');
INSERT INTO `sys_role_menu` VALUES ('1097', '55', '7');
INSERT INTO `sys_role_menu` VALUES ('1098', '55', '3');
INSERT INTO `sys_role_menu` VALUES ('1099', '55', '50');
INSERT INTO `sys_role_menu` VALUES ('1100', '55', '49');
INSERT INTO `sys_role_menu` VALUES ('1101', '55', '1');
INSERT INTO `sys_role_menu` VALUES ('1856', '53', '28');
INSERT INTO `sys_role_menu` VALUES ('1857', '53', '29');
INSERT INTO `sys_role_menu` VALUES ('1858', '53', '30');
INSERT INTO `sys_role_menu` VALUES ('1859', '53', '27');
INSERT INTO `sys_role_menu` VALUES ('1860', '53', '57');
INSERT INTO `sys_role_menu` VALUES ('1861', '53', '71');
INSERT INTO `sys_role_menu` VALUES ('1862', '53', '48');
INSERT INTO `sys_role_menu` VALUES ('1863', '53', '72');
INSERT INTO `sys_role_menu` VALUES ('1864', '53', '1');
INSERT INTO `sys_role_menu` VALUES ('1865', '53', '7');
INSERT INTO `sys_role_menu` VALUES ('1866', '53', '55');
INSERT INTO `sys_role_menu` VALUES ('1867', '53', '56');
INSERT INTO `sys_role_menu` VALUES ('1868', '53', '62');
INSERT INTO `sys_role_menu` VALUES ('1869', '53', '15');
INSERT INTO `sys_role_menu` VALUES ('1870', '53', '2');
INSERT INTO `sys_role_menu` VALUES ('1871', '53', '61');
INSERT INTO `sys_role_menu` VALUES ('1872', '53', '20');
INSERT INTO `sys_role_menu` VALUES ('1873', '53', '21');
INSERT INTO `sys_role_menu` VALUES ('1874', '53', '22');
INSERT INTO `sys_role_menu` VALUES ('2247', '63', '-1');
INSERT INTO `sys_role_menu` VALUES ('2248', '63', '84');
INSERT INTO `sys_role_menu` VALUES ('2249', '63', '85');
INSERT INTO `sys_role_menu` VALUES ('2250', '63', '88');
INSERT INTO `sys_role_menu` VALUES ('2251', '63', '87');
INSERT INTO `sys_role_menu` VALUES ('2252', '64', '84');
INSERT INTO `sys_role_menu` VALUES ('2253', '64', '89');
INSERT INTO `sys_role_menu` VALUES ('2254', '64', '88');
INSERT INTO `sys_role_menu` VALUES ('2255', '64', '87');
INSERT INTO `sys_role_menu` VALUES ('2256', '64', '86');
INSERT INTO `sys_role_menu` VALUES ('2257', '64', '85');
INSERT INTO `sys_role_menu` VALUES ('2258', '65', '89');
INSERT INTO `sys_role_menu` VALUES ('2259', '65', '88');
INSERT INTO `sys_role_menu` VALUES ('2260', '65', '86');
INSERT INTO `sys_role_menu` VALUES ('2262', '67', '48');
INSERT INTO `sys_role_menu` VALUES ('2263', '68', '88');
INSERT INTO `sys_role_menu` VALUES ('2264', '68', '87');
INSERT INTO `sys_role_menu` VALUES ('2265', '69', '89');
INSERT INTO `sys_role_menu` VALUES ('2266', '69', '88');
INSERT INTO `sys_role_menu` VALUES ('2267', '69', '86');
INSERT INTO `sys_role_menu` VALUES ('2268', '69', '87');
INSERT INTO `sys_role_menu` VALUES ('2269', '69', '85');
INSERT INTO `sys_role_menu` VALUES ('2270', '69', '84');
INSERT INTO `sys_role_menu` VALUES ('2271', '70', '85');
INSERT INTO `sys_role_menu` VALUES ('2272', '70', '89');
INSERT INTO `sys_role_menu` VALUES ('2273', '70', '88');
INSERT INTO `sys_role_menu` VALUES ('2274', '70', '87');
INSERT INTO `sys_role_menu` VALUES ('2275', '70', '86');
INSERT INTO `sys_role_menu` VALUES ('2276', '70', '84');
INSERT INTO `sys_role_menu` VALUES ('2277', '71', '87');
INSERT INTO `sys_role_menu` VALUES ('2278', '72', '59');
INSERT INTO `sys_role_menu` VALUES ('2279', '73', '48');
INSERT INTO `sys_role_menu` VALUES ('2280', '74', '88');
INSERT INTO `sys_role_menu` VALUES ('2281', '74', '87');
INSERT INTO `sys_role_menu` VALUES ('2282', '75', '88');
INSERT INTO `sys_role_menu` VALUES ('2283', '75', '87');
INSERT INTO `sys_role_menu` VALUES ('2284', '76', '85');
INSERT INTO `sys_role_menu` VALUES ('2285', '76', '89');
INSERT INTO `sys_role_menu` VALUES ('2286', '76', '88');
INSERT INTO `sys_role_menu` VALUES ('2287', '76', '87');
INSERT INTO `sys_role_menu` VALUES ('2288', '76', '86');
INSERT INTO `sys_role_menu` VALUES ('2289', '76', '84');
INSERT INTO `sys_role_menu` VALUES ('2292', '78', '88');
INSERT INTO `sys_role_menu` VALUES ('2293', '78', '87');
INSERT INTO `sys_role_menu` VALUES ('2294', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2295', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2296', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2308', '80', '87');
INSERT INTO `sys_role_menu` VALUES ('2309', '80', '86');
INSERT INTO `sys_role_menu` VALUES ('2310', '80', '-1');
INSERT INTO `sys_role_menu` VALUES ('2311', '80', '84');
INSERT INTO `sys_role_menu` VALUES ('2312', '80', '85');
INSERT INTO `sys_role_menu` VALUES ('2328', '79', '72');
INSERT INTO `sys_role_menu` VALUES ('2329', '79', '48');
INSERT INTO `sys_role_menu` VALUES ('2330', '79', '77');
INSERT INTO `sys_role_menu` VALUES ('2331', '79', '84');
INSERT INTO `sys_role_menu` VALUES ('2332', '79', '89');
INSERT INTO `sys_role_menu` VALUES ('2333', '79', '88');
INSERT INTO `sys_role_menu` VALUES ('2334', '79', '87');
INSERT INTO `sys_role_menu` VALUES ('2335', '79', '86');
INSERT INTO `sys_role_menu` VALUES ('2336', '79', '85');
INSERT INTO `sys_role_menu` VALUES ('2337', '79', '-1');
INSERT INTO `sys_role_menu` VALUES ('2338', '77', '89');
INSERT INTO `sys_role_menu` VALUES ('2339', '77', '88');
INSERT INTO `sys_role_menu` VALUES ('2340', '77', '87');
INSERT INTO `sys_role_menu` VALUES ('2341', '77', '86');
INSERT INTO `sys_role_menu` VALUES ('2342', '77', '85');
INSERT INTO `sys_role_menu` VALUES ('2343', '77', '84');
INSERT INTO `sys_role_menu` VALUES ('2344', '77', '72');
INSERT INTO `sys_role_menu` VALUES ('2345', '77', '-1');
INSERT INTO `sys_role_menu` VALUES ('2346', '77', '77');
INSERT INTO `sys_role_menu` VALUES ('3178', '56', '68');
INSERT INTO `sys_role_menu` VALUES ('3179', '56', '60');
INSERT INTO `sys_role_menu` VALUES ('3180', '56', '59');
INSERT INTO `sys_role_menu` VALUES ('3181', '56', '58');
INSERT INTO `sys_role_menu` VALUES ('3182', '56', '51');
INSERT INTO `sys_role_menu` VALUES ('3183', '56', '50');
INSERT INTO `sys_role_menu` VALUES ('3184', '56', '49');
INSERT INTO `sys_role_menu` VALUES ('3185', '56', '-1');
INSERT INTO `sys_role_menu` VALUES ('4544', '1034088931742957569', '1034089959238385666');
INSERT INTO `sys_role_menu` VALUES ('4545', '1034088931742957569', '1034090238251876354');
INSERT INTO `sys_role_menu` VALUES ('4546', '1034088931742957569', '-1');
INSERT INTO `sys_role_menu` VALUES ('5190', '1', '193');
INSERT INTO `sys_role_menu` VALUES ('5191', '1', '194');
INSERT INTO `sys_role_menu` VALUES ('5192', '1', '195');
INSERT INTO `sys_role_menu` VALUES ('5193', '1', '196');
INSERT INTO `sys_role_menu` VALUES ('5194', '1', '197');
INSERT INTO `sys_role_menu` VALUES ('5195', '1', '79');
INSERT INTO `sys_role_menu` VALUES ('5196', '1', '80');
INSERT INTO `sys_role_menu` VALUES ('5197', '1', '81');
INSERT INTO `sys_role_menu` VALUES ('5198', '1', '83');
INSERT INTO `sys_role_menu` VALUES ('5199', '1', '176');
INSERT INTO `sys_role_menu` VALUES ('5200', '1', '177');
INSERT INTO `sys_role_menu` VALUES ('5201', '1', '178');
INSERT INTO `sys_role_menu` VALUES ('5202', '1', '179');
INSERT INTO `sys_role_menu` VALUES ('5203', '1', '180');
INSERT INTO `sys_role_menu` VALUES ('5204', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('5205', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('5206', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('5207', '1', '61');
INSERT INTO `sys_role_menu` VALUES ('5208', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('5209', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('5210', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('5211', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('5212', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('5213', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('5214', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('5215', '1', '55');
INSERT INTO `sys_role_menu` VALUES ('5216', '1', '56');
INSERT INTO `sys_role_menu` VALUES ('5217', '1', '62');
INSERT INTO `sys_role_menu` VALUES ('5218', '1', '74');
INSERT INTO `sys_role_menu` VALUES ('5219', '1', '75');
INSERT INTO `sys_role_menu` VALUES ('5220', '1', '76');
INSERT INTO `sys_role_menu` VALUES ('5221', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('5222', '1', '72');
INSERT INTO `sys_role_menu` VALUES ('5223', '1', '28');
INSERT INTO `sys_role_menu` VALUES ('5224', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('5225', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('5226', '1', '57');
INSERT INTO `sys_role_menu` VALUES ('5227', '1', '92');
INSERT INTO `sys_role_menu` VALUES ('5228', '1', '98');
INSERT INTO `sys_role_menu` VALUES ('5229', '1', '1062955259346931761');
INSERT INTO `sys_role_menu` VALUES ('5230', '1', '1062955259346931762');
INSERT INTO `sys_role_menu` VALUES ('5231', '1', '1062955259346931763');
INSERT INTO `sys_role_menu` VALUES ('5232', '1', '1062955259346931764');
INSERT INTO `sys_role_menu` VALUES ('5233', '1', '1062955259346931765');
INSERT INTO `sys_role_menu` VALUES ('5234', '1', '1062955259346931773');
INSERT INTO `sys_role_menu` VALUES ('5235', '1', '1062955259346931774');
INSERT INTO `sys_role_menu` VALUES ('5236', '1', '1062955259346931775');
INSERT INTO `sys_role_menu` VALUES ('5237', '1', '1062955259346931776');
INSERT INTO `sys_role_menu` VALUES ('5238', '1', '1062955259346931777');
INSERT INTO `sys_role_menu` VALUES ('5239', '1', '71');
INSERT INTO `sys_role_menu` VALUES ('5240', '1', '78');
INSERT INTO `sys_role_menu` VALUES ('5241', '1', '175');
INSERT INTO `sys_role_menu` VALUES ('5242', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('5243', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('5244', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('5245', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('5246', '1', '73');
INSERT INTO `sys_role_menu` VALUES ('5247', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('5248', '1', '77');
INSERT INTO `sys_role_menu` VALUES ('5249', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('5250', '1', '91');
INSERT INTO `sys_role_menu` VALUES ('5251', '1', '97');
INSERT INTO `sys_role_menu` VALUES ('5252', '1', '1062955259346931760');
INSERT INTO `sys_role_menu` VALUES ('5253', '1', '1062955259346931772');
INSERT INTO `sys_role_menu` VALUES ('5254', '1', '1062955259346931778');
INSERT INTO `sys_role_menu` VALUES ('5255', '1', '1062955259346931779');
INSERT INTO `sys_role_menu` VALUES ('5256', '1', '1062955259346931780');
INSERT INTO `sys_role_menu` VALUES ('5257', '1', '1062955259346931781');
INSERT INTO `sys_role_menu` VALUES ('5258', '1', '1062955259346931782');
INSERT INTO `sys_role_menu` VALUES ('5259', '1', '1062955259346931783');
INSERT INTO `sys_role_menu` VALUES ('5260', '1', '-1');
INSERT INTO `sys_role_menu` VALUES ('5261', '1', '1062955259346931735');

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cronExpression` varchar(255) DEFAULT NULL COMMENT 'cron表达式',
  `methodName` varchar(255) DEFAULT NULL COMMENT '任务调用的方法名',
  `isConcurrent` varchar(255) DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `updateBy` varchar(64) DEFAULT NULL COMMENT '更新者',
  `beanClass` varchar(255) DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `jobStatus` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `jobGroup` varchar(255) DEFAULT NULL COMMENT '任务分组',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建者',
  `springBean` varchar(255) DEFAULT NULL COMMENT 'Spring bean',
  `jobName` varchar(255) DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1020572889410367491 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES ('2', '0/10 * * * * ?', 'run1', '1', '', '4028ea815a3d2a8c015a3d2f8d2a0002', 'com.ifast.job.TestJob', '2017-05-19 18:30:56', '0', 'group1', '2017-05-19 18:31:07', null, '', 'TestJob');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `deptId` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `userIdCreate` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmtCreate` datetime DEFAULT NULL COMMENT '创建时间',
  `gmtModified` datetime DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(32) DEFAULT NULL COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '出身日期',
  `picId` bigint(32) DEFAULT NULL,
  `liveAddress` varchar(500) DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '超级管理员', '33808479d49ca8a3cdc93d4f976d1e3d', '6', 'izenglong@163.com', '15277778888', '1', '1', '2017-08-15 21:40:39', '2017-08-15 21:41:00', '96', '2018-04-02 00:00:00', '151', '创客基地', '', '广东省', '广州市', '番禺区');
INSERT INTO `sys_user` VALUES ('2', 'test', '临时用户', 'b132f5f968c9373261f74025c23c2222', '6', 'test@ifast.com', '15278792752', '1', '1', '2017-08-14 13:43:05', '2017-08-14 21:15:36', '96', '2018-08-22 00:00:00', null, '', '', '北京市', '北京市市辖区', '东城区');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `roleId` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('73', '30', '48');
INSERT INTO `sys_user_role` VALUES ('74', '30', '49');
INSERT INTO `sys_user_role` VALUES ('75', '30', '50');
INSERT INTO `sys_user_role` VALUES ('76', '31', '48');
INSERT INTO `sys_user_role` VALUES ('77', '31', '49');
INSERT INTO `sys_user_role` VALUES ('78', '31', '52');
INSERT INTO `sys_user_role` VALUES ('79', '32', '48');
INSERT INTO `sys_user_role` VALUES ('80', '32', '49');
INSERT INTO `sys_user_role` VALUES ('81', '32', '50');
INSERT INTO `sys_user_role` VALUES ('82', '32', '51');
INSERT INTO `sys_user_role` VALUES ('83', '32', '52');
INSERT INTO `sys_user_role` VALUES ('84', '33', '38');
INSERT INTO `sys_user_role` VALUES ('85', '33', '49');
INSERT INTO `sys_user_role` VALUES ('86', '33', '52');
INSERT INTO `sys_user_role` VALUES ('87', '34', '50');
INSERT INTO `sys_user_role` VALUES ('88', '34', '51');
INSERT INTO `sys_user_role` VALUES ('89', '34', '52');
INSERT INTO `sys_user_role` VALUES ('110', '1', '1');
INSERT INTO `sys_user_role` VALUES ('111', '2', '1');
INSERT INTO `sys_user_role` VALUES ('117', '135', '1');
INSERT INTO `sys_user_role` VALUES ('120', '134', '1');
INSERT INTO `sys_user_role` VALUES ('121', '134', '48');
INSERT INTO `sys_user_role` VALUES ('124', null, '48');
INSERT INTO `sys_user_role` VALUES ('127', null, '1');
INSERT INTO `sys_user_role` VALUES ('128', null, '1');
INSERT INTO `sys_user_role` VALUES ('129', null, '1');
INSERT INTO `sys_user_role` VALUES ('131', '137', '57');

-- ----------------------------
-- Table structure for wx_mp_config
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_config`;
CREATE TABLE `wx_mp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `token` varchar(120) DEFAULT NULL,
  `appId` varchar(64) NOT NULL COMMENT 'APPID',
  `appSecret` varchar(128) NOT NULL COMMENT 'AppSecret',
  `msgMode` int(11) DEFAULT NULL COMMENT '1加密 0不加密',
  `msgSecret` varchar(128) DEFAULT NULL,
  `mpName` varchar(250) DEFAULT NULL COMMENT '公众号名字',
  `appType` int(11) NOT NULL COMMENT '公众号类型： 1.订阅号 2.服务号 3.企业号 4.小程序 5. 测试号',
  `isAuth` int(11) DEFAULT NULL COMMENT '认证授权：1已认证 0未认证',
  `subscribeUrl` varchar(500) DEFAULT NULL COMMENT '提示订阅URL',
  `appKey` varchar(100) DEFAULT NULL COMMENT '开放的公众号key',
  `logo` varchar(255) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='微信配置表';

-- ----------------------------
-- Records of wx_mp_config
-- ----------------------------
INSERT INTO `wx_mp_config` VALUES ('11', '72597b9628704ab09e8b9e8cbe9b540a', 'wxeb5638d307d3df71', '03b1501c72a91f2935037336e43e67e6', '0', '', '源码在线-测试', '5', '0', 'http://xxx.com/test', 'ymhTest', 'http://p6r7ke2jc.bkt.clouddn.com/ifast/20180822/photo_s-1534922328124.png', '2017-11-03 17:32:53');

-- ----------------------------
-- Table structure for wx_mp_fans
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_fans`;
CREATE TABLE `wx_mp_fans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mpId` bigint(11) NOT NULL COMMENT '公众号id',
  `openid` varchar(100) DEFAULT NULL COMMENT '用户的标识，对当前公众号唯一',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `subscribe` tinyint(4) DEFAULT NULL COMMENT '用户是否订阅该公众号标识，值为0时，代表此用户没有关注该公众号，拉取不到其余信息。0未关注，1已关注',
  `subscribeTime` datetime DEFAULT NULL COMMENT '用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间',
  `subscribeKey` varchar(100) DEFAULT NULL COMMENT '关注来源',
  `sex` tinyint(4) DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL COMMENT '语言',
  `headimgurl` varchar(500) DEFAULT NULL COMMENT '用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。',
  `unionid` varchar(125) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` int(20) DEFAULT NULL COMMENT '分组ID',
  `status` tinyint(11) DEFAULT NULL COMMENT '用户状态 1:正常，0：禁用',
  `tagidList` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2905 DEFAULT CHARSET=utf8mb4 COMMENT='微信粉丝表';

-- ----------------------------
-- Records of wx_mp_fans
-- ----------------------------
INSERT INTO `wx_mp_fans` VALUES ('2899', '5', 'oorK7v4LWw3GMbwt_Ck6PuQ_8_D8', '你是我的眼', '0', null, null, '2', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/A7sq8BD8oewx50myY72SwetEVkBXbXDvT5jj6ytorRxqyGwtBu1XTnWGohGXhdTtTwh6VSAbUEUSWpibddJDChg/0', 'oI55m1o8VxrTFvV57WkzEFTHLRIM', null, null, '0', null);
INSERT INTO `wx_mp_fans` VALUES ('2902', '7', 'otO0P09bRa-YRLNlPbJEL1bdDjkQ', 'Aron', '1', '2017-11-24 11:14:28', '', '1', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/BQD9yxMcK6CicIrF6tU8Pqucb2VgYicn1iaTMTwm9war1KLT9RlibbsJ9cYal7yypERODjt6XGXC4dVJdVs9woJZBHwI0ibmaGQxY/0', 'oVzGa0kCIhSXljL9wDALjN00ylOs', '', '0', '0', null);
INSERT INTO `wx_mp_fans` VALUES ('2904', '9', 'ozbGr0vZhCS8Pe1lpTuy1tq9Wlls', 'SuSu', '0', '2017-11-26 21:03:25', '', '1', '江北', '中国', '重庆', 'zh_CN', 'http://wx.qlogo.cn/mmopen/8o7KgbIM6ibFyF3coD1mMMdm91kic6Tb68P0hq9lDccec0TllUm5MnBa4WEesfiaW1HUXWqNqCTNUsrYM5iceq9gnesbSPSaE0Yw/0', 'oJitl0bd590o0ONtSt1nB7hFh0Bo', '', '0', null, null);

-- ----------------------------
-- Table structure for wx_mp_menu
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_menu`;
CREATE TABLE `wx_mp_menu` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parentIdx` bigint(20) DEFAULT NULL,
  `menuType` varchar(50) NOT NULL COMMENT '菜单类型：1主菜单，2链接，3文本，4关键字，5扫码，6发图，7发送位置',
  `menuName` varchar(128) NOT NULL,
  `menuKey` varchar(64) DEFAULT NULL,
  `menuUrl` varchar(500) DEFAULT NULL COMMENT '菜单链接',
  `replyContent` varchar(500) DEFAULT NULL,
  `scanType` int(4) DEFAULT NULL COMMENT '扫码类型：1扫码带事件，2扫码带提示',
  `pictureType` int(4) DEFAULT NULL COMMENT '发图类型：1，系统拍照发图；2,，拍照或者相册发图；3，微信相册发图',
  `location` varchar(255) DEFAULT NULL COMMENT '发送位置',
  `sort` int(11) DEFAULT NULL COMMENT '菜单排序',
  `status` int(4) DEFAULT NULL COMMENT '菜单状态',
  `createBy` bigint(20) DEFAULT NULL COMMENT '创建人',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateBy` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `mpId` bigint(20) NOT NULL COMMENT '微信配置ID',
  `idx` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信菜单表';

-- ----------------------------
-- Records of wx_mp_menu
-- ----------------------------

-- ----------------------------
-- Table structure for wx_mp_wechat_keys
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_wechat_keys`;
CREATE TABLE `wx_mp_wechat_keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mpId` bigint(20) NOT NULL COMMENT '公众号id',
  `mediaId` varchar(50) DEFAULT NULL COMMENT '素材Id',
  `keyword` varchar(200) DEFAULT NULL COMMENT '关键字，以#,#隔开',
  `type` tinyint(4) DEFAULT NULL COMMENT '回复类型，1：关键字 2：关注自动回复 3：默认回复',
  `replyType` varchar(20) DEFAULT NULL COMMENT '回复类型，文字：text 图文：news 图片： image 语音：voice 音乐：music 视频：video',
  `content` text COMMENT '内容',
  `newsId` bigint(20) DEFAULT NULL COMMENT '图文素材Id',
  `musicTitle` varchar(100) DEFAULT NULL COMMENT '音乐标题',
  `musicCover` varchar(255) DEFAULT NULL COMMENT '音乐封面',
  `musicUrl` varchar(255) DEFAULT NULL COMMENT '音乐url',
  `musicDesc` varchar(255) DEFAULT NULL COMMENT '音乐描述',
  `imageUrl` varchar(255) DEFAULT NULL COMMENT '图片URL',
  `voiceUrl` varchar(255) DEFAULT NULL COMMENT '音频URL',
  `videoTitle` varchar(100) DEFAULT NULL COMMENT '视频标题',
  `videoUrl` varchar(255) DEFAULT NULL COMMENT '视频url',
  `videoDesc` varchar(255) DEFAULT NULL COMMENT '视频描述',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0：禁用 1：启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-关键字回复';

-- ----------------------------
-- Records of wx_mp_wechat_keys
-- ----------------------------
