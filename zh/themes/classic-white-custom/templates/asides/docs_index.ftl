<section>
	<ul>
        <li><a href="${root_url}/docs/">OpooPress 2.0</a></li>
		<li><a href="${root_url}/docs/1.x/">OpooPress 1.x</a></li>
	</ul>
</section>

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