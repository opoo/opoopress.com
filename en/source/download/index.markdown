---
layout: page
title: Download OpooPress
comments: true
date: 2013-07-07 11:20
sidebar: false
footer: false
---

Now these is a maven plugin for OpooPress. Strongly recommend that you use opoopress-maven-plugin. 

## Maven Plugin

1. Install [Java](http://www.oracle.com/technetwork/java/) 1.6+ and [Maven](http://maven.apache.org/download.cgi#Installation) 2.2.1+ first
2. Install and initialize OpooPress
    - Linux 
        * Flow these commands
	```bash
	[root@vps ~]# mkdir myblog
	[root@vps ~]# cd myblog
	[root@vps myblog]# wget http://www.opoopress.com/downloads/pom.xml
	[root@vps myblog]# mvn op:install op:generate op:preview
	```
        * Browser http://localhost:8080/ to preview
    - Windows
        * Create a directory, such as myblog
        * Download file [pom.xml](http://www.opoopress.com/downloads/pom.xml) and put in the directory
        * Open Windows command console (cmd.exe), cd in this directory
        * Run command `mvn op:install op:generate op:preview`
        * Browser http://localhost:8080/ to preview

Read more in the [OpooPress Documentation](/zh/docs/).

## Standalone Packages

OpooPress Blogging Framework is a java based blog-ware static site generator.

The release candidate 1 of OpooPress (Version 1.0) is available in two formats from the links below. 

<a class="download-button" href="http://www.opoopress.com/downloads/opoopress-1.0-RC1.tar.gz">OpooPress 1.0 RC1 full (28M)</a>

(*Include all functions.*)

<a class="download-button" href="http://www.opoopress.com/downloads/opoopress-lite-1.0-RC1.tar.gz">OpooPress 1.0 RC1 lite (5M)</a>

(*Include a default stylesheet, SASS/Compass compiling function not include.*)

And then, check out the [OpooPress Documentation](/zh/docs/) to get start.
