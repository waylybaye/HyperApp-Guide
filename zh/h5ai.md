# 搭建精美H5AI文件服务器

> 很多人会遇到这样一个问题.有时候想方便快捷的下载或者分享VPS上面的一些文件.但是又不熟悉命令而且也不方便.这时候文件服务器就派上用场了.


## 更新记录

- 2017.09.02:重要更新!请所有看过这篇文章的朋友注意.镜像已经再次更新.体积缩小到110MB.同时功能更为丰富.另外挂载目录已修改以避免一些问题.请仔细查看文章图片.
- 2017.08.27:重要更新!把原来的docker换成我自己的镜像.做了大量的更新.

## 准备

* **Hyperapp**
* **一个已经解析正确的域名（ping验证）**
* **耐心.仔细.认真**


## 服务端部署

##### 首先我们先进入VPS的SSH窗口执行命令


```
sudo su
mkdir /share && chmod 777 /share
ln -s /share .
```
* 这时候/share就是共享目录并且已经软连接到/root目录下面.可以在root目录下面快速访问.也可以通过`cd /share`来访问
* 如果你想自定义目录也可以.替换/share即可.但是要注意权限设置


#### 其次转到Hyperapp进行设置

1. **转到商店页面.找到Docker Image然后选择服务器并且保存进入配置界面**
2. **请完全按照下图配置进行填写！**
   ![](./images/h5ai.png)
3. **保存并且进行安装.请确保这时候Nginx Proxy以及Nginx SSL Support正常默认安装并且启动了**


## 大功告成

* **这时候去访问你的域名吧٩(˃̶͈̀௰˂̶͈́)و**

## 写在最后

* 写了这么久.如果能有所收获那就是我最大的荣幸了:)
* 如果可以的话.可以关注一下 https://vinga.tech 这是我的私人博客地址:)
* 如有问题可发邮件至我邮箱fanalcest@gmail.com联系或telegram@fanvinga

<a href="https://vinga.tech"><img src="https://d.unlimit.fun/design/banner.png" alt="banner" target="_blank"></a>
