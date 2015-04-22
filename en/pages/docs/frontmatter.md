---
layout: doc
title: Front-matter
url: /docs/frontmatter/
index: 65
group: "CONTENT"
var1: "var1"
var2: "a b c"
render: true
---
Any file that contains a [YAML](http://yaml.org/) front matter block will be processed by OpooPress as a special file, we called blog source file. The front matter must be the first thing in the file and must take the form of valid YAML set between triple-dashed lines. Here is a basic example:

```
 ---
 layout: post
 title: 'OpooPress 1.0.0 has been released'
 date: '2013-08-08 00:30'
 comments: true
 categories: ['opoopress']
 url: '/article/opoopress-1.0.0-has-been-released/'
 ---
```

Between these triple-dashed lines, you can set predefined variables (see below for a reference) or even create custom ones of your own. These variables will then be available to you to access using FreeMarker tags in the source file of pages or posts.

## 1. Public Variables

Public variables that you can set in the front-matter of a page or post.

<table>
  <thead>
    <tr>
      <th>Variable</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>layout</code></p>
      </td>
      <td>
        <p>The layout of current file. OpooPress defined three default layouts: <code>default</code>, <code>post</code>, <code>page</code>, template file has suffix <code>_&lt;layout&gt;.ftl</code>.</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>title</code></p>
      </td>
      <td>
        <p>The title of page or post.</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>date</code></p>
      </td>
      <td>
        <p>Creation or published time. This variable is required in a post.</p>
      </td>
    </tr>
     <tr>
      <td>
        <p><code>date_format</code></p>
      </td>
      <td>
        <p>The time format of <code>date</code> variable. Optional. See Java DateFormat.</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>updated</code></p>
      </td>
      <td>
        <p>The update time. Optional.</p>
      </td>
    </tr>
     <tr>
      <td>
        <p><code>updated_format</code></p>
      </td>
      <td>
        <p>The time format of <code>updated</code> variable. Optional. See Java DateFormat.</p>
      </td>
    </tr>
   <tr>
      <td>
        <p><code>path</code></p>
      </td>
      <td>
        <p>The relative path to <code>source</code> directory of the source file. e.g. <code>/docs/frontmatter.markdown</code>.</p>
      </td>
    </tr>
   <tr>
      <td>
        <p><code>url</code></p>
      </td>
      <td>
        <p>The final URL of page or post. Optional. </p>
      </td>
    </tr>

    <tr>
      <td>
        <p><code>comments</code></p>
      </td>
      <td>
        <p>Current page / post whether to allow comments. Optional. default is <code>true</code>.</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>sidebar</code></p>
      </td>
      <td>
        <p>Current page / post whether to allow side bar. Optional. default is <code>true</code>.</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>footer</code></p>
      </td>
      <td>
        <p>Current page / post whether to contain footer. Optional. default is <code>true</code>.</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>author</code></p>
      </td>
      <td>
        <p>Author of this page or post. Optional.</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>keywords</code></p>
      </td>
      <td>
        <p>Keywords. Optional. It will be used as &lt;meta name="keywords" content="keywords"&gt; in the output HTML file.</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>desription</code></p>
      </td>
      <td>
        <p>Desription. Optional. It will be used as &lt;meta name="desription" content="desription"&gt; in the output HTML file.</p>
      </td>
    </tr>
  </tbody>
</table>


## 2. Variables for Post Only


<table>
  <thead>
    <tr>
      <th>Variable</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>published</code></p>
      </td>
      <td>
        <p>Not draft. Default value is <code>true</code>.</p>
      </td>
    </tr>

    <tr>
      <td>
        <p style="margin-bottom: 5px;"><code>category</code></p>
        <p><code>categories</code></p>
      </td>
      <td>
        <p>Category array. <code>category</code> specify single category, e.g. <code>category: Blog</code>. <code>categories</code> specify a category array, e.g. <code>categories: [Java, Maven, XXX]</code>. OpooPress supports tree category structure.</p>
      </td>
    </tr>
 <tr>
      <td>
        <p style="margin-bottom: 5px;"><code>tag</code></p>
        <p><code>tags</code></p>
      </td>
      <td>
        <p>Tag. <code>tag</code> specify single tag, e.g. <code>tag: Tag0</code>. <code>tags</code> specify a tag array, e.g. <code>tags: [Tag1, Tag2, Tag3]</code></p>
      </td>
    </tr>
      <tr>
      <td>
        <p><code>excerpt</code></p>
      </td>
      <td>
        <p>The excerpt of post. Optional. Show post excerpt and <code>read on</code> button in blog index page.</p>
      </td>
    </tr>

  </tbody>
</table>

## 3. Custom Front-matter Variables

Any variables in the front matter that are not predefined are mixed into the data that is sent to the FreeMarker templating engine during the conversion. For instance, if you set var1 and var2, you can use that in your layout or other source file:


```
--- 
var1: "var1"
var2: "a b c"
...
--- 

The value of variable `var1` in this page is ${'$'}{page.var1}.
The value of variable `var2` in this page is /${'$'}{page.var2}/.
The url of this site is ${'$'}{site.url}

```

output
```
The value of variable `var1` in this page is ${page.var1}.
The value of variable `var2` in this page is /${page.var2}/.
The url of this site is ${site.url}.
```

Also see [Jekyll Front-matter](http://jekyllrb.com/docs/frontmatter/) for more.
