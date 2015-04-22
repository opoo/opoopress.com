---
layout: doc
title: Deployment methods
url: /docs/deployment-methods/
index: 700
group: "DEPLOYMENT"
---

OpooPress supports many deployment methods by [Apache Maven Wagon](http://maven.apache.org/wagon/).

## 1. Common Deployment Methods

- File
- HTTP
- FTP
- SSH/SCP
- WebDAV
- GitHub Pages/Git

### 1.1 File
1. Set `deploy_server` in `config.yml`
```plain
deploy_server: {id: "file", url: "file://var/www/html"}
```
2. Run `mvn op:deploy`

### 1.2 HTTP
1. Set `deploy_server` in `config.yml`
```plain
deploy_server: {id: "my_http_server", url: "http://domain.com/var/www/html"}
```
2. Update maven `settings.xml`
```xml
<server>
    <id>my_http_server</id>
    <username>my_server_username</username>
    <password>my_server_password</password>
<server>
```
3. Run `mvn op:deploy`

### 1.3 FTP
1. Set `deploy_server` in `config.yml`
```plain
deploy_server: {id: "my_ftp_server", url: "ftp://host/var/www/html"}
```
2. Update maven `settings.xml`
```xml
<server>
    <id>my_ftp_server</id>
    <username>my_server_username</username>
    <password>my_server_password</password>
<server>
```
3. Run `mvn op:deploy`

### 1.4 SSH/SCP
1. Set `deploy_server` in `config.yml`
```plain
deploy_server: {id: "my_server", url: "scp://host/var/www/html"}
```
2. Update maven `settings.xml`
```xml
<server>
    <id>my_server</id>
    <username>my_server_username</username>
    <password>my_server_password</password>
<server>
```
3. Run `mvn op:deploy`

<div class="note info">
  <h2>Deploying to sourceforge.net</h2>
  <p>OpooPress have the same deployment methods as maven-site-plugin, so there is a same problem, <a href="http://maven.apache.org/plugins-archives/maven-site-plugin-2.4/examples/site-deploy-to-sourceforge.net.html">click here for details</a>.
  </p>
</div>

### 1.5 WebDAV
1. Set `deploy_server` in `config.yml`
```plain
deploy_server: {id: "my_web_server", url: "https://domain.com/var/www/html"}
```
2. Update maven `settings.xml`
```xml
<server>
    <id>my_web_server</id>
    <username>my_server_username</username>
    <password>my_server_password</password>
<server>
```
3. Run `mvn op:deploy`


### 1.6 GitHub Pages/Git

There are THREE methods to deploy OpooPress to GitHub Pages:
- using custom `wagon: opoopress-wagon-github`
- using custom `wagon: opoopress-wagon-git`
- using wagon `wagon-scm` and scm-provider `maven-scm-provider-gitexe`

And there are TWO methods to deploy OpooPress to normal Git repositories:
- using custom `wagon: opoopress-wagon-git`
- using wagon `wagon-scm` and scm-provider `maven-scm-provider-gitexe`

See [Deploy to GitHub Pages](../github-pages/#deployment-methods).


## 2. Other Deployment Methods

Because OpooPress uses [Apache Maven Wagon](http://maven.apache.org/wagon/) as lower level layer of the deployment, so typically, any wagon can used for OpooPress deployment. 

Just follow these steps:

1. Configure `extension` node in `pom.xml`, such as:
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
	here assume `wagon-myhttps` is a custom wagon, and support URL protocol `myhttps`.

	`wagon-scm` and `maven-scm-provider-svnexe` are provided by Apache.

2. Set `deploy_server` in `config.yml`
```plain
deploy_server: {id: "myhttps_server", url: "myhttps://domain.com/path/to/www", param1: "val1", param2: "val2"}
```
or
```plain
deploy_server: {id: "my_svn_server", url: "scm:svn:https://domain.com/svnrepo"}
```

3. Update maven `settings.xml`

	Configure `server` node in `settings.xml` according to the wagon what you used. Some wagon need configure a `configuration` node in `server`. For example, if you use  `wagon-scm` and `maven-scm-provider-svnexe` to deploy your OpooPress, you need configure `scmVersionType` and `scmVersion` to specify the branch of SVN repository.
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

