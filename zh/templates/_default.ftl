<#macro defaultLayout><#include "head.ftl">
<body<#if page.body_id??> id="${page.body_id}</#if><#if page.sidebar?? && (page.sidebar?string == "false")> class="no-sidebar"</#if><#if ( (page.sidebar)?? && (page.sidebar?string == "collapse")) || ( (site.sidebar)?? && (site.sidebar?string == "collapse"))> class="collapse-sidebar sidebar-footer"</#if>>
  <!--[if lt IE 9]><script src="${ root_url }/javascripts/unsupported-browser.js"></script><![endif]-->
  <header role="banner"><span class="lang"><a href="/zh/" title="转到中文">中文</a> | <a href="/en/" title="Jump to English">ENGLISH</a></span>
  <#include "header.ftl"></header>
  <nav role="navigation"><#include "navigation.ftl"></nav>
  <div id="main">
    <div id="content">
      <#nested>
    </div>
  </div>
  <footer role="contentinfo"><#include "footer.ftl"></footer>
  <#include "after_footer.ftl">
</body>
</html>
</#macro>
