
# HyperApp 用户手册


## HyperApp 是什么

HyperApp 是一个基于 SSH 和 Docker 的自动化部署工具， 您可以在 Store 页面点击任意应用，将其部署到您的服务器上。

[![HyperApp on AppStore](https://linkmaker.itunes.apple.com/assets/shared/badges/zh-chs/appstore-lrg.svg "View on App Store")](https://itunes.apple.com/app/apple-store/id1179750280?pt=118260435&ct=guide&mt=8)

---

## 目录
* [新手教程：如何一键搭建支持 https 的网站](./Get-Started.md)
* [新手教程：如何一键科学上网](./g-f-w.md)
* [新手教程：如何添加 GCE 和 AWS 的服务器](./cloud.md)
* [使用须知](#使用须知)
    * [支持的系统](#支持的 Linux 系统)
* [管理服务器](#管理服务器)
* [管理应用](#管理应用)
    * [添加应用](#添加应用)
    * [部署应用](#部署应用)
* [商店应用](#商店应用)
* [常见问题](#常见问题)

---


### 使用须知

#### 支持的 Linux 系统

* 64位，内核版本 3 以上的以下系统
* Ubuntu 14，16 ✅
* CentOS 7 ✅
* Debian 8 ✅


注：CentOS 6 也是支持的，但是有些厂商自带的内核版本较低导致不支持 Docker  

**为什么不支持 OpenVZ ？**  
因为 OpenVZ 支持的内核版本太低，不支持 Docker 所以，HyperApp 不支持 OpenVZ 的主机。


#### 测试过的厂商

* Google CloudEngine
* AWS EC2
* Linode (支持 CentOS6)
* Vultr
* DigitalOcean

---

### 管理服务器

![管理服务器截图](https://github.com/waylybaye/HyperApp-Guide/raw/master/images/manage-server.png "添加服务器")

1. 打开服务器页面，在这里可以显示基本的服务器运行状态，您可以随时下拉刷新更新重新检查服务器状态
2. 添加服务器时您可以使用 root 账号登录也可以使用具有 sudo 权限的非 root 账号登录。如果您使用密码登录请填写密码，如果使用私钥登录密码可以留空。
3. 如果您使用私钥登录，那么请将您的私钥复制到剪切板中，然后点击 "Paste Privatekey from Clipboard"，如果您的私钥是加密的那么请在在 Passphrase 中输入，否则留空。

* Linode/Vultr/DigitalOcean 等厂商一般可以使用 root 账号和密码直接登录
* 如果您使用 Google CloudEngine 或者 AWS EC2 等默认禁止 root 登录的账号，请查看下面的教程怎样配置私钥登录。


[查看如何配置 Google CloudEngine 和 AWS](./cloud.md)  


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






