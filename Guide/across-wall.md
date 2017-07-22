# 如何免费打造打造一个安全稳定低延迟超高速的科学上网环境

这篇文章将会介绍如何获取由 Google 提供的一年 $300 美金的试用金，然后使用 HyperApp 搭建一个低延迟超高速的科学上网环境。网络延迟基本在50ms左右，并且可以流畅观看 Youtube 4K 视频。本文不需要读者有较深的技术背景，全部过程都可视化、自动化完成。

下文用 GCP 代表 Google Cloud Platform，指 Google 的整个云平台。GCE 是指 Google Cloud Engine，是 GCP 产品线里的一个主机产品。


### 本文前提条件

1. 有一个 Google 账号，没有的话可以注册一个。
2. 注册 GCP 免费试用需要用信用卡进行身份验证（只做验证，不会收费），所以你必须有一个 Visa/MasterCard 的信用卡才行。如果你是一位学生还没有信用卡，你可以看文末的其它厂商提供的一些免费几个月的试用。


---

## GCP 注册以及创建服务器

要访问 Google 首先需要你能科学上网，但是这篇文章又是介绍如何科学上网的，好像有点🐔生蛋蛋生🐔的矛盾… 其实你可以去App Store搜索 V屁恩，找一个免费的下载后，通过签到等方式暂时领取一天或者几个小时的免费低速试用来完成下面的教程。


### 注册 GCP 免费试用

<img src='./images/gce/1-free-tier.png' width="414" /> <img src='./images/gce/1-intro.png' width="414" />
   

1. 登录Google账号后使用这个链接来注册 https://cloud.google.com/free/ ，在打开的页面中点击“Try it Free"。
2. 接受条款，并点击”同意并继续“
3. 在页面中填入你的信息：
    * 账号类型：个人
    * 名称和地址：填写你的地址、电话等
    * 付款方式：添加一个信用卡。这个信用卡将会用来验证身份，防止GCP被滥用。
    * 点击 ”开始免费使用“ 完成注册



### 新建主机

<img src='./images/gce/2-vms-nav.png' width="414" /> <img src='./images/gce/2-vms.png' width="414" />


按照上图所示，在左侧菜单中导航到 [计算引擎 → VM 实例](https://console.cloud.google.com/compute/instances)


点击加号按钮，创建一个 VM 实例。

<img src='./images/gce/2-create-vm.png' width="414" /> <img src='./images/gce/2-create-vm-firewall.png' width="414" />



* 名称：随意填入一个易记得名字
* 地区：建议选择 `asia-east1-*` 三个中的任意一个，这个机房是在台湾，国内的延迟只有 50~70ms，简直快到飞起。
* 机器类型：选择 “小型” (1.7G 内存) 就可以了。默认选中的 3.75G 的内存其实用不完。
* 启动磁盘：默认的Debian 8就可以，推荐 Ubuntu 16.04 或者 CentOs 7，但是为了防止将来磁盘不够用，你可以点击右下角的更改，大小里使用 20G 或者 30G。
* 防火墙：选中 “允许HTTP流量” 和 ”允许HTTPS流量“

点击”创建“，稍等几分钟就会创建完毕，现在打开 HyperApp 开始配置这台服务器吧。

---


## HyperApp

HyperApp 是一个部署自动化以及服务器监控管理的App，致力于让普通用户也可以使用云服务。HyperApp 可以监控服务器/路由器的运行状态，还可以可视化的一键部署各种应用。
本段介绍如何使用 HyperApp 管理刚刚创建的服务器，开启 BBR 加速，安装科学上网应用。

[![下载 HyperApp](https://linkmaker.itunes.apple.com/assets/shared/badges/zh-chs/appstore-lrg.svg "View on App Store")](https://itunes.apple.com/app/apple-store/id1179750280?pt=118260435&ct=v2ex&mt=8)


### 添加服务器

<img src='./images/gce/3-servers.png' width="414" /> <img src='./images/gce/3-auto-config-start.png' width="414" />

1. 在 ”服务器“ 页面点击右下角的加号，然后选择第二个”自动配置“
2. 点击“开始”，应用会自动生成一对密钥，请耐心等到几秒~十几秒。

<img src='./images/gce/3-auto-config-done.png' width="414" /> <img src='./images/gce/3-vm-ssh.jpg' width="414" />


3. 等到出现“一切就绪”时，点击“复制“将代码复制到剪贴板里，如果你用电脑操作的话可以点击”发送“将代码通过任意一种方式发送到电脑上。


在 GCE [计算引擎 → VM 实例](https://console.cloud.google.com/compute/instances) 页面，选择刚刚创建的实例的 `SSH ▽ 在浏览器窗口中打开` 打开一个基于 Web 的 SSH 终端。

在浏览器的SSH中粘贴并运行刚刚复制的代码。等到二维码出现时，使用 HyperApp 扫描该二维码便会自动添加该服务器。添加后 HyperApp 会检测刚刚添加的服务器的基本运行状况。


### 永久添加公钥

注意：你可以暂时跳过本小段，进行后续的操作，如果 HyperApp 出现了认证错误的提示，可以回到这段进行操作。

刚刚的自动配置的功能在几乎所有主机上都可以用，但是 GCE 是个例外，它会清空用户自行添加的公钥，所以几分钟后可能就会出现密钥认证失败的错误。你可以通过以下步骤永久性的设置密钥。

1. 打开 `更多` → `SSH Keys` → `点击唯一的一个 Key` → `复制公钥`。
2. 打开 [计算引擎 → 元数据 → SSH 密钥](https://console.cloud.google.com/compute/metadata/sshKeys) 点击修改后，复制并添加刚刚的公钥。
3. 添加后页面会出现一行新记录，主要有两列：`用户名` 和 `密钥`。这个用户名应该是 HyperApp，然后打开 HyperApp → 编辑服务器 → 修改 `用户名` 为刚刚显示的用户名，保存后就可以了。


---


### 开启 BBR 加速，跑满带宽

这一步并不影响科学上网，但是会极大的提高上网质量。BBR是 Google 开发的TCP拥塞控制技术，并且已经合并到较新的Linux内核中。它的主要作用是可以让你跑满服务器的带宽。

比如说没有开启的情况下你观看 Youtube 720P的视频都可能会卡，但是开启了BBR后 1080P 的视频完全无卡顿，就连 4K 视频也可以流畅观看（有些网络特别卡的除外）。

要开启 BBR 需要升级 Linux 内核，不过不用急，在 HyperApp 中开启非常简单：

<img src='./images/gce/4-bbr.png' width="414" />

1. 在服务器卡片中点击右上角的 Terminal 图标，进入 SSH 终端。
2. 选择最下面的一行工具栏的第一个图标，然后点击 "teddyun/BBR" 一键脚本的链接，点击后会让你确认是否下载并执行外部脚本。
3. 点击确认后会自动下载并执行，执行过程中需要点击键盘上任意一个键确认继续。如果想中断执行，那么点击 `ctrl` 后按 `c` 终止执行。
4. 稍等几分钟，等待系统内核升级到最新版后会自动重启。

注：这是系统层面的升级，执行完毕后不必对其它应用做任何配置。客户端也不需要做任何配置。

---


### 部署科学上网应用


<img src='./images/gce/4-create-app.png' width="414" /> <img src='./images/gce/4-config-app.png' width="414" />


在 `商店` 页面 `网络` 分组下选择任意一个应用，这里我们选择占用资源最少的 `****-libev`，（下文用SS代替）点击该应用。在弹出的对话框中选择刚刚添加的服务器，点击`创建应用`


在此页面中输入简单的一些配置：
* Port: 端口，可以填入 80 或者 443（因为用其它端口需要设置防火墙）
* Password：随便填入一个密码
* Encrypt：选择一种加密方式，推荐针对移动访问优化的 `chacha20`
* OBFS: 使用 OBFS 可以将 SS 流量伪装成正常的网页访问从而达到欺骗效果，可以防止被墙或者运营商干扰。

如果你使用其它端口，请参考文末的 [设置GCE防火墙](#设置-gce-防火墙) 如何开启防火墙。

---

## 客户端设置

### iOS

iOS 上有很多 SS 的客户端可供选择，收费的有 小火箭、土豆丝、Surge、Cross 等。免费的可以使用 `Wingy`。基本上所有的应用配置方法都是一样的，只要添加服务器，填入你的服务器IP、端口、密码和加密方式即可，这里不再详述。

### Mac/Windows

Mac 和 Windows 上都有免费的 SS 客户端可以使用，配置方法也是只要输入你的IP、端口、密码和加密方式即可。

---

## 其它玩法

现在你有了一台 1.75G 内存的服务器了，其实使用 HyperApp 还有很多其它玩法，商店里面有很多其它应用，都可以自动安装配置。

比如你可以自己搭建一个博客、网站、论坛，个人网盘，聊天服务，并且可以自动配置HTTPS。如果你玩游戏可以创建一个 Minecraft 服务器。

---

## 附录

### 学生可以使用的免费服务

* [阿里云的云翼计划](https://promotion.aliyun.com/ntms/campus2017.html)：完成学生认证后可以享受 ￥9.9/月的优惠。

### 设置 GCE 防火墙

1. 在GCP后台点击 [网络 → 防火墙规则](https://console.cloud.google.com/networking/firewalls/list) 
2. 点击 `创建防火墙规则`
    * 名称：随便输入一个名称
    * 目标：选择 `网络中的所有示例`
    * 来源过滤：`0.0.0.0/0`
    * 协议和端口：`指定的协议和端口` 下面输入 `tcp;udp:端口号`

### HyperApp 支持

[官方文档和教程](https://github.com/waylybaye/HyperApp-Guide)  
[Telegram 群](https://t.me/hyperapp)  

