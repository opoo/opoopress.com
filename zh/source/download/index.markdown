---
layout: page
title: OpooPress 下载
comments: true
date: 2013-07-07 11:20
sidebar: false
footer: false
---

OpooPress 包含 Maven Plugin 版和 Standalone 版两个版本。非常推荐使用 Maven 插件版。

## 一、Maven Plugin 版

1. 安装 [Java](http://www.oracle.com/technetwork/java/) 1.6 和 [Maven](http://maven.apache.org/download.cgi#Installation) 2.2.1 以上版本
2. 安装、配置 OpooPress 博客系统
    - Linux 
        * 执行以下命令：
	```bash
	[root@vps ~]# mkdir myblog
	[root@vps ~]# cd myblog
	[root@vps myblog]# wget http://www.opoopress.com/downloads/pom.xml
	[root@vps myblog]# mvn op:install op:generate op:preview
	```
        * 用浏览器打开 `http://localhost:8080/` 即可预览。 
    - Windows
        * 创建目录，然后进入该目录
        * 下载 [pom.xml](http://www.opoopress.com/downloads/pom.xml) 并放在这个目录中
        * 在命令行（cmd.exe）中进到该目录
        * 运行 Maven 指令 `mvn op:install op:generate op:preview`
        * 用浏览器打开 `http://localhost:8080/` 即可预览。

请阅读 [OpooPress 文档](/zh/docs/) 了解更多 Maven 插件指令 (maven goals)。

## 二、Standalone 版

<a class="download-button" href="http://www.opoopress.com/downloads/opoopress-1.0-RC1.tar.gz">OpooPress 1.0 RC1 完整包 (28M)</a>

(*包括全部功能.*)

<a class="download-button" href="http://www.opoopress.com/downloads/opoopress-lite-1.0-RC1.tar.gz">OpooPress 1.0 RC1 精简包 (5M)</a>

(*包括一个默认的样式单。不包括 SASS/SCSS 的编译功能。*)

下载后，请阅读 [OpooPress 文档](/zh/docs/) 开始使用。
