---
layout: doc
title: Deploy to GitHub Pages
url: /docs/github-pages/
index: 800
group: "DEPLOYMENT"
---

[GitHub Pages](http://pages.github.com) are public web pages for users,
organizations, and repositories, that are freely hosted on GitHub's
[github.io](http://github.io) domain or on a custom domain name of your choice. GitHub Pages 
supports regular HTML content, So they’re a great way to host your OpooPress
website/blog for free.


* 1\. [GitHub Pages](#about-github-pages)
	* 1.1 [User and Organization Pages](#user-and-organization-pages)
	* 1.2 [Project Pages](#project-pages)
* 2\. [Deployment Methods](#deployment-methods)
	* 2.1 [Using custom wagon: opoopress-wagon-github](#opoopress-wagon-github)
		* 2.1.1 [Basic usage](#opoopress-wagon-github-basic-usage)
		* 2.1.2 [Demo](#opoopress-wagon-github-demo)
	* 2.2 [Using custom wagon: opoopress-wagon-git](#opoopress-wagon-git)
		* 2.2.1 [Working mode](#opoopress-wagon-git-working-mode)
		* 2.2.2 [Basic usage](#opoopress-wagon-git-basic-usage)
		* 2.2.3 [Similar wagons](#opoopress-wagon-git-similar-wagons)
	* 2.3 [Using wagon-scm and maven-scm-provider-gitexe](#wagon-scm--maven-scm-provider-gitexe)
		* 2.3.1 [Basic usage](#wagon-scm--maven-scm-provider-gitexe-basic-usage)
		* 2.3.2 [Known issues](#wagon-scm--maven-scm-provider-gitexe-known-issues)


<h2 id="about-github-pages">1. GitHub Pages</h2>

GitHub Pages work by looking at certain branches of repositories on GitHub. There are two basic types available: user/organization pages and project pages. The way to deploy these two types of sites are nearly identical, except for a few minor details.

<h3 id="user-and-organization-pages">1.1 User and Organization Pages</h3>

User and organization pages live in a special GitHub repository dedicated to only the GitHub Pages files. This repository must be named after the account name. For example, [@opoo's user page repository](https://github.com/opoo/opoo.github.io) has the name `opoo.github.io` (The older GitHub Pages repository name may be `username.github.com`).

Content from the master branch of your repository will be used to build and publish the GitHub Pages site, so make sure your OpooPress site is stored there.

<div class="note info">
  <h2>Custom domains do not affect repository names</h2>
  <p>
   GitHub Pages are initially configured to live under the  username.github.io subdomain, which is why repositories must be named this way even if a custom domain is being used.
  </p>
</div>

<h3 id="project-pages">1.2 Project Pages</h3>

Unlike user and organization Pages, Project Pages are kept in the same repository as the project they are for, except that the website content is stored in a specially named gh-pages branch. The content of this branch will be processed, and the output will become available under a subpath of your user pages subdomain, such as username.github.io/project (unless a custom domain is specified—see below).


<h2 id="deployment-methods">Deployment Methods</h2>

There are many methods to deploy OpooPress blog to GitHub Pages, these three methods have been tested.

- [opoopress-wagon-github](#opoopress-wagon-github) - *using pure java GitHub client*
- [opoopress-wagon-git](#opoopress-wagon-git) - *using git command line tools, more faster*
- [wagon-scm + maven-scm-provider-gitexe](#wagon-scm--maven-scm-provider-gitexe) - *using git command line tools*



<h3 id="opoopress-wagon-github">2.1 Using custom wagon: opoopress-wagon-github</h3>

This custom wagon wagon is developed by OpooPress. Just like [GitHub Maven Plugins](https://github.com/opoo/maven-plugins), `opoopress-wagon-github` uses [GitHub Java API](https://github.com/eclipse/egit-github/tree/master/org.eclipse.egit.github.core) ([GitHub API V3](http://developer.github.com/)) as lower level layer. It's a pure java solution for OpooPress deployment.
- Advantage: Pure Java GitHub client, any other git tools are not required
- Disadvantage: Low performance. It posts every file to GitHub server and return a SHA1 string one by one.

There is an optimize option for this wagon to make it use multi-threads to post files. The option format is `-Dthreads=N`. `N` is thread count you wish. Bigger `N` more faster, but much more unstable. The default value of this option is `1`, it means just use single thread to deploy site to GitHub Pages.

To use multi-thread just run:
	mvn op:deploy -Dthreads=8

The supported URL protocol of this wagon is `github://`.

<h4 id="opoopress-wagon-github-basic-usage">2.1.1 Basic usage</h4>
1. Set `extension` in `pom.xml`
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
1. Set `deploy_server` in `config.yml`
```plain
deploy_server: {id: "github", url: "github://github.com/repositoryOwner/repositoryName/", branch: "refs/heads/gh-pages", message: "Commit my website."}
```
Arguments for `deploy_server`:
    * **id**
        * The `servers/server/id` node value in Maven `settings.xml`, see [Maven POM](http://maven.apache.org/pom.html) `<distributionManagement><site></site></distributionManagement>`
    * **url**
        * the url format is 
    `github://<username>:<password>@github.com/repositoryOwner/repositoryName/`
        * `username`: GitHub user name used for API authentication, use `servers/server/username` node value in Maven `settings.xml` as default username.
        * `password`: GitHub password used for API authentication,  use `servers/server/password` node value in Maven `settings.xml` as default password.
        * `repositoryOwner`: Owner of repository, required.
        * `repositoryName`: Name of repository, required.
    * **oauth2Token**
        * OAuth2 access token for API authentication, see [GitHub OAuth API](http://developer.github.com/v3/oauth/)
    * **message**
        * Message used for commit. Optional.
    * **branch**
        * Branch ref that will be updated to commit made. Default value is `refs/heads/gh-pages`. Set to `refs/heads/master` if deploy to User and Organization Pages.
    * **dryRun**
        * `true` | `false` (default: `false`). 
	* Log what blobs, tree, and commits would be created without actually creating them.
    * **force**
        * `true` | `false` (default: `false`). 
        * Whether to force a ref update, default is fast-forwards only
    * **merge**
        * `true` | `false` (default: `false`). 
        * Whether to merge with the current tree or completely replace the tree that the commit points to
    * **noJekyll**
        * `true` | `false` (default: `true`). 
        * Whether to always create a .nojekyll file at the root of the site if one doesn't already exist.
    * **host**
        * Domain of GitHub API calls (defaults to api.github.com)
2. Update maven `settings.xml`
```xml
<servers>
	<server>
		<id>github</id>
		<username>GitHubLogin</username>
		<password>GitHubPassw0rd</password>
	</server>
</servers>
```
or
```xml
<servers>
	<server>
		<id>github</id>
		<password>OAUTH2TOKEN</password>
	</server>
</servers>
```
    * The `password` will be used as ``oauth2Token`` if only `id` and `password` are defined in `server` node
    * Password will be prompted if only `username` defined
    * You can encrypt the password in server node, see [Maven Password Encryption](http://maven.apache.org/guides/mini/guide-encryption.html)

3. Deployment
```bash
$ mvn op:deploy
```

<h4 id="opoopress-wagon-github-demo">2.1.2 Demo</h4>
This is a demo site deployed to GitHub Pages: [http://opoo.github.io/](http://opoo.github.io/)


<h3 id="opoopress-wagon-git">2.2 Using cutom wagon: opoopress-wagon-git</h3>

This custom wagon uses git command line tool(git version 1.8.1+ required) as lower level layer. It's similar to [maven-scm-provider-gitexe](#wagon-scm--maven-scm-provider-gitexe), but it's more faster.
- Advantage: fast
- Disadvantage: a git command line tool is required, such as [GitHub for Windows](https://windows.github.com/)

The supported URL prefix of this wagon is `git:ssh://` or `git:https://`.

<div class="note info">
  <p>This wagon can also deploy OpooPress to other normal git repositories.</p>
</div>

<h4 id="opoopress-wagon-git-working-mode"> 2.2.1 Workding mode</h4>
**safe-checkout mode**: 

This is the default working mode. The workflow as belows:
- Create all-new temp directory
- Checkout the specified branch content from Git/GitHub repository
- Copy site/blog files to this directory
- Run `git add .`, `git commit` and `git push`
- Delete this temp directory

**none safe-checkout mode**: 

This mode could be more faster, but more unstable. The workflow as belows:
- Calculate the checkout directory location by URL, create the directory if not exists
- Update (git pull) the content if repository exists in the directory
- Checkout the content if the directory is empty
- Copy site/blog files to this directory
- Run `git add .`, `git commit` and `git push`
- (DO NOT DELETE the directory)


In this mode, the content in the diectory will be reused in deployment. So it may be more faster, but more unstable.冲突。

You need specify maven command option `-Dwagon.git.safe.checkout=false` to enable this mode.
	mvn op:deploy -Dwagon.git.safe.checkout=false


<h4 id="opoopress-wagon-git-basic-usage">2.2.2 Basic usage</h4>
1. Set `extension` in `pom.xml`
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
1. Set `deploy_server` in `config.yml`
```plain
deploy_server: {id: "github", url: "git:https://github.com/opoo.github.io.git", branch: "master"}
```
or
```plain
deploy_server: {id: "github", url: "git:ssh://git@github.com/opoo/opoopress.git", branch: "gh-pages"}
```
Argument for `deploy_server`
    * **id**
        * The `servers/server/id` node value in Maven `settings.xml`.
    * **url**
        * The url of repository. The string before `git:` of the URL must be a valid git remote url, and must support push.
    * **message**
        * Message used for commit. Optional.
    * **branch**
        * Branch ref that will be updated to commit made. Default value is `master`(NOT `refs/heads/master`). Set to `gh-pages` if deploy to Project Pages.

3. Deployment
```bash
$ mvn op:deploy
```

<h4 id="opoopress-wagon-git-similar-wagons">2.2.3 Similar wagons</h4>
- [Git Wagon for Apache Maven(wagon-git)](http://synergian.github.io/wagon-git/)
- [Wagon GitSite(wagon-gitsite)](http://khuxtable.github.io/wagon-gitsite/)

These two wagons will cause exceptions when call `git remote add origin <url>`. opoopress-wagon-git calls `git remote set-url origin <url>`.


<h3 id="wagon-scm--maven-scm-provider-gitexe">2.3 Using wagon-scm and maven-scm-provider-gitexe</h3>

You can also use `wagon-scm` and `maven-scm-provider-gitexe` to deploy your blog to GitHub Pages. There packages are released by Apache.
- Advantage: Apache official releases
- Disadvantage: a git command line tool is required, such as [GitHub for Windows](https://windows.github.com/)

It run `git add` comand for every file one by one, so maybe it's not so fast.

The supported URL prefix of this wagon is `scm:git:ssh://` and `scm:git:https://`.

<div class="note info">
  <p>This method can also deploy OpooPress to other normal git repositories.</p>
</div>

<h4 id="wagon-scm--maven-scm-provider-gitexe-basic-usage">2.3.1 Basic usage</h4>
1. Set `extension` in `pom.xml`
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
2. Set `deploy_server` in `config.yml`
```plain
deploy_server: {id: "github", url: "scm:git:https://github.com/opoo.github.io.git"}
```
or
```plain
deploy_server: {id: "github", url: "scm:git:ssh://git@github.com/opoo/opoopress.git"}
```
Argument for `deploy_server`
    * **id**
        * The `servers/server/id` node value in Maven `settings.xml`.
    * **url**
        * The url of repository. The string before `scm:git:` of the URL must be a valid git remote url, and must support push.

3. Update maven `settings.xml`
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
4. Deployment
```bash
$ mvn op:deploy

<h4 id="wagon-scm--maven-scm-provider-gitexe-known-issues"> 2.3.2 Known Issues</h4>
If you blog is not git version controlled and run deploy command, it will cause an exception about `no parent directory`. 

<div class="note">
  <h3>Note</h3>
  <p>The snapshot packages (1.0.2-SNAPSHOT) that mentioned in this document are available from Sonatype OSS Snapshots not Maven Central, so read <a href="../../faqs/how-to-use-opoopress-snapshots/">how to use OpooPress snapshots</a> for details.</p>
</div>