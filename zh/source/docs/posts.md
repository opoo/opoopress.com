---
layout: doc
title: 撰写文章
url: /docs/posts/
index: 70
group: "内容"
---

## 一、创建新文章

执行以下指令创建新文章
```
mvn op:new-post -Dtitle="文章标题" -Dname="文件名称" -Dformat=markdown
```

参数使用 `-D参数名=参数值` 的形式设置。其中：
- **title**：必须。当前文章的标题。
- **name**：可选。当前文章文件的名称，相当于 WordPress 中 slug 的概念，用于文章的 URL。如果不指定该参数，name 将由 title [自动转化](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/SlugHelper.java)而来，中文会被转成拼音，特殊字符会被移除。
- **format**：可选。当前文章的格式，默认值是 `markdown`，可根据需要指定值为 `textile`、`html`、`md` 等。

### 1.1 文件位置
新建文章默认存储路径为 `article/${'$'}{year}-${'$'}{month}-${'$'}{day}-${'$'}{name}.${'$'}{format}` （相对于 $site/source 目录）。该默认值可以自定义，在 `config.yml` 中设置属性 `new_post` 即可。例如要将所有的文章按年保存，则设置 `new_post: "article/${'$'}{year}/${'$'}{year}-${'$'}{month}-${'$'}{day}-${'$'}{name}.markdown"`，或者 `new_post: "article/${'$'}{year}/${'$'}{year}-${'$'}{month}-${'$'}{day}-${'$'}{name}.${'$'}{format}"`。

存储路径中的变量 year, month, day, hour, minute, second 取自于当前时间，变量 name, format 取自调用 new-post 的参数。

示例1：
	mvn op:new-post -Dtitle="世界，你好" -Dname="hello-world"
将生成文件 `$site/source/article/2013-07-31-hello-world.markdown`

示例2：
	mvn op:new-post -Dtitle="世界，你好" -Dformat=md
将生成文件 `$site/source/article/2013-07-31-shi-jie-ni-hao.md`

<div class='note'>
  <p>与 Jekyll、Octopress 不同，OpooPress 的文章源文件可以存放在 <code>$site/source</code> 下的任意位置，生成器在构建时会根据固定链接、URL 等参数输出到适当的路径。如果没有固定链接、URL 等影响输出路径的配置，则按文章在 <code>$site/source</code> 中的相对路径输出。</p>
</div>


### 1.2 默认内容
新建文章的内容由一个 FreeMarker 模板决定的，该模板为 `$site/templates/new_post.ftl`。您可以根据自己的需要修改默认新文章的内容，例如可以添加头 `url: /${'$'}{name}/`，这样生成的每篇文章就已经确定了 url 地址。

该模板文件可以使用一下一些变量：
* **title**：文章标题
* **name**：文章名称
* **date**：日期，格式 yyyy-MM-dd HH:mm
* **year, month, day, hour, minute, second**：日期的各个组成部分，year 4 位，其它 2 位。
* **file**：当前文件
* **site**：当前 [site](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/Site.java) 对象
* **published**：是否发布

## 二、撰写内容

所有文章文件都必须以 [YAML front- matter](../frontmatter) 开头。在这之后，您可以选择自己喜欢的格式来撰写文章内容。
OpooPress 支持 2 个主流的标记语言格式：[Markdown](http://daringfireball.net/projects/markdown/) 和
[Textile](http://textile.sitemonks.com/)。它们各自有不同的标记语法，同一篇文章您只能使用其中一种，并需要修改相应的文件后缀。
直接使用 HTML 来撰写内容也是可以的，需要将文件后缀修改为 `.html`。

文章内容可以使用 FreeMarker 模板语法来调用变量。OpooPress 生成器处理步骤是先处理格式（Markdown，Textile 等），再将处理后的内容当做 FreeMarker 模板进行解析。所以文章格式（Markdown，Textile 等）与 FreeMarker 模板是两个不同层面的概念，相互不冲突。


文章的 [YAML front- matter](../frontmatter) 比较丰富，可参看上一章节。

### 2.1 文章摘要

文章摘要是在博客首页显示时使用的。如果当前文章有摘要内容，则在首页显示摘要内容，并显示 `继续阅读` 的按钮，没有摘要内容则会显示文章全文。

有两种方式来设置文章摘要。
- 在 [YAML front- matter](../frontmatter) 头设置 `excerpt` 变量
- 在文章正文中适当的位置插入 `<!--more-->`，该标记前面的内容即文章摘要。该标记也可通过 `config.yml` 自定义。


### 2.2 草稿
如果写作未完成，可将 [YAML front- matter](../frontmatter) 头 `published` 设置为 `false`，这样可避免误将文章发布出去。正式发布时则需要将该属性改回为 `true`。


## 三、预览文章

运行命令 `mvn op:preview` 既可以启动预览，打开浏览器访问 http://localhost:8080/。

运行预览后您可以继续写作，OpooPress 会监视整个 site 的变化。但文章被保存时，OpooPress 会自动运行 `generate` 命令，新文章即被重新生成了，此时只需刷新浏览器即可看见新内容。

如果您要预览草稿（即文件头部 `published` 被设置成了 `false`），执行命令需要额外的参数：

	mvn op:preview -Dop.show-drafts=true


## 四、发布文章

最后，运行 `mvn op:deploy` 命令即可将您的文章正式发布出去，更多细节请参考[发布方式](../deployment-methods/)章节。
