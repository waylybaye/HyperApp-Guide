
# HyperApp 用户手册


## HyperApp 是什么

HyperApp 是一个基于 SSH 和 Docker 的自动化部署工具， 您可以在 Store 页面点击任意应用，将其部署到您的服务器上。

[![HyperApp on AppStore](https://linkmaker.itunes.apple.com/assets/shared/badges/zh-chs/appstore-lrg.svg "View on App Store")](https://itunes.apple.com/app/apple-store/id1179750280?pt=118260435&ct=guide&mt=8)

---

## 目录
* [使用须知](#使用须知)
    * [支持的系统](#支持的 Linux 系统)
* [管理服务器](#管理服务器)
* [管理应用](#管理应用)
* [FAQ](#FAQ)

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


**Q: 怎样判断私钥是否有加密？**  
A：你可以查看您的私钥第二行是否有 "ENCRYPTED" 的字样，如果有则是加密的。  


**Q：我不知道 id_rsa 的密码怎么办？**  
A：如果您使用 Mac 那么 id_rsa 的密码保存在钥匙串中，您可以打开：应用程序 - 实用工具 - 钥匙串访问，并在右上角搜索 "id_rsa" 获取其密码。  


[查看如何配置 Google CloudEngine 和 AWS](./cloud.md)  


---


### 管理应用

#### 添加应用

![添加应用截图](https://github.com/waylybaye/HyperApp-Guide/raw/master/images/add-app.png "在商店中添加并配置应用")

1. 打开商店，并点击您要部署的应用
2. 再出现的窗口中选择您要部署到的服务器
3. 创建后自动进入配置页面，您可以简单的配置一下并点击 Next 或者 点击右上角的 Skip 暂时跳过

#### 管理应用

![管理应用截图](https://github.com/waylybaye/HyperApp-Guide/raw/master/images/manage-app.png "管理您的应用")

1. 打开 Apps 页面，当您点击 App 卡片中的服务器列时会出现 Actions 界面
2. 在 Actions 界面你可以管理这个应用在制定服务器上的装填。点击 Install 可以安装应用。
3. 点击后会在 App 卡片下方出现进度栏，它会实时更新安装的进度，当最左侧的图标变成对号时说明动作已经执行成功。如果出现错误则点击该进度条可以查看具体的出错信息。


---


### FAQ

**为什么我在机器上能连接但在App上用同样的参数连接不了？**  

你手机是否开了VPN或者 Surge，尝试断开 VPN/Surge 后试试。  
有些服务商可能会屏蔽另外服务商的某些链接，当你使用VPN绕道连接是可能会出现此问题。

