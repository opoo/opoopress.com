---
layout: doc
title: Configuration
url: /docs/configuration/
index: 50
group: "GETTING STARTED"
---

## config.yml

OpooPress allows you to customize your blog in any way you want. The main configuration file is `config.yml` placed in your site's root directory.

The language in file `config.yml` may be different according to `locale` option sepecified in your installation.

This configuration file has many comments, just read them to understand how to customize your blog.

## config.rb



The theme of OpooPress designed by [Compass](http://compass-style.org/)/[SASS](http://sass-lang.com/), so the `theme` configuration file is `config.rb` placed in your site's root directory.

Normally, you do not need to modify this file.

You can run `compass compile` to compile OpooPress theme css if you have installed `Ruby` in your machine. Actually `Ruby` ​​is not required. OpooPress using `JRuby` to compile `SASS/SCSS`, just run `mvn op:sass-compile`.
