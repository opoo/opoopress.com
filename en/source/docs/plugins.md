---
layout: doc
title: Plugins
url: /docs/plugins/
index: 140
group: "CUSTOMIZATION"
---

Plugin interface:
~~~java
public interface Plugin{	
	/**
	 * 
	 * @param registry
	 */
	void initialize(Registry registry);
}
~~~

Registry interface:
~~~java
public interface Registry {
	
	Site getSite();
	
	void registerConverter(Converter c);
	
	void registerGenerator(Generator g);
	
	void registerSiteFilter(SiteFilter filter);
	
	void registerTemplateModel(String name, TemplateModel model);

	void registerTemplateLoader(TemplateLoader loader);
}
~~~

可见，要自定义插件，主要就是实现 `Plugin` 接口 的 `initialize()` 方法。在该方法中，开发者可以调用 `Registry` 对象注册自定义的组件。这些自定义的组件包括：Converter、Generator、SiteFilter、TemplateModel、TemplateLoader 等。

### Converter
For converter.

主要用来转化博客或者网站的源文件。OpooPress 默认支持 `Markdown` 和 `Textile` 格式，分别由 `org.opoo.press.converter.TxtmarkMarkdownConverter` 和 `org.opoo.press.converter.TextilejConverter` 进行处理。

开发者可自定义 Converter 来替换现有的转化器，或者支持新格式。例如可以开发 `WikiConverter` 用于支持 `*.wiki` 文件的处理。

该接口的定义详见源文件 [Converter.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/Converter.java)。示例可参考 [TxtmarkMarkdownConverter.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/converter/TxtmarkMarkdownConverter.java)。

### Generator
Site generator.

主要用于生成特定的输出页面，如 博客首页分页页面、标签页面、分类目录页面等。

开发者可以自定义 Generator 来生成所需的页面，例如生成站点地图文件 `sitemap.xml` 和 `sitemaps.html`。

该接口的定义详见源文件 [Generator.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/Generator.java)，示例可参考 [CategoryGenerator.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/generator/CategoryGenerator.java)。

### SiteFilter
Site filter(site processor).

用于在站点（site）生成引擎运行的各个阶段中插入自己的处理代码，这些可插入代码的点为 `setup`, `read`, `generate`, `reader`, `write`。

该接口的定义详见源文件 [SiteFilter.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/SiteFilter.java)，可查看 [SiteImpl 类源文件](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/impl/SiteImpl.java)了解 SiteFilter 是如何以及何时被调用的。


### TemplateModel
Custom FreeMarker template model.

开发者可以通过这个机制自定义 FreeMarker 标签并注册，就可以在文章或者页面中调用这些标签。请阅读 [FreeMarker](http://freemarker.org/) 文档了解详情。

TemplateModel 还可以用来自定义函数，同样注册后可在页面中调用。例如 [TitleCaseModel](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/template/TitleCaseModel.java)。

### TemplateLoader

Custome FreeMarker TemplateLoader。


## DefaultPlugin

The [DefaultPlugin](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/plugin/DefaultPlugin.java) register all converters, site filters, generators defined in `config.yml`.
~~~
# ------------------------ #
# Default PlugIn Settings  #
# ------------------------ #
converters:
  - org.opoo.press.converter.TxtmarkMarkdownConverter
  - org.opoo.press.converter.TextilejConverter

generators:
  - org.opoo.press.generator.PaginationGenerator
  - org.opoo.press.generator.CategoryGenerator
  - org.opoo.press.generator.TagGenerator
  
# siteFilters:
#  - org.opoo.press.filter.FixUrlSiteFilter
~~~
