<#macro pageLayout>

<#include "_default.ftl">
<@defaultLayout>
<div>
<article role="article">
  <#if (page.title)??>
  <header>
    <h1 class="entry-title">${titlecase(page.title)}</h1>
    <#if (page.date)??><p class="meta"><#include "post/date.ftl">${ time }</p></#if>
  </header>
  </#if>
  <#nested>
  <#if (page.footer)!true == true>
<footer>
      <p class="meta">
	<#if (page.date)??><span class="byline"><#include "post/date.ftl"><#if was_updated??>${updated}<#else>${time}</#if></span></#if>
	<#if (page.path)??><span class="categories"><a href="${site.source_base_path}${page.path}" target="_blank">${site.source_link}</a></span></#if>
      </p>
      <#if (page.sharing)!true == true><#include "post/sharing.ftl"></#if>
    </footer>
 </#if>
</article>
<#include "post/comments.ftl">
</div>
<#if !(page.sidebar)?? || ((page.sidebar)?string != "false")>
<aside class="sidebar">
	<#include "asides/page_asides.ftl">
</aside>
</#if>
</@defaultLayout>
</#macro>