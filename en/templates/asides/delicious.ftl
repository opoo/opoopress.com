<#if site.delicious_user?? >
<section>
  <h1>On Delicious</h1>
  <div id="delicious"></div>
  <script type="text/javascript" src="http://feeds.delicious.com/v2/json/${ site.delicious_user }?count=${ site.delicious_count }&amp;sort=date&amp;callback=renderDeliciousLinks"></script>
  <p><a href="http://delicious.com/${ site.delicious_user }">My Delicious Bookmarks &raquo;</a></p>
</section>
</#if>