# 自建网页版speedtest测速教程

## 更新记录

* 2018.7.11:制作轻量化镜像

## 准备

* HyperApp
* 一个已经解析正确的域名
* 耐心.仔细.认真

#### 到 HyperApp 进行设置

1. 转到商店页面.找``Docker Image``然后选择服务器并且保存进入配置界面
2. 请完全按照下图配置进行填写！


|   应用设置名称    |               内容                |
| :---------------: | :-------------------------------: |
|       Image       |     fanvinga/docker-speedtest     |
|      Options      |                                   |
|      Command      |                                   |
|       Args        |                                   |
| Nginx设置名称 |             内容              |
|       域名        |       你要给speedtest的域名       |
|     应用端口      |                80                 |
|       Https       |        将http重定向到https        |
|       域名        | 你要给speedtest的域名（自动填写） |
|       邮箱        |         域名所对应的邮箱          |

* 没有填写的设置即为留空
* 保存并且进行安装.请确保这时候``Nginx Proxy``以及``Nginx SSL Support``正常默认安装并且启动了
## 大功告成

* 这时候去访问你的域名吧٩(˃̶͈̀௰˂̶͈́)و

![speedtest](../../images/speedtest-1.png)

## 温馨提示

* 源码来自于 https://github.com/adolfintel/speedtest 我做了一定的自定义工作并且制作了使用 nginx + php-fpm 架构的docker image (355MB->19.6MB)



