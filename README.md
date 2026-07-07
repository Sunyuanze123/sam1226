# TodoApp - iPhone 风格待办事项应用

![Swift](https://img.shields.io/badge/Swift-5.5+-orange.svg)
![iOS](https://img.shields.io/badge/iOS-15.0+-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Platforms](https://img.shields.io/badge/Platform-iOS-lightgrey)

一个简洁优雅的 iOS 待办事项应用，采用 SwiftUI 开发，支持深色模式和本地数据存储。

## 📱 应用特性

- ✅ **添加待办事项** - 快速添加新的任务，支持实时输入验证
- ✅ **删除待办事项** - 支持滑动删除或编辑模式删除
- ✅ **标记完成** - 点击复选框标记任务完成状态，显示删除线效果
- ✅ **深色模式** - 完全支持系统深色模式，自动适配
- ✅ **本地数据存储** - 使用 CoreData 进行数据持久化，重启不丢失
- ✅ **优雅的 UI** - iPhone 原生风格设计，符合 iOS 设计规范
- ✅ **空状态提示** - 当没有任务时显示友好的提示信息

## 🛠️ 技术栈

| 技术 | 说明 |
|------|------|
| **SwiftUI** | 现代化声明式 UI 框架 |
| **CoreData** | 本地数据库持久化存储 |
| **MVVM** | 模型-视图-视图模型架构模式 |
| **iOS 15+** | 最低支持版本 |

## 📋 系统要求

- **iOS**: 15.0 或更高版本
- **Xcode**: 13.0 或更高版本
- **Swift**: 5.5 或更高版本
- **Mac**: macOS 12 或更高版本（用于开发）

## 🚀 快速开始

### 1. 克隆仓库

```bash
git clone https://github.com/Sunyuanze123/sam1226.git
cd sam1226
```

### 2. 打开项目

```bash
open TodoApp.xcodeproj
```

### 3. 运行应用

- 在 Xcode 中选择 iPhone 模拟器或真机
- 按 `Cmd + R` 或点击 Run 按钮
- 等待编译完成，应用将在设备上启动

## 📖 项目结构

```
sam1226/
├── README.md                           # 项目说明文件
├── USAGE.md                           # 详细使用指南
├── PULL_REQUEST.md                    # PR 描述
├── .gitignore                         # Git 忽略文件配置
├── TodoApp/
│   ├── TodoAppApp.swift               # 应用主入口
│   ├── Persistence.swift              # CoreData 配置和初始化
│   ├── Model/
│   │   ├── TodoItem+CoreDataClass.swift       # CoreData 模型类
│   │   └── TodoItem+CoreDataProperties.swift  # 模型属性定义
│   └── Views/
│       ├── ContentView.swift          # 主界面（列表显示）
│       ├── TodoRowView.swift          # 列表项组件
│       └── AddTodoView.swift          # 添加任务的弹窗
└── TodoApp.xcdatamodeld/
    └── TodoApp.xcdatamodel/
        └── contents                   # CoreData 数据库模型定义
```

## 🎯 功能说明

### 主界面 (ContentView)
- 显示所有待办事项列表，按创建时间倒序排列
- 右上角 + 按钮用于添加新任务
- 空状态时显示友好提示
- 支持从列表中滑动删除项目

### 待办项目 (TodoRowView)
- 显示圆形复选框和任务标题
- 点击复选框切换完成状态
- 已完成的任务显示蓝色勾号和删除线
- 未完成任务显示灰色圆圈

### 添加任务 (AddTodoView)
- 弹出式对话框输入新任务
- 实时验证输入内容
- 输入为空时"添加"按钮禁用
- 添加成功后自动关闭弹窗

### 数据存储 (Persistence)
- 使用 CoreData 框架管理数据
- 自动保存到本地数据库
- 应用重启时数据自动恢复
- 支持在模拟器和真机上运行

## 🌙 深色模式支持

应用完全适配系统深色模式：
- 自动检测系统主题设置
- 使用 `Color(UIColor.systemBackground)` 等系统颜色
- 浅色模式下显示浅色背景和深色文字
- 深色模式下显示深色背景和浅色文字

用户可以在系统设置中切换：
- **iOS 设置** → **显示与亮度** → 选择 **浅色/深色/自动**

## 💾 数据持久化

应用使用 CoreData 框架进行数据存储：

```swift
// 数据模型
- id: UUID              // 唯一标识
- title: String         // 任务标题
- isCompleted: Bool     // 完成状态
- createdAt: Date       // 创建时间
```

**特点：**
- 数据存储在设备本地
- 应用卸载时数据清除
- 应用更新时数据保留
- 无云同步（本地专用）

## 🔄 工作流程

```
用户操作 → SwiftUI 更新 → ViewModel 处理 → CoreData 存储
   ↑                                          ↓
   ←───── 数据变更通知，UI 自动刷新 ←────────
```

## 🐛 故障排除

### 应用无法运行
- 检查 Xcode 版本是否 13.0+
- 检查 iOS 部署目标是否 15.0+
- 尝试清空构建文件夹：`Cmd + Shift + K`

### 数据丢失
- CoreData 数据一般不会自动丢失
- 重新安装应用会清除所有数据
- 建议定期备份重要数据

### 深色模式不生效
- 检查设备系统设置
- 尝试重启应用
- 在 Scheme 中手动设置主题测试

## 📝 提交规范

本项目使用以下提交规范：

- `feat:` - 新功能
- `fix:` - 缺陷修复
- `docs:` - 文档更新
- `style:` - 代码风格
- `refactor:` - 代码重构
- `chore:` - 构建或依赖变更

## 🚀 后续计划

- [ ] 添加任务分类功能
- [ ] 实现任务搜索和筛选
- [ ] 添加截止日期和提醒
- [ ] 支持任务优先级设置
- [ ] 实现 iCloud 同步
- [ ] 添加统计和报表功能
- [ ] 支持 Widget 小部件
- [ ] 实现任务标签系统

## 📄 许可证

本项目采用 **MIT License** 许可证。详见 [LICENSE](LICENSE) 文件。

## 👨‍💻 开发者

- **作者**: Sunyuanze123
- **仓库**: https://github.com/Sunyuanze123/sam1226
- **创建时间**: 2026-07-01

## 🤝 贡献指南

欢迎提交 Issue 和 Pull Request！

1. Fork 本仓库
2. 创建你的功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交变更 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开一个 Pull Request

## 📞 联系方式

如有问题或建议，欢迎通过以下方式联系：
- GitHub Issues: https://github.com/Sunyuanze123/sam1226/issues
- Email: 156409656@qq.com

---

<div align="center">

**如果这个项目对你有帮助，请给个 ⭐ Star！**

Made with ❤️ by Sunyuanze123

</div>
