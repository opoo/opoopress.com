<!DOCTYPE html>
<!--[if IEMobile 7 ]><html class="no-js iem7"><![endif]-->
<!--[if lt IE 9]><html class="no-js lte-ie8"><![endif]-->
<!--[if (gt IE 8)|(gt IEMobile 7)|!(IEMobile)|!(IE)]><!--><html class="no-js" lang="<#if (site.locale)??>${site.locale.language}<#else>en</#if>"><!--<![endif]-->
<head>
  <meta charset="utf-8">
  <title><#if (page.title)??>${page.title} - </#if>${site.title} - 基于 Java 的静态博客生成器</title>
  <meta name="author" content="${site.author}">
  <#-- maybe content?substring(0,150) -->
  <#if site.description?? && page.url == '/'><meta name="description" content="${site.description}"><#elseif page.description??><meta name="description" content="${page.description}"></#if>
  <#-- meta keywords is deprecated -->
  <#--if page.keywords??><meta name="keywords" content="${ page.keywords }"></#if-->
  <meta name="HandheldFriendly" content="True">
  <meta name="MobileOptimized" content="320">
  <meta name="OpooPressSiteRoot" content="${ root_url }">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="Generator" content="OpooPress-${opoopress.version}"/>
  <meta name="Generated" content="${site.time?datetime?iso_local}"/>
  <link rel="canonical" href="${root_url}${page.url}">
  <#if (paginator.next)??><link href="${root_url}${paginator.next.url}" rel="next" /></#if>
  <#if (paginator.previous)??><link href="${root_url}${paginator.previous.url}" rel="prev" /></#if>
  <link href="//www.opoopress.com/favicon.ico" rel="icon">
  <link href="${ site.subscribe_rss }" rel="alternate" title="${site.title}" type="application/atom+xml">
  <link href="${ site.theme_root }/stylesheets/screen.css" media="screen, projection" rel="stylesheet" type="text/css">
  <#include "custom/head.ftl">
  <style>a{ text-decoration: none; }</style>
  <!--[if lt IE 9]><script src="${site.default_theme_root}/javascripts/html5shiv.js"></script><![endif]-->
</head>
