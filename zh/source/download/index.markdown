---
layout: page
title: OpooPress 下载
comments: true
date: 2013-07-07 11:20
updated: 2013-09-19 11:20
sidebar: true
footer: true
description: "介绍 OpooPress 静态博客生成器的下载地址、最新版本、包说明、发行历史以及各个版本的发行说明（包括变更列表）。"
keywords: "OpooPress, 下载地址, 最新版本, 发行说明, 发行历史"
asides: [docs_index.ftl]
---

OpooPress 静态博客生成器被封装成一个基于 Maven 命令行的 Java 工具包，是作为一个 Maven 插件发布的。可在以下 Maven 库中找到各个发行版本：
- 稳定版: [Maven Central][mc]
- 开发版: [Sonatype OSS snapshots repository][oss]

请阅读[安装指南](../docs/installation/)指南了解如何安装配置 Java、Maven，以及如何使用 OpooPress 插件去构建博客系统。

OpooPress 是一个开源软件，可以下载源码自行编译。下载源码后，运行 `mvn install` 即可编译 OpooPress 并将插件安装进自己的本地 Maven 库。
- 源码库: <https://github.com/opoo/opoopress>


## 最新版本

稳定版: **1.0.1**
- 发行包: [Maven Central][mc]
- 源代码: [tag: version-1.0.1](https://github.com/opoo/opoopress/tree/version-1.0.1)

开发版: **1.0.2-SNAPSHOT**
- 发行包: [Sonatype OSS snapshots repository][oss102]
- 源代码: [branch: master](https://github.com/opoo/opoopress)

<div class="note info">
  <p>请参考 <a href="../faqs/how-to-use-opoopress-snapshots/">如何使用 OpooPress 开发版 (SNAPSHOT)</a>。</p>
</div>

## 包说明
- **opoopress-core**
	- 核心功能包，包括读取、生成等基础功能和默认的样式、模板等站点定义。
- **opoopress-support**
	- 辅助功能包，包括 compass 编译器，博客预览器等定义。
- **opoopress-maven-plugin**
	- OpooPress 的 maven 插件，定义了一组可用于 Maven 命令行的 Mojo。
	- [基本用法](../docs/usage/)
- **opoopress-mailet**
	- 一个 Apache Mailet 的实现，用于通过 Apache James 接收邮件并将邮件内容发布到 OpooPress 博客。
	- [使用说明](../docs/mailet/)
- **opoopress-wagon-github**
	- 一个 Apache Wagon 的实现，纯 Java 实现，用于发布 OpooPress 博客到 GitHub Pages。
	- [使用说明](../docs/github-pages/#opoopress-wagon-github)
- **opoopress-wagon-git**
	- 一个 Apache Wagon 的实现，封装 git 命令行客户端，用于发布 OpooPress 博客到 GitHub Pages 及其它 git 库。
	- [使用说明](../docs/github-pages/#opoopress-wagon-git)


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
- [如何使用 OpooPress 开发版 (SNAPSHOT)](../faqs/how-to-use-opoopress-snapshots/)


[mc]: http://search.maven.org/#search%7Cga%7C1%7Corg.opoo.press "OpooPress from Maven Central"
[oss]: https://oss.sonatype.org/index.html#nexus-search;quick~org.opoo.press "OpooPress snapshots from Sonatype OSS snapshots repository"
[oss102]: https://oss.sonatype.org/content/repositories/snapshots/org/opoo/press/maven/plugins/opoopress-maven-plugin/1.0.2-SNAPSHOT/ "OpooPress 1.0.2-SNAPSHOT from Sonatype OSS snapshots repository"