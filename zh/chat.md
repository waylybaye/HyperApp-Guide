# 搭建HACK·CHAT即时通信平台

> 有时你需要临时发送一些比较隐私的东西.又不想直接在聊天软件中直接发送.这时候维护一个轻量的即时通信平台就派上用场了.只要在url后面随便加上一个单词就能创建你的会话.非常方便.

## 本文原文地址 https://vinga.tech/chat

## 更新记录

* 2018.09.07:更新了镜像.修复了无法正常转发websocket的严重bug.更新镜像即可.
* 2018.07.20: 根据最新的仓库地址彻底重构镜像.体积从147MB缩小为46.5MB.并且合并了上游文件的变更.增加了新的命令.使用了更彻底的前后端分离.提升了性能.新仓库地址为 https://github.com/hack-chat/main 如有需要请自行查看
* 2017.09.08: 修复了一个地址拼凑错误.如果部署不能用的.请pull一下最新的image.抱歉抱歉😂😂

## 准备

* HyperApp
* 一个已经解析正确的域名（ping验证）
* 耐心.仔细.认真

#### 到HyperApp进行设置

1. 转到商店页面.找到`Docker Image`然后选择服务器并且保存进入配置界面
2. 请完全按照下图配置进行填写！

|    应用设置名称     |            内容            |
| :-----------: | :----------------------: |
|     Image     | fanvinga/docker-hackchat |
|    Options    |                          |
|    Command    |                          |
|     Args      |                          |
| Nginx设置名称 |          内容          |
|      域名       |      你要给hackchat的域名      |
|     应用端口      |                          |
|     Https     |      将http重定向到https      |
|      域名       |   你要给hackchat的域名（自动填写）   |
|      邮箱       |         域名所对应的邮箱         |


3. 保存并且进行安装.请确保这时候`Nginx Proxy`以及`Nginx SSL Support`正常默认安装并且启动了


## 大功告成

* 这时候去访问你的域名吧٩(˃̶͈̀௰˂̶͈́)و

## 排错指引

* 如果点进去频道发现不能出来填写用户名的提示.即代表连接失败.按照以下步骤排查问题
  * 首先先`Pull Image`到最新镜像
  * 清除浏览器的缓存（可能缓存了错误的client.js）
  * 稍等一会等hyper的nginx把证书完全签发下来.因为链接过程会用到证书

## 温馨提示
* 如果您不打算对hack·chat部署https的话.您需要设置环境变量`-e PROTOCOL=ws`来直接映射端口等等操作
* 本镜像现在支持的环境变量如下.如有需要请自行替换
  * ADMIN_NAME=admin
  * ADMIN_PASSWORD=password
  * PASSWORD_SALT=salt
  * PROTOCOL=wss

<a href="https://vinga.tech"><img src="https://vinga.tech/images/banner.png" alt="banner" target="_blank"></a>
