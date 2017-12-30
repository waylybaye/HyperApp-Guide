# HyperApp 用户手册

[English version](./en/README.md) | 中文版

### HyperApp 简介

HyperApp 是一个基于 SSH 和 Docker 的自动化部署工具，开发者整理了超过几十个常见应用，将其整理到商店中，您只需要点击一下就会出现可视化的配置界面，然后可以一键安装到您的服务器上。部署应用就是这么简单！

HyperApp 还集成了 Let's Encrypt SSL 证书功能，几乎可以为全部应用自动生成 SSL 证书。

同时 HyperApp 可以帮助您随时查看服务器运行状态，以及通过SSH终端随时随地登录到服务器上进行操作。

[![HyperApp on AppStore](https://linkmaker.itunes.apple.com/assets/shared/badges/zh-chs/appstore-lrg.svg "View on App Store")](https://itunes.apple.com/app/apple-store/id1179750280?pt=118260435&ct=guide&mt=8)

---

## 在线浏览

[www.hyperapp.fun](https://www.hyperapp.fun)



---

### 本页目录
* [使用须知](#使用须知)
    * [支持的系统](#支持的-linux-系统)
* [HyperApp 应用功能](#hyperapp)
    * [管理服务器](#管理服务器)
    * [管理应用](#管理应用)
        * [添加应用](#添加应用)
        * [部署应用](#部署应用)
    * [商店应用](#商店应用)
* [如何使用 URL Scheme](./zh/workflow.md)
* [常见问题](#常见问题)


### 使用须知

#### 支持的 Linux 系统

注意，这里所说的支持是指自动安装docker支持的系统，如果你使用其它系统（如 FreeBSD, Gentoo等），你可以自己安装 docker，HyperApp 会自动检测 docker 是否安装，如果已经安装则使用已有的 docker。

* Docker 只支持64位系统，且内核版本 >= 3.10
* Ubuntu 14，16 ✅
* CentOS 7 ✅
* Debian 8 ✅
* CentOS 6 ⚠️ （不支持，但你可以手动安装最新版的Docker）
* 不支持 OpenVZ ❌

注：CentOS 6 也是支持的，但是有些厂商自带的内核版本较低导致不支持 Docker

推荐 Ubuntu 16.04 LTS

**为什么不支持 OpenVZ ？**
因为 OpenVZ 支持的内核版本太低，不支持 Docker ,所以HyperApp 不支持 OpenVZ 的主机。

---

### 管理服务器

![管理服务器截图](https://github.com/waylybaye/HyperApp-Guide/raw/master/images/manage-server.png "添加服务器")

1. 打开服务器页面，在这里可以显示基本的服务器运行状态，您可以随时下拉刷新更新重新检查服务器状态
2. 添加服务器时您可以使用 root 账号登录也可以使用具有 sudo 权限的非 root 账号登录。如果您使用密码登录请填写密码，如果使用私钥登录密码可以留空。
    * Name: 为您的服务器起个名字
    * Host: 您服务器的公网IP或者域名
    * Port: SSH的端口，一般是22
    * User: 您登陆用的用户名
    * Password: 您的密码，如果使用私钥登录此处可以留空，请参考下面
3. 如果您使用私钥登录，那么请将您的私钥复制到剪切板中（iCloud剪贴板同步或者使用其它同步App）然后点击 "Paste Privatekey from Clipboard" 从剪贴板中复制私钥，如果您的私钥是加密的那么请在 Passphrase 中输入，否则留空。关于密钥的更多信息请参考 [常见问题](#常见问题)

* Linode/Vultr/DigitalOcean 等厂商一般可以使用 root 账号和密码直接登录;
* 如果您使用 Google Cloud Engine 或者 AWS EC2 等默认禁止 root 登录的账号，请查看下面的教程怎样配置私钥登录，然后重复上面的第3步骤在 HyperApp 中链接。

[查看添加服务器的新手教程](./zh/Add-Server.md)

---


### 管理应用

#### 添加应用

![添加应用截图](https://github.com/waylybaye/HyperApp-Guide/raw/master/images/add-app.png "在商店中添加并配置应用")

1. 打开商店，并点击您要部署的应用
2. 再出现的窗口中选择您要部署到的服务器
3. 创建后自动进入配置页面，您可以简单的配置一下并点击 Next 或者 点击右上角的 Skip 暂时跳过配置，稍后可以点击 App 卡面的 Config 配置。

#### 部署应用

![管理应用截图](https://github.com/waylybaye/HyperApp-Guide/raw/master/images/manage-app.png "管理您的应用")

1. 打开 Apps 页面，当您点击 App 卡片中的服务器列时会出现 Actions 界面
2. 在 Actions 界面你可以管理这个应用在制定服务器上的状态。点击 Install 可以安装应用。
3. 点击后会在 App 卡片下方会出现进度栏，它会实时更新安装的进度，当最左侧的图标变成对号时说明动作已经执行成功。如果出现错误则点击该进度条可以查看具体的出错信息。

---


### 商店应用

#### 如何运行任意 Docker 镜像？

您可以点击 商店里面的 Docker Image 镜像，然后再配置页面输入任意镜像名字和参数就可以了，当您输入了内容时下面会实时显示最终 docker 的运行命令

*注意 `-d` 选项默认是开启的，您不需要再额外指定*

#### 如何添加新镜像？

如何您想添加新镜像可以在此仓库的 `Issues` 页面创建 `Issue`，并提供镜像地址。

注意现在优先添加有一定用户基础并且趋于稳定的镜像。

---

### 常见问题


**为什么部署成功了还是安装不上？**
1. 如果使用的是 GCE 或者 AWS ，那么您可以需要在它们的控制台中添加防火墙规则外部才能连接特定的端口。
2. 您使用的 Linux 发行版可能默认开启了防火墙守护进程，比如 CentOS 的 firewalld。请查阅相关的资料如何添加允许端口访问。


**为什么 GCE 连接不上？**
您可能被分配了一个已经被墙的 IP，请使用下面的方法进行故障排除


**怎样检测 IP 能否访问，或者我部署的应用能否访问？**
1. 检测 IP 最简单的是运行 `ping <IP>` 看看是否可以连通，但是 GCE 和 AWS 的默认防火墙规则屏蔽了 [ICMP](https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol)，所以这个方法可能不适用。
2. 基本所有的厂商都会允许外部连接 22 端口（SSH远程登录开放的端口）所以您可以简单的 `ssh username@IP` 一下看看是否可以连通，如果报错认证失败说明是可以连通的
3. 如果您要检测其它端口（比如SS的）那么您可以运行 `telnet IP <port>` 来查看远程端口是否开启，如果可以访问则远程服务没问题。如果不可以则可以登录服务器，运行 `lsof -i :端口` 来查看是否有进程正在监听该端口，如果有说明是防火墙屏蔽了端口访问，如果没有说明部署失败。


**为什么我在机器上能连接但在App上用同样的参数连接不了？**
您的手机是否开了 VPN 或者 Surge，尝试断开 VPN/Surge 后试试。
有些服务商可能会屏蔽另外服务商的某些链接，当你使用 VPN 绕道连接时可能会出现此问题。


**HyperApp 会在我的服务器/路由器上运行哪些命令？**
[HyperApp 运行的命令](./commands.md)
