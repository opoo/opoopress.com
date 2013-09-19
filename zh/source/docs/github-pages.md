---
layout: doc
title: 发布到 GitHub Pages
url: /docs/github-pages/
index: 800
group: "发布"
---

[GitHub Pages](http://pages.github.com) 是一个为用户、组织或者项目提供网站主机的网络服务。该服务提供 [github.io](http://github.io) 的二级域名，用户也可以绑定自己注册的域名。GitHub Pages 服务是*免费*的，支持常规的 HTML 内容，所以将 OpooPress 博客或者网站发布到 GitHub Pages 是一个非常好的选择。


* 一、[关于 GitHub Pages](#about-github-pages)
	* 1.1 [用户 和 组织 Pages](#user-and-organization-pages)
	* 1.2 [项目 Pages](#project-pages)
* 二、[发布方式](#deployment-methods)
	* 2.1 [opoopress-wagon-github](#opoopress-wagon-github)
		* 2.1.1 [基本用法](#opoopress-wagon-github-basic-usage)
		* 2.1.2 [示例](#opoopress-wagon-github-demo)
	* 2.2 [opoopress-wagon-git](#opoopress-wagon-git)
		* 2.2.1 [工作模式](#opoopress-wagon-git-working-mode)
		* 2.2.2 [基本用法](#opoopress-wagon-git-basic-usage)
		* 2.2.3 [同类产品](#opoopress-wagon-git-similar-wagons)
	* 2.3 [wagon-scm + maven-scm-provider-gitexe](#wagon-scm--maven-scm-provider-gitexe)
		* 2.3.1 [基本用法](#wagon-scm--maven-scm-provider-gitexe-basic-usage)
		* 2.3.2 [已知问题](#wagon-scm--maven-scm-provider-gitexe-known-issues)



<h2 id="about-github-pages">一、关于 GitHub Pages</h2>

Github Pages 运行时文件来源于特定的 GitHub 库中的特定分支。GitHub Pages 支持两种基本的类型：
用户/组织 Pages 和 项目Pages，可分别用户发布 用户/组织 网站 和 项目网站。这两种 Pages 的发布方式基本
上时相同的，仅有很小的细节差异。

<h3 id="user-and-organization-pages">1.1、用户 和 组织 Pages</h3>

用户 和 组织 Pages 存放于一个特殊的 GitHub 库中，与普通的 GitHub 库不同，这个库只能存放 GitHub Pages 文件。
该库必须以用户账号来命名。 例如 [opoo 的用户 Pages 库](https://github.com/opoo/opoo.github.io)的名称 为
`opoo.github.io`（由于 GitHub Pages 域名变更，早期创建的用户 Pages 库名可能是 <code>username.github.com</code>）。

该库中 `master` 分支的内容将会用来构建和发布到 GitHub Pages 站点，所以要确保您的 OpooPress 站点内容都存储在这个分支。

<div class="note info">
  <h2>自定义域名不影响库名</h2>
  <p>
    GitHub Pages 默认发布在  <code>username.github.io</code> 子域名，该子域名与库 
    <code>username.github.io</code> 有对应关系，所以即使您使用了自己的域名，也不应该修改库的名称。
  </p>
</div>

<h3 id="project-pages">1.2、项目 Pages</h3>

与用户和组织 Pages 不同，项目 Pages 将内容保存在项目库中一个叫 `gh-pages` 的特殊分支中。
GitHub Pages 会从这个分支获取内容，并发布到用户 Pages 的子域名中，如 
`username.github.io/project` (可使用自己的域名)。


<h2 id="deployment-methods">二、发布方式</h2>
[如前文所述](../deployment-methods/)，OpooPress 发布功能依赖于 Apache Wagon，由于支持 Git 协议的 wagon 很多，所以发布 OpooPress 博客到 GitHub Pages 的方式也很多。以下三种方式，经过测试可用。

- [opoopress-wagon-github](#opoopress-wagon-github) - *纯 Java 实现*
- [opoopress-wagon-git](#opoopress-wagon-git) - *使用 git 客户端，较为高效*
- [wagon-scm + maven-scm-provider-gitexe](#wagon-scm--maven-scm-provider-gitexe) - *使用 git 客户端*

<h3 id="opoopress-wagon-github">2.1 opoopress-wagon-github</h3>

该 wagon 是为 OpooPress 定制的（其实也可以用在其它项目中），代码参考了 [GitHub Maven Plugins](https://github.com/opoo/maven-plugins)，底层使用 [GitHub Java API](https://github.com/eclipse/egit-github/tree/master/org.eclipse.egit.github.core) ([GitHub API V3](http://developer.github.com/))，是一种纯 Java 的实现。
- 优点：纯 Java 的实现，不依赖其它 git 客户端。
- 缺点：发布较为耗时。每次发布时都会上传所有文件（而非新文件）计算 SHA1 值，导致用时较长。

该发布程序默认使用单线程来处理文件上传，可指定参数 `-Dthreads=N` 启用多线程上传，`N` 为线程数量。通常 `N` 值越大，速度越快，但失败率越高；越小则越慢，但相对稳定。该参数默认值为 `1`（即不启用多线程）。
	mvn op:deploy -Dthreads=8

该 wagon 支持的 URL 协议是 `github://`。

<h4 id="opoopress-wagon-github-basic-usage">2.1.1 基本用法</h4>
1. 在 pom.xml 中配置 `extension` 节点，例如
```xml
<build>
	<extensions>
		<extension>
			<groupId>org.opoo.press.maven.wagon</groupId>
			<artifactId>opoopress-wagon-github</artifactId>
			<version>1.0.2-SNAPSHOT</version>
		</extension>
	</extensions>
</build>
```
1. 在主配置文件 `config.yml` 中配置 `deploy_server` 信息
```plain
deploy_server: {id: "github", url: "github://github.com/repositoryOwner/repositoryName/", branch: "refs/heads/gh-pages", message: "Commit my website."}
```
该配置包含以下一些参数
    * **id**
        * Maven `settings.xml` 中 `server` 的 id。参考 [Maven 配置](http://maven.apache.org/pom.html) `<distributionManagement><site></site></distributionManagement>`。
    * **url**
        * 指定当前要发布到的 Server 的 url，格式为 
    `github://<username>:<password>@github.com/repositoryOwner/repositoryName/`
        * `username`: GitHub 用户名。不设置时取 Maven `settings.xml` 对应 `server` 的用户名。
        * `password`: GitHub 登录密码。不设置时取 Maven `settings.xml` 对应 `server` 的密码。
        * `repositoryOwner`: GitHub 库的所有者。必须设置。
        * `repositoryName`: GitHub 库的名称。必须设置。
    * **oauth2Token**
        * 使用 OAuth2 来认证 GitHub 账户时的 Token，参考 [GitHub OAuth API](http://developer.github.com/v3/oauth/)。
    * **message**
        * 用于提交到 GitHub 库的消息。可选。
    * **branch**
        * 要提交到 GitHub 库的分支。默认是 `refs/heads/gh-pages`，发布到 用户 和 组织 Pages时，请设置该值为 `refs/heads/master`。
    * **dryRun**
        * 取值范围 `true` | `false`，默认值 `false`。
    * **force**
        * 取值范围 `true` | `false`，默认值 `false`。
        * 是否强制更新。
    * **merge**
        * 取值范围 `true` | `false`，默认值 `false`。
        * 是否合并更新。
    * **noJekyll**
        * 取值范围 `true` | `false`，默认值 `true`。
        * 是否始终在根目录下创建文件 `.nojekyll`。如果您的网站中包含以下划线开头的目录时，应该启用该属性。
    * **host**
        * GitHub API 主机。默认值为 `api.github.com`。
2. 在 Maven `settings.xml` 中配置 `server` 节点
```xml
<servers>
	<server>
		<id>github</id>
		<username>GitHubLogin</username>
		<password>GitHubPassw0rd</password>
	</server>
</servers>
```
或者 
```xml
<servers>
	<server>
		<id>github</id>
		<password>OAUTH2TOKEN</password>
	</server>
</servers>
```
    * 只指定 `id` 和 `password` 时，该 `password` 值会被当作 `oauth2Token` 来使用。
    * 只指定 `username` 时，发布过程中会提示输入密码。
    * 密码可通过 [Maven Password Encryption 机制](http://maven.apache.org/guides/mini/guide-encryption.html) 加密。
    * 在 `config.yml` 中的配置的优先级高于 `settings.xml` 中的配置。例如在  `settings.xml` 配置了 `username` 为 `user1`，而在 `config.yml` 中配置了 `url: github://user2@github.com/user1/repo1/`，则最终会取值 `user2`。

3. 执行命令发布网站
```bash
$ mvn op:deploy
```

<h4 id="opoopress-wagon-github-demo">2.1.2 示例</h4>

这是一个成功发布的 OpooPress 示例：[http://opoo.github.io/](http://opoo.github.io/)。


<h3 id="opoopress-wagon-git">2.2 opoopress-wagon-git</h3>

该 wagon 实质是通过 Java 封装了 git 命名行客户端工具。底层实现与 [maven-scm-provider-gitexe](#wagon-scm--maven-scm-provider-gitexe) 类似，但比其更加高效。
- 优点: 发布速度快
- 缺点: 需要安装 git 命令行客户端

Windows 环境建议安装 [GitHub for Windows](https://windows.github.com/)，该工具即可用于操作 GitHub 库，也可用于操作其它 git 库，并且能自动升级。在程序菜单中打开 GitHub, Inc -> Git Shell，执行 OpooPress deploy 命令即可。

该 wagon 支持的 URL 协议是 `git:ssh://` 或者 `git:https://`。

<div class="note info">
  <p>该 wagon 不但可用于操作 GitHub 库，也用于操作其它 Git 库。</p>
</div>

<h4 id="opoopress-wagon-git-working-mode"> 2.2.1 工作模式</h4>
**safe-checkout 模式**: 

这是 wagon 默认的工作方模式。工作流程如下：
- 创建全新的临时文件夹
- 将 Git/GitHub 库中指定分支的内容 checkout 到该文件夹
- 复制要发布的内容到该文件夹
- 运行 `git add .`, `git commit` 及 `git push`
- 删除该文件夹

**非 safe-checkout 模式**: 

这种模式更高效，但不是特别安全。工作流程如下：
- 根据库的 URL 使用摘要算法（MD5）确定要检出的文件夹，如果文件夹不存在则新建
- 如果文件夹中已经存在库内容，则更新内容到最新
- 如果文件夹中不存在库内容，则 checkout 库内容到文件夹
- 复制要发布的内容到该文件夹
- 运行 `git add .`, `git commit` 及 `git push`


该模式下，由于上次发布后没有删除库内容，使得下次运行时不需要下载整个库，只下载更新，所有具有更高的效率，但也可能引发冲突。

要启用该模式，运行发布命令时须使用参数 `-Dwagon.git.safe.checkout=false`。
	mvn op:deploy -Dwagon.git.safe.checkout=false


<h4 id="opoopress-wagon-git-basic-usage">2.2.2 基本用法</h4>
1. 在 pom.xml 中配置 `extension` 节点，例如
```xml
<build>
	<extensions>
		<extension>
			<groupId>org.opoo.press.maven.wagon</groupId>
			<artifactId>opoopress-wagon-git</artifactId>
			<version>1.0.2-SNAPSHOT</version>
		</extension>
	</extensions>
</build>
```
1. 在主配置文件 `config.yml` 中配置 `deploy_server` 信息
```plain
deploy_server: {id: "github", url: "git:https://github.com/opoo.github.io.git", branch: "master"}
```
或者
```plain
deploy_server: {id: "github", url: "git:ssh://git@github.com/opoo/opoopress.git", branch: "gh-pages"}
```
该配置包含以下一些参数
    * **id**
        * Maven `settings.xml` 中 `server` 的 id。
    * **url**
        * 指定当前要发布到的 Server 的 url，url 中 `git:` 之后的部分为标准的 git 库 URL格式，必须是支持 push 的 git 访问协议。
    * **message**
        * 用于提交到 GitHub 库的消息。可选。
    * **branch**
        * 要提交到 GitHub 库的分支。默认是 `master`，发布到项目 Pages 时，请设置该值为 `gh-pages`。注意，与 opoopress-wagon-github 不同的是，这里的 branch 参数不必指定 `refs/heads/`。

2. 执行 OpooPress 命令发布网站
```bash
$ mvn op:deploy
```

<h4 id="opoopress-wagon-git-similar-wagons">2.2.3 同类产品</h4>
- [Git Wagon for Apache Maven(wagon-git)](http://synergian.github.io/wagon-git/)
- [Wagon GitSite(wagon-gitsite)](http://khuxtable.github.io/wagon-gitsite/)

以上两个产品底层同样调用 git 命令行客户端工作，实测时调用 `git remote add origin <url>` 时，始终会出错。opoopress-wagon-git 也会调用这个命令，但在调用失败时会改为调用 `git remote set-url origin <url>` 命令。


<h3 id="wagon-scm--maven-scm-provider-gitexe">2.3 wagon-scm + maven-scm-provider-gitexe</h3>

结合 Apache 发行的 wagon-scm 和 maven-scm-provider-gitexe 也可以将 OpooPress 发布到 GitHub Pages。其中 maven-scm-provider-gitexe 的实质也是通过 Java 封装了 git 命名行客户端工具。

优点: Apache 官方发行包
缺点: 需要安装 git 命令行客户端

Windows 环境建议安装 GitHub for Windows，该工具即可用于操作 GitHub 库，也可用于操作其它 git 库，并且能自动升级。在程序菜单中打开 GitHub, Inc -> Git Shell，执行 OpooPress deploy 命令即可。

该方式下，运行 `git add` 添加文件是一个个处理的，所以效率比 opoopress-wagon-git 略低。

支持的 URL 前缀是 `scm:git:ssh://` 或者 `scm:git:https://`。

<div class="note info">
  <p>该方式不但可用于操作 GitHub 库，也用于操作其它 Git 库。</p>
</div>

<h4 id="wagon-scm--maven-scm-provider-gitexe-basic-usage">2.3.1 基本用法</h4>
1. 在 pom.xml 中配置 `extension` 节点，例如
```xml
<build>
	<extensions>
		<extension>
			<groupId>org.apache.maven.wagon</groupId>
			<artifactId>wagon-scm</artifactId>
			<version>2.4</version>
		</extension>
		<extension>
			<groupId>org.apache.maven.scm</groupId>
			<artifactId>maven-scm-manager-plexus</artifactId>
			<version>1.5</version>
		</extension>
		<extension>
			<groupId>org.apache.maven.scm</groupId>
			<artifactId>maven-scm-provider-gitexe</artifactId>
			<version>1.5</version>
		</extension>
	</extensions>
</build>
```
2. 在主配置文件 `config.yml` 中配置 `deploy_server` 信息
```plain
deploy_server: {id: "github", url: "scm:git:https://github.com/opoo.github.io.git"}
```
或者
```plain
deploy_server: {id: "github", url: "scm:git:ssh://git@github.com/opoo/opoopress.git"}
```
该配置包含以下一些参数
    * **id**
        * Maven `settings.xml` 中 `server` 的 id。
    * **url**
        * 指定当前要发布到的 Server 的 url，url 中 `scm:git:` 之后的部分为标准的 git 库 URL 格式，必须是支持 push 的 git 访问协议。

3. 在 Maven `settings.xml` 中配置 `server` 节点
```xml
<servers>
	<server>
		<id>github</id>
		<username>GitHubLogin</username>
		<password>GitHubPassw0rd</password>
		<configuration>
			<scmVersionType>branch</scmVersionType>
			<scmVersion>gh-pages</scmVersion>
		</configuration>
	</server>
</servers>
```
4. 执行 OpooPress 命令发布网站
```bash
$ mvn op:deploy
```

<h4 id="wagon-scm--maven-scm-provider-gitexe-known-issues"> 2.3.2 已知问题</h4>
wagon-scm 在调用时，每次都会创建新的临时文件夹，检出、复制文件并提交（push），然后删除文件夹，目前发现的问题是，如果当前博客没有纳入 git 版本管理（即博客根目录下没有 `.git` 目录），则在创建新的临时文件夹并检出是报错，显示找不到上级目录。

