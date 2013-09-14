---
layout: doc
title: Permalinks
url: /docs/permalinks/
index: 130
group: "CUSTOMIZATION"
---

Permalink is defined in `config.xml`, the default value is `/article/${'$'}{year}/${'$'}{month}/${'$'}{name}/`.

Available variables for permalink style:
- time variables: year, month, day, hour, minute, second
- post name: name
- post file path: pathToFile
- post file name: fileName
- All variables in post front-matter

Example 1
	 /article/${'$'}{year}/${'$'}{month}/${'$'}{name}/
==>
	/article/2013/09/helle-world/

Example 2
	permalink: /article/${'$'}{title}/

==>
	/article/Hello, World!/

Example 3
	permalink: /post/${'$'}{name}.html
==>
	/post/hello-world.html

Example 4
	permalink: /post/${'$'}{post_id}/
==>
	/post/102/
Note: `post_id` is a custom variable defined in post front-matter.

