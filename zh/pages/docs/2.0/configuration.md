---
layout: doc
title: 基本配置
url: /docs/configuration/
---

## 一、config.yml

OpooPress 允许用户深度定制自己的博客/网站，主配置文件为 `config.yml`, 格式为 `YAML`，位于站点的根目录。

在初始化站点时，根据 `locale` 的不同，可能会生成不同语言的 `config.yml`，目前仅`简体中文`和`英文`两种。

该文件有详细的注释，具体描述了每个配置项的大致含义，可具体阅读那些注释。

## 二、config*

其它用户自定义的配置文件，在站点根目录下以 `config` 开头，后缀为 `.yml`, `.yaml`, `.json` 的文件，都会当作配置文件，自动加载并解析。即配置文件可以分拆在多个文件中，并且可以使用 YAML 和 JSON 两种格式。

例如
- config-doc.yml
- config-collections.yml
- config-data1.json


推荐使用 YAML 格式的配置文件，JSON 格式解析速度较慢。
