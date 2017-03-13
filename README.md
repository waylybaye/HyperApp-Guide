
# HyperApp 用户手册

## HyperApp 是什么

HyperApp 是一个基于 SSH 和 Docker 的自动化部署工具， 您可以在 Store 页面点击任意应用，将其部署到您的服务器上。

[![HyperApp on AppStore](//linkmaker.itunes.apple.com/assets/shared/badges/zh-chs/appstore-lrg.svg "View on App Store")](https://itunes.apple.com/app/apple-store/id1179750280?pt=118260435&ct=guide&mt=8)

#### 支持的 Linux 系统

* 64位，内核版本 3 以上的以下系统
* Ubuntu 14，16 ✅
* CentOS 7 ✅
* Debian 8 ✅

注：CentOS 6 也是支持的，但是有些厂商自带的内核版本较低导致不支持 Docker

#### 测试过的厂商

* Google CloudEngine
* AWS EC2
* Linode (支持 CentOS6)
* Vultr
* DigitalOcean


下面会以WordPress为例演示如何在您的服务器上部署应用

### 部署一个应用

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

