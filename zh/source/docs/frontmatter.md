---
layout: doc
title: Front-matter 头
url: /docs/frontmatter/
index: 65
group: "内容"
var1: "变量1"
var2: "a b c"
---

OpooPress 使用一段 [YAML](http://yaml.org/) 语法的头部文本来标记源文件，这段头部称之为 YAML front-matter header。在站点的 `source` 目录中，包含该头部结构的文件就是博客/网站的源文件，会被 OpooPress 引擎处理，不包含 的则视为静态文件，生成时仅作简单的复制。

YAML front-matter header 以三个 `-` 的行开始，并同样以三个 `-` 的行结束，例如：

```
 ---
 layout: post
 title: 'OpooPress 1.0 RC1 发布'
 date: '2013-07-07 00:30'
 comments: true
 categories: ['opoopress']
 url: '/article/opoopress-1.0-rc1-has-been-released/'
 ---
```

这两行之间的内容即为源文件的头信息，符合 YAML 语法，每行指定一个变量，格式为 `变量名: 值`，解析后在 Java 的 Map 结构存在。

**注意**：变量名 和 值 之间需要使用半角 `:`，且 `:` 后应有一个半角的空格。

## 公共变量

以下变量在页面（Page）或者文章（Post）中都是通用的

<table>
  <thead>
    <tr>
      <th>变量</th>
      <th>描述</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>layout</code></p>
      </td>
      <td>
        <p>当前文件的布局。OpooPress 默认定义的布局包括 <code>default</code>, <code>post</code>, <code>page</code>，用户可自定义更多，对应模板文件 <code>_&lt;layout&gt;.ftl</code></p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>title</code></p>
      </td>
      <td>
        <p>文章或者页面的标题。</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>date</code></p>
      </td>
      <td>
        <p>文章或者页面的创建、发布时间。当前文件是文章（post）时，该变量必须指定。</p>
      </td>
    </tr>
     <tr>
      <td>
        <p><code>date_format</code></p>
      </td>
      <td>
        <p>变量 date 的格式，可选。可用 Java DateFormat 格式化字符串。</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>updated</code></p>
      </td>
      <td>
        <p>文章或者页面的修改时间。可选。</p>
      </td>
    </tr>
     <tr>
      <td>
        <p><code>updated_format</code></p>
      </td>
      <td>
        <p>变量 updated 的格式，可选。可用 Java DateFormat 格式化字符串。</p>
      </td>
    </tr>
   <tr>
      <td>
        <p><code>path</code></p>
      </td>
      <td>
        <p>源文件相对应 <code>source</code> 目录的路径。例如 <code>/docs/frontmatter.markdown</code>。</p>
      </td>
    </tr>
   <tr>
      <td>
        <p><code>url</code></p>
      </td>
      <td>
        <p>文件最终输出时要使用的 <code>url</code>(不包含 root 部分)。可选。该属性可完全自定义每个源文件的输出 URL。例如从固定链接设置成 /%postname%/ 的 WordPress 迁移到 OpooPress，为了保证其 URL 不变，我们可以在源文件中设置这个变量来达到目的。</p>
      </td>
    </tr>

    <tr>
      <td>
        <p><code>comments</code></p>
      </td>
      <td>
        <p>当前页面/文章是否允许评论。可选，默认值 <code>true</code>。</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>sidebar</code></p>
      </td>
      <td>
        <p>当前页面/文章是否允许侧边栏。可选，默认值 <code>true</code>。</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>footer</code></p>
      </td>
      <td>
        <p>当前页面/文章是否允许底栏。可选，默认值 <code>true</code>。</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>author</code></p>
      </td>
      <td>
        <p>当前页面/文章的作者，可选。多人共用一个博客时可指定每篇文章、页面的作者。</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>keywords</code></p>
      </td>
      <td>
        <p>关键字。可选。生成 HTML 的 &lt;meta name="keywords" content="keywords"&gt;。</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>desription</code></p>
      </td>
      <td>
        <p>描述。可选。生成 HTML 的 &lt;meta name="desription" content="desription"&gt;。</p>
      </td>
    </tr>
  </tbody>
</table>


## 仅适用于文章（Post）的变量


<table>
  <thead>
    <tr>
      <th>变量</th>
      <th>描述</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>published</code></p>
      </td>
      <td>
        <p>文章是否发布（不是草稿）。默认值为 <code>true</code>。</p>
      </td>
    </tr>

    <tr>
      <td>
        <p style="margin-bottom: 5px;"><code>category</code></p>
        <p><code>categories</code></p>
      </td>
      <td>
        <p>文章的分类目录。<code>category</code> 指定单个分类目录，如 <code>category: Blog</code>。<code>categories</code> 指定一个数组，如 <code>categories: [Java, Maven, XXX]</code>。OpooPress 支持属性分类目录</p>
      </td>
    </tr>
 <tr>
      <td>
        <p style="margin-bottom: 5px;"><code>tag</code></p>
        <p><code>tags</code></p>
      </td>
      <td>
        <p>文章的标签。<code>tag</code> 指定单个标签，如 <code>tag: Tag0</code>。<code>tags</code> 指定一个数组，如 <code>tags: [Tag1, Tag2, Tag3]</code></p>
      </td>
    </tr>
      <tr>
      <td>
        <p><code>excerpt</code></p>
      </td>
      <td>
        <p>文章的摘要。可选。在博客首页显示摘要，并显示继续阅读按钮。</p>
      </td>
    </tr>

  </tbody>
</table>

## 自定义 front-matter header 变量

自定义变量可在文章、页面中通过 FreeMarker 语法引用。

例如：

```
--- 
var1: "变量1"
var2: "a b c"
...
--- 

本页中的变量 var1 值为 ${'$'}{page.var1}，var2 值为 /${'$'}{page.var1}/。
当前站点的 url 是 ${'$'}{site.url}

```

输出
```
本页中的变量 var1 值为 ${page.var1}，var2 值为 /${page.var2}/。
当前站点的 url 是 ${site.url}
```


更多相关知识可参考 [Jekyll Front-matter](http://jekyllrb.com/docs/frontmatter/)。
