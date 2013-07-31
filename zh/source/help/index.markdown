---
layout: page
title: OpooPress 帮助
comments: true
date: 2013-06-29 11:20
sidebar: false
footer: false
---

**帮助页面尚未完成**

## 反馈及建议
如果在使用过程中发现问题，可以在这里[报告问题](https://github.com/opoo/opoopress/issues)。

如果您有改进代码需要提交，可以在 GitHub 代码库中向我发送一个 pull request。

有任何建议或意见，也欢迎您通过 Email 联系我：`opoo#users.sf.net`，或在该文章下留言，谢谢。


-----
下面是 OpooPress 的一些特性的展示。

### 示例1: 在页面中使用 FreeMarker 模板语法

当前页面的 `front-matter` 头信息如下:

	layout: page
	title: OpooPress 帮助
	comments: true
	date: 2013-06-29 11:20
	sidebar: false
	footer: false

FreeMarker 的变量及输出如下:

	${'$'}{page.layout} = ${page.layout}
	${'$'}{page.title} = ${page.title}
	${'$'}{page.comments} = ${page.comments?string}
	${'$'}{page.date} = ${page.date?datetime}
	${'$'}{page.sidebar} = ${page.sidebar?string}
	${'$'}{page.footer} = ${page.footer?string}

### 示例2: 代码语法高亮

这是一段 Java 代码:

~~~java
import org.opoo.press.Plugin;
import org.opoo.press.Registry;

public class MyPlugin implements Plugin{

	public void register(Registry reg){
		//
	}
}
~~~

