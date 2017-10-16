# 各云厂商使用教程


## 目录

* [HyperApp](#hyperapp)
    * [用 HyperApp 生成密钥](#用hyperapp生成密钥)
    * [手动添加服务器](#手动添加服务器)
    * [自动高配置服务器](#自动高配置服务器)
* [Vultr 教程](#vultr)
* [Linode 教程](#linode)
* [AWS 教程](#aws)
* [推荐链接](#推荐链接)

## HyperApp

### 用 HyperApp 生成密钥

1. 打开 `更多 → SSH Keys → 右下角加号 → 生成密钥` 生成一个密钥
2. 点击密钥后，可以进去点击 `复制公钥` 然后用于下面的步骤。

### 手动添加服务器

点击 `服务器 → 右下角加号 → 手动配置` 后进入添加服务器页面。添加服务器需要 `IP，端口，用户名，密码，密钥` 等信息。我会在下面各个厂商的分段中给出这些信息。

一般都有两种认证方式，密码或者密钥。添加服务器时，你可以使用平台提供的密码登录，或者密码留空，在下面密钥中选择上一步生成的密钥。

### 自动配置服务器

你也可以使用 `服务器 → 右下角加号 → 自动配置` 功能来自动添加服务器。根据自动配置的提示一步步运行就可以，非常简单。

---

## Vultr

### 创建服务器

1. 登录并打开 [Servers](https://my.vultr.com/) 点击加号新建一个服务器实例
2. 进入新建实例页面
    1. Server Location: 选择一个地区，推荐 Tokyo > Singapore > Los Angeles。但是 Tokyo 的机房晚上丢包严重，严重影响使用体验，LA 虽然延迟高但是稳定。
    2. Server Type: 必须选择 64 位的系统，推荐 Ubuntu 最新版本，或者 CentOS 7
    3. Server Type: 如果有 \$2.5 的可以买 \$2.5的，没有的话就买 $5 的。
    4. Additional Features: 可以选择 `Enable IPv6`
    5. Startup Script: 不用选
    6. SSH Keys: 如果你不想用 root 密码登录那么可以，使用上面复制的公钥，添加到这里并选择即可
    7. Firewall Group: 这儿是管理防火墙的，如果你非常注重安全，可以自己新建防火墙组否则就选择 `No Firewall`
    8. Server Hostname & Label: 随便填写一个易记的名字

    
### 添加服务器
    
等几分钟实例创建完成并且启动后，在 [Servers](https://my.vultr.com/) 页面点击刚才的实例进去可以看到一些信息，最重要的是左侧的 `IP Address` `Username` `Password`

1. 手动配置：只需要将上面三个参数填入 HyperApp 中即可，端口不用填默认用 `22`。
2. 自动配置：点击右上角工具栏的 `View Console` 按钮，图标是一个显示器，进入终端。
    1. 出现 `vultr login` 时输入上面看到的 `Username` 一般都是 `root`
    2. 出现 `Password` 提示时，输入上面看到的 `Password`
    3. 运行 HyperApp 提示的命令，然后扫码即可。


---


## Linode

### 创建服务器

1. 登录并打开 [Linodes](https://manager.linode.com/linodes) 页面，点击右下角的 `Add a Linode` 链接。
2. 进入 [Add a Linode](https://manager.linode.com/linodes/add?group=) 页面
    * Select an instance type: 选择一个主机类型，可以选择最低配置的 `Linode 1024`
    * Location: 选择一个机房，推荐 Tokyo 2 > Fremont, CA
3. 点击刚刚创建的 `Linode` 进入页面，然后点击 `Deploy an Image` 进入安装系统的界面
    * Image: 推荐 Ubuntu 16.04 LTS 或者 CentOS 7
    * Deployment Disk Size: 输入一个磁盘大小，默认的 20G 就够用
    * Root Password: 输入一个 root 账号的密码
    * 点击 `Deploy` 
4. 等待下方 `Host Job Queue` 的三个任务完成后，点击 `Boot` 按钮开机。


### 添加服务器

回到 [Linodes](https://manager.linode.com/linodes) 页面可以看到刚刚创建的实例的IP地址

1. 手动配置：填入上面的 IP 地址，用户名 root， 密码为上面第3步中你自己输入的密码。
2. 自动配置：点击一个 Linode，然后点击上方 `Dashboard` 后面的 `Remote Access` 标签页
    * 进入 `Remote Access` 标签页后点击最下方 `Console Access` 中的 `Launch Lish Console` 或者最下面的 `Launch Graphical Web Console`
    * 出现 `login` 后输入 `root` (如果没看到的话可以按几次回车）
    * 出现 `Password` 后输入上面第3步中自己设置的 root 密码
    * 复制自动配置给的命令并运行即可。

---

## Bandwagon(搬瓦工)

### 添加服务器

1. 手动配置
	* 登陆搬瓦工，进入[后台](https://bandwagonhost.com/clientarea.php),并登录。
	* 依次点击`service`-`my service`,这里会列出你所购买的服务器
	* 点击服务器信息框右侧的`KiWiVM Control Panel`按钮，默认会来到是`Main controls`,依次记下`IP address`和`SSH Port`,root密码在创建时一般会发到你的邮箱中，记下它。
	* 依次填入记录下的 IP 地址， 用户名 root，端口填写上面`SSH Port`中的内容。密码为之前创建时发送到你邮箱中的密码。如果遗忘，可以在搬瓦工控制面板找到`Root password modification`中更改。

---

## AWS

### 创建服务器



## 推荐链接

如果你使用下面的链接注册，那么你会收到相应的一小笔试用赠金，如果你将来消费开发者会收到$10的奖励。这些奖励将被用来购买主机运营一些 HyperApp 相关的公共项目。

（上文中出现的所有链接没有加推荐代码）

* [Vultr $10](http://www.vultr.com/?ref=6833039)
* [Linode $20](https://www.linode.com/?r=ad279824479def3ef162e3e99498242d4046ec1b)

<!--<a href="https://www.vultr.com/?ref=6833039"><img src="https://www.vultr.com/media/banner_2.png" width="468" height="60"></a>-->
