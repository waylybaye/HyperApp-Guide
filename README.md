
# HyperApp Manual

English version | [中文版](./README_zh.md)



## What's HyperApp

HyperApp is a Docker Automation iOS app and an SSH Terminal.

[![HyperApp on AppStore](https://linkmaker.itunes.apple.com/assets/shared/badges/en-us/appstore-lrg.svg "View on App Store")](https://itunes.apple.com/app/apple-store/id1179750280?pt=118260435&ct=guide&mt=8)


#### Docker Automation

HyperApp comes with many featured docker images that we have listed all configuration for you, you can deploy & config them in a user-friendly way.

#### Linux management

* Monitor: HyperApp helps you monitor your servers status easily and quickly.
* SSH Terminal: the terminal helps you to login to your servers at anytime anywhere.

---

## TOC

* [Prerequisites](#Prerequisites)
    * [Supported Linux](#Supported Linux)
* [Servers](#Servers)
* [Docker](#Docker)
    * [Add Docker](#add docker)
    * [Deploy Docker](#deploy docker)
* [Store](#Store)
* [FAQ](#faq)

---


### Prerequisites

**SSH Terminal support all versions of Linux**, but Docker automation only support specific versions.

#### Supported Linux

* Docker only support 64 bit system
* Kernel version 3.10+
* Ubuntu 14，16 ✅
* CentOS 7 ✅
* Debian 8 ✅
* CentOS 6 ⚠️ 
* Not support OpenVZ servers ❌

*CentOS 6 does work with docker, but some hosting providers have old kernel lower than 3.10 installed*

---

### Servers

You can monitor your servers/routers status in Severs tab

![Servers](https://github.com/waylybaye/HyperApp-Guide/raw/master/images/manage-server.png "Servers")

Click the plus button to add your own server:

1. Docker automation need a root user or a user with sudo permission.
    * Name: Set a name for your server.
    * Host: Your server's IP address or domain.
    * Port: The SSH server port, normally it's 22.
    * User: Your username
    * Password: Your password, if you authenticate using pubkey then leave it blank.

2. If you authenticate using pubkey, then please copy the private key content to your phone and click "Paste Privatekey from Clipboard", fill the `passhprase` too if your private key is crypted.


[查看如何配置 Google CloudEngine 和 AWS](./cloud.md)  

---


### Dockers

#### Add Docker

![Docker](https://github.com/waylybaye/HyperApp-Guide/raw/master/images/add-app.png "Docker")

1. Open `Store` tab and click one of the docker images.
2. Choose the servers you want to deploy.
3. It will take you to the config page after creation, you can see all the configuration of selected image.
4. click `Next` if you finished configuration or click `Skip` to configure it later.

#### Deploy Docker

![manage docker](https://github.com/waylybaye/HyperApp-Guide/raw/master/images/manage-app.png "manage docker")

1. Open `Apps` tab，click one of the server name, it will show the action sheet.
2. Click `Install` to install it to selected server.
3. It will show the progress under the card, you can track the status in realtime.


---

### Store

#### How to run a Docker image not listed？

You can click the `Docker Image` item and input any image you want to run.

*the `-d` option is enabled by default*

#### How to ask HyperApp add more docker images？

You can create issues if this repo.

---

### 常见问题

**为什么 PrivateKey 总是认证失败！**  
1. 请确保你复制的是私钥，不是公钥，以 `ssh-rsa *****` 开头的是公钥（也就是你在 GCE 后台上传的那行文本）
2. 请检查你的私钥是否复制正确，一般来说私钥的格式是下面的形式：  

```
-----BEGIN **** PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: DES-EDE3-CBC,D64916783E629696
***************************************
***************************************
-----END **** PRIVATE KEY-----
```

请确保从第一行到最后一行的所有内容都复制完全了，有些剪贴板同步的应用，可能会漏掉一部分文本。



**为什么部署成功了还是安装不上？**  

1. 如果使用的是 GCE 或者 AWS ，那么您可以需要在它们的控制台中添加防火墙规则外部才能连接特定的端口。
2. 您使用的Linux发行版可能默认开启了防火墙守护进程，比如 CentOS 的 FirewallD。请查阅相关的资料如何添加允许端口访问。



**为什么 GCE 连接不上？**  

您可能被分配了一个已经被墙的IP，请使用下面的方法进行故障排除


**怎样检测 IP 能否访问，或者我部署的应用能否访问？**  
1. 检测 IP 最简单的是运行 `ping IP` 看看是否可以连通，但是 GCE 和 AWS 的默认防火墙规则屏蔽了 ICMP，所以这个方法可能不适用。
2. 基本所有的厂商都会允许外部连接 22端口（SSH远程登录）所以您可以简单的 `ssh IP` 一下看看是否可以连通，如果报错认证失败说明是可以连通的
3. 如果您要检测其它端口（比如SS的）那么您可以运行 `telnet IP PORT` 来查看远程端口是否开启，如果可以访问则远程服务没问题。如果不可以则可以登录服务器，运行 `lsof -i :端口` 来查看是否有进程正在监听该端口，如果有说明是防火墙屏蔽了端口访问，如果没有说明部署失败。


**为什么我在机器上能连接但在App上用同样的参数连接不了？**  
你手机是否开了VPN或者 Surge，尝试断开 VPN/Surge 后试试。  
有些服务商可能会屏蔽另外服务商的某些链接，当你使用VPN绕道连接时可能会出现此问题。


**怎样判断私钥是否有加密？**  
您可以查看私钥第二行是否有 **ENCRYPTED** 的字样，如果有则是加密的。  


**我不知道 Mac 上 `id_rsa` 的密码怎么办？**  
如果您使用 Mac 那么 `id_rsa` 的密码保存在钥匙串中，您可以打开：`应用程序 - 实用工具 - 钥匙串访问`，并在右上角搜索 "id_rsa" 获取其密码。  






