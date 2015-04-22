---
layout: doc
title: Installation for Non-Developer
url: /docs/installation-non-developer/
index: 22
group: "GETTING STARTED"
render: true
---

OpooPress release a Helper tool. This tool help non-developer to configure the OpooPress runtime environment automatically, 
including Java and Apache Maven.

*The Helper tool for Windows ONLY currently*

Follow there steps

1. Download [OpooPress Helper ${site.op_current_version}](http://www.opoopress.com/downloads/opoopress-${site.op_current_version}-win.zip)
- Unzip to a directory, i.e. `D:\opoopress-${site.op_current_version}\`
- Open a new command prompt (Winkey + R then type cmd) and jump to this directory
```
C:\>D:
D:\>cd opoopress-${site.op_current_version}
D:\opoopress-${site.op_current_version}>
```
- Run OpooPress commands
```
D:\opoopress-${site.op_current_version}>op -version
D:\opoopress-${site.op_current_version}>op install
D:\opoopress-${site.op_current_version}>op preview
D:\opoopress-${site.op_current_version}>op deploy
```
  
This is a portable package, you can delete it completely anytime if you want.


Also see [Commands for Non-Developer](../usage/#commands-for-non-developer)。

