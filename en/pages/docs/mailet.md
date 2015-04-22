---
layout: doc
title: OpooPress Mailet
url: /docs/mailet/
index: 900
group: "DEPLOYMENT"
render: true
---

OpooPress Mailet makes you using [Apache Mailet API](http://james.apache.org/mailet/api/index.html) to receive email and publish mail content to OpooPress blog. That means you can publish/deploy OpooPress articles by email.

## 1. Basic usage

Just send a text mail to particular mail address. The mail subject will be used as post title, the mail content will be used as post content. OpooPress mailet will receive the mail, process it, generate your blog and deploy it to server.

This is the basic usage. If you want to use date, tags, categories in post, just move on and read the rest of this document.

## 2. Processing Workflow

* step 1. OpooPress Mailet monitor particular recipient mail address, if such a mail received, jump to step 2
* step 2. mail to blog
	- create new post file from the mail
	- call `mvn op:generate` command to generate the site
	- call `mvn op:deploy` command to deploy site to server
* step 3. reply the result to the sender

## 3. System Requirements
- Mail Server (Domain, IP etc. such as a Virtual Private Server)
- [Apache James Server 2.3.2](http://james.apache.org/download.cgi#Apache_James_2.3.2_is_the_stable_version)
- OpooPress Mailet packages

## 4. Set Up OpooPress Mailet

Demo environment
- Virtual Private Server (VPS) 
	- RAM: 512M
	- OS: CentOS 6.4
	- Domain: opoopress.mail.opoo.org
	- IP: 1.2.3.4
- Java OpenJDK 1.7.0
- Apache Maven 3.1.0
- Apache James 2.3.2

### 4.1 Install OpooPress

Follow [Installation Instructions](http://www.opoopress.com/zh/docs/installation/) to install Java, Apache Maven and initialize the OpooPress blog. Make sure can run all OpooPress maven commands correctly.


### 4.2 Install Apache James
1. Set name records in domain management panel 
	- Set `A` record: `opoopress.mail.opoo.org` -> `1.2.3.4`
	- Set `MX` record: `opoopress.mail.opoo.org` -> `1.2.3.4`
2. Download [Apache James Server 2.3.2](http://james.apache.org/download.cgi#Apache_James_2.3.2_is_the_stable_version), i.e. `james-binary-2.3.2.tar.gz`.
3. Unzip the distribution archive to `/usr/local/`
```
tar zxvf james-binary-2.3.2.tar.gz
mv james-2.3.2 /usr/local/
```
4. Start and stop James
	- run `chmod +x /usr/local/james-2.3.2/bin/*.sh` to make the scripts executable
	- run `/usr/local/james-2.3.2/bin/run.sh`, folder `/usr/local/james-2.3.2/apps/james` will be created after first run
	- enter `Ctrl + C` to stop James
5. Edit James config file `/usr/local/james-2.3.2/apps/james/SAR-INF/config.xml`
	- replace all `localhost` to `opoopress.mail.opoo.org`
	- replace all `myMailServer` to `opoopress.mail.opoo.org`
	- replace all `autodetect="true"` to `autodetect="false"`
	- replace all `autodetectIP="true"` to `autodetectIP="false"`
	- configure DNS
```xml
<dnsserver>
    <servers>
        <server>8.8.8.8</server>
        <server>8.8.4.4</server>
    </servers>
    ...
</dnsserver>
```
	- **Optinal**: To enable send mail by SMTP from remote machine, need comment `RemoteAddrNotInNetwork=127.0.0.1` node, and uncomment `<authRequired>` and `<verifyIdentity>` in `<smtpserver/>`.
6. Add user. 
Run `/usr/local/james-2.3.2/bin/run.sh` start James, `telnet` to port `4555`.
```
JAMES Remote Administration Tool 2.3.2
Please enter your login and password
Login id:
root
Password:
root
Welcome root. HELP for a list of commands
```
Run `adduser <username> <password>` to add new user
```
adduser site1 site1password
adduser site2 site2password
adduser site3 site3password
```

### 4.3 Install and configure OpooPress Mailet
1. Install OpooPress Mailet from source
```
git clone https://github.com/opoo/opoopress.git
cd opoopress/mailet
mvn package
mvn dependency:copy-dependencies
```
Copy `opoopress/mailet/target/opoopress-mailet-<VERSION>.jar` and all Jar files in `opoopress/mailet/target/dependency` to Apache James directory `/usr/local/james-2.3.2/apps/james/SAR-INF/lib/`(create `lib` directory if not exists).
```
mkdir /usr/local/james-2.3.2/apps/james/SAR-INF/lib/
cp target/opoopress-mailet-*.jar /usr/local/james-2.3.2/apps/james/SAR-INF/lib/
rm target/dependency/junit-*.jar
cp target/dependency/*.jar /usr/local/james-2.3.2/apps/james/SAR-INF/lib/
```
2. Edit Apache James config file `/usr/local/james-2.3.2/apps/james/SAR-INF/config.xml`, add belows in node `<spoolmanager><processor name="root">`:
```xml
	<mailet match="RecipientIsAndSenderIs=site1@opoopress.mail.opoo.org|writer@opoopress.mail.opoo.org,yourname@gmail.com" class="OpooPressMailet">
		<site>/home/sites/opoopress-site1/site</site>
		<command>mvn op:deploy</command>
	</mailet>
	<mailet match="RecipientIsAndSenderIs=site2@opoopress.mail.opoo.org|writer@opoopress.mail.opoo.org,yourname@gmail.com" class="OpooPressMailet">
		<site>/home/sites/opoopress-site2/site</site>
		<command>mvn op:deploy</command>
	</mailet>
```
	- **match attribute**: Mail recipient and sender are separated by `|`. Addresses are separated by `,`.
	- **site**: The OpooPress blog site directory.
	- **command**
		- It will be `mvn deploy` or `mvn deploy -Dsite=zh` nornally
		- Can use complex shell script, such as `/home/scripts/deploy_my_site.sh`
		```
		cd /home/sites/opoopress-site1
		mvn deploy
		git add .
		git commit -a -m "Add new post"
		git push
		```

### 4.4 Advanced Usage

![OpooPress Blogging by Mail Snapshot](http://www.opoo.org/wp-content/uploads/2013/opoopress-blogging-by-mail-snapshots.png)

**Mail Subject** 

It will be processed as post `title` and `name`.

Rules:
- If mail subject contains `|`, then the string before `|` will be used as `title`, the string after `|` will be used as `name`.
- If mail subject does not contain `|`, the mail subject will be used as `title` and `name`.

The `name` property will be processed by [SlugHelper](https://github.com/opoo/opoopress/blob/master/core/src/main/java/org/opoo/press/SlugHelper.java).

Examples: (assume the blog `permalink` is `/article/${'$'}{name}/`, and the current date is `2013-08-13`)
- Name: Hello Mail
	- Post file name: 2013-08-13-hello-mail.markdown
	- Post URL:  /article/hello-mail/
- Name: 2013-08-13-hello-mail
	- Post file name: 2013-08-13-hello-mail.markdown
	- Post URL: /article/hello-mail/
- Name: 2013-08-13-hello-mail.textile
	- Post file name: 2013-08-13-hello-mail.textile
	- Post URL: /article/hello-mail/
- Name: hello-mail.textile
	- Post file name: 2013-08-13-hello-mail.textile
	- Post URL: /article/hello-mail/

**Mail Content**

Rules:
- If it does not contain [YAML front-matter](http://www.opoopress.com/zh/docs/frontmatter/) header content, OpooPress Mailet will add one
- If the YAML front-matter header does not contain `title` variable, OpooPress Mailet will use `title` from mail subject.
- If the YAML front-matter header does not contain `date` variable, OpooPress Mailet will use current date as the value of `date` variable.

Demo is here <http://demo.opoo.org/demo/>。

**Reply Mail**

OpooPress Mailet reply the result to the sender. The reply mail content example: 
```
File writen: /home/sites/mysite/site/source/article/2013-08-13-this-is-a-post-publish-by-email.markdown
Execute command: mvn op:deploy
========================

[INFO] Scanning for projects...
[INFO]                                                                         
[INFO] ------------------------------------------------------------------------
[INFO] Building My OpooPress.com site 1.0-SNAPSHOT
[INFO] ------------------------------------------------------------------------
[INFO] 
[INFO] --- opoopress-maven-plugin:1.0.1-SNAPSHOT:deploy (default-cli) @ my-opoopress-site ---
[INFO] The site directory is : /home/sites/mysite/site
[INFO] Skipping install, site already installed.
[INFO] Skipping sass compile, css file is up to date.
[INFO] File '/home/sites/mysite/site/source/article/2013-08-13-this-is-a-post-publish-by-email.markdown' is newer than 'Tue Aug 13 07:08:08 UTC 2013'
[INFO] Source file has been changed after time 'Tue Aug 13 07:08:08 UTC 2013', regenerate site.
[INFO] Reading sources ...
[INFO] Rendering ...
[INFO] Writing files ...
[INFO] Writing 2 posts
[INFO] Writing 12 pages
[INFO] Copying 1 assets directory
[INFO] Generate time: 492ms
[INFO] Destination [/home/sites/mysite/target/public/site]
...
```

## 5. Note

**Security**

For security reasons, we need edit the Apache James config file after install the OpooPress Mailet:
* Disable remote managerment: change `enabled` to `false` for node `<remotemanager/>` 
* Disable NNTP Service: change `enabled` 改为 `false` for node `<nntpserver/>`, and set `threadCount` to `0` in node `<nntp-repository/>`.



**Run Apache server as linux service**
```
/usr/local/james-2.3.2/bin/phoenix.sh start
```
and
```
/usr/local/james-2.3.2/bin/phoenix.sh stop
```