<#if page.no_english_version??><#assign english_version_url = "/en/"><#else><#assign english_version_url = "/en" + page.url></#if>
<div class="lang">中文 | <a href="${english_version_url}" title="Jump to English">ENGLISH</a></div>
<div class="logo"><img src="//www.opoopress.com/logo.png" alt="OpooPress"></div>
<hgroup>
  <h1><a href="${ root_url }/">${ site.title }</a></h1>
  <#if site.subtitle??>
    <h2>${ site.subtitle }</h2>
  </#if>
</hgroup>