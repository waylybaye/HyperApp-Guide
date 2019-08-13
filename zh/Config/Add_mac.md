# 如何添加 macOS


## 1. 开启远程登录

1. 点击最顶部的左上角的【 → 系统偏好设置】
2. 选中【共享 → 远程登录】


## 2. 添加 macOS
1. 点击【添加服务器】
2. 地址中填入你的 Mac IP 地址，你可以按住 `option` 键然后鼠标点击顶部菜单栏的 `Wifi` 图标查看 IP 地址，端口不用改。
3. 填入你的 macOS 用户名和密码，关闭 `自动使用sudo` 选项。



## 3. 设置 Docker 环境


### 3.1 安装 Docker

在 [Docker 官网下载并安装 Docker](https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac)


### 3.2 配置 SSH

docker 和 homebrew 安装的应用一般都在 `/usr/local/bin` 下面（你可以运行 `which docker` 来验证），但 SSH 登录时的默认环境变量 `PATH` 并不包含此路径，所以需要改下 `sshd` 的配置。让 HyperApp 能够正确找到 docker 可执行文件。


#### 手动设置

1. 运行 `sudo vi /etc/ssh/sshd_config`
2. 找到 `PermitUserEnvironment` 这一行，删掉前面的注释`#` 并且改成 `PermitUserEnvironment yes`
3. 运行 `vi ~/.ssh/environment` 添加一行 `PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin` 设置 `PATH` 变量
4. 运行 `sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist` 关闭 sshd
5. 运行 `sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist` 重新开启 sshd


#### 没验证的一键脚本

```bash
sudo echo 'PermitUserEnvironment yes' >> /etc/ssh/sshd_config && \
echo 'PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin' >> ~/.ssh/environment && \
sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist && \
sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist && \
echo "完工"
```


#### 验证是否修改成功


在你 macOS 上执行 `ssh $USER@localhost env`，查看 `PATH` 是否被成功修改了


#### 使用代理

如果你安装速度很慢，想使用代理的话，可以修改 `environment` 文件添加 `http_proxy 变量`


```bash
$ tail ~/.ssh/environment
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
http_proxy=http://127.0.0.1:6152
https_proxy=http://127.0.0.1:6152
```


## 大功告成
