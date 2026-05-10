# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 语言要求

**始终使用中文进行所有回答和输出。** 包括代码注释、提交信息说明、错误分析、方案建议等，一律使用中文。代码本身（变量名、函数名等）保持英文。

## Project Overview

Zhihuitong (校园智慧通) is a campus management system built on the RuoYi v3.9.2 framework. It consists of a Java Spring Boot backend and two frontend applications.

## Repository Structure

- `zhihuitong/` — Java backend (Spring Boot 3.5, Java 17, Maven multi-module)
- `frontend/` — Primary frontend (Vue 3, TypeScript, Vite, Element Plus)
- `zhihuitong/zhihuitong-ui/` — Legacy frontend (Vue 2, JavaScript, Vue CLI, Element UI)
- `zhihuitong-agent-python/` — Python AI agent service (LangChain + LangGraph + FastAPI)
- `zhihuitong.sql` — Database schema/seed SQL

## Backend Architecture

Maven multi-module project with groupId `com.zhihuitong`:

| Module | Purpose |
|---|---|
| `zhihuitong-admin` | Main Spring Boot application entry point, REST controllers |
| `zhihuitong-framework` | Security config, AOP aspects, datasource, interceptors |
| `zhihuitong-system` | System domain entities, mappers, services (user/role/dept/menu/config) |
| `zhihuitong-common` | Shared annotations, constants, enums, exceptions, utilities |
| `zhihuitong-platform` | Business domain modules (course, note, template) |
| `zhihuitong-quartz` | Scheduled task infrastructure |
| `zhihuitong-generator` | Code generation from database tables |
| `zhihuitong-oss` | Object storage (Tencent Cloud COS) |
| `zhihuitong-agent` | Java-side AI agent integration (currently empty, bridge to Python agent) |

### Backend Commands

```bash
# Build (skip tests)
cd zhihuitong && mvn clean package -Dmaven.test.skip=true

# Run the application
java -jar zhihuitong-admin/target/zhihuitong-admin.jar

# Windows batch scripts
zhihuitong/bin/package.bat   # Build
zhihuitong/bin/run.bat       # Run JAR
zhihuitong/bin/clean.bat     # Clean
```

### Backend Configuration

- `zhihuitong-admin/src/main/resources/application.yml` — Main config
- `zhihuitong-admin/src/main/resources/application-druid.yml` — Database connection
- Default port: 8080
- Redis: localhost:56379, password: 123456
- MyBatis mapper XML: `classpath*:mapper/**/*Mapper.xml`
- Base package for type aliases: `com.zhihuitong.**.domain`
- Swagger UI: `/swagger-ui.html` (scans `com.zhihuitong.web.controller.tool`)
- JWT auth with configurable secret and expiry in `token:` section

### Controller Locations

- System controllers: `zhihuitong-admin/src/main/java/com/zhihuitong/web/controller/system/`
- Monitor controllers: `zhihuitong-admin/src/main/java/com/zhihuitong/web/controller/monitor/`
- Tool controllers: `zhihuitong-admin/src/main/java/com/zhihuitong/web/controller/tool/`
- Platform controllers: `zhihuitong-platform/src/main/java/com/zhihuitong/*/controller/`

## Frontend Architecture (Primary — `frontend/`)

Vue 3 + TypeScript + Vite + Element Plus + Pinia. Dev server runs on port **9527**, proxies `/dev-api` to backend at `localhost:8080`.

### Frontend Commands

```bash
cd frontend

# Install dependencies
yarn --registry=https://registry.npmmirror.com

# Dev server (port 9527)
yarn dev

# Build for production
yarn build:prod

# Build for staging
yarn build:stage

# Preview production build
yarn preview
```

### Frontend Structure

- `src/api/` — HTTP request functions grouped by domain (system/, monitor/, tool/)
- `src/views/` — Page components (system/, monitor/, tool/, course/, note/, template/)
- `src/store/` — Pinia stores
- `src/router/` — Vue Router configuration
- `src/components/` — Reusable components
- `src/layout/` — App layout shell
- `src/utils/` — Utilities (request.ts handles axios interceptors)
- `src/plugins/` — Plugin registrations
- `src/directive/` — Custom Vue directives

### Environment Files

- `.env.development` — Dev: base API `/dev-api`
- `.env.staging` — Staging: base API `/stage-api`
- `.env.production` — Prod: base API `/prod-api`, gzip compression enabled

## Python AI Agent Service (`zhihuitong-agent-python/`)

独立的 Python 服务，基于 LangChain + LangGraph 构建，提供 AI 对话、RAG 检索、联网搜索功能。通过 REST API 与 Java 后端集成。

```bash
cd zhihuitong-agent-python

# 安装依赖（需要 Python >= 3.14）
uv sync

# 启动服务（默认端口 8000）
uv run zhihuitong-agent

# 或直接运行
python -m zhihuitong_agent.main
```

配置：复制 `.env.example` 为 `.env`，填写 `LLM_API_KEY`、`LLM_BASE_URL`、`LLM_MODEL`。

### 关键 API 端点

- `POST /chat/stream` — SSE 流式对话
- `DELETE /chat/memory/{thread_id}` — 清除会话记忆
- `POST /rag/index` — 索引知识库文章
- `POST /rag/index/all` — 批量重建索引
- `GET /config` / `PUT /config` — 查看/更新运行时配置

### 架构要点

- **Agent 层**：`chat_agent.py`（对话）、`rag_agent.py`（知识检索）、`search_agent.py`（联网搜索），继承 `BaseAgent`
- **Graph 层**：LangGraph 工作流（`agent/graph/workflow.py`），节点+边定义在 `nodes.py`/`edges.py`
- **记忆**：三层架构 — 短期记忆、摘要记忆、长期记忆（SQLite 存储）
- **RAG**：ChromaDB 向量存储，`rag/` 模块负责文档分块、索引、检索
- **工具**：Tavily 联网搜索（`tools/search_tool.py`）
- **API**：FastAPI 路由在 `api/` 下，支持 SSE 流式响应

## Key Conventions

- Backend base package: `com.zhihuitong`
- Controller methods use RuoYi's `AjaxResult` / `TableDataInfo` response wrappers
- Entity classes use `@Excel` annotations for export support
- Data permission enforced via `@DataScope` aspect
- Logging via `@Log` annotation with AOP
- Frontend API calls go through a shared axios instance with token injection
- `zhihuitong-platform` contains custom business domains: `course/`（课程管理）、`note/`（笔记管理）、`template/`（模板管理）
- Frontend 路径别名：`@` → `src/`，`~` → 项目根目录
