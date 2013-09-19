---
layout: doc
title: 发布方式
url: /docs/deployment-methods/
index: 700
group: "发布"
---

OpooPress 可通过多种方式发布。大部分是通过 [Apache Maven Wagon](http://maven.apache.org/wagon/) 实现的。可参考 Apache Maven Wagon 文档了解更多细节。

当前文档涉及到非常多的 Apache Maven 知识。

## 一、常见发布方式
- File
- HTTP
- FTP
- SSH/SCP
- WebDAV
- GitHub Pages/Git

### 1.1 File
1. OpooPress 配置 `config.yml`
```plain
deploy_server: {id: "file", url: "file://var/www/html"}
```
2. 执行 `mvn op:deploy`

### 1.2 HTTP
1. OpooPress 配置 `config.yml`
```plain
deploy_server: {id: "my_http_server", url: "http://domain.com/var/www/html"}
```
2. Maven 配置 `settings.xml`
```xml
<server>
    <id>my_http_server</id>
    <username>my_server_username</username>
    <password>my_server_password</password>
<server>
```
3. 执行 `mvn op:deploy`

### 1.3 FTP
1. OpooPress 配置 `config.yml`
```plain
deploy_server: {id: "my_ftp_server", url: "ftp://domain.com/var/www/html"}
```
2. Maven 配置 `settings.xml`
```xml
<server>
    <id>my_ftp_server</id>
    <username>my_server_username</username>
    <password>my_server_password</password>
<server>
```
3. 执行 `mvn op:deploy`

### 1.4 SSH/SCP
1. OpooPress 配置 `config.yml`
```plain
deploy_server: {id: "my_ssh_server", url: "scp://domain.com/var/www/html"}
```
2. Maven 配置 `settings.xml`
```xml
<server>
    <id>my_ssh_server</id>
    <username>my_server_username</username>
    <password>my_server_password</password>
<server>
```
3. 执行 `mvn op:deploy`

<div class="note info">
  <h2>发布到 SourceForge.net</h2>
  <p>OpooPress 发布机制与 maven-site-plugin 的 deploy 机制类似，所以通过 SCP 发布到 SourceForge.net 时，会遇到同样的问题。<a href="http://maven.apache.org/plugins-archives/maven-site-plugin-2.4/examples/site-deploy-to-sourceforge.net.html">详情请参考这里</a>。
  </p>
</div>

### 1.5 WebDAV

1. OpooPress 配置 `config.yml`
```plain
deploy_server: {id: "my_web_server", url: "https://domain.com/var/www/html"}
```
2. Maven 配置 `settings.xml`
```xml
<server>
    <id>my_web_server</id>
    <username>my_server_username</username>
    <password>my_server_password</password>
<server>
```
3. 执行 `mvn op:deploy`

### 1.6 GitHub Pages/Git

有三种方式可以发布 OpooPress 到 GitHub Pages
- opoopress-wagon-github
- opoopress-wagon-git
- wagon-scm + maven-scm-provider-gitexe

有两种方式可以发布 OpooPress 到 Git 库：
- opoopress-wagon-git
- wagon-scm + maven-scm-provider-gitexe

详见文档 [发布到 GitHub Pages](../github-pages/#deployment-methods)。


## 二、其它发布方式
由于 OpooPress 采用 [Apache Maven Wagon](http://maven.apache.org/wagon/) 作为发布功能的底层实现，所以，理论上 OpooPress 支持通过各种 wagon 发布。当用户选择满足自己需求的 wagon 时，只需要做如下配置：

1. 在 pom.xml 中配置 `extension` 节点，例如
```xml
<build>
	<extensions>
		<extension>
			<groupId>com.github.myname</groupId>
			<artifactId>wagon-myhttps</artifactId>
			<version>2.4</version>
		</extension>
		<extension>
			<groupId>org.apache.maven.wagon</groupId>
			<artifactId>wagon-scm</artifactId>
			<version>2.4</version>
		</extension>
		<extension>
			<groupId>org.apache.maven.scm</groupId>
			<artifactId>maven-scm-manager-plexus</artifactId>
			<version>1.5</version>
		</extension>
		<extension>
			<groupId>org.apache.maven.scm</groupId>
			<artifactId>maven-scm-provider-svnexe</artifactId>
			<version>1.5</version>
		</extension>
	</extensions>
    </build>
```
	假设 `wagon-myhttps` 是一个自己编写的 wagon 实现，支持自己定义的 `myhttps` 协议。

	`wagon-scm` + `maven-scm-provider-svnexe` 则是 Apache 官方特供的访问 SVN 库的 wagon 实现。

2. OpooPress 配置 `config.yml`
```plain
deploy_server: {id: "myhttps_server", url: "myhttps://domain.com/path/to/www", param1: "val1", param2: "val2"}
```
或者
```plain
deploy_server: {id: "my_svn_server", url: "scm:svn:https://domain.com/svnrepo"}
```

3. Maven 配置 `settings.xml`

	根据选择的 wagon 配置相应的 `server` 节点即可。有些 wagon 需要配置参数，例如 `wagon-scm` + `maven-scm-provider-svnexe`，就需要通过 `scmVersionType` 和 `scmVersion` 来指定 SVN 的分支。
```xml
<server>
	<id>my_svn_server</id>
	<username>my_username</username>
	<password>my_password</password>
	<configuration>
		<scmVersionType>branch</scmVersionType>
		<scmVersion>branch-1.0.x</scmVersion>
	</configuration>
</server>
```
