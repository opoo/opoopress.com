---
layout: doc
title: OpooPress 1.x
url: /docs/1.x/
comments: false
---
OpooPress 博客系统是一个基于 Java 的静态博客生成器，同时也是一个静态网站生成器。主要特性如下：

- **简单** - 无需数据库，无需动态语言运行环境(例如 PHP, Java 等)
- **快速** - 高效的生成引擎，由 Java 开发(查看[1,000 篇](http://opoo.org/why-i-develop-opoopress/)和[10,000篇](http://opoo.org/2014/opoopress-site-generated-in-multi-thread/)文章的生成速度)
- **静态化** - Markdown、FreeMarker、HTML & CSS & Images 通过 OpooPress 引擎即可生成完全静态化的网站，可方便地发布到任何地方
- **博客特性** - 支持固定链接、树形分类目录、标签、页面、文章、归档、RSS等博客特性

OpooPress 还包含以下一些特性：

- 符合 HTML5 规范的模板
- 移动设备优先的响应式布局 (旋转或调整浏览器大小，将会看到效果)
- 内置第三方支持：Twitter, Google Plus One, Disqus 评论, 多说, Pinboard, Delicious, 以及 Google 分析
- 可轻松自定义主题 (通过 [Compass](http://compass-style.org/) 和 [Sass](http://sass-lang.com/) 实现)
- 支持多种发布方式 (通过 [Apache Maven Wagon](http://maven.apache.org/wagon/) 实现)
- 支持代码块语法高亮 (通过 [Syntax Highlighter Compress](http://alexgorbatchev.com/SyntaxHighlighter/) 实现)
- 支持本地化 (Locale, 当前仅支持 `zh_CN` 和 `en_US`，默认取 JVM 的 Locale 值)
- 支持插件机制，方便二次开发和功能定制
- 支持自定义模板 ([FreeMarker](http://www.freemarker.org/))
- 支持自定义文件头信息 (mata data)，并可在模板、文章、页面中引用
- 网站/博客源文件可被版本管理 (CVS, SVN, Git 或者 Dropbox)


### 支持的文章格式
- HTML - (\*.html)
- [Markdown](http://daringfireball.net/projects/markdown/) by [Txtmark](https://github.com/rjeschke/txtmark) - (\*.md, \*.markdown)
- [Textile](http://textile.sitemonks.com/) by [Textile-j](https://java.net/projects/textile-j) (另见 [Mylyn WikiText](http://wiki.eclipse.org/Mylyn/Incubator/WikiText)) - (\*.textile)
- [WikiText](http://wiki.eclipse.org/Mylyn/WikiText) - (\*.textile, \*.tracwiki, \*.mediawiki, \*.twiki, \*.confluence)

### 支持从以下博客系统迁移数据
- Octopress
- WordPress

### 发布方式
- File
- HTTP
- FTP
- SSH/SCP
- WebDAV
- [Github Pages](http://www.opoopress.com/zh/docs/github-pages/)

## 如何开始

OpooPress 正式版已经发布，[这篇文章](http://opoo.org/opoopress-1.0.0-has-been-released/)介绍了简单的用法。

OpooPress 正式发行包可在 [Maven Central](http://search.maven.org/#search%7Cga%7C1%7Corg.opoo.press) 库获取，最新开发包 SNAPSHOT 版本可在 [Sonatype OSS snapshots repository](https://oss.sonatype.org/index.html#nexus-search;quick~org.opoo.press) 库获取，详细用法请点击下面的按钮。

<a class="download-button" href="/zh/download/">OpooPress 下载及安装</a>

### 源代码
OpooPress 的源代码在：[https://github.com/opoo/opoopress](https://github.com/opoo/opoopress)

### 示例站点
- [OpooPress.com](http://www.opoopress.com/)
- [Opoo.org](http://opoo.org/)

### 反馈与建议
如果在使用过程中发现问题，可以在这里[报告问题](https://github.com/opoo/opoopress/issues)。

如果您有改进代码需要提交，可以在 GitHub 代码库中向我发送一个 pull request。

有任何建议或意见，也欢迎您通过 Email 联系我：`opoo#users.sf.net`，也可在相应页面下留言，或者加入 QQ 群（300200574），谢谢。

<a target="_blank" href="http://wp.qq.com/wpa/qunwpa?idkey=b6e7956637297e1fbdea8d93c35780cf4db2319a362a4633855e769d1386400d"><img border="0" src="//www.opoopress.com/group.png" alt="OpooPress" title="OpooPress"></a>

<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top" id="donations">
<input type="hidden" name="cmd" value="_donations">
<input type="hidden" name="business" value="donations@opoopress.com">
<!-- <input type="hidden" name="lc" value="CN"> -->
<input type="hidden" name="item_name" value="Donate to OpooPress">
<input type="hidden" name="no_note" value="0">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="bn" value="PP-DonationsBF:btn_donate_SM.gif:NonHostedGuest">
<input type="image" src="https://www.paypalobjects.com/zh_XC/i/btn/btn_donate_SM.gif" border="0" name="submit" alt="PayPal——最安全便捷的在线支付方式！">
<!-- <img alt="" border="0" src="https://www.paypalobjects.com/zh_XC/i/scr/pixel.gif" width="1" height="1"> -->
</form>