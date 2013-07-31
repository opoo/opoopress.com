---
layout: page
title: OpooPress Documentation
comments: true
date: 2013-06-29 11:20
sidebar: false
footer: false
---

The documentation is not finished yet, please [check this article](http://opoo.org/opoopress-1.0-rc1-released/)(中文) first.

## For OpooPress Maven Plugin Release
 
Command format is`mvn op:command -Dparam1=val1 -Dparam2=var2 ...`.

You can execute more than one goal in one command like `mvn op:command1 op:command2 ... -Dparam1=val1 -Dparam2=var2 ...`.

Available goals of this plugin:

- [opoopress:install](/maven-site/opoopress-maven-plugin/install-mojo.html) - *Install and initialize site/blog*
- [opoopress:generate](/maven-site/opoopress-maven-plugin/generate-mojo.html) - *Generate static site/blog*
- [opoopress:build](/maven-site/opoopress-maven-plugin/build-mojo.html) - *Generate static site/blog, same as `generate`*
- [opoopress:preview](/maven-site/opoopress-maven-plugin/preview-mojo.html) - *Start a web server for preview, monitor the site for changes and generate whenever it does*
- [opoopress:deploy](/maven-site/opoopress-maven-plugin/deploy-mojo.html) - *Deploy site/blog to remote or local server*
- [opoopress:clean](/maven-site/opoopress-maven-plugin/clean-mojo.html) - *Clean site/blog templates cache and temp files*
- [opoopress:new-page](/maven-site/opoopress-maven-plugin/new-page-mojo.html) - *Create new page file*
- [opoopress:new-post](/maven-site/opoopress-maven-plugin/new-post-mojo.html) - *Create new post file*
- [opoopress:sass-compile](/maven-site/opoopress-maven-plugin/sass-compile-mojo.html) - *Compile the SASS files into css*
- [opoopress:sass-watch](/maven-site/opoopress-maven-plugin/sass-watch-mojo.html) - *Watch the SASS for changes and compile whenever it does.*
- [opoopress:wordpress-import](/maven-site/opoopress-maven-plugin/wordpress-import-mojo.html) - *Import posts and pages from the XML file that exported from WordPress*

Click the link to see maven document for more information about the goal.

**Note**: The plugin set `goalPrefix` as `op`, so we can use `mvn op:install`, `mvn op:generate` or `mvn opoopress:install`, `mvn opoopress:generate`.

## For OpooPress Standalone Package Release

OpooPress command format is `op command [site] [options]`：

1. `command`: (*Required*) Specified the OpooPress command. The supported commands are: 
	* `init`/`install`: IInstall and initialize site/blog, can specify parameter `-l(--locale)`.
	* `generate`/`build`: Generate static site/blog.
	* `preview`: Start a web server for preview, monitor the site for changes and generate whenever it does. 
	* `deploy`:Deploy site/blog to remote or local serve.
	* `clean`: Clean site/blog templates cache and temp files.
	* `newpost`: Create a new post file.
	* `newpage`: Create a new page file.
	* `wordpress`: Import posts and pages from the XML file that exported from WordPress.
	* `sass`: Compile the SASS files into css.
   
   Type	`op [command] -h` for details, such as `op wordpress -h`.

2. `site`: (*Optional*) The blog/site name, also the blog/site directory name, default value is `site`.

  You can install more than one blog/site in one OpooPress. `./op install en` will create a blog named `en` and `./op install cn` will create a blog named `cn`, The blog files will be locate in `/path/to/opoopress/en/` and `/path/to/opoopress/cn/`.
 
3. `options`: (*Optional*) 

  Always start with letter `-`, Different `command` has different `options`, run `op command -h` for more details.

  For example: `./op install en -l en_US` will create an English blog named `en`, and `./op install cn -l zh_CN` will create a Chinese blog named `cn`.
