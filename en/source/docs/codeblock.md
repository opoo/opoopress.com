---
layout: doc
title: Code Block
url: /docs/codeblock/
index: 110
group: "CONTENT"
---

## Markdown 语法中的代码区块
和程序相关的写作或是标签语言原始码通常会有已经排版好的代码区块，通常这些区块我们并不希望它以一般段落文件的方式去排版，而是照原来的样子显示，Markdown 会用 `<pre>` 和 `<code>` 标签来把代码区块包起来。

要在 Markdown 中建立代码区块很简单，只要简单地缩进 4 个空格或是 1 个制表符就可以，例如，下面的输入：
	这是一个普通段落：

	    这是一个代码区块。
	   
Markdown 会转换成：
	<p>这是一个普通段落：</p>

	<pre><code>这是一个代码区块。
	</code></pre>


## OpooPress 扩展的代码区块
OpooPress 扩展了 Markdown 的代码块功能，使用 [Syntax Highlighter Compress](http://alexgorbatchev.com/SyntaxHighlighter/) 增加了代码块语法高亮的功能。

语法
	```language
	code snippet
	```
或者
	~~~language
	code snippet
	~~~
会转成：

	<pre class='brush:language'>
	code snippet
	</pre>

示例1:

	```java
	public static void main(String[] args){
		System.out.println("Hello World!");
	}
	```

```java
public static void main(String[] args){
	System.out.println("Hello World!");
}
```

示例2:
	```javascript
	function checkform(f){
		var username = f.username.value;
	}
	```

```javascript
function checkform(f){
	var username = f.username.value;
}
```

示例3:
	~~~py
	#!/usr/bin/python
	# Filename : helloworld.py
	print 'Hello World'
	~~~

~~~py
#!/usr/bin/python
# Filename : helloworld.py
print 'Hello World'
~~~