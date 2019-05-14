# 超简单搭建免翻墙Google搜索

> 很多人会遇到这样一个问题.有时候想用一下Google搜索.却苦于需要翻墙.打开各大代理工具稍显笨重.今天介绍一个不需要翻墙搭建Google反向代理的教程

## 原文地址: https://vinga.tech/google

## 更新记录

* 2018.07.30:使用了新的镜像来制作更加稳定的google镜像.[基于Ezgoo](github.com/Lafeng/ezgoo).原镜像已删除.
* 2017.09.05:Turn on gzip so speed up nginx.Please pull newer image.
* 2017.08.29:增加了默认语言的设置.更新了docker.详细设置见下文.

## 准备

* HyperApp
* 一个已经解析正确的域名（ping验证）
* 耐心.仔细.认真


## HyperApp设置服务端

1. 转到商店页面.找到`Docker Image`然后选择服务器并且保存进入配置界面
2. 请完全按照下图配置进行填写！

|   应用设置名称    |             内容              |
| :---------------: | :---------------------------: |
|       Image       |     fanvinga/docker-ezgoo     |
|      Options      |                               |
|      Command      |                               |
|       Args        |                               |
| Nginx设置名称 |           内容            |
|       域名        |       你要给ezgoo的域名       |
|     应用端口      |                               |
|       Https       |      将http重定向到https      |
|       域名        | 你要给ezgoo的域名（自动填写） |
|       邮箱        |       域名所对应的邮箱        |


3. 保存并且进行安装.请确保这时候`Nginx Proxy`以及`Nginx SSL Support`正常默认安装并且启动了


## Ezgoo设置

* 如果您需要自定义有关ezgoo的设置.可以访问[Ezgoo的源码仓库](github.com/Lafeng/ezgoo)获取dist目录中的的有关设定.修改完毕后使用参数`-v /path/to/dist:/app/dist`并更新配置即可应用.

## 大功告成

* 这时候去访问你的域名吧٩(˃̶͈̀௰˂̶͈́)و


<a href="https://vinga.tech"><img src="https://vinga.tech/images/banner.png" alt="banner" target="_blank"></a>
