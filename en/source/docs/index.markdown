---
layout: page
title: OpooPress Documentation
url: /docs/
index: 1
group: "GETTING STARTED"
sidebar: false
footer: true
comments: false
date: 2013-08-08 18:00
---

This documentation may help you start OpooPress blog quickly.


<#assign group="NONE">
<#list site.docs as doc>
<#if (doc.group)?? && doc.group != group>
<#if group != "NONE"></ul></#if>
<h2>${doc.group}</h2>
<ul>
<#assign group = doc.group>
</#if>
	<li<#if doc == page> class="current"</#if>><a href="${root_url}${doc.url}">${doc.title}</a></li>
</#list>
</ul>
