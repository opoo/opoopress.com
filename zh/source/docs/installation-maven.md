---
layout: doc
title: 安装 Apache Maven
url: /docs/installation/maven/
index: 22
group: "安装配置"
no_english_version: true
---

Maven 是 OpooPress 生成网站时使用的基础工具。请遵循以下指导安装 Apache Maven。

### 一、Windows 2000/XP
1. [下载 Apache Maven](http://maven.apache.org/download.cgi) 发行包(如：`apache-maven-3.1.0-bin.zip`)。
2. 解压发行包(如：`apache-maven-3.1.0-bin.zip`)到您要安装 Maven 3.1.0 的目录，例如 `C:\Program Files`，解压后将会在这个目录下生成子目录 `apache-maven-3.1.0`。
3.  配置环境变量。打开 `系统属性`对话框，选择选项卡`高级`，点击`环境变量`按钮，打开`环境变量`对话框，在系统变量中：
    - 添加变量 `M2_HOME` 值为 `C:\Program Files\apache-maven-3.1.0`。注意，即使路径中包含空格，也不应该在前后添加引号。在 Maven 2.0.9 中，路径也不能以 `\` 结尾
    - 添加变量 `M2` 值为 `%M2_HOME%\bin`
    - **可选步骤** 添加变量 `MAVEN_OPTS` 用于指定 JVM 属性，给 Maven 提供额外的选项，其值形式为 `-Xms256m -Xmx512m`
    - 修改变量 `Path`，将值后增加字符串 `;%M2%`
4. 打开命令行窗口(按 Win 键 + R，输入 `cmd`)，运行 `mvn -version` 命令检验是否正确地安装了 Maven。

### 二、Unix-based Operating Systems (Linux, Solaris and Mac OS X)
1. [下载 Apache Maven](http://maven.apache.org/download.cgi) 发行包(如：`apache-maven-3.1.0-bin.tar.gz`)。
2. 解压发行包(如：`apache-maven-3.1.0-bin.tar.gz`)到您要安装 Maven 3.1.0 的目录，例如 `/usr/local/apache-maven`，解压后将会在这个目录下生成子目录 `apache-maven-3.1.0`。
3. 在命令行终端中设置环境变量 M2_HOME, M2, MAVEN_OPTS 和 Path，如下：
    - `export M2_HOME=/usr/local/apache-maven/apache-maven-3.1.0`
    - `export M2=$M2_HOME/bin`
    - **可选配置** `export MAVEN_OPTS="-Xms256m -Xmx512m"`
    - `export PATH=$PATH:$M2`
4. 运行 `mvn -version` 命令检验是否正确地安装了 Maven。


<div class='note'>
  <h3>Linux 环境变量</h3>
  <p>使用 bash 时，可以在文件 <code>/etc/profile</code> 中增加以下内容
  <pre>M2_HOME=/usr/local/apache-maven/apache-maven-3.1.0
M2=$M2_HOME/bin
PATH=$PATH:$M2
export M2_HOME M2 PATH</pre>
  </p>
   <p>然后执行 <code>. 
   /etc/profile</code> 使修改生效。</p>
</div>
