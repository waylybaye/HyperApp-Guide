# Nextcloud 教程

## 简介 

>随着国内多家网盘的陆续关停、百度云盘的严重限速、将小电影替换成8秒教育片等等，国内网盘不是阉割就是残废，真的让人寒心，在找不到能放心使用下去的云服务时，我们的数据该怎么办呢？相对简单靠谱的方案有购买 Office 365 用微软的 OneDrive、番·羽·土·啬使用国外的 Dropbox、Google Drive 等、或者购买 NAS 设备。当然，如果你有动手能力，那么还可以用自家/公司的电脑或租用 VPS 服务器来「搭建自己的私有云网盘」！除了介绍过的ownCloud、Syncthing 外，新一代的开源网盘 Nextcloud 同样值得推荐.

下面简要介绍以下安装流程

## HyperApp 服务端配置

- 在安装`Nextcloud`前，需要先安装`Nginx Proxy`和`Nginx SSL Support`和`Mysql`,前两个的参数不需要变动。（如果之前已经安装了则可不用安装）

### Mysql设置：

- 首先打开HyperApp找到Mysql安装，填写相关配置：

```
	 "Version"             选择"latest"
	 "Root Password"       设置一个Mysql的"Root密码"
	 "Database"            设置一个数据库名,此处示例为"nextcloud"
	 "User"                设置一个数据库用户,此处示例为"nextcloud"
	 "Password"            设置一个数据库密码,此处示例为"nextcloud"
	 "Port"                此处`留空`
```

- 其他设置如未说明则保持默认

- 填写完成之后点击最下方的"保存"

- Mysql 配置完成后如下：

<img src="./images/nextcloud-1.PNG" width="450" />

### Nextcloud 设置：

- 首先打开HyperApp在应用中找到Nextcloud,填写相关配置：

```
	 "Version"             "latest"
	 "Port"                此处"留空"
	 "Data dir"            保持默认
	 "Link Containers"     选择"Mysql"
```

- 再展开"Show Nginx and SSL options"选项

```
	 "Custom Domain"       填写"你的域名"
	 "Port"                此处"留空"
	 "HTTPS"               推荐选择"Redirect http to https"
```

- 再来到"Nginx SSL Support"选项(如果你之前已经通过HyperApp申请好证书则此步骤不需要填写)

```
	 "Domain"      填写你的"域名"
	 "Email"       填写你的"邮箱"
```

- 填写完成之后点击最下方的"保存"

全部填写好的示意图如下：

<img src="./images/nextcloud-2.PNG" width="450" />

## 防火墙配置

- CentOS

```
	firewall-cmd --add-port=80/tcp --permanent
	firewall-cmd --add-port=443/tcp --permanent
	firewall-cmd --reload
```

- Ubuntu

```
	sudo ufw allow 80
	sudo ufw allow 443
```


## 使用Nextcloud

打开浏览器，键入你的域名，回车即可看到nextcloud的页面,首先我们需要初始化，设置一个账户。

<img src="./images/nextcloud-3.PNG" align=center />

等待初始化完成后，用刚刚创建的账户登陆进去即可。

<img src="./images/nextcloud-4.PNG" align=center />

大功告成！


