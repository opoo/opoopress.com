---
layout: doc
title: 基本用法
url: /docs/1.x/usage/
render: true
---

## 一、Java 开发人员版的命令
 
命令格式：`mvn op:command -Dparam1=val1 -Dparam2=var2 ...`

根据 Maven 特性，多个命令可以顺序执行 `mvn op:command1 op:command2 ... -Dparam1=val1 -Dparam2=var2 ...`

插件包括以下 goal：

- [op:install](/maven-site/opoopress-maven-plugin/install-mojo.html) - *安装并初始化网站/博客*
- [op:sass-compile](/maven-site/opoopress-maven-plugin/sass-compile-mojo.html) - *编译 SASS*
- [op:generate](/maven-site/opoopress-maven-plugin/generate-mojo.html) - *生成静态网站*
- [op:build](/maven-site/opoopress-maven-plugin/build-mojo.html) - *生成静态网站，与 `generate`命令相同*
- [op:preview](/maven-site/opoopress-maven-plugin/preview-mojo.html) - *启动一个 Web 服务器，并监控站点文件变化，变化时自动重新生成*
- [op:deploy](/maven-site/opoopress-maven-plugin/deploy-mojo.html) - *发布站点到指定的服务器或者本地目录*
- [op:clean](/maven-site/opoopress-maven-plugin/clean-mojo.html) - *清理站点模板缓存和临时文件*
- [op:new-page](/maven-site/opoopress-maven-plugin/new-page-mojo.html) - *创建新页面*
- [op:new-post](/maven-site/opoopress-maven-plugin/new-post-mojo.html) - *创建新文章*
- [op:sass-watch](/maven-site/opoopress-maven-plugin/sass-watch-mojo.html) - *监控 SASS 文件，变化时自动重新编译*
- [op:wordpress-import](/maven-site/opoopress-maven-plugin/wordpress-import-mojo.html) - *从 WordPress 导入文章和页面*

以上各个指令的参数请点击相应的链接，查看其 Maven 文档。


**注意** 
- Goal `op:generate` 等同于 Goal `op:build`。
- Goal 的前缀 `op` 等同于 `opoopress`，该插件已经定义其 `goalPrefix` 为 `op`，可以使用 `mvn op:install`, `mvn op:generate` 等替代原格式 `mvn opoopress:install`, `mvn opoopress:generate`。


## OpooPress 处理过程

我们将 OpooPress 的安装、构建、部署等过程分成以下几个阶段：

1. **安装站点**  
	- 功能: 安装站点
	- Goal: `op:install`, `op:clean`
2. **生成主题**
	- 功能: 生成主题
	- Goal: `op:sass-compile`, `op:sass-watch`, `op:new-post`, `op:new-page`, `op:import`
3. **生成站点**
	- 功能: 生成站点
	- Goal: `op:generate`, `op:build`
4. **生成后**
	- 功能: 无
	- Goal: `op:preview`, `op:deply`

阶段之间有一定的依赖关系，规则如下
- 当前阶段的 `goal` 在执行前会先执行上一阶段的`功能`
- 当前阶段的`功能`在执行前会先执行上一阶段的`功能`

示例：
- `op:preview` 的依赖链为 `op:preview -> 生成站点 -> 生成主题 -> 安装站点`，执行的顺序是 `安装站点 -> 生成主题 -> 生成站点 -> 启动预览`。
- `op:new-post` 的依赖链为 `op:new-post -> 安装站点`，执行的顺序是 `安装站点 -> 创建新文章`。


<div class='note'>
 <h3>按需执行</h3>
  <p>OpooPress 各阶段功能可以按需执行，例如执行 <code>安装站点</code> 时，OpooPress 会判断当前站点是否已经安装，未安装时才会真正执行操作。同样执行 <code>生成站点</code> 时也会先判断站点是否生成，是否在上次生成后源文件有变化等等，然后决定是否执行相应的操作。</p>
</div>



<h2 id="commands-for-non-developer"> 二、非开发人员版的命令</h2>

命令格式通常是 `op command [options]`，与开发人员版的命令格式唯一区别就是去掉了 `mvn op:`前缀（例如 `op preview` 对应 `mvn op:preview`），
其参数格式是一致的，都必须使用 `-D` 指定。

*目前仅提供 Windows 版本，请参安装指南文档。*

可用以下各 `command`：

- [install](/maven-site/opoopress-maven-plugin/install-mojo.html) - *安装并初始化网站/博客*
- [sass-compile](/maven-site/opoopress-maven-plugin/sass-compile-mojo.html) - *编译 SASS*
- [generate](/maven-site/opoopress-maven-plugin/generate-mojo.html) - *生成静态网站*
- [build](/maven-site/opoopress-maven-plugin/build-mojo.html) - *生成静态网站，与 `generate`命令相同*
- [preview](/maven-site/opoopress-maven-plugin/preview-mojo.html) - *启动一个 Web 服务器，并监控站点文件变化，变化时自动重新生成*
- [deploy](/maven-site/opoopress-maven-plugin/deploy-mojo.html) - *发布站点到指定的服务器或者本地目录*
- [clean](/maven-site/opoopress-maven-plugin/clean-mojo.html) - *清理站点模板缓存和临时文件*
- [new-page](/maven-site/opoopress-maven-plugin/new-page-mojo.html) - *创建新页面*
- [new-post](/maven-site/opoopress-maven-plugin/new-post-mojo.html) - *创建新文章*
- [sass-watch](/maven-site/opoopress-maven-plugin/sass-watch-mojo.html) - *监控 SASS 文件，变化时自动重新编译*
- [wordpress-import](/maven-site/opoopress-maven-plugin/wordpress-import-mojo.html) - *从 WordPress 导入文章和页面*
   
示例：

- 初始化博客： `D:\opoopress-${site.op_current_version}>op install`
- 预览博客：`D:\opoopress-${site.op_current_version}>op preview`
- 发布博客：`D:\opoopress-${site.op_current_version}>op deploy`
