---
layout: doc
title: 安装
url: /docs/installation/
index: 20
group: "安装配置"
---

如果您是一个 Java 开发者，机器已经安装了 Java 和 Maven，那么安装、构建并运行 OpooPress 仅需要几分钟。即时没有 Java 和 Maven 的运行环境，其安装过程也不会过于复杂。

### 系统需求
- [Java](http://www.oracle.com/technetwork/java/) 1.6+
- [Maven](http://maven.apache.org/download.cgi#Installation) 2.2.1+


## 安装 Java
1. 下载 [Java](http://www.oracle.com/technetwork/java/) 并执行安装
2. 配置环境变量 JAVA_HOME、PATH 和 CLASSPATH

## 安装 Maven
1. 下载 [Maven](http://maven.apache.org/download.cgi#Installation) 并解压到适当的目录（推荐没有空格的路径）
2. 配置环境变量 M2_HOME 和 PATH

## 安装 OpooPress

* **Standalone 版**：一个基于普通命令行的独立发行版本，只要装有 Java 即可以使用，跨平台。执行命令就像这样 `press install`，`press build` 和 `press deploy`。目前支持的发布协议主要是文件系统和 `SSH/SCP`，也是最常用的，满足最基本的需求。
    1. 下载 Standalone 独立安装包
    2. 解压并进入该目录
    3. 运行命令 `op install` 完成安装
  
* **Maven Plugin 版（推荐）**：该版本基础功能同独立发行包，但发布功能将更强大，凡是 `mvn deploy` 支持 OpooPress 都支持。例如可以发布到 `FTP`, `WebDAV` 等，具体可参考 [Apache Maven Wagon](http://maven.apache.org/wagon/)。通过 GitHub 的一个插件，还可以发布到 [GitHub Pages](http://pages.github.com/)，估计这是许多人所需要的。
    1. mkdir myblog
    2. cd myblog
    3. wget http://www.opoopress.com/downloads/pom.xml
    4. mvn op:install
