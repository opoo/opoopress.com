---
layout: doc
title: Creating pages
url: /docs/pages/
index: 100
group: "CONTENT"
---
## 1. Create Pages

You can create a page by command below:
```
mvn op:new-page -Dtitle="Page Title" -Dname="page-name" -Dformat=markdown
```
Options:
- **title**: Required. The title of the post that you will create.
- **name**: Optional. The name(slug) of the post that you will cteate. It's will be converted by [SlugHelper](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/SlugHelper.java) if `name` is not specified.
- **format**: Optional. The format of the post that you will create. Default value is `markdown`, can be any of `markdown`, `textile`, `html` or `md`.


### 1.1 The pages file path
The default new page file store path is `${'$'}{name}.${'$'}{format}`(relative to $site/source folder). You can change it by set variable `new_page` in config file `config.yml`.

Example
	mvn op:new-page -Dtitle="Sample Page" -Dformat=md
==> `$site/source/sample-page.md`
 

### 1.2 Default content
The default content of new page file is defined in a FreeMarker template file $site/templates/new_page.ftl, you can customize it.

Variables in the template:
* **title**: The title of new post
* **name**: The name of new post
* **date**: Date format: `yyyy-MM-dd HH:mm`
* **year, month, day, hour, minute, second**
* **file**: The post file
* **site**: The [site](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/Site.java) object


## 2. Write content

All blog page files must begin with [YAML front-matter](../frontmatter). After that, it's simply a matter of deciding which format you prefer. OpooPress supports two popular content markup formats: [Markdown](http://daringfireball.net/projects/markdown/) and [Textile](http://textile.sitemonks.com/). These formats each have their own way of marking up different types of content within a post, so you should familiarize yourself with these formats and decide which one best suits your needs.
 

## 3. Preview pages

Run command `mvn op:preview` to start a web server, then open http://localhost:8080/ in your browser.

All files of the blog will be watching when a preview web server is running. It will be regenerated if any file changes.

## 4. Deploy pages

Run `mvn op:deploy` to deploy your posts, see [deployment methods](../deployment-methods/) for more details.
