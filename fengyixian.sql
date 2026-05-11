/*Table structure for table `logistics_water` */

DROP TABLE IF EXISTS `logistics_water`;

CREATE TABLE `logistics_water` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `area_name` VARCHAR(100) DEFAULT '' COMMENT '区域名称',
  `device_name` VARCHAR(100) DEFAULT '' COMMENT '设备名称',
  `device_code` VARCHAR(64) DEFAULT '' COMMENT '设备编号',
  `water_consumption` DECIMAL(10,2) DEFAULT '0.00' COMMENT '用水量(吨)',
  `use_status` CHAR(1) DEFAULT '0' COMMENT '使用状态 0正常 1异常 2离线',
  `use_date` DATE DEFAULT NULL COMMENT '使用日期',
  `remark` VARCHAR(500) DEFAULT '' COMMENT '备注',
  `create_by` VARCHAR(64) DEFAULT '' COMMENT '创建者',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_by` VARCHAR(64) DEFAULT '' COMMENT '更新者',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='水控管理表';

/*Data for the table `logistics_water` */

INSERT  INTO `logistics_water`(`id`,`area_name`,`device_name`,`device_code`,`water_consumption`,`use_status`,`use_date`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`) VALUES (1,'1号楼1层','水表1号','WATER001','12.50','0','2025-12-01','正常使用','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(2,'1号楼2层','水表2号','WATER002','8.30','0','2025-12-01','正常使用','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(3,'2号楼1层','水表3号','WATER003','15.20','1','2025-12-01','流量异常','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(4,'2号楼2层','水表4号','WATER004','10.00','0','2025-12-01','','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(5,'3号楼1层','水表5号','WATER005','22.10','0','2025-12-01','','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(6,'3号楼2层','水表6号','WATER006','5.70','2','2025-12-01','设备离线','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(7,'食堂区域','水表7号','WATER007','35.80','0','2025-12-01','用水量较大','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(8,'宿舍A区','水表8号','WATER008','18.20','0','2025-12-01','','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(9,'宿舍B区','水表9号','WATER009','9.40','1','2025-12-01','需检修','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(10,'办公楼','水表10号','WATER010','7.90','0','2025-12-01','','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;




/*Table structure for table `logistics_electric` */

DROP TABLE IF EXISTS `logistics_electric`;

CREATE TABLE `logistics_electric` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `area_name` VARCHAR(100) DEFAULT '' COMMENT '区域名称',
  `device_name` VARCHAR(100) DEFAULT '' COMMENT '设备名称',
  `device_code` VARCHAR(64) DEFAULT '' COMMENT '设备编号',
  `electric_consumption` DECIMAL(10,2) DEFAULT '0.00' COMMENT '用电量(度)',
  `use_status` CHAR(1) DEFAULT '0' COMMENT '使用状态 0正常 1异常 2离线',
  `use_date` DATE DEFAULT NULL COMMENT '使用日期',
  `remark` VARCHAR(500) DEFAULT '' COMMENT '备注',
  `create_by` VARCHAR(64) DEFAULT '' COMMENT '创建者',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_by` VARCHAR(64) DEFAULT '' COMMENT '更新者',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='电控管理表';

/*Data for the table `logistics_electric` */

INSERT  INTO `logistics_electric`(`id`,`area_name`,`device_name`,`device_code`,`electric_consumption`,`use_status`,`use_date`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`) VALUES (1,'1号楼1层','电表1号','ELEC001','120.50','0','2025-12-01','正常使用','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(2,'1号楼2层','电表2号','ELEC002','95.30','0','2025-12-01','','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(3,'2号楼1层','电表3号','ELEC003','210.25','1','2025-12-01','电压异常','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(4,'2号楼2层','电表4号','ELEC004','88.70','0','2025-12-01','','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(5,'3号楼1层','电表5号','ELEC005','165.10','0','2025-12-01','','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(6,'3号楼2层','电表6号','ELEC006','45.20','2','2025-12-01','设备离线','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(7,'食堂区域','电表7号','ELEC007','420.80','0','2025-12-01','大功率设备','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(8,'宿舍A区','电表8号','ELEC008','198.30','0','2025-12-01','','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(9,'宿舍B区','电表9号','ELEC009','112.60','1','2025-12-01','需检修','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11'),(10,'办公楼','电表10号','ELEC010','75.40','0','2025-12-01','','admin','2026-05-10 08:59:11','admin','2026-05-10 08:59:11');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;





/*Table structure for table `logistics_repair` */

DROP TABLE IF EXISTS `logistics_repair`;

CREATE TABLE `logistics_repair` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `repair_no` VARCHAR(64) DEFAULT '' COMMENT '报修单号',
  `repair_type` VARCHAR(32) DEFAULT '' COMMENT '报修类型 0水控 1电控 2其他',
  `repair_title` VARCHAR(200) DEFAULT '' COMMENT '报修标题',
  `repair_content` VARCHAR(500) DEFAULT '' COMMENT '报修内容',
  `repair_person` VARCHAR(64) DEFAULT '' COMMENT '报修人',
  `repair_phone` VARCHAR(32) DEFAULT '' COMMENT '报修电话',
  `repair_address` VARCHAR(255) DEFAULT '' COMMENT '报修地点',
  `repair_status` CHAR(1) DEFAULT '0' COMMENT '报修状态 0待处理 1处理中 2已完成 3已取消',
  `handle_person` VARCHAR(64) DEFAULT '' COMMENT '处理人',
  `handle_content` VARCHAR(500) DEFAULT '' COMMENT '处理结果',
  `handle_time` DATETIME DEFAULT NULL COMMENT '处理时间',
  `repair_image` VARCHAR(500) DEFAULT NULL COMMENT '报修照片',
  `handle_image` VARCHAR(500) DEFAULT NULL COMMENT '处理照片',
  `sort` INT DEFAULT '0' COMMENT '排序',
  `remark` VARCHAR(500) DEFAULT '' COMMENT '备注',
  `create_by` VARCHAR(64) DEFAULT '' COMMENT '创建者',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_by` VARCHAR(64) DEFAULT '' COMMENT '更新者',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='报修管理表';

/*Data for the table `logistics_repair` */

INSERT  INTO `logistics_repair`(`id`,`repair_no`,`repair_type`,`repair_title`,`repair_content`,`repair_person`,`repair_phone`,`repair_address`,`repair_status`,`handle_person`,`handle_content`,`handle_time`,`repair_image`,`handle_image`,`sort`,`remark`,`create_by`,`create_time`,`update_by`,`update_time`) VALUES (1,'REP20260510001','0','1楼水表漏水','<p>走廊水表接头处漏水，需要紧急维修</p>','张三','13800138001','1号楼1层走廊','0','','',NULL,'https://cdn.moliya.love/ossimages/2026/05/10/537e3fbc-214a-44f2-b149-8a6380186e1c.jpg','',1,'','admin','2026-05-10 09:55:27','admin','2026-05-10 17:01:49'),(2,'REP20260510002','1','2楼电表跳闸','办公室电表频繁跳闸，无法正常用电','李四','13800138002','2号楼2层办公室','1','王工','已更换空开，恢复供电','2026-05-10 09:55:27','','',2,'','admin','2026-05-10 09:55:27','admin','2026-05-10 09:55:27'),(3,'REP20260510003','0','水表不计数','3楼水表数字不动，用水量不更新','王五','13800138003','3号楼1层','2','李工','更换新水表，计量恢复正常','2026-05-10 09:55:27','','',3,'','admin','2026-05-10 09:55:27','admin','2026-05-10 09:55:27'),(4,'REP20260510004','1','食堂电表离线','食堂配电房电表无法联网，数据上传失败','赵六','13800138004','食堂配电房','0','','',NULL,'','',4,'','admin','2026-05-10 09:55:27','admin','2026-05-10 09:55:27'),(5,'REP20260510005','2','宿舍水龙头损坏','A区201洗手池水龙头断裂漏水','孙七','13800138005','宿舍A区201','1','张师傅','正在更换配件','2026-05-10 09:55:27','','',5,'','admin','2026-05-10 09:55:27','admin','2026-05-10 09:55:27'),(6,'REP20260510006','0','卫生间下水堵塞','B区305卫生间下水管道堵塞，污水外溢','周八','13800138006','宿舍B区305','2','刘师傅','已疏通管道，排水恢复正常','2026-05-10 09:55:27','','',6,'','admin','2026-05-10 09:55:27','admin','2026-05-10 09:55:27'),(7,'REP20260510007','1','办公室线路短路','办公楼203房间线路短路，无电','吴九','13800138007','办公楼203','3','','',NULL,'','',7,'用户取消报修','admin','2026-05-10 09:55:27','admin','2026-05-10 09:55:27'),(8,'REP20260510008','0','用水量突增异常','1号楼3层用水量突增，怀疑管道漏水','郑十','13800138008','1号楼3层','0','','',NULL,'','',8,'','admin','2026-05-10 09:55:27','admin','2026-05-10 09:55:27'),(9,'REP20260510009','1','电表读数不准','2号楼3层电表计量误差较大，怀疑电表故障','冯一','13800138009','2号楼3层','1','陈工','正在对电表进行校验','2026-05-10 09:55:27','','',9,'','admin','2026-05-10 09:55:27','admin','2026-05-10 09:55:27'),(10,'REP20260510010','2','走廊照明灯不亮','办公楼大厅多盏照明灯损坏，影响通行','陈二','13800138010','办公楼大厅','2','电工','已更换损坏灯管，全部恢复照明','2026-05-10 09:55:27','','',10,'','admin','2026-05-10 09:55:27','admin','2026-05-10 09:55:27'),(11,'','','','','','','','0','','',NULL,'https://zzyl-nursing-bucket.oss-cn-beijing.aliyuncs.com/images/2026/05/10/1778382328217.jpg',NULL,0,'','','2026-05-10 10:46:59','','2026-05-10 11:05:32'),(12,'','0','','','','','','0','','',NULL,NULL,NULL,0,'','','2026-05-10 15:17:08','',NULL),(13,'','0','11','<p>11</p>','11','11','11','0','','',NULL,'/profile/upload/2026/05/10/cat-1_20260510154511A001.jpg',NULL,0,'1','','2026-05-10 15:45:13','',NULL),(14,'','','','<p><br></p>','','','','0','','',NULL,'https://cdn.moliya.love/ossimages/2026/05/10/716d1e5f-c46e-422f-93a2-baeafd3d8131.jpg',NULL,0,'','','2026-05-10 17:03:13','',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('水控管理', '2065', '1', 'water', 'water/water/index', 1, 0, 'C', '0', '0', 'water:water:list', '#', 'admin', sysdate(), '', null, '水控管理菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('水控管理查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'water:water:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('水控管理新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'water:water:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('水控管理修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'water:water:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('水控管理删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'water:water:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('水控管理导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'water:water:export',       '#', 'admin', sysdate(), '', null, '');


-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('电控管理', '2065', '1', 'electric', 'electric/electric/index', 1, 0, 'C', '0', '0', 'electric:electric:list', '#', 'admin', sysdate(), '', null, '电控管理菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('电控管理查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'electric:electric:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('电控管理新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'electric:electric:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('电控管理修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'electric:electric:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('电控管理删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'electric:electric:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('电控管理导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'electric:electric:export',       '#', 'admin', sysdate(), '', null, '');


-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('报修管理', '2065', '1', 'repair', 'repair/repair/index', 1, 0, 'C', '0', '0', 'repair:repair:list', '#', 'admin', sysdate(), '', null, '报修管理菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('报修管理查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'repair:repair:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('报修管理新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'repair:repair:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('报修管理修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'repair:repair:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('报修管理删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'repair:repair:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('报修管理导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'repair:repair:export',       '#', 'admin', sysdate(), '', null, '');