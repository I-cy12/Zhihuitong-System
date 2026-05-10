/**
 * API 类型统一导出
 */
export * from "./common";

// 登录模块
export * from "./login";
export * from "./menu";

// System 模块
export * from "./system/user";
export * from "./system/role";
export * from "./system/menu";
export * from "./system/dept";
export * from "./system/post";
export * from "./system/dict";
export * from "./system/config";
export * from "./system/notice";

// monitor 模块
export * from "./monitor/cache";
export * from "./monitor/job";
export * from "./monitor/jobLog";
export * from "./monitor/logininfor";
export * from "./monitor/operlog";
export * from "./monitor/online";

// 代码生成模块
export * from "./tool/gen";

// AI 聊天模块
export * from "./agent";

// 知识模块
export * from "./knowledge/knowledge";
export * from "./knowledge/type";

export * from "./template/template";
