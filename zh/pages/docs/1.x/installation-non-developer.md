---
layout: doc
title: 安装指南（非开发人员版）
url: /docs/1.x/installation-non-developer/
render: true
---

OpooPress 为非开发人员准备了一个绿色版的辅助包，该辅助包可自动安装配置 OpooPress 运行时所需的环境。

*目前该辅助包仅提供 Windows 版本，Linux 使用者相信更熟悉命令行界面，安装配置环境会比较简单。*

请按以下步骤执行。

1. 下载辅助包 [OpooPress Helper ${site.op_current_version}](http://www.opoopress.com/downloads/cn/opoopress-${site.op_current_version}-win.zip)
- 解压到一个不包含空格的路径，如 `D:\opoopress-${site.op_current_version}\`
- 打开Windows cmd 窗口（按 Win 键，点运行，输入 `cmd` 回车），进入到该目录
```
C:\>D:
D:\>cd opoopress-${site.op_current_version}
D:\opoopress-${site.op_current_version}>
```
- 运行 OpooPress 各种命令
```
D:\opoopress-${site.op_current_version}>op -version
D:\opoopress-${site.op_current_version}>op install
D:\opoopress-${site.op_current_version}>op preview
D:\opoopress-${site.op_current_version}>op deploy
```
  第一次运行 `op` 任意命令时，该辅助工具会判断当前系统环境，并根据需要下载配置必要的软件（如 JDK, Maven 等），这些配置都是绿色的，
  不会修改操作系统变量，注册表等参数。你可以随时删除这个目录来彻底删除 OpooPress 辅助包、JDK 及 Maven。


非开发人员版的命令及命令格式请[参考文档](../usage/#commands-for-non-developer)。

