---
layout: doc
title: 固定链接
url: /docs/permalinks/
render: true
---

各种layout的固定链接由以下形式定义
- `permalink_<LAYOUT>: <FORMAT>`

以下内容未更新
-----

固定链接样式在 `config.yml` 文件中由属性 `permalink` 定义，该配置可以使用以下变量来定义：
- 时间变量：year, month, day, hour, minute, second 
- 文章名称：name
- 文章文件路径：pathToFile
- 文章文件名称：fileName
- 文章 front-matter 头部所定义的所有变量

`permalink_post` 的默认值为 `/article/${'$'}{year}/${'$'}{month}/${'$'}{name}/`，生成的 URL 如 `/article/2013/09/helle-world/`。

示例1：
	permalink_post: /article/${'$'}{title}/

==>
	/article/世界，你好/

示例2：
	permalink_post: /post/${'$'}{name}.html
==>
	/post/hello-world.html

示例3：
	permalink_post: /post/${'$'}{post_id}/
==>
	/post/102/
`post_id` 为当前文章 front-matter 中的自定义变量，且当前文章必须包含该变量。使用 OpooPress 从 WordPress 导入后，文章的 ID 及对应于导入后的 `post_id` 变量。
