---
layout: doc
title: Installation
url: /docs/installation/
index: 20
group: "GETTING STARTED"
---
If you are a java developer, you'll find that the installation and initialization of an OpooPress blog is very simple.

### System Requirements
- [Java](http://www.oracle.com/technetwork/java/) 1.6+ (JDK required)
- [Maven](http://maven.apache.org/download.cgi#Installation) 2.2.1+


## I. Install JDK(Java)

### Oracle JDK for Microsoft Windows
See [JDK Installation for Microsoft Windows](http://docs.oracle.com/javase/7/docs/webnotes/install/windows/jdk-installation-windows.html).

### Oracle JDK for Linux Platform
See [JDK 7 Installation for Linux Platforms](http://docs.oracle.com/javase/7/docs/webnotes/install/linux/linux-jdk.html).

### OpenJDK for CentOS
1. Run `yum install java-1.7.0-openjdk java-1.7.0-openjdk-devel` to install `OpenJDK 1.7.0`
2. In a command terminal, add the `JAVA_HOME`, `CLASSPATH` environment variable, and add `$JAVA_HOME/bin` environment variable to your path, e.g.
    * `export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.19`
    * `export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar`
    * `export PATH=$PATH:$JAVA_HOME/bin`
    
    If you use `bash` shell, you can add variables in `/etc/profile`
	```
	JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.19
	CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
	PATH=$PATH:$JAVA_HOME/bin
	export JAVA_HOME PATH CLASSPATH
	```
    run `. /etc/profile` make it effective
3. Run `java -version` to verify that it is correctly installed.


## II. Install Apache Maven
1. Download [Apache Maven](http://maven.apache.org/download.cgi#Installation)
2. Unzip distribution archive
2. Set `M2_HOME`, `PATH` environment variable

### Windows 2000/XP
1. Unzip the distribution archive, i.e. `apache-maven-3.1.0-bin.zip` to the directory you wish to install Maven 3.1.0. These instructions assume you chose `C:\Program Files\Apache Software Foundation`. The subdirectory `apache-maven-3.1.0` will be created from the archive.
2. Add the `M2_HOME` environment variable by opening up the system properties (WinKey + Pause), selecting the "Advanced" tab, and the "Environment Variables" button, then adding the `M2_HOME` variable in the user variables with the value `C:\Program Files\Apache Software Foundation\apache-maven-3.1.0`. Be sure to omit any quotation marks around the path even if it contains spaces. **Note**: For Maven   2.0.9, also be sure that the `M2_HOME` doesn't have a '\' as last character.
3. In the same dialog, add the `M2` environment variable in the user variables with the value `%M2_HOME%\bin`.
4. **Optional**: In the same dialog, add the `MAVEN_OPTS` environment variable in the user variables to specify JVM properties, e.g. the value `-Xms256m -Xmx512m`. This environment variable can be used to supply extra options to Maven.
5. In the same dialog, update/create the `Path` environment variable in the user variables and prepend the value `%M2%` to add Maven available in the command line.
6. In the same dialog, make sure that `JAVA_HOME` exists in your user variables or in the system variables and it is set to the location of your JDK, e.g. `C:\Program Files\Java\jdk1.5.0_02` and that `%JAVA_HOME%\bin` is in your `Path` environment variable.
7. Open a new command prompt (Winkey + R then type `cmd`) and run `mvn --version` to verify that it is correctly installed.

### Unix-based Operating Systems (Linux, Solaris and Mac OS X)
1. Extract the distribution archive, i.e. `apache-maven-3.1.0-bin.tar.gz` to the directory you wish to install Maven 3.1.0. These instructions assume you chose `/usr/local/apache-maven`. The subdirectory `apache-maven-3.1.0` will be created from the archive.
2. In a command terminal, add the `M2_HOME` environment variable, e.g. `export M2_HOME=/usr/local/apache-maven/apache-maven-3.1.0`.
3. Add the M2 environment variable, e.g. `export M2=$M2_HOME/bin`.
4. **Optional**: Add the `MAVEN_OPTS` environment variable to specify JVM properties, e.g. `export MAVEN_OPTS="-Xms256m -Xmx512m"`. This environment variable can be used to supply extra options to Maven.
5. Add `M2` environment variable to your path, e.g. `export PATH=$M2:$PATH`.
6. Make sure that `JAVA_HOME` is set to the location of your JDK, e.g. `export JAVA_HOME=/usr/java/jdk1.5.0_02` and that `$JAVA_HOME/bin` is in your PATH environment variable.
7. Run `mvn --version` to verify that it is correctly installed.

## III. Downloading and Initializing OpooPress
You hava two choice to install and initialize an OpooPress blog.

### `pom.xml` only
1. Create a directory in local file system, e.g. `mkdir myblog`
2. `cd myblog`
3. Download file [pom.xml](http://www.opoopress.com/downloads/pom.xml) to this directory, such as run `wget http://www.opoopress.com/downloads/pom.xml`.
4. Run `mvn op:install` to install and initialize the blog. A folder named `site` will be created. All blog files will be stored in this folder. You can use option `-Dsite=siteX` to specified the folder name.
5. Run `mvn op:generate` to generate static site. All generated files will be stored in `target/public/site`. If you use the option `-Dsite=siteX`, the directory will be `target/public/siteX`.
6. Run `mvn op:preview` to start a web server with default port `8080`, then open http://localhost:8080/ in browser to preview your blog. The web server listening port can be changed by option `-Dport`, such as `-Dport=8989`.

### Secondary Develop Project for Developer
1. Download secondary develop project from GitHub.com
    - with git: `git clone https://github.com/opoopress/opoopress-site.git`
    - with GitHub for Windows: click `Clone in Desktop` button on [opoopress-site](https://github.com/opoopress/opoopress-site) repository page 
    - without git: Click `Download ZIP` button on [opoopress-site](https://github.com/opoopress/opoopress-site) repository page to download the archive,  then unzip it
2. Run `mvn package` first. The project include a sample plugin and common logging configurations.
3. Run `mvn op:install` to install and initialize the blog. A folder named `site` will be created. All blog files will be stored in this folder. You can use option `-Dsite=siteX` to specified the folder name.
4. Run `mvn op:generate` to generate static site. All generated files will be stored in `target/public/site`. If you use the option `-Dsite=siteX`, the directory will be `target/public/siteX`.
5. Run `mvn op:preview` to start a web server with default port `8080`, then open http://localhost:8080/ in browser to preview your blog. The web server listening port can be changed by option `-Dport`, such as `-Dport=8989`.
6. Run `mvn eclipse:eclipse` to generate `.project` and `.classpath`, import to Eclipse IDE, then you can develop your custom plugin or other functionalities. You must run `mvn package` to make your functionalities effective.
