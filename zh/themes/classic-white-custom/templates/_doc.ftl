<#macro docLayout>

<#include "_default.ftl">
<@defaultLayout>
<div>
<article role="article" class="doc-article">
  <#if (page.title)??>
  <header>
    <h1 class="entry-title">${titlecase(page.title)}</h1>
    <p class="meta2" style="float:right;">
        <#if (page.version.version)??>适用版本:${page.version.version}</#if>
    </p>
  </header>
  </#if>
  <#nested>
  
  <footer>
      <p class="meta">
	<#if (page.date)??><span class="byline"><#include "post/date.ftl"><#if was_updated??>${updated}<#else>${time}</#if></span></#if>
	<#if (page.path)??><@i18n.source page.path></@i18n.source></#if>
     </p>

      <#if (page.sharing)!true == true><#include "post/sharing.ftl"></#if>
      
      <p class="meta">
	<#if page.prev_doc??><a class="basic-alignment left" href="${root_url}${page.prev_doc.url}">&laquo; ${page.prev_doc.title}</a></#if>
	<#if page.next_doc??><a class="basic-alignment right" href="${root_url}${ page.next_doc.url }">${page.next_doc.title} &raquo;</a></#if>
      </p>
  </footer>

</article>
<#include "post/comments.ftl">
</div>
<aside class="sidebar">
<#include "asides/docs_index.ftl">
</aside>
</@defaultLayout>
</#macro>