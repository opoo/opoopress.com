---
layout: doc
title: Writing Posts
url: /docs/posts/
index: 70
group: "CONTENT"
---

## 1. Create pages

To create a new post, all you need to do is create a new file in the the posts folder. Yout can run command below to create a new post file.
```
mvn op:new-post -Dtitle="post title" -Dname="post_name" -Dformat=markdown
```
Options:
- **title**: Required. The title of the post that you will create.
- **name**: Optional. The name(slug) of the post that you will cteate. It's will be converted by [SlugHelper](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/SlugHelper.java) if `name` is not specified.
- **format**: Optional. The format of the post that you will create. Default value is `markdown`, can be any of `markdown`, `textile`, `html` or `md`.

### 1.1 The posts folder
The default posts folder is `article/${'$'}{year}-${'$'}{month}-${'$'}{day}-${'$'}{name}.${'$'}{format}`(relative to $site/source folder). You can change it by set variable `new_post` in config file `config.yml`. e.g. set `new_post: "article/${'$'}{year}/${'$'}{year}-${'$'}{month}-${'$'}{day}-${'$'}{name}.markdown"` or `new_post: "article/${'$'}{year}/${'$'}{year}-${'$'}{month}-${'$'}{day}-${'$'}{name}.${'$'}{format}"`.

Example 1
	mvn op:new-post -Dtitle="Hello, World" -Dname="hello-world"
==> `$site/source/article/2013-07-31-hello-world.markdown`

Example 2
	mvn op:new-post -Dtitle="Hello, World" -Dformat=md
==> `$site/source/article/2013-07-31-hello-world.md`


### 1.2 Default content
The default content of new post file is defined in a FreeMarker template file `$site/templates/new_post.ftl`, you can customize it.

Variables in the template:
* **title**: The title of new post
* **name**: The name of new post
* **date**: Date format: `yyyy-MM-dd HH:mm`
* **year, month, day, hour, minute, second**
* **file**: The post file
* **site**: The [site](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/Site.java) object
* **published**:

## 2. Write post

All blog post files must begin with [YAML front-matter](../frontmatter). After that, it's simply a matter of deciding which format you prefer. OpooPress supports two popular content markup formats: [Markdown](http://daringfireball.net/projects/markdown/) and [Textile](http://textile.sitemonks.com/). These formats each have their own way of marking up different types of content within a post, so you should familiarize yourself with these formats and decide which one best suits your needs.

### 2.1 Post excerpts

There are two methods to define post excerpts:
- Define variable `excerpt` in post's [YAML front- matter](../frontmatter)
- Insert `<!--more-->` in the post's content, the text from the beginning of the content to the first occurrence of `<!--more-->` will be used as excerpt. `<!--more-->` can be changed by variable `excerpt_separator` in config file `config.yml`.


### 2.2 Drafts
Just set variable `published` to `false` in the [YAML front- matter](../frontmatter). 


## 3. Preview posts

Run command `mvn op:preview` to start a web server, then open http://localhost:8080/ in your browser.

All files of the blog will be watching when a preview web server is running. It will be regenerated if any file changes.

If you want to preview drafts, run command with option `-Dop.show-drafts=true`
	mvn op:preview -Dop.show-drafts=true


## 4. Deploy posts

Run `mvn op:deploy` to deploy your posts, see [deployment methods](../deployment-methods/) for more details.
