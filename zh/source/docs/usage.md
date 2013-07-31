---
layout: doc
title: 基本用法
url: /docs/usage/
index: 30
group: "安装配置"
---

## Maven Plugin 版本命令
 
命令格式：`mvn op:command -Dparam1=val1 -Dparam2=var2 ...`

根据 Maven 特性，多个命令可以顺序执行 `mvn op:command1 op:command2 ... -Dparam1=val1 -Dparam2=var2 ...`

插件包括以下 goal：

- [opoopress:install](/maven-site/opoopress-maven-plugin/install-mojo.html) - *安装并初始化网站/博客*
- [opoopress:generate](/maven-site/opoopress-maven-plugin/generate-mojo.html) - *生成静态网站*
- [opoopress:build](/maven-site/opoopress-maven-plugin/build-mojo.html) - *生成静态网站，与 `generate`命令相同*
- [opoopress:preview](/maven-site/opoopress-maven-plugin/preview-mojo.html) - *启动一个 Web 服务器，并监控站点文件变化，变化时自动重新生成*
- [opoopress:deploy](/maven-site/opoopress-maven-plugin/deploy-mojo.html) - *发布站点到指定的服务器或者本地目录*
- [opoopress:clean](/maven-site/opoopress-maven-plugin/clean-mojo.html) - *清理站点模板缓存和临时文件*
- [opoopress:new-page](/maven-site/opoopress-maven-plugin/new-page-mojo.html) - *创建新页面*
- [opoopress:new-post](/maven-site/opoopress-maven-plugin/new-post-mojo.html) - *创建新文章*
- [opoopress:sass-compile](/maven-site/opoopress-maven-plugin/sass-compile-mojo.html) - *编译 SASS*
- [opoopress:sass-watch](/maven-site/opoopress-maven-plugin/sass-watch-mojo.html) - *监控 SASS 文件，变化时自动重新编译*
- [opoopress:wordpress-import](/maven-site/opoopress-maven-plugin/wordpress-import-mojo.html) - *从 WordPress 导入文章和页面*

以上各个指令的参数请点击相应的链接，查看其 Maven 文档。

<!--
**注意**：该插件已经定义其 `goalPrefix` 为 `op`，所以可以使用 `mvn op:install`, `mvn op:generate` 等替代原格式 `mvn opoopress:install`, `mvn opoopress:generate`。
-->


<div class='note info'>
  <p><code>mvn op:install op:generate op:preview</code> 这是在一行命令里执行了 3 个 Maven Goal。在实际使用中通常是分别执行的，如 <code>op:install</code> Goal 对于同一个博客/站点来说，只能执行一次，在博客初始化后就不能再执行了，而 <code>op:generate</code>, <code>op:preview</code> 则可以执行多次。</p>
</div>

<div class='note'>
  <p>Goal <code>op:generate</code> 等同于 Goal <code>op:build</code>。</p>
  <p>Goal 的前缀 <code>op</code> 等同于 <code>opoopress</code>，该插件已经定义其 <code>goalPrefix</code> 为 <code>op</code>，可以使用 <code>mvn op:install</code>, <code>mvn op:generate</code> 等替代原格式 <code>mvn opoopress:install</code>, <code>mvn opoopress:generate</code>。</p>
</div>


## OpooPress Standalone 版本命令

命令格式通常是 `op command [site] [options]`，各个参数意义如下：

1. 参数 `command`: 必要参数。用于指定要执行的 OpooPress 命令。目前支持的命令包括 
	* `init`/`install`：安装并初始化网站/博客，可指定 locale，如果不指定，取系统默认值
	* `generate`/`build`：生成静态网站
	* `preview`：预览博客。启动一个 Web 服务器，并监控站点文件变化，变化时自动重新生成
	* `deploy`：发布站点到指定的服务器或者本地目录
	* `clean`：清理站点模板缓存和临时文件
	* `newpage`：创建新页面
	* `newpost`：创建新文章
	* `wordpress`：从 WordPress 导入文章和页面
	* `sass`：编译 SASS
   
   各个命令的详细用法及参数可以运行 `op command -h` 查看，例如 `op wordpress -h`。

2. 参数 `site`: 可选参数。该参数指定站点的名称（亦即目录名），默认值为 `site`。
  
  OpooPress 支持多博客（多站点），每个博客都是 `/path/to/opoopress/` 下的一个目录，通过给 `install`/`init` 命令传递 site 参数，可以安装（初始化）这多个博客。例如通过 `./op install en` 创建一个名为 `en` 的博客，并通过 `./op install cn` 创建一个名为 `cn` 的博客，它们的内容将分别存放在 `/path/to/opoopress/en/` 和 `/path/to/opoopress/cn/` 目录。
 
3. 其它参数/选项

   通常是以一个 `-` 开头的参数，不同的 `command` 对应的参数/选项各不相同，可运行 `op command -h` 查看。

   例如 `./op install en -l en_US` 可创建一个名为 `en` 的英文博客，`./op install cn -l zh_CN` 可创建一个名为 `cn` 的中文博客。
