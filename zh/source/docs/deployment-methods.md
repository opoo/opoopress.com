---
layout: doc
title: 发布方式
url: /docs/deployment-methods/
index: 700
group: "发布"
---

OpooPress 可通过多种方式发布。大部分是通过 [Apache Maven Wagon](http://maven.apache.org/wagon/) 实现的。可参考 Apache Maven Wagon 文档了解更多细节。

- File
- HTTP
- FTP
- SSH/SCP
- WebDAV
- GitHub Pages - *自定义的 GitHubWagon*

### 一、File
1. 修改配置 `config.yml`
```plain
deploy_server: {id: "file", url: "file://var/www/html"}
```
2. 执行 `mvn op:deploy`

### 二、HTTP

### 三、FTP
1. 修改配置 `config.yml`
```plain
deploy_server: {id: "my_ftp_server", url: "ftp://host/var/www/html"}
```
2. Maven `settings.xml`
```xml
<server>
    <id>my_ftp_server</id>
    <username>my_ftp_username</username>
    <password>my_ftp_password</password>
<server>
```
3. 执行 `mvn op:deploy`

### 四、SSH/SCP
1. 修改配置 `config.yml`
```plain
deploy_server: {id: "my_server", url: "scp://host/var/www/html"}
```
2. Maven `settings.xml`
```xml
<server>
    <id>my_server</id>
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

### 五、WebDAV
发布到 WebDAV


### 六、GitHub Pages
请阅读下一章节[了解如何发布到 GitHub Pages](../github-pages/)。
