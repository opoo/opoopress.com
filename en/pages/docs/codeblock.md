---
layout: doc
title: Code Block
url: /docs/codeblock/
index: 110
group: "CONTENT"
---

## 1. Code Block syntax in Markdown

4 spaces or 1 tab will start a code block in Markdown:
	This is a normal paragraph.

	    This is a code block.
	   
==>
	<p>This is a normal paragraph.</p>

	<pre><code>This is a code block.
	</code></pre>


## 2. Code Block syntax in OpooPress
OpooPress add code block syntax highlight by [Syntax Highlighter Compress](http://alexgorbatchev.com/SyntaxHighlighter/).

syntax
	```language
	code snippet
	```
or
	~~~language
	code snippet
	~~~
==>

	<pre class='brush:language'>
	code snippet
	</pre>

Example 1

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

Example 2
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

Example 3
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