---
layout: doc
title: Directory Structure
url: /docs/structure/
index: 40
group: "GETTING STARTED"
---

The default (recommanded) directory structure:
	(.)
	 |
	 +- site (the default site/blog directory)
	 |   |
	 |   +- config.yml (The site configuration file)
	 |   |
	 |   +- source (All YAML front-matter header files and some static files)
	 |   |
	 |   +- templates (FreeMarker template ONLY)
	 |   |
	 |   +- assets (All static files ONLY)
	 |  
	 +- (site2) another site
	 |
	 +- target
	     |
	     +- public
	     |    |
	     |    +- site the output directory for site
	     |    |
	     |    +- (site2) the output directory for site2
	     |
	     +- sass-cache
	     |
	     +- work
