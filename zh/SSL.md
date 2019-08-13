# 如何使用域名访问并自动生成可信的 SSL 证书

如果你想用域名访问你在 HyperApp 里管理的服务器，并且希望用域名来访问你部署的应用，那么可以照此教程操作。下文以 `hyperapp.io` 为例，讲述如何生成 SSL 证书。

## 配置域名 DNS
1. 建议添加一个二级域名 `A 记录` 指向你的 VPS。比如建一个 `gce-ac.hyperapp.io` 二级域名 `A 记录` 到 你 VPS 的 IP上 `104.155.xx.xx`。
2. 其它的二级域名都 `CNAME` 到 `gce-ac.hypeapp.io`。这样的好处是如果 IP 变了只要改一下 `gce-ac` 的 IP 地址所有其它二级域名也就跟着变了，不用一个个改。

现在你可以 `ping gce-ac.hyperapp.io` 就会显示它的IP，应该和你上面设置的记录一致（如果是新加的二级域名则会马上生效，如果是修改了现有的值则48小时内生效）


## 安装 Nginx 作为 Web 服务器

如果要自动生成域名的 SSL 证书则需要配合 `Nginx Proxy` 和 `Nginx SSL Support` 来进行，因为 LetsEncrypt 需要回访你的域名确认你拥有这个域名的所有权。所以在进行下面的操作前，你需要先将需要生成证书的域名解析到你的服务器上。否则无法验证就不能生成证书。


![配置Nginx截图](../..//images/get-start/nginx-bundle.png "配置 Nginx 和 SSL")


### 安装 Nginx Proxy

1. 前往 `Store` 安装 `Nginx Proxy`
2. 配置页面采用默认的配置分别设定HTTP/HTTPS 端口为80,443
3. `Volumes` 都有默认配置，你可以随意更改 SSL Certs,Config dir,HTML dir的路径，但`Docker Sock` 的值必须为 `docker` 守护进程的socket文件
3. 将 `nginx` 部署到服务器上

*Nginx 会自动监听其它应用里面设置的 `Custom Domain` 值，并自动重启服务* 所以你在新部署 Ghost/WordPress/ownCloud 后以及更改了配置后不用手动重启 `nginx`。  


### 安装 Nginx SSL Support

1. 前往 `Store` 安装 `Nginx SSL Support`。
2. 在设置页面确保几个 `Volumes` 的路径和 `nginx` 的设置一样，并且在下面 `Share Volumes` 中选择 `nginx` 镜像，允许访问 `nginx` 的文件系统
3. 将 `Nginx SSL Support` 部署到同一台服务器上

*Nginx SSL Support 会自动监听其它应用里面 `SSL Support` 相关设置，并自动生成证书*，生成证书的过程会需要几分钟或者十几分钟的时间，在这个过程中你访问 https 会出现 `502 Bad Gateway` 的错误信息，稍等片刻就好。

你可以查看Log获取更多信息，参考上图中最后一个截图。

---

## 生成 SSL 证书

安装完了 Nginx 下面就可以自动生成 SSL 证书了，如果你要为指定域名生成证书需要进行下面的操作。

1. 如果你只想要证书，而不想配置应用则在商店里任意选择一个应用，推荐 `Apache`
2. 如果你想创建其它应用并自动配置 Nginx 反代则在商店里面选择你想创建的应用

不管你选择了哪一步，则创建应用后在出现的配置界面中，都可以在下面看到一个 `显示 Nginx 和 SSL 选项` 的按钮，打开后可以看到下面两部分的配置：

**Custom Domain （自定义域名）**  
是配合 nginx 使用的，它告诉 nginx 遇到访问该域名的请求时，把请求转发（反向代理）给当前应用。

* Host: 要反向代理的域名，多个域名用半角逗号隔开（比如我们填入 hyperapp.io)
* Port: 这个 Port 是 Ghost 进程监听的 Port，一般情况下并不需要填，因为会自动探测该端口。
* HTTPS: 这个是设置配置了HTTPS后怎么处理 HTTP 请求的，共有四个选项
    * 将所有 HTTP 的请求跳转到 HTTPS 上（默认）
    * 不跳转，让 HTTP 和 HTTPS 并存
    * 禁用 HTTP 请求，所有 HTTP 请求将会被丢弃
    * 禁用 HTTPS，只保留 HTTP

**SSL Support**  
配合 `Nginx SSL Support` 使用，当填入一个域名时它会使用 letsencrypt 自动请求并生成该域名的证书。

* Host: 要生成证书的域名（默认会与上面的Nginx Host保持同步，所以如果填了上面的域名，此处会自动输入 hyperapp.io）
* Email: (必填) 用来管理域名证书的邮箱。 

现在，只要在服务器上安装这个应用就可以了，等安装成功后，稍等两分钟你在浏览器中打开 `https://你的域名` 应该就可以访问了！你也可以查看 `Nginx SSL Support` 的日志，里面会有过程记录。证书生成后会默认保存在 `/srv/docker/certs/` 目录下面（如果你没有改配置的话）。


