---
layout: doc
title: Overview
comments: true
index: 0
group: "安装配置"
---

## OpooPress 是什么？

OpooPress 博客系统是一个基于 Java 的可用于博客的静态网站生成器。OpooPress 使用 [Java](http://www.oracle.com/technetwork/java/index.html) 语言和 [FreeMarker](http://www.freemarker.org/) 模板开发 `生成器` 部分，默认带一个支持 CSS3 响应式设计的主题。通过 OpooPress， 您可以使用 [Markdown](http://daringfireball.net/projects/markdown/)、 [Textile](http://textile.sitemonks.com/) 或者  HTML 来撰写博客文章、网站页面的源文件，然后运行简单的指令即可生成静态博客或者网站，然后您可以将博客（网站）发布到任何免费（例如 [GitHub Pages](/zh/docs/github-pages/)）或收费（例如 VPS）的服务器和虚拟空间。


OpooPress 在开发过程中，仔细研究了 [Jekyll](http://jekyllrb.com) 和 [Octopress](http://octopress.org/)，代码参考了 Jekyll 的 Ruby 源代码，主题则主要来自于 Octopress。如果您要深入了解 OpooPress，也请您了解一下 Jekyll 和 Octopress。

OpooPress 的源文件格式与 Jekyll/Octopress 的相同，每个文件带有一个 [YAML front matter](/zh/docs/frontmatter/) 的头部，正文内容可以使用 HTML、Markdown、Textile 语法，可以穿插 FreeMarker 模板代码。OpooPress 还可以直接使用 Octopress 主题的样式单。


文档中将会使用比较明显的方式标示读者应该注意的地方，示例如下：

<div class='note'>
  <h3>提示：帮助您了解更多</h3>
  <p>这是一个提示信息，可让您留意重点信息。</p>
</div>

如果您发现有本文档未提及的部分，或者您有更好的用法，或者您想修改该文档，请在 [GitHub 提交一个 ISSUE](https://github.com/opoo/opoopress/issues)，我会尽快处理。

## 生成器

OpooPress 静态博客生成器被封装成一个基于 Maven 命令行的 Java 工具包，是作为一个 Maven 插件发布的。可在以下 Maven 库中找到各个发行版本：
- 稳定版: [Maven Central][mc]
- 开发版: [Sonatype OSS snapshots repository][oss]

请阅读[安装指南](../docs/installation/)指南了解如何安装配置 Java、Maven，以及如何使用 OpooPress 插件去构建博客系统。

OpooPress 是一个开源软件，可以下载源码自行编译。下载源码后，运行 `mvn install` 即可编译 OpooPress 并将插件安装进自己的本地 Maven 库。
- 源码库: <https://github.com/opoo/opoopress>


## 最新版本

稳定版: **${site.op_current_version}**
- 发行包: [Maven Central][mc]
- 源代码: [tag: version-${site.op_current_version}](https://github.com/opoo/opoopress/releases/tag/version-${site.op_current_version})

开发版: **${site.op_current_snapshot}**
- 发行包: [Sonatype OSS snapshots repository][oss]
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
* 2014-06-18 - 1.1.1
* 2014-03-25 - 1.1.0
* 2013-11-20 - 1.0.3
* 2013-10-22 - 1.0.2
* 2013-09-05 - 1.0.1 
* 2013-08-07 - 1.0.0


## 发行说明


### OpooPress 1.1.1 (since 1.1.0) {#release-notes-v1.1.1}
- Improvement
	- 增加了多线程支持，在文章较多时，可显著加快生成网站速度
- New Feature
	- 增加了 WikiText 的转换器，目前支持更多的源文件格式，包括 `*.textile`, `*.tracwiki`, `*.mediawiki`, `*.twiki`, `*.confluence` 等。

### OpooPress 1.1.0 (since 1.0.3) {#release-notes-v1.1.0}
- Improvement
	- 重构了默认主题的模板结构
	- 扩展了 `SiteFilter` 的功能，以便于用户开发出功能更强大、细致的插件（[这个例子](https://github.com/opoo/opoo.org/blob/master/src/main/java/org/opoo/website/plugin/ImgFinder.java)使用了该特性）
- New Feature
	- 添加对多数评论的支持

<h3 id="release-notes-v1.0.3">OpooPress 1.0.3 (since 1.0.2)</h3>
- Bug
	- 修正 [Issue #3](https://github.com/opoo/opoopress/issues/3): Maven 始终检查更新 com.github.jnr:jnr-x86asm
	- 修正了预览时目录监听间隔参数解析错误的问题

<h3 id="release-notes-v1.0.2">OpooPress 1.0.2 (since 1.0.1)</h3>

- Bug
	- 修正判断 *.scss 文件是否已经更改的逻辑错误
	- 修正了 atom.xml，sitemap.xml 等文件中的日期格式
	- 修正了主配置文件改动时预览不刷新的问题
- Improvement
	- 源代码中日志框架由 Apache Commons Logging 更换为 Simple Logging Facade for Java (SLF4J)
	- 将上一版本插件中的部分功能独立为 opoopress-wagon-github 包，用于将 OpooPress 博客发布到 GitHub Pages，底层使用纯 Java 的 GitHub Java API，不需要额外安装 git 客户端
	- 改进了默认主题，对生成页面进行了优化
	- 改进了相关文章的算法，默认使用余弦相似性算法
- New Feature
	- 新增自定义 Wagon - opoopress-wagon-git，用于将 OpooPress 博客发布到 GitHub Pages 或其他 Git 库，底层需要 git 命令行工具的支持
	- 支持多个源文件目录

<h3 id="release-notes-v1.0.1">OpooPress 1.0.1 (since 1.0.0)</h3>
- Bug
	- 修正判断静态资源是否已经更改的逻辑错误
- Change
	- 修改了固定链接样式的定义方式和解析方式
	- 修改了新文章和新页面文件存储路径的定义方式和解析方式

<h3 id="release-notes-v1.0.0">OpooPress 1.0.0</h3>
- 第一个功能基本完备的发行版本。


## 下一步
- [阅读安装指南](../docs/installation/)
- [如何使用 OpooPress 开发版 (SNAPSHOT)](../faqs/how-to-use-opoopress-snapshots/)


[mc]: http://search.maven.org/#search%7Cga%7C1%7Corg.opoo.press "OpooPress from Maven Central"
[oss]: https://oss.sonatype.org/index.html#nexus-search;quick~org.opoo.press "OpooPress snapshots from Sonatype OSS snapshots repository"
[oss110]: https://oss.sonatype.org/content/repositories/snapshots/org/opoo/press/maven/plugins/opoopress-maven-plugin/1.1.0-SNAPSHOT/ "OpooPress 1.1.0-SNAPSHOT from Sonatype OSS snapshots repository"