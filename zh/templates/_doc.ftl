<#macro docLayout>

<#include "_default.ftl">
<@defaultLayout>
<div>
<article role="article" class="doc-article">
  <#if (page.title)??>
  <header>
    <h1 class="entry-title">${titlecase(page.title)}</h1>
    <!-- <#if (page.date)??><p class="meta"><#include "post/date.ftl">${ time }</p></#if> -->
  </header>
  </#if>
  <#nested>
  
   <p class="meta">
      <#if page.prev_doc??>
        <a class="basic-alignment left" href="${root_url}${page.prev_doc.url}">&laquo; ${page.prev_doc.title}</a>
      </#if>
       <#if page.next_doc??>
        <a class="basic-alignment right" href="${root_url}${ page.next_doc.url }">${page.next_doc.title} &raquo;</a>
      </#if>
    </p>
    
  <div class="clear"></div>
</article>
<#include "post/comments.ftl">
</div>
<aside class="sidebar">
<#include "asides/docs_index.ftl">
</aside>
</@defaultLayout>
</#macro>