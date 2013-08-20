---
layout: doc
title: 创建页面
url: /docs/pages/
index: 100
group: "内容"
---
## 一、创建新页面

执行以下指令创建新页面
```
mvn op:new-page -Dtitle="页面标题" -Dname="文件名称" -Dformat=markdown
```

参数使用 `-D参数名=参数值` 的形式设置。其中：
- **title**：必须。当前页面的标题。
- **name**：可选。当前页面文件的名称，相当于 WordPress 中 slug 的概念，用于页面的 URL。如果不指定该参数，name 将由 title [自动转化](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/SlugHelper.java)而来，中文会被转成拼音，特殊字符会被移除。
- **format**：可选。当前页面的格式，默认值是 `markdown`，可根据需要指定值为 `textile`、`html`、`md` 等。

### 1.1 文件位置
新建页面默认存储路径为 `${'$'}{name}.${'$'}{format}` （相对于 $site/source 目录）。该默认值可以自定义，在 `config.yml` 中设置属性 `new_page` 即可，通常不需要修改。

示例：
	mvn op:new-page -Dtitle="示例页面" -Dformat=md
将生成文件 `$site/source/shi-li-ye-mian.md`

<div class='note'>
  <p>与 Jekyll、Octopress 不同，OpooPress 的页面源文件可以存放在 `$site/source` 下的任意位置，生成器在构建时会根据 URL 参数输出到适当的路径。如果没有指定 URL，则按页面在 `$site/source` 中的相对路径输出。</p>
</div>
 

### 1.2 默认内容
新建页面的内容由一个 FreeMarker 模板决定的，该模板为 `$site/templates/new_page.ftl`。您可以根据自己的需要修改默认新页面的内容，例如可以添加头 `url: /${'$'}{name}/`，这样生成的每篇页面就已经确定了 url 地址。

该模板文件可以使用一下一些变量：
* **title**：页面标题
* **name**：页面名称
* **date**：日期，格式 yyyy-MM-dd HH:mm
* **year, month, day, hour, minute, second**：日期的各个组成部分，year 4 位，其它 2 位。
* **file**：当前文件
* **site**：当前 [site](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/Site.java) 对象


## 二、撰写内容

所有页面文件都必须以 [YAML front- matter](../frontmatter) 开头。在这之后，您可以选择自己喜欢的格式来撰写页面内容。
OpooPress 支持 2 个主流的标记语言格式：[Markdown](http://daringfireball.net/projects/markdown/) 和
[Textile](http://textile.sitemonks.com/)。它们各自有不同的标记语法，同一篇页面您只能使用其中一种，并需要修改相应的文件后缀。
直接使用 HTML 来撰写内容也是可以的，需要将文件后缀修改为 `.html`。

页面内容可以使用 FreeMarker 模板语法来调用变量。OpooPress 生成器处理步骤是先处理格式（Markdown，Textile 等），再将处理后的内容当做 FreeMarker 模板进行解析。所以页面格式（Markdown，Textile 等）与 FreeMarker 模板是两个不同层面的概念，相互不冲突。


页面的 [YAML front- matter](../frontmatter) 可参看上一章节。


## 三、预览页面

运行命令 `mvn op:preview` 既可以启动预览，打开浏览器访问 http://localhost:8080/。

运行预览后您可以继续写作，OpooPress 会监视整个 site 的变化。但页面被保存时，OpooPress 会自动运行 `generate` 命令，新页面即被重新生成了，此时只需刷新浏览器即可看见新内容。

## 四、关联页面

页面不像文章那样可以自动出现在博客首页（索引页），要访问相应的页面，就必须引用页面的 url。
- 如果要将页面链接到导航菜单中，需要修改 `config.yml` 配置文件的 `navs` 属性。
- 如果要在文章或其它页面中链接到该页面，可直接写链接，例如 markdown 格式的链接形式为 `[Link Title](link_url)`。

## 五、发布页面

最后，运行 `mvn op:deploy` 命令即可将您的页面正式发布出去，更多细节请参考[发布方式](../deployment-methods/)章节。
