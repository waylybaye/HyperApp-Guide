# 应用配置

在很多应用配置页面有类似的配置，这些有些是 Docker 的配置(Link, Volumes)，有些是 HyperApp 提供 HTTP 服务整合功能。

### Volumes
允许 docker 把应用数据保存到你的主机上。比如您安装了一个 MySQL 应用，就可以把数据保存到您的宿主机的一个目录里。


### Link Containers
默认设置下各个应用的网络是相互隔离的，如果您需要两个应用可以互相连接就需要 Link 功能，比如您的应用可能需要连接一个数据库，


### Custom Domain
是配合 nginx 使用的，它告诉 nginx 遇到访问该域名的请求时，把请求转发（反向代理）给当前应用。

* Host: 要反向代理的域名，多个域名用半角逗号隔开
* Port: 这个 Port 是 Ghost 进程监听的 Port，一般情况下并不需要填，因为会自动探测该端口。
* HTTPS: 这个是设置配置了HTTPS后怎么处理 HTTP 请求的，共有四个选项
    * 将所有 HTTP 的请求跳转到 HTTPS 上（默认）
    * 不跳转，让 HTTP 和 HTTPS 并存
    * 禁用 HTTP 请求，所有 HTTP 请求将会被丢弃
    * 禁用 HTTPS，只保留 HTTP

### SSL Support
配合 `Nginx SSL Support` 使用，当填入一个域名时它会使用 letsencrypt 自动请求并生成该域名的证书。此过程需要认证该域名所有权，请参考文章开头的说明。

* Host: 要生成证书的域名（默认会与上面的Nginx Host保持同步）
* Email: (必填) 用来管理域名证书的邮箱。 

