---
layout: doc
title: Plugins
url: /docs/plugins/
index: 140
group: "SECONDARY DEV."
---

通过插件机制可以很容易的扩展 OpooPress 博客系统的功能。 Plugin 定义如下

~~~java
public interface Plugin{	
	/**
	 * 
	 * @param registry
	 */
	void initialize(Registry registry);
}
~~~

`Registry` 接口定义如下：
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
格式转化器。

主要用来转化博客或者网站的源文件。OpooPress 默认支持 `Markdown` 和 `Textile` 格式，分别由 `org.opoo.press.converter.TxtmarkMarkdownConverter` 和 `org.opoo.press.converter.TextilejConverter` 进行处理。

开发者可自定义 Converter 来替换现有的转化器，或者支持新格式。例如可以开发 `WikiConverter` 用于支持 `*.wiki` 文件的处理。

该接口的定义详见源文件 [Converter.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/Converter.java)。示例可参考 [TxtmarkMarkdownConverter.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/converter/TxtmarkMarkdownConverter.java)。

### Generator
页面生成器。

主要用于生成特定的输出页面，如 博客首页分页页面、标签页面、分类目录页面等。

开发者可以自定义 Generator 来生成所需的页面，例如生成站点地图文件 `sitemap.xml` 和 `sitemaps.html`。

该接口的定义详见源文件 [Generator.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/Generator.java)，示例可参考 [CategoryGenerator.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/generator/CategoryGenerator.java)。

### SiteFilter
站点过滤器（处理器）。

用于在站点（site）生成引擎运行的各个阶段中插入自己的处理代码，这些可插入代码的点为 `setup`, `read`, `generate`, `reader`, `write`。

该接口的定义详见源文件 [SiteFilter.java](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/SiteFilter.java)，可查看 [SiteImpl 类源文件](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/impl/SiteImpl.java)了解 SiteFilter 是如何以及何时被调用的。


### TemplateModel
自定 FreeMarker 模板模型。

开发者可以通过这个机制自定义 FreeMarker 标签并注册，就可以在文章或者页面中调用这些标签。请阅读 [FreeMarker](http://freemarker.org/) 文档了解详情。

TemplateModel 还可以用来自定义函数，同样注册后可在页面中调用。例如 [TitleCaseModel](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/template/TitleCaseModel.java)。

### TemplateLoader

FreeMarker TemplateLoader，用于指定注册自定义的 FreeMarker 模板加载器。


## DefaultPlugin
目前 OpooPress 默认的生成引擎也是通过插件机制实现的，默认插件为 [DefaultPlugin](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/plugin/DefaultPlugin.java)，该插件会自动查找站点配置文件 `config.yml` 中定义的 Converter、Generator、SiteFilter 类名，实例化这些类并自动注册。

`config.yml` 关于 `DefaultPlugin` 的配置如下：
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

如果开发者不打算定义一个完整的 `Plugin`，仅仅开发 Converter 或者 Generator，可以在这里进行配置，而不必配置整个插件。

