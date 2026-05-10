/*
 Navicat Premium Dump SQL

 Source Server         : db
 Source Server Type    : MySQL
 Source Server Version : 90300 (9.3.0)
 Source Host           : localhost:3306
 Source Schema         : zhihuitong

 Target Server Type    : MySQL
 Target Server Version : 90300 (9.3.0)
 File Encoding         : 65001

 Date: 10/05/2026 19:09:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `form_col_num` int NULL DEFAULT 1 COMMENT '表单布局（单列 双列 三列）',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'stu_course', '学生课表', NULL, NULL, 'StuCourse', 'crud', 'element-plus-typescript', 'com.zhihuitong.course', 'course', 'course', '课表管理', 'ruoyi', 1, '0', '/', '{\"genView\":\"0\",\"parentMenuId\":2000}', 'admin', '2026-05-07 16:09:43', '', '2026-05-08 14:28:04', NULL);
INSERT INTO `gen_table` VALUES (2, 'stu_note', '学习笔记', NULL, NULL, 'StuNote', 'crud', 'element-plus-typescript', 'com.zhihuitong.note', 'note', 'note', '学习笔记', 'ruoyi', 1, '0', '/', '{\"genView\":\"0\",\"parentMenuId\":2021}', 'admin', '2026-05-09 09:09:53', '', '2026-05-09 10:02:04', NULL);
INSERT INTO `gen_table` VALUES (3, 'stu_note_template', '笔记模板表', NULL, NULL, 'StuNoteTemplate', 'crud', 'element-plus-typescript', 'com.zhihuitong.template', 'template', 'template', '笔记模板', 'ruoyi', 1, '0', '/', '{\"genView\":\"0\",\"parentMenuId\":2021}', 'admin', '2026-05-09 10:07:28', '', '2026-05-09 10:08:25', NULL);
INSERT INTO `gen_table` VALUES (4, 'sys_campus_knowledge', '校园知识内容表', NULL, NULL, 'SysCampusKnowledge', 'crud', 'element-plus-typescript', 'com.zhihuitong.knowledge', 'knowledge', 'knowledge', '校园知识内容', 'ruoyi', 1, '0', '/', '{\"genView\":\"0\",\"parentMenuId\":2052}', 'admin', '2026-05-10 07:06:50', '', '2026-05-10 07:44:33', NULL);
INSERT INTO `gen_table` VALUES (5, 'sys_campus_knowledge_type', '校园知识分类表', NULL, NULL, 'SysCampusKnowledgeType', 'crud', 'element-plus-typescript', 'com.zhihuitong.knowledge', 'knowledge', 'type', '校园知识分类', 'ruoyi', 1, '0', '/', '{\"genView\":\"0\",\"parentMenuId\":2052}', 'admin', '2026-05-10 07:06:50', '', '2026-05-10 07:44:49', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '主键ID', 'int', 'Integer', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-05-07 16:09:43', '', '2026-05-08 14:28:04');
INSERT INTO `gen_table_column` VALUES (2, 1, 'student_id', '学生ID（对应学号/用户ID）', 'int', 'Integer', 'studentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2026-05-07 16:09:43', '', '2026-05-08 14:28:04');
INSERT INTO `gen_table_column` VALUES (3, 1, 'term', '学期标识（示例：2025-2026-1）', 'varchar(20)', 'String', 'term', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2026-05-07 16:09:43', '', '2026-05-08 14:28:04');
INSERT INTO `gen_table_column` VALUES (4, 1, 'name', '课程名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2026-05-07 16:09:43', '', '2026-05-08 14:28:04');
INSERT INTO `gen_table_column` VALUES (5, 1, 'teacher', '任课教师', 'varchar(50)', 'String', 'teacher', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2026-05-07 16:09:43', '', '2026-05-08 14:28:04');
INSERT INTO `gen_table_column` VALUES (6, 1, 'day_of_week', '星期几（1=周一…7=周日）', 'int', 'Integer', 'dayOfWeek', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'course_week', 6, 'admin', '2026-05-07 16:09:43', '', '2026-05-08 14:28:04');
INSERT INTO `gen_table_column` VALUES (7, 1, 'start_section', '开始节次（从1开始）', 'int', 'Integer', 'startSection', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2026-05-07 16:09:43', '', '2026-05-08 14:28:04');
INSERT INTO `gen_table_column` VALUES (8, 1, 'end_section', '结束节次（&gt;=开始节次）', 'int', 'Integer', 'endSection', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2026-05-07 16:09:43', '', '2026-05-08 14:28:04');
INSERT INTO `gen_table_column` VALUES (9, 1, 'location', '上课地点（教学楼/教室）', 'varchar(100)', 'String', 'location', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2026-05-07 16:09:43', '', '2026-05-08 14:28:04');
INSERT INTO `gen_table_column` VALUES (10, 1, 'remark', '备注（如：专业核心/专业基础/方向课）', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2026-05-07 16:09:43', '', '2026-05-08 14:28:04');
INSERT INTO `gen_table_column` VALUES (11, 1, 'created_at', '创建时间', 'datetime', 'Date', 'createdAt', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'datetime', '', 11, 'admin', '2026-05-07 16:09:43', '', '2026-05-08 14:28:04');
INSERT INTO `gen_table_column` VALUES (12, 1, 'updated_at', '更新时间', 'datetime', 'Date', 'updatedAt', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 12, 'admin', '2026-05-07 16:09:43', '', '2026-05-08 14:28:04');
INSERT INTO `gen_table_column` VALUES (13, 2, 'id', '主键ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-05-09 09:09:53', '', '2026-05-09 10:28:04');
INSERT INTO `gen_table_column` VALUES (14, 2, 'student_id', '学生ID（对应学号/用户ID）', 'int', 'Long', 'studentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2026-05-09 09:09:53', '', '2026-05-09 10:28:04');
INSERT INTO `gen_table_column` VALUES (15, 2, 'course_id', '关联课程ID（可选，对应 stu_course.id）', 'int', 'Long', 'courseId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2026-05-09 09:09:53', '', '2026-05-09 10:28:04');
INSERT INTO `gen_table_column` VALUES (16, 2, 'course_name_snapshot', '课程名称快照（可选；课程被改名/删除后仍可显示）', 'varchar(100)', 'String', 'courseNameSnapshot', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2026-05-09 09:09:53', '', '2026-05-09 10:28:05');
INSERT INTO `gen_table_column` VALUES (17, 2, 'title', '笔记标题', 'varchar(200)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2026-05-09 09:09:53', '', '2026-05-09 10:28:05');
INSERT INTO `gen_table_column` VALUES (18, 2, 'content', '笔记内容（纯文本/Markdown均可存）', 'longtext', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'editor', '', 6, 'admin', '2026-05-09 09:09:53', '', '2026-05-09 10:28:05');
INSERT INTO `gen_table_column` VALUES (19, 2, 'tags', '标签（逗号分隔，如：需求,设计,复习）', 'varchar(500)', 'String', 'tags', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'textarea', '', 7, 'admin', '2026-05-09 09:09:53', '', '2026-05-09 10:28:05');
INSERT INTO `gen_table_column` VALUES (20, 2, 'created_at', '创建时间', 'datetime', 'Date', 'createdAt', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'datetime', '', 8, 'admin', '2026-05-09 09:09:53', '', '2026-05-09 10:28:05');
INSERT INTO `gen_table_column` VALUES (21, 2, 'updated_at', '更新时间', 'datetime', 'Date', 'updatedAt', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2026-05-09 09:09:53', '', '2026-05-09 10:28:05');
INSERT INTO `gen_table_column` VALUES (23, 3, 'id', '主键ID', 'int', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-05-09 10:07:28', '', '2026-05-09 10:08:25');
INSERT INTO `gen_table_column` VALUES (24, 3, 'student_id', '学生ID（为空表示系统内置模板；不为空表示学生自定义模板）', 'int', 'Long', 'studentId', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2026-05-09 10:07:28', '', '2026-05-09 10:08:25');
INSERT INTO `gen_table_column` VALUES (25, 3, 'name', '模板名称', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2026-05-09 10:07:28', '', '2026-05-09 10:08:25');
INSERT INTO `gen_table_column` VALUES (26, 3, 'type', '模板类型（CLASS/EXPERIMENT/INTERVIEW/CUSTOM）', 'varchar(20)', 'String', 'type', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'select', '', 4, 'admin', '2026-05-09 10:07:28', '', '2026-05-09 10:08:25');
INSERT INTO `gen_table_column` VALUES (27, 3, 'content', '模板内容（纯文本/Markdown）', 'longtext', 'String', 'content', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'editor', '', 5, 'admin', '2026-05-09 10:07:28', '', '2026-05-09 10:08:25');
INSERT INTO `gen_table_column` VALUES (28, 3, 'sort_no', '排序号（越小越靠前）', 'int', 'Long', 'sortNo', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2026-05-09 10:07:28', '', '2026-05-09 10:08:25');
INSERT INTO `gen_table_column` VALUES (29, 3, 'status', '状态（0启用 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'radio', '', 7, 'admin', '2026-05-09 10:07:28', '', '2026-05-09 10:08:25');
INSERT INTO `gen_table_column` VALUES (30, 3, 'created_at', '创建时间', 'datetime', 'Date', 'createdAt', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'datetime', '', 8, 'admin', '2026-05-09 10:07:28', '', '2026-05-09 10:08:25');
INSERT INTO `gen_table_column` VALUES (31, 3, 'updated_at', '更新时间', 'datetime', 'Date', 'updatedAt', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 9, 'admin', '2026-05-09 10:07:28', '', '2026-05-09 10:08:25');
INSERT INTO `gen_table_column` VALUES (32, 2, 'cover_image', '笔记封面', 'varchar(255)', 'String', 'coverImage', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'imageUpload', '', 10, '', '2026-05-09 10:28:05', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, 4, 'id', '主键ID', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-05-10 07:06:50', '', '2026-05-10 07:44:33');
INSERT INTO `gen_table_column` VALUES (34, 4, 'type_id', '分类ID', 'bigint', 'Long', 'typeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', 'rules_regulations', 2, 'admin', '2026-05-10 07:06:50', '', '2026-05-10 07:44:33');
INSERT INTO `gen_table_column` VALUES (35, 4, 'title', '知识标题', 'varchar(200)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2026-05-10 07:06:50', '', '2026-05-10 07:44:33');
INSERT INTO `gen_table_column` VALUES (36, 4, 'content', '富文本正文内容', 'longtext', 'String', 'content', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'editor', '', 4, 'admin', '2026-05-10 07:06:50', '', '2026-05-10 07:44:33');
INSERT INTO `gen_table_column` VALUES (37, 4, 'file_url', '附件地址（PDF/Word）', 'varchar(500)', 'String', 'fileUrl', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 5, 'admin', '2026-05-10 07:06:50', '', '2026-05-10 07:44:33');
INSERT INTO `gen_table_column` VALUES (38, 4, 'status', '状态 0草稿 1已发布', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_campus_knowledge', 6, 'admin', '2026-05-10 07:06:50', '', '2026-05-10 07:44:33');
INSERT INTO `gen_table_column` VALUES (39, 4, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2026-05-10 07:06:50', '', '2026-05-10 07:44:33');
INSERT INTO `gen_table_column` VALUES (40, 4, 'create_time', NULL, 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2026-05-10 07:06:50', '', '2026-05-10 07:44:34');
INSERT INTO `gen_table_column` VALUES (41, 4, 'update_time', NULL, 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2026-05-10 07:06:50', '', '2026-05-10 07:44:34');
INSERT INTO `gen_table_column` VALUES (42, 5, 'id', '主键ID', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-05-10 07:06:50', '', '2026-05-10 07:44:49');
INSERT INTO `gen_table_column` VALUES (43, 5, 'type_name', '分类名称：规章制度/办事流程/校风校纪/通告批评', 'varchar(50)', 'String', 'typeName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', 'rules_regulations', 2, 'admin', '2026-05-10 07:06:50', '', '2026-05-10 07:44:49');
INSERT INTO `gen_table_column` VALUES (44, 5, 'sort', '排序号', 'int', 'Long', 'sort', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2026-05-10 07:06:50', '', '2026-05-10 07:44:49');
INSERT INTO `gen_table_column` VALUES (45, 5, 'status', '状态 0正常 1停用', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'sys_campus_knowledge_type', 4, 'admin', '2026-05-10 07:06:50', '', '2026-05-10 07:44:49');
INSERT INTO `gen_table_column` VALUES (46, 5, 'create_time', NULL, 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2026-05-10 07:06:50', '', '2026-05-10 07:44:49');

-- ----------------------------
-- Table structure for stu_course
-- ----------------------------
DROP TABLE IF EXISTS `stu_course`;
CREATE TABLE `stu_course`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `student_id` int NOT NULL COMMENT '学生ID（对应学号/用户ID）',
  `term` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学期标识（示例：2025-2026-1）',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名称',
  `teacher` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任课教师',
  `day_of_week` int NOT NULL COMMENT '星期几（1=周一…7=周日）',
  `start_section` int NOT NULL COMMENT '开始节次（从1开始）',
  `end_section` int NOT NULL COMMENT '结束节次（>=开始节次）',
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上课地点（教学楼/教室）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注（如：专业核心/专业基础/方向课）',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_student_term`(`student_id` ASC, `term` ASC) USING BTREE,
  INDEX `idx_course_weekview`(`student_id` ASC, `term` ASC, `day_of_week` ASC, `start_section` ASC) USING BTREE,
  CONSTRAINT `ck_course_day` CHECK (`day_of_week` between 1 and 7),
  CONSTRAINT `ck_course_section` CHECK ((`start_section` >= 1) and (`end_section` >= `start_section`))
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生课表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_course
-- ----------------------------
INSERT INTO `stu_course` VALUES (1, 10001, '2025-2026-1', '软件工程导论', '刘老师', 1, 1, 2, '信息楼201', '专业核心', '2026-05-07 16:09:05', '2026-05-07 16:09:05');
INSERT INTO `stu_course` VALUES (2, 10001, '2025-2026-1', '面向对象程序设计(Java)', '赵老师', 1, 3, 4, '信息楼305', '专业核心', '2026-05-07 16:09:05', '2026-05-07 16:09:05');
INSERT INTO `stu_course` VALUES (3, 10001, '2025-2026-1', '数据结构与算法', '王老师', 2, 1, 2, '信息楼108', '专业核心', '2026-05-07 16:09:05', '2026-05-07 16:09:05');
INSERT INTO `stu_course` VALUES (4, 10001, '2025-2026-1', '数据库系统原理', '周老师', 2, 3, 4, '信息楼210', '专业核心', '2026-05-07 16:09:05', '2026-05-07 16:09:05');
INSERT INTO `stu_course` VALUES (5, 10001, '2025-2026-1', '操作系统', '吴老师', 3, 1, 2, '理科楼110', '专业基础', '2026-05-07 16:09:05', '2026-05-07 16:09:05');
INSERT INTO `stu_course` VALUES (6, 10001, '2025-2026-1', '计算机网络', '郑老师', 3, 3, 4, '理科楼212', '专业基础', '2026-05-07 16:09:05', '2026-05-07 16:09:05');
INSERT INTO `stu_course` VALUES (7, 10001, '2025-2026-1', '软件需求工程', '陈老师', 4, 1, 2, '信息楼302', '专业核心', '2026-05-07 16:09:05', '2026-05-07 16:09:05');
INSERT INTO `stu_course` VALUES (8, 10001, '2025-2026-1', '软件测试技术', '孙老师', 4, 3, 4, '信息楼403', '专业核心', '2026-05-07 16:09:05', '2026-05-07 16:09:05');
INSERT INTO `stu_course` VALUES (9, 10001, '2025-2026-1', '软件项目管理', '冯老师', 5, 1, 2, '二教B401', '专业核心', '2026-05-07 16:09:05', '2026-05-07 16:09:05');
INSERT INTO `stu_course` VALUES (10, 10001, '2025-2026-1', 'Web应用开发', '李老师', 5, 3, 4, '信息楼501', '专业方向', '2026-05-07 16:09:05', '2026-05-07 16:09:05');

-- ----------------------------
-- Table structure for stu_note
-- ----------------------------
DROP TABLE IF EXISTS `stu_note`;
CREATE TABLE `stu_note`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `student_id` int NOT NULL COMMENT '学生ID（对应学号/用户ID）',
  `course_id` int NULL DEFAULT NULL COMMENT '关联课程ID（可选，对应 stu_course.id）',
  `course_name_snapshot` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程名称快照（可选；课程被改名/删除后仍可显示）',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '笔记标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '笔记内容（纯文本/Markdown均可存）',
  `tags` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签（逗号分隔，如：需求,设计,复习）',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '笔记封面',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_note_student`(`student_id` ASC) USING BTREE,
  INDEX `idx_note_student_course`(`student_id` ASC, `course_id` ASC) USING BTREE,
  INDEX `idx_note_student_time`(`student_id` ASC, `updated_at` ASC) USING BTREE,
  INDEX `fk_note_course`(`course_id` ASC) USING BTREE,
  FULLTEXT INDEX `ft_note_search`(`title`, `content`, `tags`),
  CONSTRAINT `fk_note_course` FOREIGN KEY (`course_id`) REFERENCES `stu_course` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学习笔记' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_note
-- ----------------------------
INSERT INTO `stu_note` VALUES (1, 10001, 1, '软件工程导论', '第1章：软件工程概述', '软件工程的目标：在质量、成本、进度之间取得平衡。\n核心：过程、方法、工具。', '概念,导论,复习', '2026-05-09 08:55:32', '2026-05-09 08:55:32', NULL);
INSERT INTO `stu_note` VALUES (2, 10001, 4, '数据库系统原理', 'SQL：DML 与 DDL 对比', 'DDL：CREATE/ALTER/DROP\nDML：SELECT/INSERT/UPDATE/DELETE\n注意事务与约束的影响。', '数据库,SQL,总结', '2026-05-09 08:55:32', '2026-05-09 08:55:32', NULL);
INSERT INTO `stu_note` VALUES (3, 10001, 3, '数据结构与算法', '链表与数组的差异', '数组：随机访问快，插入删除慢。\n链表：插入删除快，随机访问慢。', '数据结构,链表,数组', '2026-05-09 08:55:32', '2026-05-09 08:55:32', NULL);
INSERT INTO `stu_note` VALUES (4, 10001, 2, '面向对象程序设计(Java)', '封装/继承/多态要点', '封装：隐藏实现细节。\n继承：复用与扩展。\n多态：面向接口编程，运行期绑定。', 'Java,OOP,重点', '2026-05-09 08:55:32', '2026-05-09 08:55:32', NULL);
INSERT INTO `stu_note` VALUES (5, 10001, NULL, NULL, '本周学习计划', '1) 完成课表周视图联调\n2) 整理需求工程笔记\n3) 复习SQL与索引', '计划,待办,复盘', '2026-05-09 08:55:32', '2026-05-09 08:55:32', NULL);
INSERT INTO `stu_note` VALUES (6, 1001, 1, 'Java', '1', '<p># 实验名称：</p><p>啊啊</p><p><br></p><p>## 实验目的</p><p><br></p><p>- 啊啊</p><p><br></p><p><br></p><p>## 实验环境</p><p>啊啊</p><p>- OS：</p><p><br></p><p>- 语言/框架：</p><p>啊啊</p><p>- 依赖版本：</p><p><br></p><p>啊啊</p><p>## 实验步骤</p><p>啊啊</p><p>1. </p><p>啊啊</p><p>2. </p><p><br></p><p><br></p><p>## 关键代码/命令</p><p><br></p><p>```text</p><p>啊啊</p><p><br></p><p>```</p><p><br></p><p><br></p><p>## 结果与截图</p><p><br></p><p>- </p><p>啊啊</p><p><br></p><p>## 问题与解决</p><p><br></p><p>- 啊啊</p><p><br></p><p><br></p><p>## 总结</p><p>啊啊</p><p>- </p><p><br></p>', '啊啊', '2026-05-09 00:00:00', '2026-05-09 00:00:00', 'https://cdn.moliya.love/Ossimages/2026/05/09/1778307150976.png');

-- ----------------------------
-- Table structure for stu_note_template
-- ----------------------------
DROP TABLE IF EXISTS `stu_note_template`;
CREATE TABLE `stu_note_template`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `student_id` int NULL DEFAULT NULL COMMENT '学生ID（为空表示系统内置模板；不为空表示学生自定义模板）',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模板名称',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模板类型（CLASS/EXPERIMENT/INTERVIEW/CUSTOM）',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模板内容（纯文本/Markdown）',
  `sort_no` int NOT NULL DEFAULT 0 COMMENT '排序号（越小越靠前）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '状态（0启用 1停用）',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_template_student`(`student_id` ASC) USING BTREE,
  INDEX `idx_template_type`(`type` ASC) USING BTREE,
  INDEX `idx_template_status_sort`(`status` ASC, `sort_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '笔记模板表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_note_template
-- ----------------------------
INSERT INTO `stu_note_template` VALUES (1, NULL, '课堂笔记模板', 'CLASS', '# 课程：\n\n## 本节目标\n- \n\n## 重点概念\n- \n\n## 例题/示例\n- \n\n## 易错点\n- \n\n## 课后任务\n- \n', 10, '0', '2026-05-09 10:07:01', '2026-05-09 10:07:01');
INSERT INTO `stu_note_template` VALUES (2, NULL, '实验记录模板', 'EXPERIMENT', '# 实验名称：\n\n## 实验目的\n- \n\n## 实验环境\n- OS：\n- 语言/框架：\n- 依赖版本：\n\n## 实验步骤\n1. \n2. \n\n## 关键代码/命令\n```text\n\n```\n\n## 结果与截图\n- \n\n## 问题与解决\n- \n\n## 总结\n- \n', 20, '0', '2026-05-09 10:07:01', '2026-05-09 10:07:01');
INSERT INTO `stu_note_template` VALUES (3, NULL, '面试题整理模板', 'INTERVIEW', '# 主题：\n\n## 问题\n\n## 我的回答（简版）\n\n## 标准答案/要点\n- \n\n## 扩展追问\n- \n\n## 相关链接/资料\n- \n', 30, '0', '2026-05-09 10:07:01', '2026-05-09 10:07:01');
INSERT INTO `stu_note_template` VALUES (4, NULL, '读书/文章摘录模板', 'CLASS', '# 标题：\n\n## 核心观点\n- \n\n## 金句摘录\n> \n\n## 我的理解\n- \n\n## 可落地行动\n- \n', 40, '0', '2026-05-09 10:07:01', '2026-05-09 10:07:01');
INSERT INTO `stu_note_template` VALUES (5, NULL, '复盘总结模板', 'CUSTOM', '# 主题：\n\n## 做了什么\n- \n\n## 结果如何\n- \n\n## 问题在哪里\n- \n\n## 改进计划\n- \n', 50, '0', '2026-05-09 10:07:01', '2026-05-09 10:07:01');

-- ----------------------------
-- Table structure for sys_campus_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `sys_campus_knowledge`;
CREATE TABLE `sys_campus_knowledge`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type_id` bigint NOT NULL COMMENT '分类ID',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '知识标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '富文本正文内容',
  `file_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '附件地址（PDF/Word）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态 0草稿 1已发布',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '校园知识内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_campus_knowledge
-- ----------------------------
INSERT INTO `sys_campus_knowledge` VALUES (1, 1, '学生学籍管理总则', '为规范本校学生学籍管理，维护正常教学秩序，保障学生合法权益，依据教育部相关规定，结合本校实际制定本总则。所有在校学生必须遵守学籍注册、异动办理、休学复学、退学结业等相关管理要求，未按规定办理手续者按违纪处理。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (2, 1, '校园宿舍管理条例', '学生宿舍实行统一封闭式管理，住宿学生需遵守作息时间，严禁晚归、夜不归宿。宿舍内禁止使用大功率电器、私拉乱接电线，禁止存放易燃易爆、管制刀具等违禁物品，保持宿舍卫生整洁，轮流值日打扫。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (3, 1, '校园网络使用管理规定', '全校师生需文明使用校园网络，不得利用网络发布不良信息、造谣传谣、攻击校园服务器。禁止私自破解校园WiFi、盗用他人网络账号，严禁访问非法网站、传播盗版资源，违规者将暂停网络使用权限。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (4, 1, '图书馆借阅管理规定', '学生凭校园卡入馆借阅图书，每人单次最多借阅8本，借阅期限30天，可续借一次。逾期未还按天收取滞纳金，损坏、遗失图书需按原价3-5倍赔偿，严禁在图书上涂鸦、撕页、裁剪。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (5, 1, '食堂就餐文明管理规范', '食堂实行排队就餐制度，禁止插队、占位、浪费粮食。就餐完毕自觉将餐具送至回收处，禁止随地乱扔垃圾、大声喧哗，严禁恶意损坏食堂设施、辱骂工作人员。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (6, 2, '学生请假完整办理流程', '1. 学生登录校园系统填写请假申请，选择请假类型、起止时间、请假原因；2. 提交辅导员审核；3. 辅导员审核通过后提交学院领导审批；4. 审批完成后生成请假凭证；5. 假期结束返校后及时销假，逾期未销假按旷课处理。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (7, 2, '奖学金申请评选流程', '1. 每年9月学校发布奖学金评选通知；2. 学生对照评选条件自行提交申请表及绩点、荣誉证明材料；3. 班级初审推荐；4. 学院复审公示；5. 学校终审发文，发放奖学金及荣誉证书。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (8, 2, '休学复学办理流程', '1. 学生因身体、学业等原因申请休学，填写休学申请表并附相关证明；2. 辅导员、学院签字审核；3. 教务处审批备案；4. 办理离校手续；5. 休学期满提前申请复学，提交复学材料审核通过后方可返校入学。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (9, 2, '校园卡挂失补办流程', '1. 校园卡丢失后第一时间在校园APP自助挂失；2. 携带身份证前往校园卡服务中心；3. 缴纳补办工本费；4. 工作人员录入信息制卡；5. 当场领取新卡并自动同步原有余额及权限。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (10, 2, '社团成立注册流程', '1. 发起人提交社团成立申请书、章程、发起人名单；2. 校团委初审材料；3. 现场答辩评审；4. 公示无异议后正式注册；5. 领取社团公章及活动备案表，按规定开展校园活动。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (11, 3, '学生日常行为规范准则', '在校期间学生需衣着整洁、言行文明，不得染发烫发、穿戴奇装异服。课堂保持安静，不迟到、早退、旷课，尊重老师教学成果，同学之间团结友爱，禁止打架斗殴、欺凌同学。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (12, 3, '课堂考勤与纪律要求', '上课提前5分钟进入教室，做好课前准备，严禁课堂玩手机、睡觉、闲聊、吃东西。无故缺勤按旷课记录，迟到三次折算一次旷课，旷课达到规定学时将给予纪律处分。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (13, 3, '校园文明交往行为准则', '倡导文明礼貌交往，禁止男女学生过度亲密行为，不在校园公共区域追逐打闹、大声喧哗。爱护校园花草树木、公共设施，不随地吐痰、不乱扔垃圾，自觉维护校园环境。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (14, 3, '考试诚信考风考纪规定', '所有校内考试必须诚信应考，严禁夹带资料、偷看抄袭、传递答案、替考代考等作弊行为。一经发现立即取消考试成绩，给予记过及以上处分，记入学生档案。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (15, 4, '关于晚归夜不归宿违纪通报', '近期巡查发现多名学生存在晚归、夜不归宿行为，违反宿舍管理条例。现对相关学生予以全院通报批评，责令书面检讨，再次违反将给予纪律处分，各班级需加强学生作息管理教育。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (16, 4, '关于考试作弊学生处分通告', '在本学期期中课程考试中，查实部分学生存在抄袭、夹带作弊行为。依据校规给予记过处分，成绩按零分处理，不得参与本年度评优评先，处分材料永久存入个人学籍档案。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (17, 4, '关于违规使用大功率电器通报', '宿舍安全检查中查获电热锅、电煮壶、热得快等违禁大功率电器，相关宿舍学生违反校园安全管理规定。现予以通报批评，没收违规电器，全校学生引以为戒，杜绝安全隐患。', NULL, '1', '', '2026-05-10 08:04:07', NULL);
INSERT INTO `sys_campus_knowledge` VALUES (18, 4, '恶意造谣网络言论违纪通告', '个别学生利用社交平台编造传播不实校园谣言，造成不良舆论影响，违反网络使用管理规定。现对当事人进行约谈警示、通报批评，情节严重者将移交学校纪检部门处理。', NULL, '1', '', '2026-05-10 08:04:07', NULL);

-- ----------------------------
-- Table structure for sys_campus_knowledge_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_campus_knowledge_type`;
CREATE TABLE `sys_campus_knowledge_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称：规章制度/办事流程/校风校纪/通告批评',
  `sort` int NULL DEFAULT 0 COMMENT '排序号',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态 0正常 1停用',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '校园知识分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_campus_knowledge_type
-- ----------------------------
INSERT INTO `sys_campus_knowledge_type` VALUES (1, '规章制度', 1, '0', '2026-05-10 08:03:51');
INSERT INTO `sys_campus_knowledge_type` VALUES (2, '办事流程', 2, '0', '2026-05-10 08:03:51');
INSERT INTO `sys_campus_knowledge_type` VALUES (3, '校风校纪', 3, '0', '2026-05-10 08:03:51');
INSERT INTO `sys_campus_knowledge_type` VALUES (4, '通告批评', 4, '0', '2026-05-10 08:03:51');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2026-05-07 14:50:30', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2026-05-07 14:50:30', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2026-05-07 14:50:30', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2026-05-07 14:50:30', 'admin', '2026-05-08 14:31:15', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2026-05-07 14:50:30', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2026-05-07 14:50:30', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2026-05-07 14:50:30', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2026-05-07 14:50:30', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (9, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2026-05-07 14:50:30', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-07 14:50:16', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-07 14:50:16', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-07 14:50:16', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-07 14:50:16', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-07 14:50:16', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-07 14:50:16', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-07 14:50:16', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-07 14:50:16', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-07 14:50:16', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-07 14:50:16', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2026-05-07 14:50:29', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '星期一', '1', 'course_week', NULL, 'default', 'N', '0', 'admin', '2026-05-08 11:45:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '星期二', '2', 'course_week', NULL, 'default', 'N', '0', 'admin', '2026-05-08 11:45:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '星期三', '3', 'course_week', NULL, 'default', 'N', '0', 'admin', '2026-05-08 11:45:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 4, '星期四', '4', 'course_week', NULL, 'default', 'N', '0', 'admin', '2026-05-08 11:45:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 5, '星期五', '5', 'course_week', NULL, 'default', 'N', '0', 'admin', '2026-05-08 11:45:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 0, '规章制度', 'rulesRegulations', 'rules_regulations', NULL, 'default', 'N', '0', 'admin', '2026-05-10 07:24:46', '', NULL, '这是校园的规章制度');
INSERT INTO `sys_dict_data` VALUES (106, 0, '办事流程', 'workProcess', 'rules_regulations', NULL, 'default', 'N', '0', 'admin', '2026-05-10 07:25:18', '', NULL, '这是校园事项的操作流程');
INSERT INTO `sys_dict_data` VALUES (107, 0, '校风校纪', 'schoolDiscipline', 'rules_regulations', NULL, 'default', 'N', '0', 'admin', '2026-05-10 07:25:44', '', NULL, '这是校风校纪');
INSERT INTO `sys_dict_data` VALUES (108, 0, '通告批评', 'criticismNotice', 'rules_regulations', NULL, 'default', 'N', '0', 'admin', '2026-05-10 07:26:16', '', NULL, '这是有关的通告批评记录');
INSERT INTO `sys_dict_data` VALUES (109, 0, '草稿', '0', 'statue', NULL, 'default', 'N', '0', 'admin', '2026-05-10 07:33:57', '', NULL, '没有发布');
INSERT INTO `sys_dict_data` VALUES (110, 0, '已发布', '1', 'statue', NULL, 'default', 'N', '0', 'admin', '2026-05-10 07:34:07', '', NULL, '已经发布了');
INSERT INTO `sys_dict_data` VALUES (111, 0, '正常', '0', 'sys_campus_knowledge_type', NULL, 'default', 'N', '0', 'admin', '2026-05-10 07:43:09', '', NULL, '正常');
INSERT INTO `sys_dict_data` VALUES (112, 0, '停用', '1', 'sys_campus_knowledge_type', NULL, 'default', 'N', '0', 'admin', '2026-05-10 07:43:20', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 0, '草稿', '0', 'sys_campus_knowledge', NULL, 'default', 'N', '0', 'admin', '2026-05-10 07:44:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 0, '已发布', '1', 'sys_campus_knowledge', NULL, 'default', 'N', '0', 'admin', '2026-05-10 07:44:09', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2026-05-07 14:50:28', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2026-05-07 14:50:28', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2026-05-07 14:50:28', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2026-05-07 14:50:28', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2026-05-07 14:50:28', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2026-05-07 14:50:28', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2026-05-07 14:50:28', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2026-05-07 14:50:28', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2026-05-07 14:50:28', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2026-05-07 14:50:28', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '星期几', 'course_week', '0', 'admin', '2026-05-08 11:44:48', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '校园知识', 'rules_regulations', '0', 'admin', '2026-05-10 07:11:47', 'admin', '2026-05-10 07:23:59', '这是校园的所有知识类型');
INSERT INTO `sys_dict_type` VALUES (105, '校园信息', 'statue', '0', 'admin', '2026-05-10 07:33:16', 'admin', '2026-05-10 07:33:22', '校园信息是否发布');
INSERT INTO `sys_dict_type` VALUES (106, '知识内容分类', 'sys_campus_knowledge_type', '0', 'admin', '2026-05-10 07:42:44', '', NULL, '这是知识分类表的字典');
INSERT INTO `sys_dict_type` VALUES (107, '知识内容', 'sys_campus_knowledge', '0', 'admin', '2026-05-10 07:43:52', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2026-05-07 14:50:32', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2026-05-07 14:50:32', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2026-05-07 14:50:32', '', NULL, '');
INSERT INTO `sys_job` VALUES (100, '输出时间', 'DEFAULT', 'myTask.showTime()', '0/5 * * * * ?', '1', '1', '1', 'admin', '2026-05-08 14:51:34', '', '2026-05-09 09:53:02', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `start_time` datetime NULL DEFAULT NULL COMMENT '执行开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '执行结束时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2404 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 14:51:49', '2026-05-08 14:51:49', '2026-05-08 14:51:48');
INSERT INTO `sys_job_log` VALUES (2, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:51:49', '2026-05-08 14:51:49', '2026-05-08 14:51:48');
INSERT INTO `sys_job_log` VALUES (3, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 14:51:49', '2026-05-08 14:51:49', '2026-05-08 14:51:48');
INSERT INTO `sys_job_log` VALUES (4, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:51:50', '2026-05-08 14:51:50', '2026-05-08 14:51:50');
INSERT INTO `sys_job_log` VALUES (5, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:51:55', '2026-05-08 14:51:55', '2026-05-08 14:51:55');
INSERT INTO `sys_job_log` VALUES (6, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:52:00', '2026-05-08 14:52:00', '2026-05-08 14:52:00');
INSERT INTO `sys_job_log` VALUES (7, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:52:05', '2026-05-08 14:52:05', '2026-05-08 14:52:05');
INSERT INTO `sys_job_log` VALUES (8, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:52:10', '2026-05-08 14:52:10', '2026-05-08 14:52:10');
INSERT INTO `sys_job_log` VALUES (9, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:52:15', '2026-05-08 14:52:15', '2026-05-08 14:52:15');
INSERT INTO `sys_job_log` VALUES (10, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:52:20', '2026-05-08 14:52:20', '2026-05-08 14:52:20');
INSERT INTO `sys_job_log` VALUES (11, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:52:25', '2026-05-08 14:52:25', '2026-05-08 14:52:25');
INSERT INTO `sys_job_log` VALUES (12, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:52:30', '2026-05-08 14:52:30', '2026-05-08 14:52:30');
INSERT INTO `sys_job_log` VALUES (13, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:52:35', '2026-05-08 14:52:35', '2026-05-08 14:52:35');
INSERT INTO `sys_job_log` VALUES (14, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:52:40', '2026-05-08 14:52:40', '2026-05-08 14:52:40');
INSERT INTO `sys_job_log` VALUES (15, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:52:45', '2026-05-08 14:52:45', '2026-05-08 14:52:45');
INSERT INTO `sys_job_log` VALUES (16, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:52:50', '2026-05-08 14:52:50', '2026-05-08 14:52:50');
INSERT INTO `sys_job_log` VALUES (17, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:52:55', '2026-05-08 14:52:55', '2026-05-08 14:52:55');
INSERT INTO `sys_job_log` VALUES (18, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 14:53:00', '2026-05-08 14:53:00', '2026-05-08 14:53:00');
INSERT INTO `sys_job_log` VALUES (19, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:53:05', '2026-05-08 14:53:05', '2026-05-08 14:53:05');
INSERT INTO `sys_job_log` VALUES (20, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 14:53:10', '2026-05-08 14:53:10', '2026-05-08 14:53:10');
INSERT INTO `sys_job_log` VALUES (21, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 14:53:15', '2026-05-08 14:53:15', '2026-05-08 14:53:15');
INSERT INTO `sys_job_log` VALUES (22, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:53:20', '2026-05-08 14:53:20', '2026-05-08 14:53:20');
INSERT INTO `sys_job_log` VALUES (23, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:53:25', '2026-05-08 14:53:25', '2026-05-08 14:53:25');
INSERT INTO `sys_job_log` VALUES (24, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:53:30', '2026-05-08 14:53:30', '2026-05-08 14:53:30');
INSERT INTO `sys_job_log` VALUES (25, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 14:53:35', '2026-05-08 14:53:35', '2026-05-08 14:53:35');
INSERT INTO `sys_job_log` VALUES (26, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:53:40', '2026-05-08 14:53:40', '2026-05-08 14:53:40');
INSERT INTO `sys_job_log` VALUES (27, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:53:45', '2026-05-08 14:53:45', '2026-05-08 14:53:45');
INSERT INTO `sys_job_log` VALUES (28, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:53:50', '2026-05-08 14:53:50', '2026-05-08 14:53:50');
INSERT INTO `sys_job_log` VALUES (29, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 14:53:55', '2026-05-08 14:53:55', '2026-05-08 14:53:55');
INSERT INTO `sys_job_log` VALUES (30, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:54:00', '2026-05-08 14:54:00', '2026-05-08 14:54:00');
INSERT INTO `sys_job_log` VALUES (31, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:54:05', '2026-05-08 14:54:05', '2026-05-08 14:54:05');
INSERT INTO `sys_job_log` VALUES (32, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:54:10', '2026-05-08 14:54:10', '2026-05-08 14:54:10');
INSERT INTO `sys_job_log` VALUES (33, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 14:54:15', '2026-05-08 14:54:15', '2026-05-08 14:54:15');
INSERT INTO `sys_job_log` VALUES (34, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:54:20', '2026-05-08 14:54:20', '2026-05-08 14:54:20');
INSERT INTO `sys_job_log` VALUES (35, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:54:25', '2026-05-08 14:54:25', '2026-05-08 14:54:25');
INSERT INTO `sys_job_log` VALUES (36, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 14:54:30', '2026-05-08 14:54:30', '2026-05-08 14:54:30');
INSERT INTO `sys_job_log` VALUES (37, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:54:35', '2026-05-08 14:54:35', '2026-05-08 14:54:35');
INSERT INTO `sys_job_log` VALUES (38, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:54:40', '2026-05-08 14:54:40', '2026-05-08 14:54:40');
INSERT INTO `sys_job_log` VALUES (39, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:54:45', '2026-05-08 14:54:45', '2026-05-08 14:54:45');
INSERT INTO `sys_job_log` VALUES (40, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:54:50', '2026-05-08 14:54:50', '2026-05-08 14:54:50');
INSERT INTO `sys_job_log` VALUES (41, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 14:54:55', '2026-05-08 14:54:55', '2026-05-08 14:54:55');
INSERT INTO `sys_job_log` VALUES (42, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:55:00', '2026-05-08 14:55:00', '2026-05-08 14:55:00');
INSERT INTO `sys_job_log` VALUES (43, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:55:05', '2026-05-08 14:55:05', '2026-05-08 14:55:05');
INSERT INTO `sys_job_log` VALUES (44, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:55:10', '2026-05-08 14:55:10', '2026-05-08 14:55:10');
INSERT INTO `sys_job_log` VALUES (45, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:55:15', '2026-05-08 14:55:15', '2026-05-08 14:55:15');
INSERT INTO `sys_job_log` VALUES (46, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 14:55:20', '2026-05-08 14:55:20', '2026-05-08 14:55:20');
INSERT INTO `sys_job_log` VALUES (47, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:55:25', '2026-05-08 14:55:25', '2026-05-08 14:55:25');
INSERT INTO `sys_job_log` VALUES (48, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 14:55:30', '2026-05-08 14:55:30', '2026-05-08 14:55:30');
INSERT INTO `sys_job_log` VALUES (49, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:55:35', '2026-05-08 14:55:35', '2026-05-08 14:55:35');
INSERT INTO `sys_job_log` VALUES (50, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:55:40', '2026-05-08 14:55:40', '2026-05-08 14:55:40');
INSERT INTO `sys_job_log` VALUES (51, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 14:55:45', '2026-05-08 14:55:45', '2026-05-08 14:55:45');
INSERT INTO `sys_job_log` VALUES (52, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:55:50', '2026-05-08 14:55:50', '2026-05-08 14:55:50');
INSERT INTO `sys_job_log` VALUES (53, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:55:55', '2026-05-08 14:55:55', '2026-05-08 14:55:55');
INSERT INTO `sys_job_log` VALUES (54, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:56:00', '2026-05-08 14:56:00', '2026-05-08 14:56:00');
INSERT INTO `sys_job_log` VALUES (55, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:56:05', '2026-05-08 14:56:05', '2026-05-08 14:56:05');
INSERT INTO `sys_job_log` VALUES (56, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:56:10', '2026-05-08 14:56:10', '2026-05-08 14:56:10');
INSERT INTO `sys_job_log` VALUES (57, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:56:15', '2026-05-08 14:56:15', '2026-05-08 14:56:15');
INSERT INTO `sys_job_log` VALUES (58, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:56:20', '2026-05-08 14:56:20', '2026-05-08 14:56:20');
INSERT INTO `sys_job_log` VALUES (59, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:56:25', '2026-05-08 14:56:25', '2026-05-08 14:56:25');
INSERT INTO `sys_job_log` VALUES (60, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:56:30', '2026-05-08 14:56:30', '2026-05-08 14:56:30');
INSERT INTO `sys_job_log` VALUES (61, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:56:35', '2026-05-08 14:56:35', '2026-05-08 14:56:35');
INSERT INTO `sys_job_log` VALUES (62, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 14:56:40', '2026-05-08 14:56:40', '2026-05-08 14:56:40');
INSERT INTO `sys_job_log` VALUES (63, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 14:56:45', '2026-05-08 14:56:45', '2026-05-08 14:56:45');
INSERT INTO `sys_job_log` VALUES (64, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:56:50', '2026-05-08 14:56:50', '2026-05-08 14:56:50');
INSERT INTO `sys_job_log` VALUES (65, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:56:55', '2026-05-08 14:56:55', '2026-05-08 14:56:55');
INSERT INTO `sys_job_log` VALUES (66, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 14:57:00', '2026-05-08 14:57:00', '2026-05-08 14:57:00');
INSERT INTO `sys_job_log` VALUES (67, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:57:05', '2026-05-08 14:57:05', '2026-05-08 14:57:05');
INSERT INTO `sys_job_log` VALUES (68, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:57:10', '2026-05-08 14:57:10', '2026-05-08 14:57:10');
INSERT INTO `sys_job_log` VALUES (69, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:57:15', '2026-05-08 14:57:15', '2026-05-08 14:57:15');
INSERT INTO `sys_job_log` VALUES (70, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:57:20', '2026-05-08 14:57:20', '2026-05-08 14:57:20');
INSERT INTO `sys_job_log` VALUES (71, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:57:25', '2026-05-08 14:57:25', '2026-05-08 14:57:25');
INSERT INTO `sys_job_log` VALUES (72, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:57:30', '2026-05-08 14:57:30', '2026-05-08 14:57:30');
INSERT INTO `sys_job_log` VALUES (73, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:57:35', '2026-05-08 14:57:35', '2026-05-08 14:57:35');
INSERT INTO `sys_job_log` VALUES (74, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:57:40', '2026-05-08 14:57:40', '2026-05-08 14:57:40');
INSERT INTO `sys_job_log` VALUES (75, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:57:45', '2026-05-08 14:57:45', '2026-05-08 14:57:45');
INSERT INTO `sys_job_log` VALUES (76, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:57:50', '2026-05-08 14:57:50', '2026-05-08 14:57:50');
INSERT INTO `sys_job_log` VALUES (77, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:57:55', '2026-05-08 14:57:55', '2026-05-08 14:57:55');
INSERT INTO `sys_job_log` VALUES (78, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:58:00', '2026-05-08 14:58:00', '2026-05-08 14:58:00');
INSERT INTO `sys_job_log` VALUES (79, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 14:58:05', '2026-05-08 14:58:05', '2026-05-08 14:58:05');
INSERT INTO `sys_job_log` VALUES (80, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:58:10', '2026-05-08 14:58:10', '2026-05-08 14:58:10');
INSERT INTO `sys_job_log` VALUES (81, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:58:15', '2026-05-08 14:58:15', '2026-05-08 14:58:15');
INSERT INTO `sys_job_log` VALUES (82, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:58:20', '2026-05-08 14:58:20', '2026-05-08 14:58:20');
INSERT INTO `sys_job_log` VALUES (83, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 14:58:25', '2026-05-08 14:58:25', '2026-05-08 14:58:25');
INSERT INTO `sys_job_log` VALUES (84, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:58:30', '2026-05-08 14:58:30', '2026-05-08 14:58:30');
INSERT INTO `sys_job_log` VALUES (85, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:58:35', '2026-05-08 14:58:35', '2026-05-08 14:58:35');
INSERT INTO `sys_job_log` VALUES (86, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:58:40', '2026-05-08 14:58:40', '2026-05-08 14:58:40');
INSERT INTO `sys_job_log` VALUES (87, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:58:45', '2026-05-08 14:58:45', '2026-05-08 14:58:45');
INSERT INTO `sys_job_log` VALUES (88, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:58:50', '2026-05-08 14:58:50', '2026-05-08 14:58:50');
INSERT INTO `sys_job_log` VALUES (89, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:58:55', '2026-05-08 14:58:55', '2026-05-08 14:58:55');
INSERT INTO `sys_job_log` VALUES (90, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:59:00', '2026-05-08 14:59:00', '2026-05-08 14:59:00');
INSERT INTO `sys_job_log` VALUES (91, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:59:05', '2026-05-08 14:59:05', '2026-05-08 14:59:05');
INSERT INTO `sys_job_log` VALUES (92, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:59:10', '2026-05-08 14:59:10', '2026-05-08 14:59:10');
INSERT INTO `sys_job_log` VALUES (93, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:59:15', '2026-05-08 14:59:15', '2026-05-08 14:59:15');
INSERT INTO `sys_job_log` VALUES (94, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:59:20', '2026-05-08 14:59:20', '2026-05-08 14:59:20');
INSERT INTO `sys_job_log` VALUES (95, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:59:25', '2026-05-08 14:59:25', '2026-05-08 14:59:25');
INSERT INTO `sys_job_log` VALUES (96, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:59:30', '2026-05-08 14:59:30', '2026-05-08 14:59:30');
INSERT INTO `sys_job_log` VALUES (97, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:59:35', '2026-05-08 14:59:35', '2026-05-08 14:59:35');
INSERT INTO `sys_job_log` VALUES (98, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:59:40', '2026-05-08 14:59:40', '2026-05-08 14:59:40');
INSERT INTO `sys_job_log` VALUES (99, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 14:59:45', '2026-05-08 14:59:45', '2026-05-08 14:59:45');
INSERT INTO `sys_job_log` VALUES (100, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:59:50', '2026-05-08 14:59:50', '2026-05-08 14:59:50');
INSERT INTO `sys_job_log` VALUES (101, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 14:59:55', '2026-05-08 14:59:55', '2026-05-08 14:59:55');
INSERT INTO `sys_job_log` VALUES (102, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:00:00', '2026-05-08 15:00:00', '2026-05-08 15:00:00');
INSERT INTO `sys_job_log` VALUES (103, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:00:05', '2026-05-08 15:00:05', '2026-05-08 15:00:05');
INSERT INTO `sys_job_log` VALUES (104, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:00:10', '2026-05-08 15:00:10', '2026-05-08 15:00:10');
INSERT INTO `sys_job_log` VALUES (105, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:00:15', '2026-05-08 15:00:15', '2026-05-08 15:00:15');
INSERT INTO `sys_job_log` VALUES (106, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:00:20', '2026-05-08 15:00:20', '2026-05-08 15:00:20');
INSERT INTO `sys_job_log` VALUES (107, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:00:25', '2026-05-08 15:00:25', '2026-05-08 15:00:25');
INSERT INTO `sys_job_log` VALUES (108, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:00:30', '2026-05-08 15:00:30', '2026-05-08 15:00:30');
INSERT INTO `sys_job_log` VALUES (109, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:00:35', '2026-05-08 15:00:35', '2026-05-08 15:00:35');
INSERT INTO `sys_job_log` VALUES (110, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:00:40', '2026-05-08 15:00:40', '2026-05-08 15:00:40');
INSERT INTO `sys_job_log` VALUES (111, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:00:45', '2026-05-08 15:00:45', '2026-05-08 15:00:45');
INSERT INTO `sys_job_log` VALUES (112, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:00:50', '2026-05-08 15:00:50', '2026-05-08 15:00:50');
INSERT INTO `sys_job_log` VALUES (113, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:00:55', '2026-05-08 15:00:55', '2026-05-08 15:00:55');
INSERT INTO `sys_job_log` VALUES (114, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:01:00', '2026-05-08 15:01:00', '2026-05-08 15:01:00');
INSERT INTO `sys_job_log` VALUES (115, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:01:05', '2026-05-08 15:01:05', '2026-05-08 15:01:05');
INSERT INTO `sys_job_log` VALUES (116, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:01:10', '2026-05-08 15:01:10', '2026-05-08 15:01:10');
INSERT INTO `sys_job_log` VALUES (117, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:01:15', '2026-05-08 15:01:15', '2026-05-08 15:01:15');
INSERT INTO `sys_job_log` VALUES (118, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:01:20', '2026-05-08 15:01:20', '2026-05-08 15:01:20');
INSERT INTO `sys_job_log` VALUES (119, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 15:01:25', '2026-05-08 15:01:25', '2026-05-08 15:01:25');
INSERT INTO `sys_job_log` VALUES (120, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 15:01:30', '2026-05-08 15:01:30', '2026-05-08 15:01:30');
INSERT INTO `sys_job_log` VALUES (121, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:01:35', '2026-05-08 15:01:35', '2026-05-08 15:01:35');
INSERT INTO `sys_job_log` VALUES (122, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:01:40', '2026-05-08 15:01:40', '2026-05-08 15:01:40');
INSERT INTO `sys_job_log` VALUES (123, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:01:45', '2026-05-08 15:01:45', '2026-05-08 15:01:45');
INSERT INTO `sys_job_log` VALUES (124, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:01:50', '2026-05-08 15:01:50', '2026-05-08 15:01:50');
INSERT INTO `sys_job_log` VALUES (125, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:01:55', '2026-05-08 15:01:55', '2026-05-08 15:01:55');
INSERT INTO `sys_job_log` VALUES (126, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:02:00', '2026-05-08 15:02:00', '2026-05-08 15:02:00');
INSERT INTO `sys_job_log` VALUES (127, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:02:05', '2026-05-08 15:02:05', '2026-05-08 15:02:05');
INSERT INTO `sys_job_log` VALUES (128, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:02:10', '2026-05-08 15:02:10', '2026-05-08 15:02:10');
INSERT INTO `sys_job_log` VALUES (129, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:02:15', '2026-05-08 15:02:15', '2026-05-08 15:02:15');
INSERT INTO `sys_job_log` VALUES (130, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:02:20', '2026-05-08 15:02:20', '2026-05-08 15:02:20');
INSERT INTO `sys_job_log` VALUES (131, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:02:25', '2026-05-08 15:02:25', '2026-05-08 15:02:25');
INSERT INTO `sys_job_log` VALUES (132, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:02:30', '2026-05-08 15:02:30', '2026-05-08 15:02:30');
INSERT INTO `sys_job_log` VALUES (133, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:02:35', '2026-05-08 15:02:35', '2026-05-08 15:02:35');
INSERT INTO `sys_job_log` VALUES (134, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:02:40', '2026-05-08 15:02:40', '2026-05-08 15:02:40');
INSERT INTO `sys_job_log` VALUES (135, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:02:45', '2026-05-08 15:02:45', '2026-05-08 15:02:45');
INSERT INTO `sys_job_log` VALUES (136, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:02:50', '2026-05-08 15:02:50', '2026-05-08 15:02:50');
INSERT INTO `sys_job_log` VALUES (137, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:02:55', '2026-05-08 15:02:55', '2026-05-08 15:02:55');
INSERT INTO `sys_job_log` VALUES (138, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:03:00', '2026-05-08 15:03:00', '2026-05-08 15:03:00');
INSERT INTO `sys_job_log` VALUES (139, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:03:05', '2026-05-08 15:03:05', '2026-05-08 15:03:05');
INSERT INTO `sys_job_log` VALUES (140, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:03:10', '2026-05-08 15:03:10', '2026-05-08 15:03:10');
INSERT INTO `sys_job_log` VALUES (141, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:03:15', '2026-05-08 15:03:15', '2026-05-08 15:03:15');
INSERT INTO `sys_job_log` VALUES (142, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:03:20', '2026-05-08 15:03:20', '2026-05-08 15:03:20');
INSERT INTO `sys_job_log` VALUES (143, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:03:25', '2026-05-08 15:03:25', '2026-05-08 15:03:25');
INSERT INTO `sys_job_log` VALUES (144, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:03:30', '2026-05-08 15:03:30', '2026-05-08 15:03:30');
INSERT INTO `sys_job_log` VALUES (145, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:03:35', '2026-05-08 15:03:35', '2026-05-08 15:03:35');
INSERT INTO `sys_job_log` VALUES (146, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:03:40', '2026-05-08 15:03:40', '2026-05-08 15:03:40');
INSERT INTO `sys_job_log` VALUES (147, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:03:45', '2026-05-08 15:03:45', '2026-05-08 15:03:45');
INSERT INTO `sys_job_log` VALUES (148, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:03:50', '2026-05-08 15:03:50', '2026-05-08 15:03:50');
INSERT INTO `sys_job_log` VALUES (149, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:03:55', '2026-05-08 15:03:55', '2026-05-08 15:03:55');
INSERT INTO `sys_job_log` VALUES (150, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:04:00', '2026-05-08 15:04:00', '2026-05-08 15:04:00');
INSERT INTO `sys_job_log` VALUES (151, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:04:05', '2026-05-08 15:04:05', '2026-05-08 15:04:05');
INSERT INTO `sys_job_log` VALUES (152, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:04:10', '2026-05-08 15:04:10', '2026-05-08 15:04:10');
INSERT INTO `sys_job_log` VALUES (153, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:04:15', '2026-05-08 15:04:15', '2026-05-08 15:04:15');
INSERT INTO `sys_job_log` VALUES (154, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:04:20', '2026-05-08 15:04:20', '2026-05-08 15:04:20');
INSERT INTO `sys_job_log` VALUES (155, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:04:25', '2026-05-08 15:04:25', '2026-05-08 15:04:25');
INSERT INTO `sys_job_log` VALUES (156, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:04:30', '2026-05-08 15:04:30', '2026-05-08 15:04:30');
INSERT INTO `sys_job_log` VALUES (157, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:04:35', '2026-05-08 15:04:35', '2026-05-08 15:04:35');
INSERT INTO `sys_job_log` VALUES (158, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:04:40', '2026-05-08 15:04:40', '2026-05-08 15:04:40');
INSERT INTO `sys_job_log` VALUES (159, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 15:04:45', '2026-05-08 15:04:45', '2026-05-08 15:04:45');
INSERT INTO `sys_job_log` VALUES (160, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:04:50', '2026-05-08 15:04:50', '2026-05-08 15:04:50');
INSERT INTO `sys_job_log` VALUES (161, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:04:55', '2026-05-08 15:04:55', '2026-05-08 15:04:55');
INSERT INTO `sys_job_log` VALUES (162, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:05:00', '2026-05-08 15:05:00', '2026-05-08 15:05:00');
INSERT INTO `sys_job_log` VALUES (163, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:05:05', '2026-05-08 15:05:05', '2026-05-08 15:05:05');
INSERT INTO `sys_job_log` VALUES (164, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 15:05:10', '2026-05-08 15:05:10', '2026-05-08 15:05:10');
INSERT INTO `sys_job_log` VALUES (165, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:05:15', '2026-05-08 15:05:15', '2026-05-08 15:05:15');
INSERT INTO `sys_job_log` VALUES (166, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:05:20', '2026-05-08 15:05:20', '2026-05-08 15:05:20');
INSERT INTO `sys_job_log` VALUES (167, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:05:25', '2026-05-08 15:05:25', '2026-05-08 15:05:25');
INSERT INTO `sys_job_log` VALUES (168, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:05:30', '2026-05-08 15:05:30', '2026-05-08 15:05:30');
INSERT INTO `sys_job_log` VALUES (169, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:05:35', '2026-05-08 15:05:35', '2026-05-08 15:05:35');
INSERT INTO `sys_job_log` VALUES (170, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:05:40', '2026-05-08 15:05:40', '2026-05-08 15:05:40');
INSERT INTO `sys_job_log` VALUES (171, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:05:45', '2026-05-08 15:05:45', '2026-05-08 15:05:45');
INSERT INTO `sys_job_log` VALUES (172, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:05:50', '2026-05-08 15:05:50', '2026-05-08 15:05:50');
INSERT INTO `sys_job_log` VALUES (173, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:05:55', '2026-05-08 15:05:55', '2026-05-08 15:05:55');
INSERT INTO `sys_job_log` VALUES (174, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:06:00', '2026-05-08 15:06:00', '2026-05-08 15:06:00');
INSERT INTO `sys_job_log` VALUES (175, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:06:05', '2026-05-08 15:06:05', '2026-05-08 15:06:05');
INSERT INTO `sys_job_log` VALUES (176, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:06:10', '2026-05-08 15:06:10', '2026-05-08 15:06:10');
INSERT INTO `sys_job_log` VALUES (177, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:06:15', '2026-05-08 15:06:15', '2026-05-08 15:06:15');
INSERT INTO `sys_job_log` VALUES (178, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:06:20', '2026-05-08 15:06:20', '2026-05-08 15:06:20');
INSERT INTO `sys_job_log` VALUES (179, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:06:25', '2026-05-08 15:06:25', '2026-05-08 15:06:25');
INSERT INTO `sys_job_log` VALUES (180, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:06:30', '2026-05-08 15:06:30', '2026-05-08 15:06:30');
INSERT INTO `sys_job_log` VALUES (181, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:06:35', '2026-05-08 15:06:35', '2026-05-08 15:06:35');
INSERT INTO `sys_job_log` VALUES (182, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:06:40', '2026-05-08 15:06:40', '2026-05-08 15:06:40');
INSERT INTO `sys_job_log` VALUES (183, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:06:45', '2026-05-08 15:06:45', '2026-05-08 15:06:45');
INSERT INTO `sys_job_log` VALUES (184, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:06:50', '2026-05-08 15:06:50', '2026-05-08 15:06:50');
INSERT INTO `sys_job_log` VALUES (185, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:06:55', '2026-05-08 15:06:55', '2026-05-08 15:06:55');
INSERT INTO `sys_job_log` VALUES (186, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:07:00', '2026-05-08 15:07:00', '2026-05-08 15:07:00');
INSERT INTO `sys_job_log` VALUES (187, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:07:05', '2026-05-08 15:07:05', '2026-05-08 15:07:05');
INSERT INTO `sys_job_log` VALUES (188, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:07:10', '2026-05-08 15:07:10', '2026-05-08 15:07:10');
INSERT INTO `sys_job_log` VALUES (189, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:07:15', '2026-05-08 15:07:15', '2026-05-08 15:07:15');
INSERT INTO `sys_job_log` VALUES (190, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:07:20', '2026-05-08 15:07:20', '2026-05-08 15:07:20');
INSERT INTO `sys_job_log` VALUES (191, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:07:25', '2026-05-08 15:07:25', '2026-05-08 15:07:25');
INSERT INTO `sys_job_log` VALUES (192, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:07:30', '2026-05-08 15:07:30', '2026-05-08 15:07:30');
INSERT INTO `sys_job_log` VALUES (193, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:07:35', '2026-05-08 15:07:35', '2026-05-08 15:07:35');
INSERT INTO `sys_job_log` VALUES (194, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:07:40', '2026-05-08 15:07:40', '2026-05-08 15:07:40');
INSERT INTO `sys_job_log` VALUES (195, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:07:45', '2026-05-08 15:07:45', '2026-05-08 15:07:45');
INSERT INTO `sys_job_log` VALUES (196, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:07:50', '2026-05-08 15:07:50', '2026-05-08 15:07:50');
INSERT INTO `sys_job_log` VALUES (197, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:07:55', '2026-05-08 15:07:55', '2026-05-08 15:07:55');
INSERT INTO `sys_job_log` VALUES (198, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:08:00', '2026-05-08 15:08:00', '2026-05-08 15:08:00');
INSERT INTO `sys_job_log` VALUES (199, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:08:05', '2026-05-08 15:08:05', '2026-05-08 15:08:05');
INSERT INTO `sys_job_log` VALUES (200, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:08:10', '2026-05-08 15:08:10', '2026-05-08 15:08:10');
INSERT INTO `sys_job_log` VALUES (201, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:08:15', '2026-05-08 15:08:15', '2026-05-08 15:08:15');
INSERT INTO `sys_job_log` VALUES (202, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:08:20', '2026-05-08 15:08:20', '2026-05-08 15:08:20');
INSERT INTO `sys_job_log` VALUES (203, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:08:25', '2026-05-08 15:08:25', '2026-05-08 15:08:25');
INSERT INTO `sys_job_log` VALUES (204, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:08:30', '2026-05-08 15:08:30', '2026-05-08 15:08:30');
INSERT INTO `sys_job_log` VALUES (205, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:08:35', '2026-05-08 15:08:35', '2026-05-08 15:08:35');
INSERT INTO `sys_job_log` VALUES (206, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:08:40', '2026-05-08 15:08:40', '2026-05-08 15:08:40');
INSERT INTO `sys_job_log` VALUES (207, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:08:45', '2026-05-08 15:08:45', '2026-05-08 15:08:45');
INSERT INTO `sys_job_log` VALUES (208, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:08:50', '2026-05-08 15:08:50', '2026-05-08 15:08:50');
INSERT INTO `sys_job_log` VALUES (209, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:08:55', '2026-05-08 15:08:55', '2026-05-08 15:08:55');
INSERT INTO `sys_job_log` VALUES (210, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:09:00', '2026-05-08 15:09:00', '2026-05-08 15:09:00');
INSERT INTO `sys_job_log` VALUES (211, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:09:05', '2026-05-08 15:09:05', '2026-05-08 15:09:05');
INSERT INTO `sys_job_log` VALUES (212, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:09:10', '2026-05-08 15:09:10', '2026-05-08 15:09:10');
INSERT INTO `sys_job_log` VALUES (213, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:09:15', '2026-05-08 15:09:15', '2026-05-08 15:09:15');
INSERT INTO `sys_job_log` VALUES (214, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：6毫秒', '0', '', '2026-05-08 15:09:20', '2026-05-08 15:09:20', '2026-05-08 15:09:20');
INSERT INTO `sys_job_log` VALUES (215, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:09:25', '2026-05-08 15:09:25', '2026-05-08 15:09:25');
INSERT INTO `sys_job_log` VALUES (216, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:09:30', '2026-05-08 15:09:30', '2026-05-08 15:09:30');
INSERT INTO `sys_job_log` VALUES (217, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:09:35', '2026-05-08 15:09:35', '2026-05-08 15:09:35');
INSERT INTO `sys_job_log` VALUES (218, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:09:40', '2026-05-08 15:09:40', '2026-05-08 15:09:40');
INSERT INTO `sys_job_log` VALUES (219, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:09:45', '2026-05-08 15:09:45', '2026-05-08 15:09:45');
INSERT INTO `sys_job_log` VALUES (220, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:09:50', '2026-05-08 15:09:50', '2026-05-08 15:09:50');
INSERT INTO `sys_job_log` VALUES (221, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:09:55', '2026-05-08 15:09:55', '2026-05-08 15:09:55');
INSERT INTO `sys_job_log` VALUES (222, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:10:00', '2026-05-08 15:10:00', '2026-05-08 15:10:00');
INSERT INTO `sys_job_log` VALUES (223, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:10:05', '2026-05-08 15:10:05', '2026-05-08 15:10:05');
INSERT INTO `sys_job_log` VALUES (224, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:10:10', '2026-05-08 15:10:10', '2026-05-08 15:10:10');
INSERT INTO `sys_job_log` VALUES (225, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:10:15', '2026-05-08 15:10:15', '2026-05-08 15:10:15');
INSERT INTO `sys_job_log` VALUES (226, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:10:20', '2026-05-08 15:10:20', '2026-05-08 15:10:20');
INSERT INTO `sys_job_log` VALUES (227, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:10:25', '2026-05-08 15:10:25', '2026-05-08 15:10:25');
INSERT INTO `sys_job_log` VALUES (228, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:10:30', '2026-05-08 15:10:30', '2026-05-08 15:10:30');
INSERT INTO `sys_job_log` VALUES (229, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 15:10:35', '2026-05-08 15:10:35', '2026-05-08 15:10:35');
INSERT INTO `sys_job_log` VALUES (230, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:10:40', '2026-05-08 15:10:40', '2026-05-08 15:10:40');
INSERT INTO `sys_job_log` VALUES (231, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:10:45', '2026-05-08 15:10:45', '2026-05-08 15:10:45');
INSERT INTO `sys_job_log` VALUES (232, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:10:50', '2026-05-08 15:10:50', '2026-05-08 15:10:50');
INSERT INTO `sys_job_log` VALUES (233, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:10:55', '2026-05-08 15:10:55', '2026-05-08 15:10:55');
INSERT INTO `sys_job_log` VALUES (234, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:11:00', '2026-05-08 15:11:00', '2026-05-08 15:11:00');
INSERT INTO `sys_job_log` VALUES (235, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:11:05', '2026-05-08 15:11:05', '2026-05-08 15:11:05');
INSERT INTO `sys_job_log` VALUES (236, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:11:10', '2026-05-08 15:11:10', '2026-05-08 15:11:10');
INSERT INTO `sys_job_log` VALUES (237, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:11:15', '2026-05-08 15:11:15', '2026-05-08 15:11:15');
INSERT INTO `sys_job_log` VALUES (238, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:11:20', '2026-05-08 15:11:20', '2026-05-08 15:11:20');
INSERT INTO `sys_job_log` VALUES (239, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:11:25', '2026-05-08 15:11:25', '2026-05-08 15:11:25');
INSERT INTO `sys_job_log` VALUES (240, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:11:30', '2026-05-08 15:11:30', '2026-05-08 15:11:30');
INSERT INTO `sys_job_log` VALUES (241, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:11:35', '2026-05-08 15:11:35', '2026-05-08 15:11:35');
INSERT INTO `sys_job_log` VALUES (242, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:11:40', '2026-05-08 15:11:40', '2026-05-08 15:11:40');
INSERT INTO `sys_job_log` VALUES (243, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 15:11:45', '2026-05-08 15:11:45', '2026-05-08 15:11:45');
INSERT INTO `sys_job_log` VALUES (244, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:11:50', '2026-05-08 15:11:50', '2026-05-08 15:11:50');
INSERT INTO `sys_job_log` VALUES (245, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:11:55', '2026-05-08 15:11:55', '2026-05-08 15:11:55');
INSERT INTO `sys_job_log` VALUES (246, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:12:00', '2026-05-08 15:12:00', '2026-05-08 15:12:00');
INSERT INTO `sys_job_log` VALUES (247, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:12:05', '2026-05-08 15:12:05', '2026-05-08 15:12:05');
INSERT INTO `sys_job_log` VALUES (248, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:12:10', '2026-05-08 15:12:10', '2026-05-08 15:12:10');
INSERT INTO `sys_job_log` VALUES (249, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:12:15', '2026-05-08 15:12:15', '2026-05-08 15:12:15');
INSERT INTO `sys_job_log` VALUES (250, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:12:20', '2026-05-08 15:12:20', '2026-05-08 15:12:20');
INSERT INTO `sys_job_log` VALUES (251, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:12:25', '2026-05-08 15:12:25', '2026-05-08 15:12:25');
INSERT INTO `sys_job_log` VALUES (252, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:12:30', '2026-05-08 15:12:30', '2026-05-08 15:12:30');
INSERT INTO `sys_job_log` VALUES (253, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:12:35', '2026-05-08 15:12:35', '2026-05-08 15:12:35');
INSERT INTO `sys_job_log` VALUES (254, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:12:40', '2026-05-08 15:12:40', '2026-05-08 15:12:40');
INSERT INTO `sys_job_log` VALUES (255, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:12:45', '2026-05-08 15:12:45', '2026-05-08 15:12:45');
INSERT INTO `sys_job_log` VALUES (256, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:12:50', '2026-05-08 15:12:50', '2026-05-08 15:12:50');
INSERT INTO `sys_job_log` VALUES (257, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:12:55', '2026-05-08 15:12:55', '2026-05-08 15:12:55');
INSERT INTO `sys_job_log` VALUES (258, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:13:00', '2026-05-08 15:13:00', '2026-05-08 15:13:00');
INSERT INTO `sys_job_log` VALUES (259, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:13:05', '2026-05-08 15:13:05', '2026-05-08 15:13:05');
INSERT INTO `sys_job_log` VALUES (260, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:13:10', '2026-05-08 15:13:10', '2026-05-08 15:13:10');
INSERT INTO `sys_job_log` VALUES (261, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:13:15', '2026-05-08 15:13:15', '2026-05-08 15:13:15');
INSERT INTO `sys_job_log` VALUES (262, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:13:20', '2026-05-08 15:13:20', '2026-05-08 15:13:20');
INSERT INTO `sys_job_log` VALUES (263, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:13:25', '2026-05-08 15:13:25', '2026-05-08 15:13:25');
INSERT INTO `sys_job_log` VALUES (264, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:13:30', '2026-05-08 15:13:30', '2026-05-08 15:13:30');
INSERT INTO `sys_job_log` VALUES (265, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:13:35', '2026-05-08 15:13:35', '2026-05-08 15:13:35');
INSERT INTO `sys_job_log` VALUES (266, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:13:40', '2026-05-08 15:13:40', '2026-05-08 15:13:40');
INSERT INTO `sys_job_log` VALUES (267, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:13:45', '2026-05-08 15:13:45', '2026-05-08 15:13:45');
INSERT INTO `sys_job_log` VALUES (268, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:13:50', '2026-05-08 15:13:50', '2026-05-08 15:13:50');
INSERT INTO `sys_job_log` VALUES (269, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:13:55', '2026-05-08 15:13:55', '2026-05-08 15:13:55');
INSERT INTO `sys_job_log` VALUES (270, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:14:00', '2026-05-08 15:14:00', '2026-05-08 15:14:00');
INSERT INTO `sys_job_log` VALUES (271, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:14:05', '2026-05-08 15:14:05', '2026-05-08 15:14:05');
INSERT INTO `sys_job_log` VALUES (272, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:14:10', '2026-05-08 15:14:10', '2026-05-08 15:14:10');
INSERT INTO `sys_job_log` VALUES (273, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:14:15', '2026-05-08 15:14:15', '2026-05-08 15:14:15');
INSERT INTO `sys_job_log` VALUES (274, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:14:20', '2026-05-08 15:14:20', '2026-05-08 15:14:20');
INSERT INTO `sys_job_log` VALUES (275, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:14:25', '2026-05-08 15:14:25', '2026-05-08 15:14:25');
INSERT INTO `sys_job_log` VALUES (276, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:14:30', '2026-05-08 15:14:30', '2026-05-08 15:14:30');
INSERT INTO `sys_job_log` VALUES (277, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:14:35', '2026-05-08 15:14:35', '2026-05-08 15:14:35');
INSERT INTO `sys_job_log` VALUES (278, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:14:40', '2026-05-08 15:14:40', '2026-05-08 15:14:40');
INSERT INTO `sys_job_log` VALUES (279, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:14:45', '2026-05-08 15:14:45', '2026-05-08 15:14:45');
INSERT INTO `sys_job_log` VALUES (280, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:14:50', '2026-05-08 15:14:50', '2026-05-08 15:14:50');
INSERT INTO `sys_job_log` VALUES (281, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:14:55', '2026-05-08 15:14:55', '2026-05-08 15:14:55');
INSERT INTO `sys_job_log` VALUES (282, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:15:00', '2026-05-08 15:15:00', '2026-05-08 15:15:00');
INSERT INTO `sys_job_log` VALUES (283, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:15:05', '2026-05-08 15:15:05', '2026-05-08 15:15:05');
INSERT INTO `sys_job_log` VALUES (284, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:15:10', '2026-05-08 15:15:10', '2026-05-08 15:15:10');
INSERT INTO `sys_job_log` VALUES (285, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:15:15', '2026-05-08 15:15:15', '2026-05-08 15:15:15');
INSERT INTO `sys_job_log` VALUES (286, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:15:20', '2026-05-08 15:15:20', '2026-05-08 15:15:20');
INSERT INTO `sys_job_log` VALUES (287, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:15:25', '2026-05-08 15:15:25', '2026-05-08 15:15:25');
INSERT INTO `sys_job_log` VALUES (288, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:15:30', '2026-05-08 15:15:30', '2026-05-08 15:15:30');
INSERT INTO `sys_job_log` VALUES (289, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:15:35', '2026-05-08 15:15:35', '2026-05-08 15:15:35');
INSERT INTO `sys_job_log` VALUES (290, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:15:40', '2026-05-08 15:15:40', '2026-05-08 15:15:40');
INSERT INTO `sys_job_log` VALUES (291, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:15:45', '2026-05-08 15:15:45', '2026-05-08 15:15:45');
INSERT INTO `sys_job_log` VALUES (292, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:15:50', '2026-05-08 15:15:50', '2026-05-08 15:15:50');
INSERT INTO `sys_job_log` VALUES (293, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:15:55', '2026-05-08 15:15:55', '2026-05-08 15:15:55');
INSERT INTO `sys_job_log` VALUES (294, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:16:00', '2026-05-08 15:16:00', '2026-05-08 15:16:00');
INSERT INTO `sys_job_log` VALUES (295, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:16:05', '2026-05-08 15:16:05', '2026-05-08 15:16:05');
INSERT INTO `sys_job_log` VALUES (296, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:16:10', '2026-05-08 15:16:10', '2026-05-08 15:16:10');
INSERT INTO `sys_job_log` VALUES (297, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:16:15', '2026-05-08 15:16:15', '2026-05-08 15:16:15');
INSERT INTO `sys_job_log` VALUES (298, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:16:20', '2026-05-08 15:16:20', '2026-05-08 15:16:20');
INSERT INTO `sys_job_log` VALUES (299, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:16:25', '2026-05-08 15:16:25', '2026-05-08 15:16:25');
INSERT INTO `sys_job_log` VALUES (300, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:16:30', '2026-05-08 15:16:30', '2026-05-08 15:16:30');
INSERT INTO `sys_job_log` VALUES (301, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:16:35', '2026-05-08 15:16:35', '2026-05-08 15:16:35');
INSERT INTO `sys_job_log` VALUES (302, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:16:40', '2026-05-08 15:16:40', '2026-05-08 15:16:40');
INSERT INTO `sys_job_log` VALUES (303, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:16:45', '2026-05-08 15:16:45', '2026-05-08 15:16:45');
INSERT INTO `sys_job_log` VALUES (304, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:16:50', '2026-05-08 15:16:50', '2026-05-08 15:16:50');
INSERT INTO `sys_job_log` VALUES (305, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:16:55', '2026-05-08 15:16:55', '2026-05-08 15:16:55');
INSERT INTO `sys_job_log` VALUES (306, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:17:00', '2026-05-08 15:17:00', '2026-05-08 15:17:00');
INSERT INTO `sys_job_log` VALUES (307, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:17:05', '2026-05-08 15:17:05', '2026-05-08 15:17:05');
INSERT INTO `sys_job_log` VALUES (308, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:17:10', '2026-05-08 15:17:10', '2026-05-08 15:17:10');
INSERT INTO `sys_job_log` VALUES (309, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:17:15', '2026-05-08 15:17:15', '2026-05-08 15:17:15');
INSERT INTO `sys_job_log` VALUES (310, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:17:20', '2026-05-08 15:17:20', '2026-05-08 15:17:20');
INSERT INTO `sys_job_log` VALUES (311, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:17:25', '2026-05-08 15:17:25', '2026-05-08 15:17:25');
INSERT INTO `sys_job_log` VALUES (312, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:17:30', '2026-05-08 15:17:30', '2026-05-08 15:17:30');
INSERT INTO `sys_job_log` VALUES (313, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:17:35', '2026-05-08 15:17:35', '2026-05-08 15:17:35');
INSERT INTO `sys_job_log` VALUES (314, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:17:40', '2026-05-08 15:17:40', '2026-05-08 15:17:40');
INSERT INTO `sys_job_log` VALUES (315, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:17:45', '2026-05-08 15:17:45', '2026-05-08 15:17:45');
INSERT INTO `sys_job_log` VALUES (316, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 15:17:50', '2026-05-08 15:17:50', '2026-05-08 15:17:50');
INSERT INTO `sys_job_log` VALUES (317, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 15:17:55', '2026-05-08 15:17:55', '2026-05-08 15:17:55');
INSERT INTO `sys_job_log` VALUES (318, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:18:00', '2026-05-08 15:18:00', '2026-05-08 15:18:00');
INSERT INTO `sys_job_log` VALUES (319, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:18:05', '2026-05-08 15:18:05', '2026-05-08 15:18:05');
INSERT INTO `sys_job_log` VALUES (320, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:18:10', '2026-05-08 15:18:10', '2026-05-08 15:18:10');
INSERT INTO `sys_job_log` VALUES (321, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:18:15', '2026-05-08 15:18:15', '2026-05-08 15:18:15');
INSERT INTO `sys_job_log` VALUES (322, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:18:20', '2026-05-08 15:18:20', '2026-05-08 15:18:20');
INSERT INTO `sys_job_log` VALUES (323, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:18:25', '2026-05-08 15:18:25', '2026-05-08 15:18:25');
INSERT INTO `sys_job_log` VALUES (324, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:18:30', '2026-05-08 15:18:30', '2026-05-08 15:18:30');
INSERT INTO `sys_job_log` VALUES (325, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:18:35', '2026-05-08 15:18:35', '2026-05-08 15:18:35');
INSERT INTO `sys_job_log` VALUES (326, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:18:40', '2026-05-08 15:18:40', '2026-05-08 15:18:40');
INSERT INTO `sys_job_log` VALUES (327, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:18:45', '2026-05-08 15:18:45', '2026-05-08 15:18:45');
INSERT INTO `sys_job_log` VALUES (328, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:18:50', '2026-05-08 15:18:50', '2026-05-08 15:18:50');
INSERT INTO `sys_job_log` VALUES (329, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:18:55', '2026-05-08 15:18:55', '2026-05-08 15:18:55');
INSERT INTO `sys_job_log` VALUES (330, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:19:00', '2026-05-08 15:19:00', '2026-05-08 15:19:00');
INSERT INTO `sys_job_log` VALUES (331, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:19:05', '2026-05-08 15:19:05', '2026-05-08 15:19:05');
INSERT INTO `sys_job_log` VALUES (332, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:19:10', '2026-05-08 15:19:10', '2026-05-08 15:19:10');
INSERT INTO `sys_job_log` VALUES (333, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:19:15', '2026-05-08 15:19:15', '2026-05-08 15:19:15');
INSERT INTO `sys_job_log` VALUES (334, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:19:20', '2026-05-08 15:19:20', '2026-05-08 15:19:20');
INSERT INTO `sys_job_log` VALUES (335, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:19:25', '2026-05-08 15:19:25', '2026-05-08 15:19:25');
INSERT INTO `sys_job_log` VALUES (336, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:19:30', '2026-05-08 15:19:30', '2026-05-08 15:19:30');
INSERT INTO `sys_job_log` VALUES (337, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:19:35', '2026-05-08 15:19:35', '2026-05-08 15:19:35');
INSERT INTO `sys_job_log` VALUES (338, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 15:19:40', '2026-05-08 15:19:40', '2026-05-08 15:19:40');
INSERT INTO `sys_job_log` VALUES (339, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:19:45', '2026-05-08 15:19:45', '2026-05-08 15:19:45');
INSERT INTO `sys_job_log` VALUES (340, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:19:50', '2026-05-08 15:19:50', '2026-05-08 15:19:50');
INSERT INTO `sys_job_log` VALUES (341, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:19:55', '2026-05-08 15:19:55', '2026-05-08 15:19:55');
INSERT INTO `sys_job_log` VALUES (342, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:20:00', '2026-05-08 15:20:00', '2026-05-08 15:20:00');
INSERT INTO `sys_job_log` VALUES (343, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:20:05', '2026-05-08 15:20:05', '2026-05-08 15:20:05');
INSERT INTO `sys_job_log` VALUES (344, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:20:10', '2026-05-08 15:20:10', '2026-05-08 15:20:10');
INSERT INTO `sys_job_log` VALUES (345, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:20:15', '2026-05-08 15:20:15', '2026-05-08 15:20:15');
INSERT INTO `sys_job_log` VALUES (346, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:20:20', '2026-05-08 15:20:20', '2026-05-08 15:20:20');
INSERT INTO `sys_job_log` VALUES (347, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:20:25', '2026-05-08 15:20:25', '2026-05-08 15:20:25');
INSERT INTO `sys_job_log` VALUES (348, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:20:30', '2026-05-08 15:20:30', '2026-05-08 15:20:30');
INSERT INTO `sys_job_log` VALUES (349, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:20:35', '2026-05-08 15:20:35', '2026-05-08 15:20:35');
INSERT INTO `sys_job_log` VALUES (350, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:20:40', '2026-05-08 15:20:40', '2026-05-08 15:20:40');
INSERT INTO `sys_job_log` VALUES (351, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:20:45', '2026-05-08 15:20:45', '2026-05-08 15:20:45');
INSERT INTO `sys_job_log` VALUES (352, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:20:50', '2026-05-08 15:20:50', '2026-05-08 15:20:50');
INSERT INTO `sys_job_log` VALUES (353, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:20:55', '2026-05-08 15:20:55', '2026-05-08 15:20:55');
INSERT INTO `sys_job_log` VALUES (354, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:21:00', '2026-05-08 15:21:00', '2026-05-08 15:21:00');
INSERT INTO `sys_job_log` VALUES (355, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:21:05', '2026-05-08 15:21:05', '2026-05-08 15:21:05');
INSERT INTO `sys_job_log` VALUES (356, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:21:10', '2026-05-08 15:21:10', '2026-05-08 15:21:10');
INSERT INTO `sys_job_log` VALUES (357, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:21:15', '2026-05-08 15:21:15', '2026-05-08 15:21:15');
INSERT INTO `sys_job_log` VALUES (358, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:21:20', '2026-05-08 15:21:20', '2026-05-08 15:21:20');
INSERT INTO `sys_job_log` VALUES (359, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:21:25', '2026-05-08 15:21:25', '2026-05-08 15:21:25');
INSERT INTO `sys_job_log` VALUES (360, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:21:30', '2026-05-08 15:21:30', '2026-05-08 15:21:30');
INSERT INTO `sys_job_log` VALUES (361, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:21:35', '2026-05-08 15:21:35', '2026-05-08 15:21:35');
INSERT INTO `sys_job_log` VALUES (362, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 15:21:40', '2026-05-08 15:21:40', '2026-05-08 15:21:40');
INSERT INTO `sys_job_log` VALUES (363, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:21:45', '2026-05-08 15:21:45', '2026-05-08 15:21:45');
INSERT INTO `sys_job_log` VALUES (364, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:21:50', '2026-05-08 15:21:50', '2026-05-08 15:21:50');
INSERT INTO `sys_job_log` VALUES (365, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:21:55', '2026-05-08 15:21:55', '2026-05-08 15:21:55');
INSERT INTO `sys_job_log` VALUES (366, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:22:00', '2026-05-08 15:22:00', '2026-05-08 15:22:00');
INSERT INTO `sys_job_log` VALUES (367, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:22:05', '2026-05-08 15:22:05', '2026-05-08 15:22:05');
INSERT INTO `sys_job_log` VALUES (368, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:22:10', '2026-05-08 15:22:10', '2026-05-08 15:22:10');
INSERT INTO `sys_job_log` VALUES (369, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:22:15', '2026-05-08 15:22:15', '2026-05-08 15:22:15');
INSERT INTO `sys_job_log` VALUES (370, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:22:20', '2026-05-08 15:22:20', '2026-05-08 15:22:20');
INSERT INTO `sys_job_log` VALUES (371, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:22:25', '2026-05-08 15:22:25', '2026-05-08 15:22:25');
INSERT INTO `sys_job_log` VALUES (372, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:22:30', '2026-05-08 15:22:30', '2026-05-08 15:22:30');
INSERT INTO `sys_job_log` VALUES (373, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:22:35', '2026-05-08 15:22:35', '2026-05-08 15:22:35');
INSERT INTO `sys_job_log` VALUES (374, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:22:40', '2026-05-08 15:22:40', '2026-05-08 15:22:40');
INSERT INTO `sys_job_log` VALUES (375, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:22:45', '2026-05-08 15:22:45', '2026-05-08 15:22:45');
INSERT INTO `sys_job_log` VALUES (376, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:22:50', '2026-05-08 15:22:50', '2026-05-08 15:22:50');
INSERT INTO `sys_job_log` VALUES (377, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:22:55', '2026-05-08 15:22:55', '2026-05-08 15:22:55');
INSERT INTO `sys_job_log` VALUES (378, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:23:00', '2026-05-08 15:23:00', '2026-05-08 15:23:00');
INSERT INTO `sys_job_log` VALUES (379, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:23:05', '2026-05-08 15:23:05', '2026-05-08 15:23:05');
INSERT INTO `sys_job_log` VALUES (380, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:23:10', '2026-05-08 15:23:10', '2026-05-08 15:23:10');
INSERT INTO `sys_job_log` VALUES (381, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:23:15', '2026-05-08 15:23:15', '2026-05-08 15:23:15');
INSERT INTO `sys_job_log` VALUES (382, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:23:20', '2026-05-08 15:23:20', '2026-05-08 15:23:20');
INSERT INTO `sys_job_log` VALUES (383, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:23:25', '2026-05-08 15:23:25', '2026-05-08 15:23:25');
INSERT INTO `sys_job_log` VALUES (384, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:23:30', '2026-05-08 15:23:30', '2026-05-08 15:23:30');
INSERT INTO `sys_job_log` VALUES (385, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:23:35', '2026-05-08 15:23:35', '2026-05-08 15:23:35');
INSERT INTO `sys_job_log` VALUES (386, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:23:40', '2026-05-08 15:23:40', '2026-05-08 15:23:40');
INSERT INTO `sys_job_log` VALUES (387, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:23:45', '2026-05-08 15:23:45', '2026-05-08 15:23:45');
INSERT INTO `sys_job_log` VALUES (388, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:23:50', '2026-05-08 15:23:50', '2026-05-08 15:23:50');
INSERT INTO `sys_job_log` VALUES (389, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:23:55', '2026-05-08 15:23:55', '2026-05-08 15:23:55');
INSERT INTO `sys_job_log` VALUES (390, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:24:00', '2026-05-08 15:24:00', '2026-05-08 15:24:00');
INSERT INTO `sys_job_log` VALUES (391, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:24:05', '2026-05-08 15:24:05', '2026-05-08 15:24:05');
INSERT INTO `sys_job_log` VALUES (392, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:24:10', '2026-05-08 15:24:10', '2026-05-08 15:24:10');
INSERT INTO `sys_job_log` VALUES (393, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:24:15', '2026-05-08 15:24:15', '2026-05-08 15:24:15');
INSERT INTO `sys_job_log` VALUES (394, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:24:20', '2026-05-08 15:24:20', '2026-05-08 15:24:20');
INSERT INTO `sys_job_log` VALUES (395, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:24:25', '2026-05-08 15:24:25', '2026-05-08 15:24:25');
INSERT INTO `sys_job_log` VALUES (396, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:24:30', '2026-05-08 15:24:30', '2026-05-08 15:24:30');
INSERT INTO `sys_job_log` VALUES (397, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:24:35', '2026-05-08 15:24:35', '2026-05-08 15:24:35');
INSERT INTO `sys_job_log` VALUES (398, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:24:40', '2026-05-08 15:24:40', '2026-05-08 15:24:40');
INSERT INTO `sys_job_log` VALUES (399, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:24:45', '2026-05-08 15:24:45', '2026-05-08 15:24:45');
INSERT INTO `sys_job_log` VALUES (400, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:24:50', '2026-05-08 15:24:50', '2026-05-08 15:24:50');
INSERT INTO `sys_job_log` VALUES (401, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:24:55', '2026-05-08 15:24:55', '2026-05-08 15:24:55');
INSERT INTO `sys_job_log` VALUES (402, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:25:00', '2026-05-08 15:25:00', '2026-05-08 15:25:00');
INSERT INTO `sys_job_log` VALUES (403, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:25:05', '2026-05-08 15:25:05', '2026-05-08 15:25:05');
INSERT INTO `sys_job_log` VALUES (404, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:25:10', '2026-05-08 15:25:10', '2026-05-08 15:25:10');
INSERT INTO `sys_job_log` VALUES (405, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:25:15', '2026-05-08 15:25:15', '2026-05-08 15:25:15');
INSERT INTO `sys_job_log` VALUES (406, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:25:20', '2026-05-08 15:25:20', '2026-05-08 15:25:20');
INSERT INTO `sys_job_log` VALUES (407, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:25:25', '2026-05-08 15:25:25', '2026-05-08 15:25:25');
INSERT INTO `sys_job_log` VALUES (408, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:25:30', '2026-05-08 15:25:30', '2026-05-08 15:25:30');
INSERT INTO `sys_job_log` VALUES (409, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:25:35', '2026-05-08 15:25:35', '2026-05-08 15:25:35');
INSERT INTO `sys_job_log` VALUES (410, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:25:40', '2026-05-08 15:25:40', '2026-05-08 15:25:40');
INSERT INTO `sys_job_log` VALUES (411, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:25:45', '2026-05-08 15:25:45', '2026-05-08 15:25:45');
INSERT INTO `sys_job_log` VALUES (412, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:25:50', '2026-05-08 15:25:50', '2026-05-08 15:25:50');
INSERT INTO `sys_job_log` VALUES (413, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:25:55', '2026-05-08 15:25:55', '2026-05-08 15:25:55');
INSERT INTO `sys_job_log` VALUES (414, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:26:00', '2026-05-08 15:26:00', '2026-05-08 15:26:00');
INSERT INTO `sys_job_log` VALUES (415, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:26:05', '2026-05-08 15:26:05', '2026-05-08 15:26:05');
INSERT INTO `sys_job_log` VALUES (416, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:26:10', '2026-05-08 15:26:10', '2026-05-08 15:26:10');
INSERT INTO `sys_job_log` VALUES (417, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:26:15', '2026-05-08 15:26:15', '2026-05-08 15:26:15');
INSERT INTO `sys_job_log` VALUES (418, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:26:20', '2026-05-08 15:26:20', '2026-05-08 15:26:20');
INSERT INTO `sys_job_log` VALUES (419, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:26:25', '2026-05-08 15:26:25', '2026-05-08 15:26:25');
INSERT INTO `sys_job_log` VALUES (420, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:26:30', '2026-05-08 15:26:30', '2026-05-08 15:26:30');
INSERT INTO `sys_job_log` VALUES (421, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:26:35', '2026-05-08 15:26:35', '2026-05-08 15:26:35');
INSERT INTO `sys_job_log` VALUES (422, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:26:40', '2026-05-08 15:26:40', '2026-05-08 15:26:40');
INSERT INTO `sys_job_log` VALUES (423, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:26:45', '2026-05-08 15:26:45', '2026-05-08 15:26:45');
INSERT INTO `sys_job_log` VALUES (424, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:26:50', '2026-05-08 15:26:50', '2026-05-08 15:26:50');
INSERT INTO `sys_job_log` VALUES (425, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:26:55', '2026-05-08 15:26:55', '2026-05-08 15:26:55');
INSERT INTO `sys_job_log` VALUES (426, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:27:00', '2026-05-08 15:27:00', '2026-05-08 15:27:00');
INSERT INTO `sys_job_log` VALUES (427, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 15:27:05', '2026-05-08 15:27:05', '2026-05-08 15:27:05');
INSERT INTO `sys_job_log` VALUES (428, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:27:10', '2026-05-08 15:27:10', '2026-05-08 15:27:10');
INSERT INTO `sys_job_log` VALUES (429, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:27:15', '2026-05-08 15:27:15', '2026-05-08 15:27:15');
INSERT INTO `sys_job_log` VALUES (430, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:27:20', '2026-05-08 15:27:20', '2026-05-08 15:27:20');
INSERT INTO `sys_job_log` VALUES (431, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:27:25', '2026-05-08 15:27:25', '2026-05-08 15:27:25');
INSERT INTO `sys_job_log` VALUES (432, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:27:30', '2026-05-08 15:27:30', '2026-05-08 15:27:30');
INSERT INTO `sys_job_log` VALUES (433, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:27:35', '2026-05-08 15:27:35', '2026-05-08 15:27:35');
INSERT INTO `sys_job_log` VALUES (434, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:27:40', '2026-05-08 15:27:40', '2026-05-08 15:27:40');
INSERT INTO `sys_job_log` VALUES (435, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:27:45', '2026-05-08 15:27:45', '2026-05-08 15:27:45');
INSERT INTO `sys_job_log` VALUES (436, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:27:50', '2026-05-08 15:27:50', '2026-05-08 15:27:50');
INSERT INTO `sys_job_log` VALUES (437, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:27:55', '2026-05-08 15:27:55', '2026-05-08 15:27:55');
INSERT INTO `sys_job_log` VALUES (438, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:28:00', '2026-05-08 15:28:00', '2026-05-08 15:28:00');
INSERT INTO `sys_job_log` VALUES (439, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:28:05', '2026-05-08 15:28:05', '2026-05-08 15:28:05');
INSERT INTO `sys_job_log` VALUES (440, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:28:10', '2026-05-08 15:28:10', '2026-05-08 15:28:10');
INSERT INTO `sys_job_log` VALUES (441, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:28:15', '2026-05-08 15:28:15', '2026-05-08 15:28:15');
INSERT INTO `sys_job_log` VALUES (442, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:28:20', '2026-05-08 15:28:20', '2026-05-08 15:28:20');
INSERT INTO `sys_job_log` VALUES (443, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:28:25', '2026-05-08 15:28:25', '2026-05-08 15:28:25');
INSERT INTO `sys_job_log` VALUES (444, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:28:30', '2026-05-08 15:28:30', '2026-05-08 15:28:30');
INSERT INTO `sys_job_log` VALUES (445, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:28:35', '2026-05-08 15:28:35', '2026-05-08 15:28:35');
INSERT INTO `sys_job_log` VALUES (446, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:28:40', '2026-05-08 15:28:40', '2026-05-08 15:28:40');
INSERT INTO `sys_job_log` VALUES (447, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:28:45', '2026-05-08 15:28:45', '2026-05-08 15:28:45');
INSERT INTO `sys_job_log` VALUES (448, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:28:50', '2026-05-08 15:28:50', '2026-05-08 15:28:50');
INSERT INTO `sys_job_log` VALUES (449, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:28:55', '2026-05-08 15:28:55', '2026-05-08 15:28:55');
INSERT INTO `sys_job_log` VALUES (450, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:29:00', '2026-05-08 15:29:00', '2026-05-08 15:29:00');
INSERT INTO `sys_job_log` VALUES (451, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:29:05', '2026-05-08 15:29:05', '2026-05-08 15:29:05');
INSERT INTO `sys_job_log` VALUES (452, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:29:10', '2026-05-08 15:29:10', '2026-05-08 15:29:10');
INSERT INTO `sys_job_log` VALUES (453, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:29:15', '2026-05-08 15:29:15', '2026-05-08 15:29:15');
INSERT INTO `sys_job_log` VALUES (454, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:29:20', '2026-05-08 15:29:20', '2026-05-08 15:29:20');
INSERT INTO `sys_job_log` VALUES (455, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:29:25', '2026-05-08 15:29:25', '2026-05-08 15:29:25');
INSERT INTO `sys_job_log` VALUES (456, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:29:30', '2026-05-08 15:29:30', '2026-05-08 15:29:30');
INSERT INTO `sys_job_log` VALUES (457, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:29:35', '2026-05-08 15:29:35', '2026-05-08 15:29:35');
INSERT INTO `sys_job_log` VALUES (458, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:29:40', '2026-05-08 15:29:40', '2026-05-08 15:29:40');
INSERT INTO `sys_job_log` VALUES (459, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:29:45', '2026-05-08 15:29:45', '2026-05-08 15:29:45');
INSERT INTO `sys_job_log` VALUES (460, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:29:50', '2026-05-08 15:29:50', '2026-05-08 15:29:50');
INSERT INTO `sys_job_log` VALUES (461, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:29:55', '2026-05-08 15:29:55', '2026-05-08 15:29:55');
INSERT INTO `sys_job_log` VALUES (462, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:30:00', '2026-05-08 15:30:00', '2026-05-08 15:30:00');
INSERT INTO `sys_job_log` VALUES (463, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:30:05', '2026-05-08 15:30:05', '2026-05-08 15:30:05');
INSERT INTO `sys_job_log` VALUES (464, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:30:10', '2026-05-08 15:30:10', '2026-05-08 15:30:10');
INSERT INTO `sys_job_log` VALUES (465, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:30:15', '2026-05-08 15:30:15', '2026-05-08 15:30:15');
INSERT INTO `sys_job_log` VALUES (466, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:30:20', '2026-05-08 15:30:20', '2026-05-08 15:30:20');
INSERT INTO `sys_job_log` VALUES (467, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:30:25', '2026-05-08 15:30:25', '2026-05-08 15:30:25');
INSERT INTO `sys_job_log` VALUES (468, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:30:30', '2026-05-08 15:30:30', '2026-05-08 15:30:30');
INSERT INTO `sys_job_log` VALUES (469, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:30:35', '2026-05-08 15:30:35', '2026-05-08 15:30:35');
INSERT INTO `sys_job_log` VALUES (470, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:30:40', '2026-05-08 15:30:40', '2026-05-08 15:30:40');
INSERT INTO `sys_job_log` VALUES (471, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:30:45', '2026-05-08 15:30:45', '2026-05-08 15:30:45');
INSERT INTO `sys_job_log` VALUES (472, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:30:50', '2026-05-08 15:30:50', '2026-05-08 15:30:50');
INSERT INTO `sys_job_log` VALUES (473, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:30:55', '2026-05-08 15:30:55', '2026-05-08 15:30:55');
INSERT INTO `sys_job_log` VALUES (474, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:31:00', '2026-05-08 15:31:00', '2026-05-08 15:31:00');
INSERT INTO `sys_job_log` VALUES (475, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:31:05', '2026-05-08 15:31:05', '2026-05-08 15:31:05');
INSERT INTO `sys_job_log` VALUES (476, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:31:10', '2026-05-08 15:31:10', '2026-05-08 15:31:10');
INSERT INTO `sys_job_log` VALUES (477, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:31:15', '2026-05-08 15:31:15', '2026-05-08 15:31:15');
INSERT INTO `sys_job_log` VALUES (478, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:31:20', '2026-05-08 15:31:20', '2026-05-08 15:31:20');
INSERT INTO `sys_job_log` VALUES (479, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:31:25', '2026-05-08 15:31:25', '2026-05-08 15:31:25');
INSERT INTO `sys_job_log` VALUES (480, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:31:30', '2026-05-08 15:31:30', '2026-05-08 15:31:30');
INSERT INTO `sys_job_log` VALUES (481, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:31:35', '2026-05-08 15:31:35', '2026-05-08 15:31:35');
INSERT INTO `sys_job_log` VALUES (482, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:31:40', '2026-05-08 15:31:40', '2026-05-08 15:31:40');
INSERT INTO `sys_job_log` VALUES (483, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:31:45', '2026-05-08 15:31:45', '2026-05-08 15:31:45');
INSERT INTO `sys_job_log` VALUES (484, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:31:50', '2026-05-08 15:31:50', '2026-05-08 15:31:50');
INSERT INTO `sys_job_log` VALUES (485, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:31:55', '2026-05-08 15:31:55', '2026-05-08 15:31:55');
INSERT INTO `sys_job_log` VALUES (486, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:32:00', '2026-05-08 15:32:00', '2026-05-08 15:32:00');
INSERT INTO `sys_job_log` VALUES (487, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:32:05', '2026-05-08 15:32:05', '2026-05-08 15:32:05');
INSERT INTO `sys_job_log` VALUES (488, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:32:10', '2026-05-08 15:32:10', '2026-05-08 15:32:10');
INSERT INTO `sys_job_log` VALUES (489, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:32:15', '2026-05-08 15:32:15', '2026-05-08 15:32:15');
INSERT INTO `sys_job_log` VALUES (490, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:32:20', '2026-05-08 15:32:20', '2026-05-08 15:32:20');
INSERT INTO `sys_job_log` VALUES (491, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:32:25', '2026-05-08 15:32:25', '2026-05-08 15:32:25');
INSERT INTO `sys_job_log` VALUES (492, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:32:30', '2026-05-08 15:32:30', '2026-05-08 15:32:30');
INSERT INTO `sys_job_log` VALUES (493, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:32:35', '2026-05-08 15:32:35', '2026-05-08 15:32:35');
INSERT INTO `sys_job_log` VALUES (494, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:32:40', '2026-05-08 15:32:40', '2026-05-08 15:32:40');
INSERT INTO `sys_job_log` VALUES (495, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:32:45', '2026-05-08 15:32:45', '2026-05-08 15:32:45');
INSERT INTO `sys_job_log` VALUES (496, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:32:50', '2026-05-08 15:32:50', '2026-05-08 15:32:50');
INSERT INTO `sys_job_log` VALUES (497, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:32:55', '2026-05-08 15:32:55', '2026-05-08 15:32:55');
INSERT INTO `sys_job_log` VALUES (498, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:33:00', '2026-05-08 15:33:00', '2026-05-08 15:33:00');
INSERT INTO `sys_job_log` VALUES (499, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:33:05', '2026-05-08 15:33:05', '2026-05-08 15:33:05');
INSERT INTO `sys_job_log` VALUES (500, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:33:10', '2026-05-08 15:33:10', '2026-05-08 15:33:10');
INSERT INTO `sys_job_log` VALUES (501, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:33:15', '2026-05-08 15:33:15', '2026-05-08 15:33:15');
INSERT INTO `sys_job_log` VALUES (502, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:33:20', '2026-05-08 15:33:20', '2026-05-08 15:33:20');
INSERT INTO `sys_job_log` VALUES (503, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:33:25', '2026-05-08 15:33:25', '2026-05-08 15:33:25');
INSERT INTO `sys_job_log` VALUES (504, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:33:30', '2026-05-08 15:33:30', '2026-05-08 15:33:30');
INSERT INTO `sys_job_log` VALUES (505, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:33:35', '2026-05-08 15:33:35', '2026-05-08 15:33:35');
INSERT INTO `sys_job_log` VALUES (506, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:33:40', '2026-05-08 15:33:40', '2026-05-08 15:33:40');
INSERT INTO `sys_job_log` VALUES (507, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:33:45', '2026-05-08 15:33:45', '2026-05-08 15:33:45');
INSERT INTO `sys_job_log` VALUES (508, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:33:50', '2026-05-08 15:33:50', '2026-05-08 15:33:50');
INSERT INTO `sys_job_log` VALUES (509, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:33:55', '2026-05-08 15:33:55', '2026-05-08 15:33:55');
INSERT INTO `sys_job_log` VALUES (510, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:34:00', '2026-05-08 15:34:00', '2026-05-08 15:34:00');
INSERT INTO `sys_job_log` VALUES (511, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:34:05', '2026-05-08 15:34:05', '2026-05-08 15:34:05');
INSERT INTO `sys_job_log` VALUES (512, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:34:10', '2026-05-08 15:34:10', '2026-05-08 15:34:10');
INSERT INTO `sys_job_log` VALUES (513, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:34:15', '2026-05-08 15:34:15', '2026-05-08 15:34:15');
INSERT INTO `sys_job_log` VALUES (514, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:34:20', '2026-05-08 15:34:20', '2026-05-08 15:34:20');
INSERT INTO `sys_job_log` VALUES (515, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:34:25', '2026-05-08 15:34:25', '2026-05-08 15:34:25');
INSERT INTO `sys_job_log` VALUES (516, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:34:30', '2026-05-08 15:34:30', '2026-05-08 15:34:30');
INSERT INTO `sys_job_log` VALUES (517, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:34:35', '2026-05-08 15:34:35', '2026-05-08 15:34:35');
INSERT INTO `sys_job_log` VALUES (518, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:34:40', '2026-05-08 15:34:40', '2026-05-08 15:34:40');
INSERT INTO `sys_job_log` VALUES (519, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:34:45', '2026-05-08 15:34:45', '2026-05-08 15:34:45');
INSERT INTO `sys_job_log` VALUES (520, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:34:50', '2026-05-08 15:34:50', '2026-05-08 15:34:50');
INSERT INTO `sys_job_log` VALUES (521, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:34:55', '2026-05-08 15:34:55', '2026-05-08 15:34:55');
INSERT INTO `sys_job_log` VALUES (522, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:35:00', '2026-05-08 15:35:00', '2026-05-08 15:35:00');
INSERT INTO `sys_job_log` VALUES (523, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:35:05', '2026-05-08 15:35:05', '2026-05-08 15:35:05');
INSERT INTO `sys_job_log` VALUES (524, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:35:10', '2026-05-08 15:35:10', '2026-05-08 15:35:10');
INSERT INTO `sys_job_log` VALUES (525, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:35:15', '2026-05-08 15:35:15', '2026-05-08 15:35:15');
INSERT INTO `sys_job_log` VALUES (526, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:35:20', '2026-05-08 15:35:20', '2026-05-08 15:35:20');
INSERT INTO `sys_job_log` VALUES (527, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:35:25', '2026-05-08 15:35:25', '2026-05-08 15:35:25');
INSERT INTO `sys_job_log` VALUES (528, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:35:30', '2026-05-08 15:35:30', '2026-05-08 15:35:30');
INSERT INTO `sys_job_log` VALUES (529, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:35:35', '2026-05-08 15:35:35', '2026-05-08 15:35:35');
INSERT INTO `sys_job_log` VALUES (530, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:35:40', '2026-05-08 15:35:40', '2026-05-08 15:35:40');
INSERT INTO `sys_job_log` VALUES (531, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:35:45', '2026-05-08 15:35:45', '2026-05-08 15:35:45');
INSERT INTO `sys_job_log` VALUES (532, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:35:50', '2026-05-08 15:35:50', '2026-05-08 15:35:50');
INSERT INTO `sys_job_log` VALUES (533, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:35:55', '2026-05-08 15:35:55', '2026-05-08 15:35:55');
INSERT INTO `sys_job_log` VALUES (534, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:36:00', '2026-05-08 15:36:00', '2026-05-08 15:36:00');
INSERT INTO `sys_job_log` VALUES (535, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:36:05', '2026-05-08 15:36:05', '2026-05-08 15:36:05');
INSERT INTO `sys_job_log` VALUES (536, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:36:10', '2026-05-08 15:36:10', '2026-05-08 15:36:10');
INSERT INTO `sys_job_log` VALUES (537, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:36:15', '2026-05-08 15:36:15', '2026-05-08 15:36:15');
INSERT INTO `sys_job_log` VALUES (538, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:36:20', '2026-05-08 15:36:20', '2026-05-08 15:36:20');
INSERT INTO `sys_job_log` VALUES (539, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:36:25', '2026-05-08 15:36:25', '2026-05-08 15:36:25');
INSERT INTO `sys_job_log` VALUES (540, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:36:30', '2026-05-08 15:36:30', '2026-05-08 15:36:30');
INSERT INTO `sys_job_log` VALUES (541, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:36:35', '2026-05-08 15:36:35', '2026-05-08 15:36:35');
INSERT INTO `sys_job_log` VALUES (542, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:36:40', '2026-05-08 15:36:40', '2026-05-08 15:36:40');
INSERT INTO `sys_job_log` VALUES (543, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:36:45', '2026-05-08 15:36:45', '2026-05-08 15:36:45');
INSERT INTO `sys_job_log` VALUES (544, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:36:50', '2026-05-08 15:36:50', '2026-05-08 15:36:50');
INSERT INTO `sys_job_log` VALUES (545, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:36:55', '2026-05-08 15:36:55', '2026-05-08 15:36:55');
INSERT INTO `sys_job_log` VALUES (546, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:37:00', '2026-05-08 15:37:00', '2026-05-08 15:37:00');
INSERT INTO `sys_job_log` VALUES (547, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:37:05', '2026-05-08 15:37:05', '2026-05-08 15:37:05');
INSERT INTO `sys_job_log` VALUES (548, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:37:10', '2026-05-08 15:37:10', '2026-05-08 15:37:10');
INSERT INTO `sys_job_log` VALUES (549, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:37:15', '2026-05-08 15:37:15', '2026-05-08 15:37:15');
INSERT INTO `sys_job_log` VALUES (550, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:37:20', '2026-05-08 15:37:20', '2026-05-08 15:37:20');
INSERT INTO `sys_job_log` VALUES (551, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:37:25', '2026-05-08 15:37:25', '2026-05-08 15:37:25');
INSERT INTO `sys_job_log` VALUES (552, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:37:30', '2026-05-08 15:37:30', '2026-05-08 15:37:30');
INSERT INTO `sys_job_log` VALUES (553, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:37:35', '2026-05-08 15:37:35', '2026-05-08 15:37:35');
INSERT INTO `sys_job_log` VALUES (554, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:37:40', '2026-05-08 15:37:40', '2026-05-08 15:37:40');
INSERT INTO `sys_job_log` VALUES (555, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:37:45', '2026-05-08 15:37:45', '2026-05-08 15:37:45');
INSERT INTO `sys_job_log` VALUES (556, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:37:50', '2026-05-08 15:37:50', '2026-05-08 15:37:50');
INSERT INTO `sys_job_log` VALUES (557, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:37:55', '2026-05-08 15:37:55', '2026-05-08 15:37:55');
INSERT INTO `sys_job_log` VALUES (558, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:38:00', '2026-05-08 15:38:00', '2026-05-08 15:38:00');
INSERT INTO `sys_job_log` VALUES (559, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:38:05', '2026-05-08 15:38:05', '2026-05-08 15:38:05');
INSERT INTO `sys_job_log` VALUES (560, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:38:10', '2026-05-08 15:38:10', '2026-05-08 15:38:10');
INSERT INTO `sys_job_log` VALUES (561, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:38:15', '2026-05-08 15:38:15', '2026-05-08 15:38:15');
INSERT INTO `sys_job_log` VALUES (562, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:38:20', '2026-05-08 15:38:20', '2026-05-08 15:38:20');
INSERT INTO `sys_job_log` VALUES (563, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:38:25', '2026-05-08 15:38:25', '2026-05-08 15:38:25');
INSERT INTO `sys_job_log` VALUES (564, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:38:30', '2026-05-08 15:38:30', '2026-05-08 15:38:30');
INSERT INTO `sys_job_log` VALUES (565, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:38:35', '2026-05-08 15:38:35', '2026-05-08 15:38:35');
INSERT INTO `sys_job_log` VALUES (566, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:38:40', '2026-05-08 15:38:40', '2026-05-08 15:38:40');
INSERT INTO `sys_job_log` VALUES (567, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:38:45', '2026-05-08 15:38:45', '2026-05-08 15:38:45');
INSERT INTO `sys_job_log` VALUES (568, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:38:50', '2026-05-08 15:38:50', '2026-05-08 15:38:50');
INSERT INTO `sys_job_log` VALUES (569, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:38:55', '2026-05-08 15:38:55', '2026-05-08 15:38:55');
INSERT INTO `sys_job_log` VALUES (570, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:39:00', '2026-05-08 15:39:00', '2026-05-08 15:39:00');
INSERT INTO `sys_job_log` VALUES (571, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:39:05', '2026-05-08 15:39:05', '2026-05-08 15:39:05');
INSERT INTO `sys_job_log` VALUES (572, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 15:39:10', '2026-05-08 15:39:10', '2026-05-08 15:39:10');
INSERT INTO `sys_job_log` VALUES (573, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:39:15', '2026-05-08 15:39:15', '2026-05-08 15:39:15');
INSERT INTO `sys_job_log` VALUES (574, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:39:20', '2026-05-08 15:39:20', '2026-05-08 15:39:20');
INSERT INTO `sys_job_log` VALUES (575, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:39:25', '2026-05-08 15:39:25', '2026-05-08 15:39:25');
INSERT INTO `sys_job_log` VALUES (576, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:39:30', '2026-05-08 15:39:30', '2026-05-08 15:39:30');
INSERT INTO `sys_job_log` VALUES (577, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:39:35', '2026-05-08 15:39:35', '2026-05-08 15:39:35');
INSERT INTO `sys_job_log` VALUES (578, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:39:40', '2026-05-08 15:39:40', '2026-05-08 15:39:40');
INSERT INTO `sys_job_log` VALUES (579, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:39:45', '2026-05-08 15:39:45', '2026-05-08 15:39:45');
INSERT INTO `sys_job_log` VALUES (580, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:39:50', '2026-05-08 15:39:50', '2026-05-08 15:39:50');
INSERT INTO `sys_job_log` VALUES (581, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:39:55', '2026-05-08 15:39:55', '2026-05-08 15:39:55');
INSERT INTO `sys_job_log` VALUES (582, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:40:00', '2026-05-08 15:40:00', '2026-05-08 15:40:00');
INSERT INTO `sys_job_log` VALUES (583, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:40:05', '2026-05-08 15:40:05', '2026-05-08 15:40:05');
INSERT INTO `sys_job_log` VALUES (584, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:40:10', '2026-05-08 15:40:10', '2026-05-08 15:40:10');
INSERT INTO `sys_job_log` VALUES (585, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:40:15', '2026-05-08 15:40:15', '2026-05-08 15:40:15');
INSERT INTO `sys_job_log` VALUES (586, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:40:20', '2026-05-08 15:40:20', '2026-05-08 15:40:20');
INSERT INTO `sys_job_log` VALUES (587, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:40:25', '2026-05-08 15:40:25', '2026-05-08 15:40:25');
INSERT INTO `sys_job_log` VALUES (588, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:40:30', '2026-05-08 15:40:30', '2026-05-08 15:40:30');
INSERT INTO `sys_job_log` VALUES (589, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:40:35', '2026-05-08 15:40:35', '2026-05-08 15:40:35');
INSERT INTO `sys_job_log` VALUES (590, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:40:40', '2026-05-08 15:40:40', '2026-05-08 15:40:40');
INSERT INTO `sys_job_log` VALUES (591, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:40:45', '2026-05-08 15:40:45', '2026-05-08 15:40:45');
INSERT INTO `sys_job_log` VALUES (592, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:40:50', '2026-05-08 15:40:50', '2026-05-08 15:40:50');
INSERT INTO `sys_job_log` VALUES (593, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:40:55', '2026-05-08 15:40:55', '2026-05-08 15:40:55');
INSERT INTO `sys_job_log` VALUES (594, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:41:00', '2026-05-08 15:41:00', '2026-05-08 15:41:00');
INSERT INTO `sys_job_log` VALUES (595, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:41:05', '2026-05-08 15:41:05', '2026-05-08 15:41:05');
INSERT INTO `sys_job_log` VALUES (596, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:41:10', '2026-05-08 15:41:10', '2026-05-08 15:41:10');
INSERT INTO `sys_job_log` VALUES (597, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:41:15', '2026-05-08 15:41:15', '2026-05-08 15:41:15');
INSERT INTO `sys_job_log` VALUES (598, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:41:20', '2026-05-08 15:41:20', '2026-05-08 15:41:20');
INSERT INTO `sys_job_log` VALUES (599, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:41:25', '2026-05-08 15:41:25', '2026-05-08 15:41:25');
INSERT INTO `sys_job_log` VALUES (600, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:41:30', '2026-05-08 15:41:30', '2026-05-08 15:41:30');
INSERT INTO `sys_job_log` VALUES (601, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:41:35', '2026-05-08 15:41:35', '2026-05-08 15:41:35');
INSERT INTO `sys_job_log` VALUES (602, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:41:40', '2026-05-08 15:41:40', '2026-05-08 15:41:40');
INSERT INTO `sys_job_log` VALUES (603, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:41:45', '2026-05-08 15:41:45', '2026-05-08 15:41:45');
INSERT INTO `sys_job_log` VALUES (604, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:41:50', '2026-05-08 15:41:50', '2026-05-08 15:41:50');
INSERT INTO `sys_job_log` VALUES (605, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:41:55', '2026-05-08 15:41:55', '2026-05-08 15:41:55');
INSERT INTO `sys_job_log` VALUES (606, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:42:00', '2026-05-08 15:42:00', '2026-05-08 15:42:00');
INSERT INTO `sys_job_log` VALUES (607, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:42:05', '2026-05-08 15:42:05', '2026-05-08 15:42:05');
INSERT INTO `sys_job_log` VALUES (608, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:42:10', '2026-05-08 15:42:10', '2026-05-08 15:42:10');
INSERT INTO `sys_job_log` VALUES (609, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:42:15', '2026-05-08 15:42:15', '2026-05-08 15:42:15');
INSERT INTO `sys_job_log` VALUES (610, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:42:20', '2026-05-08 15:42:20', '2026-05-08 15:42:20');
INSERT INTO `sys_job_log` VALUES (611, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:42:25', '2026-05-08 15:42:25', '2026-05-08 15:42:25');
INSERT INTO `sys_job_log` VALUES (612, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:42:30', '2026-05-08 15:42:30', '2026-05-08 15:42:30');
INSERT INTO `sys_job_log` VALUES (613, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:42:35', '2026-05-08 15:42:35', '2026-05-08 15:42:35');
INSERT INTO `sys_job_log` VALUES (614, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:42:40', '2026-05-08 15:42:40', '2026-05-08 15:42:40');
INSERT INTO `sys_job_log` VALUES (615, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:42:45', '2026-05-08 15:42:45', '2026-05-08 15:42:45');
INSERT INTO `sys_job_log` VALUES (616, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:42:50', '2026-05-08 15:42:50', '2026-05-08 15:42:50');
INSERT INTO `sys_job_log` VALUES (617, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:42:55', '2026-05-08 15:42:55', '2026-05-08 15:42:55');
INSERT INTO `sys_job_log` VALUES (618, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:43:00', '2026-05-08 15:43:00', '2026-05-08 15:43:00');
INSERT INTO `sys_job_log` VALUES (619, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:43:05', '2026-05-08 15:43:05', '2026-05-08 15:43:05');
INSERT INTO `sys_job_log` VALUES (620, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:43:10', '2026-05-08 15:43:10', '2026-05-08 15:43:10');
INSERT INTO `sys_job_log` VALUES (621, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:43:15', '2026-05-08 15:43:15', '2026-05-08 15:43:15');
INSERT INTO `sys_job_log` VALUES (622, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:43:20', '2026-05-08 15:43:20', '2026-05-08 15:43:20');
INSERT INTO `sys_job_log` VALUES (623, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:43:25', '2026-05-08 15:43:25', '2026-05-08 15:43:25');
INSERT INTO `sys_job_log` VALUES (624, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:43:30', '2026-05-08 15:43:30', '2026-05-08 15:43:30');
INSERT INTO `sys_job_log` VALUES (625, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:43:35', '2026-05-08 15:43:35', '2026-05-08 15:43:35');
INSERT INTO `sys_job_log` VALUES (626, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:43:40', '2026-05-08 15:43:40', '2026-05-08 15:43:40');
INSERT INTO `sys_job_log` VALUES (627, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:43:45', '2026-05-08 15:43:45', '2026-05-08 15:43:45');
INSERT INTO `sys_job_log` VALUES (628, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:43:50', '2026-05-08 15:43:50', '2026-05-08 15:43:50');
INSERT INTO `sys_job_log` VALUES (629, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:43:55', '2026-05-08 15:43:55', '2026-05-08 15:43:55');
INSERT INTO `sys_job_log` VALUES (630, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:44:00', '2026-05-08 15:44:00', '2026-05-08 15:44:00');
INSERT INTO `sys_job_log` VALUES (631, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:44:05', '2026-05-08 15:44:05', '2026-05-08 15:44:05');
INSERT INTO `sys_job_log` VALUES (632, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:44:10', '2026-05-08 15:44:10', '2026-05-08 15:44:10');
INSERT INTO `sys_job_log` VALUES (633, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:44:15', '2026-05-08 15:44:15', '2026-05-08 15:44:15');
INSERT INTO `sys_job_log` VALUES (634, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 15:44:20', '2026-05-08 15:44:20', '2026-05-08 15:44:20');
INSERT INTO `sys_job_log` VALUES (635, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:38:45', '2026-05-08 16:38:45', '2026-05-08 16:38:45');
INSERT INTO `sys_job_log` VALUES (636, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:38:50', '2026-05-08 16:38:50', '2026-05-08 16:38:50');
INSERT INTO `sys_job_log` VALUES (637, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:38:55', '2026-05-08 16:38:55', '2026-05-08 16:38:55');
INSERT INTO `sys_job_log` VALUES (638, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:39:00', '2026-05-08 16:39:00', '2026-05-08 16:39:00');
INSERT INTO `sys_job_log` VALUES (639, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:39:05', '2026-05-08 16:39:05', '2026-05-08 16:39:05');
INSERT INTO `sys_job_log` VALUES (640, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:39:10', '2026-05-08 16:39:10', '2026-05-08 16:39:10');
INSERT INTO `sys_job_log` VALUES (641, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:39:15', '2026-05-08 16:39:15', '2026-05-08 16:39:15');
INSERT INTO `sys_job_log` VALUES (642, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:39:20', '2026-05-08 16:39:20', '2026-05-08 16:39:20');
INSERT INTO `sys_job_log` VALUES (643, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:39:25', '2026-05-08 16:39:25', '2026-05-08 16:39:25');
INSERT INTO `sys_job_log` VALUES (644, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:39:30', '2026-05-08 16:39:30', '2026-05-08 16:39:30');
INSERT INTO `sys_job_log` VALUES (645, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:39:35', '2026-05-08 16:39:35', '2026-05-08 16:39:35');
INSERT INTO `sys_job_log` VALUES (646, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:39:40', '2026-05-08 16:39:40', '2026-05-08 16:39:40');
INSERT INTO `sys_job_log` VALUES (647, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:39:45', '2026-05-08 16:39:45', '2026-05-08 16:39:45');
INSERT INTO `sys_job_log` VALUES (648, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:39:50', '2026-05-08 16:39:50', '2026-05-08 16:39:50');
INSERT INTO `sys_job_log` VALUES (649, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:39:55', '2026-05-08 16:39:55', '2026-05-08 16:39:55');
INSERT INTO `sys_job_log` VALUES (650, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:40:00', '2026-05-08 16:40:00', '2026-05-08 16:40:00');
INSERT INTO `sys_job_log` VALUES (651, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:40:05', '2026-05-08 16:40:05', '2026-05-08 16:40:05');
INSERT INTO `sys_job_log` VALUES (652, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:40:10', '2026-05-08 16:40:10', '2026-05-08 16:40:10');
INSERT INTO `sys_job_log` VALUES (653, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:40:15', '2026-05-08 16:40:15', '2026-05-08 16:40:15');
INSERT INTO `sys_job_log` VALUES (654, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:40:20', '2026-05-08 16:40:20', '2026-05-08 16:40:20');
INSERT INTO `sys_job_log` VALUES (655, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:40:25', '2026-05-08 16:40:25', '2026-05-08 16:40:25');
INSERT INTO `sys_job_log` VALUES (656, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:40:30', '2026-05-08 16:40:30', '2026-05-08 16:40:30');
INSERT INTO `sys_job_log` VALUES (657, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:40:35', '2026-05-08 16:40:35', '2026-05-08 16:40:35');
INSERT INTO `sys_job_log` VALUES (658, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:40:40', '2026-05-08 16:40:40', '2026-05-08 16:40:40');
INSERT INTO `sys_job_log` VALUES (659, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:40:45', '2026-05-08 16:40:45', '2026-05-08 16:40:45');
INSERT INTO `sys_job_log` VALUES (660, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:40:50', '2026-05-08 16:40:50', '2026-05-08 16:40:50');
INSERT INTO `sys_job_log` VALUES (661, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:40:55', '2026-05-08 16:40:55', '2026-05-08 16:40:55');
INSERT INTO `sys_job_log` VALUES (662, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:41:00', '2026-05-08 16:41:00', '2026-05-08 16:41:00');
INSERT INTO `sys_job_log` VALUES (663, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:41:05', '2026-05-08 16:41:05', '2026-05-08 16:41:05');
INSERT INTO `sys_job_log` VALUES (664, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:41:10', '2026-05-08 16:41:10', '2026-05-08 16:41:10');
INSERT INTO `sys_job_log` VALUES (665, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:41:15', '2026-05-08 16:41:15', '2026-05-08 16:41:15');
INSERT INTO `sys_job_log` VALUES (666, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:41:20', '2026-05-08 16:41:20', '2026-05-08 16:41:20');
INSERT INTO `sys_job_log` VALUES (667, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:41:25', '2026-05-08 16:41:25', '2026-05-08 16:41:25');
INSERT INTO `sys_job_log` VALUES (668, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:41:30', '2026-05-08 16:41:30', '2026-05-08 16:41:30');
INSERT INTO `sys_job_log` VALUES (669, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:41:35', '2026-05-08 16:41:35', '2026-05-08 16:41:35');
INSERT INTO `sys_job_log` VALUES (670, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:41:40', '2026-05-08 16:41:40', '2026-05-08 16:41:40');
INSERT INTO `sys_job_log` VALUES (671, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 16:48:47', '2026-05-08 16:48:47', '2026-05-08 16:48:46');
INSERT INTO `sys_job_log` VALUES (672, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:48:50', '2026-05-08 16:48:50', '2026-05-08 16:48:50');
INSERT INTO `sys_job_log` VALUES (673, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:48:55', '2026-05-08 16:48:55', '2026-05-08 16:48:55');
INSERT INTO `sys_job_log` VALUES (674, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:49:00', '2026-05-08 16:49:00', '2026-05-08 16:49:00');
INSERT INTO `sys_job_log` VALUES (675, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:49:05', '2026-05-08 16:49:05', '2026-05-08 16:49:05');
INSERT INTO `sys_job_log` VALUES (676, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:49:10', '2026-05-08 16:49:10', '2026-05-08 16:49:10');
INSERT INTO `sys_job_log` VALUES (677, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:49:15', '2026-05-08 16:49:15', '2026-05-08 16:49:15');
INSERT INTO `sys_job_log` VALUES (678, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:49:20', '2026-05-08 16:49:20', '2026-05-08 16:49:20');
INSERT INTO `sys_job_log` VALUES (679, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:49:25', '2026-05-08 16:49:25', '2026-05-08 16:49:25');
INSERT INTO `sys_job_log` VALUES (680, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:49:30', '2026-05-08 16:49:30', '2026-05-08 16:49:30');
INSERT INTO `sys_job_log` VALUES (681, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:49:35', '2026-05-08 16:49:35', '2026-05-08 16:49:35');
INSERT INTO `sys_job_log` VALUES (682, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:49:40', '2026-05-08 16:49:40', '2026-05-08 16:49:40');
INSERT INTO `sys_job_log` VALUES (683, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:49:45', '2026-05-08 16:49:45', '2026-05-08 16:49:45');
INSERT INTO `sys_job_log` VALUES (684, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:49:50', '2026-05-08 16:49:50', '2026-05-08 16:49:50');
INSERT INTO `sys_job_log` VALUES (685, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:49:55', '2026-05-08 16:49:55', '2026-05-08 16:49:55');
INSERT INTO `sys_job_log` VALUES (686, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:50:00', '2026-05-08 16:50:00', '2026-05-08 16:50:00');
INSERT INTO `sys_job_log` VALUES (687, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:50:05', '2026-05-08 16:50:05', '2026-05-08 16:50:05');
INSERT INTO `sys_job_log` VALUES (688, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:50:10', '2026-05-08 16:50:10', '2026-05-08 16:50:10');
INSERT INTO `sys_job_log` VALUES (689, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:50:15', '2026-05-08 16:50:15', '2026-05-08 16:50:15');
INSERT INTO `sys_job_log` VALUES (690, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:50:20', '2026-05-08 16:50:20', '2026-05-08 16:50:20');
INSERT INTO `sys_job_log` VALUES (691, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:50:25', '2026-05-08 16:50:25', '2026-05-08 16:50:25');
INSERT INTO `sys_job_log` VALUES (692, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:50:30', '2026-05-08 16:50:30', '2026-05-08 16:50:30');
INSERT INTO `sys_job_log` VALUES (693, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:50:35', '2026-05-08 16:50:35', '2026-05-08 16:50:35');
INSERT INTO `sys_job_log` VALUES (694, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:50:40', '2026-05-08 16:50:40', '2026-05-08 16:50:40');
INSERT INTO `sys_job_log` VALUES (695, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:50:45', '2026-05-08 16:50:45', '2026-05-08 16:50:45');
INSERT INTO `sys_job_log` VALUES (696, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:50:50', '2026-05-08 16:50:50', '2026-05-08 16:50:50');
INSERT INTO `sys_job_log` VALUES (697, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:50:55', '2026-05-08 16:50:55', '2026-05-08 16:50:55');
INSERT INTO `sys_job_log` VALUES (698, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:51:00', '2026-05-08 16:51:00', '2026-05-08 16:51:00');
INSERT INTO `sys_job_log` VALUES (699, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:51:05', '2026-05-08 16:51:05', '2026-05-08 16:51:05');
INSERT INTO `sys_job_log` VALUES (700, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:51:10', '2026-05-08 16:51:10', '2026-05-08 16:51:10');
INSERT INTO `sys_job_log` VALUES (701, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:51:15', '2026-05-08 16:51:15', '2026-05-08 16:51:15');
INSERT INTO `sys_job_log` VALUES (702, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:51:20', '2026-05-08 16:51:20', '2026-05-08 16:51:20');
INSERT INTO `sys_job_log` VALUES (703, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:51:25', '2026-05-08 16:51:25', '2026-05-08 16:51:25');
INSERT INTO `sys_job_log` VALUES (704, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:51:30', '2026-05-08 16:51:30', '2026-05-08 16:51:30');
INSERT INTO `sys_job_log` VALUES (705, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:51:35', '2026-05-08 16:51:35', '2026-05-08 16:51:35');
INSERT INTO `sys_job_log` VALUES (706, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:51:40', '2026-05-08 16:51:40', '2026-05-08 16:51:40');
INSERT INTO `sys_job_log` VALUES (707, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:51:45', '2026-05-08 16:51:45', '2026-05-08 16:51:45');
INSERT INTO `sys_job_log` VALUES (708, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:51:50', '2026-05-08 16:51:50', '2026-05-08 16:51:50');
INSERT INTO `sys_job_log` VALUES (709, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:51:55', '2026-05-08 16:51:55', '2026-05-08 16:51:55');
INSERT INTO `sys_job_log` VALUES (710, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:52:00', '2026-05-08 16:52:00', '2026-05-08 16:52:00');
INSERT INTO `sys_job_log` VALUES (711, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:52:05', '2026-05-08 16:52:05', '2026-05-08 16:52:05');
INSERT INTO `sys_job_log` VALUES (712, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:52:10', '2026-05-08 16:52:10', '2026-05-08 16:52:10');
INSERT INTO `sys_job_log` VALUES (713, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:52:15', '2026-05-08 16:52:15', '2026-05-08 16:52:15');
INSERT INTO `sys_job_log` VALUES (714, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:52:20', '2026-05-08 16:52:20', '2026-05-08 16:52:20');
INSERT INTO `sys_job_log` VALUES (715, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:52:25', '2026-05-08 16:52:25', '2026-05-08 16:52:25');
INSERT INTO `sys_job_log` VALUES (716, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:52:30', '2026-05-08 16:52:30', '2026-05-08 16:52:30');
INSERT INTO `sys_job_log` VALUES (717, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:52:35', '2026-05-08 16:52:35', '2026-05-08 16:52:35');
INSERT INTO `sys_job_log` VALUES (718, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:52:40', '2026-05-08 16:52:40', '2026-05-08 16:52:40');
INSERT INTO `sys_job_log` VALUES (719, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:52:45', '2026-05-08 16:52:45', '2026-05-08 16:52:45');
INSERT INTO `sys_job_log` VALUES (720, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:52:50', '2026-05-08 16:52:50', '2026-05-08 16:52:50');
INSERT INTO `sys_job_log` VALUES (721, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:52:55', '2026-05-08 16:52:55', '2026-05-08 16:52:55');
INSERT INTO `sys_job_log` VALUES (722, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:53:00', '2026-05-08 16:53:00', '2026-05-08 16:53:00');
INSERT INTO `sys_job_log` VALUES (723, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:53:05', '2026-05-08 16:53:05', '2026-05-08 16:53:05');
INSERT INTO `sys_job_log` VALUES (724, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:53:10', '2026-05-08 16:53:10', '2026-05-08 16:53:10');
INSERT INTO `sys_job_log` VALUES (725, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:53:15', '2026-05-08 16:53:15', '2026-05-08 16:53:15');
INSERT INTO `sys_job_log` VALUES (726, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 16:53:20', '2026-05-08 16:53:20', '2026-05-08 16:53:20');
INSERT INTO `sys_job_log` VALUES (727, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:53:25', '2026-05-08 16:53:25', '2026-05-08 16:53:25');
INSERT INTO `sys_job_log` VALUES (728, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:53:30', '2026-05-08 16:53:30', '2026-05-08 16:53:30');
INSERT INTO `sys_job_log` VALUES (729, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:53:35', '2026-05-08 16:53:35', '2026-05-08 16:53:35');
INSERT INTO `sys_job_log` VALUES (730, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:53:40', '2026-05-08 16:53:40', '2026-05-08 16:53:40');
INSERT INTO `sys_job_log` VALUES (731, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:53:45', '2026-05-08 16:53:45', '2026-05-08 16:53:45');
INSERT INTO `sys_job_log` VALUES (732, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:53:50', '2026-05-08 16:53:50', '2026-05-08 16:53:50');
INSERT INTO `sys_job_log` VALUES (733, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:53:55', '2026-05-08 16:53:55', '2026-05-08 16:53:55');
INSERT INTO `sys_job_log` VALUES (734, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 16:54:00', '2026-05-08 16:54:00', '2026-05-08 16:54:00');
INSERT INTO `sys_job_log` VALUES (735, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:54:05', '2026-05-08 16:54:05', '2026-05-08 16:54:05');
INSERT INTO `sys_job_log` VALUES (736, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:54:10', '2026-05-08 16:54:10', '2026-05-08 16:54:10');
INSERT INTO `sys_job_log` VALUES (737, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:54:15', '2026-05-08 16:54:15', '2026-05-08 16:54:15');
INSERT INTO `sys_job_log` VALUES (738, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:54:20', '2026-05-08 16:54:20', '2026-05-08 16:54:20');
INSERT INTO `sys_job_log` VALUES (739, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:54:25', '2026-05-08 16:54:25', '2026-05-08 16:54:25');
INSERT INTO `sys_job_log` VALUES (740, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:54:30', '2026-05-08 16:54:30', '2026-05-08 16:54:30');
INSERT INTO `sys_job_log` VALUES (741, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:54:35', '2026-05-08 16:54:35', '2026-05-08 16:54:35');
INSERT INTO `sys_job_log` VALUES (742, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 16:54:40', '2026-05-08 16:54:40', '2026-05-08 16:54:40');
INSERT INTO `sys_job_log` VALUES (743, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:54:45', '2026-05-08 16:54:45', '2026-05-08 16:54:45');
INSERT INTO `sys_job_log` VALUES (744, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:54:50', '2026-05-08 16:54:50', '2026-05-08 16:54:50');
INSERT INTO `sys_job_log` VALUES (745, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:54:55', '2026-05-08 16:54:55', '2026-05-08 16:54:55');
INSERT INTO `sys_job_log` VALUES (746, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:55:00', '2026-05-08 16:55:00', '2026-05-08 16:55:00');
INSERT INTO `sys_job_log` VALUES (747, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:55:05', '2026-05-08 16:55:05', '2026-05-08 16:55:05');
INSERT INTO `sys_job_log` VALUES (748, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:55:10', '2026-05-08 16:55:10', '2026-05-08 16:55:10');
INSERT INTO `sys_job_log` VALUES (749, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:55:15', '2026-05-08 16:55:15', '2026-05-08 16:55:15');
INSERT INTO `sys_job_log` VALUES (750, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:55:20', '2026-05-08 16:55:20', '2026-05-08 16:55:20');
INSERT INTO `sys_job_log` VALUES (751, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:55:25', '2026-05-08 16:55:25', '2026-05-08 16:55:25');
INSERT INTO `sys_job_log` VALUES (752, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:55:30', '2026-05-08 16:55:30', '2026-05-08 16:55:30');
INSERT INTO `sys_job_log` VALUES (753, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:55:35', '2026-05-08 16:55:35', '2026-05-08 16:55:35');
INSERT INTO `sys_job_log` VALUES (754, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:55:40', '2026-05-08 16:55:40', '2026-05-08 16:55:40');
INSERT INTO `sys_job_log` VALUES (755, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:55:45', '2026-05-08 16:55:45', '2026-05-08 16:55:45');
INSERT INTO `sys_job_log` VALUES (756, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:55:50', '2026-05-08 16:55:50', '2026-05-08 16:55:50');
INSERT INTO `sys_job_log` VALUES (757, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:55:55', '2026-05-08 16:55:55', '2026-05-08 16:55:55');
INSERT INTO `sys_job_log` VALUES (758, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:56:00', '2026-05-08 16:56:00', '2026-05-08 16:56:00');
INSERT INTO `sys_job_log` VALUES (759, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:56:05', '2026-05-08 16:56:05', '2026-05-08 16:56:05');
INSERT INTO `sys_job_log` VALUES (760, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:56:10', '2026-05-08 16:56:10', '2026-05-08 16:56:10');
INSERT INTO `sys_job_log` VALUES (761, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:56:15', '2026-05-08 16:56:15', '2026-05-08 16:56:15');
INSERT INTO `sys_job_log` VALUES (762, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:56:20', '2026-05-08 16:56:20', '2026-05-08 16:56:20');
INSERT INTO `sys_job_log` VALUES (763, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:56:25', '2026-05-08 16:56:25', '2026-05-08 16:56:25');
INSERT INTO `sys_job_log` VALUES (764, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:56:30', '2026-05-08 16:56:30', '2026-05-08 16:56:30');
INSERT INTO `sys_job_log` VALUES (765, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:56:35', '2026-05-08 16:56:35', '2026-05-08 16:56:35');
INSERT INTO `sys_job_log` VALUES (766, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:56:40', '2026-05-08 16:56:40', '2026-05-08 16:56:40');
INSERT INTO `sys_job_log` VALUES (767, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:56:45', '2026-05-08 16:56:45', '2026-05-08 16:56:45');
INSERT INTO `sys_job_log` VALUES (768, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:56:50', '2026-05-08 16:56:50', '2026-05-08 16:56:50');
INSERT INTO `sys_job_log` VALUES (769, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:56:55', '2026-05-08 16:56:55', '2026-05-08 16:56:55');
INSERT INTO `sys_job_log` VALUES (770, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:57:00', '2026-05-08 16:57:00', '2026-05-08 16:57:00');
INSERT INTO `sys_job_log` VALUES (771, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:57:05', '2026-05-08 16:57:05', '2026-05-08 16:57:05');
INSERT INTO `sys_job_log` VALUES (772, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:57:10', '2026-05-08 16:57:10', '2026-05-08 16:57:10');
INSERT INTO `sys_job_log` VALUES (773, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:57:15', '2026-05-08 16:57:15', '2026-05-08 16:57:15');
INSERT INTO `sys_job_log` VALUES (774, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:57:20', '2026-05-08 16:57:20', '2026-05-08 16:57:20');
INSERT INTO `sys_job_log` VALUES (775, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:57:25', '2026-05-08 16:57:25', '2026-05-08 16:57:25');
INSERT INTO `sys_job_log` VALUES (776, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:57:30', '2026-05-08 16:57:30', '2026-05-08 16:57:30');
INSERT INTO `sys_job_log` VALUES (777, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:57:35', '2026-05-08 16:57:35', '2026-05-08 16:57:35');
INSERT INTO `sys_job_log` VALUES (778, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 16:57:40', '2026-05-08 16:57:40', '2026-05-08 16:57:40');
INSERT INTO `sys_job_log` VALUES (779, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:57:45', '2026-05-08 16:57:45', '2026-05-08 16:57:45');
INSERT INTO `sys_job_log` VALUES (780, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:57:50', '2026-05-08 16:57:50', '2026-05-08 16:57:50');
INSERT INTO `sys_job_log` VALUES (781, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:57:55', '2026-05-08 16:57:55', '2026-05-08 16:57:55');
INSERT INTO `sys_job_log` VALUES (782, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:58:00', '2026-05-08 16:58:00', '2026-05-08 16:58:00');
INSERT INTO `sys_job_log` VALUES (783, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:58:05', '2026-05-08 16:58:05', '2026-05-08 16:58:05');
INSERT INTO `sys_job_log` VALUES (784, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:58:10', '2026-05-08 16:58:10', '2026-05-08 16:58:10');
INSERT INTO `sys_job_log` VALUES (785, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:58:15', '2026-05-08 16:58:15', '2026-05-08 16:58:15');
INSERT INTO `sys_job_log` VALUES (786, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:58:20', '2026-05-08 16:58:20', '2026-05-08 16:58:20');
INSERT INTO `sys_job_log` VALUES (787, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:58:25', '2026-05-08 16:58:25', '2026-05-08 16:58:25');
INSERT INTO `sys_job_log` VALUES (788, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:58:30', '2026-05-08 16:58:30', '2026-05-08 16:58:30');
INSERT INTO `sys_job_log` VALUES (789, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 16:58:35', '2026-05-08 16:58:35', '2026-05-08 16:58:35');
INSERT INTO `sys_job_log` VALUES (790, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:58:40', '2026-05-08 16:58:40', '2026-05-08 16:58:40');
INSERT INTO `sys_job_log` VALUES (791, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:58:45', '2026-05-08 16:58:45', '2026-05-08 16:58:45');
INSERT INTO `sys_job_log` VALUES (792, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:58:50', '2026-05-08 16:58:50', '2026-05-08 16:58:50');
INSERT INTO `sys_job_log` VALUES (793, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:58:55', '2026-05-08 16:58:55', '2026-05-08 16:58:55');
INSERT INTO `sys_job_log` VALUES (794, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:59:00', '2026-05-08 16:59:00', '2026-05-08 16:59:00');
INSERT INTO `sys_job_log` VALUES (795, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:59:05', '2026-05-08 16:59:05', '2026-05-08 16:59:05');
INSERT INTO `sys_job_log` VALUES (796, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:59:10', '2026-05-08 16:59:10', '2026-05-08 16:59:10');
INSERT INTO `sys_job_log` VALUES (797, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:59:15', '2026-05-08 16:59:15', '2026-05-08 16:59:15');
INSERT INTO `sys_job_log` VALUES (798, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:59:20', '2026-05-08 16:59:20', '2026-05-08 16:59:20');
INSERT INTO `sys_job_log` VALUES (799, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:59:25', '2026-05-08 16:59:25', '2026-05-08 16:59:25');
INSERT INTO `sys_job_log` VALUES (800, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:59:30', '2026-05-08 16:59:30', '2026-05-08 16:59:30');
INSERT INTO `sys_job_log` VALUES (801, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:59:35', '2026-05-08 16:59:35', '2026-05-08 16:59:35');
INSERT INTO `sys_job_log` VALUES (802, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:59:40', '2026-05-08 16:59:40', '2026-05-08 16:59:40');
INSERT INTO `sys_job_log` VALUES (803, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:59:45', '2026-05-08 16:59:45', '2026-05-08 16:59:45');
INSERT INTO `sys_job_log` VALUES (804, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 16:59:50', '2026-05-08 16:59:50', '2026-05-08 16:59:50');
INSERT INTO `sys_job_log` VALUES (805, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 16:59:55', '2026-05-08 16:59:55', '2026-05-08 16:59:55');
INSERT INTO `sys_job_log` VALUES (806, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:00:00', '2026-05-08 17:00:00', '2026-05-08 17:00:00');
INSERT INTO `sys_job_log` VALUES (807, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:00:05', '2026-05-08 17:00:05', '2026-05-08 17:00:05');
INSERT INTO `sys_job_log` VALUES (808, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:00:10', '2026-05-08 17:00:10', '2026-05-08 17:00:10');
INSERT INTO `sys_job_log` VALUES (809, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:00:15', '2026-05-08 17:00:15', '2026-05-08 17:00:15');
INSERT INTO `sys_job_log` VALUES (810, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:00:20', '2026-05-08 17:00:20', '2026-05-08 17:00:20');
INSERT INTO `sys_job_log` VALUES (811, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:00:25', '2026-05-08 17:00:25', '2026-05-08 17:00:25');
INSERT INTO `sys_job_log` VALUES (812, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:00:30', '2026-05-08 17:00:30', '2026-05-08 17:00:30');
INSERT INTO `sys_job_log` VALUES (813, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:00:35', '2026-05-08 17:00:35', '2026-05-08 17:00:35');
INSERT INTO `sys_job_log` VALUES (814, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:00:40', '2026-05-08 17:00:40', '2026-05-08 17:00:40');
INSERT INTO `sys_job_log` VALUES (815, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:00:45', '2026-05-08 17:00:45', '2026-05-08 17:00:45');
INSERT INTO `sys_job_log` VALUES (816, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:00:50', '2026-05-08 17:00:50', '2026-05-08 17:00:50');
INSERT INTO `sys_job_log` VALUES (817, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:00:55', '2026-05-08 17:00:55', '2026-05-08 17:00:55');
INSERT INTO `sys_job_log` VALUES (818, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:01:00', '2026-05-08 17:01:00', '2026-05-08 17:01:00');
INSERT INTO `sys_job_log` VALUES (819, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:01:05', '2026-05-08 17:01:05', '2026-05-08 17:01:05');
INSERT INTO `sys_job_log` VALUES (820, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:01:10', '2026-05-08 17:01:10', '2026-05-08 17:01:10');
INSERT INTO `sys_job_log` VALUES (821, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:01:15', '2026-05-08 17:01:15', '2026-05-08 17:01:15');
INSERT INTO `sys_job_log` VALUES (822, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:01:20', '2026-05-08 17:01:20', '2026-05-08 17:01:20');
INSERT INTO `sys_job_log` VALUES (823, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:01:25', '2026-05-08 17:01:25', '2026-05-08 17:01:25');
INSERT INTO `sys_job_log` VALUES (824, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:01:30', '2026-05-08 17:01:30', '2026-05-08 17:01:30');
INSERT INTO `sys_job_log` VALUES (825, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:01:35', '2026-05-08 17:01:35', '2026-05-08 17:01:35');
INSERT INTO `sys_job_log` VALUES (826, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:01:40', '2026-05-08 17:01:40', '2026-05-08 17:01:40');
INSERT INTO `sys_job_log` VALUES (827, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:01:45', '2026-05-08 17:01:45', '2026-05-08 17:01:45');
INSERT INTO `sys_job_log` VALUES (828, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:01:50', '2026-05-08 17:01:50', '2026-05-08 17:01:50');
INSERT INTO `sys_job_log` VALUES (829, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:01:55', '2026-05-08 17:01:55', '2026-05-08 17:01:55');
INSERT INTO `sys_job_log` VALUES (830, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:02:00', '2026-05-08 17:02:00', '2026-05-08 17:02:00');
INSERT INTO `sys_job_log` VALUES (831, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:02:05', '2026-05-08 17:02:05', '2026-05-08 17:02:05');
INSERT INTO `sys_job_log` VALUES (832, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:02:10', '2026-05-08 17:02:10', '2026-05-08 17:02:10');
INSERT INTO `sys_job_log` VALUES (833, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:02:15', '2026-05-08 17:02:15', '2026-05-08 17:02:15');
INSERT INTO `sys_job_log` VALUES (834, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:02:20', '2026-05-08 17:02:20', '2026-05-08 17:02:20');
INSERT INTO `sys_job_log` VALUES (835, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:02:25', '2026-05-08 17:02:25', '2026-05-08 17:02:25');
INSERT INTO `sys_job_log` VALUES (836, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:02:30', '2026-05-08 17:02:30', '2026-05-08 17:02:30');
INSERT INTO `sys_job_log` VALUES (837, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:02:35', '2026-05-08 17:02:35', '2026-05-08 17:02:35');
INSERT INTO `sys_job_log` VALUES (838, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:02:40', '2026-05-08 17:02:40', '2026-05-08 17:02:40');
INSERT INTO `sys_job_log` VALUES (839, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:02:45', '2026-05-08 17:02:45', '2026-05-08 17:02:45');
INSERT INTO `sys_job_log` VALUES (840, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:02:50', '2026-05-08 17:02:50', '2026-05-08 17:02:50');
INSERT INTO `sys_job_log` VALUES (841, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:02:55', '2026-05-08 17:02:55', '2026-05-08 17:02:55');
INSERT INTO `sys_job_log` VALUES (842, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:03:00', '2026-05-08 17:03:00', '2026-05-08 17:03:00');
INSERT INTO `sys_job_log` VALUES (843, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：4毫秒', '0', '', '2026-05-08 17:03:07', '2026-05-08 17:03:07', '2026-05-08 17:03:06');
INSERT INTO `sys_job_log` VALUES (844, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:03:15', '2026-05-08 17:03:15', '2026-05-08 17:03:15');
INSERT INTO `sys_job_log` VALUES (845, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:03:20', '2026-05-08 17:03:20', '2026-05-08 17:03:20');
INSERT INTO `sys_job_log` VALUES (846, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:03:25', '2026-05-08 17:03:25', '2026-05-08 17:03:25');
INSERT INTO `sys_job_log` VALUES (847, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:03:30', '2026-05-08 17:03:30', '2026-05-08 17:03:30');
INSERT INTO `sys_job_log` VALUES (848, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:03:35', '2026-05-08 17:03:35', '2026-05-08 17:03:35');
INSERT INTO `sys_job_log` VALUES (849, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:03:40', '2026-05-08 17:03:40', '2026-05-08 17:03:40');
INSERT INTO `sys_job_log` VALUES (850, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:03:45', '2026-05-08 17:03:45', '2026-05-08 17:03:45');
INSERT INTO `sys_job_log` VALUES (851, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:03:50', '2026-05-08 17:03:50', '2026-05-08 17:03:50');
INSERT INTO `sys_job_log` VALUES (852, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:03:55', '2026-05-08 17:03:55', '2026-05-08 17:03:55');
INSERT INTO `sys_job_log` VALUES (853, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:04:00', '2026-05-08 17:04:00', '2026-05-08 17:04:00');
INSERT INTO `sys_job_log` VALUES (854, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:04:05', '2026-05-08 17:04:05', '2026-05-08 17:04:05');
INSERT INTO `sys_job_log` VALUES (855, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:04:10', '2026-05-08 17:04:10', '2026-05-08 17:04:10');
INSERT INTO `sys_job_log` VALUES (856, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:04:15', '2026-05-08 17:04:15', '2026-05-08 17:04:15');
INSERT INTO `sys_job_log` VALUES (857, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:04:20', '2026-05-08 17:04:20', '2026-05-08 17:04:20');
INSERT INTO `sys_job_log` VALUES (858, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:04:25', '2026-05-08 17:04:25', '2026-05-08 17:04:25');
INSERT INTO `sys_job_log` VALUES (859, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:04:30', '2026-05-08 17:04:30', '2026-05-08 17:04:30');
INSERT INTO `sys_job_log` VALUES (860, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:04:35', '2026-05-08 17:04:35', '2026-05-08 17:04:35');
INSERT INTO `sys_job_log` VALUES (861, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:04:40', '2026-05-08 17:04:40', '2026-05-08 17:04:40');
INSERT INTO `sys_job_log` VALUES (862, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:04:45', '2026-05-08 17:04:45', '2026-05-08 17:04:45');
INSERT INTO `sys_job_log` VALUES (863, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:04:50', '2026-05-08 17:04:50', '2026-05-08 17:04:50');
INSERT INTO `sys_job_log` VALUES (864, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:04:55', '2026-05-08 17:04:55', '2026-05-08 17:04:55');
INSERT INTO `sys_job_log` VALUES (865, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:05:00', '2026-05-08 17:05:00', '2026-05-08 17:05:00');
INSERT INTO `sys_job_log` VALUES (866, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:05:05', '2026-05-08 17:05:05', '2026-05-08 17:05:05');
INSERT INTO `sys_job_log` VALUES (867, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:05:10', '2026-05-08 17:05:10', '2026-05-08 17:05:10');
INSERT INTO `sys_job_log` VALUES (868, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:05:15', '2026-05-08 17:05:15', '2026-05-08 17:05:15');
INSERT INTO `sys_job_log` VALUES (869, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:05:20', '2026-05-08 17:05:20', '2026-05-08 17:05:20');
INSERT INTO `sys_job_log` VALUES (870, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:05:25', '2026-05-08 17:05:25', '2026-05-08 17:05:25');
INSERT INTO `sys_job_log` VALUES (871, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:05:30', '2026-05-08 17:05:30', '2026-05-08 17:05:30');
INSERT INTO `sys_job_log` VALUES (872, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:05:35', '2026-05-08 17:05:35', '2026-05-08 17:05:35');
INSERT INTO `sys_job_log` VALUES (873, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:05:40', '2026-05-08 17:05:40', '2026-05-08 17:05:40');
INSERT INTO `sys_job_log` VALUES (874, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:05:45', '2026-05-08 17:05:45', '2026-05-08 17:05:45');
INSERT INTO `sys_job_log` VALUES (875, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:05:50', '2026-05-08 17:05:50', '2026-05-08 17:05:50');
INSERT INTO `sys_job_log` VALUES (876, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:05:55', '2026-05-08 17:05:55', '2026-05-08 17:05:55');
INSERT INTO `sys_job_log` VALUES (877, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:06:00', '2026-05-08 17:06:00', '2026-05-08 17:06:00');
INSERT INTO `sys_job_log` VALUES (878, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:06:05', '2026-05-08 17:06:05', '2026-05-08 17:06:05');
INSERT INTO `sys_job_log` VALUES (879, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:06:10', '2026-05-08 17:06:10', '2026-05-08 17:06:10');
INSERT INTO `sys_job_log` VALUES (880, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:06:15', '2026-05-08 17:06:15', '2026-05-08 17:06:15');
INSERT INTO `sys_job_log` VALUES (881, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:06:20', '2026-05-08 17:06:20', '2026-05-08 17:06:20');
INSERT INTO `sys_job_log` VALUES (882, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:06:25', '2026-05-08 17:06:25', '2026-05-08 17:06:25');
INSERT INTO `sys_job_log` VALUES (883, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:06:30', '2026-05-08 17:06:30', '2026-05-08 17:06:30');
INSERT INTO `sys_job_log` VALUES (884, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:06:35', '2026-05-08 17:06:35', '2026-05-08 17:06:35');
INSERT INTO `sys_job_log` VALUES (885, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:06:40', '2026-05-08 17:06:40', '2026-05-08 17:06:40');
INSERT INTO `sys_job_log` VALUES (886, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:06:45', '2026-05-08 17:06:45', '2026-05-08 17:06:45');
INSERT INTO `sys_job_log` VALUES (887, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:06:50', '2026-05-08 17:06:50', '2026-05-08 17:06:50');
INSERT INTO `sys_job_log` VALUES (888, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:06:55', '2026-05-08 17:06:55', '2026-05-08 17:06:55');
INSERT INTO `sys_job_log` VALUES (889, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:07:00', '2026-05-08 17:07:00', '2026-05-08 17:07:00');
INSERT INTO `sys_job_log` VALUES (890, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:07:05', '2026-05-08 17:07:05', '2026-05-08 17:07:05');
INSERT INTO `sys_job_log` VALUES (891, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:07:10', '2026-05-08 17:07:10', '2026-05-08 17:07:10');
INSERT INTO `sys_job_log` VALUES (892, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:07:15', '2026-05-08 17:07:15', '2026-05-08 17:07:15');
INSERT INTO `sys_job_log` VALUES (893, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:07:20', '2026-05-08 17:07:20', '2026-05-08 17:07:20');
INSERT INTO `sys_job_log` VALUES (894, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:07:25', '2026-05-08 17:07:25', '2026-05-08 17:07:25');
INSERT INTO `sys_job_log` VALUES (895, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:07:30', '2026-05-08 17:07:30', '2026-05-08 17:07:30');
INSERT INTO `sys_job_log` VALUES (896, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:07:35', '2026-05-08 17:07:35', '2026-05-08 17:07:35');
INSERT INTO `sys_job_log` VALUES (897, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:07:40', '2026-05-08 17:07:40', '2026-05-08 17:07:40');
INSERT INTO `sys_job_log` VALUES (898, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:07:45', '2026-05-08 17:07:45', '2026-05-08 17:07:45');
INSERT INTO `sys_job_log` VALUES (899, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:07:50', '2026-05-08 17:07:50', '2026-05-08 17:07:50');
INSERT INTO `sys_job_log` VALUES (900, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:07:55', '2026-05-08 17:07:55', '2026-05-08 17:07:55');
INSERT INTO `sys_job_log` VALUES (901, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:08:00', '2026-05-08 17:08:00', '2026-05-08 17:08:00');
INSERT INTO `sys_job_log` VALUES (902, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:08:05', '2026-05-08 17:08:05', '2026-05-08 17:08:05');
INSERT INTO `sys_job_log` VALUES (903, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:08:10', '2026-05-08 17:08:10', '2026-05-08 17:08:10');
INSERT INTO `sys_job_log` VALUES (904, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:08:15', '2026-05-08 17:08:15', '2026-05-08 17:08:15');
INSERT INTO `sys_job_log` VALUES (905, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:08:20', '2026-05-08 17:08:20', '2026-05-08 17:08:20');
INSERT INTO `sys_job_log` VALUES (906, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:08:25', '2026-05-08 17:08:25', '2026-05-08 17:08:25');
INSERT INTO `sys_job_log` VALUES (907, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:08:30', '2026-05-08 17:08:30', '2026-05-08 17:08:30');
INSERT INTO `sys_job_log` VALUES (908, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:08:35', '2026-05-08 17:08:35', '2026-05-08 17:08:35');
INSERT INTO `sys_job_log` VALUES (909, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:08:40', '2026-05-08 17:08:40', '2026-05-08 17:08:40');
INSERT INTO `sys_job_log` VALUES (910, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:08:45', '2026-05-08 17:08:45', '2026-05-08 17:08:45');
INSERT INTO `sys_job_log` VALUES (911, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:08:50', '2026-05-08 17:08:50', '2026-05-08 17:08:50');
INSERT INTO `sys_job_log` VALUES (912, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:08:55', '2026-05-08 17:08:55', '2026-05-08 17:08:55');
INSERT INTO `sys_job_log` VALUES (913, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:09:00', '2026-05-08 17:09:00', '2026-05-08 17:09:00');
INSERT INTO `sys_job_log` VALUES (914, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:09:05', '2026-05-08 17:09:05', '2026-05-08 17:09:05');
INSERT INTO `sys_job_log` VALUES (915, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:09:10', '2026-05-08 17:09:10', '2026-05-08 17:09:10');
INSERT INTO `sys_job_log` VALUES (916, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:09:15', '2026-05-08 17:09:15', '2026-05-08 17:09:15');
INSERT INTO `sys_job_log` VALUES (917, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:09:20', '2026-05-08 17:09:20', '2026-05-08 17:09:20');
INSERT INTO `sys_job_log` VALUES (918, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:09:25', '2026-05-08 17:09:25', '2026-05-08 17:09:25');
INSERT INTO `sys_job_log` VALUES (919, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:09:30', '2026-05-08 17:09:30', '2026-05-08 17:09:30');
INSERT INTO `sys_job_log` VALUES (920, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:09:35', '2026-05-08 17:09:35', '2026-05-08 17:09:35');
INSERT INTO `sys_job_log` VALUES (921, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:09:40', '2026-05-08 17:09:40', '2026-05-08 17:09:40');
INSERT INTO `sys_job_log` VALUES (922, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:09:45', '2026-05-08 17:09:45', '2026-05-08 17:09:45');
INSERT INTO `sys_job_log` VALUES (923, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:09:50', '2026-05-08 17:09:50', '2026-05-08 17:09:50');
INSERT INTO `sys_job_log` VALUES (924, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:09:55', '2026-05-08 17:09:55', '2026-05-08 17:09:55');
INSERT INTO `sys_job_log` VALUES (925, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:10:00', '2026-05-08 17:10:00', '2026-05-08 17:10:00');
INSERT INTO `sys_job_log` VALUES (926, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:10:05', '2026-05-08 17:10:05', '2026-05-08 17:10:05');
INSERT INTO `sys_job_log` VALUES (927, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:10:10', '2026-05-08 17:10:10', '2026-05-08 17:10:10');
INSERT INTO `sys_job_log` VALUES (928, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:10:15', '2026-05-08 17:10:15', '2026-05-08 17:10:15');
INSERT INTO `sys_job_log` VALUES (929, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:10:20', '2026-05-08 17:10:20', '2026-05-08 17:10:20');
INSERT INTO `sys_job_log` VALUES (930, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:10:25', '2026-05-08 17:10:25', '2026-05-08 17:10:25');
INSERT INTO `sys_job_log` VALUES (931, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:10:30', '2026-05-08 17:10:30', '2026-05-08 17:10:30');
INSERT INTO `sys_job_log` VALUES (932, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:10:35', '2026-05-08 17:10:35', '2026-05-08 17:10:35');
INSERT INTO `sys_job_log` VALUES (933, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:10:40', '2026-05-08 17:10:40', '2026-05-08 17:10:40');
INSERT INTO `sys_job_log` VALUES (934, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:10:45', '2026-05-08 17:10:45', '2026-05-08 17:10:45');
INSERT INTO `sys_job_log` VALUES (935, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:10:50', '2026-05-08 17:10:50', '2026-05-08 17:10:50');
INSERT INTO `sys_job_log` VALUES (936, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:10:55', '2026-05-08 17:10:55', '2026-05-08 17:10:55');
INSERT INTO `sys_job_log` VALUES (937, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:11:00', '2026-05-08 17:11:00', '2026-05-08 17:11:00');
INSERT INTO `sys_job_log` VALUES (938, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:11:05', '2026-05-08 17:11:05', '2026-05-08 17:11:05');
INSERT INTO `sys_job_log` VALUES (939, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:11:10', '2026-05-08 17:11:10', '2026-05-08 17:11:10');
INSERT INTO `sys_job_log` VALUES (940, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:11:15', '2026-05-08 17:11:15', '2026-05-08 17:11:15');
INSERT INTO `sys_job_log` VALUES (941, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:11:20', '2026-05-08 17:11:20', '2026-05-08 17:11:20');
INSERT INTO `sys_job_log` VALUES (942, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:11:25', '2026-05-08 17:11:25', '2026-05-08 17:11:25');
INSERT INTO `sys_job_log` VALUES (943, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:11:30', '2026-05-08 17:11:30', '2026-05-08 17:11:30');
INSERT INTO `sys_job_log` VALUES (944, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:11:35', '2026-05-08 17:11:35', '2026-05-08 17:11:35');
INSERT INTO `sys_job_log` VALUES (945, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:11:40', '2026-05-08 17:11:40', '2026-05-08 17:11:40');
INSERT INTO `sys_job_log` VALUES (946, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:11:45', '2026-05-08 17:11:45', '2026-05-08 17:11:45');
INSERT INTO `sys_job_log` VALUES (947, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:11:50', '2026-05-08 17:11:50', '2026-05-08 17:11:50');
INSERT INTO `sys_job_log` VALUES (948, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:11:55', '2026-05-08 17:11:55', '2026-05-08 17:11:55');
INSERT INTO `sys_job_log` VALUES (949, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:12:00', '2026-05-08 17:12:00', '2026-05-08 17:12:00');
INSERT INTO `sys_job_log` VALUES (950, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:12:05', '2026-05-08 17:12:05', '2026-05-08 17:12:05');
INSERT INTO `sys_job_log` VALUES (951, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:12:10', '2026-05-08 17:12:10', '2026-05-08 17:12:10');
INSERT INTO `sys_job_log` VALUES (952, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:12:15', '2026-05-08 17:12:15', '2026-05-08 17:12:15');
INSERT INTO `sys_job_log` VALUES (953, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:12:20', '2026-05-08 17:12:20', '2026-05-08 17:12:20');
INSERT INTO `sys_job_log` VALUES (954, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:12:25', '2026-05-08 17:12:25', '2026-05-08 17:12:25');
INSERT INTO `sys_job_log` VALUES (955, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:12:30', '2026-05-08 17:12:30', '2026-05-08 17:12:30');
INSERT INTO `sys_job_log` VALUES (956, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:12:35', '2026-05-08 17:12:35', '2026-05-08 17:12:35');
INSERT INTO `sys_job_log` VALUES (957, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:12:40', '2026-05-08 17:12:40', '2026-05-08 17:12:40');
INSERT INTO `sys_job_log` VALUES (958, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:12:45', '2026-05-08 17:12:45', '2026-05-08 17:12:45');
INSERT INTO `sys_job_log` VALUES (959, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:12:50', '2026-05-08 17:12:50', '2026-05-08 17:12:50');
INSERT INTO `sys_job_log` VALUES (960, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:12:55', '2026-05-08 17:12:55', '2026-05-08 17:12:55');
INSERT INTO `sys_job_log` VALUES (961, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:13:00', '2026-05-08 17:13:00', '2026-05-08 17:13:00');
INSERT INTO `sys_job_log` VALUES (962, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:13:05', '2026-05-08 17:13:05', '2026-05-08 17:13:05');
INSERT INTO `sys_job_log` VALUES (963, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:13:10', '2026-05-08 17:13:10', '2026-05-08 17:13:10');
INSERT INTO `sys_job_log` VALUES (964, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:13:15', '2026-05-08 17:13:15', '2026-05-08 17:13:15');
INSERT INTO `sys_job_log` VALUES (965, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:13:20', '2026-05-08 17:13:20', '2026-05-08 17:13:20');
INSERT INTO `sys_job_log` VALUES (966, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:13:25', '2026-05-08 17:13:25', '2026-05-08 17:13:25');
INSERT INTO `sys_job_log` VALUES (967, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:13:30', '2026-05-08 17:13:30', '2026-05-08 17:13:30');
INSERT INTO `sys_job_log` VALUES (968, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:13:35', '2026-05-08 17:13:35', '2026-05-08 17:13:35');
INSERT INTO `sys_job_log` VALUES (969, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:13:40', '2026-05-08 17:13:40', '2026-05-08 17:13:40');
INSERT INTO `sys_job_log` VALUES (970, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:13:45', '2026-05-08 17:13:45', '2026-05-08 17:13:45');
INSERT INTO `sys_job_log` VALUES (971, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:13:50', '2026-05-08 17:13:50', '2026-05-08 17:13:50');
INSERT INTO `sys_job_log` VALUES (972, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:13:55', '2026-05-08 17:13:55', '2026-05-08 17:13:55');
INSERT INTO `sys_job_log` VALUES (973, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:14:00', '2026-05-08 17:14:00', '2026-05-08 17:14:00');
INSERT INTO `sys_job_log` VALUES (974, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:14:05', '2026-05-08 17:14:05', '2026-05-08 17:14:05');
INSERT INTO `sys_job_log` VALUES (975, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:14:10', '2026-05-08 17:14:10', '2026-05-08 17:14:10');
INSERT INTO `sys_job_log` VALUES (976, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:14:15', '2026-05-08 17:14:15', '2026-05-08 17:14:15');
INSERT INTO `sys_job_log` VALUES (977, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:14:20', '2026-05-08 17:14:20', '2026-05-08 17:14:20');
INSERT INTO `sys_job_log` VALUES (978, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:14:25', '2026-05-08 17:14:25', '2026-05-08 17:14:25');
INSERT INTO `sys_job_log` VALUES (979, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:14:30', '2026-05-08 17:14:30', '2026-05-08 17:14:30');
INSERT INTO `sys_job_log` VALUES (980, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:14:35', '2026-05-08 17:14:35', '2026-05-08 17:14:35');
INSERT INTO `sys_job_log` VALUES (981, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:14:40', '2026-05-08 17:14:40', '2026-05-08 17:14:40');
INSERT INTO `sys_job_log` VALUES (982, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:14:45', '2026-05-08 17:14:45', '2026-05-08 17:14:45');
INSERT INTO `sys_job_log` VALUES (983, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:14:50', '2026-05-08 17:14:50', '2026-05-08 17:14:50');
INSERT INTO `sys_job_log` VALUES (984, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:14:55', '2026-05-08 17:14:55', '2026-05-08 17:14:55');
INSERT INTO `sys_job_log` VALUES (985, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:15:00', '2026-05-08 17:15:00', '2026-05-08 17:15:00');
INSERT INTO `sys_job_log` VALUES (986, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:15:05', '2026-05-08 17:15:05', '2026-05-08 17:15:05');
INSERT INTO `sys_job_log` VALUES (987, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:15:10', '2026-05-08 17:15:10', '2026-05-08 17:15:10');
INSERT INTO `sys_job_log` VALUES (988, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:15:15', '2026-05-08 17:15:15', '2026-05-08 17:15:15');
INSERT INTO `sys_job_log` VALUES (989, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:15:20', '2026-05-08 17:15:20', '2026-05-08 17:15:20');
INSERT INTO `sys_job_log` VALUES (990, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:15:25', '2026-05-08 17:15:25', '2026-05-08 17:15:25');
INSERT INTO `sys_job_log` VALUES (991, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:15:30', '2026-05-08 17:15:30', '2026-05-08 17:15:30');
INSERT INTO `sys_job_log` VALUES (992, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:15:35', '2026-05-08 17:15:35', '2026-05-08 17:15:35');
INSERT INTO `sys_job_log` VALUES (993, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:15:40', '2026-05-08 17:15:40', '2026-05-08 17:15:40');
INSERT INTO `sys_job_log` VALUES (994, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:15:45', '2026-05-08 17:15:45', '2026-05-08 17:15:45');
INSERT INTO `sys_job_log` VALUES (995, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:15:50', '2026-05-08 17:15:50', '2026-05-08 17:15:50');
INSERT INTO `sys_job_log` VALUES (996, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:15:55', '2026-05-08 17:15:55', '2026-05-08 17:15:55');
INSERT INTO `sys_job_log` VALUES (997, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:16:00', '2026-05-08 17:16:00', '2026-05-08 17:16:00');
INSERT INTO `sys_job_log` VALUES (998, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:16:05', '2026-05-08 17:16:05', '2026-05-08 17:16:05');
INSERT INTO `sys_job_log` VALUES (999, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:16:10', '2026-05-08 17:16:10', '2026-05-08 17:16:10');
INSERT INTO `sys_job_log` VALUES (1000, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:16:15', '2026-05-08 17:16:15', '2026-05-08 17:16:15');
INSERT INTO `sys_job_log` VALUES (1001, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:16:20', '2026-05-08 17:16:20', '2026-05-08 17:16:20');
INSERT INTO `sys_job_log` VALUES (1002, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:16:25', '2026-05-08 17:16:25', '2026-05-08 17:16:25');
INSERT INTO `sys_job_log` VALUES (1003, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:16:30', '2026-05-08 17:16:30', '2026-05-08 17:16:30');
INSERT INTO `sys_job_log` VALUES (1004, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:16:35', '2026-05-08 17:16:35', '2026-05-08 17:16:35');
INSERT INTO `sys_job_log` VALUES (1005, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-08 17:16:40', '2026-05-08 17:16:40', '2026-05-08 17:16:40');
INSERT INTO `sys_job_log` VALUES (1006, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:16:45', '2026-05-08 17:16:45', '2026-05-08 17:16:45');
INSERT INTO `sys_job_log` VALUES (1007, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:16:50', '2026-05-08 17:16:50', '2026-05-08 17:16:50');
INSERT INTO `sys_job_log` VALUES (1008, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:16:55', '2026-05-08 17:16:55', '2026-05-08 17:16:55');
INSERT INTO `sys_job_log` VALUES (1009, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:17:00', '2026-05-08 17:17:00', '2026-05-08 17:17:00');
INSERT INTO `sys_job_log` VALUES (1010, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:17:05', '2026-05-08 17:17:05', '2026-05-08 17:17:05');
INSERT INTO `sys_job_log` VALUES (1011, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:17:10', '2026-05-08 17:17:10', '2026-05-08 17:17:10');
INSERT INTO `sys_job_log` VALUES (1012, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:17:15', '2026-05-08 17:17:15', '2026-05-08 17:17:15');
INSERT INTO `sys_job_log` VALUES (1013, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:17:20', '2026-05-08 17:17:20', '2026-05-08 17:17:20');
INSERT INTO `sys_job_log` VALUES (1014, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:17:25', '2026-05-08 17:17:25', '2026-05-08 17:17:25');
INSERT INTO `sys_job_log` VALUES (1015, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:17:30', '2026-05-08 17:17:30', '2026-05-08 17:17:30');
INSERT INTO `sys_job_log` VALUES (1016, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:17:35', '2026-05-08 17:17:35', '2026-05-08 17:17:35');
INSERT INTO `sys_job_log` VALUES (1017, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:17:40', '2026-05-08 17:17:40', '2026-05-08 17:17:40');
INSERT INTO `sys_job_log` VALUES (1018, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:17:45', '2026-05-08 17:17:45', '2026-05-08 17:17:45');
INSERT INTO `sys_job_log` VALUES (1019, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:17:50', '2026-05-08 17:17:50', '2026-05-08 17:17:50');
INSERT INTO `sys_job_log` VALUES (1020, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:17:55', '2026-05-08 17:17:55', '2026-05-08 17:17:55');
INSERT INTO `sys_job_log` VALUES (1021, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:18:00', '2026-05-08 17:18:00', '2026-05-08 17:18:00');
INSERT INTO `sys_job_log` VALUES (1022, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:18:05', '2026-05-08 17:18:05', '2026-05-08 17:18:05');
INSERT INTO `sys_job_log` VALUES (1023, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:18:10', '2026-05-08 17:18:10', '2026-05-08 17:18:10');
INSERT INTO `sys_job_log` VALUES (1024, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:18:15', '2026-05-08 17:18:15', '2026-05-08 17:18:15');
INSERT INTO `sys_job_log` VALUES (1025, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:18:20', '2026-05-08 17:18:20', '2026-05-08 17:18:20');
INSERT INTO `sys_job_log` VALUES (1026, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:18:25', '2026-05-08 17:18:25', '2026-05-08 17:18:25');
INSERT INTO `sys_job_log` VALUES (1027, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:18:30', '2026-05-08 17:18:30', '2026-05-08 17:18:30');
INSERT INTO `sys_job_log` VALUES (1028, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:18:35', '2026-05-08 17:18:35', '2026-05-08 17:18:35');
INSERT INTO `sys_job_log` VALUES (1029, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:18:40', '2026-05-08 17:18:40', '2026-05-08 17:18:40');
INSERT INTO `sys_job_log` VALUES (1030, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:18:45', '2026-05-08 17:18:45', '2026-05-08 17:18:45');
INSERT INTO `sys_job_log` VALUES (1031, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:18:50', '2026-05-08 17:18:50', '2026-05-08 17:18:50');
INSERT INTO `sys_job_log` VALUES (1032, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:18:55', '2026-05-08 17:18:55', '2026-05-08 17:18:55');
INSERT INTO `sys_job_log` VALUES (1033, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:19:00', '2026-05-08 17:19:00', '2026-05-08 17:19:00');
INSERT INTO `sys_job_log` VALUES (1034, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:19:05', '2026-05-08 17:19:05', '2026-05-08 17:19:05');
INSERT INTO `sys_job_log` VALUES (1035, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:19:10', '2026-05-08 17:19:10', '2026-05-08 17:19:10');
INSERT INTO `sys_job_log` VALUES (1036, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:19:15', '2026-05-08 17:19:15', '2026-05-08 17:19:15');
INSERT INTO `sys_job_log` VALUES (1037, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:19:20', '2026-05-08 17:19:20', '2026-05-08 17:19:20');
INSERT INTO `sys_job_log` VALUES (1038, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:19:25', '2026-05-08 17:19:25', '2026-05-08 17:19:25');
INSERT INTO `sys_job_log` VALUES (1039, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:19:30', '2026-05-08 17:19:30', '2026-05-08 17:19:30');
INSERT INTO `sys_job_log` VALUES (1040, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:19:35', '2026-05-08 17:19:35', '2026-05-08 17:19:35');
INSERT INTO `sys_job_log` VALUES (1041, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:19:40', '2026-05-08 17:19:40', '2026-05-08 17:19:40');
INSERT INTO `sys_job_log` VALUES (1042, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:19:45', '2026-05-08 17:19:45', '2026-05-08 17:19:45');
INSERT INTO `sys_job_log` VALUES (1043, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:19:50', '2026-05-08 17:19:50', '2026-05-08 17:19:50');
INSERT INTO `sys_job_log` VALUES (1044, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:19:55', '2026-05-08 17:19:55', '2026-05-08 17:19:55');
INSERT INTO `sys_job_log` VALUES (1045, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:20:00', '2026-05-08 17:20:00', '2026-05-08 17:20:00');
INSERT INTO `sys_job_log` VALUES (1046, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:20:05', '2026-05-08 17:20:05', '2026-05-08 17:20:05');
INSERT INTO `sys_job_log` VALUES (1047, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:20:10', '2026-05-08 17:20:10', '2026-05-08 17:20:10');
INSERT INTO `sys_job_log` VALUES (1048, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:20:15', '2026-05-08 17:20:15', '2026-05-08 17:20:15');
INSERT INTO `sys_job_log` VALUES (1049, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:20:20', '2026-05-08 17:20:20', '2026-05-08 17:20:20');
INSERT INTO `sys_job_log` VALUES (1050, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:20:25', '2026-05-08 17:20:25', '2026-05-08 17:20:25');
INSERT INTO `sys_job_log` VALUES (1051, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:20:30', '2026-05-08 17:20:30', '2026-05-08 17:20:30');
INSERT INTO `sys_job_log` VALUES (1052, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:20:35', '2026-05-08 17:20:35', '2026-05-08 17:20:35');
INSERT INTO `sys_job_log` VALUES (1053, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:20:40', '2026-05-08 17:20:40', '2026-05-08 17:20:40');
INSERT INTO `sys_job_log` VALUES (1054, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:20:45', '2026-05-08 17:20:45', '2026-05-08 17:20:45');
INSERT INTO `sys_job_log` VALUES (1055, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:20:50', '2026-05-08 17:20:50', '2026-05-08 17:20:50');
INSERT INTO `sys_job_log` VALUES (1056, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:20:55', '2026-05-08 17:20:55', '2026-05-08 17:20:55');
INSERT INTO `sys_job_log` VALUES (1057, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:21:00', '2026-05-08 17:21:00', '2026-05-08 17:21:00');
INSERT INTO `sys_job_log` VALUES (1058, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:21:05', '2026-05-08 17:21:05', '2026-05-08 17:21:05');
INSERT INTO `sys_job_log` VALUES (1059, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:21:10', '2026-05-08 17:21:10', '2026-05-08 17:21:10');
INSERT INTO `sys_job_log` VALUES (1060, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:21:15', '2026-05-08 17:21:15', '2026-05-08 17:21:15');
INSERT INTO `sys_job_log` VALUES (1061, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:21:20', '2026-05-08 17:21:20', '2026-05-08 17:21:20');
INSERT INTO `sys_job_log` VALUES (1062, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:21:25', '2026-05-08 17:21:25', '2026-05-08 17:21:25');
INSERT INTO `sys_job_log` VALUES (1063, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:21:30', '2026-05-08 17:21:30', '2026-05-08 17:21:30');
INSERT INTO `sys_job_log` VALUES (1064, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:21:35', '2026-05-08 17:21:35', '2026-05-08 17:21:35');
INSERT INTO `sys_job_log` VALUES (1065, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:21:40', '2026-05-08 17:21:40', '2026-05-08 17:21:40');
INSERT INTO `sys_job_log` VALUES (1066, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:21:45', '2026-05-08 17:21:45', '2026-05-08 17:21:45');
INSERT INTO `sys_job_log` VALUES (1067, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:21:50', '2026-05-08 17:21:50', '2026-05-08 17:21:50');
INSERT INTO `sys_job_log` VALUES (1068, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:21:55', '2026-05-08 17:21:55', '2026-05-08 17:21:55');
INSERT INTO `sys_job_log` VALUES (1069, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:22:00', '2026-05-08 17:22:00', '2026-05-08 17:22:00');
INSERT INTO `sys_job_log` VALUES (1070, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:22:05', '2026-05-08 17:22:05', '2026-05-08 17:22:05');
INSERT INTO `sys_job_log` VALUES (1071, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:22:10', '2026-05-08 17:22:10', '2026-05-08 17:22:10');
INSERT INTO `sys_job_log` VALUES (1072, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:22:15', '2026-05-08 17:22:15', '2026-05-08 17:22:15');
INSERT INTO `sys_job_log` VALUES (1073, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:22:20', '2026-05-08 17:22:20', '2026-05-08 17:22:20');
INSERT INTO `sys_job_log` VALUES (1074, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:22:25', '2026-05-08 17:22:25', '2026-05-08 17:22:25');
INSERT INTO `sys_job_log` VALUES (1075, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:22:30', '2026-05-08 17:22:30', '2026-05-08 17:22:30');
INSERT INTO `sys_job_log` VALUES (1076, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:22:35', '2026-05-08 17:22:35', '2026-05-08 17:22:35');
INSERT INTO `sys_job_log` VALUES (1077, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:22:40', '2026-05-08 17:22:40', '2026-05-08 17:22:40');
INSERT INTO `sys_job_log` VALUES (1078, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:22:45', '2026-05-08 17:22:45', '2026-05-08 17:22:45');
INSERT INTO `sys_job_log` VALUES (1079, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:22:50', '2026-05-08 17:22:50', '2026-05-08 17:22:50');
INSERT INTO `sys_job_log` VALUES (1080, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:22:55', '2026-05-08 17:22:55', '2026-05-08 17:22:55');
INSERT INTO `sys_job_log` VALUES (1081, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:23:00', '2026-05-08 17:23:00', '2026-05-08 17:23:00');
INSERT INTO `sys_job_log` VALUES (1082, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:23:05', '2026-05-08 17:23:05', '2026-05-08 17:23:05');
INSERT INTO `sys_job_log` VALUES (1083, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:23:10', '2026-05-08 17:23:10', '2026-05-08 17:23:10');
INSERT INTO `sys_job_log` VALUES (1084, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:23:15', '2026-05-08 17:23:15', '2026-05-08 17:23:15');
INSERT INTO `sys_job_log` VALUES (1085, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:23:20', '2026-05-08 17:23:20', '2026-05-08 17:23:20');
INSERT INTO `sys_job_log` VALUES (1086, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:23:25', '2026-05-08 17:23:25', '2026-05-08 17:23:25');
INSERT INTO `sys_job_log` VALUES (1087, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:23:30', '2026-05-08 17:23:30', '2026-05-08 17:23:30');
INSERT INTO `sys_job_log` VALUES (1088, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:23:35', '2026-05-08 17:23:35', '2026-05-08 17:23:35');
INSERT INTO `sys_job_log` VALUES (1089, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:23:40', '2026-05-08 17:23:40', '2026-05-08 17:23:40');
INSERT INTO `sys_job_log` VALUES (1090, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:23:45', '2026-05-08 17:23:45', '2026-05-08 17:23:45');
INSERT INTO `sys_job_log` VALUES (1091, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:23:50', '2026-05-08 17:23:50', '2026-05-08 17:23:50');
INSERT INTO `sys_job_log` VALUES (1092, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:23:55', '2026-05-08 17:23:55', '2026-05-08 17:23:55');
INSERT INTO `sys_job_log` VALUES (1093, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:24:00', '2026-05-08 17:24:00', '2026-05-08 17:24:00');
INSERT INTO `sys_job_log` VALUES (1094, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:24:05', '2026-05-08 17:24:05', '2026-05-08 17:24:05');
INSERT INTO `sys_job_log` VALUES (1095, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:24:10', '2026-05-08 17:24:10', '2026-05-08 17:24:10');
INSERT INTO `sys_job_log` VALUES (1096, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:24:15', '2026-05-08 17:24:15', '2026-05-08 17:24:15');
INSERT INTO `sys_job_log` VALUES (1097, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:24:20', '2026-05-08 17:24:20', '2026-05-08 17:24:20');
INSERT INTO `sys_job_log` VALUES (1098, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:24:25', '2026-05-08 17:24:25', '2026-05-08 17:24:25');
INSERT INTO `sys_job_log` VALUES (1099, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:24:30', '2026-05-08 17:24:30', '2026-05-08 17:24:30');
INSERT INTO `sys_job_log` VALUES (1100, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:24:35', '2026-05-08 17:24:35', '2026-05-08 17:24:35');
INSERT INTO `sys_job_log` VALUES (1101, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:24:40', '2026-05-08 17:24:40', '2026-05-08 17:24:40');
INSERT INTO `sys_job_log` VALUES (1102, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:24:45', '2026-05-08 17:24:45', '2026-05-08 17:24:45');
INSERT INTO `sys_job_log` VALUES (1103, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:24:50', '2026-05-08 17:24:50', '2026-05-08 17:24:50');
INSERT INTO `sys_job_log` VALUES (1104, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:24:55', '2026-05-08 17:24:55', '2026-05-08 17:24:55');
INSERT INTO `sys_job_log` VALUES (1105, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:25:00', '2026-05-08 17:25:00', '2026-05-08 17:25:00');
INSERT INTO `sys_job_log` VALUES (1106, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:25:05', '2026-05-08 17:25:05', '2026-05-08 17:25:05');
INSERT INTO `sys_job_log` VALUES (1107, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:25:10', '2026-05-08 17:25:10', '2026-05-08 17:25:10');
INSERT INTO `sys_job_log` VALUES (1108, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:25:15', '2026-05-08 17:25:15', '2026-05-08 17:25:15');
INSERT INTO `sys_job_log` VALUES (1109, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:25:20', '2026-05-08 17:25:20', '2026-05-08 17:25:20');
INSERT INTO `sys_job_log` VALUES (1110, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:25:25', '2026-05-08 17:25:25', '2026-05-08 17:25:25');
INSERT INTO `sys_job_log` VALUES (1111, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:25:30', '2026-05-08 17:25:30', '2026-05-08 17:25:30');
INSERT INTO `sys_job_log` VALUES (1112, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:25:35', '2026-05-08 17:25:35', '2026-05-08 17:25:35');
INSERT INTO `sys_job_log` VALUES (1113, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:25:40', '2026-05-08 17:25:40', '2026-05-08 17:25:40');
INSERT INTO `sys_job_log` VALUES (1114, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:25:45', '2026-05-08 17:25:45', '2026-05-08 17:25:45');
INSERT INTO `sys_job_log` VALUES (1115, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:25:50', '2026-05-08 17:25:50', '2026-05-08 17:25:50');
INSERT INTO `sys_job_log` VALUES (1116, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:25:55', '2026-05-08 17:25:55', '2026-05-08 17:25:55');
INSERT INTO `sys_job_log` VALUES (1117, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:26:00', '2026-05-08 17:26:00', '2026-05-08 17:26:00');
INSERT INTO `sys_job_log` VALUES (1118, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:26:05', '2026-05-08 17:26:05', '2026-05-08 17:26:05');
INSERT INTO `sys_job_log` VALUES (1119, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:26:10', '2026-05-08 17:26:10', '2026-05-08 17:26:10');
INSERT INTO `sys_job_log` VALUES (1120, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:26:15', '2026-05-08 17:26:15', '2026-05-08 17:26:15');
INSERT INTO `sys_job_log` VALUES (1121, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:26:20', '2026-05-08 17:26:20', '2026-05-08 17:26:20');
INSERT INTO `sys_job_log` VALUES (1122, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:26:25', '2026-05-08 17:26:25', '2026-05-08 17:26:25');
INSERT INTO `sys_job_log` VALUES (1123, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:26:30', '2026-05-08 17:26:30', '2026-05-08 17:26:30');
INSERT INTO `sys_job_log` VALUES (1124, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:26:35', '2026-05-08 17:26:35', '2026-05-08 17:26:35');
INSERT INTO `sys_job_log` VALUES (1125, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:26:40', '2026-05-08 17:26:40', '2026-05-08 17:26:40');
INSERT INTO `sys_job_log` VALUES (1126, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:26:45', '2026-05-08 17:26:45', '2026-05-08 17:26:45');
INSERT INTO `sys_job_log` VALUES (1127, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:26:50', '2026-05-08 17:26:50', '2026-05-08 17:26:50');
INSERT INTO `sys_job_log` VALUES (1128, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:26:55', '2026-05-08 17:26:55', '2026-05-08 17:26:55');
INSERT INTO `sys_job_log` VALUES (1129, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:27:00', '2026-05-08 17:27:00', '2026-05-08 17:27:00');
INSERT INTO `sys_job_log` VALUES (1130, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:27:05', '2026-05-08 17:27:05', '2026-05-08 17:27:05');
INSERT INTO `sys_job_log` VALUES (1131, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:27:10', '2026-05-08 17:27:10', '2026-05-08 17:27:10');
INSERT INTO `sys_job_log` VALUES (1132, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:27:15', '2026-05-08 17:27:15', '2026-05-08 17:27:15');
INSERT INTO `sys_job_log` VALUES (1133, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:27:20', '2026-05-08 17:27:20', '2026-05-08 17:27:20');
INSERT INTO `sys_job_log` VALUES (1134, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:27:25', '2026-05-08 17:27:25', '2026-05-08 17:27:25');
INSERT INTO `sys_job_log` VALUES (1135, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:27:30', '2026-05-08 17:27:30', '2026-05-08 17:27:30');
INSERT INTO `sys_job_log` VALUES (1136, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:27:35', '2026-05-08 17:27:35', '2026-05-08 17:27:35');
INSERT INTO `sys_job_log` VALUES (1137, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:27:40', '2026-05-08 17:27:40', '2026-05-08 17:27:40');
INSERT INTO `sys_job_log` VALUES (1138, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:27:45', '2026-05-08 17:27:45', '2026-05-08 17:27:45');
INSERT INTO `sys_job_log` VALUES (1139, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:27:50', '2026-05-08 17:27:50', '2026-05-08 17:27:50');
INSERT INTO `sys_job_log` VALUES (1140, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:27:55', '2026-05-08 17:27:55', '2026-05-08 17:27:55');
INSERT INTO `sys_job_log` VALUES (1141, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:28:00', '2026-05-08 17:28:00', '2026-05-08 17:28:00');
INSERT INTO `sys_job_log` VALUES (1142, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:28:05', '2026-05-08 17:28:05', '2026-05-08 17:28:05');
INSERT INTO `sys_job_log` VALUES (1143, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:28:10', '2026-05-08 17:28:10', '2026-05-08 17:28:10');
INSERT INTO `sys_job_log` VALUES (1144, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:28:15', '2026-05-08 17:28:15', '2026-05-08 17:28:15');
INSERT INTO `sys_job_log` VALUES (1145, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:28:20', '2026-05-08 17:28:20', '2026-05-08 17:28:20');
INSERT INTO `sys_job_log` VALUES (1146, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:28:25', '2026-05-08 17:28:25', '2026-05-08 17:28:25');
INSERT INTO `sys_job_log` VALUES (1147, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:28:30', '2026-05-08 17:28:30', '2026-05-08 17:28:30');
INSERT INTO `sys_job_log` VALUES (1148, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:28:35', '2026-05-08 17:28:35', '2026-05-08 17:28:35');
INSERT INTO `sys_job_log` VALUES (1149, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:28:40', '2026-05-08 17:28:40', '2026-05-08 17:28:40');
INSERT INTO `sys_job_log` VALUES (1150, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:28:45', '2026-05-08 17:28:45', '2026-05-08 17:28:45');
INSERT INTO `sys_job_log` VALUES (1151, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:28:50', '2026-05-08 17:28:50', '2026-05-08 17:28:50');
INSERT INTO `sys_job_log` VALUES (1152, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:28:55', '2026-05-08 17:28:55', '2026-05-08 17:28:55');
INSERT INTO `sys_job_log` VALUES (1153, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:29:00', '2026-05-08 17:29:00', '2026-05-08 17:29:00');
INSERT INTO `sys_job_log` VALUES (1154, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:29:05', '2026-05-08 17:29:05', '2026-05-08 17:29:05');
INSERT INTO `sys_job_log` VALUES (1155, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:29:10', '2026-05-08 17:29:10', '2026-05-08 17:29:10');
INSERT INTO `sys_job_log` VALUES (1156, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:29:15', '2026-05-08 17:29:15', '2026-05-08 17:29:15');
INSERT INTO `sys_job_log` VALUES (1157, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:29:20', '2026-05-08 17:29:20', '2026-05-08 17:29:20');
INSERT INTO `sys_job_log` VALUES (1158, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:29:25', '2026-05-08 17:29:25', '2026-05-08 17:29:25');
INSERT INTO `sys_job_log` VALUES (1159, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:29:30', '2026-05-08 17:29:30', '2026-05-08 17:29:30');
INSERT INTO `sys_job_log` VALUES (1160, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:29:35', '2026-05-08 17:29:35', '2026-05-08 17:29:35');
INSERT INTO `sys_job_log` VALUES (1161, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:29:40', '2026-05-08 17:29:40', '2026-05-08 17:29:40');
INSERT INTO `sys_job_log` VALUES (1162, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:29:45', '2026-05-08 17:29:45', '2026-05-08 17:29:45');
INSERT INTO `sys_job_log` VALUES (1163, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:29:50', '2026-05-08 17:29:50', '2026-05-08 17:29:50');
INSERT INTO `sys_job_log` VALUES (1164, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:29:55', '2026-05-08 17:29:55', '2026-05-08 17:29:55');
INSERT INTO `sys_job_log` VALUES (1165, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:30:00', '2026-05-08 17:30:00', '2026-05-08 17:30:00');
INSERT INTO `sys_job_log` VALUES (1166, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:30:05', '2026-05-08 17:30:05', '2026-05-08 17:30:05');
INSERT INTO `sys_job_log` VALUES (1167, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:30:10', '2026-05-08 17:30:10', '2026-05-08 17:30:10');
INSERT INTO `sys_job_log` VALUES (1168, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:30:15', '2026-05-08 17:30:15', '2026-05-08 17:30:15');
INSERT INTO `sys_job_log` VALUES (1169, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:30:20', '2026-05-08 17:30:20', '2026-05-08 17:30:20');
INSERT INTO `sys_job_log` VALUES (1170, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:30:25', '2026-05-08 17:30:25', '2026-05-08 17:30:25');
INSERT INTO `sys_job_log` VALUES (1171, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:30:30', '2026-05-08 17:30:30', '2026-05-08 17:30:30');
INSERT INTO `sys_job_log` VALUES (1172, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:30:35', '2026-05-08 17:30:35', '2026-05-08 17:30:35');
INSERT INTO `sys_job_log` VALUES (1173, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:30:40', '2026-05-08 17:30:40', '2026-05-08 17:30:40');
INSERT INTO `sys_job_log` VALUES (1174, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:30:45', '2026-05-08 17:30:45', '2026-05-08 17:30:45');
INSERT INTO `sys_job_log` VALUES (1175, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:30:50', '2026-05-08 17:30:50', '2026-05-08 17:30:50');
INSERT INTO `sys_job_log` VALUES (1176, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:30:55', '2026-05-08 17:30:55', '2026-05-08 17:30:55');
INSERT INTO `sys_job_log` VALUES (1177, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:31:00', '2026-05-08 17:31:00', '2026-05-08 17:31:00');
INSERT INTO `sys_job_log` VALUES (1178, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:31:05', '2026-05-08 17:31:05', '2026-05-08 17:31:05');
INSERT INTO `sys_job_log` VALUES (1179, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:31:10', '2026-05-08 17:31:10', '2026-05-08 17:31:10');
INSERT INTO `sys_job_log` VALUES (1180, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:31:15', '2026-05-08 17:31:15', '2026-05-08 17:31:15');
INSERT INTO `sys_job_log` VALUES (1181, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:31:20', '2026-05-08 17:31:20', '2026-05-08 17:31:20');
INSERT INTO `sys_job_log` VALUES (1182, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:31:25', '2026-05-08 17:31:25', '2026-05-08 17:31:25');
INSERT INTO `sys_job_log` VALUES (1183, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:31:30', '2026-05-08 17:31:30', '2026-05-08 17:31:30');
INSERT INTO `sys_job_log` VALUES (1184, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:31:35', '2026-05-08 17:31:35', '2026-05-08 17:31:35');
INSERT INTO `sys_job_log` VALUES (1185, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:31:40', '2026-05-08 17:31:40', '2026-05-08 17:31:40');
INSERT INTO `sys_job_log` VALUES (1186, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:31:45', '2026-05-08 17:31:45', '2026-05-08 17:31:45');
INSERT INTO `sys_job_log` VALUES (1187, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:31:50', '2026-05-08 17:31:50', '2026-05-08 17:31:50');
INSERT INTO `sys_job_log` VALUES (1188, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:31:55', '2026-05-08 17:31:55', '2026-05-08 17:31:55');
INSERT INTO `sys_job_log` VALUES (1189, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:32:00', '2026-05-08 17:32:00', '2026-05-08 17:32:00');
INSERT INTO `sys_job_log` VALUES (1190, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:32:05', '2026-05-08 17:32:05', '2026-05-08 17:32:05');
INSERT INTO `sys_job_log` VALUES (1191, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:32:10', '2026-05-08 17:32:10', '2026-05-08 17:32:10');
INSERT INTO `sys_job_log` VALUES (1192, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:32:15', '2026-05-08 17:32:15', '2026-05-08 17:32:15');
INSERT INTO `sys_job_log` VALUES (1193, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:32:20', '2026-05-08 17:32:20', '2026-05-08 17:32:20');
INSERT INTO `sys_job_log` VALUES (1194, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:32:25', '2026-05-08 17:32:25', '2026-05-08 17:32:25');
INSERT INTO `sys_job_log` VALUES (1195, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:32:30', '2026-05-08 17:32:30', '2026-05-08 17:32:30');
INSERT INTO `sys_job_log` VALUES (1196, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:32:35', '2026-05-08 17:32:35', '2026-05-08 17:32:35');
INSERT INTO `sys_job_log` VALUES (1197, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:32:40', '2026-05-08 17:32:40', '2026-05-08 17:32:40');
INSERT INTO `sys_job_log` VALUES (1198, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:32:45', '2026-05-08 17:32:45', '2026-05-08 17:32:45');
INSERT INTO `sys_job_log` VALUES (1199, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:32:50', '2026-05-08 17:32:50', '2026-05-08 17:32:50');
INSERT INTO `sys_job_log` VALUES (1200, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:32:55', '2026-05-08 17:32:55', '2026-05-08 17:32:55');
INSERT INTO `sys_job_log` VALUES (1201, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:33:00', '2026-05-08 17:33:00', '2026-05-08 17:33:00');
INSERT INTO `sys_job_log` VALUES (1202, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:33:05', '2026-05-08 17:33:05', '2026-05-08 17:33:05');
INSERT INTO `sys_job_log` VALUES (1203, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:33:10', '2026-05-08 17:33:10', '2026-05-08 17:33:10');
INSERT INTO `sys_job_log` VALUES (1204, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:33:15', '2026-05-08 17:33:15', '2026-05-08 17:33:15');
INSERT INTO `sys_job_log` VALUES (1205, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:33:20', '2026-05-08 17:33:20', '2026-05-08 17:33:20');
INSERT INTO `sys_job_log` VALUES (1206, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:33:25', '2026-05-08 17:33:25', '2026-05-08 17:33:25');
INSERT INTO `sys_job_log` VALUES (1207, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:33:30', '2026-05-08 17:33:30', '2026-05-08 17:33:30');
INSERT INTO `sys_job_log` VALUES (1208, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:33:35', '2026-05-08 17:33:35', '2026-05-08 17:33:35');
INSERT INTO `sys_job_log` VALUES (1209, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:33:40', '2026-05-08 17:33:40', '2026-05-08 17:33:40');
INSERT INTO `sys_job_log` VALUES (1210, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:33:45', '2026-05-08 17:33:45', '2026-05-08 17:33:45');
INSERT INTO `sys_job_log` VALUES (1211, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:33:50', '2026-05-08 17:33:50', '2026-05-08 17:33:50');
INSERT INTO `sys_job_log` VALUES (1212, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:33:55', '2026-05-08 17:33:55', '2026-05-08 17:33:55');
INSERT INTO `sys_job_log` VALUES (1213, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:34:00', '2026-05-08 17:34:00', '2026-05-08 17:34:00');
INSERT INTO `sys_job_log` VALUES (1214, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:34:05', '2026-05-08 17:34:05', '2026-05-08 17:34:05');
INSERT INTO `sys_job_log` VALUES (1215, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:34:10', '2026-05-08 17:34:10', '2026-05-08 17:34:10');
INSERT INTO `sys_job_log` VALUES (1216, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:34:15', '2026-05-08 17:34:15', '2026-05-08 17:34:15');
INSERT INTO `sys_job_log` VALUES (1217, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:34:20', '2026-05-08 17:34:20', '2026-05-08 17:34:20');
INSERT INTO `sys_job_log` VALUES (1218, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:34:25', '2026-05-08 17:34:25', '2026-05-08 17:34:25');
INSERT INTO `sys_job_log` VALUES (1219, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:34:30', '2026-05-08 17:34:30', '2026-05-08 17:34:30');
INSERT INTO `sys_job_log` VALUES (1220, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:34:35', '2026-05-08 17:34:35', '2026-05-08 17:34:35');
INSERT INTO `sys_job_log` VALUES (1221, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:34:40', '2026-05-08 17:34:40', '2026-05-08 17:34:40');
INSERT INTO `sys_job_log` VALUES (1222, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:34:45', '2026-05-08 17:34:45', '2026-05-08 17:34:45');
INSERT INTO `sys_job_log` VALUES (1223, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:34:50', '2026-05-08 17:34:50', '2026-05-08 17:34:50');
INSERT INTO `sys_job_log` VALUES (1224, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:34:55', '2026-05-08 17:34:55', '2026-05-08 17:34:55');
INSERT INTO `sys_job_log` VALUES (1225, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:35:00', '2026-05-08 17:35:00', '2026-05-08 17:35:00');
INSERT INTO `sys_job_log` VALUES (1226, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:35:05', '2026-05-08 17:35:05', '2026-05-08 17:35:05');
INSERT INTO `sys_job_log` VALUES (1227, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:35:10', '2026-05-08 17:35:10', '2026-05-08 17:35:10');
INSERT INTO `sys_job_log` VALUES (1228, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:35:15', '2026-05-08 17:35:15', '2026-05-08 17:35:15');
INSERT INTO `sys_job_log` VALUES (1229, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:35:20', '2026-05-08 17:35:20', '2026-05-08 17:35:20');
INSERT INTO `sys_job_log` VALUES (1230, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:35:25', '2026-05-08 17:35:25', '2026-05-08 17:35:25');
INSERT INTO `sys_job_log` VALUES (1231, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:35:30', '2026-05-08 17:35:30', '2026-05-08 17:35:30');
INSERT INTO `sys_job_log` VALUES (1232, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:35:35', '2026-05-08 17:35:35', '2026-05-08 17:35:35');
INSERT INTO `sys_job_log` VALUES (1233, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:35:40', '2026-05-08 17:35:40', '2026-05-08 17:35:40');
INSERT INTO `sys_job_log` VALUES (1234, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:35:45', '2026-05-08 17:35:45', '2026-05-08 17:35:45');
INSERT INTO `sys_job_log` VALUES (1235, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:35:50', '2026-05-08 17:35:50', '2026-05-08 17:35:50');
INSERT INTO `sys_job_log` VALUES (1236, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:35:55', '2026-05-08 17:35:55', '2026-05-08 17:35:55');
INSERT INTO `sys_job_log` VALUES (1237, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:36:00', '2026-05-08 17:36:00', '2026-05-08 17:36:00');
INSERT INTO `sys_job_log` VALUES (1238, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:36:05', '2026-05-08 17:36:05', '2026-05-08 17:36:05');
INSERT INTO `sys_job_log` VALUES (1239, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:36:10', '2026-05-08 17:36:10', '2026-05-08 17:36:10');
INSERT INTO `sys_job_log` VALUES (1240, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:36:15', '2026-05-08 17:36:15', '2026-05-08 17:36:15');
INSERT INTO `sys_job_log` VALUES (1241, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:36:20', '2026-05-08 17:36:20', '2026-05-08 17:36:20');
INSERT INTO `sys_job_log` VALUES (1242, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:36:25', '2026-05-08 17:36:25', '2026-05-08 17:36:25');
INSERT INTO `sys_job_log` VALUES (1243, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:36:30', '2026-05-08 17:36:30', '2026-05-08 17:36:30');
INSERT INTO `sys_job_log` VALUES (1244, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:36:35', '2026-05-08 17:36:35', '2026-05-08 17:36:35');
INSERT INTO `sys_job_log` VALUES (1245, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:36:40', '2026-05-08 17:36:40', '2026-05-08 17:36:40');
INSERT INTO `sys_job_log` VALUES (1246, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:36:45', '2026-05-08 17:36:45', '2026-05-08 17:36:45');
INSERT INTO `sys_job_log` VALUES (1247, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:36:50', '2026-05-08 17:36:50', '2026-05-08 17:36:50');
INSERT INTO `sys_job_log` VALUES (1248, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:36:55', '2026-05-08 17:36:55', '2026-05-08 17:36:55');
INSERT INTO `sys_job_log` VALUES (1249, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:37:00', '2026-05-08 17:37:00', '2026-05-08 17:37:00');
INSERT INTO `sys_job_log` VALUES (1250, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:37:05', '2026-05-08 17:37:05', '2026-05-08 17:37:05');
INSERT INTO `sys_job_log` VALUES (1251, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:37:10', '2026-05-08 17:37:10', '2026-05-08 17:37:10');
INSERT INTO `sys_job_log` VALUES (1252, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:37:15', '2026-05-08 17:37:15', '2026-05-08 17:37:15');
INSERT INTO `sys_job_log` VALUES (1253, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:37:20', '2026-05-08 17:37:20', '2026-05-08 17:37:20');
INSERT INTO `sys_job_log` VALUES (1254, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:37:25', '2026-05-08 17:37:25', '2026-05-08 17:37:25');
INSERT INTO `sys_job_log` VALUES (1255, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:37:30', '2026-05-08 17:37:30', '2026-05-08 17:37:30');
INSERT INTO `sys_job_log` VALUES (1256, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:37:35', '2026-05-08 17:37:35', '2026-05-08 17:37:35');
INSERT INTO `sys_job_log` VALUES (1257, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:37:40', '2026-05-08 17:37:40', '2026-05-08 17:37:40');
INSERT INTO `sys_job_log` VALUES (1258, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:37:45', '2026-05-08 17:37:45', '2026-05-08 17:37:45');
INSERT INTO `sys_job_log` VALUES (1259, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:37:50', '2026-05-08 17:37:50', '2026-05-08 17:37:50');
INSERT INTO `sys_job_log` VALUES (1260, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:37:55', '2026-05-08 17:37:55', '2026-05-08 17:37:55');
INSERT INTO `sys_job_log` VALUES (1261, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:38:00', '2026-05-08 17:38:00', '2026-05-08 17:38:00');
INSERT INTO `sys_job_log` VALUES (1262, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:38:05', '2026-05-08 17:38:05', '2026-05-08 17:38:05');
INSERT INTO `sys_job_log` VALUES (1263, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:38:10', '2026-05-08 17:38:10', '2026-05-08 17:38:10');
INSERT INTO `sys_job_log` VALUES (1264, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:38:15', '2026-05-08 17:38:15', '2026-05-08 17:38:15');
INSERT INTO `sys_job_log` VALUES (1265, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:38:20', '2026-05-08 17:38:20', '2026-05-08 17:38:20');
INSERT INTO `sys_job_log` VALUES (1266, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:38:25', '2026-05-08 17:38:25', '2026-05-08 17:38:25');
INSERT INTO `sys_job_log` VALUES (1267, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:38:30', '2026-05-08 17:38:30', '2026-05-08 17:38:30');
INSERT INTO `sys_job_log` VALUES (1268, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:38:35', '2026-05-08 17:38:35', '2026-05-08 17:38:35');
INSERT INTO `sys_job_log` VALUES (1269, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:38:40', '2026-05-08 17:38:40', '2026-05-08 17:38:40');
INSERT INTO `sys_job_log` VALUES (1270, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:38:45', '2026-05-08 17:38:45', '2026-05-08 17:38:45');
INSERT INTO `sys_job_log` VALUES (1271, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:38:50', '2026-05-08 17:38:50', '2026-05-08 17:38:50');
INSERT INTO `sys_job_log` VALUES (1272, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:38:55', '2026-05-08 17:38:55', '2026-05-08 17:38:55');
INSERT INTO `sys_job_log` VALUES (1273, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:39:00', '2026-05-08 17:39:00', '2026-05-08 17:39:00');
INSERT INTO `sys_job_log` VALUES (1274, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:39:05', '2026-05-08 17:39:05', '2026-05-08 17:39:05');
INSERT INTO `sys_job_log` VALUES (1275, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:39:10', '2026-05-08 17:39:10', '2026-05-08 17:39:10');
INSERT INTO `sys_job_log` VALUES (1276, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:39:15', '2026-05-08 17:39:15', '2026-05-08 17:39:15');
INSERT INTO `sys_job_log` VALUES (1277, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:39:20', '2026-05-08 17:39:20', '2026-05-08 17:39:20');
INSERT INTO `sys_job_log` VALUES (1278, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:39:25', '2026-05-08 17:39:25', '2026-05-08 17:39:25');
INSERT INTO `sys_job_log` VALUES (1279, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:39:30', '2026-05-08 17:39:30', '2026-05-08 17:39:30');
INSERT INTO `sys_job_log` VALUES (1280, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:39:35', '2026-05-08 17:39:35', '2026-05-08 17:39:35');
INSERT INTO `sys_job_log` VALUES (1281, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:39:40', '2026-05-08 17:39:40', '2026-05-08 17:39:40');
INSERT INTO `sys_job_log` VALUES (1282, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:39:45', '2026-05-08 17:39:45', '2026-05-08 17:39:45');
INSERT INTO `sys_job_log` VALUES (1283, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:39:50', '2026-05-08 17:39:50', '2026-05-08 17:39:50');
INSERT INTO `sys_job_log` VALUES (1284, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:39:55', '2026-05-08 17:39:55', '2026-05-08 17:39:55');
INSERT INTO `sys_job_log` VALUES (1285, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:40:00', '2026-05-08 17:40:00', '2026-05-08 17:40:00');
INSERT INTO `sys_job_log` VALUES (1286, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:40:05', '2026-05-08 17:40:05', '2026-05-08 17:40:05');
INSERT INTO `sys_job_log` VALUES (1287, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:40:10', '2026-05-08 17:40:10', '2026-05-08 17:40:10');
INSERT INTO `sys_job_log` VALUES (1288, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:40:15', '2026-05-08 17:40:15', '2026-05-08 17:40:15');
INSERT INTO `sys_job_log` VALUES (1289, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:40:20', '2026-05-08 17:40:20', '2026-05-08 17:40:20');
INSERT INTO `sys_job_log` VALUES (1290, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:40:25', '2026-05-08 17:40:25', '2026-05-08 17:40:25');
INSERT INTO `sys_job_log` VALUES (1291, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:40:30', '2026-05-08 17:40:30', '2026-05-08 17:40:30');
INSERT INTO `sys_job_log` VALUES (1292, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:40:35', '2026-05-08 17:40:35', '2026-05-08 17:40:35');
INSERT INTO `sys_job_log` VALUES (1293, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:40:40', '2026-05-08 17:40:40', '2026-05-08 17:40:40');
INSERT INTO `sys_job_log` VALUES (1294, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:40:45', '2026-05-08 17:40:45', '2026-05-08 17:40:45');
INSERT INTO `sys_job_log` VALUES (1295, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:40:50', '2026-05-08 17:40:50', '2026-05-08 17:40:50');
INSERT INTO `sys_job_log` VALUES (1296, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:40:55', '2026-05-08 17:40:55', '2026-05-08 17:40:55');
INSERT INTO `sys_job_log` VALUES (1297, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:41:00', '2026-05-08 17:41:00', '2026-05-08 17:41:00');
INSERT INTO `sys_job_log` VALUES (1298, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:41:05', '2026-05-08 17:41:05', '2026-05-08 17:41:05');
INSERT INTO `sys_job_log` VALUES (1299, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:41:10', '2026-05-08 17:41:10', '2026-05-08 17:41:10');
INSERT INTO `sys_job_log` VALUES (1300, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:41:15', '2026-05-08 17:41:15', '2026-05-08 17:41:15');
INSERT INTO `sys_job_log` VALUES (1301, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:41:20', '2026-05-08 17:41:20', '2026-05-08 17:41:20');
INSERT INTO `sys_job_log` VALUES (1302, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:41:25', '2026-05-08 17:41:25', '2026-05-08 17:41:25');
INSERT INTO `sys_job_log` VALUES (1303, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:41:30', '2026-05-08 17:41:30', '2026-05-08 17:41:30');
INSERT INTO `sys_job_log` VALUES (1304, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:41:35', '2026-05-08 17:41:35', '2026-05-08 17:41:35');
INSERT INTO `sys_job_log` VALUES (1305, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:41:40', '2026-05-08 17:41:40', '2026-05-08 17:41:40');
INSERT INTO `sys_job_log` VALUES (1306, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:41:45', '2026-05-08 17:41:45', '2026-05-08 17:41:45');
INSERT INTO `sys_job_log` VALUES (1307, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:41:50', '2026-05-08 17:41:50', '2026-05-08 17:41:50');
INSERT INTO `sys_job_log` VALUES (1308, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:41:55', '2026-05-08 17:41:55', '2026-05-08 17:41:55');
INSERT INTO `sys_job_log` VALUES (1309, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:42:00', '2026-05-08 17:42:00', '2026-05-08 17:42:00');
INSERT INTO `sys_job_log` VALUES (1310, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:42:05', '2026-05-08 17:42:05', '2026-05-08 17:42:05');
INSERT INTO `sys_job_log` VALUES (1311, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:42:10', '2026-05-08 17:42:10', '2026-05-08 17:42:10');
INSERT INTO `sys_job_log` VALUES (1312, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:42:15', '2026-05-08 17:42:15', '2026-05-08 17:42:15');
INSERT INTO `sys_job_log` VALUES (1313, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:42:20', '2026-05-08 17:42:20', '2026-05-08 17:42:20');
INSERT INTO `sys_job_log` VALUES (1314, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:42:25', '2026-05-08 17:42:25', '2026-05-08 17:42:25');
INSERT INTO `sys_job_log` VALUES (1315, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:42:30', '2026-05-08 17:42:30', '2026-05-08 17:42:30');
INSERT INTO `sys_job_log` VALUES (1316, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:42:35', '2026-05-08 17:42:35', '2026-05-08 17:42:35');
INSERT INTO `sys_job_log` VALUES (1317, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:42:40', '2026-05-08 17:42:40', '2026-05-08 17:42:40');
INSERT INTO `sys_job_log` VALUES (1318, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:42:45', '2026-05-08 17:42:45', '2026-05-08 17:42:45');
INSERT INTO `sys_job_log` VALUES (1319, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:42:50', '2026-05-08 17:42:50', '2026-05-08 17:42:50');
INSERT INTO `sys_job_log` VALUES (1320, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:42:55', '2026-05-08 17:42:55', '2026-05-08 17:42:55');
INSERT INTO `sys_job_log` VALUES (1321, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:43:00', '2026-05-08 17:43:00', '2026-05-08 17:43:00');
INSERT INTO `sys_job_log` VALUES (1322, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:43:05', '2026-05-08 17:43:05', '2026-05-08 17:43:05');
INSERT INTO `sys_job_log` VALUES (1323, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:43:10', '2026-05-08 17:43:10', '2026-05-08 17:43:10');
INSERT INTO `sys_job_log` VALUES (1324, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:43:15', '2026-05-08 17:43:15', '2026-05-08 17:43:15');
INSERT INTO `sys_job_log` VALUES (1325, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:43:20', '2026-05-08 17:43:20', '2026-05-08 17:43:20');
INSERT INTO `sys_job_log` VALUES (1326, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:43:25', '2026-05-08 17:43:25', '2026-05-08 17:43:25');
INSERT INTO `sys_job_log` VALUES (1327, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:43:30', '2026-05-08 17:43:30', '2026-05-08 17:43:30');
INSERT INTO `sys_job_log` VALUES (1328, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:43:35', '2026-05-08 17:43:35', '2026-05-08 17:43:35');
INSERT INTO `sys_job_log` VALUES (1329, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:43:40', '2026-05-08 17:43:40', '2026-05-08 17:43:40');
INSERT INTO `sys_job_log` VALUES (1330, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:43:45', '2026-05-08 17:43:45', '2026-05-08 17:43:45');
INSERT INTO `sys_job_log` VALUES (1331, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:43:50', '2026-05-08 17:43:50', '2026-05-08 17:43:50');
INSERT INTO `sys_job_log` VALUES (1332, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:43:55', '2026-05-08 17:43:55', '2026-05-08 17:43:55');
INSERT INTO `sys_job_log` VALUES (1333, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:44:00', '2026-05-08 17:44:00', '2026-05-08 17:44:00');
INSERT INTO `sys_job_log` VALUES (1334, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:44:05', '2026-05-08 17:44:05', '2026-05-08 17:44:05');
INSERT INTO `sys_job_log` VALUES (1335, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:44:10', '2026-05-08 17:44:10', '2026-05-08 17:44:10');
INSERT INTO `sys_job_log` VALUES (1336, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:44:15', '2026-05-08 17:44:15', '2026-05-08 17:44:15');
INSERT INTO `sys_job_log` VALUES (1337, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:44:20', '2026-05-08 17:44:20', '2026-05-08 17:44:20');
INSERT INTO `sys_job_log` VALUES (1338, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:44:25', '2026-05-08 17:44:25', '2026-05-08 17:44:25');
INSERT INTO `sys_job_log` VALUES (1339, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:44:30', '2026-05-08 17:44:30', '2026-05-08 17:44:30');
INSERT INTO `sys_job_log` VALUES (1340, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:44:35', '2026-05-08 17:44:35', '2026-05-08 17:44:35');
INSERT INTO `sys_job_log` VALUES (1341, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:44:40', '2026-05-08 17:44:40', '2026-05-08 17:44:40');
INSERT INTO `sys_job_log` VALUES (1342, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:44:45', '2026-05-08 17:44:45', '2026-05-08 17:44:45');
INSERT INTO `sys_job_log` VALUES (1343, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:44:50', '2026-05-08 17:44:50', '2026-05-08 17:44:50');
INSERT INTO `sys_job_log` VALUES (1344, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:44:55', '2026-05-08 17:44:55', '2026-05-08 17:44:55');
INSERT INTO `sys_job_log` VALUES (1345, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:45:00', '2026-05-08 17:45:00', '2026-05-08 17:45:00');
INSERT INTO `sys_job_log` VALUES (1346, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:45:05', '2026-05-08 17:45:05', '2026-05-08 17:45:05');
INSERT INTO `sys_job_log` VALUES (1347, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:45:10', '2026-05-08 17:45:10', '2026-05-08 17:45:10');
INSERT INTO `sys_job_log` VALUES (1348, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:45:15', '2026-05-08 17:45:15', '2026-05-08 17:45:15');
INSERT INTO `sys_job_log` VALUES (1349, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:45:20', '2026-05-08 17:45:20', '2026-05-08 17:45:20');
INSERT INTO `sys_job_log` VALUES (1350, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:45:25', '2026-05-08 17:45:25', '2026-05-08 17:45:25');
INSERT INTO `sys_job_log` VALUES (1351, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:45:30', '2026-05-08 17:45:30', '2026-05-08 17:45:30');
INSERT INTO `sys_job_log` VALUES (1352, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:45:35', '2026-05-08 17:45:35', '2026-05-08 17:45:35');
INSERT INTO `sys_job_log` VALUES (1353, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:45:40', '2026-05-08 17:45:40', '2026-05-08 17:45:40');
INSERT INTO `sys_job_log` VALUES (1354, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:45:45', '2026-05-08 17:45:45', '2026-05-08 17:45:45');
INSERT INTO `sys_job_log` VALUES (1355, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:45:50', '2026-05-08 17:45:50', '2026-05-08 17:45:50');
INSERT INTO `sys_job_log` VALUES (1356, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:45:55', '2026-05-08 17:45:55', '2026-05-08 17:45:55');
INSERT INTO `sys_job_log` VALUES (1357, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:46:00', '2026-05-08 17:46:00', '2026-05-08 17:46:00');
INSERT INTO `sys_job_log` VALUES (1358, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:46:05', '2026-05-08 17:46:05', '2026-05-08 17:46:05');
INSERT INTO `sys_job_log` VALUES (1359, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:46:10', '2026-05-08 17:46:10', '2026-05-08 17:46:10');
INSERT INTO `sys_job_log` VALUES (1360, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:46:15', '2026-05-08 17:46:15', '2026-05-08 17:46:15');
INSERT INTO `sys_job_log` VALUES (1361, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:46:20', '2026-05-08 17:46:20', '2026-05-08 17:46:20');
INSERT INTO `sys_job_log` VALUES (1362, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:46:25', '2026-05-08 17:46:25', '2026-05-08 17:46:25');
INSERT INTO `sys_job_log` VALUES (1363, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:46:30', '2026-05-08 17:46:30', '2026-05-08 17:46:30');
INSERT INTO `sys_job_log` VALUES (1364, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:46:35', '2026-05-08 17:46:35', '2026-05-08 17:46:35');
INSERT INTO `sys_job_log` VALUES (1365, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:46:40', '2026-05-08 17:46:40', '2026-05-08 17:46:40');
INSERT INTO `sys_job_log` VALUES (1366, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:46:45', '2026-05-08 17:46:45', '2026-05-08 17:46:45');
INSERT INTO `sys_job_log` VALUES (1367, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:46:50', '2026-05-08 17:46:50', '2026-05-08 17:46:50');
INSERT INTO `sys_job_log` VALUES (1368, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:46:55', '2026-05-08 17:46:55', '2026-05-08 17:46:55');
INSERT INTO `sys_job_log` VALUES (1369, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:47:00', '2026-05-08 17:47:00', '2026-05-08 17:47:00');
INSERT INTO `sys_job_log` VALUES (1370, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:47:05', '2026-05-08 17:47:05', '2026-05-08 17:47:05');
INSERT INTO `sys_job_log` VALUES (1371, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:47:10', '2026-05-08 17:47:10', '2026-05-08 17:47:10');
INSERT INTO `sys_job_log` VALUES (1372, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:47:15', '2026-05-08 17:47:15', '2026-05-08 17:47:15');
INSERT INTO `sys_job_log` VALUES (1373, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:47:20', '2026-05-08 17:47:20', '2026-05-08 17:47:20');
INSERT INTO `sys_job_log` VALUES (1374, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:47:25', '2026-05-08 17:47:25', '2026-05-08 17:47:25');
INSERT INTO `sys_job_log` VALUES (1375, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:47:30', '2026-05-08 17:47:30', '2026-05-08 17:47:30');
INSERT INTO `sys_job_log` VALUES (1376, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:47:35', '2026-05-08 17:47:35', '2026-05-08 17:47:35');
INSERT INTO `sys_job_log` VALUES (1377, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:47:40', '2026-05-08 17:47:40', '2026-05-08 17:47:40');
INSERT INTO `sys_job_log` VALUES (1378, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:47:45', '2026-05-08 17:47:45', '2026-05-08 17:47:45');
INSERT INTO `sys_job_log` VALUES (1379, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:47:50', '2026-05-08 17:47:50', '2026-05-08 17:47:50');
INSERT INTO `sys_job_log` VALUES (1380, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:47:55', '2026-05-08 17:47:55', '2026-05-08 17:47:55');
INSERT INTO `sys_job_log` VALUES (1381, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:48:00', '2026-05-08 17:48:00', '2026-05-08 17:48:00');
INSERT INTO `sys_job_log` VALUES (1382, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:48:05', '2026-05-08 17:48:05', '2026-05-08 17:48:05');
INSERT INTO `sys_job_log` VALUES (1383, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:48:10', '2026-05-08 17:48:10', '2026-05-08 17:48:10');
INSERT INTO `sys_job_log` VALUES (1384, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:48:15', '2026-05-08 17:48:15', '2026-05-08 17:48:15');
INSERT INTO `sys_job_log` VALUES (1385, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:48:20', '2026-05-08 17:48:20', '2026-05-08 17:48:20');
INSERT INTO `sys_job_log` VALUES (1386, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:48:25', '2026-05-08 17:48:25', '2026-05-08 17:48:25');
INSERT INTO `sys_job_log` VALUES (1387, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:48:30', '2026-05-08 17:48:30', '2026-05-08 17:48:30');
INSERT INTO `sys_job_log` VALUES (1388, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:48:35', '2026-05-08 17:48:35', '2026-05-08 17:48:35');
INSERT INTO `sys_job_log` VALUES (1389, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:48:40', '2026-05-08 17:48:40', '2026-05-08 17:48:40');
INSERT INTO `sys_job_log` VALUES (1390, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:48:45', '2026-05-08 17:48:45', '2026-05-08 17:48:45');
INSERT INTO `sys_job_log` VALUES (1391, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:48:50', '2026-05-08 17:48:50', '2026-05-08 17:48:50');
INSERT INTO `sys_job_log` VALUES (1392, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:48:55', '2026-05-08 17:48:55', '2026-05-08 17:48:55');
INSERT INTO `sys_job_log` VALUES (1393, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:49:00', '2026-05-08 17:49:00', '2026-05-08 17:49:00');
INSERT INTO `sys_job_log` VALUES (1394, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:49:05', '2026-05-08 17:49:05', '2026-05-08 17:49:05');
INSERT INTO `sys_job_log` VALUES (1395, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:49:10', '2026-05-08 17:49:10', '2026-05-08 17:49:10');
INSERT INTO `sys_job_log` VALUES (1396, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:49:15', '2026-05-08 17:49:15', '2026-05-08 17:49:15');
INSERT INTO `sys_job_log` VALUES (1397, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:49:20', '2026-05-08 17:49:20', '2026-05-08 17:49:20');
INSERT INTO `sys_job_log` VALUES (1398, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:49:25', '2026-05-08 17:49:25', '2026-05-08 17:49:25');
INSERT INTO `sys_job_log` VALUES (1399, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:49:30', '2026-05-08 17:49:30', '2026-05-08 17:49:30');
INSERT INTO `sys_job_log` VALUES (1400, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:49:35', '2026-05-08 17:49:35', '2026-05-08 17:49:35');
INSERT INTO `sys_job_log` VALUES (1401, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:49:40', '2026-05-08 17:49:40', '2026-05-08 17:49:40');
INSERT INTO `sys_job_log` VALUES (1402, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:49:45', '2026-05-08 17:49:45', '2026-05-08 17:49:45');
INSERT INTO `sys_job_log` VALUES (1403, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:49:50', '2026-05-08 17:49:50', '2026-05-08 17:49:50');
INSERT INTO `sys_job_log` VALUES (1404, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:49:55', '2026-05-08 17:49:55', '2026-05-08 17:49:55');
INSERT INTO `sys_job_log` VALUES (1405, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:50:00', '2026-05-08 17:50:00', '2026-05-08 17:50:00');
INSERT INTO `sys_job_log` VALUES (1406, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:50:05', '2026-05-08 17:50:05', '2026-05-08 17:50:05');
INSERT INTO `sys_job_log` VALUES (1407, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:50:10', '2026-05-08 17:50:10', '2026-05-08 17:50:10');
INSERT INTO `sys_job_log` VALUES (1408, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:50:15', '2026-05-08 17:50:15', '2026-05-08 17:50:15');
INSERT INTO `sys_job_log` VALUES (1409, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:50:20', '2026-05-08 17:50:20', '2026-05-08 17:50:20');
INSERT INTO `sys_job_log` VALUES (1410, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:50:25', '2026-05-08 17:50:25', '2026-05-08 17:50:25');
INSERT INTO `sys_job_log` VALUES (1411, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:50:30', '2026-05-08 17:50:30', '2026-05-08 17:50:30');
INSERT INTO `sys_job_log` VALUES (1412, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:50:35', '2026-05-08 17:50:35', '2026-05-08 17:50:35');
INSERT INTO `sys_job_log` VALUES (1413, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:50:40', '2026-05-08 17:50:40', '2026-05-08 17:50:40');
INSERT INTO `sys_job_log` VALUES (1414, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:50:45', '2026-05-08 17:50:45', '2026-05-08 17:50:45');
INSERT INTO `sys_job_log` VALUES (1415, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:50:50', '2026-05-08 17:50:50', '2026-05-08 17:50:50');
INSERT INTO `sys_job_log` VALUES (1416, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:50:55', '2026-05-08 17:50:55', '2026-05-08 17:50:55');
INSERT INTO `sys_job_log` VALUES (1417, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:51:00', '2026-05-08 17:51:00', '2026-05-08 17:51:00');
INSERT INTO `sys_job_log` VALUES (1418, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:51:05', '2026-05-08 17:51:05', '2026-05-08 17:51:05');
INSERT INTO `sys_job_log` VALUES (1419, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:51:10', '2026-05-08 17:51:10', '2026-05-08 17:51:10');
INSERT INTO `sys_job_log` VALUES (1420, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:51:15', '2026-05-08 17:51:15', '2026-05-08 17:51:15');
INSERT INTO `sys_job_log` VALUES (1421, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:51:20', '2026-05-08 17:51:20', '2026-05-08 17:51:20');
INSERT INTO `sys_job_log` VALUES (1422, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:51:25', '2026-05-08 17:51:25', '2026-05-08 17:51:25');
INSERT INTO `sys_job_log` VALUES (1423, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:51:30', '2026-05-08 17:51:30', '2026-05-08 17:51:30');
INSERT INTO `sys_job_log` VALUES (1424, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:51:35', '2026-05-08 17:51:35', '2026-05-08 17:51:35');
INSERT INTO `sys_job_log` VALUES (1425, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:51:40', '2026-05-08 17:51:40', '2026-05-08 17:51:40');
INSERT INTO `sys_job_log` VALUES (1426, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:51:45', '2026-05-08 17:51:45', '2026-05-08 17:51:45');
INSERT INTO `sys_job_log` VALUES (1427, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:51:50', '2026-05-08 17:51:50', '2026-05-08 17:51:50');
INSERT INTO `sys_job_log` VALUES (1428, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:51:55', '2026-05-08 17:51:55', '2026-05-08 17:51:55');
INSERT INTO `sys_job_log` VALUES (1429, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:52:00', '2026-05-08 17:52:00', '2026-05-08 17:52:00');
INSERT INTO `sys_job_log` VALUES (1430, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:52:05', '2026-05-08 17:52:05', '2026-05-08 17:52:05');
INSERT INTO `sys_job_log` VALUES (1431, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:52:10', '2026-05-08 17:52:10', '2026-05-08 17:52:10');
INSERT INTO `sys_job_log` VALUES (1432, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:52:15', '2026-05-08 17:52:15', '2026-05-08 17:52:15');
INSERT INTO `sys_job_log` VALUES (1433, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:52:20', '2026-05-08 17:52:20', '2026-05-08 17:52:20');
INSERT INTO `sys_job_log` VALUES (1434, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:52:25', '2026-05-08 17:52:25', '2026-05-08 17:52:25');
INSERT INTO `sys_job_log` VALUES (1435, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:52:30', '2026-05-08 17:52:30', '2026-05-08 17:52:30');
INSERT INTO `sys_job_log` VALUES (1436, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:52:35', '2026-05-08 17:52:35', '2026-05-08 17:52:35');
INSERT INTO `sys_job_log` VALUES (1437, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:52:40', '2026-05-08 17:52:40', '2026-05-08 17:52:40');
INSERT INTO `sys_job_log` VALUES (1438, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:52:45', '2026-05-08 17:52:45', '2026-05-08 17:52:45');
INSERT INTO `sys_job_log` VALUES (1439, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:52:50', '2026-05-08 17:52:50', '2026-05-08 17:52:50');
INSERT INTO `sys_job_log` VALUES (1440, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:52:55', '2026-05-08 17:52:55', '2026-05-08 17:52:55');
INSERT INTO `sys_job_log` VALUES (1441, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:53:00', '2026-05-08 17:53:00', '2026-05-08 17:53:00');
INSERT INTO `sys_job_log` VALUES (1442, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:53:05', '2026-05-08 17:53:05', '2026-05-08 17:53:05');
INSERT INTO `sys_job_log` VALUES (1443, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:53:10', '2026-05-08 17:53:10', '2026-05-08 17:53:10');
INSERT INTO `sys_job_log` VALUES (1444, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:53:15', '2026-05-08 17:53:15', '2026-05-08 17:53:15');
INSERT INTO `sys_job_log` VALUES (1445, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:53:20', '2026-05-08 17:53:20', '2026-05-08 17:53:20');
INSERT INTO `sys_job_log` VALUES (1446, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:53:25', '2026-05-08 17:53:25', '2026-05-08 17:53:25');
INSERT INTO `sys_job_log` VALUES (1447, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:53:30', '2026-05-08 17:53:30', '2026-05-08 17:53:30');
INSERT INTO `sys_job_log` VALUES (1448, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:53:35', '2026-05-08 17:53:35', '2026-05-08 17:53:35');
INSERT INTO `sys_job_log` VALUES (1449, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:53:40', '2026-05-08 17:53:40', '2026-05-08 17:53:40');
INSERT INTO `sys_job_log` VALUES (1450, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:53:45', '2026-05-08 17:53:45', '2026-05-08 17:53:45');
INSERT INTO `sys_job_log` VALUES (1451, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:53:50', '2026-05-08 17:53:50', '2026-05-08 17:53:50');
INSERT INTO `sys_job_log` VALUES (1452, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:53:55', '2026-05-08 17:53:55', '2026-05-08 17:53:55');
INSERT INTO `sys_job_log` VALUES (1453, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:54:00', '2026-05-08 17:54:00', '2026-05-08 17:54:00');
INSERT INTO `sys_job_log` VALUES (1454, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:54:05', '2026-05-08 17:54:05', '2026-05-08 17:54:05');
INSERT INTO `sys_job_log` VALUES (1455, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:54:10', '2026-05-08 17:54:10', '2026-05-08 17:54:10');
INSERT INTO `sys_job_log` VALUES (1456, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:54:15', '2026-05-08 17:54:15', '2026-05-08 17:54:15');
INSERT INTO `sys_job_log` VALUES (1457, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:54:20', '2026-05-08 17:54:20', '2026-05-08 17:54:20');
INSERT INTO `sys_job_log` VALUES (1458, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:54:25', '2026-05-08 17:54:25', '2026-05-08 17:54:25');
INSERT INTO `sys_job_log` VALUES (1459, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:54:30', '2026-05-08 17:54:30', '2026-05-08 17:54:30');
INSERT INTO `sys_job_log` VALUES (1460, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:54:35', '2026-05-08 17:54:35', '2026-05-08 17:54:35');
INSERT INTO `sys_job_log` VALUES (1461, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:54:40', '2026-05-08 17:54:40', '2026-05-08 17:54:40');
INSERT INTO `sys_job_log` VALUES (1462, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-08 17:54:45', '2026-05-08 17:54:45', '2026-05-08 17:54:45');
INSERT INTO `sys_job_log` VALUES (1463, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:54:50', '2026-05-08 17:54:50', '2026-05-08 17:54:50');
INSERT INTO `sys_job_log` VALUES (1464, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:54:55', '2026-05-08 17:54:55', '2026-05-08 17:54:55');
INSERT INTO `sys_job_log` VALUES (1465, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:55:00', '2026-05-08 17:55:00', '2026-05-08 17:55:00');
INSERT INTO `sys_job_log` VALUES (1466, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:55:05', '2026-05-08 17:55:05', '2026-05-08 17:55:05');
INSERT INTO `sys_job_log` VALUES (1467, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:55:10', '2026-05-08 17:55:10', '2026-05-08 17:55:10');
INSERT INTO `sys_job_log` VALUES (1468, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:55:15', '2026-05-08 17:55:15', '2026-05-08 17:55:15');
INSERT INTO `sys_job_log` VALUES (1469, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:55:20', '2026-05-08 17:55:20', '2026-05-08 17:55:20');
INSERT INTO `sys_job_log` VALUES (1470, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:55:25', '2026-05-08 17:55:25', '2026-05-08 17:55:25');
INSERT INTO `sys_job_log` VALUES (1471, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:55:30', '2026-05-08 17:55:30', '2026-05-08 17:55:30');
INSERT INTO `sys_job_log` VALUES (1472, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:55:35', '2026-05-08 17:55:35', '2026-05-08 17:55:35');
INSERT INTO `sys_job_log` VALUES (1473, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-08 17:55:40', '2026-05-08 17:55:40', '2026-05-08 17:55:40');
INSERT INTO `sys_job_log` VALUES (1474, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-09 08:33:52', '2026-05-09 08:33:52', '2026-05-09 08:33:52');
INSERT INTO `sys_job_log` VALUES (1475, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:33:55', '2026-05-09 08:33:55', '2026-05-09 08:33:55');
INSERT INTO `sys_job_log` VALUES (1476, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:34:00', '2026-05-09 08:34:00', '2026-05-09 08:34:00');
INSERT INTO `sys_job_log` VALUES (1477, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:34:05', '2026-05-09 08:34:05', '2026-05-09 08:34:05');
INSERT INTO `sys_job_log` VALUES (1478, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:34:10', '2026-05-09 08:34:10', '2026-05-09 08:34:10');
INSERT INTO `sys_job_log` VALUES (1479, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:34:15', '2026-05-09 08:34:15', '2026-05-09 08:34:15');
INSERT INTO `sys_job_log` VALUES (1480, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:34:20', '2026-05-09 08:34:20', '2026-05-09 08:34:20');
INSERT INTO `sys_job_log` VALUES (1481, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:34:25', '2026-05-09 08:34:25', '2026-05-09 08:34:25');
INSERT INTO `sys_job_log` VALUES (1482, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:34:30', '2026-05-09 08:34:30', '2026-05-09 08:34:30');
INSERT INTO `sys_job_log` VALUES (1483, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:34:35', '2026-05-09 08:34:35', '2026-05-09 08:34:35');
INSERT INTO `sys_job_log` VALUES (1484, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:34:40', '2026-05-09 08:34:40', '2026-05-09 08:34:40');
INSERT INTO `sys_job_log` VALUES (1485, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:34:45', '2026-05-09 08:34:45', '2026-05-09 08:34:45');
INSERT INTO `sys_job_log` VALUES (1486, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:34:50', '2026-05-09 08:34:50', '2026-05-09 08:34:50');
INSERT INTO `sys_job_log` VALUES (1487, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:34:55', '2026-05-09 08:34:55', '2026-05-09 08:34:55');
INSERT INTO `sys_job_log` VALUES (1488, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:35:00', '2026-05-09 08:35:00', '2026-05-09 08:35:00');
INSERT INTO `sys_job_log` VALUES (1489, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:35:05', '2026-05-09 08:35:05', '2026-05-09 08:35:05');
INSERT INTO `sys_job_log` VALUES (1490, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:35:10', '2026-05-09 08:35:10', '2026-05-09 08:35:10');
INSERT INTO `sys_job_log` VALUES (1491, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:35:15', '2026-05-09 08:35:15', '2026-05-09 08:35:15');
INSERT INTO `sys_job_log` VALUES (1492, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:35:20', '2026-05-09 08:35:20', '2026-05-09 08:35:20');
INSERT INTO `sys_job_log` VALUES (1493, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:35:25', '2026-05-09 08:35:25', '2026-05-09 08:35:25');
INSERT INTO `sys_job_log` VALUES (1494, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:35:30', '2026-05-09 08:35:30', '2026-05-09 08:35:30');
INSERT INTO `sys_job_log` VALUES (1495, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:35:35', '2026-05-09 08:35:35', '2026-05-09 08:35:35');
INSERT INTO `sys_job_log` VALUES (1496, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:35:40', '2026-05-09 08:35:40', '2026-05-09 08:35:40');
INSERT INTO `sys_job_log` VALUES (1497, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:35:45', '2026-05-09 08:35:45', '2026-05-09 08:35:45');
INSERT INTO `sys_job_log` VALUES (1498, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:35:50', '2026-05-09 08:35:50', '2026-05-09 08:35:50');
INSERT INTO `sys_job_log` VALUES (1499, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:35:55', '2026-05-09 08:35:55', '2026-05-09 08:35:55');
INSERT INTO `sys_job_log` VALUES (1500, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:36:00', '2026-05-09 08:36:00', '2026-05-09 08:36:00');
INSERT INTO `sys_job_log` VALUES (1501, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:36:05', '2026-05-09 08:36:05', '2026-05-09 08:36:05');
INSERT INTO `sys_job_log` VALUES (1502, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:36:10', '2026-05-09 08:36:10', '2026-05-09 08:36:10');
INSERT INTO `sys_job_log` VALUES (1503, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:36:15', '2026-05-09 08:36:15', '2026-05-09 08:36:15');
INSERT INTO `sys_job_log` VALUES (1504, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:36:20', '2026-05-09 08:36:20', '2026-05-09 08:36:20');
INSERT INTO `sys_job_log` VALUES (1505, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:36:25', '2026-05-09 08:36:25', '2026-05-09 08:36:25');
INSERT INTO `sys_job_log` VALUES (1506, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:36:30', '2026-05-09 08:36:30', '2026-05-09 08:36:30');
INSERT INTO `sys_job_log` VALUES (1507, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:36:35', '2026-05-09 08:36:35', '2026-05-09 08:36:35');
INSERT INTO `sys_job_log` VALUES (1508, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:36:40', '2026-05-09 08:36:40', '2026-05-09 08:36:40');
INSERT INTO `sys_job_log` VALUES (1509, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:36:45', '2026-05-09 08:36:45', '2026-05-09 08:36:45');
INSERT INTO `sys_job_log` VALUES (1510, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:36:50', '2026-05-09 08:36:50', '2026-05-09 08:36:50');
INSERT INTO `sys_job_log` VALUES (1511, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:36:55', '2026-05-09 08:36:55', '2026-05-09 08:36:55');
INSERT INTO `sys_job_log` VALUES (1512, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:37:00', '2026-05-09 08:37:00', '2026-05-09 08:37:00');
INSERT INTO `sys_job_log` VALUES (1513, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:37:05', '2026-05-09 08:37:05', '2026-05-09 08:37:05');
INSERT INTO `sys_job_log` VALUES (1514, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:37:10', '2026-05-09 08:37:10', '2026-05-09 08:37:10');
INSERT INTO `sys_job_log` VALUES (1515, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:37:15', '2026-05-09 08:37:15', '2026-05-09 08:37:15');
INSERT INTO `sys_job_log` VALUES (1516, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:37:20', '2026-05-09 08:37:20', '2026-05-09 08:37:20');
INSERT INTO `sys_job_log` VALUES (1517, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:37:25', '2026-05-09 08:37:25', '2026-05-09 08:37:25');
INSERT INTO `sys_job_log` VALUES (1518, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:37:30', '2026-05-09 08:37:30', '2026-05-09 08:37:30');
INSERT INTO `sys_job_log` VALUES (1519, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:37:35', '2026-05-09 08:37:35', '2026-05-09 08:37:35');
INSERT INTO `sys_job_log` VALUES (1520, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:37:40', '2026-05-09 08:37:40', '2026-05-09 08:37:40');
INSERT INTO `sys_job_log` VALUES (1521, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:37:45', '2026-05-09 08:37:45', '2026-05-09 08:37:45');
INSERT INTO `sys_job_log` VALUES (1522, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:37:50', '2026-05-09 08:37:50', '2026-05-09 08:37:50');
INSERT INTO `sys_job_log` VALUES (1523, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:37:55', '2026-05-09 08:37:55', '2026-05-09 08:37:55');
INSERT INTO `sys_job_log` VALUES (1524, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:38:00', '2026-05-09 08:38:00', '2026-05-09 08:38:00');
INSERT INTO `sys_job_log` VALUES (1525, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:38:05', '2026-05-09 08:38:05', '2026-05-09 08:38:05');
INSERT INTO `sys_job_log` VALUES (1526, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:38:10', '2026-05-09 08:38:10', '2026-05-09 08:38:10');
INSERT INTO `sys_job_log` VALUES (1527, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:38:15', '2026-05-09 08:38:15', '2026-05-09 08:38:15');
INSERT INTO `sys_job_log` VALUES (1528, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:38:20', '2026-05-09 08:38:20', '2026-05-09 08:38:20');
INSERT INTO `sys_job_log` VALUES (1529, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:38:25', '2026-05-09 08:38:25', '2026-05-09 08:38:25');
INSERT INTO `sys_job_log` VALUES (1530, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:38:30', '2026-05-09 08:38:30', '2026-05-09 08:38:30');
INSERT INTO `sys_job_log` VALUES (1531, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:38:35', '2026-05-09 08:38:35', '2026-05-09 08:38:35');
INSERT INTO `sys_job_log` VALUES (1532, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：3毫秒', '0', '', '2026-05-09 08:38:40', '2026-05-09 08:38:40', '2026-05-09 08:38:40');
INSERT INTO `sys_job_log` VALUES (1533, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:38:45', '2026-05-09 08:38:45', '2026-05-09 08:38:45');
INSERT INTO `sys_job_log` VALUES (1534, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:38:50', '2026-05-09 08:38:50', '2026-05-09 08:38:50');
INSERT INTO `sys_job_log` VALUES (1535, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:38:55', '2026-05-09 08:38:55', '2026-05-09 08:38:55');
INSERT INTO `sys_job_log` VALUES (1536, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:39:00', '2026-05-09 08:39:00', '2026-05-09 08:39:00');
INSERT INTO `sys_job_log` VALUES (1537, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:39:05', '2026-05-09 08:39:05', '2026-05-09 08:39:05');
INSERT INTO `sys_job_log` VALUES (1538, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:39:10', '2026-05-09 08:39:10', '2026-05-09 08:39:10');
INSERT INTO `sys_job_log` VALUES (1539, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:39:15', '2026-05-09 08:39:15', '2026-05-09 08:39:15');
INSERT INTO `sys_job_log` VALUES (1540, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:39:20', '2026-05-09 08:39:20', '2026-05-09 08:39:20');
INSERT INTO `sys_job_log` VALUES (1541, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:39:25', '2026-05-09 08:39:25', '2026-05-09 08:39:25');
INSERT INTO `sys_job_log` VALUES (1542, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:39:30', '2026-05-09 08:39:30', '2026-05-09 08:39:30');
INSERT INTO `sys_job_log` VALUES (1543, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:39:35', '2026-05-09 08:39:35', '2026-05-09 08:39:35');
INSERT INTO `sys_job_log` VALUES (1544, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:39:40', '2026-05-09 08:39:40', '2026-05-09 08:39:40');
INSERT INTO `sys_job_log` VALUES (1545, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:39:45', '2026-05-09 08:39:45', '2026-05-09 08:39:45');
INSERT INTO `sys_job_log` VALUES (1546, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:39:50', '2026-05-09 08:39:50', '2026-05-09 08:39:50');
INSERT INTO `sys_job_log` VALUES (1547, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:39:55', '2026-05-09 08:39:55', '2026-05-09 08:39:55');
INSERT INTO `sys_job_log` VALUES (1548, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:40:00', '2026-05-09 08:40:00', '2026-05-09 08:40:00');
INSERT INTO `sys_job_log` VALUES (1549, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:40:05', '2026-05-09 08:40:05', '2026-05-09 08:40:05');
INSERT INTO `sys_job_log` VALUES (1550, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:40:10', '2026-05-09 08:40:10', '2026-05-09 08:40:10');
INSERT INTO `sys_job_log` VALUES (1551, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:40:15', '2026-05-09 08:40:15', '2026-05-09 08:40:15');
INSERT INTO `sys_job_log` VALUES (1552, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:40:20', '2026-05-09 08:40:20', '2026-05-09 08:40:20');
INSERT INTO `sys_job_log` VALUES (1553, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:40:25', '2026-05-09 08:40:25', '2026-05-09 08:40:25');
INSERT INTO `sys_job_log` VALUES (1554, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:40:30', '2026-05-09 08:40:30', '2026-05-09 08:40:30');
INSERT INTO `sys_job_log` VALUES (1555, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:40:35', '2026-05-09 08:40:35', '2026-05-09 08:40:35');
INSERT INTO `sys_job_log` VALUES (1556, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:40:40', '2026-05-09 08:40:40', '2026-05-09 08:40:40');
INSERT INTO `sys_job_log` VALUES (1557, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:40:45', '2026-05-09 08:40:45', '2026-05-09 08:40:45');
INSERT INTO `sys_job_log` VALUES (1558, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:40:50', '2026-05-09 08:40:50', '2026-05-09 08:40:50');
INSERT INTO `sys_job_log` VALUES (1559, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:40:55', '2026-05-09 08:40:55', '2026-05-09 08:40:55');
INSERT INTO `sys_job_log` VALUES (1560, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:41:00', '2026-05-09 08:41:00', '2026-05-09 08:41:00');
INSERT INTO `sys_job_log` VALUES (1561, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:41:05', '2026-05-09 08:41:05', '2026-05-09 08:41:05');
INSERT INTO `sys_job_log` VALUES (1562, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:41:10', '2026-05-09 08:41:10', '2026-05-09 08:41:10');
INSERT INTO `sys_job_log` VALUES (1563, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:41:15', '2026-05-09 08:41:15', '2026-05-09 08:41:15');
INSERT INTO `sys_job_log` VALUES (1564, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:41:20', '2026-05-09 08:41:20', '2026-05-09 08:41:20');
INSERT INTO `sys_job_log` VALUES (1565, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:41:25', '2026-05-09 08:41:25', '2026-05-09 08:41:25');
INSERT INTO `sys_job_log` VALUES (1566, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:41:30', '2026-05-09 08:41:30', '2026-05-09 08:41:30');
INSERT INTO `sys_job_log` VALUES (1567, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:41:35', '2026-05-09 08:41:35', '2026-05-09 08:41:35');
INSERT INTO `sys_job_log` VALUES (1568, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:41:40', '2026-05-09 08:41:40', '2026-05-09 08:41:40');
INSERT INTO `sys_job_log` VALUES (1569, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:41:45', '2026-05-09 08:41:45', '2026-05-09 08:41:45');
INSERT INTO `sys_job_log` VALUES (1570, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:41:50', '2026-05-09 08:41:50', '2026-05-09 08:41:50');
INSERT INTO `sys_job_log` VALUES (1571, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:41:55', '2026-05-09 08:41:55', '2026-05-09 08:41:55');
INSERT INTO `sys_job_log` VALUES (1572, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:42:00', '2026-05-09 08:42:00', '2026-05-09 08:42:00');
INSERT INTO `sys_job_log` VALUES (1573, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:42:05', '2026-05-09 08:42:05', '2026-05-09 08:42:05');
INSERT INTO `sys_job_log` VALUES (1574, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:42:10', '2026-05-09 08:42:10', '2026-05-09 08:42:10');
INSERT INTO `sys_job_log` VALUES (1575, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:42:15', '2026-05-09 08:42:15', '2026-05-09 08:42:15');
INSERT INTO `sys_job_log` VALUES (1576, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:42:20', '2026-05-09 08:42:20', '2026-05-09 08:42:20');
INSERT INTO `sys_job_log` VALUES (1577, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:42:25', '2026-05-09 08:42:25', '2026-05-09 08:42:25');
INSERT INTO `sys_job_log` VALUES (1578, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:42:30', '2026-05-09 08:42:30', '2026-05-09 08:42:30');
INSERT INTO `sys_job_log` VALUES (1579, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:42:35', '2026-05-09 08:42:35', '2026-05-09 08:42:35');
INSERT INTO `sys_job_log` VALUES (1580, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:42:40', '2026-05-09 08:42:40', '2026-05-09 08:42:40');
INSERT INTO `sys_job_log` VALUES (1581, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:42:45', '2026-05-09 08:42:45', '2026-05-09 08:42:45');
INSERT INTO `sys_job_log` VALUES (1582, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:42:50', '2026-05-09 08:42:50', '2026-05-09 08:42:50');
INSERT INTO `sys_job_log` VALUES (1583, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:42:55', '2026-05-09 08:42:55', '2026-05-09 08:42:55');
INSERT INTO `sys_job_log` VALUES (1584, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:43:00', '2026-05-09 08:43:00', '2026-05-09 08:43:00');
INSERT INTO `sys_job_log` VALUES (1585, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:43:05', '2026-05-09 08:43:05', '2026-05-09 08:43:05');
INSERT INTO `sys_job_log` VALUES (1586, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:43:10', '2026-05-09 08:43:10', '2026-05-09 08:43:10');
INSERT INTO `sys_job_log` VALUES (1587, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:43:15', '2026-05-09 08:43:15', '2026-05-09 08:43:15');
INSERT INTO `sys_job_log` VALUES (1588, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:43:20', '2026-05-09 08:43:20', '2026-05-09 08:43:20');
INSERT INTO `sys_job_log` VALUES (1589, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:43:25', '2026-05-09 08:43:25', '2026-05-09 08:43:25');
INSERT INTO `sys_job_log` VALUES (1590, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:43:30', '2026-05-09 08:43:30', '2026-05-09 08:43:30');
INSERT INTO `sys_job_log` VALUES (1591, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:43:35', '2026-05-09 08:43:35', '2026-05-09 08:43:35');
INSERT INTO `sys_job_log` VALUES (1592, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:43:40', '2026-05-09 08:43:40', '2026-05-09 08:43:40');
INSERT INTO `sys_job_log` VALUES (1593, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:43:45', '2026-05-09 08:43:45', '2026-05-09 08:43:45');
INSERT INTO `sys_job_log` VALUES (1594, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:43:50', '2026-05-09 08:43:50', '2026-05-09 08:43:50');
INSERT INTO `sys_job_log` VALUES (1595, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:43:55', '2026-05-09 08:43:55', '2026-05-09 08:43:55');
INSERT INTO `sys_job_log` VALUES (1596, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:44:00', '2026-05-09 08:44:00', '2026-05-09 08:44:00');
INSERT INTO `sys_job_log` VALUES (1597, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:44:05', '2026-05-09 08:44:05', '2026-05-09 08:44:05');
INSERT INTO `sys_job_log` VALUES (1598, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:44:10', '2026-05-09 08:44:10', '2026-05-09 08:44:10');
INSERT INTO `sys_job_log` VALUES (1599, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:44:15', '2026-05-09 08:44:15', '2026-05-09 08:44:15');
INSERT INTO `sys_job_log` VALUES (1600, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:44:20', '2026-05-09 08:44:20', '2026-05-09 08:44:20');
INSERT INTO `sys_job_log` VALUES (1601, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:44:25', '2026-05-09 08:44:25', '2026-05-09 08:44:25');
INSERT INTO `sys_job_log` VALUES (1602, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:44:30', '2026-05-09 08:44:30', '2026-05-09 08:44:30');
INSERT INTO `sys_job_log` VALUES (1603, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:44:35', '2026-05-09 08:44:35', '2026-05-09 08:44:35');
INSERT INTO `sys_job_log` VALUES (1604, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:44:40', '2026-05-09 08:44:40', '2026-05-09 08:44:40');
INSERT INTO `sys_job_log` VALUES (1605, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:44:45', '2026-05-09 08:44:45', '2026-05-09 08:44:45');
INSERT INTO `sys_job_log` VALUES (1606, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:44:50', '2026-05-09 08:44:50', '2026-05-09 08:44:50');
INSERT INTO `sys_job_log` VALUES (1607, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:44:55', '2026-05-09 08:44:55', '2026-05-09 08:44:55');
INSERT INTO `sys_job_log` VALUES (1608, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:45:00', '2026-05-09 08:45:00', '2026-05-09 08:45:00');
INSERT INTO `sys_job_log` VALUES (1609, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:45:05', '2026-05-09 08:45:05', '2026-05-09 08:45:05');
INSERT INTO `sys_job_log` VALUES (1610, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:45:10', '2026-05-09 08:45:10', '2026-05-09 08:45:10');
INSERT INTO `sys_job_log` VALUES (1611, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:45:15', '2026-05-09 08:45:15', '2026-05-09 08:45:15');
INSERT INTO `sys_job_log` VALUES (1612, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:45:20', '2026-05-09 08:45:20', '2026-05-09 08:45:20');
INSERT INTO `sys_job_log` VALUES (1613, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:45:25', '2026-05-09 08:45:25', '2026-05-09 08:45:25');
INSERT INTO `sys_job_log` VALUES (1614, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:45:30', '2026-05-09 08:45:30', '2026-05-09 08:45:30');
INSERT INTO `sys_job_log` VALUES (1615, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:45:35', '2026-05-09 08:45:35', '2026-05-09 08:45:35');
INSERT INTO `sys_job_log` VALUES (1616, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:45:40', '2026-05-09 08:45:40', '2026-05-09 08:45:40');
INSERT INTO `sys_job_log` VALUES (1617, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:45:45', '2026-05-09 08:45:45', '2026-05-09 08:45:45');
INSERT INTO `sys_job_log` VALUES (1618, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:45:50', '2026-05-09 08:45:50', '2026-05-09 08:45:50');
INSERT INTO `sys_job_log` VALUES (1619, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:45:55', '2026-05-09 08:45:55', '2026-05-09 08:45:55');
INSERT INTO `sys_job_log` VALUES (1620, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:46:00', '2026-05-09 08:46:00', '2026-05-09 08:46:00');
INSERT INTO `sys_job_log` VALUES (1621, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:46:05', '2026-05-09 08:46:05', '2026-05-09 08:46:05');
INSERT INTO `sys_job_log` VALUES (1622, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:46:10', '2026-05-09 08:46:10', '2026-05-09 08:46:10');
INSERT INTO `sys_job_log` VALUES (1623, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:46:15', '2026-05-09 08:46:15', '2026-05-09 08:46:15');
INSERT INTO `sys_job_log` VALUES (1624, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:46:20', '2026-05-09 08:46:20', '2026-05-09 08:46:20');
INSERT INTO `sys_job_log` VALUES (1625, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:46:25', '2026-05-09 08:46:25', '2026-05-09 08:46:25');
INSERT INTO `sys_job_log` VALUES (1626, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-09 08:46:30', '2026-05-09 08:46:30', '2026-05-09 08:46:30');
INSERT INTO `sys_job_log` VALUES (1627, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:46:35', '2026-05-09 08:46:35', '2026-05-09 08:46:35');
INSERT INTO `sys_job_log` VALUES (1628, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:46:40', '2026-05-09 08:46:40', '2026-05-09 08:46:40');
INSERT INTO `sys_job_log` VALUES (1629, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:46:45', '2026-05-09 08:46:45', '2026-05-09 08:46:45');
INSERT INTO `sys_job_log` VALUES (1630, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:46:50', '2026-05-09 08:46:50', '2026-05-09 08:46:50');
INSERT INTO `sys_job_log` VALUES (1631, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:46:55', '2026-05-09 08:46:55', '2026-05-09 08:46:55');
INSERT INTO `sys_job_log` VALUES (1632, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:47:00', '2026-05-09 08:47:00', '2026-05-09 08:47:00');
INSERT INTO `sys_job_log` VALUES (1633, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:47:05', '2026-05-09 08:47:05', '2026-05-09 08:47:05');
INSERT INTO `sys_job_log` VALUES (1634, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:47:10', '2026-05-09 08:47:10', '2026-05-09 08:47:10');
INSERT INTO `sys_job_log` VALUES (1635, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:47:15', '2026-05-09 08:47:15', '2026-05-09 08:47:15');
INSERT INTO `sys_job_log` VALUES (1636, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:47:20', '2026-05-09 08:47:20', '2026-05-09 08:47:20');
INSERT INTO `sys_job_log` VALUES (1637, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:47:25', '2026-05-09 08:47:25', '2026-05-09 08:47:25');
INSERT INTO `sys_job_log` VALUES (1638, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:47:30', '2026-05-09 08:47:30', '2026-05-09 08:47:30');
INSERT INTO `sys_job_log` VALUES (1639, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:47:35', '2026-05-09 08:47:35', '2026-05-09 08:47:35');
INSERT INTO `sys_job_log` VALUES (1640, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:47:40', '2026-05-09 08:47:40', '2026-05-09 08:47:40');
INSERT INTO `sys_job_log` VALUES (1641, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:47:45', '2026-05-09 08:47:45', '2026-05-09 08:47:45');
INSERT INTO `sys_job_log` VALUES (1642, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:47:50', '2026-05-09 08:47:50', '2026-05-09 08:47:50');
INSERT INTO `sys_job_log` VALUES (1643, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:47:55', '2026-05-09 08:47:55', '2026-05-09 08:47:55');
INSERT INTO `sys_job_log` VALUES (1644, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:48:00', '2026-05-09 08:48:00', '2026-05-09 08:48:00');
INSERT INTO `sys_job_log` VALUES (1645, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:48:05', '2026-05-09 08:48:05', '2026-05-09 08:48:05');
INSERT INTO `sys_job_log` VALUES (1646, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:48:10', '2026-05-09 08:48:10', '2026-05-09 08:48:10');
INSERT INTO `sys_job_log` VALUES (1647, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:48:15', '2026-05-09 08:48:15', '2026-05-09 08:48:15');
INSERT INTO `sys_job_log` VALUES (1648, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:48:20', '2026-05-09 08:48:20', '2026-05-09 08:48:20');
INSERT INTO `sys_job_log` VALUES (1649, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:48:25', '2026-05-09 08:48:25', '2026-05-09 08:48:25');
INSERT INTO `sys_job_log` VALUES (1650, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:48:30', '2026-05-09 08:48:30', '2026-05-09 08:48:30');
INSERT INTO `sys_job_log` VALUES (1651, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:48:35', '2026-05-09 08:48:35', '2026-05-09 08:48:35');
INSERT INTO `sys_job_log` VALUES (1652, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:48:40', '2026-05-09 08:48:40', '2026-05-09 08:48:40');
INSERT INTO `sys_job_log` VALUES (1653, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:48:45', '2026-05-09 08:48:45', '2026-05-09 08:48:45');
INSERT INTO `sys_job_log` VALUES (1654, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:48:50', '2026-05-09 08:48:50', '2026-05-09 08:48:50');
INSERT INTO `sys_job_log` VALUES (1655, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:48:55', '2026-05-09 08:48:55', '2026-05-09 08:48:55');
INSERT INTO `sys_job_log` VALUES (1656, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:49:00', '2026-05-09 08:49:00', '2026-05-09 08:49:00');
INSERT INTO `sys_job_log` VALUES (1657, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:49:05', '2026-05-09 08:49:05', '2026-05-09 08:49:05');
INSERT INTO `sys_job_log` VALUES (1658, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:49:10', '2026-05-09 08:49:10', '2026-05-09 08:49:10');
INSERT INTO `sys_job_log` VALUES (1659, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:49:15', '2026-05-09 08:49:15', '2026-05-09 08:49:15');
INSERT INTO `sys_job_log` VALUES (1660, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:49:20', '2026-05-09 08:49:20', '2026-05-09 08:49:20');
INSERT INTO `sys_job_log` VALUES (1661, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:49:25', '2026-05-09 08:49:25', '2026-05-09 08:49:25');
INSERT INTO `sys_job_log` VALUES (1662, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:49:30', '2026-05-09 08:49:30', '2026-05-09 08:49:30');
INSERT INTO `sys_job_log` VALUES (1663, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:49:35', '2026-05-09 08:49:35', '2026-05-09 08:49:35');
INSERT INTO `sys_job_log` VALUES (1664, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:49:40', '2026-05-09 08:49:40', '2026-05-09 08:49:40');
INSERT INTO `sys_job_log` VALUES (1665, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:49:45', '2026-05-09 08:49:45', '2026-05-09 08:49:45');
INSERT INTO `sys_job_log` VALUES (1666, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:49:50', '2026-05-09 08:49:50', '2026-05-09 08:49:50');
INSERT INTO `sys_job_log` VALUES (1667, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:49:55', '2026-05-09 08:49:55', '2026-05-09 08:49:55');
INSERT INTO `sys_job_log` VALUES (1668, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:50:00', '2026-05-09 08:50:00', '2026-05-09 08:50:00');
INSERT INTO `sys_job_log` VALUES (1669, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:50:05', '2026-05-09 08:50:05', '2026-05-09 08:50:05');
INSERT INTO `sys_job_log` VALUES (1670, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:50:10', '2026-05-09 08:50:10', '2026-05-09 08:50:10');
INSERT INTO `sys_job_log` VALUES (1671, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:50:15', '2026-05-09 08:50:15', '2026-05-09 08:50:15');
INSERT INTO `sys_job_log` VALUES (1672, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:50:20', '2026-05-09 08:50:20', '2026-05-09 08:50:20');
INSERT INTO `sys_job_log` VALUES (1673, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:50:25', '2026-05-09 08:50:25', '2026-05-09 08:50:25');
INSERT INTO `sys_job_log` VALUES (1674, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:50:30', '2026-05-09 08:50:30', '2026-05-09 08:50:30');
INSERT INTO `sys_job_log` VALUES (1675, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:50:35', '2026-05-09 08:50:35', '2026-05-09 08:50:35');
INSERT INTO `sys_job_log` VALUES (1676, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:50:40', '2026-05-09 08:50:40', '2026-05-09 08:50:40');
INSERT INTO `sys_job_log` VALUES (1677, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:50:45', '2026-05-09 08:50:45', '2026-05-09 08:50:45');
INSERT INTO `sys_job_log` VALUES (1678, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:50:50', '2026-05-09 08:50:50', '2026-05-09 08:50:50');
INSERT INTO `sys_job_log` VALUES (1679, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:50:55', '2026-05-09 08:50:55', '2026-05-09 08:50:55');
INSERT INTO `sys_job_log` VALUES (1680, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:51:00', '2026-05-09 08:51:00', '2026-05-09 08:51:00');
INSERT INTO `sys_job_log` VALUES (1681, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:51:05', '2026-05-09 08:51:05', '2026-05-09 08:51:05');
INSERT INTO `sys_job_log` VALUES (1682, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:51:10', '2026-05-09 08:51:10', '2026-05-09 08:51:10');
INSERT INTO `sys_job_log` VALUES (1683, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:51:15', '2026-05-09 08:51:15', '2026-05-09 08:51:15');
INSERT INTO `sys_job_log` VALUES (1684, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:51:20', '2026-05-09 08:51:20', '2026-05-09 08:51:20');
INSERT INTO `sys_job_log` VALUES (1685, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:51:25', '2026-05-09 08:51:25', '2026-05-09 08:51:25');
INSERT INTO `sys_job_log` VALUES (1686, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:51:30', '2026-05-09 08:51:30', '2026-05-09 08:51:30');
INSERT INTO `sys_job_log` VALUES (1687, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:51:35', '2026-05-09 08:51:35', '2026-05-09 08:51:35');
INSERT INTO `sys_job_log` VALUES (1688, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:51:40', '2026-05-09 08:51:40', '2026-05-09 08:51:40');
INSERT INTO `sys_job_log` VALUES (1689, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:51:45', '2026-05-09 08:51:45', '2026-05-09 08:51:45');
INSERT INTO `sys_job_log` VALUES (1690, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:51:50', '2026-05-09 08:51:50', '2026-05-09 08:51:50');
INSERT INTO `sys_job_log` VALUES (1691, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:51:55', '2026-05-09 08:51:55', '2026-05-09 08:51:55');
INSERT INTO `sys_job_log` VALUES (1692, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:52:00', '2026-05-09 08:52:00', '2026-05-09 08:52:00');
INSERT INTO `sys_job_log` VALUES (1693, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:52:05', '2026-05-09 08:52:05', '2026-05-09 08:52:05');
INSERT INTO `sys_job_log` VALUES (1694, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:52:10', '2026-05-09 08:52:10', '2026-05-09 08:52:10');
INSERT INTO `sys_job_log` VALUES (1695, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:52:15', '2026-05-09 08:52:15', '2026-05-09 08:52:15');
INSERT INTO `sys_job_log` VALUES (1696, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:52:20', '2026-05-09 08:52:20', '2026-05-09 08:52:20');
INSERT INTO `sys_job_log` VALUES (1697, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:52:25', '2026-05-09 08:52:25', '2026-05-09 08:52:25');
INSERT INTO `sys_job_log` VALUES (1698, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:52:30', '2026-05-09 08:52:30', '2026-05-09 08:52:30');
INSERT INTO `sys_job_log` VALUES (1699, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:52:35', '2026-05-09 08:52:35', '2026-05-09 08:52:35');
INSERT INTO `sys_job_log` VALUES (1700, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:52:40', '2026-05-09 08:52:40', '2026-05-09 08:52:40');
INSERT INTO `sys_job_log` VALUES (1701, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:52:45', '2026-05-09 08:52:45', '2026-05-09 08:52:45');
INSERT INTO `sys_job_log` VALUES (1702, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:52:50', '2026-05-09 08:52:50', '2026-05-09 08:52:50');
INSERT INTO `sys_job_log` VALUES (1703, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:52:55', '2026-05-09 08:52:55', '2026-05-09 08:52:55');
INSERT INTO `sys_job_log` VALUES (1704, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:53:00', '2026-05-09 08:53:00', '2026-05-09 08:53:00');
INSERT INTO `sys_job_log` VALUES (1705, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:53:05', '2026-05-09 08:53:05', '2026-05-09 08:53:05');
INSERT INTO `sys_job_log` VALUES (1706, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:53:10', '2026-05-09 08:53:10', '2026-05-09 08:53:10');
INSERT INTO `sys_job_log` VALUES (1707, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:53:15', '2026-05-09 08:53:15', '2026-05-09 08:53:15');
INSERT INTO `sys_job_log` VALUES (1708, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:53:20', '2026-05-09 08:53:20', '2026-05-09 08:53:20');
INSERT INTO `sys_job_log` VALUES (1709, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:53:25', '2026-05-09 08:53:25', '2026-05-09 08:53:25');
INSERT INTO `sys_job_log` VALUES (1710, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:53:30', '2026-05-09 08:53:30', '2026-05-09 08:53:30');
INSERT INTO `sys_job_log` VALUES (1711, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:53:35', '2026-05-09 08:53:35', '2026-05-09 08:53:35');
INSERT INTO `sys_job_log` VALUES (1712, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:53:40', '2026-05-09 08:53:40', '2026-05-09 08:53:40');
INSERT INTO `sys_job_log` VALUES (1713, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:53:45', '2026-05-09 08:53:45', '2026-05-09 08:53:45');
INSERT INTO `sys_job_log` VALUES (1714, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:53:50', '2026-05-09 08:53:50', '2026-05-09 08:53:50');
INSERT INTO `sys_job_log` VALUES (1715, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:53:55', '2026-05-09 08:53:55', '2026-05-09 08:53:55');
INSERT INTO `sys_job_log` VALUES (1716, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:54:00', '2026-05-09 08:54:00', '2026-05-09 08:54:00');
INSERT INTO `sys_job_log` VALUES (1717, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:54:05', '2026-05-09 08:54:05', '2026-05-09 08:54:05');
INSERT INTO `sys_job_log` VALUES (1718, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:54:10', '2026-05-09 08:54:10', '2026-05-09 08:54:10');
INSERT INTO `sys_job_log` VALUES (1719, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:54:15', '2026-05-09 08:54:15', '2026-05-09 08:54:15');
INSERT INTO `sys_job_log` VALUES (1720, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:54:20', '2026-05-09 08:54:20', '2026-05-09 08:54:20');
INSERT INTO `sys_job_log` VALUES (1721, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:54:25', '2026-05-09 08:54:25', '2026-05-09 08:54:25');
INSERT INTO `sys_job_log` VALUES (1722, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:54:30', '2026-05-09 08:54:30', '2026-05-09 08:54:30');
INSERT INTO `sys_job_log` VALUES (1723, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:54:35', '2026-05-09 08:54:35', '2026-05-09 08:54:35');
INSERT INTO `sys_job_log` VALUES (1724, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:54:40', '2026-05-09 08:54:40', '2026-05-09 08:54:40');
INSERT INTO `sys_job_log` VALUES (1725, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:54:45', '2026-05-09 08:54:45', '2026-05-09 08:54:45');
INSERT INTO `sys_job_log` VALUES (1726, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:54:50', '2026-05-09 08:54:50', '2026-05-09 08:54:50');
INSERT INTO `sys_job_log` VALUES (1727, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:54:55', '2026-05-09 08:54:55', '2026-05-09 08:54:55');
INSERT INTO `sys_job_log` VALUES (1728, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:55:00', '2026-05-09 08:55:00', '2026-05-09 08:55:00');
INSERT INTO `sys_job_log` VALUES (1729, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:55:05', '2026-05-09 08:55:05', '2026-05-09 08:55:05');
INSERT INTO `sys_job_log` VALUES (1730, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:55:10', '2026-05-09 08:55:10', '2026-05-09 08:55:10');
INSERT INTO `sys_job_log` VALUES (1731, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:55:15', '2026-05-09 08:55:15', '2026-05-09 08:55:15');
INSERT INTO `sys_job_log` VALUES (1732, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:55:20', '2026-05-09 08:55:20', '2026-05-09 08:55:20');
INSERT INTO `sys_job_log` VALUES (1733, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:55:25', '2026-05-09 08:55:25', '2026-05-09 08:55:25');
INSERT INTO `sys_job_log` VALUES (1734, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:55:30', '2026-05-09 08:55:30', '2026-05-09 08:55:30');
INSERT INTO `sys_job_log` VALUES (1735, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:55:35', '2026-05-09 08:55:35', '2026-05-09 08:55:35');
INSERT INTO `sys_job_log` VALUES (1736, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:55:40', '2026-05-09 08:55:40', '2026-05-09 08:55:40');
INSERT INTO `sys_job_log` VALUES (1737, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:55:45', '2026-05-09 08:55:45', '2026-05-09 08:55:45');
INSERT INTO `sys_job_log` VALUES (1738, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:55:50', '2026-05-09 08:55:50', '2026-05-09 08:55:50');
INSERT INTO `sys_job_log` VALUES (1739, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:55:55', '2026-05-09 08:55:55', '2026-05-09 08:55:55');
INSERT INTO `sys_job_log` VALUES (1740, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:56:00', '2026-05-09 08:56:00', '2026-05-09 08:56:00');
INSERT INTO `sys_job_log` VALUES (1741, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:56:05', '2026-05-09 08:56:05', '2026-05-09 08:56:05');
INSERT INTO `sys_job_log` VALUES (1742, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:56:10', '2026-05-09 08:56:10', '2026-05-09 08:56:10');
INSERT INTO `sys_job_log` VALUES (1743, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:56:15', '2026-05-09 08:56:15', '2026-05-09 08:56:15');
INSERT INTO `sys_job_log` VALUES (1744, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:56:20', '2026-05-09 08:56:20', '2026-05-09 08:56:20');
INSERT INTO `sys_job_log` VALUES (1745, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:56:25', '2026-05-09 08:56:25', '2026-05-09 08:56:25');
INSERT INTO `sys_job_log` VALUES (1746, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:56:30', '2026-05-09 08:56:30', '2026-05-09 08:56:30');
INSERT INTO `sys_job_log` VALUES (1747, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:56:35', '2026-05-09 08:56:35', '2026-05-09 08:56:35');
INSERT INTO `sys_job_log` VALUES (1748, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:56:40', '2026-05-09 08:56:40', '2026-05-09 08:56:40');
INSERT INTO `sys_job_log` VALUES (1749, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:56:45', '2026-05-09 08:56:45', '2026-05-09 08:56:45');
INSERT INTO `sys_job_log` VALUES (1750, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:56:50', '2026-05-09 08:56:50', '2026-05-09 08:56:50');
INSERT INTO `sys_job_log` VALUES (1751, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:56:55', '2026-05-09 08:56:55', '2026-05-09 08:56:55');
INSERT INTO `sys_job_log` VALUES (1752, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:57:00', '2026-05-09 08:57:00', '2026-05-09 08:57:00');
INSERT INTO `sys_job_log` VALUES (1753, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:57:05', '2026-05-09 08:57:05', '2026-05-09 08:57:05');
INSERT INTO `sys_job_log` VALUES (1754, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:57:10', '2026-05-09 08:57:10', '2026-05-09 08:57:10');
INSERT INTO `sys_job_log` VALUES (1755, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:57:15', '2026-05-09 08:57:15', '2026-05-09 08:57:15');
INSERT INTO `sys_job_log` VALUES (1756, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:57:20', '2026-05-09 08:57:20', '2026-05-09 08:57:20');
INSERT INTO `sys_job_log` VALUES (1757, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:57:25', '2026-05-09 08:57:25', '2026-05-09 08:57:25');
INSERT INTO `sys_job_log` VALUES (1758, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:57:30', '2026-05-09 08:57:30', '2026-05-09 08:57:30');
INSERT INTO `sys_job_log` VALUES (1759, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:57:35', '2026-05-09 08:57:35', '2026-05-09 08:57:35');
INSERT INTO `sys_job_log` VALUES (1760, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:57:40', '2026-05-09 08:57:40', '2026-05-09 08:57:40');
INSERT INTO `sys_job_log` VALUES (1761, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:57:45', '2026-05-09 08:57:45', '2026-05-09 08:57:45');
INSERT INTO `sys_job_log` VALUES (1762, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:57:50', '2026-05-09 08:57:50', '2026-05-09 08:57:50');
INSERT INTO `sys_job_log` VALUES (1763, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:57:55', '2026-05-09 08:57:55', '2026-05-09 08:57:55');
INSERT INTO `sys_job_log` VALUES (1764, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:58:00', '2026-05-09 08:58:00', '2026-05-09 08:58:00');
INSERT INTO `sys_job_log` VALUES (1765, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:58:05', '2026-05-09 08:58:05', '2026-05-09 08:58:05');
INSERT INTO `sys_job_log` VALUES (1766, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:58:10', '2026-05-09 08:58:10', '2026-05-09 08:58:10');
INSERT INTO `sys_job_log` VALUES (1767, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:58:15', '2026-05-09 08:58:15', '2026-05-09 08:58:15');
INSERT INTO `sys_job_log` VALUES (1768, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:58:20', '2026-05-09 08:58:20', '2026-05-09 08:58:20');
INSERT INTO `sys_job_log` VALUES (1769, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:58:25', '2026-05-09 08:58:25', '2026-05-09 08:58:25');
INSERT INTO `sys_job_log` VALUES (1770, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:58:30', '2026-05-09 08:58:30', '2026-05-09 08:58:30');
INSERT INTO `sys_job_log` VALUES (1771, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:58:35', '2026-05-09 08:58:35', '2026-05-09 08:58:35');
INSERT INTO `sys_job_log` VALUES (1772, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:58:40', '2026-05-09 08:58:40', '2026-05-09 08:58:40');
INSERT INTO `sys_job_log` VALUES (1773, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:58:45', '2026-05-09 08:58:45', '2026-05-09 08:58:45');
INSERT INTO `sys_job_log` VALUES (1774, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:58:50', '2026-05-09 08:58:50', '2026-05-09 08:58:50');
INSERT INTO `sys_job_log` VALUES (1775, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:58:55', '2026-05-09 08:58:55', '2026-05-09 08:58:55');
INSERT INTO `sys_job_log` VALUES (1776, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:59:00', '2026-05-09 08:59:00', '2026-05-09 08:59:00');
INSERT INTO `sys_job_log` VALUES (1777, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:59:05', '2026-05-09 08:59:05', '2026-05-09 08:59:05');
INSERT INTO `sys_job_log` VALUES (1778, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:59:10', '2026-05-09 08:59:10', '2026-05-09 08:59:10');
INSERT INTO `sys_job_log` VALUES (1779, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:59:15', '2026-05-09 08:59:15', '2026-05-09 08:59:15');
INSERT INTO `sys_job_log` VALUES (1780, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:59:20', '2026-05-09 08:59:20', '2026-05-09 08:59:20');
INSERT INTO `sys_job_log` VALUES (1781, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:59:25', '2026-05-09 08:59:25', '2026-05-09 08:59:25');
INSERT INTO `sys_job_log` VALUES (1782, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:59:30', '2026-05-09 08:59:30', '2026-05-09 08:59:30');
INSERT INTO `sys_job_log` VALUES (1783, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:59:35', '2026-05-09 08:59:35', '2026-05-09 08:59:35');
INSERT INTO `sys_job_log` VALUES (1784, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:59:40', '2026-05-09 08:59:40', '2026-05-09 08:59:40');
INSERT INTO `sys_job_log` VALUES (1785, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:59:45', '2026-05-09 08:59:45', '2026-05-09 08:59:45');
INSERT INTO `sys_job_log` VALUES (1786, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 08:59:50', '2026-05-09 08:59:50', '2026-05-09 08:59:50');
INSERT INTO `sys_job_log` VALUES (1787, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 08:59:55', '2026-05-09 08:59:55', '2026-05-09 08:59:55');
INSERT INTO `sys_job_log` VALUES (1788, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:00:00', '2026-05-09 09:00:00', '2026-05-09 09:00:00');
INSERT INTO `sys_job_log` VALUES (1789, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:00:05', '2026-05-09 09:00:05', '2026-05-09 09:00:05');
INSERT INTO `sys_job_log` VALUES (1790, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:00:10', '2026-05-09 09:00:10', '2026-05-09 09:00:10');
INSERT INTO `sys_job_log` VALUES (1791, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:00:15', '2026-05-09 09:00:15', '2026-05-09 09:00:15');
INSERT INTO `sys_job_log` VALUES (1792, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:00:20', '2026-05-09 09:00:20', '2026-05-09 09:00:20');
INSERT INTO `sys_job_log` VALUES (1793, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:00:25', '2026-05-09 09:00:25', '2026-05-09 09:00:25');
INSERT INTO `sys_job_log` VALUES (1794, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:00:30', '2026-05-09 09:00:30', '2026-05-09 09:00:30');
INSERT INTO `sys_job_log` VALUES (1795, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:00:35', '2026-05-09 09:00:35', '2026-05-09 09:00:35');
INSERT INTO `sys_job_log` VALUES (1796, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:00:40', '2026-05-09 09:00:40', '2026-05-09 09:00:40');
INSERT INTO `sys_job_log` VALUES (1797, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:00:45', '2026-05-09 09:00:45', '2026-05-09 09:00:45');
INSERT INTO `sys_job_log` VALUES (1798, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:00:50', '2026-05-09 09:00:50', '2026-05-09 09:00:50');
INSERT INTO `sys_job_log` VALUES (1799, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:00:55', '2026-05-09 09:00:55', '2026-05-09 09:00:55');
INSERT INTO `sys_job_log` VALUES (1800, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:01:00', '2026-05-09 09:01:00', '2026-05-09 09:01:00');
INSERT INTO `sys_job_log` VALUES (1801, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:01:05', '2026-05-09 09:01:05', '2026-05-09 09:01:05');
INSERT INTO `sys_job_log` VALUES (1802, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:01:10', '2026-05-09 09:01:10', '2026-05-09 09:01:10');
INSERT INTO `sys_job_log` VALUES (1803, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:01:15', '2026-05-09 09:01:15', '2026-05-09 09:01:15');
INSERT INTO `sys_job_log` VALUES (1804, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:01:20', '2026-05-09 09:01:20', '2026-05-09 09:01:20');
INSERT INTO `sys_job_log` VALUES (1805, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:01:25', '2026-05-09 09:01:25', '2026-05-09 09:01:25');
INSERT INTO `sys_job_log` VALUES (1806, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:01:30', '2026-05-09 09:01:30', '2026-05-09 09:01:30');
INSERT INTO `sys_job_log` VALUES (1807, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:01:35', '2026-05-09 09:01:35', '2026-05-09 09:01:35');
INSERT INTO `sys_job_log` VALUES (1808, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:01:40', '2026-05-09 09:01:40', '2026-05-09 09:01:40');
INSERT INTO `sys_job_log` VALUES (1809, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:01:45', '2026-05-09 09:01:45', '2026-05-09 09:01:45');
INSERT INTO `sys_job_log` VALUES (1810, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:01:50', '2026-05-09 09:01:50', '2026-05-09 09:01:50');
INSERT INTO `sys_job_log` VALUES (1811, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:01:55', '2026-05-09 09:01:55', '2026-05-09 09:01:55');
INSERT INTO `sys_job_log` VALUES (1812, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:02:00', '2026-05-09 09:02:00', '2026-05-09 09:02:00');
INSERT INTO `sys_job_log` VALUES (1813, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:02:05', '2026-05-09 09:02:05', '2026-05-09 09:02:05');
INSERT INTO `sys_job_log` VALUES (1814, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:02:10', '2026-05-09 09:02:10', '2026-05-09 09:02:10');
INSERT INTO `sys_job_log` VALUES (1815, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:02:15', '2026-05-09 09:02:15', '2026-05-09 09:02:15');
INSERT INTO `sys_job_log` VALUES (1816, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:02:20', '2026-05-09 09:02:20', '2026-05-09 09:02:20');
INSERT INTO `sys_job_log` VALUES (1817, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:02:25', '2026-05-09 09:02:25', '2026-05-09 09:02:25');
INSERT INTO `sys_job_log` VALUES (1818, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:02:30', '2026-05-09 09:02:30', '2026-05-09 09:02:30');
INSERT INTO `sys_job_log` VALUES (1819, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:02:35', '2026-05-09 09:02:35', '2026-05-09 09:02:35');
INSERT INTO `sys_job_log` VALUES (1820, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:02:40', '2026-05-09 09:02:40', '2026-05-09 09:02:40');
INSERT INTO `sys_job_log` VALUES (1821, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:02:45', '2026-05-09 09:02:45', '2026-05-09 09:02:45');
INSERT INTO `sys_job_log` VALUES (1822, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:02:50', '2026-05-09 09:02:50', '2026-05-09 09:02:50');
INSERT INTO `sys_job_log` VALUES (1823, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:02:55', '2026-05-09 09:02:55', '2026-05-09 09:02:55');
INSERT INTO `sys_job_log` VALUES (1824, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:03:00', '2026-05-09 09:03:00', '2026-05-09 09:03:00');
INSERT INTO `sys_job_log` VALUES (1825, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:03:05', '2026-05-09 09:03:05', '2026-05-09 09:03:05');
INSERT INTO `sys_job_log` VALUES (1826, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:03:10', '2026-05-09 09:03:10', '2026-05-09 09:03:10');
INSERT INTO `sys_job_log` VALUES (1827, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:03:15', '2026-05-09 09:03:15', '2026-05-09 09:03:15');
INSERT INTO `sys_job_log` VALUES (1828, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:03:20', '2026-05-09 09:03:20', '2026-05-09 09:03:20');
INSERT INTO `sys_job_log` VALUES (1829, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:03:25', '2026-05-09 09:03:25', '2026-05-09 09:03:25');
INSERT INTO `sys_job_log` VALUES (1830, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:03:30', '2026-05-09 09:03:30', '2026-05-09 09:03:30');
INSERT INTO `sys_job_log` VALUES (1831, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:03:35', '2026-05-09 09:03:35', '2026-05-09 09:03:35');
INSERT INTO `sys_job_log` VALUES (1832, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:03:40', '2026-05-09 09:03:40', '2026-05-09 09:03:40');
INSERT INTO `sys_job_log` VALUES (1833, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:03:45', '2026-05-09 09:03:45', '2026-05-09 09:03:45');
INSERT INTO `sys_job_log` VALUES (1834, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:03:50', '2026-05-09 09:03:50', '2026-05-09 09:03:50');
INSERT INTO `sys_job_log` VALUES (1835, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:03:55', '2026-05-09 09:03:55', '2026-05-09 09:03:55');
INSERT INTO `sys_job_log` VALUES (1836, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:04:00', '2026-05-09 09:04:00', '2026-05-09 09:04:00');
INSERT INTO `sys_job_log` VALUES (1837, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:04:05', '2026-05-09 09:04:05', '2026-05-09 09:04:05');
INSERT INTO `sys_job_log` VALUES (1838, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:04:10', '2026-05-09 09:04:10', '2026-05-09 09:04:10');
INSERT INTO `sys_job_log` VALUES (1839, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:04:15', '2026-05-09 09:04:15', '2026-05-09 09:04:15');
INSERT INTO `sys_job_log` VALUES (1840, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:04:20', '2026-05-09 09:04:20', '2026-05-09 09:04:20');
INSERT INTO `sys_job_log` VALUES (1841, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:04:25', '2026-05-09 09:04:25', '2026-05-09 09:04:25');
INSERT INTO `sys_job_log` VALUES (1842, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:04:30', '2026-05-09 09:04:30', '2026-05-09 09:04:30');
INSERT INTO `sys_job_log` VALUES (1843, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:04:35', '2026-05-09 09:04:35', '2026-05-09 09:04:35');
INSERT INTO `sys_job_log` VALUES (1844, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:04:40', '2026-05-09 09:04:40', '2026-05-09 09:04:40');
INSERT INTO `sys_job_log` VALUES (1845, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:04:45', '2026-05-09 09:04:45', '2026-05-09 09:04:45');
INSERT INTO `sys_job_log` VALUES (1846, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:04:50', '2026-05-09 09:04:50', '2026-05-09 09:04:50');
INSERT INTO `sys_job_log` VALUES (1847, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:04:55', '2026-05-09 09:04:55', '2026-05-09 09:04:55');
INSERT INTO `sys_job_log` VALUES (1848, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:05:00', '2026-05-09 09:05:00', '2026-05-09 09:05:00');
INSERT INTO `sys_job_log` VALUES (1849, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:05:05', '2026-05-09 09:05:05', '2026-05-09 09:05:05');
INSERT INTO `sys_job_log` VALUES (1850, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:05:10', '2026-05-09 09:05:10', '2026-05-09 09:05:10');
INSERT INTO `sys_job_log` VALUES (1851, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:05:15', '2026-05-09 09:05:15', '2026-05-09 09:05:15');
INSERT INTO `sys_job_log` VALUES (1852, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:05:20', '2026-05-09 09:05:20', '2026-05-09 09:05:20');
INSERT INTO `sys_job_log` VALUES (1853, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:05:25', '2026-05-09 09:05:25', '2026-05-09 09:05:25');
INSERT INTO `sys_job_log` VALUES (1854, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:05:30', '2026-05-09 09:05:30', '2026-05-09 09:05:30');
INSERT INTO `sys_job_log` VALUES (1855, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:05:35', '2026-05-09 09:05:35', '2026-05-09 09:05:35');
INSERT INTO `sys_job_log` VALUES (1856, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:05:40', '2026-05-09 09:05:40', '2026-05-09 09:05:40');
INSERT INTO `sys_job_log` VALUES (1857, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:05:45', '2026-05-09 09:05:45', '2026-05-09 09:05:45');
INSERT INTO `sys_job_log` VALUES (1858, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:05:50', '2026-05-09 09:05:50', '2026-05-09 09:05:50');
INSERT INTO `sys_job_log` VALUES (1859, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:05:55', '2026-05-09 09:05:55', '2026-05-09 09:05:55');
INSERT INTO `sys_job_log` VALUES (1860, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:06:00', '2026-05-09 09:06:00', '2026-05-09 09:06:00');
INSERT INTO `sys_job_log` VALUES (1861, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:06:05', '2026-05-09 09:06:05', '2026-05-09 09:06:05');
INSERT INTO `sys_job_log` VALUES (1862, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:06:10', '2026-05-09 09:06:10', '2026-05-09 09:06:10');
INSERT INTO `sys_job_log` VALUES (1863, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:06:15', '2026-05-09 09:06:15', '2026-05-09 09:06:15');
INSERT INTO `sys_job_log` VALUES (1864, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:06:20', '2026-05-09 09:06:20', '2026-05-09 09:06:20');
INSERT INTO `sys_job_log` VALUES (1865, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:06:25', '2026-05-09 09:06:25', '2026-05-09 09:06:25');
INSERT INTO `sys_job_log` VALUES (1866, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:06:30', '2026-05-09 09:06:30', '2026-05-09 09:06:30');
INSERT INTO `sys_job_log` VALUES (1867, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:06:35', '2026-05-09 09:06:35', '2026-05-09 09:06:35');
INSERT INTO `sys_job_log` VALUES (1868, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:06:40', '2026-05-09 09:06:40', '2026-05-09 09:06:40');
INSERT INTO `sys_job_log` VALUES (1869, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:06:45', '2026-05-09 09:06:45', '2026-05-09 09:06:45');
INSERT INTO `sys_job_log` VALUES (1870, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:06:50', '2026-05-09 09:06:50', '2026-05-09 09:06:50');
INSERT INTO `sys_job_log` VALUES (1871, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:06:55', '2026-05-09 09:06:55', '2026-05-09 09:06:55');
INSERT INTO `sys_job_log` VALUES (1872, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:07:00', '2026-05-09 09:07:00', '2026-05-09 09:07:00');
INSERT INTO `sys_job_log` VALUES (1873, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:07:05', '2026-05-09 09:07:05', '2026-05-09 09:07:05');
INSERT INTO `sys_job_log` VALUES (1874, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:07:10', '2026-05-09 09:07:10', '2026-05-09 09:07:10');
INSERT INTO `sys_job_log` VALUES (1875, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:07:15', '2026-05-09 09:07:15', '2026-05-09 09:07:15');
INSERT INTO `sys_job_log` VALUES (1876, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:07:20', '2026-05-09 09:07:20', '2026-05-09 09:07:20');
INSERT INTO `sys_job_log` VALUES (1877, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:07:25', '2026-05-09 09:07:25', '2026-05-09 09:07:25');
INSERT INTO `sys_job_log` VALUES (1878, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:07:30', '2026-05-09 09:07:30', '2026-05-09 09:07:30');
INSERT INTO `sys_job_log` VALUES (1879, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:07:35', '2026-05-09 09:07:35', '2026-05-09 09:07:35');
INSERT INTO `sys_job_log` VALUES (1880, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:07:40', '2026-05-09 09:07:40', '2026-05-09 09:07:40');
INSERT INTO `sys_job_log` VALUES (1881, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:07:45', '2026-05-09 09:07:45', '2026-05-09 09:07:45');
INSERT INTO `sys_job_log` VALUES (1882, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:07:50', '2026-05-09 09:07:50', '2026-05-09 09:07:50');
INSERT INTO `sys_job_log` VALUES (1883, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:07:55', '2026-05-09 09:07:55', '2026-05-09 09:07:55');
INSERT INTO `sys_job_log` VALUES (1884, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:08:00', '2026-05-09 09:08:00', '2026-05-09 09:08:00');
INSERT INTO `sys_job_log` VALUES (1885, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:08:05', '2026-05-09 09:08:05', '2026-05-09 09:08:05');
INSERT INTO `sys_job_log` VALUES (1886, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:08:10', '2026-05-09 09:08:10', '2026-05-09 09:08:10');
INSERT INTO `sys_job_log` VALUES (1887, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:08:15', '2026-05-09 09:08:15', '2026-05-09 09:08:15');
INSERT INTO `sys_job_log` VALUES (1888, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:08:20', '2026-05-09 09:08:20', '2026-05-09 09:08:20');
INSERT INTO `sys_job_log` VALUES (1889, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:08:25', '2026-05-09 09:08:25', '2026-05-09 09:08:25');
INSERT INTO `sys_job_log` VALUES (1890, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:08:30', '2026-05-09 09:08:30', '2026-05-09 09:08:30');
INSERT INTO `sys_job_log` VALUES (1891, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:08:35', '2026-05-09 09:08:35', '2026-05-09 09:08:35');
INSERT INTO `sys_job_log` VALUES (1892, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:08:40', '2026-05-09 09:08:40', '2026-05-09 09:08:40');
INSERT INTO `sys_job_log` VALUES (1893, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:08:45', '2026-05-09 09:08:45', '2026-05-09 09:08:45');
INSERT INTO `sys_job_log` VALUES (1894, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:08:50', '2026-05-09 09:08:50', '2026-05-09 09:08:50');
INSERT INTO `sys_job_log` VALUES (1895, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:08:55', '2026-05-09 09:08:55', '2026-05-09 09:08:55');
INSERT INTO `sys_job_log` VALUES (1896, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:09:00', '2026-05-09 09:09:00', '2026-05-09 09:09:00');
INSERT INTO `sys_job_log` VALUES (1897, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:09:05', '2026-05-09 09:09:05', '2026-05-09 09:09:05');
INSERT INTO `sys_job_log` VALUES (1898, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:09:10', '2026-05-09 09:09:10', '2026-05-09 09:09:10');
INSERT INTO `sys_job_log` VALUES (1899, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:09:15', '2026-05-09 09:09:15', '2026-05-09 09:09:15');
INSERT INTO `sys_job_log` VALUES (1900, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:09:20', '2026-05-09 09:09:20', '2026-05-09 09:09:20');
INSERT INTO `sys_job_log` VALUES (1901, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:09:25', '2026-05-09 09:09:25', '2026-05-09 09:09:25');
INSERT INTO `sys_job_log` VALUES (1902, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:09:30', '2026-05-09 09:09:30', '2026-05-09 09:09:30');
INSERT INTO `sys_job_log` VALUES (1903, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:09:35', '2026-05-09 09:09:35', '2026-05-09 09:09:35');
INSERT INTO `sys_job_log` VALUES (1904, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:09:40', '2026-05-09 09:09:40', '2026-05-09 09:09:40');
INSERT INTO `sys_job_log` VALUES (1905, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:09:45', '2026-05-09 09:09:45', '2026-05-09 09:09:45');
INSERT INTO `sys_job_log` VALUES (1906, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:09:50', '2026-05-09 09:09:50', '2026-05-09 09:09:50');
INSERT INTO `sys_job_log` VALUES (1907, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:09:55', '2026-05-09 09:09:55', '2026-05-09 09:09:55');
INSERT INTO `sys_job_log` VALUES (1908, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:10:00', '2026-05-09 09:10:00', '2026-05-09 09:10:00');
INSERT INTO `sys_job_log` VALUES (1909, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:10:05', '2026-05-09 09:10:05', '2026-05-09 09:10:05');
INSERT INTO `sys_job_log` VALUES (1910, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:10:10', '2026-05-09 09:10:10', '2026-05-09 09:10:10');
INSERT INTO `sys_job_log` VALUES (1911, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:10:15', '2026-05-09 09:10:15', '2026-05-09 09:10:15');
INSERT INTO `sys_job_log` VALUES (1912, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:10:20', '2026-05-09 09:10:20', '2026-05-09 09:10:20');
INSERT INTO `sys_job_log` VALUES (1913, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:10:25', '2026-05-09 09:10:25', '2026-05-09 09:10:25');
INSERT INTO `sys_job_log` VALUES (1914, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:10:30', '2026-05-09 09:10:30', '2026-05-09 09:10:30');
INSERT INTO `sys_job_log` VALUES (1915, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:10:35', '2026-05-09 09:10:35', '2026-05-09 09:10:35');
INSERT INTO `sys_job_log` VALUES (1916, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:10:40', '2026-05-09 09:10:40', '2026-05-09 09:10:40');
INSERT INTO `sys_job_log` VALUES (1917, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:10:45', '2026-05-09 09:10:45', '2026-05-09 09:10:45');
INSERT INTO `sys_job_log` VALUES (1918, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:10:50', '2026-05-09 09:10:50', '2026-05-09 09:10:50');
INSERT INTO `sys_job_log` VALUES (1919, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:10:55', '2026-05-09 09:10:55', '2026-05-09 09:10:55');
INSERT INTO `sys_job_log` VALUES (1920, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:11:00', '2026-05-09 09:11:00', '2026-05-09 09:11:00');
INSERT INTO `sys_job_log` VALUES (1921, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:11:05', '2026-05-09 09:11:05', '2026-05-09 09:11:05');
INSERT INTO `sys_job_log` VALUES (1922, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:11:10', '2026-05-09 09:11:10', '2026-05-09 09:11:10');
INSERT INTO `sys_job_log` VALUES (1923, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:11:15', '2026-05-09 09:11:15', '2026-05-09 09:11:15');
INSERT INTO `sys_job_log` VALUES (1924, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:11:20', '2026-05-09 09:11:20', '2026-05-09 09:11:20');
INSERT INTO `sys_job_log` VALUES (1925, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:11:25', '2026-05-09 09:11:25', '2026-05-09 09:11:25');
INSERT INTO `sys_job_log` VALUES (1926, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:11:30', '2026-05-09 09:11:30', '2026-05-09 09:11:30');
INSERT INTO `sys_job_log` VALUES (1927, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:11:35', '2026-05-09 09:11:35', '2026-05-09 09:11:35');
INSERT INTO `sys_job_log` VALUES (1928, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:11:40', '2026-05-09 09:11:40', '2026-05-09 09:11:40');
INSERT INTO `sys_job_log` VALUES (1929, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:11:45', '2026-05-09 09:11:45', '2026-05-09 09:11:45');
INSERT INTO `sys_job_log` VALUES (1930, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:11:50', '2026-05-09 09:11:50', '2026-05-09 09:11:50');
INSERT INTO `sys_job_log` VALUES (1931, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:11:55', '2026-05-09 09:11:55', '2026-05-09 09:11:55');
INSERT INTO `sys_job_log` VALUES (1932, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:12:00', '2026-05-09 09:12:00', '2026-05-09 09:12:00');
INSERT INTO `sys_job_log` VALUES (1933, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:12:05', '2026-05-09 09:12:05', '2026-05-09 09:12:05');
INSERT INTO `sys_job_log` VALUES (1934, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:12:10', '2026-05-09 09:12:10', '2026-05-09 09:12:10');
INSERT INTO `sys_job_log` VALUES (1935, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:12:15', '2026-05-09 09:12:15', '2026-05-09 09:12:15');
INSERT INTO `sys_job_log` VALUES (1936, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:12:20', '2026-05-09 09:12:20', '2026-05-09 09:12:20');
INSERT INTO `sys_job_log` VALUES (1937, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:12:25', '2026-05-09 09:12:25', '2026-05-09 09:12:25');
INSERT INTO `sys_job_log` VALUES (1938, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:12:30', '2026-05-09 09:12:30', '2026-05-09 09:12:30');
INSERT INTO `sys_job_log` VALUES (1939, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:12:35', '2026-05-09 09:12:35', '2026-05-09 09:12:35');
INSERT INTO `sys_job_log` VALUES (1940, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:12:40', '2026-05-09 09:12:40', '2026-05-09 09:12:40');
INSERT INTO `sys_job_log` VALUES (1941, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:12:45', '2026-05-09 09:12:45', '2026-05-09 09:12:45');
INSERT INTO `sys_job_log` VALUES (1942, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:12:50', '2026-05-09 09:12:50', '2026-05-09 09:12:50');
INSERT INTO `sys_job_log` VALUES (1943, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:12:55', '2026-05-09 09:12:55', '2026-05-09 09:12:55');
INSERT INTO `sys_job_log` VALUES (1944, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:13:00', '2026-05-09 09:13:00', '2026-05-09 09:13:00');
INSERT INTO `sys_job_log` VALUES (1945, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:13:05', '2026-05-09 09:13:05', '2026-05-09 09:13:05');
INSERT INTO `sys_job_log` VALUES (1946, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:13:10', '2026-05-09 09:13:10', '2026-05-09 09:13:10');
INSERT INTO `sys_job_log` VALUES (1947, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:13:15', '2026-05-09 09:13:15', '2026-05-09 09:13:15');
INSERT INTO `sys_job_log` VALUES (1948, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:13:20', '2026-05-09 09:13:20', '2026-05-09 09:13:20');
INSERT INTO `sys_job_log` VALUES (1949, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:13:25', '2026-05-09 09:13:25', '2026-05-09 09:13:25');
INSERT INTO `sys_job_log` VALUES (1950, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:13:30', '2026-05-09 09:13:30', '2026-05-09 09:13:30');
INSERT INTO `sys_job_log` VALUES (1951, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:13:35', '2026-05-09 09:13:35', '2026-05-09 09:13:35');
INSERT INTO `sys_job_log` VALUES (1952, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:13:40', '2026-05-09 09:13:40', '2026-05-09 09:13:40');
INSERT INTO `sys_job_log` VALUES (1953, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:13:45', '2026-05-09 09:13:45', '2026-05-09 09:13:45');
INSERT INTO `sys_job_log` VALUES (1954, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:13:50', '2026-05-09 09:13:50', '2026-05-09 09:13:50');
INSERT INTO `sys_job_log` VALUES (1955, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:13:55', '2026-05-09 09:13:55', '2026-05-09 09:13:55');
INSERT INTO `sys_job_log` VALUES (1956, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:14:00', '2026-05-09 09:14:00', '2026-05-09 09:14:00');
INSERT INTO `sys_job_log` VALUES (1957, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:14:05', '2026-05-09 09:14:05', '2026-05-09 09:14:05');
INSERT INTO `sys_job_log` VALUES (1958, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:14:10', '2026-05-09 09:14:10', '2026-05-09 09:14:10');
INSERT INTO `sys_job_log` VALUES (1959, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:14:15', '2026-05-09 09:14:15', '2026-05-09 09:14:15');
INSERT INTO `sys_job_log` VALUES (1960, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:14:20', '2026-05-09 09:14:20', '2026-05-09 09:14:20');
INSERT INTO `sys_job_log` VALUES (1961, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:14:25', '2026-05-09 09:14:25', '2026-05-09 09:14:25');
INSERT INTO `sys_job_log` VALUES (1962, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:14:30', '2026-05-09 09:14:30', '2026-05-09 09:14:30');
INSERT INTO `sys_job_log` VALUES (1963, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:14:35', '2026-05-09 09:14:35', '2026-05-09 09:14:35');
INSERT INTO `sys_job_log` VALUES (1964, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:14:40', '2026-05-09 09:14:40', '2026-05-09 09:14:40');
INSERT INTO `sys_job_log` VALUES (1965, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:14:45', '2026-05-09 09:14:45', '2026-05-09 09:14:45');
INSERT INTO `sys_job_log` VALUES (1966, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:14:50', '2026-05-09 09:14:50', '2026-05-09 09:14:50');
INSERT INTO `sys_job_log` VALUES (1967, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:14:55', '2026-05-09 09:14:55', '2026-05-09 09:14:55');
INSERT INTO `sys_job_log` VALUES (1968, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:15:00', '2026-05-09 09:15:00', '2026-05-09 09:15:00');
INSERT INTO `sys_job_log` VALUES (1969, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:15:05', '2026-05-09 09:15:05', '2026-05-09 09:15:05');
INSERT INTO `sys_job_log` VALUES (1970, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:15:10', '2026-05-09 09:15:10', '2026-05-09 09:15:10');
INSERT INTO `sys_job_log` VALUES (1971, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:15:15', '2026-05-09 09:15:15', '2026-05-09 09:15:15');
INSERT INTO `sys_job_log` VALUES (1972, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:15:20', '2026-05-09 09:15:20', '2026-05-09 09:15:20');
INSERT INTO `sys_job_log` VALUES (1973, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:15:25', '2026-05-09 09:15:25', '2026-05-09 09:15:25');
INSERT INTO `sys_job_log` VALUES (1974, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:15:30', '2026-05-09 09:15:30', '2026-05-09 09:15:30');
INSERT INTO `sys_job_log` VALUES (1975, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:15:35', '2026-05-09 09:15:35', '2026-05-09 09:15:35');
INSERT INTO `sys_job_log` VALUES (1976, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:15:40', '2026-05-09 09:15:40', '2026-05-09 09:15:40');
INSERT INTO `sys_job_log` VALUES (1977, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:15:45', '2026-05-09 09:15:45', '2026-05-09 09:15:45');
INSERT INTO `sys_job_log` VALUES (1978, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:15:50', '2026-05-09 09:15:50', '2026-05-09 09:15:50');
INSERT INTO `sys_job_log` VALUES (1979, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:15:55', '2026-05-09 09:15:55', '2026-05-09 09:15:55');
INSERT INTO `sys_job_log` VALUES (1980, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:16:00', '2026-05-09 09:16:00', '2026-05-09 09:16:00');
INSERT INTO `sys_job_log` VALUES (1981, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:16:05', '2026-05-09 09:16:05', '2026-05-09 09:16:05');
INSERT INTO `sys_job_log` VALUES (1982, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:16:10', '2026-05-09 09:16:10', '2026-05-09 09:16:10');
INSERT INTO `sys_job_log` VALUES (1983, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:16:15', '2026-05-09 09:16:15', '2026-05-09 09:16:15');
INSERT INTO `sys_job_log` VALUES (1984, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:16:20', '2026-05-09 09:16:20', '2026-05-09 09:16:20');
INSERT INTO `sys_job_log` VALUES (1985, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:16:25', '2026-05-09 09:16:25', '2026-05-09 09:16:25');
INSERT INTO `sys_job_log` VALUES (1986, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:16:30', '2026-05-09 09:16:30', '2026-05-09 09:16:30');
INSERT INTO `sys_job_log` VALUES (1987, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:16:35', '2026-05-09 09:16:35', '2026-05-09 09:16:35');
INSERT INTO `sys_job_log` VALUES (1988, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:16:40', '2026-05-09 09:16:40', '2026-05-09 09:16:40');
INSERT INTO `sys_job_log` VALUES (1989, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:16:45', '2026-05-09 09:16:45', '2026-05-09 09:16:45');
INSERT INTO `sys_job_log` VALUES (1990, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:16:50', '2026-05-09 09:16:50', '2026-05-09 09:16:50');
INSERT INTO `sys_job_log` VALUES (1991, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:16:55', '2026-05-09 09:16:55', '2026-05-09 09:16:55');
INSERT INTO `sys_job_log` VALUES (1992, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:17:00', '2026-05-09 09:17:00', '2026-05-09 09:17:00');
INSERT INTO `sys_job_log` VALUES (1993, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:17:05', '2026-05-09 09:17:05', '2026-05-09 09:17:05');
INSERT INTO `sys_job_log` VALUES (1994, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:17:10', '2026-05-09 09:17:10', '2026-05-09 09:17:10');
INSERT INTO `sys_job_log` VALUES (1995, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:17:15', '2026-05-09 09:17:15', '2026-05-09 09:17:15');
INSERT INTO `sys_job_log` VALUES (1996, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:17:20', '2026-05-09 09:17:20', '2026-05-09 09:17:20');
INSERT INTO `sys_job_log` VALUES (1997, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:17:25', '2026-05-09 09:17:25', '2026-05-09 09:17:25');
INSERT INTO `sys_job_log` VALUES (1998, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:17:30', '2026-05-09 09:17:30', '2026-05-09 09:17:30');
INSERT INTO `sys_job_log` VALUES (1999, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:17:35', '2026-05-09 09:17:35', '2026-05-09 09:17:35');
INSERT INTO `sys_job_log` VALUES (2000, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:17:40', '2026-05-09 09:17:40', '2026-05-09 09:17:40');
INSERT INTO `sys_job_log` VALUES (2001, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:17:45', '2026-05-09 09:17:45', '2026-05-09 09:17:45');
INSERT INTO `sys_job_log` VALUES (2002, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:17:50', '2026-05-09 09:17:50', '2026-05-09 09:17:50');
INSERT INTO `sys_job_log` VALUES (2003, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:17:55', '2026-05-09 09:17:55', '2026-05-09 09:17:55');
INSERT INTO `sys_job_log` VALUES (2004, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:18:00', '2026-05-09 09:18:00', '2026-05-09 09:18:00');
INSERT INTO `sys_job_log` VALUES (2005, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:18:05', '2026-05-09 09:18:05', '2026-05-09 09:18:05');
INSERT INTO `sys_job_log` VALUES (2006, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:18:10', '2026-05-09 09:18:10', '2026-05-09 09:18:10');
INSERT INTO `sys_job_log` VALUES (2007, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:18:15', '2026-05-09 09:18:15', '2026-05-09 09:18:15');
INSERT INTO `sys_job_log` VALUES (2008, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:18:20', '2026-05-09 09:18:20', '2026-05-09 09:18:20');
INSERT INTO `sys_job_log` VALUES (2009, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:18:25', '2026-05-09 09:18:25', '2026-05-09 09:18:25');
INSERT INTO `sys_job_log` VALUES (2010, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:18:30', '2026-05-09 09:18:30', '2026-05-09 09:18:30');
INSERT INTO `sys_job_log` VALUES (2011, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:18:35', '2026-05-09 09:18:35', '2026-05-09 09:18:35');
INSERT INTO `sys_job_log` VALUES (2012, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:18:40', '2026-05-09 09:18:40', '2026-05-09 09:18:40');
INSERT INTO `sys_job_log` VALUES (2013, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:18:45', '2026-05-09 09:18:45', '2026-05-09 09:18:45');
INSERT INTO `sys_job_log` VALUES (2014, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:18:50', '2026-05-09 09:18:50', '2026-05-09 09:18:50');
INSERT INTO `sys_job_log` VALUES (2015, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:18:55', '2026-05-09 09:18:55', '2026-05-09 09:18:55');
INSERT INTO `sys_job_log` VALUES (2016, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:19:00', '2026-05-09 09:19:00', '2026-05-09 09:19:00');
INSERT INTO `sys_job_log` VALUES (2017, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:19:05', '2026-05-09 09:19:05', '2026-05-09 09:19:05');
INSERT INTO `sys_job_log` VALUES (2018, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:19:10', '2026-05-09 09:19:10', '2026-05-09 09:19:10');
INSERT INTO `sys_job_log` VALUES (2019, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:19:15', '2026-05-09 09:19:15', '2026-05-09 09:19:15');
INSERT INTO `sys_job_log` VALUES (2020, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:19:20', '2026-05-09 09:19:20', '2026-05-09 09:19:20');
INSERT INTO `sys_job_log` VALUES (2021, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:19:25', '2026-05-09 09:19:25', '2026-05-09 09:19:25');
INSERT INTO `sys_job_log` VALUES (2022, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:19:30', '2026-05-09 09:19:30', '2026-05-09 09:19:30');
INSERT INTO `sys_job_log` VALUES (2023, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:19:35', '2026-05-09 09:19:35', '2026-05-09 09:19:35');
INSERT INTO `sys_job_log` VALUES (2024, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:19:40', '2026-05-09 09:19:40', '2026-05-09 09:19:40');
INSERT INTO `sys_job_log` VALUES (2025, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:19:45', '2026-05-09 09:19:45', '2026-05-09 09:19:45');
INSERT INTO `sys_job_log` VALUES (2026, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:19:50', '2026-05-09 09:19:50', '2026-05-09 09:19:50');
INSERT INTO `sys_job_log` VALUES (2027, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:19:55', '2026-05-09 09:19:55', '2026-05-09 09:19:55');
INSERT INTO `sys_job_log` VALUES (2028, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:20:00', '2026-05-09 09:20:00', '2026-05-09 09:20:00');
INSERT INTO `sys_job_log` VALUES (2029, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:20:05', '2026-05-09 09:20:05', '2026-05-09 09:20:05');
INSERT INTO `sys_job_log` VALUES (2030, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:20:10', '2026-05-09 09:20:10', '2026-05-09 09:20:10');
INSERT INTO `sys_job_log` VALUES (2031, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:20:15', '2026-05-09 09:20:15', '2026-05-09 09:20:15');
INSERT INTO `sys_job_log` VALUES (2032, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:20:20', '2026-05-09 09:20:20', '2026-05-09 09:20:20');
INSERT INTO `sys_job_log` VALUES (2033, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:20:25', '2026-05-09 09:20:25', '2026-05-09 09:20:25');
INSERT INTO `sys_job_log` VALUES (2034, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:20:30', '2026-05-09 09:20:30', '2026-05-09 09:20:30');
INSERT INTO `sys_job_log` VALUES (2035, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:20:35', '2026-05-09 09:20:35', '2026-05-09 09:20:35');
INSERT INTO `sys_job_log` VALUES (2036, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:20:40', '2026-05-09 09:20:40', '2026-05-09 09:20:40');
INSERT INTO `sys_job_log` VALUES (2037, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:20:45', '2026-05-09 09:20:45', '2026-05-09 09:20:45');
INSERT INTO `sys_job_log` VALUES (2038, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:20:50', '2026-05-09 09:20:50', '2026-05-09 09:20:50');
INSERT INTO `sys_job_log` VALUES (2039, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:20:55', '2026-05-09 09:20:55', '2026-05-09 09:20:55');
INSERT INTO `sys_job_log` VALUES (2040, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:21:00', '2026-05-09 09:21:00', '2026-05-09 09:21:00');
INSERT INTO `sys_job_log` VALUES (2041, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:21:05', '2026-05-09 09:21:05', '2026-05-09 09:21:05');
INSERT INTO `sys_job_log` VALUES (2042, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:21:10', '2026-05-09 09:21:10', '2026-05-09 09:21:10');
INSERT INTO `sys_job_log` VALUES (2043, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:21:15', '2026-05-09 09:21:15', '2026-05-09 09:21:15');
INSERT INTO `sys_job_log` VALUES (2044, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:21:20', '2026-05-09 09:21:20', '2026-05-09 09:21:20');
INSERT INTO `sys_job_log` VALUES (2045, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:21:25', '2026-05-09 09:21:25', '2026-05-09 09:21:25');
INSERT INTO `sys_job_log` VALUES (2046, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:21:30', '2026-05-09 09:21:30', '2026-05-09 09:21:30');
INSERT INTO `sys_job_log` VALUES (2047, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:21:35', '2026-05-09 09:21:35', '2026-05-09 09:21:35');
INSERT INTO `sys_job_log` VALUES (2048, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:21:40', '2026-05-09 09:21:40', '2026-05-09 09:21:40');
INSERT INTO `sys_job_log` VALUES (2049, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:21:45', '2026-05-09 09:21:45', '2026-05-09 09:21:45');
INSERT INTO `sys_job_log` VALUES (2050, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:21:50', '2026-05-09 09:21:50', '2026-05-09 09:21:50');
INSERT INTO `sys_job_log` VALUES (2051, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:21:55', '2026-05-09 09:21:55', '2026-05-09 09:21:55');
INSERT INTO `sys_job_log` VALUES (2052, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:22:00', '2026-05-09 09:22:00', '2026-05-09 09:22:00');
INSERT INTO `sys_job_log` VALUES (2053, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:22:05', '2026-05-09 09:22:05', '2026-05-09 09:22:05');
INSERT INTO `sys_job_log` VALUES (2054, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:22:10', '2026-05-09 09:22:10', '2026-05-09 09:22:10');
INSERT INTO `sys_job_log` VALUES (2055, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:22:15', '2026-05-09 09:22:15', '2026-05-09 09:22:15');
INSERT INTO `sys_job_log` VALUES (2056, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:22:20', '2026-05-09 09:22:20', '2026-05-09 09:22:20');
INSERT INTO `sys_job_log` VALUES (2057, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:22:25', '2026-05-09 09:22:25', '2026-05-09 09:22:25');
INSERT INTO `sys_job_log` VALUES (2058, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:22:30', '2026-05-09 09:22:30', '2026-05-09 09:22:30');
INSERT INTO `sys_job_log` VALUES (2059, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:22:35', '2026-05-09 09:22:35', '2026-05-09 09:22:35');
INSERT INTO `sys_job_log` VALUES (2060, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:22:40', '2026-05-09 09:22:40', '2026-05-09 09:22:40');
INSERT INTO `sys_job_log` VALUES (2061, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:22:45', '2026-05-09 09:22:45', '2026-05-09 09:22:45');
INSERT INTO `sys_job_log` VALUES (2062, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:22:50', '2026-05-09 09:22:50', '2026-05-09 09:22:50');
INSERT INTO `sys_job_log` VALUES (2063, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:22:55', '2026-05-09 09:22:55', '2026-05-09 09:22:55');
INSERT INTO `sys_job_log` VALUES (2064, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:23:00', '2026-05-09 09:23:00', '2026-05-09 09:23:00');
INSERT INTO `sys_job_log` VALUES (2065, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:23:05', '2026-05-09 09:23:05', '2026-05-09 09:23:05');
INSERT INTO `sys_job_log` VALUES (2066, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-09 09:24:15', '2026-05-09 09:24:15', '2026-05-09 09:24:15');
INSERT INTO `sys_job_log` VALUES (2067, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:24:20', '2026-05-09 09:24:20', '2026-05-09 09:24:20');
INSERT INTO `sys_job_log` VALUES (2068, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:24:25', '2026-05-09 09:24:25', '2026-05-09 09:24:25');
INSERT INTO `sys_job_log` VALUES (2069, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:24:30', '2026-05-09 09:24:30', '2026-05-09 09:24:30');
INSERT INTO `sys_job_log` VALUES (2070, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:24:35', '2026-05-09 09:24:35', '2026-05-09 09:24:35');
INSERT INTO `sys_job_log` VALUES (2071, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:24:40', '2026-05-09 09:24:40', '2026-05-09 09:24:40');
INSERT INTO `sys_job_log` VALUES (2072, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:24:45', '2026-05-09 09:24:45', '2026-05-09 09:24:45');
INSERT INTO `sys_job_log` VALUES (2073, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:25:10', '2026-05-09 09:25:10', '2026-05-09 09:25:10');
INSERT INTO `sys_job_log` VALUES (2074, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:25:15', '2026-05-09 09:25:15', '2026-05-09 09:25:15');
INSERT INTO `sys_job_log` VALUES (2075, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:25:20', '2026-05-09 09:25:20', '2026-05-09 09:25:20');
INSERT INTO `sys_job_log` VALUES (2076, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:25:25', '2026-05-09 09:25:25', '2026-05-09 09:25:25');
INSERT INTO `sys_job_log` VALUES (2077, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:25:30', '2026-05-09 09:25:30', '2026-05-09 09:25:30');
INSERT INTO `sys_job_log` VALUES (2078, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:25:35', '2026-05-09 09:25:35', '2026-05-09 09:25:35');
INSERT INTO `sys_job_log` VALUES (2079, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:25:40', '2026-05-09 09:25:40', '2026-05-09 09:25:40');
INSERT INTO `sys_job_log` VALUES (2080, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:25:45', '2026-05-09 09:25:45', '2026-05-09 09:25:45');
INSERT INTO `sys_job_log` VALUES (2081, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:25:50', '2026-05-09 09:25:50', '2026-05-09 09:25:50');
INSERT INTO `sys_job_log` VALUES (2082, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:25:55', '2026-05-09 09:25:55', '2026-05-09 09:25:55');
INSERT INTO `sys_job_log` VALUES (2083, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:26:00', '2026-05-09 09:26:00', '2026-05-09 09:26:00');
INSERT INTO `sys_job_log` VALUES (2084, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:26:05', '2026-05-09 09:26:05', '2026-05-09 09:26:05');
INSERT INTO `sys_job_log` VALUES (2085, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:26:10', '2026-05-09 09:26:10', '2026-05-09 09:26:10');
INSERT INTO `sys_job_log` VALUES (2086, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:26:15', '2026-05-09 09:26:15', '2026-05-09 09:26:15');
INSERT INTO `sys_job_log` VALUES (2087, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:26:20', '2026-05-09 09:26:20', '2026-05-09 09:26:20');
INSERT INTO `sys_job_log` VALUES (2088, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:26:25', '2026-05-09 09:26:25', '2026-05-09 09:26:25');
INSERT INTO `sys_job_log` VALUES (2089, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:26:30', '2026-05-09 09:26:30', '2026-05-09 09:26:30');
INSERT INTO `sys_job_log` VALUES (2090, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:26:35', '2026-05-09 09:26:35', '2026-05-09 09:26:35');
INSERT INTO `sys_job_log` VALUES (2091, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:26:46', '2026-05-09 09:26:46', '2026-05-09 09:26:46');
INSERT INTO `sys_job_log` VALUES (2092, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:26:50', '2026-05-09 09:26:50', '2026-05-09 09:26:50');
INSERT INTO `sys_job_log` VALUES (2093, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:26:55', '2026-05-09 09:26:55', '2026-05-09 09:26:55');
INSERT INTO `sys_job_log` VALUES (2094, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:27:00', '2026-05-09 09:27:00', '2026-05-09 09:27:00');
INSERT INTO `sys_job_log` VALUES (2095, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:27:05', '2026-05-09 09:27:05', '2026-05-09 09:27:05');
INSERT INTO `sys_job_log` VALUES (2096, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:27:10', '2026-05-09 09:27:10', '2026-05-09 09:27:10');
INSERT INTO `sys_job_log` VALUES (2097, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:27:15', '2026-05-09 09:27:15', '2026-05-09 09:27:15');
INSERT INTO `sys_job_log` VALUES (2098, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:27:20', '2026-05-09 09:27:20', '2026-05-09 09:27:20');
INSERT INTO `sys_job_log` VALUES (2099, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:27:25', '2026-05-09 09:27:25', '2026-05-09 09:27:25');
INSERT INTO `sys_job_log` VALUES (2100, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:27:30', '2026-05-09 09:27:30', '2026-05-09 09:27:30');
INSERT INTO `sys_job_log` VALUES (2101, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:27:35', '2026-05-09 09:27:35', '2026-05-09 09:27:35');
INSERT INTO `sys_job_log` VALUES (2102, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:27:40', '2026-05-09 09:27:40', '2026-05-09 09:27:40');
INSERT INTO `sys_job_log` VALUES (2103, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:27:45', '2026-05-09 09:27:45', '2026-05-09 09:27:45');
INSERT INTO `sys_job_log` VALUES (2104, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:27:50', '2026-05-09 09:27:50', '2026-05-09 09:27:50');
INSERT INTO `sys_job_log` VALUES (2105, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:27:55', '2026-05-09 09:27:55', '2026-05-09 09:27:55');
INSERT INTO `sys_job_log` VALUES (2106, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:28:00', '2026-05-09 09:28:00', '2026-05-09 09:28:00');
INSERT INTO `sys_job_log` VALUES (2107, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:28:05', '2026-05-09 09:28:05', '2026-05-09 09:28:05');
INSERT INTO `sys_job_log` VALUES (2108, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:28:10', '2026-05-09 09:28:10', '2026-05-09 09:28:10');
INSERT INTO `sys_job_log` VALUES (2109, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:28:15', '2026-05-09 09:28:15', '2026-05-09 09:28:15');
INSERT INTO `sys_job_log` VALUES (2110, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:28:20', '2026-05-09 09:28:20', '2026-05-09 09:28:20');
INSERT INTO `sys_job_log` VALUES (2111, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:28:25', '2026-05-09 09:28:25', '2026-05-09 09:28:25');
INSERT INTO `sys_job_log` VALUES (2112, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:28:30', '2026-05-09 09:28:30', '2026-05-09 09:28:30');
INSERT INTO `sys_job_log` VALUES (2113, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:28:35', '2026-05-09 09:28:35', '2026-05-09 09:28:35');
INSERT INTO `sys_job_log` VALUES (2114, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:28:40', '2026-05-09 09:28:40', '2026-05-09 09:28:40');
INSERT INTO `sys_job_log` VALUES (2115, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:28:45', '2026-05-09 09:28:45', '2026-05-09 09:28:45');
INSERT INTO `sys_job_log` VALUES (2116, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:28:50', '2026-05-09 09:28:50', '2026-05-09 09:28:50');
INSERT INTO `sys_job_log` VALUES (2117, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:28:55', '2026-05-09 09:28:55', '2026-05-09 09:28:55');
INSERT INTO `sys_job_log` VALUES (2118, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:29:00', '2026-05-09 09:29:00', '2026-05-09 09:29:00');
INSERT INTO `sys_job_log` VALUES (2119, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:29:05', '2026-05-09 09:29:05', '2026-05-09 09:29:05');
INSERT INTO `sys_job_log` VALUES (2120, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:29:10', '2026-05-09 09:29:10', '2026-05-09 09:29:10');
INSERT INTO `sys_job_log` VALUES (2121, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:29:15', '2026-05-09 09:29:15', '2026-05-09 09:29:15');
INSERT INTO `sys_job_log` VALUES (2122, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:29:20', '2026-05-09 09:29:20', '2026-05-09 09:29:20');
INSERT INTO `sys_job_log` VALUES (2123, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:29:25', '2026-05-09 09:29:25', '2026-05-09 09:29:25');
INSERT INTO `sys_job_log` VALUES (2124, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:29:30', '2026-05-09 09:29:30', '2026-05-09 09:29:30');
INSERT INTO `sys_job_log` VALUES (2125, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:29:35', '2026-05-09 09:29:35', '2026-05-09 09:29:35');
INSERT INTO `sys_job_log` VALUES (2126, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:29:40', '2026-05-09 09:29:40', '2026-05-09 09:29:40');
INSERT INTO `sys_job_log` VALUES (2127, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:29:45', '2026-05-09 09:29:45', '2026-05-09 09:29:45');
INSERT INTO `sys_job_log` VALUES (2128, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:29:50', '2026-05-09 09:29:50', '2026-05-09 09:29:50');
INSERT INTO `sys_job_log` VALUES (2129, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:29:55', '2026-05-09 09:29:55', '2026-05-09 09:29:55');
INSERT INTO `sys_job_log` VALUES (2130, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:30:00', '2026-05-09 09:30:00', '2026-05-09 09:30:00');
INSERT INTO `sys_job_log` VALUES (2131, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:30:05', '2026-05-09 09:30:05', '2026-05-09 09:30:05');
INSERT INTO `sys_job_log` VALUES (2132, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:30:10', '2026-05-09 09:30:10', '2026-05-09 09:30:10');
INSERT INTO `sys_job_log` VALUES (2133, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:30:15', '2026-05-09 09:30:15', '2026-05-09 09:30:15');
INSERT INTO `sys_job_log` VALUES (2134, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:30:20', '2026-05-09 09:30:20', '2026-05-09 09:30:20');
INSERT INTO `sys_job_log` VALUES (2135, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:30:25', '2026-05-09 09:30:25', '2026-05-09 09:30:25');
INSERT INTO `sys_job_log` VALUES (2136, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:30:45', '2026-05-09 09:30:45', '2026-05-09 09:30:45');
INSERT INTO `sys_job_log` VALUES (2137, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:30:50', '2026-05-09 09:30:50', '2026-05-09 09:30:50');
INSERT INTO `sys_job_log` VALUES (2138, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:30:55', '2026-05-09 09:30:55', '2026-05-09 09:30:55');
INSERT INTO `sys_job_log` VALUES (2139, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:31:00', '2026-05-09 09:31:00', '2026-05-09 09:31:00');
INSERT INTO `sys_job_log` VALUES (2140, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:31:05', '2026-05-09 09:31:05', '2026-05-09 09:31:05');
INSERT INTO `sys_job_log` VALUES (2141, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:31:10', '2026-05-09 09:31:10', '2026-05-09 09:31:10');
INSERT INTO `sys_job_log` VALUES (2142, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:31:15', '2026-05-09 09:31:15', '2026-05-09 09:31:15');
INSERT INTO `sys_job_log` VALUES (2143, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:31:20', '2026-05-09 09:31:20', '2026-05-09 09:31:20');
INSERT INTO `sys_job_log` VALUES (2144, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:31:25', '2026-05-09 09:31:25', '2026-05-09 09:31:25');
INSERT INTO `sys_job_log` VALUES (2145, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:31:30', '2026-05-09 09:31:30', '2026-05-09 09:31:30');
INSERT INTO `sys_job_log` VALUES (2146, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:31:35', '2026-05-09 09:31:35', '2026-05-09 09:31:35');
INSERT INTO `sys_job_log` VALUES (2147, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:31:40', '2026-05-09 09:31:40', '2026-05-09 09:31:40');
INSERT INTO `sys_job_log` VALUES (2148, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:31:45', '2026-05-09 09:31:45', '2026-05-09 09:31:45');
INSERT INTO `sys_job_log` VALUES (2149, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:31:50', '2026-05-09 09:31:50', '2026-05-09 09:31:50');
INSERT INTO `sys_job_log` VALUES (2150, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:31:55', '2026-05-09 09:31:55', '2026-05-09 09:31:55');
INSERT INTO `sys_job_log` VALUES (2151, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:32:00', '2026-05-09 09:32:00', '2026-05-09 09:32:00');
INSERT INTO `sys_job_log` VALUES (2152, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:32:05', '2026-05-09 09:32:05', '2026-05-09 09:32:05');
INSERT INTO `sys_job_log` VALUES (2153, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:32:10', '2026-05-09 09:32:10', '2026-05-09 09:32:10');
INSERT INTO `sys_job_log` VALUES (2154, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:32:15', '2026-05-09 09:32:15', '2026-05-09 09:32:15');
INSERT INTO `sys_job_log` VALUES (2155, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:32:20', '2026-05-09 09:32:20', '2026-05-09 09:32:20');
INSERT INTO `sys_job_log` VALUES (2156, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:32:25', '2026-05-09 09:32:25', '2026-05-09 09:32:25');
INSERT INTO `sys_job_log` VALUES (2157, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:32:30', '2026-05-09 09:32:30', '2026-05-09 09:32:30');
INSERT INTO `sys_job_log` VALUES (2158, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:32:35', '2026-05-09 09:32:35', '2026-05-09 09:32:35');
INSERT INTO `sys_job_log` VALUES (2159, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:32:40', '2026-05-09 09:32:40', '2026-05-09 09:32:40');
INSERT INTO `sys_job_log` VALUES (2160, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:32:45', '2026-05-09 09:32:45', '2026-05-09 09:32:45');
INSERT INTO `sys_job_log` VALUES (2161, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:32:50', '2026-05-09 09:32:50', '2026-05-09 09:32:50');
INSERT INTO `sys_job_log` VALUES (2162, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:32:55', '2026-05-09 09:32:55', '2026-05-09 09:32:55');
INSERT INTO `sys_job_log` VALUES (2163, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:33:00', '2026-05-09 09:33:00', '2026-05-09 09:33:00');
INSERT INTO `sys_job_log` VALUES (2164, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:33:05', '2026-05-09 09:33:05', '2026-05-09 09:33:05');
INSERT INTO `sys_job_log` VALUES (2165, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:33:10', '2026-05-09 09:33:10', '2026-05-09 09:33:10');
INSERT INTO `sys_job_log` VALUES (2166, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:33:15', '2026-05-09 09:33:15', '2026-05-09 09:33:15');
INSERT INTO `sys_job_log` VALUES (2167, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:33:20', '2026-05-09 09:33:20', '2026-05-09 09:33:20');
INSERT INTO `sys_job_log` VALUES (2168, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:33:25', '2026-05-09 09:33:25', '2026-05-09 09:33:25');
INSERT INTO `sys_job_log` VALUES (2169, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:33:30', '2026-05-09 09:33:30', '2026-05-09 09:33:30');
INSERT INTO `sys_job_log` VALUES (2170, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:33:35', '2026-05-09 09:33:35', '2026-05-09 09:33:35');
INSERT INTO `sys_job_log` VALUES (2171, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:33:40', '2026-05-09 09:33:40', '2026-05-09 09:33:40');
INSERT INTO `sys_job_log` VALUES (2172, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:33:45', '2026-05-09 09:33:45', '2026-05-09 09:33:45');
INSERT INTO `sys_job_log` VALUES (2173, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:33:50', '2026-05-09 09:33:50', '2026-05-09 09:33:50');
INSERT INTO `sys_job_log` VALUES (2174, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:33:55', '2026-05-09 09:33:55', '2026-05-09 09:33:55');
INSERT INTO `sys_job_log` VALUES (2175, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:34:00', '2026-05-09 09:34:00', '2026-05-09 09:34:00');
INSERT INTO `sys_job_log` VALUES (2176, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:34:05', '2026-05-09 09:34:05', '2026-05-09 09:34:05');
INSERT INTO `sys_job_log` VALUES (2177, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:34:10', '2026-05-09 09:34:10', '2026-05-09 09:34:10');
INSERT INTO `sys_job_log` VALUES (2178, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:34:15', '2026-05-09 09:34:15', '2026-05-09 09:34:15');
INSERT INTO `sys_job_log` VALUES (2179, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:34:20', '2026-05-09 09:34:20', '2026-05-09 09:34:20');
INSERT INTO `sys_job_log` VALUES (2180, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:34:25', '2026-05-09 09:34:25', '2026-05-09 09:34:25');
INSERT INTO `sys_job_log` VALUES (2181, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:34:30', '2026-05-09 09:34:30', '2026-05-09 09:34:30');
INSERT INTO `sys_job_log` VALUES (2182, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:34:35', '2026-05-09 09:34:35', '2026-05-09 09:34:35');
INSERT INTO `sys_job_log` VALUES (2183, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:34:40', '2026-05-09 09:34:40', '2026-05-09 09:34:40');
INSERT INTO `sys_job_log` VALUES (2184, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:34:45', '2026-05-09 09:34:45', '2026-05-09 09:34:45');
INSERT INTO `sys_job_log` VALUES (2185, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:34:50', '2026-05-09 09:34:50', '2026-05-09 09:34:50');
INSERT INTO `sys_job_log` VALUES (2186, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:34:55', '2026-05-09 09:34:55', '2026-05-09 09:34:55');
INSERT INTO `sys_job_log` VALUES (2187, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:35:00', '2026-05-09 09:35:00', '2026-05-09 09:35:00');
INSERT INTO `sys_job_log` VALUES (2188, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:35:05', '2026-05-09 09:35:05', '2026-05-09 09:35:05');
INSERT INTO `sys_job_log` VALUES (2189, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:35:10', '2026-05-09 09:35:10', '2026-05-09 09:35:10');
INSERT INTO `sys_job_log` VALUES (2190, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:35:15', '2026-05-09 09:35:15', '2026-05-09 09:35:15');
INSERT INTO `sys_job_log` VALUES (2191, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:35:20', '2026-05-09 09:35:20', '2026-05-09 09:35:20');
INSERT INTO `sys_job_log` VALUES (2192, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:35:25', '2026-05-09 09:35:25', '2026-05-09 09:35:25');
INSERT INTO `sys_job_log` VALUES (2193, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-09 09:35:30', '2026-05-09 09:35:30', '2026-05-09 09:35:30');
INSERT INTO `sys_job_log` VALUES (2194, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:35:35', '2026-05-09 09:35:35', '2026-05-09 09:35:35');
INSERT INTO `sys_job_log` VALUES (2195, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:35:40', '2026-05-09 09:35:40', '2026-05-09 09:35:40');
INSERT INTO `sys_job_log` VALUES (2196, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:35:45', '2026-05-09 09:35:45', '2026-05-09 09:35:45');
INSERT INTO `sys_job_log` VALUES (2197, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:35:50', '2026-05-09 09:35:50', '2026-05-09 09:35:50');
INSERT INTO `sys_job_log` VALUES (2198, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:35:55', '2026-05-09 09:35:55', '2026-05-09 09:35:55');
INSERT INTO `sys_job_log` VALUES (2199, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:36:00', '2026-05-09 09:36:00', '2026-05-09 09:36:00');
INSERT INTO `sys_job_log` VALUES (2200, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:36:05', '2026-05-09 09:36:05', '2026-05-09 09:36:05');
INSERT INTO `sys_job_log` VALUES (2201, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:36:10', '2026-05-09 09:36:10', '2026-05-09 09:36:10');
INSERT INTO `sys_job_log` VALUES (2202, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:36:15', '2026-05-09 09:36:15', '2026-05-09 09:36:15');
INSERT INTO `sys_job_log` VALUES (2203, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:36:20', '2026-05-09 09:36:20', '2026-05-09 09:36:20');
INSERT INTO `sys_job_log` VALUES (2204, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:36:25', '2026-05-09 09:36:25', '2026-05-09 09:36:25');
INSERT INTO `sys_job_log` VALUES (2205, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:36:30', '2026-05-09 09:36:30', '2026-05-09 09:36:30');
INSERT INTO `sys_job_log` VALUES (2206, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:36:35', '2026-05-09 09:36:35', '2026-05-09 09:36:35');
INSERT INTO `sys_job_log` VALUES (2207, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:36:40', '2026-05-09 09:36:40', '2026-05-09 09:36:40');
INSERT INTO `sys_job_log` VALUES (2208, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:36:45', '2026-05-09 09:36:45', '2026-05-09 09:36:45');
INSERT INTO `sys_job_log` VALUES (2209, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:36:50', '2026-05-09 09:36:50', '2026-05-09 09:36:50');
INSERT INTO `sys_job_log` VALUES (2210, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:36:55', '2026-05-09 09:36:55', '2026-05-09 09:36:55');
INSERT INTO `sys_job_log` VALUES (2211, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:37:00', '2026-05-09 09:37:00', '2026-05-09 09:37:00');
INSERT INTO `sys_job_log` VALUES (2212, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:37:05', '2026-05-09 09:37:05', '2026-05-09 09:37:05');
INSERT INTO `sys_job_log` VALUES (2213, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:37:10', '2026-05-09 09:37:10', '2026-05-09 09:37:10');
INSERT INTO `sys_job_log` VALUES (2214, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:37:15', '2026-05-09 09:37:15', '2026-05-09 09:37:15');
INSERT INTO `sys_job_log` VALUES (2215, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:37:20', '2026-05-09 09:37:20', '2026-05-09 09:37:20');
INSERT INTO `sys_job_log` VALUES (2216, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:37:25', '2026-05-09 09:37:25', '2026-05-09 09:37:25');
INSERT INTO `sys_job_log` VALUES (2217, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：5毫秒', '0', '', '2026-05-09 09:37:30', '2026-05-09 09:37:30', '2026-05-09 09:37:30');
INSERT INTO `sys_job_log` VALUES (2218, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:37:35', '2026-05-09 09:37:35', '2026-05-09 09:37:35');
INSERT INTO `sys_job_log` VALUES (2219, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:37:40', '2026-05-09 09:37:40', '2026-05-09 09:37:40');
INSERT INTO `sys_job_log` VALUES (2220, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:37:45', '2026-05-09 09:37:45', '2026-05-09 09:37:45');
INSERT INTO `sys_job_log` VALUES (2221, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:37:50', '2026-05-09 09:37:50', '2026-05-09 09:37:50');
INSERT INTO `sys_job_log` VALUES (2222, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:37:55', '2026-05-09 09:37:55', '2026-05-09 09:37:55');
INSERT INTO `sys_job_log` VALUES (2223, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:38:00', '2026-05-09 09:38:00', '2026-05-09 09:38:00');
INSERT INTO `sys_job_log` VALUES (2224, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:38:05', '2026-05-09 09:38:05', '2026-05-09 09:38:05');
INSERT INTO `sys_job_log` VALUES (2225, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:38:10', '2026-05-09 09:38:10', '2026-05-09 09:38:10');
INSERT INTO `sys_job_log` VALUES (2226, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:38:15', '2026-05-09 09:38:15', '2026-05-09 09:38:15');
INSERT INTO `sys_job_log` VALUES (2227, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:38:20', '2026-05-09 09:38:20', '2026-05-09 09:38:20');
INSERT INTO `sys_job_log` VALUES (2228, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:38:25', '2026-05-09 09:38:25', '2026-05-09 09:38:25');
INSERT INTO `sys_job_log` VALUES (2229, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:38:30', '2026-05-09 09:38:30', '2026-05-09 09:38:30');
INSERT INTO `sys_job_log` VALUES (2230, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:38:35', '2026-05-09 09:38:35', '2026-05-09 09:38:35');
INSERT INTO `sys_job_log` VALUES (2231, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:38:40', '2026-05-09 09:38:40', '2026-05-09 09:38:40');
INSERT INTO `sys_job_log` VALUES (2232, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:38:45', '2026-05-09 09:38:45', '2026-05-09 09:38:45');
INSERT INTO `sys_job_log` VALUES (2233, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:38:50', '2026-05-09 09:38:50', '2026-05-09 09:38:50');
INSERT INTO `sys_job_log` VALUES (2234, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:38:55', '2026-05-09 09:38:55', '2026-05-09 09:38:55');
INSERT INTO `sys_job_log` VALUES (2235, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:39:00', '2026-05-09 09:39:00', '2026-05-09 09:39:00');
INSERT INTO `sys_job_log` VALUES (2236, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:39:05', '2026-05-09 09:39:05', '2026-05-09 09:39:05');
INSERT INTO `sys_job_log` VALUES (2237, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:39:10', '2026-05-09 09:39:10', '2026-05-09 09:39:10');
INSERT INTO `sys_job_log` VALUES (2238, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:39:15', '2026-05-09 09:39:15', '2026-05-09 09:39:15');
INSERT INTO `sys_job_log` VALUES (2239, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:39:20', '2026-05-09 09:39:20', '2026-05-09 09:39:20');
INSERT INTO `sys_job_log` VALUES (2240, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:39:25', '2026-05-09 09:39:25', '2026-05-09 09:39:25');
INSERT INTO `sys_job_log` VALUES (2241, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:39:30', '2026-05-09 09:39:30', '2026-05-09 09:39:30');
INSERT INTO `sys_job_log` VALUES (2242, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:39:35', '2026-05-09 09:39:35', '2026-05-09 09:39:35');
INSERT INTO `sys_job_log` VALUES (2243, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:39:40', '2026-05-09 09:39:40', '2026-05-09 09:39:40');
INSERT INTO `sys_job_log` VALUES (2244, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:39:45', '2026-05-09 09:39:45', '2026-05-09 09:39:45');
INSERT INTO `sys_job_log` VALUES (2245, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:39:50', '2026-05-09 09:39:50', '2026-05-09 09:39:50');
INSERT INTO `sys_job_log` VALUES (2246, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:39:55', '2026-05-09 09:39:55', '2026-05-09 09:39:55');
INSERT INTO `sys_job_log` VALUES (2247, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:40:00', '2026-05-09 09:40:00', '2026-05-09 09:40:00');
INSERT INTO `sys_job_log` VALUES (2248, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:40:05', '2026-05-09 09:40:05', '2026-05-09 09:40:05');
INSERT INTO `sys_job_log` VALUES (2249, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:40:10', '2026-05-09 09:40:10', '2026-05-09 09:40:10');
INSERT INTO `sys_job_log` VALUES (2250, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:40:15', '2026-05-09 09:40:15', '2026-05-09 09:40:15');
INSERT INTO `sys_job_log` VALUES (2251, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:40:20', '2026-05-09 09:40:20', '2026-05-09 09:40:20');
INSERT INTO `sys_job_log` VALUES (2252, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:40:25', '2026-05-09 09:40:25', '2026-05-09 09:40:25');
INSERT INTO `sys_job_log` VALUES (2253, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:40:30', '2026-05-09 09:40:30', '2026-05-09 09:40:30');
INSERT INTO `sys_job_log` VALUES (2254, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:40:35', '2026-05-09 09:40:35', '2026-05-09 09:40:35');
INSERT INTO `sys_job_log` VALUES (2255, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:40:40', '2026-05-09 09:40:40', '2026-05-09 09:40:40');
INSERT INTO `sys_job_log` VALUES (2256, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:40:45', '2026-05-09 09:40:45', '2026-05-09 09:40:45');
INSERT INTO `sys_job_log` VALUES (2257, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:40:50', '2026-05-09 09:40:50', '2026-05-09 09:40:50');
INSERT INTO `sys_job_log` VALUES (2258, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:40:55', '2026-05-09 09:40:55', '2026-05-09 09:40:55');
INSERT INTO `sys_job_log` VALUES (2259, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:41:00', '2026-05-09 09:41:00', '2026-05-09 09:41:00');
INSERT INTO `sys_job_log` VALUES (2260, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:41:05', '2026-05-09 09:41:05', '2026-05-09 09:41:05');
INSERT INTO `sys_job_log` VALUES (2261, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:41:10', '2026-05-09 09:41:10', '2026-05-09 09:41:10');
INSERT INTO `sys_job_log` VALUES (2262, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:41:15', '2026-05-09 09:41:15', '2026-05-09 09:41:15');
INSERT INTO `sys_job_log` VALUES (2263, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:41:20', '2026-05-09 09:41:20', '2026-05-09 09:41:20');
INSERT INTO `sys_job_log` VALUES (2264, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:41:25', '2026-05-09 09:41:25', '2026-05-09 09:41:25');
INSERT INTO `sys_job_log` VALUES (2265, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:41:30', '2026-05-09 09:41:30', '2026-05-09 09:41:30');
INSERT INTO `sys_job_log` VALUES (2266, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:41:35', '2026-05-09 09:41:35', '2026-05-09 09:41:35');
INSERT INTO `sys_job_log` VALUES (2267, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:41:40', '2026-05-09 09:41:40', '2026-05-09 09:41:40');
INSERT INTO `sys_job_log` VALUES (2268, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:41:45', '2026-05-09 09:41:45', '2026-05-09 09:41:45');
INSERT INTO `sys_job_log` VALUES (2269, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:41:50', '2026-05-09 09:41:50', '2026-05-09 09:41:50');
INSERT INTO `sys_job_log` VALUES (2270, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:41:55', '2026-05-09 09:41:55', '2026-05-09 09:41:55');
INSERT INTO `sys_job_log` VALUES (2271, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:42:00', '2026-05-09 09:42:00', '2026-05-09 09:42:00');
INSERT INTO `sys_job_log` VALUES (2272, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:42:05', '2026-05-09 09:42:05', '2026-05-09 09:42:05');
INSERT INTO `sys_job_log` VALUES (2273, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:42:10', '2026-05-09 09:42:10', '2026-05-09 09:42:10');
INSERT INTO `sys_job_log` VALUES (2274, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:42:15', '2026-05-09 09:42:15', '2026-05-09 09:42:15');
INSERT INTO `sys_job_log` VALUES (2275, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:42:20', '2026-05-09 09:42:20', '2026-05-09 09:42:20');
INSERT INTO `sys_job_log` VALUES (2276, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:42:25', '2026-05-09 09:42:25', '2026-05-09 09:42:25');
INSERT INTO `sys_job_log` VALUES (2277, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:42:30', '2026-05-09 09:42:30', '2026-05-09 09:42:30');
INSERT INTO `sys_job_log` VALUES (2278, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:42:35', '2026-05-09 09:42:35', '2026-05-09 09:42:35');
INSERT INTO `sys_job_log` VALUES (2279, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:42:40', '2026-05-09 09:42:40', '2026-05-09 09:42:40');
INSERT INTO `sys_job_log` VALUES (2280, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:42:45', '2026-05-09 09:42:45', '2026-05-09 09:42:45');
INSERT INTO `sys_job_log` VALUES (2281, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:42:50', '2026-05-09 09:42:50', '2026-05-09 09:42:50');
INSERT INTO `sys_job_log` VALUES (2282, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:42:55', '2026-05-09 09:42:55', '2026-05-09 09:42:55');
INSERT INTO `sys_job_log` VALUES (2283, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:43:00', '2026-05-09 09:43:00', '2026-05-09 09:43:00');
INSERT INTO `sys_job_log` VALUES (2284, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:43:05', '2026-05-09 09:43:05', '2026-05-09 09:43:05');
INSERT INTO `sys_job_log` VALUES (2285, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:43:10', '2026-05-09 09:43:10', '2026-05-09 09:43:10');
INSERT INTO `sys_job_log` VALUES (2286, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:43:15', '2026-05-09 09:43:15', '2026-05-09 09:43:15');
INSERT INTO `sys_job_log` VALUES (2287, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:43:20', '2026-05-09 09:43:20', '2026-05-09 09:43:20');
INSERT INTO `sys_job_log` VALUES (2288, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:43:25', '2026-05-09 09:43:25', '2026-05-09 09:43:25');
INSERT INTO `sys_job_log` VALUES (2289, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:43:30', '2026-05-09 09:43:30', '2026-05-09 09:43:30');
INSERT INTO `sys_job_log` VALUES (2290, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:43:35', '2026-05-09 09:43:35', '2026-05-09 09:43:35');
INSERT INTO `sys_job_log` VALUES (2291, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:43:40', '2026-05-09 09:43:40', '2026-05-09 09:43:40');
INSERT INTO `sys_job_log` VALUES (2292, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:43:45', '2026-05-09 09:43:45', '2026-05-09 09:43:45');
INSERT INTO `sys_job_log` VALUES (2293, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:43:50', '2026-05-09 09:43:50', '2026-05-09 09:43:50');
INSERT INTO `sys_job_log` VALUES (2294, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:43:55', '2026-05-09 09:43:55', '2026-05-09 09:43:55');
INSERT INTO `sys_job_log` VALUES (2295, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:44:00', '2026-05-09 09:44:00', '2026-05-09 09:44:00');
INSERT INTO `sys_job_log` VALUES (2296, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:44:05', '2026-05-09 09:44:05', '2026-05-09 09:44:05');
INSERT INTO `sys_job_log` VALUES (2297, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:44:10', '2026-05-09 09:44:10', '2026-05-09 09:44:10');
INSERT INTO `sys_job_log` VALUES (2298, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:44:15', '2026-05-09 09:44:15', '2026-05-09 09:44:15');
INSERT INTO `sys_job_log` VALUES (2299, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:44:20', '2026-05-09 09:44:20', '2026-05-09 09:44:20');
INSERT INTO `sys_job_log` VALUES (2300, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:44:25', '2026-05-09 09:44:25', '2026-05-09 09:44:25');
INSERT INTO `sys_job_log` VALUES (2301, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:44:30', '2026-05-09 09:44:30', '2026-05-09 09:44:30');
INSERT INTO `sys_job_log` VALUES (2302, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:44:35', '2026-05-09 09:44:35', '2026-05-09 09:44:35');
INSERT INTO `sys_job_log` VALUES (2303, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:44:40', '2026-05-09 09:44:40', '2026-05-09 09:44:40');
INSERT INTO `sys_job_log` VALUES (2304, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:44:45', '2026-05-09 09:44:45', '2026-05-09 09:44:45');
INSERT INTO `sys_job_log` VALUES (2305, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:44:50', '2026-05-09 09:44:50', '2026-05-09 09:44:50');
INSERT INTO `sys_job_log` VALUES (2306, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:44:55', '2026-05-09 09:44:55', '2026-05-09 09:44:55');
INSERT INTO `sys_job_log` VALUES (2307, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:45:00', '2026-05-09 09:45:00', '2026-05-09 09:45:00');
INSERT INTO `sys_job_log` VALUES (2308, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:45:05', '2026-05-09 09:45:05', '2026-05-09 09:45:05');
INSERT INTO `sys_job_log` VALUES (2309, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:45:10', '2026-05-09 09:45:10', '2026-05-09 09:45:10');
INSERT INTO `sys_job_log` VALUES (2310, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:45:15', '2026-05-09 09:45:15', '2026-05-09 09:45:15');
INSERT INTO `sys_job_log` VALUES (2311, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:45:20', '2026-05-09 09:45:20', '2026-05-09 09:45:20');
INSERT INTO `sys_job_log` VALUES (2312, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:45:25', '2026-05-09 09:45:25', '2026-05-09 09:45:25');
INSERT INTO `sys_job_log` VALUES (2313, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:45:30', '2026-05-09 09:45:30', '2026-05-09 09:45:30');
INSERT INTO `sys_job_log` VALUES (2314, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:45:35', '2026-05-09 09:45:35', '2026-05-09 09:45:35');
INSERT INTO `sys_job_log` VALUES (2315, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:45:40', '2026-05-09 09:45:40', '2026-05-09 09:45:40');
INSERT INTO `sys_job_log` VALUES (2316, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:45:45', '2026-05-09 09:45:45', '2026-05-09 09:45:45');
INSERT INTO `sys_job_log` VALUES (2317, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:45:50', '2026-05-09 09:45:50', '2026-05-09 09:45:50');
INSERT INTO `sys_job_log` VALUES (2318, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:45:55', '2026-05-09 09:45:55', '2026-05-09 09:45:55');
INSERT INTO `sys_job_log` VALUES (2319, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:46:00', '2026-05-09 09:46:00', '2026-05-09 09:46:00');
INSERT INTO `sys_job_log` VALUES (2320, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:46:05', '2026-05-09 09:46:05', '2026-05-09 09:46:05');
INSERT INTO `sys_job_log` VALUES (2321, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:46:10', '2026-05-09 09:46:10', '2026-05-09 09:46:10');
INSERT INTO `sys_job_log` VALUES (2322, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-09 09:46:15', '2026-05-09 09:46:15', '2026-05-09 09:46:15');
INSERT INTO `sys_job_log` VALUES (2323, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：3毫秒', '0', '', '2026-05-09 09:46:20', '2026-05-09 09:46:20', '2026-05-09 09:46:20');
INSERT INTO `sys_job_log` VALUES (2324, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:46:25', '2026-05-09 09:46:25', '2026-05-09 09:46:25');
INSERT INTO `sys_job_log` VALUES (2325, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-09 09:46:30', '2026-05-09 09:46:30', '2026-05-09 09:46:30');
INSERT INTO `sys_job_log` VALUES (2326, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:46:35', '2026-05-09 09:46:35', '2026-05-09 09:46:35');
INSERT INTO `sys_job_log` VALUES (2327, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:46:40', '2026-05-09 09:46:40', '2026-05-09 09:46:40');
INSERT INTO `sys_job_log` VALUES (2328, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-09 09:46:45', '2026-05-09 09:46:45', '2026-05-09 09:46:45');
INSERT INTO `sys_job_log` VALUES (2329, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:46:50', '2026-05-09 09:46:50', '2026-05-09 09:46:50');
INSERT INTO `sys_job_log` VALUES (2330, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:46:55', '2026-05-09 09:46:55', '2026-05-09 09:46:55');
INSERT INTO `sys_job_log` VALUES (2331, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:47:00', '2026-05-09 09:47:00', '2026-05-09 09:47:00');
INSERT INTO `sys_job_log` VALUES (2332, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:47:05', '2026-05-09 09:47:05', '2026-05-09 09:47:05');
INSERT INTO `sys_job_log` VALUES (2333, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:47:10', '2026-05-09 09:47:10', '2026-05-09 09:47:10');
INSERT INTO `sys_job_log` VALUES (2334, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:47:15', '2026-05-09 09:47:15', '2026-05-09 09:47:15');
INSERT INTO `sys_job_log` VALUES (2335, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:47:20', '2026-05-09 09:47:20', '2026-05-09 09:47:20');
INSERT INTO `sys_job_log` VALUES (2336, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:47:25', '2026-05-09 09:47:25', '2026-05-09 09:47:25');
INSERT INTO `sys_job_log` VALUES (2337, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:47:30', '2026-05-09 09:47:30', '2026-05-09 09:47:30');
INSERT INTO `sys_job_log` VALUES (2338, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:47:35', '2026-05-09 09:47:35', '2026-05-09 09:47:35');
INSERT INTO `sys_job_log` VALUES (2339, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:47:40', '2026-05-09 09:47:40', '2026-05-09 09:47:40');
INSERT INTO `sys_job_log` VALUES (2340, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:47:45', '2026-05-09 09:47:45', '2026-05-09 09:47:45');
INSERT INTO `sys_job_log` VALUES (2341, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:47:50', '2026-05-09 09:47:50', '2026-05-09 09:47:50');
INSERT INTO `sys_job_log` VALUES (2342, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:47:55', '2026-05-09 09:47:55', '2026-05-09 09:47:55');
INSERT INTO `sys_job_log` VALUES (2343, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:48:00', '2026-05-09 09:48:00', '2026-05-09 09:48:00');
INSERT INTO `sys_job_log` VALUES (2344, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:48:05', '2026-05-09 09:48:05', '2026-05-09 09:48:05');
INSERT INTO `sys_job_log` VALUES (2345, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:48:10', '2026-05-09 09:48:10', '2026-05-09 09:48:10');
INSERT INTO `sys_job_log` VALUES (2346, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:48:15', '2026-05-09 09:48:15', '2026-05-09 09:48:15');
INSERT INTO `sys_job_log` VALUES (2347, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:48:20', '2026-05-09 09:48:20', '2026-05-09 09:48:20');
INSERT INTO `sys_job_log` VALUES (2348, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:48:25', '2026-05-09 09:48:25', '2026-05-09 09:48:25');
INSERT INTO `sys_job_log` VALUES (2349, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:48:30', '2026-05-09 09:48:30', '2026-05-09 09:48:30');
INSERT INTO `sys_job_log` VALUES (2350, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:48:35', '2026-05-09 09:48:35', '2026-05-09 09:48:35');
INSERT INTO `sys_job_log` VALUES (2351, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:48:40', '2026-05-09 09:48:40', '2026-05-09 09:48:40');
INSERT INTO `sys_job_log` VALUES (2352, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:48:45', '2026-05-09 09:48:45', '2026-05-09 09:48:45');
INSERT INTO `sys_job_log` VALUES (2353, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:48:50', '2026-05-09 09:48:50', '2026-05-09 09:48:50');
INSERT INTO `sys_job_log` VALUES (2354, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:48:55', '2026-05-09 09:48:55', '2026-05-09 09:48:55');
INSERT INTO `sys_job_log` VALUES (2355, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:49:00', '2026-05-09 09:49:00', '2026-05-09 09:49:00');
INSERT INTO `sys_job_log` VALUES (2356, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:49:05', '2026-05-09 09:49:05', '2026-05-09 09:49:05');
INSERT INTO `sys_job_log` VALUES (2357, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:49:10', '2026-05-09 09:49:10', '2026-05-09 09:49:10');
INSERT INTO `sys_job_log` VALUES (2358, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:49:15', '2026-05-09 09:49:15', '2026-05-09 09:49:15');
INSERT INTO `sys_job_log` VALUES (2359, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:49:20', '2026-05-09 09:49:20', '2026-05-09 09:49:20');
INSERT INTO `sys_job_log` VALUES (2360, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:49:25', '2026-05-09 09:49:25', '2026-05-09 09:49:25');
INSERT INTO `sys_job_log` VALUES (2361, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:49:30', '2026-05-09 09:49:30', '2026-05-09 09:49:30');
INSERT INTO `sys_job_log` VALUES (2362, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:49:35', '2026-05-09 09:49:35', '2026-05-09 09:49:35');
INSERT INTO `sys_job_log` VALUES (2363, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:49:40', '2026-05-09 09:49:40', '2026-05-09 09:49:40');
INSERT INTO `sys_job_log` VALUES (2364, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:49:45', '2026-05-09 09:49:45', '2026-05-09 09:49:45');
INSERT INTO `sys_job_log` VALUES (2365, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:49:50', '2026-05-09 09:49:50', '2026-05-09 09:49:50');
INSERT INTO `sys_job_log` VALUES (2366, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:49:55', '2026-05-09 09:49:55', '2026-05-09 09:49:55');
INSERT INTO `sys_job_log` VALUES (2367, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:50:00', '2026-05-09 09:50:00', '2026-05-09 09:50:00');
INSERT INTO `sys_job_log` VALUES (2368, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：3毫秒', '0', '', '2026-05-09 09:50:05', '2026-05-09 09:50:05', '2026-05-09 09:50:05');
INSERT INTO `sys_job_log` VALUES (2369, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:50:10', '2026-05-09 09:50:10', '2026-05-09 09:50:10');
INSERT INTO `sys_job_log` VALUES (2370, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:50:15', '2026-05-09 09:50:15', '2026-05-09 09:50:15');
INSERT INTO `sys_job_log` VALUES (2371, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:50:20', '2026-05-09 09:50:20', '2026-05-09 09:50:20');
INSERT INTO `sys_job_log` VALUES (2372, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:50:25', '2026-05-09 09:50:25', '2026-05-09 09:50:25');
INSERT INTO `sys_job_log` VALUES (2373, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:50:30', '2026-05-09 09:50:30', '2026-05-09 09:50:30');
INSERT INTO `sys_job_log` VALUES (2374, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:50:35', '2026-05-09 09:50:35', '2026-05-09 09:50:35');
INSERT INTO `sys_job_log` VALUES (2375, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:50:40', '2026-05-09 09:50:40', '2026-05-09 09:50:40');
INSERT INTO `sys_job_log` VALUES (2376, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:50:45', '2026-05-09 09:50:45', '2026-05-09 09:50:45');
INSERT INTO `sys_job_log` VALUES (2377, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:50:50', '2026-05-09 09:50:50', '2026-05-09 09:50:50');
INSERT INTO `sys_job_log` VALUES (2378, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:50:55', '2026-05-09 09:50:55', '2026-05-09 09:50:55');
INSERT INTO `sys_job_log` VALUES (2379, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:51:00', '2026-05-09 09:51:00', '2026-05-09 09:51:00');
INSERT INTO `sys_job_log` VALUES (2380, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:51:05', '2026-05-09 09:51:05', '2026-05-09 09:51:05');
INSERT INTO `sys_job_log` VALUES (2381, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:51:10', '2026-05-09 09:51:10', '2026-05-09 09:51:10');
INSERT INTO `sys_job_log` VALUES (2382, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:51:15', '2026-05-09 09:51:15', '2026-05-09 09:51:15');
INSERT INTO `sys_job_log` VALUES (2383, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:51:20', '2026-05-09 09:51:20', '2026-05-09 09:51:20');
INSERT INTO `sys_job_log` VALUES (2384, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:51:25', '2026-05-09 09:51:25', '2026-05-09 09:51:25');
INSERT INTO `sys_job_log` VALUES (2385, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:51:30', '2026-05-09 09:51:30', '2026-05-09 09:51:30');
INSERT INTO `sys_job_log` VALUES (2386, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:51:35', '2026-05-09 09:51:35', '2026-05-09 09:51:35');
INSERT INTO `sys_job_log` VALUES (2387, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-09 09:51:40', '2026-05-09 09:51:40', '2026-05-09 09:51:40');
INSERT INTO `sys_job_log` VALUES (2388, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：1毫秒', '0', '', '2026-05-09 09:51:45', '2026-05-09 09:51:45', '2026-05-09 09:51:45');
INSERT INTO `sys_job_log` VALUES (2389, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:51:50', '2026-05-09 09:51:50', '2026-05-09 09:51:50');
INSERT INTO `sys_job_log` VALUES (2390, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:51:55', '2026-05-09 09:51:55', '2026-05-09 09:51:55');
INSERT INTO `sys_job_log` VALUES (2391, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:52:00', '2026-05-09 09:52:00', '2026-05-09 09:52:00');
INSERT INTO `sys_job_log` VALUES (2392, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:52:05', '2026-05-09 09:52:05', '2026-05-09 09:52:05');
INSERT INTO `sys_job_log` VALUES (2393, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:52:10', '2026-05-09 09:52:10', '2026-05-09 09:52:10');
INSERT INTO `sys_job_log` VALUES (2394, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:52:15', '2026-05-09 09:52:15', '2026-05-09 09:52:15');
INSERT INTO `sys_job_log` VALUES (2395, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:52:20', '2026-05-09 09:52:20', '2026-05-09 09:52:20');
INSERT INTO `sys_job_log` VALUES (2396, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:52:25', '2026-05-09 09:52:25', '2026-05-09 09:52:25');
INSERT INTO `sys_job_log` VALUES (2397, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:52:30', '2026-05-09 09:52:30', '2026-05-09 09:52:30');
INSERT INTO `sys_job_log` VALUES (2398, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:52:35', '2026-05-09 09:52:35', '2026-05-09 09:52:35');
INSERT INTO `sys_job_log` VALUES (2399, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:52:40', '2026-05-09 09:52:40', '2026-05-09 09:52:40');
INSERT INTO `sys_job_log` VALUES (2400, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:52:45', '2026-05-09 09:52:45', '2026-05-09 09:52:45');
INSERT INTO `sys_job_log` VALUES (2401, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:52:50', '2026-05-09 09:52:50', '2026-05-09 09:52:50');
INSERT INTO `sys_job_log` VALUES (2402, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：2毫秒', '0', '', '2026-05-09 09:52:55', '2026-05-09 09:52:55', '2026-05-09 09:52:55');
INSERT INTO `sys_job_log` VALUES (2403, '输出时间', 'DEFAULT', 'myTask.showTime()', '输出时间 总共耗时：0毫秒', '0', '', '2026-05-09 09:53:00', '2026-05-09 09:53:00', '2026-05-09 09:53:00');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '登录成功', '2026-05-07 16:06:11');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '登录成功', '2026-05-07 16:47:59');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '登录成功', '2026-05-08 08:33:53');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '登录成功', '2026-05-08 10:23:15');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '退出成功', '2026-05-08 10:36:12');
INSERT INTO `sys_logininfor` VALUES (105, 'xiaozhi', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '1', '用户不存在/密码错误', '2026-05-08 10:36:20');
INSERT INTO `sys_logininfor` VALUES (106, 'xiaozhi', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '登录成功', '2026-05-08 10:36:42');
INSERT INTO `sys_logininfor` VALUES (107, 'xiaozhi', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '退出成功', '2026-05-08 10:37:10');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '登录成功', '2026-05-08 10:37:15');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '1', '验证码错误', '2026-05-08 13:53:06');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '登录成功', '2026-05-08 13:53:11');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '1', '验证码错误', '2026-05-08 14:07:22');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '登录成功', '2026-05-08 14:07:30');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '退出成功', '2026-05-08 14:31:23');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '登录成功', '2026-05-08 14:31:27');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '退出成功', '2026-05-08 14:34:27');
INSERT INTO `sys_logininfor` VALUES (116, 'xiaozhi', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '登录成功', '2026-05-08 14:34:42');
INSERT INTO `sys_logininfor` VALUES (117, 'xiaozhi', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '退出成功', '2026-05-08 14:35:46');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '登录成功', '2026-05-08 14:35:50');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '退出成功', '2026-05-08 15:28:06');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '登录成功', '2026-05-08 15:28:06');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '登录成功', '2026-05-08 16:48:58');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '登录成功', '2026-05-08 17:23:56');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 132', 'Windows10', '0', '登录成功', '2026-05-09 08:34:31');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-09 03:30:03');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-09 06:11:34');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-09 07:21:02');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Edge 147', 'Windows >=10', '0', '登录成功', '2026-05-09 08:41:40');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-05-10 02:30:16');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-05-10 06:02:47');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Curl 8.19.0', '', '0', '登录成功', '2026-05-10 07:01:08');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-05-10 09:37:14');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-05-10 11:06:00');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2065 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 10, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2026-05-07 14:50:20', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 11, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2026-05-07 14:50:20', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 12, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2026-05-07 14:50:20', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 13, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2026-05-07 14:50:20', 'admin', '2026-05-08 15:24:15', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2026-05-07 14:50:20', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2026-05-07 14:50:20', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2026-05-07 14:50:20', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2026-05-07 14:50:20', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2026-05-07 14:50:20', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2026-05-07 14:50:20', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2026-05-07 14:50:20', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2026-05-07 14:50:20', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2026-05-07 14:50:20', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2026-05-07 14:50:20', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2026-05-07 14:50:20', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2026-05-07 14:50:20', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2026-05-07 14:50:20', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2026-05-07 14:50:20', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2026-05-07 14:50:20', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2026-05-07 14:50:20', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2026-05-07 14:50:20', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2026-05-07 14:50:20', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2026-05-07 14:50:20', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2026-05-07 14:50:20', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2026-05-07 14:50:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2026-05-07 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '课程管理', 0, 1, 'courseManager', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'education', 'admin', '2026-05-07 16:07:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '学生课查询', 2001, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:course:query', '#', 'admin', '2026-05-07 16:16:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '学生课新增', 2001, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:course:add', '#', 'admin', '2026-05-07 16:16:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '学生课修改', 2001, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:course:edit', '#', 'admin', '2026-05-07 16:16:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '学生课删除', 2001, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:course:remove', '#', 'admin', '2026-05-07 16:16:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '学生课导出', 2001, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:course:export', '#', 'admin', '2026-05-07 16:16:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '课表管理', 2000, 1, 'course', 'course/course/index', NULL, '', 1, 0, 'C', '0', '0', 'course:course:list', '#', 'admin', '2026-05-07 16:22:48', '', NULL, '课表管理菜单');
INSERT INTO `sys_menu` VALUES (2008, '课表管理查询', 2007, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'course:course:query', '#', 'admin', '2026-05-07 16:22:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '课表管理新增', 2007, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'course:course:add', '#', 'admin', '2026-05-07 16:22:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '课表管理修改', 2007, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'course:course:edit', '#', 'admin', '2026-05-07 16:22:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '课表管理删除', 2007, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'course:course:remove', '#', 'admin', '2026-05-07 16:22:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '课表管理导出', 2007, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'course:course:export', '#', 'admin', '2026-05-07 16:22:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '课表管理修改', 2013, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'course:course:edit', '#', 'admin', '2026-05-07 17:03:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '课表管理删除', 2013, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'course:course:remove', '#', 'admin', '2026-05-07 17:03:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '课表管理导出', 2013, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'course:course:export', '#', 'admin', '2026-05-07 17:03:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '统计分析', 0, 2, 'countManager', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'chart', 'admin', '2026-05-08 10:30:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '课表展示', 2000, 99, 'timetable', 'course/timetable/index', '', 'CourseTimetable', 1, 0, 'C', '0', '0', 'course:course:list', '课程表', 'admin', '2026-05-08 15:34:26', '', NULL, '课表周视图展示');
INSERT INTO `sys_menu` VALUES (2021, '笔记管理', 0, 3, 'noteManage', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'education', 'admin', '2026-05-09 09:00:13', 'admin', '2026-05-09 09:28:35', '');
INSERT INTO `sys_menu` VALUES (2022, '学习笔记', 2021, 1, 'note', 'note/note/index', NULL, '', 1, 0, 'C', '0', '0', 'note:note:list', '#', 'admin', '2026-05-09 10:04:41', '', NULL, '学习笔记菜单');
INSERT INTO `sys_menu` VALUES (2023, '学习笔记查询', 2022, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'note:note:query', '#', 'admin', '2026-05-09 10:04:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '学习笔记新增', 2022, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'note:note:add', '#', 'admin', '2026-05-09 10:04:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '学习笔记修改', 2022, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'note:note:edit', '#', 'admin', '2026-05-09 10:04:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '学习笔记删除', 2022, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'note:note:remove', '#', 'admin', '2026-05-09 10:04:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '学习笔记导出', 2022, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'note:note:export', '#', 'admin', '2026-05-09 10:04:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '笔记模板', 2021, 1, 'template', 'template/template/index', NULL, '', 1, 0, 'C', '0', '0', 'template:template:list', '#', 'admin', '2026-05-09 10:09:53', '', NULL, '笔记模板菜单');
INSERT INTO `sys_menu` VALUES (2029, '笔记模板查询', 2028, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'template:template:query', '#', 'admin', '2026-05-09 10:09:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '笔记模板新增', 2028, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'template:template:add', '#', 'admin', '2026-05-09 10:09:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '笔记模板修改', 2028, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'template:template:edit', '#', 'admin', '2026-05-09 10:09:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '笔记模板删除', 2028, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'template:template:remove', '#', 'admin', '2026-05-09 10:09:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '笔记模板导出', 2028, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'template:template:export', '#', 'admin', '2026-05-09 10:09:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '学生管理', 0, 1, 'student', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'peoples', 'admin', '2026-05-09 08:42:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, 'AI 助手', 0, 4, 'agent', NULL, '', '', 1, 0, 'M', '0', '0', '', 'chat', 'admin', '2026-05-10 02:21:38', '', NULL, 'AI 智能助手目录');
INSERT INTO `sys_menu` VALUES (2042, 'AI 对话', 2041, 1, 'chat', 'agent/chat/index', '', '', 1, 0, 'C', '0', '0', 'agent:chat:list', 'chat', 'admin', '2026-05-10 02:21:38', '', NULL, 'AI 对话菜单');
INSERT INTO `sys_menu` VALUES (2043, 'AI 对话查询', 2042, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'agent:chat:query', '#', 'admin', '2026-05-10 02:21:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, 'AI 对话新增', 2042, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'agent:chat:add', '#', 'admin', '2026-05-10 02:21:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, 'AI 对话删除', 2042, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'agent:chat:remove', '#', 'admin', '2026-05-10 02:21:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, 'Agent 管理', 2041, 2, 'manage', 'agent/manage/index', '', '', 1, 0, 'C', '0', '0', 'agent:manage:list', 'monitor', 'admin', '2026-05-10 06:44:49', '', NULL, 'Agent 管理菜单');
INSERT INTO `sys_menu` VALUES (2047, 'Agent 状态查询', 2046, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'agent:manage:query', '#', 'admin', '2026-05-10 06:44:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, 'Agent 状态修改', 2046, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'agent:manage:edit', '#', 'admin', '2026-05-10 06:44:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, 'Agent 配置修改', 2046, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'agent:manage:config', '#', 'admin', '2026-05-10 06:44:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, 'Agent 会话删除', 2046, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'agent:manage:remove', '#', 'admin', '2026-05-10 06:44:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, 'Agent 索引重建', 2046, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'agent:manage:reindex', '#', 'admin', '2026-05-10 06:44:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '校园信息', 0, 4, 'campus', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2026-05-10 07:04:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '校园知识分类', 2052, 1, 'type', 'knowledge/type/index', NULL, '', 1, 0, 'C', '0', '0', 'knowledge:type:list', '#', 'admin', '2026-05-10 07:49:41', '', NULL, '校园知识分类菜单');
INSERT INTO `sys_menu` VALUES (2054, '校园知识分类查询', 2053, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'knowledge:type:query', '#', 'admin', '2026-05-10 07:49:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '校园知识分类新增', 2053, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'knowledge:type:add', '#', 'admin', '2026-05-10 07:49:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '校园知识分类修改', 2053, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'knowledge:type:edit', '#', 'admin', '2026-05-10 07:49:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '校园知识分类删除', 2053, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'knowledge:type:remove', '#', 'admin', '2026-05-10 07:49:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '校园知识分类导出', 2053, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'knowledge:type:export', '#', 'admin', '2026-05-10 07:49:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '校园知识内容', 2052, 1, 'knowledge', 'knowledge/knowledge/index', NULL, '', 1, 0, 'C', '0', '0', 'knowledge:knowledge:list', '#', 'admin', '2026-05-10 07:49:41', '', NULL, '校园知识内容菜单');
INSERT INTO `sys_menu` VALUES (2060, '校园知识内容查询', 2059, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'knowledge:knowledge:query', '#', 'admin', '2026-05-10 07:49:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '校园知识内容新增', 2059, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'knowledge:knowledge:add', '#', 'admin', '2026-05-10 07:49:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '校园知识内容修改', 2059, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'knowledge:knowledge:edit', '#', 'admin', '2026-05-10 07:49:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '校园知识内容删除', 2059, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'knowledge:knowledge:remove', '#', 'admin', '2026-05-10 07:49:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '校园知识内容导出', 2059, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'knowledge:knowledge:export', '#', 'admin', '2026-05-10 07:49:41', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2026-05-07 14:50:34', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2026-05-07 14:50:35', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (3, '若依开源框架介绍', '1', 0x3C703E3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE9A1B9E79BAEE4BB8BE7BB8D3C2F7370616E3E3C2F703E3C703E3C666F6E7420636F6C6F723D2223333333333333223E52756F5969E5BC80E6BA90E9A1B9E79BAEE698AFE4B8BAE4BC81E4B89AE794A8E688B7E5AE9AE588B6E79A84E5908EE58FB0E8849AE6898BE69EB6E6A186E69EB6EFBC8CE4B8BAE4BC81E4B89AE68993E980A0E79A84E4B880E7AB99E5BC8FE8A7A3E586B3E696B9E6A188EFBC8CE9998DE4BD8EE4BC81E4B89AE5BC80E58F91E68890E69CACEFBC8CE68F90E58D87E5BC80E58F91E69588E78E87E38082E4B8BBE8A681E58C85E68BACE794A8E688B7E7AEA1E79086E38081E8A792E889B2E7AEA1E79086E38081E983A8E997A8E7AEA1E79086E38081E88F9CE58D95E7AEA1E79086E38081E58F82E695B0E7AEA1E79086E38081E5AD97E585B8E7AEA1E79086E380813C2F666F6E743E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE5B297E4BD8DE7AEA1E790863C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE38081E5AE9AE697B6E4BBBBE58AA13C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE380813C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE69C8DE58AA1E79B91E68EA7E38081E799BBE5BD95E697A5E5BF97E38081E6938DE4BD9CE697A5E5BF97E38081E4BBA3E7A081E7949FE68890E7AD89E58A9FE883BDE38082E585B6E4B8ADEFBC8CE8BF98E694AFE68C81E5A49AE695B0E68DAEE6BA90E38081E695B0E68DAEE69D83E99990E38081E59BBDE99985E58C96E380815265646973E7BC93E5AD98E38081446F636B6572E983A8E7BDB2E38081E6BB91E58AA8E9AA8CE8AF81E7A081E38081E7ACACE4B889E696B9E8AEA4E8AF81E799BBE5BD95E38081E58886E5B883E5BC8FE4BA8BE58AA1E380813C2F7370616E3E3C666F6E7420636F6C6F723D2223333333333333223EE58886E5B883E5BC8FE69687E4BBB6E5AD98E582A83C2F666F6E743E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE38081E58886E5BA93E58886E8A1A8E5A484E79086E7AD89E68A80E69CAFE789B9E782B9E380823C2F7370616E3E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F666F727564612E67697465652E636F6D2F696D616765732F313737333933313834383334323433393033322F61346432323331335F313831353039352E706E6722207374796C653D2277696474683A20363470783B223E3C62723E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE5AE98E7BD91E58F8AE6BC94E7A4BA3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE88BA5E4BE9DE5AE98E7BD91E59CB0E59D80EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F72756F79692E7669703C2F613E3C6120687265663D22687474703A2F2F72756F79692E76697022207461726765743D225F626C616E6B223E3C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE88BA5E4BE9DE69687E6A1A3E59CB0E59D80EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F646F632E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F646F632E72756F79692E7669703C2F613E3C62723E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E4B88DE58886E7A6BBE78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F64656D6F2E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F64656D6F2E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E58886E7A6BBE78988E69CACE38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F7675652E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F7675652E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E5BEAEE69C8DE58AA1E78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F636C6F75642E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F636C6F75642E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E7A7BBE58AA8E7ABAFE78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F68352E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F68352E72756F79692E7669703C2F613E3C2F703E3C703E3C6272207374796C653D22636F6C6F723A207267622834382C2034392C203531293B20666F6E742D66616D696C793A202671756F743B48656C766574696361204E6575652671756F743B2C2048656C7665746963612C20417269616C2C2073616E732D73657269663B20666F6E742D73697A653A20313270783B223E3C2F703E, '0', 'admin', '2026-05-07 14:50:35', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (10, '智慧通项目上线在即', '1', 0x3C703E3C7374726F6E673E3C656D3EE699BAE685A7E9809AE9A1B9E79BAEE5B086E4BA8EE4BA94E69C88E58D81E4BA94E4B88AE7BABF3C2F656D3E3C7370616E20636C6173733D22716C2D637572736F72223EEFBBBF3C2F7370616E3E3C2F7374726F6E673E3C2F703E, '0', 'admin', '2026-05-08 14:33:48', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_notice_read
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice_read`;
CREATE TABLE `sys_notice_read`  (
  `read_id` bigint NOT NULL AUTO_INCREMENT COMMENT '已读主键',
  `notice_id` int NOT NULL COMMENT '公告id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `read_time` datetime NOT NULL COMMENT '阅读时间',
  PRIMARY KEY (`read_id`) USING BTREE,
  UNIQUE INDEX `uk_user_notice`(`user_id` ASC, `notice_id` ASC) USING BTREE COMMENT '同一用户同一公告只记录一次'
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '公告已读记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice_read
-- ----------------------------
INSERT INTO `sys_notice_read` VALUES (1, 10, 3, '2026-05-08 14:34:54');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.zhihuitong.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"课程管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"courseManager\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-07 16:07:38', 60);
INSERT INTO `sys_oper_log` VALUES (101, '保存菜单排序', 2, 'com.zhihuitong.web.controller.system.SysMenuController.updateSort()', 'PUT', 1, 'admin', '研发部门', '/system/menu/updateSort', '127.0.0.1', '内网IP', '{\"menuIds\":\"1,2,3,4\",\"orderNums\":\"10,11,12,13\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-07 16:07:58', 42);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 6, 'com.zhihuitong.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"stu_course\",\"tplWebType\":\"element-plus-typescript\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-07 16:09:43', 79);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"course\",\"className\":\"StuCourse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID（对应学号/用户ID）\",\"columnId\":2,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Term\",\"columnComment\":\"学期标识（示例：2025-2026-1）\",\"columnId\":3,\"columnName\":\"term\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"term\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-07 16:11:50', 49);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.zhihuitong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"stu_course\"}', NULL, 0, NULL, '2026-05-07 16:12:05', 58);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"course\",\"className\":\"StuCourse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-07 16:11:50\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID（对应学号/用户ID）\",\"columnId\":2,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-07 16:11:50\",\"usableColumn\":false},{\"capJavaField\":\"Term\",\"columnComment\":\"学期标识（示例：2025-2026-1）\",\"columnId\":3,\"columnName\":\"term\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"term\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-07 16:11:50\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-07 16:18:34', 130);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.zhihuitong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"stu_course\"}', NULL, 0, NULL, '2026-05-07 16:18:37', 231);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"course\",\"className\":\"StuCourse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-07 16:18:34\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID（对应学号/用户ID）\",\"columnId\":2,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-07 16:18:34\",\"usableColumn\":false},{\"capJavaField\":\"Term\",\"columnComment\":\"学期标识（示例：2025-2026-1）\",\"columnId\":3,\"columnName\":\"term\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"term\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-07 16:18:34\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-07 16:57:13', 57);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 3, 'com.zhihuitong.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2013', '127.0.0.1', '内网IP', '2013 ', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2026-05-07 17:04:49', 4);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"course\",\"className\":\"StuCourse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-07 16:57:13\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID（对应学号/用户ID）\",\"columnId\":2,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-07 16:57:13\",\"usableColumn\":false},{\"capJavaField\":\"Term\",\"columnComment\":\"学期标识（示例：2025-2026-1）\",\"columnId\":3,\"columnName\":\"term\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"term\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-07 16:57:13\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-07 17:06:54', 30);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 8, 'com.zhihuitong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"stu_course\"}', NULL, 0, NULL, '2026-05-07 17:08:31', 168);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 1, 'com.zhihuitong.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"统计分析\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"countManager\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 10:30:11', 47);
INSERT INTO `sys_oper_log` VALUES (112, '角色管理', 1, 'com.zhihuitong.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2007,2008,2009,2010,2011,2012,2019],\"params\":{},\"roleId\":100,\"roleKey\":\"xiaozhi\",\"roleName\":\"普通角色1\",\"roleSort\":3,\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 10:33:51', 52);
INSERT INTO `sys_oper_log` VALUES (113, '用户管理', 1, 'com.zhihuitong.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"小智\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"status\":\"0\",\"userId\":100,\"userName\":\"xiaozhi\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 10:35:44', 77);
INSERT INTO `sys_oper_log` VALUES (114, '字典类型', 1, 'com.zhihuitong.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"星期几\",\"dictType\":\"course_week\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 11:44:48', 151);
INSERT INTO `sys_oper_log` VALUES (115, '字典数据', 1, 'com.zhihuitong.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"星期一\",\"dictSort\":1,\"dictType\":\"course_week\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 11:45:07', 17);
INSERT INTO `sys_oper_log` VALUES (116, '字典数据', 1, 'com.zhihuitong.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"星期二\",\"dictSort\":2,\"dictType\":\"course_week\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 11:45:17', 13);
INSERT INTO `sys_oper_log` VALUES (117, '字典数据', 1, 'com.zhihuitong.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"星期三\",\"dictSort\":3,\"dictType\":\"course_week\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 11:45:26', 13);
INSERT INTO `sys_oper_log` VALUES (118, '字典数据', 1, 'com.zhihuitong.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"星期四\",\"dictSort\":4,\"dictType\":\"course_week\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 11:45:33', 9);
INSERT INTO `sys_oper_log` VALUES (119, '字典数据', 1, 'com.zhihuitong.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"星期五\",\"dictSort\":5,\"dictType\":\"course_week\",\"dictValue\":\"5\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 11:45:44', 14);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"course\",\"className\":\"StuCourse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-07 17:06:54\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID（对应学号/用户ID）\",\"columnId\":2,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-07 17:06:54\",\"usableColumn\":false},{\"capJavaField\":\"Term\",\"columnComment\":\"学期标识（示例：2025-2026-1）\",\"columnId\":3,\"columnName\":\"term\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"term\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-07 17:06:54\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 11:46:06', 128);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 8, 'com.zhihuitong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"stu_course\"}', NULL, 0, NULL, '2026-05-08 11:46:09', 645);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"course\",\"className\":\"StuCourse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-08 11:46:06\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID（对应学号/用户ID）\",\"columnId\":2,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-08 11:46:06\",\"usableColumn\":false},{\"capJavaField\":\"Term\",\"columnComment\":\"学期标识（示例：2025-2026-1）\",\"columnId\":3,\"columnName\":\"term\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"term\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-08 11:46:06\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 13:57:49', 68);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 8, 'com.zhihuitong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"stu_course\"}', NULL, 0, NULL, '2026-05-08 13:57:54', 96);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"course\",\"className\":\"StuCourse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-08 13:57:49\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID（对应学号/用户ID）\",\"columnId\":2,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-08 13:57:49\",\"usableColumn\":false},{\"capJavaField\":\"Term\",\"columnComment\":\"学期标识（示例：2025-2026-1）\",\"columnId\":3,\"columnName\":\"term\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"term\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-08 13:57:49\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 14:26:00', 55);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"course\",\"className\":\"StuCourse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-08 14:26:00\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID（对应学号/用户ID）\",\"columnId\":2,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-08 14:26:00\",\"usableColumn\":false},{\"capJavaField\":\"Term\",\"columnComment\":\"学期标识（示例：2025-2026-1）\",\"columnId\":3,\"columnName\":\"term\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"term\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-08 14:26:00\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 14:27:05', 44);
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 8, 'com.zhihuitong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"stu_course\"}', NULL, 0, NULL, '2026-05-08 14:27:08', 108);
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"course\",\"className\":\"StuCourse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Integer\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-08 14:27:05\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID（对应学号/用户ID）\",\"columnId\":2,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-08 14:27:05\",\"usableColumn\":false},{\"capJavaField\":\"Term\",\"columnComment\":\"学期标识（示例：2025-2026-1）\",\"columnId\":3,\"columnName\":\"term\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"term\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-05-08 14:27:05\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 16:09:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 14:28:04', 44);
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 8, 'com.zhihuitong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"stu_course\"}', NULL, 0, NULL, '2026-05-08 14:28:06', 271);
INSERT INTO `sys_oper_log` VALUES (129, '参数管理', 2, 'com.zhihuitong.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2026-05-07 14:50:30\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 14:31:15', 105);
INSERT INTO `sys_oper_log` VALUES (130, '通知公告', 1, 'com.zhihuitong.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', '研发部门', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"isRead\":false,\"noticeContent\":\"<p><strong><em>智慧通项目将于五月十五上线</em><span class=\\\"ql-cursor\\\">﻿</span></strong></p>\",\"noticeTitle\":\"智慧通项目上线在即\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 14:33:48', 38);
INSERT INTO `sys_oper_log` VALUES (131, '定时任务', 1, 'com.zhihuitong.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"cronExpression\":\"0/5 * * * * ?\",\"invokeTarget\":\"myTask.showTime()\",\"jobGroup\":\"DEFAULT\",\"jobName\":\"输出时间\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2026-05-08 14:40:15\",\"params\":{},\"status\":\"0\"} ', NULL, 1, 'No bean named \'myTask\' available', '2026-05-08 14:40:14', 23);
INSERT INTO `sys_oper_log` VALUES (132, '定时任务', 1, 'com.zhihuitong.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"cronExpression\":\"0/5 * * * * ?\",\"invokeTarget\":\"myTask.showTime()\",\"jobGroup\":\"DEFAULT\",\"jobName\":\"输出时间\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2026-05-08 14:43:45\",\"params\":{},\"status\":\"0\"} ', NULL, 1, 'No bean named \'myTask\' available', '2026-05-08 14:43:42', 39);
INSERT INTO `sys_oper_log` VALUES (133, '定时任务', 1, 'com.zhihuitong.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"cronExpression\":\"0/5 * * * * ?\",\"invokeTarget\":\"myTask.showTime()\",\"jobGroup\":\"DEFAULT\",\"jobName\":\"输出时间\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2026-05-08 14:46:05\",\"params\":{},\"status\":\"0\"} ', NULL, 1, 'No bean named \'myTask\' available', '2026-05-08 14:46:01', 5);
INSERT INTO `sys_oper_log` VALUES (134, '定时任务', 1, 'com.zhihuitong.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"cronExpression\":\"0/5 * * * * ?\",\"invokeTarget\":\"myTask.showTime()\",\"jobGroup\":\"DEFAULT\",\"jobName\":\"输出时间\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2026-05-08 14:47:35\",\"params\":{},\"status\":\"0\"} ', NULL, 1, 'No bean named \'myTask\' available', '2026-05-08 14:47:33', 3);
INSERT INTO `sys_oper_log` VALUES (135, '定时任务', 1, 'com.zhihuitong.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"cronExpression\":\"0/5 * * * * ?\",\"invokeTarget\":\"myTask.showTime()\",\"jobGroup\":\"DEFAULT\",\"jobName\":\"输出时间\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2026-05-08 14:47:40\",\"params\":{},\"status\":\"0\"} ', NULL, 1, 'No bean named \'myTask\' available', '2026-05-08 14:47:39', 2);
INSERT INTO `sys_oper_log` VALUES (136, '定时任务', 1, 'com.zhihuitong.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"cronExpression\":\"0/5 * * * * ?\",\"invokeTarget\":\"myTask.showTime()\",\"jobGroup\":\"DEFAULT\",\"jobName\":\"输出时间\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2026-05-08 14:50:15\",\"params\":{},\"status\":\"0\"} ', NULL, 1, 'No bean named \'myTask\' available', '2026-05-08 14:50:14', 26);
INSERT INTO `sys_oper_log` VALUES (137, '定时任务', 1, 'com.zhihuitong.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"cronExpression\":\"0/5 * * * * ?\",\"invokeTarget\":\"myTask.showTime()\",\"jobGroup\":\"DEFAULT\",\"jobName\":\"输出时间\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2026-05-08 14:50:45\",\"params\":{},\"status\":\"0\"} ', NULL, 1, 'No bean named \'myTask\' available', '2026-05-08 14:50:40', 1);
INSERT INTO `sys_oper_log` VALUES (138, '定时任务', 1, 'com.zhihuitong.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', '研发部门', '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"cronExpression\":\"0/5 * * * * ?\",\"invokeTarget\":\"myTask.showTime()\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"输出时间\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2026-05-08 14:51:35\",\"params\":{},\"status\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 14:51:34', 215);
INSERT INTO `sys_oper_log` VALUES (139, '定时任务', 2, 'com.zhihuitong.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 14:51:48', 20);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 2, 'com.zhihuitong.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-05-07 14:50:20\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":13,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 15:24:15', 49);
INSERT INTO `sys_oper_log` VALUES (141, '个人信息', 2, 'com.zhihuitong.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"椰子\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-08 15:27:56', 19);
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 1, 'com.zhihuitong.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"B笔记管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"noteManage\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 09:00:13', 43);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 6, 'com.zhihuitong.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"stu_note\",\"tplWebType\":\"element-plus-typescript\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 09:09:53', 63);
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"note\",\"className\":\"StuNote\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":13,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-09 09:09:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID（对应学号/用户ID）\",\"columnId\":14,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-09 09:09:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CourseId\",\"columnComment\":\"关联课程ID（可选，对应 stu_course.id）\",\"columnId\":15,\"columnName\":\"course_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-09 09:09:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"courseId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CourseNameSnapshot\",\"columnComment\":\"课程名称快照（可选；课程被改名/删除后仍可显示）\",\"columnId\":16,\"columnName\":\"course_name_snapshot\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-09 09:09:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 09:20:23', 36);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 8, 'com.zhihuitong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"stu_note\"}', NULL, 0, NULL, '2026-05-09 09:20:33', 285);
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 2, 'com.zhihuitong.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-05-09 09:00:13\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"笔记管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"noteManage\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 09:28:35', 89);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"note\",\"className\":\"StuNote\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":13,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-09 09:09:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2026-05-09 09:20:23\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID（对应学号/用户ID）\",\"columnId\":14,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-09 09:09:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2026-05-09 09:20:23\",\"usableColumn\":false},{\"capJavaField\":\"CourseId\",\"columnComment\":\"关联课程ID（可选，对应 stu_course.id）\",\"columnId\":15,\"columnName\":\"course_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-09 09:09:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"courseId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2026-05-09 09:20:23\",\"usableColumn\":false},{\"capJavaField\":\"CourseNameSnapshot\",\"columnComment\":\"课程名称快照（可选；课程被改名/删除后仍可显示）\",\"columnId\":16,\"columnName\":\"course_name_snapshot\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-09 09:09:53\",\"dictType\":\"\",\"edit\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 09:29:02', 208);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 8, 'com.zhihuitong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"stu_note\"}', NULL, 0, NULL, '2026-05-09 09:29:06', 362);
INSERT INTO `sys_oper_log` VALUES (149, '定时任务', 2, 'com.zhihuitong.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 09:53:02', 85);
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"note\",\"className\":\"StuNote\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":13,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-09 09:09:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2026-05-09 09:29:02\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID（对应学号/用户ID）\",\"columnId\":14,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-09 09:09:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2026-05-09 09:29:02\",\"usableColumn\":false},{\"capJavaField\":\"CourseId\",\"columnComment\":\"关联课程ID（可选，对应 stu_course.id）\",\"columnId\":15,\"columnName\":\"course_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-09 09:09:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"courseId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2026-05-09 09:29:02\",\"usableColumn\":false},{\"capJavaField\":\"CourseNameSnapshot\",\"columnComment\":\"课程名称快照（可选；课程被改名/删除后仍可显示）\",\"columnId\":16,\"columnName\":\"course_name_snapshot\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-09 09:09:53\",\"dictType\":\"\",\"edit\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 10:02:04', 217);
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 8, 'com.zhihuitong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"stu_note\"}', NULL, 0, NULL, '2026-05-09 10:02:14', 431);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 6, 'com.zhihuitong.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"stu_note_template\",\"tplWebType\":\"element-plus-typescript\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 10:07:28', 82);
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"template\",\"className\":\"StuNoteTemplate\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":23,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-09 10:07:28\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生ID（为空表示系统内置模板；不为空表示学生自定义模板）\",\"columnId\":24,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-09 10:07:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"模板名称\",\"columnId\":25,\"columnName\":\"name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-09 10:07:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"模板类型（CLASS/EXPERIMENT/INTERVIEW/CUSTOM）\",\"columnId\":26,\"columnName\":\"type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-09 10:07:28\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 10:08:25', 56);
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 8, 'com.zhihuitong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"stu_note_template\"}', NULL, 0, NULL, '2026-05-09 10:08:28', 108);
INSERT INTO `sys_oper_log` VALUES (155, '学习笔记', 1, 'com.zhihuitong.note.controller.StuNoteController.add()', 'POST', 1, 'admin', '研发部门', '/note/note', '127.0.0.1', '内网IP', '{\"content\":\"<p># 主题：</p><p>啊啊</p><p><br></p><p>## 问题</p><p>啊啊</p><p><br></p><p>## 我的回答（简版）</p><p><br></p><p>啊啊</p><p>## 标准答案/要点</p><p><br></p><p>- </p><p>啊啊</p><p><br></p><p>## 扩展追问</p><p><br></p><p>- 啊啊</p><p><br></p><p><br></p><p>## 相关链接/资料</p><p><br></p><p>- 啊啊</p><p><br></p>\",\"courseId\":1,\"courseNameSnapshot\":\"Java\",\"id\":6,\"params\":{},\"studentId\":1003,\"tags\":\"啊啊\",\"title\":\"无\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 10:14:21', 36);
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 8, 'com.zhihuitong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"stu_note\"}', NULL, 0, NULL, '2026-05-09 10:27:54', 590);
INSERT INTO `sys_oper_log` VALUES (157, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/stu_note', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 10:28:05', 223);
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 8, 'com.zhihuitong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"stu_note\"}', NULL, 0, NULL, '2026-05-09 10:28:07', 114);
INSERT INTO `sys_oper_log` VALUES (159, '学习笔记', 1, 'com.zhihuitong.note.controller.StuNoteController.add()', 'POST', 1, 'admin', '研发部门', '/note/note', '127.0.0.1', '内网IP', '{\"content\":\"<p># 实验名称：</p><p>啊啊</p><p><br></p><p>## 实验目的</p><p><br></p><p>- 啊啊</p><p><br></p><p><br></p><p>## 实验环境</p><p>啊啊</p><p>- OS：</p><p><br></p><p>- 语言/框架：</p><p>啊啊</p><p>- 依赖版本：</p><p><br></p><p>啊啊</p><p>## 实验步骤</p><p>啊啊</p><p>1. </p><p>啊啊</p><p>2. </p><p><br></p><p><br></p><p>## 关键代码/命令</p><p><br></p><p>```text</p><p>啊啊</p><p><br></p><p>```</p><p><br></p><p><br></p><p>## 结果与截图</p><p><br></p><p>- </p><p>啊啊</p><p><br></p><p>## 问题与解决</p><p><br></p><p>- 啊啊</p><p><br></p><p><br></p><p>## 总结</p><p>啊啊</p><p>- </p><p><br></p>\",\"courseId\":1,\"courseNameSnapshot\":\"Java\",\"coverImage\":\"/profile/upload/2026/05/09/3-1_20260509103216A001.jpg\",\"id\":6,\"params\":{},\"studentId\":1001,\"tags\":\"啊啊\",\"title\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 10:32:49', 34);
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 3, 'com.zhihuitong.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2035', '127.0.0.1', '内网IP', '2035 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 10:36:43', 17);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 3, 'com.zhihuitong.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2036', '127.0.0.1', '内网IP', '2036 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 10:36:46', 11);
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 3, 'com.zhihuitong.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2037', '127.0.0.1', '内网IP', '2037 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 10:36:48', 13);
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 3, 'com.zhihuitong.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2038', '127.0.0.1', '内网IP', '2038 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 10:36:52', 15);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 3, 'com.zhihuitong.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2039', '127.0.0.1', '内网IP', '2039 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 10:36:54', 14);
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 3, 'com.zhihuitong.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2034', '127.0.0.1', '内网IP', '2034 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 10:36:57', 11);
INSERT INTO `sys_oper_log` VALUES (166, '学习笔记', 2, 'com.zhihuitong.note.controller.StuNoteController.edit()', 'PUT', 1, 'admin', '研发部门', '/note/note', '127.0.0.1', '内网IP', '{\"content\":\"<p># 实验名称：</p><p>啊啊</p><p><br></p><p>## 实验目的</p><p><br></p><p>- 啊啊</p><p><br></p><p><br></p><p>## 实验环境</p><p>啊啊</p><p>- OS：</p><p><br></p><p>- 语言/框架：</p><p>啊啊</p><p>- 依赖版本：</p><p><br></p><p>啊啊</p><p>## 实验步骤</p><p>啊啊</p><p>1. </p><p>啊啊</p><p>2. </p><p><br></p><p><br></p><p>## 关键代码/命令</p><p><br></p><p>```text</p><p>啊啊</p><p><br></p><p>```</p><p><br></p><p><br></p><p>## 结果与截图</p><p><br></p><p>- </p><p>啊啊</p><p><br></p><p>## 问题与解决</p><p><br></p><p>- 啊啊</p><p><br></p><p><br></p><p>## 总结</p><p>啊啊</p><p>- </p><p><br></p>\",\"courseId\":1,\"courseNameSnapshot\":\"Java\",\"coverImage\":\"https://cdn.moliya.love/Ossimages/2026/05/09/1778307150976.png\",\"createdAt\":\"2026-05-09\",\"id\":6,\"params\":{},\"studentId\":1001,\"tags\":\"啊啊\",\"title\":\"1\",\"updatedAt\":\"2026-05-09\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 06:12:35', 31);
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 1, 'com.zhihuitong.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"student\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-09 08:42:51', 45);
INSERT INTO `sys_oper_log` VALUES (168, 'AI 聊天', 3, 'com.zhihuitong.agent.controller.AgentChatController.deleteMemory()', 'DELETE', 1, 'admin', '研发部门', '/agent/chat/memory/5c6e00bb-c869-45ee-b757-75213973a8aa', '127.0.0.1', '内网IP', '\"5c6e00bb-c869-45ee-b757-75213973a8aa\" ', '{\"msg\":\"{\\\"code\\\":200,\\\"msg\\\":\\\"记忆已清除\\\",\\\"data\\\":null}\",\"code\":200}', 0, NULL, '2026-05-10 02:54:59', 91);
INSERT INTO `sys_oper_log` VALUES (169, 'AI 聊天', 3, 'com.zhihuitong.agent.controller.AgentChatController.deleteMemory()', 'DELETE', 1, 'admin', '研发部门', '/agent/chat/memory/cf418a0c-d981-4fe9-9028-df4cd3292825', '127.0.0.1', '内网IP', '\"cf418a0c-d981-4fe9-9028-df4cd3292825\" ', '{\"msg\":\"{\\\"code\\\":200,\\\"msg\\\":\\\"记忆已清除\\\",\\\"data\\\":null}\",\"code\":200}', 0, NULL, '2026-05-10 06:26:31', 311);
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 1, 'com.zhihuitong.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"校园信息\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"campus\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:04:45', 49);
INSERT INTO `sys_oper_log` VALUES (171, '创建表', 0, 'com.zhihuitong.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"tplWebType\":\"element-plus-typescript\",\"sql\":\"CREATE TABLE sys_campus_knowledge_type (\\n    id bigint NOT NULL AUTO_INCREMENT COMMENT \'主键ID\',\\n    type_name varchar(50) NOT NULL COMMENT \'分类名称：规章制度/办事流程/校风校纪/通告批评\',\\n    sort int DEFAULT 0 COMMENT \'排序号\',\\n    status char(1) DEFAULT \'0\' COMMENT \'状态 0正常 1停用\',\\n    create_time datetime DEFAULT CURRENT_TIMESTAMP,\\n    PRIMARY KEY (id)\\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=\'校园知识分类表\';\\n\\nCREATE TABLE sys_campus_knowledge (\\n    id bigint NOT NULL AUTO_INCREMENT COMMENT \'主键ID\',\\n    type_id bigint NOT NULL COMMENT \'分类ID\',\\n    title varchar(200) NOT NULL COMMENT \'知识标题\',\\n    content longtext COMMENT \'富文本正文内容\',\\n    file_url varchar(500) COMMENT \'附件地址（PDF/Word）\',\\n    status char(1) DEFAULT \'0\' COMMENT \'状态 0草稿 1已发布\',\\n    create_by varchar(64) DEFAULT \'\' COMMENT \'创建者\',\\n    create_time datetime DEFAULT CURRENT_TIMESTAMP,\\n    update_time datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,\\n    PRIMARY KEY (id)\\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=\'校园知识内容表\';\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:06:50', 308);
INSERT INTO `sys_oper_log` VALUES (172, '字典类型', 1, 'com.zhihuitong.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"规章制度\",\"dictType\":\"rules_regulations\",\"params\":{},\"remark\":\"这是校园的规章制度\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:11:47', 22);
INSERT INTO `sys_oper_log` VALUES (173, '字典类型', 1, 'com.zhihuitong.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"办事流程\",\"dictType\":\"workprocess\",\"params\":{},\"remark\":\"学校相关事项的办理流程\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:12:36', 14);
INSERT INTO `sys_oper_log` VALUES (174, '字典类型', 1, 'com.zhihuitong.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"校风校纪\",\"dictType\":\"schooldiscipline\",\"params\":{},\"remark\":\"校风校纪\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:13:08', 14);
INSERT INTO `sys_oper_log` VALUES (175, '字典类型', 1, 'com.zhihuitong.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"通告批评\",\"dictType\":\"criticismnotice\",\"params\":{},\"remark\":\"通告批评\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:13:39', 12);
INSERT INTO `sys_oper_log` VALUES (176, '字典类型', 2, 'com.zhihuitong.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:11:47\",\"dictId\":101,\"dictName\":\"校园知识\",\"dictType\":\"rules_regulations\",\"params\":{},\"remark\":\"这是校园的所有知识类型\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:23:59', 48);
INSERT INTO `sys_oper_log` VALUES (177, '字典数据', 1, 'com.zhihuitong.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"规章制度\",\"dictSort\":0,\"dictType\":\"rules_regulations\",\"dictValue\":\"rulesRegulations\",\"listClass\":\"default\",\"params\":{},\"remark\":\"这是校园的规章制度\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:24:46', 19);
INSERT INTO `sys_oper_log` VALUES (178, '字典数据', 1, 'com.zhihuitong.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"办事流程\",\"dictSort\":0,\"dictType\":\"rules_regulations\",\"dictValue\":\"workProcess\",\"listClass\":\"default\",\"params\":{},\"remark\":\"这是校园事项的操作流程\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:25:18', 13);
INSERT INTO `sys_oper_log` VALUES (179, '字典数据', 1, 'com.zhihuitong.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"校风校纪\",\"dictSort\":0,\"dictType\":\"rules_regulations\",\"dictValue\":\"schoolDiscipline\",\"listClass\":\"default\",\"params\":{},\"remark\":\"这是校风校纪\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:25:44', 13);
INSERT INTO `sys_oper_log` VALUES (180, '字典数据', 1, 'com.zhihuitong.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"通告批评\",\"dictSort\":0,\"dictType\":\"rules_regulations\",\"dictValue\":\"criticismNotice\",\"listClass\":\"default\",\"params\":{},\"remark\":\"这是有关的通告批评记录\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:26:16', 14);
INSERT INTO `sys_oper_log` VALUES (181, '字典类型', 3, 'com.zhihuitong.web.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/102', '127.0.0.1', '内网IP', '[102] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:26:28', 19);
INSERT INTO `sys_oper_log` VALUES (182, '字典类型', 3, 'com.zhihuitong.web.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/103', '127.0.0.1', '内网IP', '[103] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:26:30', 14);
INSERT INTO `sys_oper_log` VALUES (183, '字典类型', 3, 'com.zhihuitong.web.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/104', '127.0.0.1', '内网IP', '[104] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:26:32', 15);
INSERT INTO `sys_oper_log` VALUES (184, '字典类型', 1, 'com.zhihuitong.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"校园信息\",\"dictType\":\"statue\",\"params\":{},\"remark\":\"校园信息是否发布\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:33:16', 14);
INSERT INTO `sys_oper_log` VALUES (185, '字典类型', 2, 'com.zhihuitong.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:33:16\",\"dictId\":105,\"dictName\":\"校园信息\",\"dictType\":\"statue\",\"params\":{},\"remark\":\"校园信息是否发布\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:33:22', 31);
INSERT INTO `sys_oper_log` VALUES (186, '字典数据', 1, 'com.zhihuitong.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"草稿\",\"dictSort\":0,\"dictType\":\"statue\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"remark\":\"没有发布\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:33:57', 12);
INSERT INTO `sys_oper_log` VALUES (187, '字典数据', 1, 'com.zhihuitong.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已发布\",\"dictSort\":0,\"dictType\":\"statue\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"已经发布了\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:34:07', 13);
INSERT INTO `sys_oper_log` VALUES (188, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"knowledge\",\"className\":\"SysCampusKnowledge\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":33,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:06:50\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TypeId\",\"columnComment\":\"分类ID\",\"columnId\":34,\"columnName\":\"type_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:06:50\",\"dictType\":\"rules_regulations\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"知识标题\",\"columnId\":35,\"columnName\":\"title\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:06:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"富文本正文内容\",\"columnId\":36,\"columnName\":\"content\",\"columnType\":\"longtext\",\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:06:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"jav', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:35:32', 77);
INSERT INTO `sys_oper_log` VALUES (189, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"type\",\"className\":\"SysCampusKnowledgeType\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":42,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:06:50\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TypeName\",\"columnComment\":\"分类名称：规章制度/办事流程/校风校纪/通告批评\",\"columnId\":43,\"columnName\":\"type_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:06:50\",\"dictType\":\"rules_regulations\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"typeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序号\",\"columnId\":44,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:06:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"sort\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态 0正常 1停用\",\"columnId\":45,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:06:50\",\"dictType\":\"statue\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:36:34', 33);
INSERT INTO `sys_oper_log` VALUES (190, '字典类型', 2, 'com.zhihuitong.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:11:47\",\"dictId\":101,\"dictName\":\"知识内容\",\"dictType\":\"sys_normal_disable\",\"params\":{},\"remark\":\"这是校园的所有知识类型\",\"status\":\"0\"} ', '{\"msg\":\"修改字典\'知识内容\'失败，字典类型已存在\",\"code\":500}', 0, NULL, '2026-05-10 07:41:45', 5);
INSERT INTO `sys_oper_log` VALUES (191, '字典类型', 1, 'com.zhihuitong.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"知识内容分类\",\"dictType\":\"sys_campus_knowledge_type\",\"params\":{},\"remark\":\"这是知识分类表的字典\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:42:44', 15);
INSERT INTO `sys_oper_log` VALUES (192, '字典数据', 1, 'com.zhihuitong.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正常\",\"dictSort\":0,\"dictType\":\"sys_campus_knowledge_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"remark\":\"正常\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:43:09', 13);
INSERT INTO `sys_oper_log` VALUES (193, '字典数据', 1, 'com.zhihuitong.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"停用\",\"dictSort\":0,\"dictType\":\"sys_campus_knowledge_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:43:20', 12);
INSERT INTO `sys_oper_log` VALUES (194, '字典类型', 1, 'com.zhihuitong.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"知识内容\",\"dictType\":\"sys_campus_knowledge\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:43:52', 12);
INSERT INTO `sys_oper_log` VALUES (195, '字典数据', 1, 'com.zhihuitong.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"草稿\",\"dictSort\":0,\"dictType\":\"sys_campus_knowledge\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:44:03', 14);
INSERT INTO `sys_oper_log` VALUES (196, '字典数据', 1, 'com.zhihuitong.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已发布\",\"dictSort\":0,\"dictType\":\"sys_campus_knowledge\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:44:09', 12);
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"knowledge\",\"className\":\"SysCampusKnowledge\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":33,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:06:50\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-05-10 07:35:32\",\"usableColumn\":false},{\"capJavaField\":\"TypeId\",\"columnComment\":\"分类ID\",\"columnId\":34,\"columnName\":\"type_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:06:50\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-05-10 07:35:32\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"知识标题\",\"columnId\":35,\"columnName\":\"title\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:06:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-05-10 07:35:32\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"富文本正文内容\",\"columnId\":36,\"columnName\":\"content\",\"columnType\":\"longtext\",\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:06:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:44:34', 42);
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 2, 'com.zhihuitong.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"type\",\"className\":\"SysCampusKnowledgeType\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":42,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:06:50\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-05-10 07:36:34\",\"usableColumn\":false},{\"capJavaField\":\"TypeName\",\"columnComment\":\"分类名称：规章制度/办事流程/校风校纪/通告批评\",\"columnId\":43,\"columnName\":\"type_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:06:50\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"typeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-05-10 07:36:34\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序号\",\"columnId\":44,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:06:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"sort\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-05-10 07:36:34\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态 0正常 1停用\",\"columnId\":45,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2026-05-10 07:06:50\",\"dictType\":\"sys_campus_knowledge_type\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-05-10 07:44:49', 29);
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 8, 'com.zhihuitong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_campus_knowledge\"}', NULL, 0, NULL, '2026-05-10 07:44:59', 277);
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 8, 'com.zhihuitong.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_campus_knowledge_type\"}', NULL, 0, NULL, '2026-05-10 07:45:01', 112);
INSERT INTO `sys_oper_log` VALUES (201, 'RAG 索引', 2, 'com.zhihuitong.agent.controller.AgentRagController.indexKnowledge()', 'POST', 1, 'admin', '研发部门', '/agent/rag/index/knowledge', '127.0.0.1', '内网IP', '', '{\"msg\":\"知识库索引完成\",\"code\":200,\"data\":\"{\\\"code\\\":200,\\\"msg\\\":\\\"Knowledge indexing complete\\\",\\\"data\\\":{\\\"total\\\":0,\\\"indexed\\\":0,\\\"skipped\\\":0,\\\"errors\\\":0}}\"}', 0, NULL, '2026-05-10 09:37:25', 234);
INSERT INTO `sys_oper_log` VALUES (202, 'AI 聊天', 3, 'com.zhihuitong.agent.controller.AgentChatController.deleteMemory()', 'DELETE', 1, 'admin', '研发部门', '/agent/chat/memory/f871625c-2314-42a1-aa92-442342f197e2', '127.0.0.1', '内网IP', '\"f871625c-2314-42a1-aa92-442342f197e2\" ', '{\"msg\":\"{\\\"code\\\":200,\\\"msg\\\":\\\"记忆已清除\\\",\\\"data\\\":null}\",\"code\":200}', 0, NULL, '2026-05-10 09:37:36', 29);
INSERT INTO `sys_oper_log` VALUES (203, 'AI 聊天', 3, 'com.zhihuitong.agent.controller.AgentChatController.deleteMemory()', 'DELETE', 1, 'admin', '研发部门', '/agent/chat/memory/9870ebd7-0aef-4698-acfb-6b55599018eb', '127.0.0.1', '内网IP', '\"9870ebd7-0aef-4698-acfb-6b55599018eb\" ', '{\"msg\":\"{\\\"code\\\":200,\\\"msg\\\":\\\"记忆已清除\\\",\\\"data\\\":null}\",\"code\":200}', 0, NULL, '2026-05-10 09:46:42', 21);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2026-05-07 14:50:18', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2026-05-07 14:50:18', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2026-05-07 14:50:18', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2026-05-07 14:50:18', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2026-05-07 14:50:19', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2026-05-07 14:50:19', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '普通角色1', 'xiaozhi', 3, '1', 1, 1, '0', '0', 'admin', '2026-05-08 10:33:51', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2019);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '椰子', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-05-10 19:05:58', '2026-05-07 14:50:17', 'admin', '2026-05-07 14:50:17', '', '2026-05-08 15:27:56', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-05-07 14:50:17', '2026-05-07 14:50:17', 'admin', '2026-05-07 14:50:17', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (3, NULL, 'xiaozhi', '小智', '00', '', '', '0', '', '$2a$10$sLIOrBV4/4yCXIqvRC2ezuDVYSXcIQj6y2X4IfuVs6bhyr7d/YAQe', '0', '0', '127.0.0.1', '2026-05-08 14:34:42', NULL, 'admin', '2026-05-08 10:35:44', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);

SET FOREIGN_KEY_CHECKS = 1;
