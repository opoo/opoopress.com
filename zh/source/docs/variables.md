---
layout: doc
title: 变量
url: /docs/variables/
index: 120
group: "内容"
---

OpooPress 博客的文章和页面的源文件都需要经过两次处理：
- 格式处理：将 Markdown，Textile 之类的文本处理成含有 FreeMarker 语法（如果有的话）的 HTML 格式
- 模板处理：将含有 FreeMarker 语法的文本处理成最终输出的 HTML 格式

所以，OpooPress 的源文件可以直接使用 FreeMarker 模板语法，可以调用 OpooPress 的变量。在 [YAML front- matter](../frontmatter) 章节，我们已经讲解了如何使用 `page` 变量，通过 `page` 再去调用页面或者文章头部的变量。OpooPress 包括以下一些变量：

- site
	- 站点对象，`org.opoo.press.Site` 类型。
- page 
	- 页面对象，`org.opoo.press.Page` 或者 `org.opoo.press.Post` 类型，根据当前模板是页面还是文章而定。
- root_url
	- 博客根路径，例如 `/` 或 `/zh`。
- paginator
	- 分页对象，当前模板是分页页面中的一页的，该对象有效。
- related_posts
	- 当前文章的相关文章对象集合，当前模板是文章时有效。
- 所有已注册的 TemplateModel 对象
	- 自定义插件所注册的 `freemarker.template.TemplateModel` 对象。


## site

可访问属性包括 `org.opoo.press.Site` 类的所有公共属性和站点配置文件 `config.yml` 中的定义的所有属性。

## page

可访问属性包括 `org.opoo.press.Page` 或 `org.opoo.press.Post` 类的所有公共属性和页面或者文章的 front-matter 头部定义的变量，参考 [YAML front- matter](../frontmatter)。

## paginator

数据类型 `org.opoo.press.Pager`。

## related_posts

数据类型 `List<org.opoo.press.Post>`。与当前文章相关的文章对象的集合。


## TemplateModel 对象

在对 OpooPress 进行二次开发时，我们可以定义自己的 `freemarker.template.TemplateModel` 实现类，在自定义插件中注册这些类，然后就可以在文章或者页面中使用这些 FreeMarker 的自定义标记了。可参考 FreeMarker 相关文档。