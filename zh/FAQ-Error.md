## 安装错误



#### 为什么在安装应用的时候.会卡在安装中非常久(这种情况多出现在国内VPS中)？

* 请先确定你的VPS可以正确联网再参考下列步骤:
  * 方法1: 在hyperapp终端左下角第一个按钮中.选择安装阿里云国内Docker源
  * 方法2: 阿里云用户请参考[使用阿里云镜像加速服务](Aliyun-docker.md)
  * 终极解决办法: 远离国内VPS.
  * 如果你使用的国外 VPS 依然非常慢，那估计是你VPS的网络比较慢，有些应用的镜像很大，下载需要时间。



#### 安装应用时提示`连接失败/无法连接/Transport read/Timeout`

1. 请不要打开VPN连接hyperapp.（或者在对应的App中加一条规则，设置你的服务器IP直连）
2. 检查服务器IP是否变了（GCP 如果没有用静态IP，服务器关机后再重启IP可能会变）
3. 检查SSH端口有没有填对（默认22）
4. 也许你的IP被墙了



#### 安装应用时提示`cannot connect to the Docker daemon`

1. 请确保你的 Linux 版本符合要求
2. 请确保一定要先安装 BBR 再安装应用，如果你不幸搞错了顺序，参考下一条
3. 尝试在终端的快捷命令中点击 `Start Docker` 手动启动下 Docker 或者启动任意一个应用



#### 安装应用时提示 `i686 not recognized platform`

- 系统必须是64位(X86-64)Linux系统
- 虚拟化方式不支持 OpenVZ



#### 安装应用时提示`Bind for ** failed:port is already allocated.`

* 端口重复了，不同的应用、进程不能使用同一个端口



#### 安装应用时提示`sudo: no tty present and no askpass program specified`

- 你需要修改 `sudo` 配置文件允许当前用户无密码运行 `sudo`



#### 安装应用时提示冲突如下`Error response from daemon: Conflict. The container name * is already used by container ....`

* 应用已经安装过了，更新了配置要点击“更新配置”



#### 安装应用时提示`docker command not found`

1. 确保你 VPS 的操作系统支持 Docker。
2. HyperApp 会自动安装 Docker，出现这类问题可能是 Docker 安装失败，你可以手动执行以下命令安装最新docker

```
curl -fsSL get.docker.com | sh
```



#### 如果先安装了`docker`再安装`bbr`导致无法启动`docker`怎么办?

* 执行以下命令清除docker网络配置.然后重新安装所有应用即可.

```
rm -rf /var/lib/docker/aufs
```

  

#### 操作Docker时提示权限不足(`Permission Denied`)

* 原因：当前用户没有docker权限，加到docker组才有，执行命令

```
sudo usermod -aG docker $USER
```



#### 安装应用时安装失败提示`overlay`已满

* 原因：已安装或者曾经安装过的应用太多，因为Docker自身的机制，删除容器并不会删除镜像，久而久之硬盘可能会被塞满

* 直接执行以下命令确认没有问题后输入Y进一步执行即可完成空间回收.

```
docker system prune --all --volumes
```

