<#if site.docs??>
<section class="menu">

<#assign group="NONE">
<#list site.docs as doc>
<#if (doc.group)?? && doc.group != group>
<#if group != "NONE"></ul></#if>
<h1>${doc.group}</h1>
<ul>
<#assign group = doc.group>
</#if>
	<li<#if doc == page> class="current"</#if>><a href="${root_url}${doc.url}">${doc.title}</a></li>
</#list>
</ul>

</section>
</#if>
<#include "about.ftl">