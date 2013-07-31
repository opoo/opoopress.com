---
layout: page
title: OpooPress Help
comments: true
date: 2013-06-29 11:20
sidebar: false
footer: false
---

**Help page is NOT finished yet.**

## Feedback and Contributing
If you want to see new features in OpooPress, don't hesitate to offer suggestions, [clone the repository on GitHub](https://github.com/opoo/opoopress). If you find errors you can [post issues](https://github.com/opoo/opoopress/issues) or send me a pull request.

Send a message to `opoo at users dot sf dot net` with any requests/feedback!


----
Help page is NOT finished yet. Have a look at some features of OpooPress first.

### Example 1: Use FreeMarker template language syntax in page

The `front-matter` of this page is:

	layout: page
	title: OpooPress Help
	comments: true
	date: 2013-06-29 11:20
	sidebar: false
	footer: false

The variables and output:

	${'$'}{page.layout} = ${page.layout}
	${'$'}{page.title} = ${page.title}
	${'$'}{page.comments} = ${page.comments?string}
	${'$'}{page.date} = ${page.date?datetime}
	${'$'}{page.sidebar} = ${page.sidebar?string}
	${'$'}{page.footer} = ${page.footer?string}

###  Example 2: Code syntax highlighting

A java code block here:

~~~java
import org.opoo.press.Plugin;
import org.opoo.press.Registry;

public class MyPlugin implements Plugin{

	public void register(Registry reg){
		//
	}
}
~~~

