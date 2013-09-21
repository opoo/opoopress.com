---
layout: page
title: 如何使用 OpooPress 开发版 (SNAPSHOT)
url: /faqs/how-to-use-opoopress-snapshots/
comments: true
date: 2013-09-21 11:20
sidebar: true
footer: false
description: "介绍如何使用 OpooPress 静态博客生成器的开发版本的包（即 Sonatype OSS SNAPSHOT 库的包）。"
keywords: "OpooPress SNAPSHOT"
asides: [docs_index.ftl]
---

OpooPress 是以 Java 二进制包进行发布的，正式稳定版(Release 版)已经发布到 [Maven Central][mc]，最新的开发版（Snapshot 版）发布在 [Sonatype OSS snapshots repository][oss]。

根据 Maven 自身特性，要使用非 Maven Central 的包（无论是 release 包还是 snapshot 包），必须在 `pom.xml` 文件中指定 `<repositories>` 或 `<pluginRepositories>` 节点。要使用 OpooPress snapshot 包则需要同时配置这两个节点。

```xml
<repositories>
	<repository>
		<id>sonatype-nexus-snapshots</id>
		<name>Sonatype Nexus Snapshots</name>
		<url>http://oss.sonatype.org/content/repositories/snapshots</url>
		<releases>
			<enabled>false</enabled>
		</releases>
		<snapshots>
			<enabled>true</enabled>
		</snapshots>
	</repository>
</repositories> 

<pluginRepositories>
	<pluginRepository>
		<id>sonatype-nexus-snapshots</id>
		<name>Sonatype Nexus Snapshots</name>
		<url>http://oss.sonatype.org/content/repositories/snapshots</url>
		<releases>
			<enabled>false</enabled>
		</releases>
		<snapshots>
			<enabled>true</enabled>
		</snapshots>
	</pluginRepository>
</pluginRepositories>
```

完整的 `pom.xml` 示例文件可通过以下方式获取：
1. <http://www.opoopress.com/downloads/pom-SNAPSHOT.xml>
2. 如果您已经 clone 了 [opoopress-site][1] 库，请更新，查看根目录下的 `pom-SNAPSHOT.xml` 文件
3. 之前 OpooPress 提供的 `pom.xml` 中已经包含了该段配置，被注释了，请去掉注释即可

## 参考
- [OpooPress 下载](../../download/)
- [安装指南](../../docs/installation/)

[mc]: http://search.maven.org/#search%7Cga%7C1%7Corg.opoo.press "OpooPress from Maven Central"
[oss]: https://oss.sonatype.org/index.html#nexus-search;quick~org.opoo.press "OpooPress snapshots from Sonatype OSS snapshots repository"
[1]: https://github.com/opoopress/opoopress-site "OpooPress 博客空框架"