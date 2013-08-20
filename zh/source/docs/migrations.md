---
layout: doc
title: 博客迁移
url: /docs/migrations/
index: 125
group: "内容"
---

## WordPress

```
mvn op:import -Dimporter=wordpress -Dfile=./wordpress.xml -Dpermalink=/%postname%/ ...
```