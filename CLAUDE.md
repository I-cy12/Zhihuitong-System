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

Vue 3 + TypeScript + Vite + Element Plus + Pinia.

### Frontend Commands

```bash
cd frontend

# Install dependencies
yarn --registry=https://registry.npmmirror.com

# Dev server
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

## Key Conventions

- Backend base package: `com.zhihuitong`
- Controller methods use RuoYi's `AjaxResult` / `TableDataInfo` response wrappers
- Entity classes use `@Excel` annotations for export support
- Data permission enforced via `@DataScope` aspect
- Logging via `@Log` annotation with AOP
- Frontend API calls go through a shared axios instance with token injection
- The zhihuitong-platform module contains custom business logic beyond the base RuoYi framework
