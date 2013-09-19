---
layout: page
title: Download OpooPress
comments: true
date: 2013-07-07 11:20
updated: 2013-09-19 11:20
sidebar: false
footer: true
---

OpooPress static blog generator has been released as a maven plugin. This java tool is based on maven command line. 
- Stable releases are available from [Maven Central](http://search.maven.org/#search%7Cga%7C1%7Corg.opoo.press)
- Snapshot builds are available from [Sonatype OSS snapshots repository](https://oss.sonatype.org/index.html#nexus-search;quick~org.opoo.press)

Follow [Installation Instructions](../docs/installation/) to know how to install Java and Maven, and to know how to use OpooPress plugin to initialize, generate and deploy your blog or website.


OpooPress is an open-source software, of course you can download the source codes from <https://github.com/opoo/opoopress> if you intend to build OpooPress yourself. Just download(git clone) the sources and run `mvn install` to install OpooPress packages to your local maven repository.


## Current Versions

Current stable version : **1.0.1**
- Binary : [Maven Central](http://search.maven.org/#search%7Cga%7C1%7Corg.opoo.press)
- Source : [tag: version-1.0.1](https://github.com/opoo/opoopress/tree/version-1.0.1)

Current snapshot version: **1.0.2-SNAPSHOT**
- Binary : [Sonatype OSS snapshots repository](https://oss.sonatype.org/content/repositories/snapshots/org/opoo/press/maven/plugins/opoopress-maven-plugin/1.0.2-SNAPSHOT/)
- Source : [branch: master](https://github.com/opoo/opoopress)


## Releases History
* 2013-09-05 - 1.0.1 
* 2013-08-07 - 1.0.0


## Release Notes

### OpooPress 1.0.2 (not release yet, since 1.0.1)

- Bug
	- Fixed bug in StaleUtils: cannot check new file in `sass` subdirectory correctly
- Improvement
	- Changed logging framwork from Apache Commons Logging to Simple Logging Facade for Java (SLF4J)
	- Moved classes from plugin to a new module opoopress-wagon-github(a custom wagon), this wagon could make you deploy your OpooPress blog to GitHub Pages. It uses GitHub Java API (org.eclipse.egit.github.core, a pure java GitHub client) as lower level layer.
- New Feature
	- Added new custom wagon - opoopress-wagon-git, this wagon could make you deploy your OpooPress blog to GitHub Pages or any other git repositories. It uses Git Executable Command Line as lower level layer(a git command line client is required).

### OpooPress 1.0.1 (since 1.0.0)
- Bug
	- Fixed bug in StaleUtils: cannot check new file in `assets` directory correctly
- Change
	- Changed permalink style
	- Changed new post file storage path
	- Changed new page file storage path

### OpooPress 1.0.0
- This is the first release of OpooPress. See [this article](../article/opoopress-1.0.0-has-been-released/) for details.


## Next Steps
- [Installation Instructions](../docs/installation/)
