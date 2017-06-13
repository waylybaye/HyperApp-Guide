# 应用文档


## 目录
* [网络](#网络)
    * [SS: TCP Fast Open 和 OBFS](#shadowsocks-libev)
    * [OpenConnect: Cisco AnyConnect 服务端](#openconnect)
* [网站](#网站)
    * [Hugo](#hugo)
* [Business](#business)
    * [Huginn: 打造你自己的 IFTTT 服务](#Huginn)
* [娱乐](#娱乐)
    * [EFB: 代收微信消息的 Telegram 机器人](#efb)
    * [Thunder xware：迅雷远程下载](#thunder-xware)


## 网络

### Shadowsocks-libev

**TCP Fast Open**
默认配置就是开启的，在Surge 中需要配置 `,tfo=true`


### OpenConnect

#### 配置界面

1. Port: 填写一个端口，推荐默认的 443
2. Domain：填写你服务器的IP即可，如果你使用域名则填写域名
3. Username: 填入一个用户名
4. Password: 填入一个密码

Network: 默认就好

#### 下载客户端

* iOS/Android: 搜索 Cisco AnyConnect
* Mac/Windows: [Cisco 官网下载地址 (需要注册)](http://www.cisco.com/c/en/us/support/security/anyconnect-secure-mobility-client/tsd-products-support-series-home.html)
* [V2EX 网友维护的下载](https://dl.xxshe.com/)


#### 配置客户端

在客户端里输入你的 IP 或者域名点击连接，如果有安全提示可以忽略（因为我们用的自签名证书），然后输入用户名、密码连接即可。


---

## 网站

### Hugo




## Business

### Huginn

安装后默认账号: `admin` 密码: `password`


## 娱乐

### EFB

EFB 是一个可以接收微信消息并转发到 Telegram 的机器人。

#### 前置步骤

1. 在Telegram 与 [@botfather](https://t.me/botfather) 对话，输入 `/newbot` 按照提示创建一个bot，然后会得到一个 Token.
2. 继续输入 `/setprivacy` 选择刚刚创建的bot，点击 Disable。默认的 bot 收不到非 "/" 开头的消息，这个选项可以关闭这个设置。
3. 与 [@get_id_bot](https://t.me/get_id_bot) 对话，得到自己的 `Chat ID`.

#### 应用配置

1. 在 HyperApp 中选择 EFB，在配置页面的 `Token` 中填入上面第一步中的机器人 Token 值，Admin 里面填入自己的 `Chat ID`，然后部署即可。
2. 安装完毕后点击“查看日志” -> 点击右上角的 "Term" 在终端中打开，然后点击右上角的"A-" 缩小字体直到能看见二维码。
3. 使用微信扫描该二维码。注意不能截图保存到相册中然后选择图片扫描，只能扫描屏幕。但你可以截图后发到另外一台设备（比如通过QQ/微信发到PC版上）然后用微信扫描。

更多的玩法可以参阅 小众软件这篇文章 [EFB 简明安装教程：用 Telegram 收发微信](http://www.appinn.com/efb-tutorial-with-docker/) 底部的通过建群的方式与特定用户聊天的方法。

### Thunder xware

迅雷远程下载允许你通过 Web 界面操作远程服务器下载指定内容，当你有一台 NAS 时会变得非常有用。

1. 部署迅雷远程下载后，点击服务器，选择查看日志，找到 `THE ACTIVE CODE IS:` 这一行，记住这个激活码。
2. 打开 http://yuancheng.xunlei.com/ 登录后，添加下载器，输入刚才的代码即可。
3. 现在你就可以在迅雷网页上面添加下载任务了。



