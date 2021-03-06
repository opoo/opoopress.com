---
layout: page
comments: false
---
OpooPress Blogging Framework is a java based static blog generator, it's also a static site generator. Here are some main features:

- **Simple** - No more databases, no more runtime language (such as php, java), a web server is sufficient
- **Fast** - A very fast generate engine by Java, [generate **1k** posts in several seconds](http://opoo.org/why-i-develop-opoopress/), how about [**10k** posts](http://opoo.org/2014/opoopress-site-generated-in-multi-thread/)?
- **Static** - Markdown/Textile, FreeMarker, HTML & CSS & Images go in, completely static sites come out ready for deployment to anywhere
- **Blog-aware** - Permalinks, tree categories, tags, pages, posts, archives, RSS feed.

OpooPress also have these features:
- A semantic HTML5 template
- A Mobile first responsive layout (rotate, or resize your browser and see)
- Built in 3rd party support for Twitter, Google Plus One, Disqus Comments, Pinboard, Delicious, and Google Analytics
- Easy theming with Compass and Sass

(Note: *description above comes from Octopress, OpooPress have the same features actually*)
- Supports many deployment methods (by [Apache Maven Wagon](http://maven.apache.org/wagon/))
- Supports code syntax highlighting (by [Syntax Highlighter Compress](http://alexgorbatchev.com/SyntaxHighlighter/))
- Supports Locale (Currently only `en_US` and `zh_CN`, default use the locale of JVM)
- Supports Plugin, easy to customize or secondary develop
- Customisable templates ([FreeMarker](http://www.freemarker.org/))
- Supports custom meta data that is exposed to templates, pages or posts

## Post Format
- HTML - (\*.html)
- [Markdown](http://daringfireball.net/projects/markdown/) by [Txtmark](https://github.com/rjeschke/txtmark) - (\*.md, \*.markdown)
- [Textile](http://textile.sitemonks.com/) by [Textile-j](https://java.net/projects/textile-j) (also see [Mylyn WikiText](http://wiki.eclipse.org/Mylyn/Incubator/WikiText)) - (\*.textile)
- [WikiText](http://wiki.eclipse.org/Mylyn/WikiText) - (\*.textile, \*.tracwiki, \*.mediawiki, \*.twiki, \*.confluence)

## Migration
- Octopress
- WordPress

## Deployment
- File
- HTTP
- FTP
- SSH/SCP
- WebDAV
- [Github Pages](/en/docs/github-pages/)

# Getting Started

Stable releases are available from [Maven Central](http://search.maven.org/#search%7Cga%7C1%7Corg.opoo.press), and snapshot builds are available from the [Sonatype OSS snapshots repository](https://oss.sonatype.org/index.html#nexus-search;quick~org.opoo.press). Click the button below to know how to use them. 

<a class="download-button" href="/en/download/">Download and Install OpooPress</a>

## Source Code
You can access the source code at: [https://github.com/opoo/opoopress](https://github.com/opoo/opoopress)

## Demo Sites
- [OpooPress.com](http://www.opoopress.com/)
- [Opoo.org](http://opoo.org/)

## Feedback / Contact
If you want to see new features in OpooPress, don't hesitate to offer suggestions, clone the repository on GitHub. If you find errors you can [post issues](https://github.com/opoo/opoopress/issues) or send me a pull request.

Send a message to `opoo#users.sf.net` with any requests/feedback!

## Donations

<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top" id="donations">
<input type="hidden" name="cmd" value="_donations">
<input type="hidden" name="business" value="donations@opoopress.com">
<!-- <input type="hidden" name="lc" value="CN"> -->
<input type="hidden" name="item_name" value="Donate to OpooPress">
<input type="hidden" name="no_note" value="0">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="bn" value="PP-DonationsBF:btn_donate_SM.gif:NonHostedGuest">
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif" border="0" name="submit" alt="PayPal — The safer, easier way to pay online.">
<!-- <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1"> -->
</form>
