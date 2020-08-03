/*
 Navicat Premium Data Transfer

 Source Server         : 123
 Source Server Type    : MySQL
 Source Server Version : 50018
 Source Host           : localhost:3306
 Source Schema         : bath

 Target Server Type    : MySQL
 Target Server Version : 50018
 File Encoding         : 65001

 Date: 03/08/2020 15:36:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buywater
-- ----------------------------
DROP TABLE IF EXISTS `buywater`;
CREATE TABLE `buywater`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `waterMg` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `waterPrice` decimal(7, 0) NULL DEFAULT NULL,
  `buyTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of buywater
-- ----------------------------
INSERT INTO `buywater` VALUES (1, '20吨', 200, '2020-02-24 17:29:49');
INSERT INTO `buywater` VALUES (2, '15吨', 150, '2020-02-26 17:30:10');
INSERT INTO `buywater` VALUES (3, '10吨', 200, '2020-03-16 00:00:00');
INSERT INTO `buywater` VALUES (4, '15吨', 200, '2020-03-02 00:00:00');
INSERT INTO `buywater` VALUES (5, '15吨', 200, '2020-03-16 00:00:00');
INSERT INTO `buywater` VALUES (6, '10吨', 200, '2020-03-10 00:00:00');
INSERT INTO `buywater` VALUES (7, '15吨', 200, '2020-03-17 00:00:00');
INSERT INTO `buywater` VALUES (8, '15吨', 200, '2020-03-16 00:00:00');
INSERT INTO `buywater` VALUES (9, '15吨', 200, '2020-05-14 00:00:00');

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键、自动增长员工id号 ',
  `user_name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一 \n也就是用户登的用户名',
  `user_realname` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名字',
  `user_pwd` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `user_sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户性别',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号码',
  `user_born` date NULL DEFAULT NULL COMMENT '用户出生日期',
  `user_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `user_hobby` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户爱好',
  `user_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电子邮件',
  `selfassessment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自我评价',
  `headpic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY USING BTREE (`user_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES (1, 'admin', '张三', '123', '女', '13213512541', '1990-07-10', '北京市 北京市 海淀区', '拔罐 刮痧 按摩 修脚 采耳 脚底按摩 搓澡', '15153131@163.com', '发发发222222', 'head1.png');
INSERT INTO `emp` VALUES (2, 'admin1', '李四', '123', '男', '18457257255', '1994-08-15', '西藏自治区 拉萨市 城关区', '按摩 采耳 ', '12312165@163.com', '', 'head8.png');
INSERT INTO `emp` VALUES (3, 'oasys', '王五', '123', '男', '13727882722', '1993-11-30', '福建省 厦门市 海沧区', '按摩 采耳 ', '18415153@163.com', NULL, 'head3.png');
INSERT INTO `emp` VALUES (4, 'admin3', '刘丽丽', '123', '女', '13784565456', '1985-03-14', '山西省 太原市 杏花岭区', '按摩 采耳 ', '84656811@163.com', '', 'head4.png');
INSERT INTO `emp` VALUES (5, 'guest', '小红', '1234', '女', '17382782727', '1995-12-15', '天津市 天津市 和平区', '按摩 采耳 ', '15351352@163.com', NULL, 'head5.png');
INSERT INTO `emp` VALUES (6, 'zhaoliu', '赵六', '123', '男', '18725335153', '1992-04-15', '河南省 洛阳市 老城区', '拔罐 搓澡 ', '18483413@163.com', '', 'head1.jpg');
INSERT INTO `emp` VALUES (7, 'qianba', '钱八', '1234', '男', '18713498444', '1993-12-20', '天津市 天津市辖县 静海县', '按摩 采耳 ', '13885616@163.com', NULL, '');
INSERT INTO `emp` VALUES (8, 'linjiu', '林九', '1234', '男', '18713531258', '1995-12-10', '河北省 唐山市 路北区', '按摩 采耳 ', '13885845@163.com', NULL, '');
INSERT INTO `emp` VALUES (9, 'shenqing', '沈青', '1234', '女', '18793868425', '1992-07-12', '福建省 龙岩市 永定县', '按摩 采耳 ', '13435416@163.com', NULL, '');
INSERT INTO `emp` VALUES (38, 'gsy', '张三2', '123', '男', '123', '2020-03-11', '北京市 北京市 东城区', '拔罐 刮痧 按摩', '123', NULL, NULL);
INSERT INTO `emp` VALUES (39, 'zx', '张三2', '123', '男', '123', '2020-03-10', '天津市 天津市 和平区', '拔罐 搓澡', '123', NULL, NULL);
INSERT INTO `emp` VALUES (40, 'chb ', '张三2', '123', '男', '123', '2020-03-11', '北京市 北京市 东城区', '拔罐 刮痧 按摩', '123', NULL, NULL);
INSERT INTO `emp` VALUES (42, '张三', '张三2', '123', '男', '123', '2020-03-14', '山西省 太原市 小店区', '拔罐 刮痧', '123', NULL, NULL);
INSERT INTO `emp` VALUES (43, '振振', '田振振', '123', '男', '123', '2020-03-11', '河南省 焦作市 武陟县', '拔罐 刮痧 按摩', '123@qq.com', NULL, NULL);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `memNo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `memName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员姓名',
  `memmoney` double NULL DEFAULT NULL COMMENT '会员余额',
  `memtime` datetime NULL DEFAULT NULL COMMENT '会员创建时间',
  `memtel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, '11111', '会员1', 62, '2019-12-31 09:43:01', '12345678900');
INSERT INTO `member` VALUES (2, '11112', '会员2', 73, '2020-01-28 09:43:27', '12345678900');
INSERT INTO `member` VALUES (3, '11113', '会员3', 102, '2020-01-28 09:43:27', '12345678900');
INSERT INTO `member` VALUES (4, '11114', '会员4', 104, '2020-01-28 09:43:27', '12345678900');
INSERT INTO `member` VALUES (5, '11115', '会员5', 105, '2020-01-28 09:43:27', '12345678900');
INSERT INTO `member` VALUES (6, '11116', '会员6', 20, '2020-01-28 09:43:27', '12345678900');

-- ----------------------------
-- Table structure for membercord
-- ----------------------------
DROP TABLE IF EXISTS `membercord`;
CREATE TABLE `membercord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `memNo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `memName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员姓名',
  `recordprice` double NULL DEFAULT NULL COMMENT '消费金额',
  `recordtime` datetime NULL DEFAULT NULL COMMENT '消费时间',
  `memshop` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of membercord
-- ----------------------------
INSERT INTO `membercord` VALUES (1, '11111', '会员一', 20, '2020-02-24 17:06:05', '澡票，搓澡');
INSERT INTO `membercord` VALUES (2, '11111', '会员一', 10, '2020-03-16 10:35:56', '洗澡');
INSERT INTO `membercord` VALUES (3, '11111', '会员1', 10, '2020-03-19 15:31:07', '澡票1');
INSERT INTO `membercord` VALUES (4, '11111', '会员1', 8, '2020-03-19 15:31:07', '澡票2');
INSERT INTO `membercord` VALUES (5, '11111', '会员1', 8, '2020-03-19 21:15:55', '澡票2');
INSERT INTO `membercord` VALUES (6, '11111', '会员1', 10, '2020-03-19 21:15:55', '澡巾1');
INSERT INTO `membercord` VALUES (7, '11111', '会员1', 20, '2020-03-21 15:28:23', '澡票1');
INSERT INTO `membercord` VALUES (8, '11111', '会员1', 16, '2020-03-21 15:28:23', '澡票2');
INSERT INTO `membercord` VALUES (9, '11111', '会员1', 20, '2020-03-23 11:04:47', '澡票1');
INSERT INTO `membercord` VALUES (10, '11111', '会员1', 8, '2020-03-23 11:04:47', '澡票2');
INSERT INTO `membercord` VALUES (11, '11111', '会员1', 10, '2020-03-30 15:42:32', '澡票1');
INSERT INTO `membercord` VALUES (12, '11111', '会员1', 8, '2020-03-30 15:42:32', '澡票2');
INSERT INTO `membercord` VALUES (13, '11111', '会员1', 10, '2020-05-02 16:36:16', '澡票1');
INSERT INTO `membercord` VALUES (14, '11111', '会员1', 8, '2020-05-02 16:36:16', '澡票2');
INSERT INTO `membercord` VALUES (15, '11111', '会员1', 10, '2020-05-02 16:36:16', '澡巾1');
INSERT INTO `membercord` VALUES (16, '11112', '会员2', 10, '2020-05-14 11:01:36', '澡票1');
INSERT INTO `membercord` VALUES (17, '11112', '会员2', 10, '2020-05-14 19:56:05', '澡票1');
INSERT INTO `membercord` VALUES (18, '11112', '会员2', 8, '2020-05-14 19:56:05', '澡票2');
INSERT INTO `membercord` VALUES (19, '11111', '会员1', 10, '2020-05-16 16:44:03', '澡票1');
INSERT INTO `membercord` VALUES (20, '11111', '会员1', 10, '2020-05-16 16:44:03', '澡巾1');
INSERT INTO `membercord` VALUES (21, '11111', '会员1', 3, '2020-05-16 16:44:03', '绿茶');
INSERT INTO `membercord` VALUES (22, '11111', '会员1', 1, '2020-05-16 16:44:03', '矿泉水');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '房间id',
  `roomnum` int(11) NULL DEFAULT NULL COMMENT '房间号',
  `roomstatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房间状态空闲、使用',
  `roomprice` double NULL DEFAULT NULL,
  `roomtype` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roomtime` datetime NULL DEFAULT NULL,
  `timelong` double NULL DEFAULT NULL,
  `numofuse` int(11) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, 10001, '空闲', 30, '盆浴', '2020-05-14 20:02:48', NULL, 1);
INSERT INTO `room` VALUES (2, 10002, '使用', 25, '淋浴', '2020-05-14 11:05:51', NULL, 1);
INSERT INTO `room` VALUES (3, 10003, '空闲', 25, '淋浴', '2020-03-04 11:00:50', NULL, 0);
INSERT INTO `room` VALUES (4, 10005, '空闲', 25, '淋浴', '2020-03-05 11:00:55', NULL, 0);
INSERT INTO `room` VALUES (5, 10006, '空闲', 30, '盆浴', '2020-03-06 11:01:01', NULL, 0);

-- ----------------------------
-- Table structure for server
-- ----------------------------
DROP TABLE IF EXISTS `server`;
CREATE TABLE `server`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `serNo` int(5) NULL DEFAULT NULL,
  `serName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `serPrice` double(8, 0) NULL DEFAULT NULL,
  `serNum` int(10) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of server
-- ----------------------------
INSERT INTO `server` VALUES (1, 1000, '搓澡', 10, 0);
INSERT INTO `server` VALUES (2, 1001, '拔罐', 10, 0);
INSERT INTO `server` VALUES (3, 1002, '打盐一', 10, 0);
INSERT INTO `server` VALUES (4, 1003, '打盐二', 15, 0);
INSERT INTO `server` VALUES (5, 1004, '打奶一', 10, 0);
INSERT INTO `server` VALUES (6, 1005, '打奶二', 20, 0);
INSERT INTO `server` VALUES (7, 1007, '按摩', 30, 0);
INSERT INTO `server` VALUES (9, 1008, '修脚', 20, 0);

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `shopname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `shopprice` double(5, 0) NOT NULL DEFAULT '',
  `shopsize` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `shopnum` int(8) NULL DEFAULT NULL,
  `sellnum` int(8) UNSIGNED ZEROFILL NOT NULL DEFAULT 00000000,
  `selltime` datetime NULL DEFAULT '',
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES (1, '澡票', 10, '成人', 30, 00000000, '2020-03-04 14:59:29');
INSERT INTO `shop` VALUES (2, '澡票', 8, '儿童', 30, 00000000, '2020-03-04 14:59:43');
INSERT INTO `shop` VALUES (3, '澡巾1', 10, '好', 50, 00000000, '2020-03-02 14:59:47');
INSERT INTO `shop` VALUES (4, '澡巾2', 7, '中', 50, 00000000, '0000-00-00 00:00:00');
INSERT INTO `shop` VALUES (5, '澡巾3', 5, '劣', 30, 00000000, '0000-00-00 00:00:00');
INSERT INTO `shop` VALUES (6, '红茶', 5, '1000ml', 500, 00000010, '0000-00-00 00:00:00');
INSERT INTO `shop` VALUES (8, '农夫山泉', 2, '500ml', 50, 00000000, '0000-00-00 00:00:00');
INSERT INTO `shop` VALUES (9, '冰露', 1, '500ml', 60, 00000000, '0000-00-00 00:00:00');
INSERT INTO `shop` VALUES (10, '毛巾1', 10, '大', 20, 00000000, '0000-00-00 00:00:00');
INSERT INTO `shop` VALUES (11, '毛巾2', 7, '中', 20, 00000000, '0000-00-00 00:00:00');
INSERT INTO `shop` VALUES (12, '洗头膏', 1, '50ml', 100, 00000000, '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for shoumaijilu
-- ----------------------------
DROP TABLE IF EXISTS `shoumaijilu`;
CREATE TABLE `shoumaijilu`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品名称',
  `GoodsId` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称\r\n',
  `GoodsName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  `Price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '价格',
  `Qty` int(10) NULL DEFAULT NULL COMMENT '购买数量',
  `Money` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '金额',
  `memId` int(10) NULL DEFAULT NULL COMMENT '会员Id',
  `goumaitime` datetime NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shoumaijilu
-- ----------------------------
INSERT INTO `shoumaijilu` VALUES (1, '澡票2', '儿童', '8', 1, '8.00', NULL, '2020-03-19 12:26:13');
INSERT INTO `shoumaijilu` VALUES (2, '澡巾1', '优', '10', 1, '10.00', NULL, '2020-03-19 12:26:13');
INSERT INTO `shoumaijilu` VALUES (3, '毛巾', '优', '15', 1, '15.00', NULL, '2020-03-19 12:26:13');
INSERT INTO `shoumaijilu` VALUES (4, '毛巾', '优', '15', 1, '15.00', NULL, '2020-03-19 12:27:49');
INSERT INTO `shoumaijilu` VALUES (5, '绿茶', '500ml', '3', 1, '3.00', NULL, '2020-03-19 12:27:49');
INSERT INTO `shoumaijilu` VALUES (6, '矿泉水', '500ml', '1', 2, '2.00', NULL, '2020-03-19 12:27:49');
INSERT INTO `shoumaijilu` VALUES (7, '澡票1', '成人', '10', 2, '20.00', NULL, '2020-03-19 12:31:52');
INSERT INTO `shoumaijilu` VALUES (8, '澡票2', '儿童', '8', 2, '16.00', NULL, '2020-03-19 12:32:32');
INSERT INTO `shoumaijilu` VALUES (9, '绿茶', '500ml', '3', 1, '3.00', NULL, '2020-03-19 13:19:34');
INSERT INTO `shoumaijilu` VALUES (10, '澡巾1', '优', '10', 1, '10.00', NULL, '2020-03-19 13:20:13');
INSERT INTO `shoumaijilu` VALUES (11, '澡票1', '成人', '10', 1, '10.00', NULL, '2020-03-19 15:31:06');
INSERT INTO `shoumaijilu` VALUES (12, '澡票2', '儿童', '8', 1, '8.00', NULL, '2020-03-19 15:31:07');
INSERT INTO `shoumaijilu` VALUES (13, '按摩', '30分钟', '35', 1, '35.00', NULL, '2020-03-19 15:35:44');
INSERT INTO `shoumaijilu` VALUES (14, '毛巾', '优', '15', 1, '15.00', NULL, '2020-03-19 19:19:35');
INSERT INTO `shoumaijilu` VALUES (15, '澡票2', '儿童', '8', 1, '8.00', 11111, '2020-03-19 21:15:55');
INSERT INTO `shoumaijilu` VALUES (16, '澡巾1', '优', '10', 1, '10.00', 11111, '2020-03-19 21:15:55');
INSERT INTO `shoumaijilu` VALUES (17, '澡票1', '成人', '10', 2, '20.00', 11111, '2020-03-21 15:28:23');
INSERT INTO `shoumaijilu` VALUES (18, '澡票2', '儿童', '8', 2, '16.00', 11111, '2020-03-21 15:28:23');
INSERT INTO `shoumaijilu` VALUES (19, '按摩', '30分钟', '35', 1, '35.00', 11111, '2020-03-21 15:47:11');
INSERT INTO `shoumaijilu` VALUES (20, '搓澡', '优', '10', 1, '10.00', 11111, '2020-03-21 15:47:11');
INSERT INTO `shoumaijilu` VALUES (21, '按摩', '30分钟', '35', 1, '35.00', NULL, '2020-03-21 15:47:16');
INSERT INTO `shoumaijilu` VALUES (22, '搓澡', '优', '10', 1, '10.00', NULL, '2020-03-21 15:47:16');
INSERT INTO `shoumaijilu` VALUES (23, '澡票1', '成人', '10', 2, '20.00', 11111, '2020-03-23 11:04:47');
INSERT INTO `shoumaijilu` VALUES (24, '澡票2', '儿童', '8', 1, '8.00', 11111, '2020-03-23 11:04:47');
INSERT INTO `shoumaijilu` VALUES (25, '澡巾1', '优', '10', 2, '20.00', 11116, '2020-03-23 11:08:18');
INSERT INTO `shoumaijilu` VALUES (26, '澡票2', '儿童', '8', 1, '8.00', 11116, '2020-03-23 11:08:18');
INSERT INTO `shoumaijilu` VALUES (27, '澡票1', '成人', '10', 1, '10.00', 11116, '2020-03-23 11:08:18');
INSERT INTO `shoumaijilu` VALUES (28, '澡票1', '成人', '10', 2, '20.00', NULL, '2020-03-30 15:42:18');
INSERT INTO `shoumaijilu` VALUES (29, '澡票2', '儿童', '8', 1, '8.00', NULL, '2020-03-30 15:42:18');
INSERT INTO `shoumaijilu` VALUES (30, '澡票1', '成人', '10', 1, '10.00', 11111, '2020-03-30 15:42:32');
INSERT INTO `shoumaijilu` VALUES (31, '澡票2', '儿童', '8', 1, '8.00', 11111, '2020-03-30 15:42:32');
INSERT INTO `shoumaijilu` VALUES (32, '澡票1', '成人', '10', 1, '10.00', NULL, '2020-05-02 16:35:47');
INSERT INTO `shoumaijilu` VALUES (33, '澡票2', '儿童', '8', 1, '8.00', NULL, '2020-05-02 16:35:47');
INSERT INTO `shoumaijilu` VALUES (34, '澡巾1', '优', '10', 1, '10.00', NULL, '2020-05-02 16:35:47');
INSERT INTO `shoumaijilu` VALUES (35, '澡票1', '成人', '10', 1, '10.00', 11111, '2020-05-02 16:36:16');
INSERT INTO `shoumaijilu` VALUES (36, '澡票2', '儿童', '8', 1, '8.00', 11111, '2020-05-02 16:36:16');
INSERT INTO `shoumaijilu` VALUES (37, '澡巾1', '优', '10', 1, '10.00', 11111, '2020-05-02 16:36:16');
INSERT INTO `shoumaijilu` VALUES (39, '澡票1', '成人', '10', 1, '10.00', 11112, '2020-05-14 11:01:36');
INSERT INTO `shoumaijilu` VALUES (40, '澡票1', '成人', '10', 1, '10.00', NULL, '2020-05-14 11:01:56');
INSERT INTO `shoumaijilu` VALUES (41, '澡票1', '成人', '10', 1, '10.00', NULL, '2020-05-14 19:55:49');
INSERT INTO `shoumaijilu` VALUES (42, '澡票2', '儿童', '8', 1, '8.00', NULL, '2020-05-14 19:55:50');
INSERT INTO `shoumaijilu` VALUES (43, '毛巾', '优', '15', 1, '15.00', NULL, '2020-05-14 19:55:50');
INSERT INTO `shoumaijilu` VALUES (44, '澡票1', '成人', '10', 1, '10.00', 11112, '2020-05-14 19:56:05');
INSERT INTO `shoumaijilu` VALUES (45, '澡票2', '儿童', '8', 1, '8.00', 11112, '2020-05-14 19:56:05');
INSERT INTO `shoumaijilu` VALUES (46, '澡票1', '成人', '10', 1, '10.00', 11111, '2020-05-16 16:44:03');
INSERT INTO `shoumaijilu` VALUES (47, '澡巾1', '优', '10', 1, '10.00', 11111, '2020-05-16 16:44:03');
INSERT INTO `shoumaijilu` VALUES (48, '绿茶', '500ml', '3', 1, '3.00', 11111, '2020-05-16 16:44:03');
INSERT INTO `shoumaijilu` VALUES (49, '矿泉水', '500ml', '1', 1, '1.00', 11111, '2020-05-16 16:44:03');
INSERT INTO `shoumaijilu` VALUES (50, '澡票1', '成人', '10', 1, '10.00', NULL, '2020-05-16 16:44:27');
INSERT INTO `shoumaijilu` VALUES (51, '澡巾1', '优', '10', 1, '10.00', NULL, '2020-05-16 16:44:27');
INSERT INTO `shoumaijilu` VALUES (52, '绿茶', '500ml', '3', 1, '3.00', NULL, '2020-05-16 16:44:27');
INSERT INTO `shoumaijilu` VALUES (53, '矿泉水', '500ml', '1', 1, '1.00', NULL, '2020-05-16 16:44:27');

-- ----------------------------
-- Table structure for todolist
-- ----------------------------
DROP TABLE IF EXISTS `todolist`;
CREATE TABLE `todolist`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `theme` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `faqiPeople` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `themeState` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of todolist
-- ----------------------------
INSERT INTO `todolist` VALUES (1, '修理', '南部水龙头坏一个', '2020-02-24 17:37:56', '张三', '未完成');
INSERT INTO `todolist` VALUES (2, '修理', '女布淋浴坏一个', '2020-02-25 17:38:45', '李四', '完成');
INSERT INTO `todolist` VALUES (3, NULL, '买一个拖把', '2020-03-16 00:00:00', '王五', '未完成');
INSERT INTO `todolist` VALUES (4, NULL, '买水', '2020-03-17 00:00:00', '张卫国', '未完成');

SET FOREIGN_KEY_CHECKS = 1;
