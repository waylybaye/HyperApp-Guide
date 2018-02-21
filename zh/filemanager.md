#搭建filemanager超轻量私人云盘

> 现在市面上有很多比如 ownCloud nextCloud pydio filerun等等的开源云盘.但是感觉都很臃肿.有时候我们只需要一个轻量化功能还算齐全的网盘.caddy+filemanager就应运而生了

## 更新记录

- 2017.12.12:增加了永久化存储设置的选项

## 准备

* **HyperApp**
* **一个已经解析正确的域名（ping验证）**
* **耐心.仔细.认真**


## 服务端部署

##### 首先我们先进入VPS的SSH窗口执行命令

* 如果在h5ai设置过了.那么可以跳过这一步./share可以同时被h5ai和filemanager使用

```
sudo su
mkdir /share && chmod 777 /share
ln -s /share .
```

* 这时候/share就是共享目录并且已经软连接到/root目录下面.可以在root目录下面快速访问.也可以通过`cd /share`来访问
* 如果你想自定义目录也可以.替换/share即可.但是要注意权限设置


#### 其次转到HyperApp进行设置

1. **转到商店页面.找到`Docker Image`然后选择服务器并且保存进入配置界面**
2. **请完全按照下图配置进行填写！**

|    应用设置名称     |          内容          |
| :-----------: | :------------------: |
|     Image     | fanvinga/docker-filemanager |
|    Options    |   -v /share:/share  -v /srv/docker/filemanager:/db |
|    Command    |                      |
|     Args      |                      |
| **Nginx设置名称** |        **内容**        |
|      域名       |      你要给hfilemanager的域名      |
|     应用端口      |                      |
|     Https     |    将http重定向到https    |
|      域名       |   你要给filemanager的域名（自动填写）   |
|      邮箱       |       域名所对应的邮箱       |


3. **保存并且进行安装.请确保这时候`Nginx Proxy`以及`Nginx SSL Support`正常默认安装并且启动了**

## 默认设置

* **filemanager是个功能完整的网盘.带有权限管理的功能.所以一开始需要用 admin/admin 去登陆.之后在设置里面设置语言为中文即可.也可以添加用户.各位自行探索了.**

## 联合Cloud-Torrent

* **如果想做到利用Cloud-Torrent下载完BT之后直接可以在filemanager里面找到的话.只需要在上面的options里面加入`-v /srv/docker/Cloud-Torrent:/share/download`.然后更新配置.这样在filemanager目录下会出现download文件夹.里面就有CT下载完成的文件啦**

## 大功告成

* **这时候去访问你的域名吧٩(˃̶͈̀௰˂̶͈́)و**

<a href="https://vinga.tech"><img src="https://d.unlimit.fun/design/banner.png" alt="banner" target="_blank"></a>
