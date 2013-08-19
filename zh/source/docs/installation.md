---
layout: doc
title: 下载安装
url: /docs/installation/
index: 20
group: "安装配置"
---

安装、构建并运行 OpooPress 需要 Java 和 Maven 的支持，该手册将详细指导如何安装 Java，Maven 并初始化一个 OpooPress 博客/站点。

### 系统需求
- [Java](http://www.oracle.com/technetwork/java/) 1.6+ (需要 JDK，不能仅安装 JRE)
- [Maven](http://maven.apache.org/download.cgi#Installation) 2.2.1+


## 一、安装 Java

### Windows
1. 在 [Oracle Java 网站](http://www.oracle.com/technetwork/java/javase/downloads/index.html)下载 Java SE Development Kit(JDK)。进入下载页面后需要点击 "Accept License Agreement" 才能下载。根据您操作系统环境选择 Windows x86 或者 Windows x64 版本。
2. 执行下载的 exe 文件进行安装。安装过程会先安装 JDK，再安装 JRE，最好能将 Java 安装在没有空格的路径，如 JDK 安装在`C:\java\jdk1.7.0`，JRE 安装在 `C:\java\jre7`。
3. 配置环境变量。打开 `系统属性`对话框，选择选项卡`高级`，点击`环境变量`按钮，打开`环境变量`对话框，在系统变量中：
    - 添加变量 `JAVA_HOME` 值为 `C:\java\jdk1.7.0`
    - 添加变量 `CLASSPATH` 值为 `.;%JAVA_HOME%\lib\tools.jar;%JAVA_HOME%\lib\dt.jar`
    - 修改变量 `Path`，将值后增加字符串 `;%JAVA_HOME%\bin`
4. 打开命令行窗口(按 Win 键 + R，输入 `cmd`)，运行 `java -version` 命令检验是否正确地安装了 Java。
5. 更多细节请访问 [JDK Installation for Microsoft Windows](http://docs.oracle.com/javase/7/docs/webnotes/install/windows/jdk-installation-windows.html)。

### Linux
1. 以 CentOS 为例，执行命令 `yum install java-1.7.0-openjdk java-1.7.0-openjdk-devel` 安装 `OpenJDK 1.7.0`。
2. 在命令行终端中设置环境变量 JAVA_HOME, CLASSPATH 和 Path，例如
    * `export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.19`
    * `export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar`
    * `export PATH=$PATH:$JAVA_HOME/bin`
3. 运行 `java -version` 命令检验是否正确地安装了 Java。
4. 其它 Linux 平台安装 JDK 请参考文档 [JDK 7 Installation for Linux Platforms](http://docs.oracle.com/javase/7/docs/webnotes/install/linux/linux-jdk.html)。

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


## 二、安装 Maven

### Windows 2000/XP
1. [下载 Apache Maven](http://maven.apache.org/download.cgi) 发行包(如：`apache-maven-3.1.0-bin.zip`)。
2. 解压发行包(如：`apache-maven-3.1.0-bin.zip`)到您要安装 Maven 3.1.0 的目录，例如 `C:\Program Files`，解压后将会在这个目录下生成子目录 `apache-maven-3.1.0`。
3.  配置环境变量。打开 `系统属性`对话框，选择选项卡`高级`，点击`环境变量`按钮，打开`环境变量`对话框，在系统变量中：
    - 添加变量 `M2_HOME` 值为 `C:\Program Files\apache-maven-3.1.0`。注意，即使路径中包含空格，也不应该在前后添加引号。在 Maven 2.0.9 中，路径也不能以 `\` 结尾
    - 添加变量 `M2` 值为 `%M2_HOME%\bin`
    - **可选步骤** 添加变量 `MAVEN_OPTS` 用于指定 JVM 属性，给 Maven 提供额外的选项，其值形式为 `-Xms256m -Xmx512m`
    - 修改变量 `Path`，将值后增加字符串 `;%M2%`
4. 打开命令行窗口(按 Win 键 + R，输入 `cmd`)，运行 `mvn -version` 命令检验是否正确地安装了 Maven。

### Unix-based Operating Systems (Linux, Solaris and Mac OS X)
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

## 三、初始化 OpooPress
可选择仅下载 `pom.xml` 或者下载 二次开发库 来初始化 OpooPress 博客/网站。

### 仅 `pom.xml`
1. 在本地创建您需要存放博客/网站的目录(`mkdir myblog`)。
2. 进入该目录(`cd myblog`)。
3. 下载 [pom.xml](http://www.opoopress.com/downloads/pom.xml) 到目录中。Linux 使用 `wget http://www.opoopress.com/downloads/pom.xml` 或者在链接上点右键另存为。
4. 运行命令 `mvn op:install` 安装并初始化博客。运行后会生成 `site` 子目录，博客的所有文件将存储在这个目录中。也可以通过 `-Dsite=siteX` 参数指定要生成的博客/站点的目录名。
5. 运行 `mvn op:generate` 生成静态网站，生成的文件在 `target/public/site` 目录，指定站点 `-Dsite=siteX` 时则为 `target/public/siteX`。
6. 运行 `mvn op:preview` 启动 Web 服务器进行预览，默认端口 `8080`，可通过参数 `-Dport=8989` 来更改。启动后在浏览器中打开 http://localhost:8080/ 即可看见网站效果。

### 二次开发库
1. 下载二次开发库，这是一个标准的 Java 工程，Maven 目录结构
    - 使用 git 工具: `git clone https://github.com/opoopress/opoopress-site.git`
    - 使用 GitHub for Windows: 在 [opoopress-site](https://github.com/opoopress/opoopress-site) 右下角点击 `Clone in Desktop`
    - 不使用 Git: 在 [opoopress-site](https://github.com/opoopress/opoopress-site) 右下角点击 `Download ZIP`，下载并解压
2. 在运行 `mvn op:xxx` 之前必须先对该工程打包。运行 `mvn package`。该工程包含一个示例插件和 logging 配置。
3. 运行命令 `mvn op:install` 安装并初始化博客。运行后会生成 `site` 子目录，博客的所有文件将存储在这个目录中。也可以通过 `-Dsite=siteX` 参数指定要生成的博客/站点的目录名。
4. 运行 `mvn op:generate` 生成静态网站，生成的文件在 `target/public/site` 目录，指定站点 `-Dsite=siteX` 时则为 `target/public/siteX`。
5. 运行 `mvn op:preview` 启动 Web 服务器进行预览，默认端口 `8080`，可通过参数 `-Dport=8989` 来更改。启动后在浏览器中打开 http://localhost:8080/ 即可看见网站效果。
6. 运行 `mvn eclipse:eclipse` 生成 Eclipse 工程文件，然后可以使用 Eclipse 打开进行二次开发了。开发完成，需要运行 `mvn package` 重新打包，然后运行各项 `mvn op:xxx` 命令。
