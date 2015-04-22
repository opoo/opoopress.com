---
layout: doc
title: Overview
url: /docs/overview/
comments: true
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


[mc]: http://search.maven.org/#search%7Cga%7C1%7Corg.opoo.press "OpooPress from Maven Central"
[oss]: https://oss.sonatype.org/index.html#nexus-search;quick~org.opoo.press "OpooPress snapshots from Sonatype OSS snapshots repository"
[oss110]: https://oss.sonatype.org/content/repositories/snapshots/org/opoo/press/maven/plugins/opoopress-maven-plugin/1.1.0-SNAPSHOT/ "OpooPress 1.1.0-SNAPSHOT from Sonatype OSS snapshots repository"