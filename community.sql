unlock tables;
DROP DATABASE IF EXISTS community;
create database community;
use community;

-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: community
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `camerainfo`
--

DROP TABLE IF EXISTS `camera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camera` (
  `cameraInfo_id` bigint NOT NULL AUTO_INCREMENT,
  `community_id` bigint DEFAULT NULL COMMENT '小区ID',
  `camera_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '摄像头名称',
  `mac_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '唯一MAC地址',
  `direction` int DEFAULT NULL COMMENT '出入方向（1进，2出）',
  `state` int DEFAULT NULL COMMENT '状态（1启用，2禁用）',
  `seq` bigint DEFAULT NULL COMMENT '序号',
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`cameraInfo_id`) USING BTREE,
  UNIQUE KEY `uni_macId` (`mac_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camerainfo`
--

/*!40000 ALTER TABLE `camera` DISABLE KEYS */;
INSERT INTO `camera` VALUES (2,3,'1号摄像头','192.168.0.1',1,1,1,'admin','2021-02-06 04:03:17',''),(3,3,'2号摄像头','192.168.0.2',2,1,2,'admin','2021-02-06 04:10:51',''),(12,2,'1号摄像头','127.0.0.1',1,1,1,'admin','2023-07-21 14:59:31','');
/*!40000 ALTER TABLE `camera` ENABLE KEYS */;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `community_id` int NOT NULL AUTO_INCREMENT,
  `community_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '小区名称',
  `term_count` int DEFAULT NULL COMMENT '楼栋数量',
  `seq` int DEFAULT NULL COMMENT '序号',
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `lng` float(11,6) DEFAULT NULL COMMENT '经度',
  `lat` float(11,6) DEFAULT NULL COMMENT '维度',
  PRIMARY KEY (`community_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (2,'栖海澐颂',200,20,'admin','2021-01-19 03:00:02',116.252403,40.096100),(3,'宸悦国际',120,30,'admin','2021-01-19 12:24:26',116.414597,40.113159),(9,'流星花园二区',33,90,'admin','2021-02-06 08:48:16',116.342979,40.093117),(11,'农学院家属院',20,110,'admin','2022-04-02 07:24:13',116.312241,40.098129),(12,'金达园',20,120,'admin','2022-04-11 08:03:56',116.328964,40.065544),(13,'建发城建·文源府',30,130,'admin','2022-04-11 08:04:28',116.299438,40.087421),(17,'都市田园',10,170,'admin','2023-07-17 16:38:06',116.362061,40.088108),(19,'北清云际',33,190,'admin','2023-07-17 16:41:20',116.298904,40.091644),(34,'奥森春晓',11,130,'admin','2023-07-21 14:59:04',116.350754,40.098179),(35,'丽都壹号·峯境',22,160,'admin','2023-07-21 14:59:11',116.512962,39.985027),(57,'1',1,1,'admin','2023-07-21 17:38:59',1.000000,1.000000);
/*!40000 ALTER TABLE `community` ENABLE KEYS */;

--
-- Table structure for table `in_out_record`
--

DROP TABLE IF EXISTS `in_out_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_out_record` (
  `in_out_record_id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL COMMENT '人员ID',
  `community_id` int NOT NULL COMMENT '小区ID',
  `in_time` timestamp NULL DEFAULT NULL COMMENT '进场时间',
  `out_time` timestamp NULL DEFAULT NULL COMMENT '出场时间',
  `in_pic` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入场图片',
  `out_pic` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '出场图片',
  PRIMARY KEY (`in_out_record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in_out_record`
--

/*!40000 ALTER TABLE `in_out_record` DISABLE KEYS */;
INSERT INTO `in_out_record` VALUES (72,95,2,'2023-07-21 17:18:02','2023-07-21 17:18:20','http://localhost:8282/community/upload/face/6eb750c3-d709-46ab-87d0-cad7bcd3937d.png','http://localhost:8282/community/upload/face/5f295a1f-b905-4536-8b0d-c997ecac0431.png'),(73,95,2,'2023-07-21 17:18:47','2023-07-21 17:18:54','http://localhost:8282/community/upload/face/52b5f9ee-f5b4-4717-b859-75ac522fcf56.png','http://localhost:8282/community/upload/face/3e3cd7ac-efce-4fd7-a11c-d384efba2994.png'),(74,95,2,'2023-07-21 17:19:49',NULL,'http://localhost:8282/community/upload/face/f7a7fb6d-8b4e-40c3-9de6-c73a98abd668.png',NULL),(75,91,2,'2023-07-22 06:45:29',NULL,'http://localhost:8282/community/upload/face/cfb6bdb7-8b5b-4112-9b29-7de594755ba2.png',NULL);
/*!40000 ALTER TABLE `in_out_record` ENABLE KEYS */;

--
-- Table structure for table `manual_record`
--

DROP TABLE IF EXISTS `manual_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manual_record` (
  `manual_record_id` int NOT NULL AUTO_INCREMENT,
  `community_id` int NOT NULL COMMENT '小区ID',
  `visitor` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '访客姓名',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `card_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证号码',
  `term_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋名称',
  `house_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '房号',
  `interviewee` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '受访者',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `in_time` timestamp NULL DEFAULT NULL COMMENT '进场时间',
  `out_time` timestamp NULL DEFAULT NULL COMMENT '出场时间',
  `user_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登记人',
  `sign_time` datetime DEFAULT NULL COMMENT '登记时间',
  PRIMARY KEY (`manual_record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual_record`
--

/*!40000 ALTER TABLE `manual_record` DISABLE KEYS */;
INSERT INTO `manual_record` VALUES (1,2,'刘伟','15374363882','123456789','2栋','808','丽丽','拜访','2022-04-06 09:35:55','2022-04-08 09:35:59','admin','2022-04-08 11:59:42'),(17,3,'张三','13312345678','123456789','11栋','123','李四','朋友聚会','2023-07-21 14:58:34','2023-07-17 14:00:00','admin','2023-07-21 22:58:34');
/*!40000 ALTER TABLE `manual_record` ENABLE KEYS */;

--
-- Table structure for table `personinfo`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `community_id` int DEFAULT NULL COMMENT '小区id',
  `term_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '所在楼栋',
  `house_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '房号',
  `user_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '男' COMMENT '性别(男/女)',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号',
  `face_url` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '人脸图片',
  `person_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '人员类别（常住居民，企业员工，居住性质)',
  `state` int DEFAULT '1' COMMENT '类别(1：未验证，2：已验证)',
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `face_base` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`person_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1794 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求方法',
  `params` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '请求参数',
  `time` int NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'IP地址',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='操作日志表';

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单URL',
  `component` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组件路径',
  `menu_type` tinyint(1) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单图标',
  `sort` int DEFAULT NULL COMMENT '排序',
  `hidden` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1127 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,0,'系统管理','/sys','',1,1,'system',3,'false'),(2,1,'用户管理','/user','sys/user/index',2,1,'user',10,'false'),(3,1,'角色管理','/role','sys/role/index',2,1,'people',11,'false'),(4,1,'菜单管理','/menu','sys/menu/index',2,1,'tree-table',12,'false'),(5,1,'日志管理','/log','sys/log/index',2,1,'form',13,'false'),(6,9,'居民管理','/person','sys/person/index',1,1,'peoples',5,'false'),(7,9,'小区管理','/community','sys/community/index',1,1,'table',4,'false'),(8,14,'访客登记','/manual','sys/manual/index',2,1,'logininfor',9,'false'),(9,0,'物业管理','/community','',1,1,'tab',1,'false'),(10,1,'系统设置','/server','sys/liveServer/index',1,1,'user',15,'true'),(11,9,'摄像头管理','/camera','sys/camera/index',1,1,'radio',14,'true'),(12,14,'人脸识别','/identify','sys/inOut/index',2,1,'eye-open',7,'false'),(13,14,'出入记录','/inOut','sys/inOut/inOutRecord',2,1,'log',8,'false'),(14,0,'门禁管理','/manualMgr','',1,1,'monitor',2,'false'),(15,9,'小区地图','/map','sys/map/index',2,1,'international',6,'false');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `type` int DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE KEY `role_name` (`role_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'超级管理员',1,'具有所有权限的操作','2017-11-21 03:42:11'),(7,'普通管理员',2,'普通角色','2020-12-01 11:15:29');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_menu` (
  `role_id` int NOT NULL COMMENT '角色ID',
  `menu_id` int NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

/*!40000 ALTER TABLE `role_menu` DISABLE KEYS */;
INSERT INTO `role_menu` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(7,1),(7,2),(7,9),(7,13),(7,14),(7,15);
/*!40000 ALTER TABLE `role_menu` ENABLE KEYS */;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `real_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '真实姓名',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `status` int DEFAULT NULL COMMENT '状态  0正常   1禁用',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','管理员','张三','13312345678',1),(39,'test','96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e','张三','李四','13332145678',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` int NOT NULL COMMENT '用户ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(39,7);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-22 14:47:13
