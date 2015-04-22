---
layout: doc
title: 安装指南（非开发人员版）
url: /docs/installation-non-developer/
---

OpooPress 为非开发人员准备了一个绿色版的辅助包，该辅助包可自动安装配置 OpooPress 运行时所需的环境。

*目前该辅助包仅提供 Windows 版本，Linux 使用者相信更熟悉命令行界面，安装配置环境会比较简单。*

请按以下步骤执行。
1. 下载辅助包 <http://pan.baidu.com/s/1sjqhg9R>
2. 解压 OpooPress-2.0-SNAPSHOT-win32.zip 到不含空格的目录。
3. 将解压目录中的 shell.cmd 发送快捷方式到桌面双击运行，或者直接双击运行。
4. 在打开的命令行窗口中，OpooPress 需要的环境已经准备好了，可以执行 op 命令了。可切换到准备存放站点的目录，运行站点创建的命令。
5. 常用命令
    * op init		创建站点，可选择1 带示例插件的站点，2空白站点
    * op sample-post	创建示例文章。必须创建示例文章或者新建普通文章，否则站点生成时出错。
    * op new		生成文章或者页面 op new -Dlayout=post -Dtitle=TITLE -Dname=name
    * op build	与 generate 相同
    * op generate	构建站点，生成静态页面
    * op preview	与 server 相同
    * op server	打开预览服务，预览当前生成的站点 op server -Dport=8000 指定端口
    * op deploy 	发布站点到服务器
