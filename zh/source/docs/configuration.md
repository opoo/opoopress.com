---
layout: doc
title: 基本配置
url: /docs/configuration/
index: 50
group: "安装配置"
---

## 一、config.yml

OpooPress 允许用户深度定制自己的博客/网站，主配置文件为 `config.yml`, 格式为 `YAML`，位于站点的根目录。

在初始化站点时，根据 `locale` 的不同，可能会生成不同语言的 `config.yml`，目前仅`简体中文`和`英文`两种。

该文件有详细的注释，具体描述了每个配置项的大致含义，可具体阅读那些注释。

## 二、config.rb

这是站点的`主题样式`所使用的配置文件。

由于 OpooPress 使用 [Compass](http://compass-style.org/)/[SASS](http://sass-lang.com/) 作为主题样式，所以其配置文件名为 `config.rb`，同样该配置文件位于站点根目录。

通常，这个配置文件在多站点下才需要修改。

在安装有 Ruby 的环境中，可以在 `config.rb` 所在目录运行 `compass compile` 来编译生成主题 `CSS`。

OpooPress 运行时并不依赖于 Ruby 环境，可在纯 Java 环境下编译 `SASS/SCSS`，只需要在站点 `pom.xml` 所在目录运行 `mvn op:sass-compile` 即可。OpooPress 在底层使用 `JRuby` 引擎，所以 `config.rb` 配置文件同样有效。

