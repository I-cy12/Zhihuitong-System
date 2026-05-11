/*
SQLyog Ultimate v8.32 
MySQL - 8.0.26 : Database - zhihuitong
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zhihuitong` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `zhihuitong`;

/*Table structure for table `stu_note_search` */

DROP TABLE IF EXISTS `stu_note_search`;

CREATE TABLE `stu_note_search` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `note_id` bigint NOT NULL COMMENT '关联笔记ID',
  `title` varchar(500) DEFAULT '' COMMENT '笔记标题',
  `tags` varchar(255) DEFAULT '' COMMENT '笔记标签',
  `student_name` varchar(64) DEFAULT '' COMMENT '学生姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_note_id` (`note_id`),
  FULLTEXT KEY `ft_title_tags` (`title`,`tags`) COMMENT '全文检索索引'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='笔记搜索表';

/*Data for the table `stu_note_search` */

insert  into `stu_note_search`(`id`,`note_id`,`title`,`tags`,`student_name`,`create_time`) values (1,1,'第1章：软件工程概述','概念,导论,复习','学生','2026-05-09 08:55:32'),(2,2,'SQL：DML 与 DDL 对比','数据库,SQL,总结','学生','2026-05-09 08:55:32'),(3,3,'链表与数组的差异','数据结构,链表,数组','学生','2026-05-09 08:55:32'),(4,4,'封装/继承/多态要点','Java,OOP,重点','学生','2026-05-09 08:55:32'),(5,5,'本周学习计划','计划,待办,复盘','学生','2026-05-09 08:55:32'),(6,6,'待办事项','复习导论','小明','2026-05-09 10:32:49');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
