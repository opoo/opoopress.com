---
layout: doc
title: 固定链接
url: /docs/permalinks/
index: 130
group: "定制"
---

固定链接样式在 `config.yml` 文件中由属性 `permalink` 定义，该配置可以使用以下变量来定义：
- 时间变量：year, month, day, hour, minute, second 
- 文章名称：name
- 文章文件路径：pathToFile
- 文章文件名称：fileName
- 文章 front-matter 头部所定义的所有变量

`permalink` 的默认值为 `/article/${'$'}{year}/${'$'}{month}/${'$'}{name}/`，生成的 URL 如 `/article/2013/09/helle-world/`。

示例1：
	permalink: /article/${'$'}{title}/

==>
	/article/世界，你好/

示例2：
	permalink: /post/${'$'}{name}.html
==>
	/post/hello-world.html

示例3：
	permalink: /post/${'$'}{post_id}/
==>
	/post/102/
`post_id` 为当前文章 front-matter 中的自定义变量，且当前文章必须包含该变量。使用 OpooPress 从 WordPress 导入后，文章的 ID 及对应于导入后的 `post_id` 变量。
