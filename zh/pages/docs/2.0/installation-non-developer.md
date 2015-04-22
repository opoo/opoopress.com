---
layout: doc
title: 安装指南（非开发人员版）
url: /docs/installation-non-developer/
---

OpooPress 为非开发人员准备了一个绿色版的辅助包，该辅助包可自动安装配置 OpooPress 运行时所需的环境。

*目前该辅助包仅提供 Windows 版本，Linux 使用者相信更熟悉命令行界面，安装配置环境会比较简单。*

请按以下步骤执行。
1. 下载辅助包 <http://pan.baidu.com/s/1sjqhg9R>，`op.cmd` 可能有新版，将该文件下载下来覆盖即可。
2. 解压 OpooPress-2.0-SNAPSHOT-win32.zip 到不含空格的目录。
3. 将解压目录中的 shell.cmd 发送快捷方式到桌面双击运行，或者直接双击运行。
4. 在打开的命令行窗口中，OpooPress 需要的环境已经准备好了，可以执行 op 命令了。可切换到准备存放站点的目录，运行站点创建的命令。
5. 常用命令
    * `op init <SITE_NAME>`： 在指定的目录创建站点，安装主题（simple），生成站点并打开预览服务。此时，你可以打开浏览器 http://localhost:8080/ 去访问你的站点了。如果没有指定参数 `SITE_NAME`，默认值是 `site`。
    * `op new -Dlayout=page -Dtitle=TILLE -Dname=page-name`： 生成文章或者页面，`title`参数是必须的，`layout`默认 `post`，即默认创建的是文章。
    * `op build` 或 `op generate`： 构建站点，生成静态页面。
    * `op preview` 或 `op server`： 打开预览服务，预览当前生成的站点 `op server -Dport=8000` 指定端口。
    * `op deploy`： 发布站点到服务器，需要先配置发布信息。

