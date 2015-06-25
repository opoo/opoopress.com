---
layout: doc
title: 快速开始
url: /docs/quickstart/
---

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
