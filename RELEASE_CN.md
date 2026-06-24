# WinUtil 中文汉化版

> 基于 ChrisTitusTech/winutil commit `6ae24d0` 的简体中文汉化版本  
> 发布日期: 2026-06-24

---

## 下载

| 文件 | 说明 |
|------|------|
| **winutil.ps1** | 编译好的汉化版，可直接运行 |
| run.bat | 一键启动脚本（双击自动提权） |

> ⚠️ **重要：两个文件必须都下载，放在同一个目录下！**
> `run.bat` 的逻辑是提权后执行同目录下的 `winutil.ps1`，缺任何一个都无法启动。

---

## 汉化内容

### 界面全面中文化

- 5 个导航 Tab：安装 / 优化 / 配置 / 更新 / Win11 定制工具
- 设置菜单、主题切换、字体缩放、搜索提示
- 全部按钮和提示文字

### 配置数据翻译

| 文件 | 翻译量 |
|------|--------|
| `tweaks.json` | 67 个优化项的标题、描述、分类 |
| `feature.json` | 29 个功能项的标题、描述、分类 |
| `applications.json` | 194 个软件包的简短中文说明（悬浮显示） |
| `appnavigation.json` | 安装页按钮和分类标签 |

### ISO 定制流程

- 全部对话框、日志消息为中文
- 步骤说明、错误提示、进度信息均已翻译（70+ 条消息）
- 采用 JSON 消息集中管理，兼容 PowerShell 5.1 / 7.x

### 软件包说明

安装页中每个软件都有简短的中文悬浮提示，例如：

| 软件 | 中文说明 |
|------|----------|
| 7-Zip | 免费开源压缩解压工具，支持多种格式，高压缩比 |
| VLC | 万能开源媒体播放器，什么格式都能播 |
| Everything | 极速文件搜索工具，秒搜全盘所有文件 |
| OBS Studio | 免费开源录屏和直播软件，广泛用于内容创作 |

---

## 使用方法

### 快速启动（推荐）

1. 下载 `winutil.ps1` 和 `run.bat`，**放在同一个文件夹里**
2. 双击 `run.bat` → 弹出 UAC 提示点"是" → 自动启动

### 或者

```powershell
# 右键 winutil.ps1 → 使用 PowerShell 运行（管理员）

# 命令行
powershell -ExecutionPolicy Bypass -File winutil.ps1
```

### 自动化预设

```powershell
# 标准推荐配置
& .\winutil.ps1 -Preset Standard

# 最小修改
& .\winutil.ps1 -Preset Minimal

# 深度优化
& .\winutil.ps1 -Preset Advanced
```

---

## 版本说明

| 项目 | 详情 |
|------|------|
| 上游版本 | `ChrisTitusTech/winutil` @ `6ae24d0` |
| 兼容性 | Windows 10 / Windows 11 |
| PowerShell | 5.1 或 7.x 均可运行 |
| 新增文件 | `config/messages.json`（中文消息） |

---

## 与原版的区别

- ✅ 所有用户可见的文字均已翻译为简体中文
- ✅ 软件名称保留英文，方便 Winget 搜索
- ✅ 功能逻辑**完全不变**，仅翻译 UI 文本
- ✅ 新增 `messages.json` 实现消息与代码分离

---

## 更新同步

后续若上游有重要更新，可手动同步：

```bash
git fetch upstream
git merge upstream/main
# 解决 conflict 后重新编译
.\Compile.ps1
```

---

## 相关链接

- 原版仓库: [ChrisTitusTech/winutil](https://github.com/ChrisTitusTech/winutil)
- 原版在线运行: `irm https://christitus.com/win | iex`
- 官方文档: [winutil.christitus.com](https://winutil.christitus.com/)

---

## 免责声明

本汉化为个人维护的非官方版本，**仅翻译 UI 文本，不改动功能逻辑**。系统优化工具存在风险，使用前请备份。
