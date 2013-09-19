---
layout: page
title: OpooPress 下载
comments: true
date: 2013-07-07 11:20
updated: 2013-09-19 11:20
sidebar: true
footer: true
---

OpooPress 静态博客生成器被封装成一个基于 Maven 命令行的 Java 工具包，是作为一个 Maven 插件发布的。可在以下 Maven 库中找到各个发行版本：
- 稳定版: [Maven Central](http://search.maven.org/#search%7Cga%7C1%7Corg.opoo.press)
- 开发版: [Sonatype OSS snapshots repository](https://oss.sonatype.org/index.html#nexus-search;quick~org.opoo.press)

请阅读[安装指南](../docs/installation/)指南了解如何安装配置 Java、Maven，以及如何使用 OpooPress 插件去构建博客系统。

OpooPress 是一个开源软件，所以可以下载源码自行编译。下载源码后，运行 `mvn install` 即可编译 OpooPress 并将插件安装进自己的本地 Maven 库。
- 源码: <https://github.com/opoo/opoopress>


## 最新版本

稳定版: **1.0.1**
- 发行包: [Maven Central](http://search.maven.org/#search%7Cga%7C1%7Corg.opoo.press)
- 源代码: [tag: version-1.0.1](https://github.com/opoo/opoopress/tree/version-1.0.1)

开发版: **1.0.2-SNAPSHOT**
- 发行包: [Sonatype OSS snapshots repository](https://oss.sonatype.org/content/repositories/snapshots/org/opoo/press/maven/plugins/opoopress-maven-plugin/1.0.2-SNAPSHOT/)
- 源代码: [branch: master](https://github.com/opoo/opoopress)


## 发行历史
* 2013-09-05 - 1.0.1 
* 2013-08-07 - 1.0.0


## 发行说明

### OpooPress 1.0.2 (尚未发行，since 1.0.1)

- Bug
	- 修正判断 *.scss 文件是否已经更改的逻辑错误
- Improvement
	- 源代码中日志框架由 Apache Commons Logging 更换为 Simple Logging Facade for Java (SLF4J)
	- 将上一版本插件中的部分功能独立为 opoopress-wagon-github 包，用于将 OpooPress 博客发布到 GitHub Pages，底层使用纯 Java 的 GitHub Java API，不需要额外安装 git 客户端
- New Feature
	- 新增自定义 Wagon - opoopress-wagon-git，用于将 OpooPress 博客发布到 GitHub Pages 或其他 Git 库，底层需要 git 命令行工具的支持

### OpooPress 1.0.1 (since 1.0.0)
- Bug
	- 修正判断静态资源是否已经更改的逻辑错误
- Change
	- 修改了固定链接样式的定义方式和解析方式
	- 修改了新文章和新页面文件存储路径的定义方式和解析方式

### OpooPress 1.0.0
- 第一个功能基本完备的发行版本，详见[这篇文章](../article/opoopress-1.0.0-has-been-released/)。


## 下一步
- [阅读安装指南](../docs/installation/)
