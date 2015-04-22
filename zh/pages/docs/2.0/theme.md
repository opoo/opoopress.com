---
layout: doc
title: 主题
url: /docs/theme/
comments: true
date: 2015-02-28 11:20
description: "OpooPress 主题安装、切换、发布等。"
keywords: "OpooPress, theme, 主题"
no_english_version: true
---
## 安装主题

### 手动安装
- 下载源码包解压到 `themes/<THEME_NAME>` 目录，`<THEME_NAME>` 是主题的名称。
- 通过 git 克隆主题到 `themes/<THEME_NAME>` 目录，例如 
	```shell
	git clone https://github.com/opoopress/opoopress-theme-default.git themes/default
	```

通过以上任一方式准备好 theme 目录后，修改或者创建 `config-theme.yml` 文件，内容为 `theme: <THEME_NAME>`，例如 `theme: default`。


### 通过命令安装 {#theme-by-command}
#### 1. `mvn op:theme -Dname=<THEME_NAME>`  {#theme-by-command1}

安装或切换到指定名称的主题, 该命令尝试从 Maven 仓库下载主题包，解压到 `themes/<THEME_NAME>` 目录并切换到该主题。

其中 Maven 仓库指 Maven 中心库和 [OpooPress Maven 库][oprepo]，OpooPress Maven 库默认处于启用状态，可通过命令行参数 `-Dop.repos.enabled=false` 禁用该库。

通过 `-DremoteRepositories=<REPOSITORIES>` 可指定其它 Maven 仓库，格式是 `id::[layout]::url` 或者 `url`，多个仓库使用半角逗号分隔，例如 `central::default::http://repo1.maven.apache.org/maven2,myrepo::::http://repo.acme.com,http://repo.opoopress.com`。


要从 Maven 仓库下载的主题包的 Artifact 特性如下
- groupId: `org.opoo.press.themes`，该值是固定的。
- artifactId: `opoopress-theme-<THEME_NAME>`，例如 `opoopress-theme-default`。如果 `THEME_NAME` 本身以 `opoopress-theme-` 开头，则不再加此前缀。
- version: 解析获取最新版本。

示例：

```shell
mvn op:theme -Dname=default
```

#### 2. `mvn op:theme -Dname=<THEME_NAME> -Dversion=<THEME_VERSION>`  {#theme-by-command2}

安装或切换到指定名称、指定版本的主题，该命令尝试从 Maven 仓库下载主题包，解压到 `themes/<THEME_NAME>` 目录并切换到该主题。

其中 Maven 仓库指 Maven 中心库和 [OpooPress Maven 库][oprepo]，OpooPress Maven 库默认处于启用状态，可通过命令行参数 `-Dop.repos.enabled=false` 禁用该库。

通过 `-DremoteRepositories=<REPOSITORIES>` 可指定其它 Maven 仓库，格式是 `id::[layout]::url` 或者 `url`，多个仓库使用半角逗号分隔，例如 `central::default::http://repo1.maven.apache.org/maven2,myrepo::::http://repo.acme.com,http://repo.opoopress.com`。


要从 Maven 仓库下载的主题包的 Artifact 特性如下
- groupId: `org.opoo.press.themes`，该值是固定的。
- artifactId: `opoopress-theme-<THEME_NAME>`，例如 `opoopress-theme-default`。如果 `THEME_NAME` 本身以 `opoopress-theme-` 开头，则不再加此前缀。
- version: `<THEME_VERSION>`

示例：

```shell
mvn op:theme -Dname=default -Dversion=1.2
```


#### 3. `mvn op:theme -Dname=<THEME_NAME> -DgroupId=<THEME_GROUPID> -DartifactId=<THEME_ARTIFACTID> -Dversion=<THEME_VERSION> -Dclassifier= -Dtype=zip` {#theme-by-command3} 

安装或切换到指定名称、指定 Artifact 的主题。

该 Artifact 将从 Maven仓库下载，解压到 `themes/<THEME_NAME>` 目录并切换到该主题。Maven 仓库指 Maven 中心库和 [OpooPress Maven 库][oprepo]，OpooPress Maven 库默认处于启用状态，可通过命令行参数 `-Dop.repos.enabled=false` 禁用该库。

通过 `-DremoteRepositories=<REPOSITORIES>` 可指定其它 Maven 仓库，格式是 `id::[layout]::url` 或者 `url`，多个仓库使用半角逗号分隔，例如 `central::default::http://repo1.maven.apache.org/maven2,myrepo::::http://repo.acme.com,http://repo.opoopress.com`。

`<THEME_NAME>` 为空时，将去掉 `<THEME_ARTIFACTID>` 的 `opoopress-theme-` 当做主题的名称。因此必须指定 `name` 和 `artifactId` 二者之一。

要从 Maven 仓库下载的主题包的 Artifact 特性如下
- groupId: `<THEME_GROUPID>` 为空时，默认值是 `org.opoo.press.themes`。
- artifactId: `<THEME_ARTIFACTID>` 为空时取值 `opoopress-theme-<THEME_NAME>`，例如 `opoopress-theme-default`。如果 `THEME_NAME` 本身以 `opoopress-theme-` 开头，则不再加此前缀。
- version: `<THEME_VERSION>` 为空时解析获取最新版本。
- classifier: 无默认值。
- type: 默认值 `zip`。

示例：

```shell
mvn op:theme -Dname=default -DgroupId=org.opoo.press.themes -DartifactId=opoopress-theme-default -Dversion=1.2 -Dtype=zip
mvn op:theme -Dname=default -DartifactId=opoopress-theme-default -Dversion=1.2
mvn op:theme -DartifactId=opoopress-theme-default -Dversion=1.2
mvn op:theme -DartifactId=opoopress-theme-default
```

#### 4. `mvn op:theme -Dtheme=<THEME>` {#theme-by-command4}
下载并切换到指定主题。其中 `<THEME>` 有两种格式：

1. Maven Artifact 格式： `groupId:artifactId:version[:packaging][:classifier]`
	
	从 Maven 仓库下载主题 artifact，解压并切换到该主题。可通过 `-Dname=<THEME_NAME>` 指定主题的名称。

	用法参考[第三种](#theme-by-command3)。

	示例：

	```shell
	mvn op:theme -Dtheme=org.opoo.press.themes:opoopress-theme-default:1.2
	mvn op:theme -Dtheme=org.opoo.press.themes:opoopress-theme-default:1.2:zip
	mvn op:theme -Dtheme=org.opoo.press.themes:opoopress-theme-default:1.2:opoopress-theme
	mvn op:theme -Dtheme=org.opoo.press.themes:opoopress-theme-default:1.2:zip:freemarker
	mvn op:theme -Dtheme=org.opoo.press.themes:opoopress-theme-default:1.2 -Dname=default
	```

2. URL 格式：`http://host/path/themename.zip` 或者 `https://host/path/themename.zip`

	从指定 url 下载主题包，解压并切换到该主题。可通过 `-Dname=<THEME_NAME>` 指定主题的名称。如果不指定主题名称，将使用文件的文件名（不含后缀）作为主题名称。例如 `http://host/path/themename.zip` 的主题名称是 `themename`。

	示例：

	```shell
	mvn op:theme -Dname=default -Dtheme=http://repo.opoopress.com/snapshots/org/opoo/press/themes/opoopress-theme-default/1.2-SNAPSHOT/opoopress-theme-default-1.2-SNAPSHOT.zip 
	mvn op:theme -Dtheme=https://opoopressthemes.com/downloads/simple-blue.zip
	```





## 切换主题

如果该主题包已经下载，并且存在于站点的 `themes` 目录中，仅仅要切换到该主题，则使用以下命令即可。
```shell
mvn op:theme -Dname=<THEME_NAME>
```
是的，这与安装主题的操作是一样的！


## 发布主题
可通过以下几种方式之一发布主题到互联网。

- 开发者提交主题源码到 github 等公共库；使用者通过类似 `git clone https://github.com/opoopress/opoopress-theme-default.git themes/default` 的方式下载使用
- 开发者发布主题到 Maven 中心库或 [OpooPress Maven 库][oprepo]；使用通过调用命令 `mvn op:theme -Dname=themename` 、`mvn op:theme -Dname=themename -Dversion=1.0` 或 `mvn op:theme -Dtheme=org.opoo.press.themes:opoopress-theme-themename:1.0` 下载使用



[oprepo]: /zh/docs/1.2/opoopress-maven-repositories.html "OpooPress Maven 仓库"