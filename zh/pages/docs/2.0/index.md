---
layout: doc
title: OpooPress 2.0
url: /docs/
comments: true
date: 2015-03-09 11:20
description: "OpooPress 1.2 版本文档。"
keywords: "OpooPress, 主题"
no_english_version: true
---

## 如何使用 2.0 建站

### Step 1. 创建站点
```shell
mvn org.opoo.press.maven.plugins:opoopress-archetype-plugin:2.0-beta-1:create
```
或者
```shell
mvn archetype:generate -Dfilter=:opoopress-archetype-site
cd <artifactId>
mvn op:init
mvn op:theme -Dname=default
````
显示 archetype 列表时，选择 1（包含示例插件） 或者 2（空白网站），填写 `artifactId`（即网站名称），根据需要修改 `groupId`, `package` 等参数，也可以直接使用默认值，最后确认即可。
```text
mvn org.opoo.press.maven.plugins:opoopress-archetype-plugin:1.2.0-alpha-1:create
[INFO] Scanning for projects...
[INFO] ------------------------------------------------------------------------
[INFO] Building Maven Default Project
[INFO]    task-segment: [org.opoo.press.maven.plugins:opoopress-archetype-plugin:1.2.0-alpha-1:create] (aggregator-style)
[INFO] ------------------------------------------------------------------------
[INFO] [opoopress-archetype:create {execution: default-cli}]
[INFO] Generating project in Interactive mode
[INFO] No archetype defined. Using maven-archetype-quickstart (org.apache.maven.archetypes:maven-archetype-quickstart:1.0)
Choose archetype:
1: http://repo.opoopress.com/releases/archetype-catalog.xml -> org.opoo.press.maven.archetypes:opoopress-archetype-site (Archetype for creating a basic OpooPress site with sample plugins.)
2: http://repo.opoopress.com/releases/archetype-catalog.xml -> org.opoo.press.maven.archetypes:opoopress-archetype-site-blank (Archetype for creating a blank OpooPress site.)
Choose a number or apply filter (format: [groupId:]artifactId, case sensitive contains): : 2
[INFO] Using property: groupId = com.opoopress.website
Define value for property 'artifactId': : mysite
[INFO] Using property: version = 1.0-SNAPSHOT
[INFO] Using property: package = com.opoopress.website
Confirm properties configuration:
groupId: com.opoopress.website
artifactId: mysite
version: 1.0-SNAPSHOT
package: com.opoopress.website
Y:
[INFO] ----------------------------------------------------------------------------
[INFO] Using following parameters for creating project from Archetype: opoopress-archetype-site-blank:1.2.0-alpha-1
[INFO] ----------------------------------------------------------------------------
[INFO] Parameter: groupId, Value: com.opoopress.website
[INFO] Parameter: artifactId, Value: mysite
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] Parameter: package, Value: com.opoopress.website
[INFO] Parameter: packageInPathFormat, Value: com/opoopress/site
[INFO] Parameter: package, Value: com.opoopress.website
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] Parameter: groupId, Value: com.opoopress.website
[INFO] Parameter: artifactId, Value: mysite
[INFO] project created from Archetype in dir: /home/dev/temp/mysite
...

```

### Step 2. 内容

创建新文章
```shell
mvn op:new -Dtitle=你好 -Dname=hello
```
或者创建示例文章
```shell
mvn op:sample-post
```

### Step 3. 生成及预览
执行 
```shell
mvn op:build op:preview
``` 
或者直接执行 
```shell
mvn op:preview
``` 
即可生成网站并打开预览。


浏览器打开 http://localhost:8080/ 可预览生成的网站。


## 如何使用 2.0 开发版
### Step 1. 获取源代码
```
git clone https://github.com/opoo/opoopress.git
```
### Step 2. 编译并安装到本地 Maven 库
```
cd opoopress
mvn install
```
### Step 3. 使用开发版建站
```
mvn org.opoo.press.maven.plugins:opoopress-archetype-plugin:2.0-SNAPSHOT:create 
```
