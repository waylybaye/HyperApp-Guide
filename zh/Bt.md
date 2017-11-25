# VPS上搭建高速BT下载服务

> **很多人觉得自己的VPS空着也是空着不如拿来发挥点余热.于是今天就给带来一篇在VPS上跑起来轻量化BT离线工具Cloudtorrent的教程.**


* **本文原文链接https://vinga.tech/bt**


## 更新记录

* 2017.10.12:增加了用法部分.并且增加了对502错误的解决方法
* 2017.10.02:增加了联合h5ai的部分


## 准备工作

* **运行了Hyperapp的ios设备**
* **一台VPS**



## Hyperapp配置

* **如果追求简单.直接通过ip+端口的形式就能访问的话参考如下配置**![bt-1](./images/bt-1.png)
* **如果追求可以通过域名来访问的话.参考如下配置**![bt-2](./images/bt-2.png)
* **注意方式一中端口可以自定义.**
* **注意方式二中一定要设置一个端口.Port和Nginx选项中应用端口要设置一个相同的不跟别的冲突的端口.建议34567.否则会报错502.**



## 服务器配置

1. **我们现在登录ip:端口或者你给cloudtorrent绑定的域名.就可以来到这样一个界面.**

![bt-3](./images/bt-3.jpg)

2. **先不要着急添加磁链或者BT开始下载.设置之前是没有速度的.先设置这个.![bt-4](./images/bt-4.jpg)**
3. **save了之后基本上就可以了.看不懂的选项就不去动他.**
4. **对于需要更高速度更高稳定性表现的.请自行添加tracker list.这里给一个连接**

   * ` https://github.com/ngosang/trackerslist/`

## 联合H5AI

- **参考这篇文章 https://vinga.tech/h5ai**

## 用法

- **下载完成之后.点击文件名即可下载.点击后面播放按钮即可播放**
- **在输入框中填你要搜索的资源.然后选择搜索源（默认海盗湾）搜索即可在线搜索种子并下载.**

## 写在最后

* **写了这么久.如果能有所收获那就是我最大的荣幸了:)**
* **如果可以的话.可以关注一下 https://vinga.tech 这是我的私人博客地址:)**
* **如有问题可发邮件至我邮箱fanalcest@gmail.com联系或telegram@fanvinga**


<a href="https://vinga.tech"><img src="https://d.unlimit.fun/design/banner.png" alt="banner" target="_blank"></a>


