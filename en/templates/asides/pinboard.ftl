<#if site.pinboard_user??>
<section>
  <h1>My Pinboard</h1>
  <ul id="pinboard_linkroll">Fetching linkroll...</ul>
  <p><a href="http://pinboard.in/u:${ site.pinboard_user }">My Pinboard Bookmarks &raquo;</a></p>
</section>
<script type="text/javascript">
  var linkroll = 'pinboard_linkroll'; //id target for pinboard list
  var pinboard_user = "${ site.pinboard_user }"; //id target for pinboard list
  var pinboard_count = ${ site.pinboard_count }; //id target for pinboard list
  (function(){
    var pinboardInit = document.createElement('script');
    pinboardInit.type = 'text/javascript';
    pinboardInit.async = true;
    pinboardInit.src = '${ root_url }/javascripts/pinboard.js';
    document.getElementsByTagName('head')[0].appendChild(pinboardInit);
  })();
</script>
</#if>