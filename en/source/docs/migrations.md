---
layout: doc
title: Blog migrations
url: /docs/migrations/
index: 125
group: "CONTENT"
---

## 1. WordPress
```
mvn op:wordpress-import -Dfile=./wordpress.xml -Dimport-author=false -Dimport-drafts=false -Dpermalink-style=/%postname%/ -Dimport-dir=wordpress
```
or
```
mvn op:import -Dimporter=wordpress -Dfile=./wordpress.xml -Dimport-author=false -Dimport-drafts=false -Dpermalink-style=/%postname%/ -Dimport-dir=wordpress
```

**Arguments**
- file 
	- The XML file exported from WordPress admin panel
- import-author
	- Import author of posts or pages? default is `false`.
- import-drafts
	- Import all drafts? default is `false`.
- permalink-style
	- The permalink style of WordPress, such as:
		- `/%year%/%monthnum%/%day%/%postname%/`  -> /2013/08/10/hello-world/
		- `/%year%/%monthnum%/%postname%/`  -> /2013/08/hello-world/
		- `/archives/%post_id%` -> /archives/1001
		- `/%postname%/` -> /hello-world/


**Note**
- The password protected post in WordPress can not migrate to OpooPress. 

## 2. Octopress
No comment yet

