-- AI 助手菜单（若依 sys_menu 表）
-- 执行此 SQL 后，侧边栏会显示 "AI 助手" 菜单项

-- 一级菜单：AI 助手
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark)
VALUES ('AI 助手', 0, 4, 'agent', NULL, '', '', 1, 0, 'M', '0', 0, '', 'chat', 'admin', NOW(), 'AI 智能助手目录');

-- 二级菜单：AI 对话
SET @agent_menu_id = LAST_INSERT_ID();
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark)
VALUES ('AI 对话', @agent_menu_id, 1, 'chat', 'agent/chat/index', '', '', 1, 0, 'C', '0', 0, 'agent:chat:list', 'chat', 'admin', NOW(), 'AI 对话菜单');

-- 按钮权限（可选）
SET @chat_menu_id = LAST_INSERT_ID();
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark)
VALUES ('AI 对话查询', @chat_menu_id, 1, '#', '', '', '', 1, 0, 'F', '0', 0, 'agent:chat:query', '#', 'admin', NOW(), '');
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark)
VALUES ('AI 对话新增', @chat_menu_id, 2, '#', '', '', '', 1, 0, 'F', '0', 0, 'agent:chat:add', '#', 'admin', NOW(), '');
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark)
VALUES ('AI 对话删除', @chat_menu_id, 3, '#', '', '', '', 1, 0, 'F', '0', 0, 'agent:chat:remove', '#', 'admin', NOW(), '');
