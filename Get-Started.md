# Get Started

## 目录

* [部署Ghost](#部署Ghost)
* [支持HTTPS](#支持HTTPS)
* [部署MySQL](#部署MySQL)
* [部署WordPress](#部署WordPress)
* [部署ownCloud](#部署ownCloud])
* [备份数据](#备份数据)


### 部署Ghost


### 支持HTTPS

### 部署MySQL


### 备份数据

现在你的网站数据都保存在你服务器上的 `/srv/docker/` 目录下面各自应用的文件夹中，特别是域名的证书文件（默认保存在 `/srv/docker/certs` ）。

你可以跑个 `crontab` 每天压缩一下然后用 `s3cmd` 保存到 S3 上或者每天用你的电脑把数据 `scp` 下来。但对萌新来说可能还是太麻烦了，其实也有一个非常简单的办法 -- **把 ownCloud 的目录设置成 `/srv/docker`** 这样所有的服务器数据都保存在 ownCloud 里面了，客户端会自动同步到你的电脑上。

这样会备份所有应用的数据（如果你没有改应用 `Volume` 的主机路径的话）如果你只想备份某几个应用的数据则可以把对应应用的 `Volume` 设置到 ownCloud 的子目录下。




