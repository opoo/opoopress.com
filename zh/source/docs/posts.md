---
layout: doc
title: 撰写文章
url: /docs/posts/
index: 70
group: "内容"
---

## 一、创建文章源文件

执行以下指令创建新文章文件
```
mvn op:new-post -Dtitle="文章标题" -Dname="文件名称"
```

参数使用 `-D参数名=参数值` 的形式设置。其中：
- **title**：必须。当前文章的标题。
- **name**：可选。当前文章文件的名称，相当于 WordPress 中 slug 的概念，用于文章的 URL。如果不知道该参数，name 将由 title 自动转化而来，中文会被转成拼音，特殊字符会被移除。

### 1.1 文件
新文章的文件名格式为 `yyyy-MM-dd-name.markdown`，并默认存储在 `$site/source/article/yyyy/MM/` 目录中。

该缺省目录可以通过在 `config.yml` 中设置属性 `new_post_dir` 来改变，例如要将所有的文章按年保存，则设置 `new_post_dir: "'article/'yyyy/"`。

示例1：
	mvn op:new-post -Dtitle="世界，你好" -Dname="hello-world"
将生成文件 `$site/source/article/2013/07/2013-07-31-hello-world.markdown`

示例2：
	mvn op:new-post -Dtitle="世界，你好"
将生成文件 `$site/source/article/2013/07/2013-07-31-shi-jie-ni-hao.markdown`


### 1.2 内容
新建文章的文件内容由一个 FreeMarker 模板决定的，该模板为 `$site/templates/new_post.ftl`。您可以根据自己的需要修改默认新生成文章的内容，例如可以添加头 `url: /${'$'}{name}/`，这样生成的每篇文章就已经确定了 url 地址。

该模板文件可以使用一下一些变量：
* **title**：文章标题
* **name**：文章名称
* **date**：日期，格式 yyyy-MM-dd HH:mm
* **filename**：文件名
* **filepath**：文件相对于 `$site/source` 的路径
* **site**：当前 [site](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/Site.java) 对象

## 二、撰写文章内容

您可以使用任何你喜欢的文本编辑工具，打开上一步创建的文件来撰写文章的内容。

如果写作未完成，不打算即时发布，可将文件头部 `published` 设置为 `false`，这样可避免误将文章发布出去。正式发布时则需要将该属性改回为 `true`。


## 三、预览文章

运行命令 `mvn op:preview` 既可以启动预览，打开浏览器访问 http://localhost:8080/。

运行预览后您可以继续写作，OpooPress 会监视整个 site 的变化。但文章被保存时，OpooPress 会自动运行 `generate` 命令，新文章即被重新生成了，此时只需刷新浏览器即可看见新内容。

如果您要预览草稿（即文件头部 `published` 被设置成了 `false`），执行命令需要额外的参数：

	mvn op:preview -Dshow-drafts=true

如果要在启动预览时，先执行 `generate`，可使用以下参数：
	mvn op:preview -Dop.generate.skip=false

参数 `op.generate.skip`： 是否跳过生成步骤。默认值 `true`。

## 四、发布文章

最后，运行 `mvn op:deploy` 命令即可将您的文章正式发布出去，更多细节请参考[发布方式](../deployment-methods/)章节。

需要注意的是，如果您刚刚预览了草稿，建议您先执行 `mvn op:generate` 再执行 `mvn op:deploy` 以避免将草稿发布出去。 

	mvn op:generate
	mvn op:deploy
或者
	mvn op:generate op:deploy
或者
	mvn op:deploy -Dop.generate.skip=false

参数 `op.generate.skip`： 是否跳过生成步骤。默认值 `true`。
