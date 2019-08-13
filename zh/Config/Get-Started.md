# Get Started

这篇教程会讲述如何利用 HyperApp 在同一台服务器上部署网站或者其它基于HTTP服务的应用，并会自动生成SSL证书。


**注意事项**：

* 在进行操作前请先将您的域名解析到该服务器上（新的域名或二级域名一般会即时生效，如果修改现有的域名可能需要48小时），HTTPS证书生成过程中需要回访该域名确认您具有域名的拥有权，如果自动生成证书时您没有将域名解析到服务器上，会导致认证失败无法生成。
* 不同的应用不要使用同一个域名。
* Nginx 和 SSL 的“域名”选项中不能使用IP。
* GCE/AWS 等需要在控制台的防火墙中手动开启

## 目录

* [前言](#前言)
* [配置Nginx和HTTPS](#配置nginx和https)
* [部署MySQL](#部署mysql)
* [部署Ghost](#部署ghost)
* [部署WordPress](#部署wordpress)
* [部署ownCloud](#部署owncloud])
* [FAQ](#faq)
<!--* [备份数据](#备份数据)-->

---

### 前言

注意，很多非技术用户分不清端口直接访问与反向代理的区别。

应用有两种访问方式：

1. 通过主机端口直接对外服务
2. 通过 nginx 反选代理来提供服务

前者不需要填写 Nginx 和 SSL 的配置，只要在各个应用的配置页面中输入一个端口就可以通过 http://服务器IP:端口/来访问了。

后者需要在同一台服务器上安装 Nginx （SSL 可选）并且在 Nginx 的配置中输入一个域名，然后可以通过 http://刚才的域名/ 来访问。


### 配置Nginx和HTTPS

![配置Nginx截图](https://github.com/waylybaye/HyperApp-Guide/raw/master/images/get-start/nginx-bundle.png "配置 Nginx 和 SSL")

- 最新测试版中已经移除了"Default Host"一栏，此处可不填写。


### 安装 Nginx

1. 前往 `Store` 安装 `nginx`
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


### 部署MySQL

我们先部署一个 MySQL 到服务器上，因为下面的 Ghost/WordPress/ownCloud 都需要 MySQl 用来保存数据。在配置页面只要填入 `root password` 就好，其它的配置项都不需要填。

<img src="https://github.com/waylybaye/HyperApp-Guide/raw/master/images/get-start/mysql-setup.png" width="350" style="border: 1px solid #ddd;padding: 10px;" alt="MySQL 配置截图"/>

---

### 部署Ghost

![配置 Ghost n截图](https://github.com/waylybaye/HyperApp-Guide/raw/master/images/get-start/ghost-bundle.png "配置 Ghost")

创建一个 Ghost，第一个 Port 不需要填，因为我们不需要让外部直接访问 ghost，我们会把 Ghost 放在 nginx 后面。

**Volumes**  
允许 docker 把应用数据保存到你的主机上。下面的 `Data dir` 就是 ghost 的所有配置文件的保存地方。

**Link Containers**  
在这里选择你创建的 mysql 让 ghost 可以通过内部网络访问 mysql 服务器


**Custom Domain**  
是配合 nginx 使用的，它告诉 nginx 遇到访问该域名的请求时，把请求转发（反向代理）给当前应用。

* Host: 要反向代理的域名，多个域名用半角逗号隔开
* Port: 这个 Port 是 Ghost 进程监听的 Port，一般情况下并不需要填，因为会自动探测该端口。
* HTTPS: 这个是设置配置了HTTPS后怎么处理 HTTP 请求的，共有四个选项
    * 将所有 HTTP 的请求跳转到 HTTPS 上（默认）
    * 不跳转，让 HTTP 和 HTTPS 并存
    * 禁用 HTTP 请求，所有 HTTP 请求将会被丢弃
    * 禁用 HTTPS，只保留 HTTP

**SSL Support**  
配合 `Nginx SSL Support` 使用，当填入一个域名时它会使用 letsencrypt 自动请求并生成该域名的证书。此过程需要认证该域名所有权，请参考文章开头的说明。

* Host: 要生成证书的域名（默认会与上面的Nginx Host保持同步）
* Email: (必填) 用来管理域名证书的邮箱。 

#### 配置 Ghost

现在您可以访问您设置的域名啦，在浏览器中打开 http://[YOUR-Domain].com 是不是看到了 Welcome to Ghost 的欢迎页面，下面按照 Welcome to Ghost 中所说的，打开 http://[Your-Domain].com/ghost 页面安装 Ghost 吧

---

### 部署 WordPress

WordPress 的安装和 Ghost 基本一致，只不过 WordPress 本身的安装界面略微和 Ghost 不同。

**Config && Link Containers**  
您只需要在这里填写 `DB name` 就可以了，下面的所有连接参数都可以省掉，然后再 `Link containers` 选择你的 MySQL 应用，会自动连接到 MySQL。

如果您要连接外部的 MySQL 服务，请详细填写 host,port,user,password 信息。

Public Port: 是绕过 nginx 直接对外提供服务的端口，如果您不需要 nginx 那么这儿可以填 80 让 WordPress 直接提供服务。

**Custom Domain && SSL Support**  
此处和 Ghost 一致，您按需要填写域名就可以了。

---

### 部署 ownCloud

![配置 ownCloud 截图](https://github.com/waylybaye/HyperApp-Guide/raw/master/images/get-start/owncloud-bundle.png "配置 ownCloud")

#### HyperApp 配置 
* Port 同样是直接对外提供服务的端口
* Volumes ownCloud 会将所有数据保存到服务器上的这个目录中，您可以配合下面的 (备份数据)(#备份数据) 使用。
* Link containers: mysql 如果您需要使用 mysql 而不是内置的 SQLite 请在此处选择您的 MySQL 实例。
* Custom Domain 和 SSL Support 同上。

#### ownCloud 配置
在欢迎界面，您需要像Ghost/Wordpress一样创建一个账号。但是与上面不同的是 ownCloud 提供了使用 SQLite 还是 MySQL 的选项。

如果您要使用 MySQL 服务器，请手动填写您的 root 账号和密码，在数据库那里填一个新的数据库，下面的 MySQL host 直接填 `mysql`，不要填 localhost 等。

<!-----

### 备份数据

现在你的网站数据都保存在你服务器上的 `/srv/docker/` 目录下面各自应用的文件夹中，特别是域名的证书文件（默认保存在 `/srv/docker/certs` ）。

你可以跑个 `crontab` 每天压缩一下然后用 `s3cmd` 保存到 S3 上或者每天用你的电脑把数据 `scp` 下来。但对萌新来说可能还是太麻烦了，其实也有一个非常简单的办法 -- **把 ownCloud 的目录设置成 `/srv/docker`** 这样所有的服务器数据都保存在 ownCloud 里面了，客户端会自动同步到你的电脑上。

这样会备份所有应用的数据（如果你没有改应用 `Volume` 的主机路径的话）如果你只想备份某几个应用的数据则可以把对应应用的 `Volume` 设置到 ownCloud 的子目录下。-->


## FAQ

#### 为何要使用 Nginx ？

因为 HTTP/HTTPS 服务一般共用 80/443 端口，如果您想在一个服务器上跑多个网站进程，并且将不同的域名映射到不同的后台进程上（例如WordPress/Ghost/ownCloud 各一个）那么就需要用 Nginx 做反向代理。


#### 什么是 Link ?

默认情况下docker下各应用（容器）的网络是隔离的，比如 mysql 容器里在 3306 端口监听连接，但是在其它容器里别人是访问不到3306端口的，除非把它 Publish 到主机的一个端口上，这样访问主机的某个端口就会被映射到 mysql 容器内的 3306 端口上。 

但 Link 可以让容器间互相访问。  

为了安全考虑建议用户不要在端口那里将容器的3306端口发布到主机端口上，防止恶意程序探测并且暴力猜密码。而是使用 Link的方法，让别的容器可以访问 MySQL。

**数据库连接提示** 任何连接了 mysql 的应用在应用本身的安装界面如果要您输入数据库地址那么直接输入 `mysql` 而不是 localhost 或者 127.0.0.1 或者您的服务器 IP。


