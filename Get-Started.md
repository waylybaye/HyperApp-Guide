# Get Started

这篇教程会讲述如何利用 HyperApp 部署 Ghost/WordPress等，并会自动生成证书。

*NOTE*: 在进行操作前请先将您的域名解析到该服务器上（新的域名或二级域名一般会即时生效，如果修改现有的域名可能需要48小时），HTTPS证书生成过程中需要回访该域名确认您具有域名的拥有权，如果自动生成证书时您没有将域名解析到服务器上，会导致认证失败无法生成证书。


## 目录

* [部署Ghost](#部署Ghost)
* [配置Nginx和HTTPS](#配置Nginx和HTTPS)
* [部署MySQL](#部署MySQL)
* [部署WordPress](#部署WordPress)
* [部署ownCloud](#部署ownCloud])
* [备份数据](#备份数据)

### 部署MySQL



### 部署Ghost


### 配置Nginx和HTTPS

#### 为何要使用 Nginx ？

因为 HTTP/HTTPS 服务一般共用 80/443 端口，如果您想在一个服务器上跑多个网站进程（例如WordPress/Ghost/ownCloud 各一个）那么就需要用 Nginx 做反向代理。

#### 安装步骤

1. 前往 `Store` 安装 `nginx`
2. 配置页面采用默认的配置分别设定HTTP/HTTPS 端口为80,443
3. `Volumes` 都有默认配置，你可以随意更改 SSL Certs,Config dir,HTML dir的路径，但`Docker Sock` 的值必须为 `docker` 守护进程的socket文件
3. 将 `nginx` 部署到服务器上
1. 前往 `Store` 安装 `Nginx SSL Support`。
2. 在设置页面确保几个 `Volumes` 的路径和 `nginx` 的设置一样，并且在下面 `Share Volumes` 中选择 `nginx` 镜像，允许访问 `nginx` 的文件系统
3. 将 `Nginx SSL Support` 部署到同一台服务器上


*Nginx 会自动监听其它应用里面设置的 `Custom Domain` 值，并自动重启服务* 所以你在部署  Ghost/WordPress/ownCloud 后不用手动重启 `nginx`。  

*Nginx SSL Support 会自动监听其它应用里面 `SSL Support` 相关设置，并自动生成证书*，生成证书的过程会需要几分钟或者十几分钟的时间，在这个过程中你访问 https 连接会出现 `Bad Gateway` 的错误信息，稍等片刻就好。（你可以查看Log获取更多信息）  





### 备份数据

现在你的网站数据都保存在你服务器上的 `/srv/docker/` 目录下面各自应用的文件夹中，特别是域名的证书文件（默认保存在 `/srv/docker/certs` ）。

你可以跑个 `crontab` 每天压缩一下然后用 `s3cmd` 保存到 S3 上或者每天用你的电脑把数据 `scp` 下来。但对萌新来说可能还是太麻烦了，其实也有一个非常简单的办法 -- **把 ownCloud 的目录设置成 `/srv/docker`** 这样所有的服务器数据都保存在 ownCloud 里面了，客户端会自动同步到你的电脑上。

这样会备份所有应用的数据（如果你没有改应用 `Volume` 的主机路径的话）如果你只想备份某几个应用的数据则可以把对应应用的 `Volume` 设置到 ownCloud 的子目录下。




