# LoveBundle 单端口全协议解决方案


### LoveBundle 是什么？

对于服务器来说，端口似乎用不完，但常用端口是很紧缺的资源（特别是目前端口白名单的传闻），很多协议使用标准端口（如443）能达到最好的效果，但是一个端口只能跑一个进程，要是想在一个端口上跑所有协议该怎么办呢？

LoveBundle 就是这样的一个应用，专为 HyperApp 用户提供，使用 haproxy 来自动分流各种协议的流量，从而实现用一个端口（443）来提供所有类型的服务，你只需要为不同的代理使用不同的混淆域名。

比如当你使用 `bing.com` （可以自己定义域名）连接时 `LoveBundle` 会将其识别为 `SS` 流量，当你用 `cloudflare.com` 连接时会将其识别为 `SSR` 流量，使用 `mydomain.com` 链接时会自动识别为 `Cisco AnyConnect` 流量。


### LoveBundle 包含哪些应用？

* `SS TLS 混淆`  —— 你懂得
* `SSR tls1.2_ticket_auth`  —— 你也懂
* `V2Ray VMess TCP TLS` —— 新秀 V2Ray
* `V2Ray VMess WebSocket TLS` —— 新秀第二种食用方法
* `nghttpx HTTP2 TLS` —— 高效的 HTTP2 + TLS 代理，即使在 SS/SSR 被严重干扰的时候由于其小众性质也一直超稳定。
* `ocserv: Cisco AnyConnect VPN` —— 广泛使用的企业级 VPN，出自 Cisco，全端客户端免费。


其中 `V2Ray/nghttpx/AnyConnect` 需要SSL证书的可以自动生成自签证书，也支持自动获取可信的 LetsEncrypt 证书，通过 [certbot](../developer/certbot.md) 来自动生成，非常简单，具体使用请参阅 [certbot 自动生成LetsEncrypt 证书教程](../developer/certbot.md) 下文也会有提到怎么使用。


### 什么是 HyperApp

HyperApp 是一个自动化部署工具，提供可视化的配置界面，就算你不懂任何 Linux 命令也可以在 Linux 上一键部署多达几十个应用。


[![HyperApp on AppStore](https://linkmaker.itunes.apple.com/assets/shared/badges/zh-chs/appstore-lrg.svg "View on App Store")](https://itunes.apple.com/app/apple-store/id1179750280?pt=118260435&ct=guide&mt=8)


----


## LoveBundle 配置

下文需要为除了SS/SSR之外的其它服务准备不同的子域名，如果你没有域名也不要着急，你可以使用 `xip.io` 提供的服务。下文直接以 `xip.io` 来举例，如果你了解怎么配置域名解析，可以自行添加DNS解析并替换相关的域名。


### 配置界面

<img src="../images/love-bundle.jpeg" width="450" />


### 配置详解

在 `HyperApp` 商店中点击 `LoveBundle`，在出现的配置页面中按如下填写：

**注意，如果你只想开启一部分功能，只需要填写对应服务的子域名即可，没有填写域名的服务将不会开启**


#### 通用配置

```
* Port              LoveBundle 监听的端口（推荐443）
* Password          此密码用来登录 SS/SSR/AnyConnect
* Username          此用户名可以用来登录 AnyConnect
```

其中只有 AnyConnect 需要会用到用户名，SS/SSR 认证只用到密码部分。

####  SS 和 SSR

```
* SS Domain         SS TLS 混淆的域名（可以任意域名，不需要解析）
* SS Method         SS 的加密协议

* SSR Domain        SSR TLS 混淆的域名（可以任意域名，不需要解析）
* SRR Protocol      SSR 协议
* SSR Method        SSR 加密方法
```

你可以，在 SS Domain 中填入 `bing.com` 在 `SSR Domain` 中填入 `cloudflare.com` 选择加密方法后

#### V2Ray 配置
 
```
* V2Ray UUID        V2Ray 的 uuid，这儿会自动生成一个 （默认 alterID 是32）
* V2Ray TLS         V2Ray TLS 的域名，推荐使用自己的域名+certbot证书。
* V2Ray WS          V2Ray WebSocket TLS 的域名，推荐使用自己的域名+certbot证书。
```

你可以在 `TLS Domain` 中填入 `tls.10.10.10.10.xip.io` 在 `WS Domain` 中填入 `ws.10.10.10.10.xip.io`。
注意将 `10.10.10.10` 换成你 VPS 的 IP 地址。`X.X.X.X.xip.io` 是 `xip.io` 提供的公共 DNS 服务，会将域名自动解析到前面的 IP 地址上，而且还可以使用子域名。在这儿我们不用做任何设置，就永远了两个不同的域名，并且会自动解析到 VPS 地址上。

如果你有自己的域名，做好解析后，可以在这儿填写你自己的域名。


#### HTTP2 和 Cisco AnyConnect 配置

```
* HTTPS Domain      HTTP2 TLS Proxy 的域名，推荐使用自己的域名+certbot 证书。

* OCServ Domain     AnyConnect 的域名，可以填写 IP（但是可能导致提示证书不可信的问题）。推荐使用自己的域名+certbot 证书。
* CN no route       开启后将会忽略国内IP段，只对国外IP进行代理。
```

和上面一样，我们在 `HTTPS Domain` 中填入 `http2.10.10.10.10.xip.io`.

OCServ 就是 `Cisco AnyConnect`，我们可以填写另外一个域名 `ocserv.10.10.10.10.xip.io`



### Volumes

```
certs   默认为 certbot 或者 Nginx SSL Support 的证书输出目录，
        LoveBundle 会自动在这里寻找可信的证书。
        如果找不到则会在下面的目录里生成自签证书。
CA      LoveBundle 用来生成自签证书以及VPN登录证书的目录
```

其中 V2Ray TLS/WS 和 HTTP2/AnyConnect 会用到 `certs` 和 `CA` 里面的证书。SS/SSR 不需要，你甚至可以使用任何一个域名来连接 SS/SSR（原理请参考下文背景知识里面的真假 TLS）。


----


## 客户端配置


#### SS 配置方法

```
* 服务器           VPS IP
* 端口            上面设置的端口
* 密码            上面的密码
* 混淆            TLS
* 混淆域名         上面的 SS Domain
```


#### SSR 配置方法

```
* 服务器           VPS IP
* 端口            上面设置的端口
* 密码            上面的密码
* 加密、协议       和上面一一对应
* 混淆方式         tls1.2_ticket_auth
* 混淆参数         上面的 SSR Domain   
```

#### V2Ray TLS 方式连接方式

```
* Address           上面的 V2Ray TLS Domain（需要解析到你VPS上）
* Port              上面设置的端口
* UUID              上面的UUID
* alterId           32
* Network           tcp
* TCP               ✅ Conection Reuse
* TCP header typ    none
* TLS               ✅
                    ✅ Allow insecure （如果使用自签证书）
```

#### V2Ray WebSocket 方式连接方式

```
* Address       上面的 V2Ray WS Domain（需要解析到你VPS上）
* 端口/UUID/alterID 和上面的保持一致
* Network       WebSocket
* WebSocket     ✅ Conection Reuse
* path          /
* TLS           ✅
                ✅ Allow insecure （如果使用自签证书）
```
 
 
#### Cisco AnyConnect 链接方法

```
* Address   上面的 OCServ Domain
```

### 一切就绪！

开始尽情冲浪吧！请问你是GG还是MM？

.

.

.


稍等 ……


上文是用自签证书来链接的，V2Ray/HTTP2/AnyConnect 默认都会提示 TLS 链接不受信任。上面的配置中 V2ray 已经开启了 `Allow Insecure` 选项，所以会忽略自签证书的安全问题。AnyConnect 检测到自签证书时也不会自动重连，如果你追求完美可以继续阅读下面 👇 的段落，来免费自动生成可信的 SSL 证书。放心不难的！


即使你没有自己的域名也可以尝试使用上面的 `xip.io` 来进行下面的步骤（只是成功率很低，因为LetsEnrypt 对域名的请求次数有限制，xip.io 的所有子域名公用限制次数……）。

----


## 背景知识

### 真假 TLS

SS/SSR 的 TLS 混淆并非是真正的 TLS 流量，而是通过伪装成 TLS 的特征来欺骗运营商/观察者，使其将其当做 TLS 流量。

`V2Ray/nghttpx/ocserv` 则是真正的 TLS，真正的 TLS 需要服务端有 SSL 证书，证书也分为自签和可信的两种。

### 自签证书和可信证书

简单来说，如果自签的证书，浏览器、AnyConnect 等客户端链接时都会显示一个安全警告（最常见的比如你访问 12306.cn）。如果你打算使用自签证书则不需要做任何额外的配置，LoveBundle 会自动生成。
可信的 SSL 并不会显示安全警告，你可以通过商店里的 [certbot](../developer/certbot.md) 来自动生成可信的SSL（LetsEncrypt）证书，LoveBundle 会自动在 certbot 目录中寻找指定域名的证书，如果没有找到则会自动生成自签证书。



## 获取可信的 SSL 证书

你上面应该也看到了，为了开启 LoveBundle 全部功能，我们共需要四个子域名：

* V2Ray TCP TLS
* V2Ray Websocket TLS
* HTTP2 (https)
* AnyConnect

### 使用 certbot 获取证书


先稍作准备……

1. 将你的域名解析到 VPS 上域名解析的相关介绍与方法见[域名解析的方法](../dns.md)。如果你没有域名可以参考 [如何获取免费顶级域名](../free-domain.md) 来注册一个免费的域名。
2. 参考 [certbot 教程](../developer/certbot.md) 来获取可信的 SSL 证书。


下面在 `HyperApp` 商店中，选择 `certbot` 并按下文填写配置：

1. 假设在 `1.` 中注册了 `love.ml` 域名，然后将 `v2ray-ws.love.ml` `v2ray-tls.love.ml` `http2.love.ml` `oc.love.ml` 分别指向到你的VPS IP上。
2. 然后在 `certbot` 的域名中填入四个域名，用英文逗号分隔， `v2ray-ws.love.ml,v2ray-tls.love.ml,http2.love.ml,oc.love.ml`。
3. 填入你的邮箱（邮箱将用来接收证书过期通知）
4. 配置完 `certbot` 后，点击 `安装`，运行结束后，`certbot` 的状态会变成 `existed xxx minutes` 成功后你会得到三个可信的 SSL 证书。
5. 更改 LoveBundle 的配置，分别填入对应的域名即可。LoveBundle 会自动去对应的目录寻找证书。
6. 点击 `LoveBundle` 菜单 `安装` 下面的 `更新配置` 将新的配置应用到 VPS 上面。

等待成功后，你的所有服务都是可信的 TLS 了！

----


## 结尾

。

。

。

。

。

。

。

。

。



### FAQ

#### LoveBundle 全开会占用多少内存？

服务全开的话 80M 左右


#### 我不想开启某个服务怎么办？

只要不填相关服务的域名即可，只要没有域名就不会开启服务。

#### 有问题解决不了怎么办？

不要找我私聊，进 [HyperApp Telegram 群](https://t.me/hyperapp) 详细描述你的配置方法以及为什么不能用即可。


