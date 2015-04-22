<#if (page.version.items)??>
<section class="menu">

<#list page.version.items as item>
    <h1>${item.title}</h1>
	<ul>
		<#list item.pages as doc>
            <li<#if doc == page> class="current"</#if>><a href="${root_url}${doc.url}">${doc.title}</a></li>
		</#list>
	</ul>
</#list>
</section>
</#if>

<#include "about.ftl">