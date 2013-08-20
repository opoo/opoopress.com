---
layout: doc
title: 发布到 GitHub Pages
url: /docs/github-pages/
index: 800
group: "发布"
---

[GitHub Pages](http://pages.github.com) are public web pages for users,
organizations, and repositories, that are freely hosted on GitHub's
[github.io](http://github.io) domain or on a custom domain name of your choice. GitHub Pages 
supports regular HTML content, So they’re a great way to host your OpooPress
website/blog for free.

## 一、关于 GitHub Pages

Github Pages 运行时文件来源于特定的 GitHub 库中的特定分支。GitHub Pages 支持两种基本的类型：
用户/组织 Pages 和 项目Pages，可分别用户发布 用户/组织 网站 和 项目网站。这两种 Pages 的发布方式基本
上时相同的，仅有很小的细节差异。

### 1.1、用户 和 组织 Pages

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

### 1.2、项目 Pages

与用户和组织 Pages 不同，项目 Pages 将内容保存在项目库中一个叫 `gh-pages` 的特殊分支中。
GitHub Pages 会从这个分支获取内容，并发布到用户 Pages 的子域名中，如 
`username.github.io/project` (可使用自己的域名)。


## 二、将 OpooPress 发布到 GitHub Pages

### 2.1、基本用法

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
        * 用于提交到 GitHub 库的消息。必须设置。
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

3. 执行 OpooPress Maven Plugin 命令发布网站
```bash
$ mvn op:deploy
```

### 2.2、示例

1. config.yml
```plain
deploy_server: {id: "github", url: "github://github.com/opoo/opoo.github.io/", branch: "refs/heads/master", message: "Commit my website."}
```

2. settings.xml
```xml
<servers>
	<server>
		<id>github</id>
		<username>my-github-username</username>
		<password>my-github-password</password>
	</server>
</servers>
```

3. 运行 `mvn op:deploy` 发布

这是一个成功发布的 OpooPress 示例：[http://opoo.github.io/](http://opoo.github.io/)。
