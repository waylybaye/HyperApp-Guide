# OpenConnect (AnyConnect 服务端）配置教程


## HyperApp 配置

<img src="./images/ocserv.jpg" width="450" />

* Port: 端口，一般为443，也可以改成别的端口
* Domain: 填写你服务器的IP地址或者域名
* Username：用户名
* Password：密码
* Create self-signed certificate: 使用自签服务器证书。如果你使用IP访问或者你的域名没有SSL证书则选中此项（默认选中）否则请关闭。
* Network：客户端连接后分配的IP地址

### 使用自定义服务器证书

注意：使用自定义服务器证书需要关闭上面的 `Create self-signed certificate` 选项。

certs: 这儿默认使用 `Nginx SSL Support` 的证书保存目录。如果你想用 `Nginx SSL Support` 保管证书等待自动生成证书即可，不需要额外配置。如果你想使用自定义证书则需要在这个目录下提供两个文件，这儿的 Domain 需要和上面配置的 IP或者域名一致。

* `DOMAIN.crt`: 证书文件，如 `my.com.crt`
* `DOMAIN.key`: 密钥文件，如 `my.com.key`

### 自签证书和使用 LetsEncrypt 证书的区别

使用自签证书时，Cisco AnyConnect 每次连接开始时都会弹出安全警告，验证成功后还会再次弹出一遍警告。但是用 `Nginx SSL Support` 生成的证书就不会。


## 客户端配置

### 下载客户端

* iOS/Android: 搜索 Cisco AnyConnect
* Mac/Windows: [Cisco 官网下载地址 (需要注册)](http://www.cisco.com/c/en/us/support/security/anyconnect-secure-mobility-client/tsd-products-support-series-home.html)
* [V2EX 网友维护的下载](https://dl.xxshe.com/)

### 连接服务器

在客户端中通过域名或者IP连接即可，如果你更改了默认的443端口则填入 `IP:PORT` 或者 `Domain:PORT` 的形式。随后一次输入用户名 密码即可。

### 使用证书登录 

使用密码登录时每次重连都需要输入密码有点不方便，使用证书登录就方便很多。

你可以在上面配置界面 `certs` 所选的 `/srv/docker/certs` 目录下找到一个 `*.p12` 文件，格式为 `用户名@域名.p12` 将这个文件下载到系统中，Mac上可以用 `钥匙串访问` 直接打开，然后选择导入证书，密码为上面配置的密码。

导入后点击连接就会自动认证了，不需要手动填写密码。


