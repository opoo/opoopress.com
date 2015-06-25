<#macro msg name>${name}</#macro>

<#macro source filepath>
<span class="github-btn">
  <a class="gh-btn" href="${site.source_base_path}/${filepath}" target="_blank" title="View source of this page" rel="nofollow">
    <span class="gh-ico"></span>
    <span class="gh-text">Source</span>
  </a>
</span>
</#macro>
