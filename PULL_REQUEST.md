## 📋 描述

这个 Pull Request 将完整的 TodoApp SwiftUI 应用程序合并到主分支。

### ✨ 新增功能

- ✅ **添加待办事项** - 用户可以通过 + 按钮添加新任务
- ✅ **删除待办事项** - 支持滑动删除功能
- ✅ **标记完成** - 点击复选框标记任务完成/未完成状态
- ✅ **深色模式支持** - 自动适配系统深色模式设置
- ✅ **本地数据存储** - 使用 CoreData 进行数据持久化

### 🏗️ 架构设计

- **SwiftUI** - 现代化 UI 框架
- **CoreData** - 本地数据库存储
- **MVVM** - 应用架构模式

### 📁 项目结构

```
TodoApp/
├── TodoAppApp.swift           # 应用入口点
├── Persistence.swift           # CoreData 配置
├── Model/
│   ├── TodoItem+CoreDataClass.swift
│   └── TodoItem+CoreDataProperties.swift
├── Views/
│   ├── ContentView.swift       # 主界面
│   ├── TodoRowView.swift       # 列表项组件
│   └── AddTodoView.swift       # 添加任务弹窗
└── TodoApp.xcdatamodeld/       # CoreData 模型
```

### 🎯 核心功能说明

#### 1. 主界面 (ContentView)
- 显示待办事项列表
- 提供添加按钮
- 显示空状态提示

#### 2. 列表项 (TodoRowView)
- 显示复选框和标题
- 支持点击切换完成状态
- 已完成任务显示删除线

#### 3. 添加任务 (AddTodoView)
- 弹出式输入框
- 实时验证输入
- 添加后自动关闭

#### 4. 数据持久化
- 使用 CoreData 框架
- 自动保存到本地数据库
- 应用重启数据不丢失

### 🌙 深色模式

应用完全支持系统深色模式：
- 自动检测系统设置
- 动态颜色适配
- 无需额外配置

### 📱 系统要求

- iOS 15.0 或更高
- Xcode 13.0 或更高
- Swift 5.5 或更高

### 📖 文档

- `README.md` - 项目概览和安装说明
- `USAGE.md` - 详细使用指南和故障排除

### ✅ 测试检查清单

- [x] 应用可成功编译运行
- [x] 添加待办事项功能正常
- [x] 删除待办事项功能正常
- [x] 标记完成功能正常
- [x] 深色模式正确适配
- [x] 数据正确保存和恢复
- [x] 空状态显示正确

### 🚀 部署说明

1. 合并此 PR
2. 拉取最新代码：`git pull origin main`
3. 打开项目：`open TodoApp.xcodeproj`
4. 选择模拟器或真机运行：`Cmd + R`

---

**类型：** 新功能  
**优先级：** 高  
**关联问题：** N/A
