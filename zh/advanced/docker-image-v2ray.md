# Docker-image 部署 v2ray

本次教程介绍如何使用HyperApp中的DockerImage应用搭建V2ray，以实现自由度更大的配置方式。

我们先从 [DockerHub](https://hub.docker.com/) 通过搜索找到 V2ray 官方提供的镜像, 链接[在此](https://hub.docker.com/r/v2ray/official/)。我们可以发现，镜像名为v2ray,点击网页中的"tag"可以看出标签为`official` ,我们将这两个值其复制下来回到`DockerImage`中的`Image`出粘贴，即`v2ray:official`

在此之前,你需要在 /etc 目录下新建一个文件夹 v2ray, 并把你的配置写好后命令为 config.json 放入 v2ray 文件夹内。此处根据需求假设
```
设定的端口号为8888,需要映射到宿主机的8888端口上
需要把宿主机的/etc/v2ray文件夹映射到Docker中
```
以上需求转换为"Option"中的命令就是

```
-v /etc/v2ray:/etc/v2ray -p 8888:8888 
```
把上面的一段填入DockerImage中的`Option`中

然后根据V2ray官方Docker的说明可以得知

```
命令为  v2ray
参数为  -config /etc/v2ray/config.json
```
将其分别填入DockerImage中的`Command`和`Args`中

全部填好之后如下：

<img src="../images/dockerimage-v2ray-1.png" width="450" />

之后的使用和其他HyperApp中的App类似。
