/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : jxj_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-07-03 14:11:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_colleage`
-- ----------------------------
DROP TABLE IF EXISTS `t_colleage`;
CREATE TABLE `t_colleage` (
  `collleageId` int(11) NOT NULL auto_increment COMMENT '学院id',
  `colleageName` varchar(20) NOT NULL COMMENT '学院名称',
  `colleageMemo` varchar(800) default NULL COMMENT '学院备注',
  PRIMARY KEY  (`collleageId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_colleage
-- ----------------------------
INSERT INTO `t_colleage` VALUES ('1', '信息工程学院', '搞信息工程的');
INSERT INTO `t_colleage` VALUES ('2', '外国语学院', '学外语的');

-- ----------------------------
-- Table structure for `t_family`
-- ----------------------------
DROP TABLE IF EXISTS `t_family`;
CREATE TABLE `t_family` (
  `familyId` int(11) NOT NULL auto_increment COMMENT '记录id',
  `userObj` varchar(30) NOT NULL COMMENT '学生',
  `familyDesc` varchar(8000) NOT NULL COMMENT '家庭情况',
  `updateTime` varchar(20) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`familyId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_family_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_family
-- ----------------------------
INSERT INTO `t_family` VALUES ('1', 'STU001', '<p>爸爸：双大神</p><p>妈妈：李小花</p>', '2018-03-17 23:36:59');

-- ----------------------------
-- Table structure for `t_fdy`
-- ----------------------------
DROP TABLE IF EXISTS `t_fdy`;
CREATE TABLE `t_fdy` (
  `fdyUserName` varchar(30) NOT NULL COMMENT 'fdyUserName',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `fdyMemo` varchar(800) default NULL COMMENT '辅导员备注',
  PRIMARY KEY  (`fdyUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fdy
-- ----------------------------
INSERT INTO `t_fdy` VALUES ('fdy1', '123', '李开秦', '男', '2018-03-01', '13958083943', 'kaiqing@163.com', '辅导员测试！');
INSERT INTO `t_fdy` VALUES ('fdy2', '123', '李旺', '男', '2018-03-06', '13085983934', 'liwang@163.com', '测试辅导员');

-- ----------------------------
-- Table structure for `t_jxj`
-- ----------------------------
DROP TABLE IF EXISTS `t_jxj`;
CREATE TABLE `t_jxj` (
  `jxjId` int(11) NOT NULL auto_increment COMMENT '记录id',
  `jxjTypeObj` int(11) NOT NULL COMMENT '奖学金类型',
  `title` varchar(80) NOT NULL COMMENT '申请标题',
  `content` varchar(800) NOT NULL COMMENT '申请描述',
  `sqcl` varchar(60) NOT NULL COMMENT '申请材料',
  `userObj` varchar(30) NOT NULL COMMENT '申请学生',
  `fdyState` varchar(20) NOT NULL COMMENT '辅导员审核状态',
  `fdyUserName` varchar(20) NOT NULL COMMENT '审核的辅导员',
  `glState` varchar(20) NOT NULL COMMENT '管理员审核状态',
  `glResult` varchar(500) NOT NULL COMMENT '管理员审核结果',
  PRIMARY KEY  (`jxjId`),
  KEY `jxjTypeObj` (`jxjTypeObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_jxj_ibfk_1` FOREIGN KEY (`jxjTypeObj`) REFERENCES `t_jxjtype` (`typeId`),
  CONSTRAINT `t_jxj_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jxj
-- ----------------------------
INSERT INTO `t_jxj` VALUES ('1', '1', '我要申请一等奖学金！', '我的成绩非常好，希望领导们通过!', 'upload/2098c1ca-deb0-431e-92ec-f00a5f23d3f4.doc', 'STU001', '审核通过', 'fdy1', '审核通过', '予以通过');
INSERT INTO `t_jxj` VALUES ('2', '2', '我要申请二等奖学金', '我的成绩算不错的，家庭也比较困难，想要奖学金缓解压力！', 'upload/85739766-ef8d-4086-975e-346670a11897.doc', 'STU002', '审核通过', 'fdy1', '审核通过', '可以通过');

-- ----------------------------
-- Table structure for `t_jxjtype`
-- ----------------------------
DROP TABLE IF EXISTS `t_jxjtype`;
CREATE TABLE `t_jxjtype` (
  `typeId` int(11) NOT NULL auto_increment COMMENT '类别id',
  `typeName` varchar(20) NOT NULL COMMENT '类别名称',
  `jxjMoney` float NOT NULL COMMENT '奖学金金额',
  `pdbz` varchar(800) NOT NULL COMMENT '评定标准',
  `addTime` varchar(20) default NULL COMMENT '添加时间',
  PRIMARY KEY  (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jxjtype
-- ----------------------------
INSERT INTO `t_jxjtype` VALUES ('1', '校极一等奖学金', '8000', '全校前5名可以参选', '2018-03-01 17:39:30');
INSERT INTO `t_jxjtype` VALUES ('2', '校极二等奖学金', '5000', '全校前10名可以参选', '2018-03-14 11:34:50');
INSERT INTO `t_jxjtype` VALUES ('3', '院极一等奖学金', '3000', '在学生自己所在学院前5名评选', '2018-03-06 11:35:27');

-- ----------------------------
-- Table structure for `t_score`
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score` (
  `scoreId` int(11) NOT NULL auto_increment COMMENT '成绩id',
  `termObj` int(11) NOT NULL COMMENT '所在学期',
  `userObj` varchar(30) NOT NULL COMMENT '学生',
  `colleageObj` int(11) NOT NULL COMMENT '所在学院',
  `zhcj` float NOT NULL COMMENT '综合成绩',
  `scoreDesc` varchar(8000) NOT NULL COMMENT '详细成绩',
  `scoreMemo` varchar(800) default NULL COMMENT '成绩备注',
  PRIMARY KEY  (`scoreId`),
  KEY `termObj` (`termObj`),
  KEY `userObj` (`userObj`),
  KEY `colleageObj` (`colleageObj`),
  CONSTRAINT `t_score_ibfk_1` FOREIGN KEY (`termObj`) REFERENCES `t_terminfo` (`termId`),
  CONSTRAINT `t_score_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`),
  CONSTRAINT `t_score_ibfk_3` FOREIGN KEY (`colleageObj`) REFERENCES `t_colleage` (`collleageId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_score
-- ----------------------------
INSERT INTO `t_score` VALUES ('1', '1', 'STU001', '1', '620', '<p>高等数学 &nbsp;98</p><p>大学英语 96</p><p>计算机基础 90</p><p>大学物理 99</p><p><br/></p><p>。。。。</p>', '--');
INSERT INTO `t_score` VALUES ('2', '1', 'STU002', '1', '630', '<p style=\"white-space: normal;\">高等数学 &nbsp;98</p><p style=\"white-space: normal;\">大学英语 96</p><p style=\"white-space: normal;\">计算机基础 90</p><p style=\"white-space: normal;\">大学物理 99</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">。。。。</p><p><br/></p>', 'test');

-- ----------------------------
-- Table structure for `t_terminfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_terminfo`;
CREATE TABLE `t_terminfo` (
  `termId` int(11) NOT NULL auto_increment COMMENT '学期id',
  `termName` varchar(20) NOT NULL COMMENT '学期名称',
  PRIMARY KEY  (`termId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_terminfo
-- ----------------------------
INSERT INTO `t_terminfo` VALUES ('1', '2018年上学期');
INSERT INTO `t_terminfo` VALUES ('2', '2017年下学期');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `colleageObj` int(11) NOT NULL COMMENT '所在学院',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '学生照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`),
  KEY `colleageObj` (`colleageObj`),
  CONSTRAINT `t_userinfo_ibfk_1` FOREIGN KEY (`colleageObj`) REFERENCES `t_colleage` (`collleageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('STU001', '123', '1', '双鱼林', '男', '2018-03-02', 'upload/dfbd4358-f451-4447-9e85-b50e251ad45f.jpg', '13573598343', 'shuaglin@163.com', '四川成都红星路13号', '2018-03-10 17:38:24');
INSERT INTO `t_userinfo` VALUES ('STU002', '123', '1', '王志芬', '女', '2018-03-07', 'upload/02471628-40f6-43a3-ae24-780d7f4228c3.jpg', '13589834234', 'zhifen@163.com', '四川成都红星路13号', '2018-03-17 15:03:07');
