---
layout: doc
title: 博客迁移
url: /docs/migrations/
index: 125
group: "内容"
---

## WordPress
```
mvn op:wordpress-import -Dfile=./wordpress.xml -Dimport-author=false -Dimport-drafts=false -Dpermalink-style=/%postname%/ -Dimport-dir=wordpress
```
或者
```
mvn op:import -Dimporter=wordpress -Dfile=./wordpress.xml -Dimport-author=false -Dimport-drafts=false -Dpermalink-style=/%postname%/ -Dimport-dir=wordpress
```
这种格式中，将

**必要参数**
- file 
	- 从 WordPress 后台管理中导出的 xml 文件
- import-author
	- 是否导入作者信息。即是否在每篇文章的头信息中指定 `author` 属性。不指定该参数时默认为 `false`。
- import-drafts
	- 是否导入草稿。不指定该参数时默认为 `false`。
- permalink-style
	- WordPress 的固定链接格式。如果想保持与 WordPress 中一致的 URL，可以指定该值，例如 `/%postname%/`。在 WordPress 中的固定链接如果不带有 `?`，那么在 OpooPress 都将得到支持，可以无缝的迁移文章到 OpooPress，不会影响到 SEO 等。常见的格式例如：
		- `/%year%/%monthnum%/%day%/%postname%/`  -> /2013/08/10/hello-world/
		- `/%year%/%monthnum%/%postname%/`  -> /2013/08/hello-world/
		- `/archives/%post_id%` -> /archives/1001
		- `/%postname%/` -> /hello-world/


**注意事项**
- WordPress 中的加密文章在 OpooPress 中无效。

## Octopress
暂无内容

