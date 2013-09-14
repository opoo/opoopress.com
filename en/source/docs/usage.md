---
layout: doc
title: Basic Usage
url: /docs/usage/
index: 30
group: "GETTING STARTED"
---

## 1. For OpooPress Maven Plugin Release
 
Command format is`mvn op:command -Dparam1=val1 -Dparam2=var2 ...`.

You can execute more than one goals in one command, like `mvn op:command1 op:command2 ... -Dparam1=val1 -Dparam2=var2 ...`.

Available goals of this plugin:
- [op:install](/maven-site/opoopress-maven-plugin/install-mojo.html) - *Install and initialize site/blog*
- [op:sass-compile](/maven-site/opoopress-maven-plugin/sass-compile-mojo.html) - *Compile the SASS files into css*
- [op:generate](/maven-site/opoopress-maven-plugin/generate-mojo.html) - *Generate static site/blog*
- [op:build](/maven-site/opoopress-maven-plugin/build-mojo.html) - *Generate static site/blog, same as `generate`*
- [op:preview](/maven-site/opoopress-maven-plugin/preview-mojo.html) - *Start a web server for preview, monitor the site for changes and generate whenever it does*
- [op:deploy](/maven-site/opoopress-maven-plugin/deploy-mojo.html) - *Deploy site/blog to remote or local server*
- [op:clean](/maven-site/opoopress-maven-plugin/clean-mojo.html) - *Clean site/blog templates cache and temp files*
- [op:new-page](/maven-site/opoopress-maven-plugin/new-page-mojo.html) - *Create new page file*
- [op:new-post](/maven-site/opoopress-maven-plugin/new-post-mojo.html) - *Create new post file*
- [op:sass-watch](/maven-site/opoopress-maven-plugin/sass-watch-mojo.html) - *Watch the SASS for changes and compile whenever it does.*
- [op:wordpress-import](/maven-site/opoopress-maven-plugin/wordpress-import-mojo.html) - *Import posts and pages from the XML file that exported from WordPress*

Click the link to see maven document for more information about the goal.

**Note** 
- Goal `op:generate` is same as goal `op:build`.
- The plugin set `goalPrefix` as `op`, so we can use `mvn op:install`, `mvn op:generate` or `mvn opoopress:install`, `mvn opoopress:generate`.


## OpooPress Phases

1. **Install & Initialize**  
	- Core function: Install and initialize blog/site
	- Goals: `op:install`, `op:clean`
2. **Build Theme**
	- Core function: build theme
	- Goals: `op:sass-compile`, `op:sass-watch`, `op:new-post`, `op:new-page`, `op:import`
3. **Generate Site**
	- Core function: generate static site
	- Goals: `op:generate`, `op:build`
4. **Preview & Deploy**
	- Core function: no
	- Goals: `op:preview`, `op:deply`

There are two rules for these phases:
- The previous phase core function will be executed first before the execution of any current phase goals.
- The previous phase core function will be executed first before the execution of current phase core function.

Examples:
- `op:preview`: the dependency chain will be `op:preview -> Generate Site -> Build Theme -> Install & Initialize`, and the execution order will be `Install & Initialize -> Build Theme -> Generate Site -> Start Preview`
- `op:new-post`: the dependency chain will be `op:new-post -> Install & Initialize`, and the execution order will be `Install & Initialize -> Create new post`.


## 2. For OpooPress Standalone Package Release

Not available currently.
