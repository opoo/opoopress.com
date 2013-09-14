<fieldset class="mobile-nav">
  <select onchange="if (this.value) { window.location.href = this.value;}">
    <option value=""><@i18n.msg "Navigate"/>&hellip;</option>
<#list site.navs?keys as navLabel>
    <#assign navUrl = site.navs[navLabel]>
    <#if navUrl == '/en/docs/' && (site.docs)??>
	<#assign group="NONE">
	<#list site.docs as doc>
	<#if (doc.group)?? && doc.group != group>
	<#if group != "NONE"></optgroup></#if>
    <optgroup label="${doc.group}">
	<#assign group = doc.group>
	</#if>
	<option value="${root_url}${doc.url}"<#if (page.url) == doc.url> selected="selected"</#if>>&raquo; ${doc.title}</option>
	</#list>
    </optgroup>
    <#else>
    <option value="${navUrl}"<#if (root_url + page.url) == navUrl> selected="selected"</#if>>&raquo; ${navLabel}</option>
    </#if>
 </#list>
  </select>
</fieldset>

<ul class="main-navigation">
<#list site.navs?keys as navLabel>
<li><a href="${site.navs[navLabel]}">${navLabel}</a></li>
</#list>
</ul>
