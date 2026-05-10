-- Agent 管理菜单（若依 sys_menu 表）
-- 前提：已执行 agent_menu.sql 创建了 "AI 助手" 一级菜单
-- 执行此 SQL 后，AI 助手目录下会显示 "Agent 管理" 菜单项

-- 获取 AI 助手目录的 menu_id（假设已存在）
-- 如果 AI 助手目录不存在，请先执行 agent_menu.sql

-- 二级菜单：Agent 管理
SET @agent_menu_id = (SELECT menu_id FROM sys_menu WHERE menu_name = 'AI 助手' AND menu_type = 'M' LIMIT 1);

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark)
VALUES ('Agent 管理', @agent_menu_id, 2, 'manage', 'agent/manage/index', '', '', 1, 0, 'C', '0', 0, 'agent:manage:list', 'monitor', 'admin', NOW(), 'Agent 管理菜单');

-- 按钮权限
SET @manage_menu_id = LAST_INSERT_ID();

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark)
VALUES ('Agent 状态查询', @manage_menu_id, 1, '#', '', '', '', 1, 0, 'F', '0', 0, 'agent:manage:query', '#', 'admin', NOW(), '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark)
VALUES ('Agent 状态修改', @manage_menu_id, 2, '#', '', '', '', 1, 0, 'F', '0', 0, 'agent:manage:edit', '#', 'admin', NOW(), '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark)
VALUES ('Agent 配置修改', @manage_menu_id, 3, '#', '', '', '', 1, 0, 'F', '0', 0, 'agent:manage:config', '#', 'admin', NOW(), '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark)
VALUES ('Agent 会话删除', @manage_menu_id, 4, '#', '', '', '', 1, 0, 'F', '0', 0, 'agent:manage:remove', '#', 'admin', NOW(), '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark)
VALUES ('Agent 索引重建', @manage_menu_id, 5, '#', '', '', '', 1, 0, 'F', '0', 0, 'agent:manage:reindex', '#', 'admin', NOW(), '');
