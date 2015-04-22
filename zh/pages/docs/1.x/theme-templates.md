---
layout: doc
title: 主题模板
url: /docs/1.x/theme/templates/
no_english_version: true
render: true
---

OpooPress 使用 FreeMarker 作为模板引擎，模板定义文件的后缀是 `ftl`。Layout 模板是完整模板定义，被 layout 引用 (include) 的文件是模板片段文件。

## layout
layout 模板文件必须以 `_` 开头，即 `_<LAYOUT_NAME>.ftl`。并且必须以 [宏](http://freemarker.org/docs/ref_directive_macro.html) 的形式来定义模板内容，宏的名称必须为 `<LAYOUT_NAME>Layout`。

以 default layout 为例，其文件名是 `_default.ftl` [>>](https://github.com/opoo/opoopress/blob/master/core/src/main/resources/site/templates/_default.ftl)，宏名为 `defaultLayout`。
```text
<#macro defaultLayout>
    ...
    <#nested>
    ...
</#macro>
```
其中 `<#nested>` 所占的位置就是要插入的具体内容的位置，具体可参考 FreeMarker 文档。

要使用该模板，只需要在源文件的 front-matter 头部定义变量 `layout: default` 即可。

### 默认 layout
当前 OpooPress 自带的主题包含以下几个 layout：
* **default**
	* 模板文件 _default.ftl [>>](https://github.com/opoo/opoopress/blob/master/core/src/main/resources/site/templates/_default.ftl)
	* 宏名 defaultLayout
	* 包含基础的 HTML头部、页面头部信息、导航菜单、内容占位、页脚信息和HTML脚部内容
* **post**
	* 模板文件 _post.ftl [>>](https://github.com/opoo/opoopress/blob/master/core/src/main/resources/site/templates/_post.ftl)
	* 宏名 postLayout
	* 该 layout 实际调用了 defaultLayout 的宏，拥有 default 中的所有内容，并定义了文章展示时所需的文章头部、文章底部、评论、边栏等。
* **page**
	* 模板文件 _page.ftl [>>](https://github.com/opoo/opoopress/blob/master/core/src/main/resources/site/templates/_page.ftl)
	* 宏名 pageLayout
	* 该 layout 实际调用了 defaultLayout 的宏，拥有 default 中的所有内容，并定义了页面展示时所需的页面头部、页面底部、评论、边栏等。
	


### 自定义 layout
用户可以自定义 layout 模板，例如当前站点使用的 [doc](https://github.com/opoo/opoopress.com/blob/master/zh/templates/_doc.ftl) layout。

举个例子，假设 layout 定义如下 (site/templates/_layout01.ftl)：
```text
<#macro layout01Layout>
<html>
 <head>
  <title> ${'$'}{page.title} - ${'$'}{site.title} </title>
  <meta name="Generator" content="OpooPress">
  <meta name="Author" content="${'$'}{page.author}">
  <meta name="Description" content="${'$'}{page.description}">
 </head>

 <body>
  <h1>${'$'}{page.title}</h1>
  <#nested>
  <div>Comments</div>
 </body>
</html>
</#macro>
```

假设博客中某一个源文件定义如下 (site/source/path1/page01.html)：
```text
 ---
 layout: layout01
 title: '这是一个特殊的 layout 页面'
 author: Nobody
 description: Description here!
 ---
 你好，世界！

 Hello World！
```
最终将生成如下的 HTML 文件 (target/public/site/path1/page01.html)：
```html
<html>
 <head>
  <title> 这是一个特殊的 layout 页面 - 站点名称 </title>
  <meta name="Generator" content="OpooPress">
  <meta name="Author" content="Nobody">
  <meta name="Description" content="Description here!">
 </head>

 <body>
  <h1>这是一个特殊的 layout 页面</h1>
  <p>你好，世界！</p>

  <p>Hello World！</p>
  <div>Comments</div>
 </body>
</html>
```



## 模板片段文件
为了提高代码的可读性和可维护性，OpooPress 按功能将完整的模板分成了许多细小的片段，并将这些片段单独存储成一个文件，以被 layout 引用。

目前，默认主题中主要包含以下一些主要的模板片段：
* **head.ftl** - HTML 头部，从 `<html>` 开始到 `</head>` 结束。网页 meta 信息，样式单等在这里导入。
* **header.ftl** - 网页内容的顶部，显示站点名称、logo 等信息。
* **navigation.ftl** - 横向导航菜单栏。
* **footer.ftl** - 网页的页脚，显示版权信息等。
* **after_footer.ftl** - 所有的 JavaScript 脚本在这里导入，包括评论、统计、社会化分享的脚本代码都写在这个文件中。

## 其它模板文件
* **new_page.ftl** - 创建新页面时使用的模板，用户可根据需要修改。
* **new_post.ftl** - 创建新文章时使用的模板，用户可根据需要修改。
* **sample_post.ftl** - 用于初始化（安装）博客时生成示例文章，博客初始化后，该模板无用。


## 参考资料

FreeMarker：[中文手册(PDF)](http://sourceforge.net/projects/freemarker/files/chinese-manual/FreeMarker_Manual_zh_CN.pdf/download)、[英文手册](http://freemarker.org/docs/index.html)
