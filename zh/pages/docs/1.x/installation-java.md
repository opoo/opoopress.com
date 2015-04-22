---
layout: doc
title: 安装 Java
url: /docs/1.x/installation/java/
no_english_version: true
---
不同的操作系统需要下载安装不同的 Java（JDK）。


## 一、Oracle JDK for Windows
1. 在 [Oracle Java 网站](http://www.oracle.com/technetwork/java/javase/downloads/index.html)下载 Java SE Development Kit(JDK)。进入下载页面后需要点击 "Accept License Agreement" 才能下载。根据您操作系统环境选择 Windows x86 或者 Windows x64 版本。
2. 执行下载的 exe 文件进行安装。安装过程会先安装 JDK，再安装 JRE，最好能将 Java 安装在没有空格的路径，如 JDK 安装在`C:\java\jdk1.7.0`，JRE 安装在 `C:\java\jre7`。
3. 配置环境变量。打开 `系统属性`对话框，选择选项卡`高级`，点击`环境变量`按钮，打开`环境变量`对话框，在系统变量中：
    - 添加变量 `JAVA_HOME` 值为 `C:\java\jdk1.7.0`
    - 添加变量 `CLASSPATH` 值为 `.;%JAVA_HOME%\lib\tools.jar;%JAVA_HOME%\lib\dt.jar`
    - 修改变量 `Path`，将值后增加字符串 `;%JAVA_HOME%\bin`
4. 打开命令行窗口(按 Win 键 + R，输入 `cmd`)，运行 `java -version` 命令检验是否正确地安装了 Java。
5. 更多请参考文档 [JDK Installation for Microsoft Windows](http://docs.oracle.com/javase/7/docs/webnotes/install/windows/jdk-installation-windows.html)。

## 二、Oracle JDK for Linux

请参考文档 [JDK 7 Installation for Linux Platforms](http://docs.oracle.com/javase/7/docs/webnotes/install/linux/linux-jdk.html)。

## 三、OpenJDK on CentOS
1. 执行命令 `yum install java-1.7.0-openjdk java-1.7.0-openjdk-devel` 安装 `OpenJDK 1.7.0`。
2. 在命令行终端中设置环境变量 JAVA_HOME, CLASSPATH 和 Path，例如
    * `export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.19`
    * `export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar`
    * `export PATH=$PATH:$JAVA_HOME/bin`
3. 运行 `java -version` 命令检验是否正确地安装了 OpenJDK。


<div class='note'>
  <h3>Linux 环境变量</h3>
  <p>使用 bash 时，可以在文件 <code>/etc/profile</code> 中增加以下内容
  <pre>JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.19
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME PATH CLASSPATH</pre>
  </p>
   <p>然后执行 <code>. 
   /etc/profile</code> 使修改生效。</p>
</div>
