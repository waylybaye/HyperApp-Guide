# SSR 教程

简介：SSR 是另一款代理软件（省略），官网 [https://github.com/shadowsocksr/shadowsocksr](https://github.com/shadowsocksr/shadowsocksr)

官方文档 [https://github.com/breakwa11/shadowsocks-rss/wiki](https://github.com/breakwa11/shadowsocks-rss/wiki)


## HyperApp 服务端配置

### 应用配置及安装

<img src="./images/ssr.jpg" width="450" />

* Port: 端口
* Password: 填一个密码
* Encrypt: 选择一种加密方式，推荐 none
* Protocol: 选择一种协议，推荐 `auth_chain_a`
* Protocol_param: 不用填
* Obfs: 如果你的运营商没有封锁 SS 可以选择 `plain`，如果你的运营商是小运营商，推荐选择 `tls1.2_ticket_auth` 或者 `http_simple`
* Obfs_params: 可以不填


## 客户端配置

你可以在官方文档里面找到所有平台的客户端下载地址 [https://github.com/breakwa11/shadowsocks-rss/wiki](https://github.com/breakwa11/shadowsocks-rss/wiki) 

配置客户端你可以手动填写配置，也可以在 `HyperApp` 中轻点服务器名选择 `QR` 然后用客户端扫码配置。

大功告成！

