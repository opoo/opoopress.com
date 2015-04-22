---
layout: doc
title: 安装指南（Java 开发人员版）
url: /docs/1.x/installation/
---

生成及运行 OpooPress 需要 Java 和 Maven 的支持，该手册将详细指导如何安装 Java，Maven 并初始化一个 OpooPress 博客/站点。

## 一、准备 OpooPress 的构建环境

### 1.1 环境需求
- [Java](http://www.oracle.com/technetwork/java/) 1.6+ (需要 JDK，不能仅安装 JRE)
- [Maven](http://maven.apache.org/download.cgi#Installation) 2.2.1+

### 1.2 CentOS 下一键安装 Java 及 Maven
```shell
wget http://www.opoopress.com/downloads/java-maven-install.sh
chmod +x java-maven-install.sh
./java-maven-install.sh
```

### 1.3 其它方式安装 Java 及 Maven
- [安装 Java](./java/)
- [安装 Apache Maven](./maven/)


## 二、安装 OpooPress 
可选择仅下载 `pom.xml` 或者下载 **二次开发库** 来安装 OpooPress 博客/网站。

<h3 id="pom-only"> 2.1 仅 <code>pom.xml</code></h3>
1. 在本地创建您需要存放博客/网站的目录(`mkdir myblog`)。
2. 进入该目录(`cd myblog`)。
3. 下载 [pom.xml](http://www.opoopress.com/downloads/pom.xml) 到目录中。Linux 使用 `wget http://www.opoopress.com/downloads/pom.xml` 或者在链接上点右键另存为。
4. 运行命令 `mvn op:install` 安装并初始化博客。运行后会生成 `site` 子目录，博客的所有文件将存储在这个目录中。也可以通过 `-Dsite=siteX` 参数指定要生成的博客/站点的目录名。
5. 运行 `mvn op:generate` 生成静态网站，生成的文件在 `target/public/site` 目录，指定站点 `-Dsite=siteX` 时则为 `target/public/siteX`。
6. 运行 `mvn op:preview` 启动 Web 服务器进行预览，默认端口 `8080`，可通过参数 `-Dport=8989` 来更改。启动后在浏览器中打开 http://localhost:8080/ 即可看见网站效果。

<div class='note'>
   <p>要使用最新开发版的 OpooPress，请下载 <a href="http://www.opoopress.com/downloads/pom-SNAPSHOT.xml">http://www.opoopress.com/downloads/pom-SNAPSHOT.xml</a> 并改名为 <code>pom.xml</code>。</p>
   <p>请阅读文档 <a href="../../faqs/how-to-use-opoopress-snapshots/">如何使用 OpooPress 开发版 (SNAPSHOT)</a>。</p>
</div>

<h3 id="secondary-develop"> 2.2 二次开发库</h3>
1. 下载二次开发库，这是一个标准的 Java 工程，Maven 目录结构
    - 使用 git 工具: `git clone https://github.com/opoopress/opoopress-site.git`
    - 使用 GitHub for Windows: 在 [opoopress-site](https://github.com/opoopress/opoopress-site) 右下角点击 `Clone in Desktop`
    - 不使用 Git: 在 [opoopress-site](https://github.com/opoopress/opoopress-site) 右下角点击 `Download ZIP`，下载并解压
2. 在运行 `mvn op:xxx` 之前必须先对该工程打包。运行 `mvn package`。该工程包含一个示例插件和 logging 配置。
3. 运行命令 `mvn op:install` 安装并初始化博客。运行后会生成 `site` 子目录，博客的所有文件将存储在这个目录中。也可以通过 `-Dsite=siteX` 参数指定要生成的博客/站点的目录名。
4. 运行 `mvn op:generate` 生成静态网站，生成的文件在 `target/public/site` 目录，指定站点 `-Dsite=siteX` 时则为 `target/public/siteX`。
5. 运行 `mvn op:preview` 启动 Web 服务器进行预览，默认端口 `8080`，可通过参数 `-Dport=8989` 来更改。启动后在浏览器中打开 http://localhost:8080/ 即可看见网站效果。
6. 运行 `mvn eclipse:eclipse` 生成 Eclipse 工程文件，然后可以使用 Eclipse 打开进行二次开发了。开发完成，需要运行 `mvn package` 重新打包，然后运行各项 `mvn op:xxx` 命令。

<div class='note'>
   <p>要使用最新开发版的 OpooPress，请将工程根目录下的 <code>pom-SNAPSHOT.xml</code> 改名为 <code>pom.xml</code>，或者运行 mvn 命令时使用参数 <code>-f</code>，例如 <code>mvn -f pom-SNAPSHOT.xml op:build</code>。</p>
   <p>请阅读文档 <a href="../../faqs/how-to-use-opoopress-snapshots/">如何使用 OpooPress 开发版 (SNAPSHOT)</a>。</p>
</div>