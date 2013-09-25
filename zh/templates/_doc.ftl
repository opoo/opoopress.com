<#macro docLayout>

<#include "_default.ftl">
<@defaultLayout>
<div>
<article role="article" class="doc-article">
  <#if (page.title)??>
  <header>
    <h1 class="entry-title">${titlecase(page.title)}</h1>
    <#if (page.date)??><p class="meta"><#include "post/date.ftl">${ time }</p></#if>
  </header>
  </#if>
  <#nested>
  
  <footer>
      <p class="meta">
	<#if (page.date)??><span class="byline"><#include "post/date.ftl"><#if was_updated??>${updated}<#else>${time}</#if></span></#if>
	<#if (page.path)??><span class="categories"><a href="${site.source_base_path}${page.path}" target="_blank">${site.source_link}</a></span></#if>
	
	<#if (site.twitter_tweet_button)!false == true><a href="http://twitter.com/share" class="twitter-share-button" data-url="${ site.url }${ page.url }" data-via="${ site.twitter_user }" data-counturl="${ site.url }${ page.url }" >Tweet</a></#if>
	<#if (site.google_plus_one)!false == true><span class="g-plusone" data-size="${ site.google_plus_one_size }"></span></#if>
     </p>
      
      <div class="pager">
	<#if page.prev_doc??><a class="basic-alignment left" href="${root_url}${page.prev_doc.url}">&laquo; ${page.prev_doc.title}</a></#if>
	<#if page.next_doc??><a class="basic-alignment right" href="${root_url}${ page.next_doc.url }">${page.next_doc.title} &raquo;</a></#if>
      </div>
  </footer>

</article>
<#include "post/comments.ftl">
</div>
<aside class="sidebar">
<#include "asides/docs_index.ftl">
</aside>
</@defaultLayout>
</#macro>