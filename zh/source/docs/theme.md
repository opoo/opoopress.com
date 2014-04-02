---
layout: doc
title: 主题概述
url: /docs/theme/
index: 610
group: "主题"
no_english_version: true
---

目前， OpooPress 在发布时内置了一个比较简单的主题，该主题打包在 `opoopress-core-<VERSION>.jar` 包里，当运行 `install` 安装博客后，主题中的样式源文件将会复制到 `/site/sass` 目录，静态文件复制到 `/site/assets` 目录，模板文件复制到 `/site/templates` 目录，**博客源文件**复制到 `/site/source` 目录。

* 样式源文件 (sass)
    * SASS 样式源文件。需要经过 compass 引擎编译成 css，最终编译成的 css 位于 `assets/stylesheets` 目录。自定义主题时，可直接使用 css 来定义样式，这样直接将 css 文件放在 assets 目录下即可。
* 静态文件 (assets)
    * 主题所需要的 JavaScript，CSS，图片等文件，用户也可以将自己要上传的图片放在这个目录中。
* 模板文件 (templates)
    * 模板定义文件（ftl 格式）。注意的主要布局模板和模板片段都定义在这个目录中。
* 博客源文件 (source)
    * 需要经过解析的文件，包括文章、页面、首页、分类页、标签页、站点地图、订阅源等的源文件。

<div class='note'>
  <h3>博客源文件</h3>
  <p>有必要对博客源文件这个概念再次说明一下：博客源文件都带有一个 <a href="/zh/docs/frontmatter/">front-matter</a> 的头部，需要根据头部定义调用特定程序来装饰 (render) 这个文件的内容。</p>
  <p>例如，文章的源文件仅仅包含一个 front-matter 的头部和文章内容，在经过装饰 (render) 后，生成的 HTML 就包含了模板中定义的头部，侧栏，底部等内容。</p>
</div>

继续阅读[模板](./templates/)及[样式](./styles/)相关文档。
