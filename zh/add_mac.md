# 如何添加 Mac


## 1. 开始远程登录

1. 点击最顶部的左上角的【 → 系统偏好设置】
2. 选中【共享 → 远程登录】


## 2. 添加 Mac
1. 点击【添加服务器】
2. 地址中填入你的 Mac IP 地址，你可以按住 `option` 键然后鼠标点击顶部菜单栏的 `Wifi` 图标查看 IP 地址
3. Mac 的用户名一般不是 root，你需要关闭 `自动使用sudo` 选项。



## 3. 设置 Docker 环境


### 3.1 安装 Docker

在 [Docker 官网下载并按照 Docker](https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac)


### 3.2 配置 SSH

docker 一般安装在 `/usr/local/bin` 下面（你可以运行 `which docker` 来验证），但 SSH 登录时的默认环境变量 `$PATH` 并不包含此路径，所以需要改下 `sshd` 的配置。

1. 运行 `sudo vi /etc/ssh/sshd_config`
2. 找到 `PermitUserEnvironment` 这一行，取消注释并且改成 `PermitUserEnvironment yes`
3. 运行 `vi ~/ssh/environment` 添加一行 `PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin` 设置 PATH 变量
4. 运行 `sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist` 关闭 sshd
5. 运行 `sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist` 重新开启 sshd


## 大功告成
