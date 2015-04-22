---
layout: doc
title: Overview
index: 0
group: "GETTING STARTED"
render: true
---

## What's OpooPress

OpooPress is a java based static blog generator. It is an open-source software, of course you can download the source codes from <https://github.com/opoo/opoopress> if you intend to build OpooPress yourself. 


## The Generator

The generator has been released as a maven plugin. This java tool is based on maven command line. 
- Stable releases are available from [Maven Central][mc]
- Snapshot builds are available from [Sonatype OSS snapshots repository][oss]

Follow [Installation Instructions](../docs/installation/) to know how to install Java and Maven, and to know how to use OpooPress plugin to initialize, generate and deploy your blog or website.

Just can also download(git clone) the [sources](https://github.com/opoo/opoopress) of OpooPress and run `mvn install` to install OpooPress packages to your local maven repository.

## Current Versions

Current stable version : **${site.op_current_version}**
- Binary : [Maven Central][mc]
- Source : [tag: version-${site.op_current_version}](https://github.com/opoo/opoopress/releases/tag/version-${site.op_current_version})

Current snapshot version: **${site.op_current_snapshot}**
- Binary : [Sonatype OSS snapshots repository][oss]
- Source : [branch: master](https://github.com/opoo/opoopress)

<div class="note info">
  <p>Also see <a href="../faqs/how-to-use-opoopress-snapshots/">How to use OpooPress snapshots</a>.</p>
</div>

## Packages
- **opoopress-core**
	- Core functionality package, include default theme and site templates.
- **opoopress-support**
	- Include compass compiler, blog previewer, etc.
- **opoopress-maven-plugin**
	- Maven plugin for OpooPress, defined several Mojo for mvn command line.
	- [Basic usage](../docs/usage/)
- **opoopress-mailet**
	- A custom Mailet. It makes you could publish your OpooPress blog by Email.
	- [Document](../docs/mailet/)
- **opoopress-wagon-github**
	- A custom Wagon that uses GitHub Java API (org.eclipse.egit.github.core) as lower level layer. It makes you could publish your OpooPress blog to GitHub Pages.
	- [Document](../docs/github-pages/#opoopress-wagon-github)
- **opoopress-wagon-git**
	- A custom Wagon that uses Git Executable Command Line as lower level layer. It makes you could publish your OpooPress blog to GitHub Pages or other git repository.
	- [Document](../docs/github-pages/#opoopress-wagon-git)

## Releases History
* 2014-06-18 - 1.1.1
* 2014-03-25 - 1.1.0
* 2013-11-20 - 1.0.3
* 2013-10-22 - 1.0.2 
* 2013-09-05 - 1.0.1 
* 2013-08-07 - 1.0.0


## Release Notes
### OpooPress 1.1.1 (since 1.1.0) {#release-notes-v1.1.1}
- Improvement
	- Support generate site in multi-threading.
- New Feature
	- Support `*.textile`, `*.tracwiki`, `*.mediawiki`, `*.twiki`, `*.confluence` source formats, powered by WikiText.


### OpooPress 1.1.0 (since 1.0.3) {#release-notes-v1.1.0}
- Improvement
	- Reconstructed the templates of default theme.
	- Improved `SiteFilter`. ([This sample](https://github.com/opoo/opoo.org/blob/master/src/main/java/org/opoo/website/plugin/ImgFinder.java) uses the *new* SiteFilter)
- New Feature
	- Add [duoshuo](http://duoshuo.com/) comments widget.


<h3 id="release-notes-v1.0.3">OpooPress 1.0.3 (since 1.0.2)</h3>

- Bug
	- Fixed [Issue #3](https://github.com/opoo/opoopress/issues/3): artifact `com.github.jnr:jnr-x86asm` always checking for updates from central
	- Fix directory monitor interval variable for preview.

<h3 id="release-notes-v1.0.2">OpooPress 1.0.2 (since 1.0.1)</h3>

- Bug
	- Fixed bug in StaleUtils: cannot check new file in `sass` subdirectory correctly
	- Fixed date format error in `atom.xml` and `sitemap.xml`
- Improvement
	- Changed logging framwork from Apache Commons Logging to Simple Logging Facade for Java (SLF4J)
	- Moved classes from plugin to a new module opoopress-wagon-github(a custom wagon), this wagon could make you deploy your OpooPress blog to GitHub Pages. It uses GitHub Java API (org.eclipse.egit.github.core, a pure java GitHub client) as lower level layer.
	- New algorithm for finding related posts
	- Improve the default theme
- New Feature
	- Added new custom wagon - opoopress-wagon-git, this wagon could make you deploy your OpooPress blog to GitHub Pages or any other git repositories. It uses Git Executable Command Line as lower level layer(a git command line client is required).
	- Support multi-source directory

<h3 id="release-notes-v1.0.1"> OpooPress 1.0.1 (since 1.0.0)</h3>
- Bug
	- Fixed bug in StaleUtils: cannot check new file in `assets` directory correctly
- Change
	- Changed permalink style
	- Changed new post file storage path
	- Changed new page file storage path

<h3 id="release-notes-v1.0.0"> OpooPress 1.0.0</h3>
- This is the first release of OpooPress.


## Next Steps
- [Installation Instructions](../docs/installation/)
- [How to use OpooPress snapshots](../faqs/how-to-use-opoopress-snapshots/)

[mc]: http://search.maven.org/#search%7Cga%7C1%7Corg.opoo.press "OpooPress from Maven Central"
[oss]: https://oss.sonatype.org/index.html#nexus-search;quick~org.opoo.press "OpooPress snapshots from Sonatype OSS snapshots repository"
[oss103]: https://oss.sonatype.org/content/repositories/snapshots/org/opoo/press/maven/plugins/opoopress-maven-plugin/1.0.3-SNAPSHOT/ "OpooPress 1.0.3-SNAPSHOT from Sonatype OSS snapshots repository"
