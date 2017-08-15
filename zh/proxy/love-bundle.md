# #LoveBundle - 一个应用满足你所有爱的幻想


### LoveBundle 是什么？

LoveBundle 是一个多合一的应用，LoveBundle 使用 haproxy 通过**域名**来自动分流各代理的流量，从而可以用一个端口（443）来提供所有类型的服务，但你需要为不同的代理使用不同的混淆域名。

比如当你使用 `bing.com:443` （可以自己定义域名）连接时 `LoveBundle` 会将其识别为 `SS` 流量，当你用 `cloudflare.com:443` 连接时会将其识别为 `V2Ray` 流量，使用 `my.name:443` 链接时会自动识别为 `AnyConnect` 流量。

**LoveBundle 在 HyperApp 3.0.1（TF）中才添加**


### LoveBundle 包含哪些应用？

* SS/tls 混淆
* V2Ray/TLS 
* V2Ray/WebSocket + TLS
* nghttpx HTTP2 TLS 代理
* ocserv: AnyConnect VPN

`LoveBundle` 可以配合 [certbot](../developer/certbot.md) 来自动生成可信的TLS证书。


## 背景知识（不感兴趣的可以跳过）

### 真假 TLS

SS/SSR 的 TLS 混淆并非是真正的 TLS 流量，而是通过伪装成 TLS 的特征来欺骗运营商/观察者，使其将其当做 TLS 流量。

`V2Ray/nghttpx/ocserv` 则是真正的 TLS，真正的 TLS 需要服务端有 SSL 证书，证书也分为自签和可信的两种。

### 自签证书和可信证书

简单来说，如果自签的证书，浏览器、AnyConnect 等客户端链接时都会显示一个安全警告（最常见的比如你访问 12306.cn）。
而可信的 SSL 并不会显示显示这个警告，你可以通过商店里的 [certbot](../developer/certbot.md) 来自动生成可信的SSL证书。


扯完了背景，下面开始吧

----

## 获取可信的 SSL 证书

注意如果你不需要可信的证书，你可以跳过本步骤，如果 LoveBundle 启动时没有找到对应域名的证书，会自动生成一个自签的证书。

### 使用 certbot 获取证书

参考上面的背景知识，如果我们想去掉安全警告，那么需要可信证书，下面简单几步得到证书。

1. 将你的域名解析到 VPS 上。如果你没有域名可以参考 [如何获取免费顶级域名](../free-domain.md) 来注册一个免费的域名。
2. 参考 [certbot 教程](../developer/certbot.md) 来获取可信的 SSL 证书。

具体配置：

1. 假设在 `1.` 中注册了 `love.ml` 域名，然后将 `v2ray.love.ml` `http2.love.ml` `oc.love.ml` 分别指向到你的VPS IP上。
2. 然后在 `certbot` 的域名中填入三个域名，用英文逗号分隔， `v2ray.love.ml,http2.love.ml,oc.love.ml`。
3. 安装 `certbot` 后你会得到三个可信的 SSL 证书，下面修改 LoveBundle 里面的域名配置。


### 修改 LoveBundle 配置

1. 修改 v2ray 的域名为 `v2ray.love.ml` 。
2. 修改 http2 的域名为 `http2.love.ml` 。
3. 修改 AnyConnect 的域名为 `oc.love.ml` 。
4. 保存后使用 `更新配置` 使其在服务器上生效。

现在修改你客户端的配置，分别使用上面对应的域名，再次链接是不是没有安全警告了！


## LoveBundle 配置

**小技巧：我没有域名怎么办？那你可以使用 `XX.XX.XX.XX.xip.io` 来连接你的服务器，这个域名会自动解析到前面的IP上**

在商店中点击 `LoveBundle`，在出现的配置页面中按如下填写：

```
* TLS Port          使用 TLS 的端口（推荐443）
* Username          用户名（此用户名可以用来登录 AnyConnect/HTTP2）
* Password          密码（此密码用来登录 SS/SSR/AnyConnect/HTTP2)

* SS Domain         SS TLS 混淆的域名，多个域名用英文逗号分隔开
* SS Method         SS 的加密协议

* SSR Domain        SSR TLS 混淆的域名，多个域名用英文逗号分隔开
* SRR Protocol      SSR 协议
* SSR Method        SSR 加密方法
 
* V2Ray TLS         V2Ray TLS 的域名，不支持多域名
* V2Ray WS          V2Ray WebSocket TLS 的域名，不支持多域名

* HTTP2 Domain      HTTP2 TLS Proxy 的域名，不支持多域名
* OCServ Domain     AnyConnect 的域名，不支持多域名，可以填写 IP
```


**其中 V2Ray TLS/WS 和 HTTP2/AnyConnect** 不支持多域名，并且都会在下面的 `certs` 目录里自动寻找证书），找不到就会生成自签证书。

### Volumes

```
certs   默认为 certbot 或者 Nginx SSL Support 的证书输出目录，
        LoveBundle 会自动在这里寻找可信的证书。
        如果找不到则会在下面的目录里生成自签证书。
CA      LoveBundle 用来生成自签证书以及VPN登录证书的目录
```


## 结尾

希望你能被世界所爱。


