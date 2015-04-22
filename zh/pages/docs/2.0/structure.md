---
layout: doc
title: 目录结构
url: /docs/structure/
---

 默认（推荐）的目录结构如下

	(.)
	 |
	 +- site 第一个站点(博客)，默认站点
	 |   |
	 |   +- config.yml (站点的配置文件)
	 |   |
	 |   +- config.rb (主题样式配置文件)
	 |   |
	 |   +- source (所有带有 YAML front-matter 头的源文件及静态文件)
	 |   |
	 |   +- templates (所有 FreeMarker 模板，也可放在 source/_templates 目录下)
	 |   |
	 |   +- assets (静态资源，也可以直接放在 source 目录下)
	 |   |
	 |   +- sass (SASS/SCSS 源文件，主题样式源文件)
	 |  
	 +- site2 第二个站点，目录结构同第一个
	 |
	 +- target 目标目录，可安全删除
	     |
	     +- public 静态网站（博客）的输出目录，每个站点一个子目录
	     |    |
	     |    +- site 第一个站点的输出目录
	     |    |
	     |    +- site2 第二个站点的输出目录
	     |
	     +- sass-cache SASS编译时的临时缓存目录
	     |
	     +- work 工作目录
