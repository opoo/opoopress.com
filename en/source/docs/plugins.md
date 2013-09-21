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

To develop a custom OpooPress plugin, we need write a `Plugin` class and register our custom `plugin components` in it. There are 5 plugin components: Converter, Generator, SiteFilter, TemplateModel, TemplateLoader.

### Converter
Source file format converter.

OpooPress supports `Markdown` (`org.opoo.press.converter.TxtmarkMarkdownConverter`) and `Textile` (`org.opoo.press.converter.TextilejConverter`).

You can write a Converter to processing particular format, such as writing `WikiConverter` to processing file `*.wiki`.

The source of the interface is [Converter.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/Converter.java). Also see [TxtmarkMarkdownConverter.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/converter/TxtmarkMarkdownConverter.java).

### Generator
Site generator. 

Using to generate output pages, such as blog index page, tag pages, category pages.

The source of interface is [Generator.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/Generator.java). Also see [CategoryGenerator.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/generator/CategoryGenerator.java).

### SiteFilter
Site filter(site processor).

Can hook your own processes in site generating. The hool points are `setup`, `read`, `generate`, `reader`, `write`.

The source of interface is [SiteFilter.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/SiteFilter.java). See [SiteImpl.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/impl/SiteImpl.java) to know how SiteFilter work.

### TemplateModel
Custom FreeMarker template model.

Can develop custom FreeMarker tags and functions using this mechanism. Check [FreeMarker](http://freemarker.org/) documentation.

E.g. [TitleCaseModel.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/template/TitleCaseModel.java).

### TemplateLoader

Custom FreeMarker TemplateLoader。


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
