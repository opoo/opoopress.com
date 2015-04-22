---
layout: page
title: How to use OpooPress snapshots
url: /faqs/how-to-use-opoopress-snapshots/
comments: true
date: 2013-09-21 11:20
sidebar: true
footer: false
description: "This guide show how to use OpooPress snapshots packages in your blog or site."
keywords: "OpooPress SNAPSHOT"
asides: [docs_index.ftl]
---

The stable releases of OpooPress are available from [Maven Central][mc], and the snapshot builds are available from [Sonatype OSS snapshots repository][oss]. So if you want to use OpooPress snapshot builds, you must configure `<repositories>` and `<pluginRepositories>` in your `pom.xml`.

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
The full content of a demo `pom.xml` could be get from:
1. <http://www.opoopress.com/downloads/pom-SNAPSHOT.xml>
2. If you have cloned [opoopress-site][1] repository, please update (git pull) it, and check `pom-SNAPSHOT.xml` in the project root directory
3. The `pom.xml` provided by OpooPress before has configured the `<repositories>` and `<pluginRepositories>` and commented. All you need is uncommenting them.


## Also see
- [Download OpooPress](../../download/)
- [Installation Instructions](../../docs/installation/)

[mc]: http://search.maven.org/#search%7Cga%7C1%7Corg.opoo.press "OpooPress from Maven Central"
[oss]: https://oss.sonatype.org/index.html#nexus-search;quick~org.opoo.press "OpooPress snapshots from Sonatype OSS snapshots repository"
[1]: https://github.com/opoopress/opoopress-site "OpooPress Blog blank site"