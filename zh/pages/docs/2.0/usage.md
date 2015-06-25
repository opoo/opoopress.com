---
layout: doc
title: 基本用法
url: /docs/usage/
render: true
---

## 一、Java 开发人员版的命令
 
命令格式：`mvn op:command -Dparam1=val1 -Dparam2=var2 ...`

根据 Maven 特性，多个命令可以顺序执行 `mvn op:command1 op:command2 ... -Dparam1=val1 -Dparam2=var2 ...`

插件包括以下 goal：



以上各个指令的参数请点击相应的链接，查看其 Maven 文档。


- op:init
- op:theme


<h2 id="commands-for-non-developer"> 二、非开发人员版的命令</h2>

命令格式通常是 `op command [options]`，与开发人员版的命令格式唯一区别就是去掉了 `mvn op:`前缀（例如 `op preview` 对应 `mvn op:preview`），
其参数格式是一致的，都必须使用 `-D` 指定。

*目前仅提供 Windows 版本，请参安装指南文档。*

可用以下各 `command`：

   
示例：
