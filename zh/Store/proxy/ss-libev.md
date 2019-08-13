# 使用 HyperApp 一键搭建科学上网环境


### 前提

搭建科学上网的前提是你有一台国外的 VPS

### 添加服务器

首先参考 [如何添加服务器](./Add-Server.md) 把您的服务器添加到 HyperApp 中

### 安装 SS

1. 在商店中选择任意一个 SS，并选择一台服务器

![创建应用](.../../images/wall/create.png)

2. 点击 Create App 后进入配置页面，按照下面的配置填写：
    * Port： 端口号
    * Password：密码
    * Encrypt：加密方式，推荐 chacha20
    * Timeout：连接超时时间，默认300
    * DNS Addr: DNS 服务器，默认8.8.8.8
    * OBFS: 使用混淆

![config](.../../images/wall/config.png)

3. 在 Apps 页面，点击应用卡片中的服务器名字，会弹出动作列表，点击安装就可以自动将应用部署到服务器上去了。

![install](.../../images/wall/install.png)

4. 现在打开 SS 客户端，填入服务器地址、端口、密码、加密方式 是不是已经可以用了！

注意：如果您使用 GCE/AWS 等，需要手动在防火墙中打开端口

### SS 客户端下载地址

- Windows客户端	[下载地址](https://github.com/shadowsocks/shadowsocks-windows/releases)
- Android客户端	[下载地址](https://play.google.com/store/apps/details?id=com.github.shadowsocks&hl=en)
- IOS客户端
	- [Shadowrocket](https://itunes.apple.com/us/app/shadowrocket/id932747118?mt=8)
	- [Quantumult](https://itunes.apple.com/us/app/quantumult/id1252015438?mt=8)
	- [Surge](https://itunes.apple.com/us/app/surge-web-developer-tool-and-proxy-utility/id1040100637?mt=8)

