# WinUtil 中文汉化版

[![Version](https://img.shields.io/badge/基于-原版%20commit%206ae24d0-blue?style=for-the-badge)](https://github.com/ChrisTitusTech/winutil)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](https://github.com/ChrisTitusTech/winutil/blob/main/LICENSE)
![Platform](https://img.shields.io/badge/Windows-10%20%7C%2011-blue?style=for-the-badge)

> Chris Titus Tech's Windows Utility 的非官方中文汉化版本。

Windows 系统优化工具箱，集**软件安装**、**系统优化**、**故障修复**、**更新管理**和 **Win11 ISO 定制**于一体，适合每次重装系统后使用。

<!-- TODO: 截图占位 -->
<!-- ![主界面](/docs/assets/images/Title-Screen-CN.png) -->

---

## 与官方原版的区别

| 方面 | 原版 | 汉化版 |
|------|------|--------|
| 界面语言 | 英文 | 简体中文 |
| 优化项说明 | 英文 | 简体中文 + 悬浮提示 |
| 软件安装页 | 英文分类和描述 | 中文分类 + 简短中文说明 |
| ISO 定制流程 | 英文日志 | 中文日志和对话框 |
| 功能逻辑 | 原版 | **完全不变** |
| 软件名称 | 英文 | 保留英文（方便 Winget 搜索） |

---

## 汉化范围

### ✅ 已完全汉化

| 区域 | 内容 | 条目数 |
|------|------|--------|
| 导航栏 | 安装 / 优化 / 配置 / 更新 / Win11 定制工具 | 5 个 Tab |
| Tweaks（系统优化） | 标题、说明、分类 | 67 项 |
| Features（功能） | 标题、说明、分类 | 29 项 |
| Install（软件安装） | 按钮、分类名、悬浮说明 | 194 个软件 |
| Updates（更新管理） | 三种更新策略的全部文字 | 完整 |
| Win11 ISO 定制 | 全部步骤说明、对话框、日志消息 | 70+ 条消息 |
| 通用 UI | 设置菜单、主题切换、字体缩放、搜索提示 | 全部 |
| 弹窗提示 | 错误、警告、确认对话框 | 全部 |

### 🔄 保留英文

- 软件名称（方便 Winget / Chocolatey 搜索对照）
- 代码注释
- PowerShell 函数名和变量名

---

## 汉化方式

本汉化采用**数据与代码分离**的架构：

- **界面文字**：`xaml/inputXML.xaml` — 直接翻译
- **配置数据**：`config/*.json` — JSON 中文化，编译时自动嵌入
- **运行时消息**：`config/messages.json` — 中文消息集中管理，ISO 流程通过 `$sync.configs.messages` 读取，兼容 PowerShell 5.1 / 7.x

这种方式保证了中文内容在编译后的 `winutil.ps1` 中不会出现编码问题，同时便于后续维护和更新。

---

## 版本信息

| 项目 | 详情 |
|------|------|
| 基于上游版本 | [ChrisTitusTech/winutil](https://github.com/ChrisTitusTech/winutil) commit `6ae24d0` |
| 汉化日期 | 2026-06-24 |
| 支持系统 | Windows 10 / 11 |
| PowerShell 版本 | 运行需 PowerShell 5.1 或 7.x（编译推荐 7.x） |

---

## 快速开始

> ⚠️ **必须使用管理员身份运行**，因为涉及系统级修改。

### 方式一：双击启动（推荐）

1. 下载 `winutil.ps1` 和 `run.bat`，**放在同一个目录下**
2. 双击 `run.bat`，自动提权并启动

> ⚠️ `run.bat` 依赖同目录下的 `winutil.ps1`，两个文件缺一不可，必须放在一起。

### 方式二：直接运行

右键 `winutil.ps1` → **使用 PowerShell 运行**（以管理员身份）

### 方式三：命令行

```powershell
# 进入目录
cd 你的目录\winutil

# 编译（可选，已提供编译好的 winutil.ps1）
.\Compile.ps1

# 启动（会自动提权）
.\run.bat
```

---

## 自动化 / 预设

无需手动选择，直接应用预定义配置：

```powershell
& ([ScriptBlock]::Create((irm https://raw.githubusercontent.com/你的用户名/winutil/main/winutil.ps1))) -Preset Standard
```

| 预设 | 说明 |
|------|------|
| `Standard`（标准） | 适合大多数用户的推荐配置 |
| `Minimal`（最小） | 最少修改 |
| `Advanced`（高级） | 深度优化，适合进阶用户 |

详细内容见：[config/preset.json](config/preset.json)

---

## 项目结构

```
winutil/
├── winutil.ps1           # 编译好的汉化版（可直接运行）
├── run.bat                # 一键启动脚本（自动提权）
├── Compile.ps1            # 编译脚本（合并源文件 → winutil.ps1）
├── README.md               # 本文件（中文）
├── README_EN.md            # 原版英文 README
│
├── config/                # JSON 配置文件（数据驱动）
│   ├── tweaks.json        #   系统优化项
│   ├── feature.json       #   Windows 功能配置
│   ├── applications.json  #   可安装软件列表
│   ├── appnavigation.json #   安装页按钮和分类
│   ├── preset.json        #   预设配置
│   ├── messages.json      #   中文消息集中管理
│   ├── themes.json        #   主题配色
│   └── dns.json           #   DNS 提供商
│
├── xaml/
│   └── inputXML.xaml      # WPF 界面布局（已汉化）
│
├── functions/
│   ├── public/            # 公开函数
│   └── private/           # 内部函数（ISO 流程等）
│
├── scripts/
│   └── main.ps1           # 入口脚本
│
└── tools/
    └── autounattend.xml   # ISO 无人值守模板
```

---

## 构建与开发

```powershell
# 编辑源文件后重新编译
.\Compile.ps1

# 编译后立即运行测试
.\Compile.ps1 -Run
```

详见原版贡献指南：[CONTRIBUTING.md](.github/CONTRIBUTING.md)

---

## 原版入口

- 📖 [原版英文 README](README_EN.md)
- 📦 [原版仓库](https://github.com/ChrisTitusTech/winutil) 

在线运行原版：

```powershell
irm https://christitus.com/win | iex
```

---

## 特别感谢

- [Chris Titus Tech](https://github.com/ChrisTitusTech) — 原版作者
- [constansino/WinUtil_CN](https://github.com/constansino/WinUtil_CN) — 汉化思路参考

---

## 免责声明

- 本仓库是个人维护的非官方汉化版本，与原作者无隶属关系
- **只翻译 UI 文本与说明，不改动任何功能逻辑**
- 系统优化工具存在风险，使用前请务必备份
- 建议下载到本地审计后再运行

<!-- TODO: 更多截图占位 -->
<!-- ![Tweaks 页面](/docs/assets/images/Tweaks-CN.png) -->
<!-- ![Install 页面](/docs/assets/images/Install-CN.png) -->
<!-- ![Win11 ISO 页面](/docs/assets/images/Win11ISO-CN.png) -->
