---
layout: doc
title: Deployment methods
url: /docs/deployment-methods/
index: 700
group: "DEPLOYMENT"
---

OpooPress 可通过多种方式发布。大部分是通过 [Apache Maven Wagon](http://maven.apache.org/wagon/) 实现的。可参考 Apache Maven Wagon 文档了解更多细节。

- File
- HTTP
- FTP
- SSH/SCP
- WebDAV
- GitHub Pages - *Custom GitHubWagon*

### File
1. Add variable `deploy_server` in `config.yml`
```plain
deploy_server: {id: "file", url: "file://var/www/html"}
```
2. Run `mvn op:deploy`

### HTTP
No comment yet.

### FTP
1. Add variable `deploy_server` in `config.yml`
```plain
deploy_server: {id: "my_ftp_server", url: "ftp://host/var/www/html"}
```
2. Update maven `settings.xml`
```xml
<server>
    <id>my_ftp_server</id>
    <username>my_ftp_username</username>
    <password>my_ftp_password</password>
<server>
```
3. Run `mvn op:deploy`

### SSH/SCP
1. Add variable `deploy_server` in `config.yml`
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

### WebDAV
No comment yet.


### GitHub Pages
See [Deploy to GitHub Pages](../github-pages/)。
