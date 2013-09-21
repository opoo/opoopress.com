---
layout: doc
title: Variables
url: /docs/variables/
index: 120
group: "CONTENT"
---

Every page or post source file of OpooPress will be processed twice:
- File format processing: process `Markdown`, `Textile` and other supported markup language file to output content(maybe contains `FreeMarker` tags and expressions)
- Template processing: process content (contains FreeMarker tags and expressions) to final HTML content

So the source file of OpooPress can use FreeMarker tags, expressions and variables directly. We already know the variables defined in the [YAML front- matter](../frontmatter) header, and now we will learn other more variables in OpooPress.

- site
	- Site instance object. Type is `org.opoo.press.Site`.
- page 
	- Page or post instance object. Type is `org.opoo.press.Page` or `org.opoo.press.Post`, depends on source file layout(template).
- root_url
	- Blog (site) root, such as `/` or `/en`.
- paginator
	- Paginator object. It is available in site `index` page. 
- related_posts
	- Recent post colletion. It is available in post only.
- All registered TemplateModel objects
	- The `freemarker.template.TemplateModel` objects those regiestered by custom plugin(s).

## site

All public properties of type `org.opoo.press.Site` and all variables defined in `config.yml` are accessable.

## page

All public properties of type `org.opoo.press.Page` or `org.opoo.press.Post` and all variables defined in the [YAML front- matter](../frontmatter) are accessable.

## paginator

Type is `org.opoo.press.Pager`.

## related_posts

Type is `List<org.opoo.press.Post>`.


## TemplateModel objects

In secondary development of OpooPress, we can define our own `freemarker.template.TemplateModel` and register it in our own custom plugin.