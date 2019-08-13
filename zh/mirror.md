# 超简单搭建常见404站点镜像

> 众所周知.鉴于一些你懂的原因.有许多著名网站在国内无法访问.今天就教大家怎么做这些网站的镜像


## 更新记录

* 2018.08.23:镜像更新.修复了youtube不可以用的bug.并且优化了镜像设置
* 2017.12.18:压缩了镜像.
* 2017.10.11:修改了一下措辞

## 准备

* HyperApp
* 一个已经解析正确的域名（ping验证）
* 耐心.仔细.认真

## 提醒
* ~~由于`Zmirror`作者太久没有更新.本镜像不支持反向代理YouTube.可以自行学习 `You2PHP` 的相关设置.~~
* 在最新的更新中`YouTube`已经重新可用

## HyperApp设置服务端

1. 转到商店页面.找到`Docker Image`然后选择服务器并且保存进入配置界面
2. 请完全按照下图配置进行填写！

|    应用设置名称     |                   内容                   |
| :-----------: | :------------------------------------: |
|     Image     |        fanvinga/docker-zmirror         |
|    Options    | -e DOMAIN=你要给镜像站点的域名 -e GOAL=youtube |
|    Command    |                                        |
|     Args      |                                        |
| Nginx设置名称 |                 内容                 |
|      域名       |               你要给镜像站点的域名               |
|     应用端口      |                                        |
|     Https     |             将http重定向到https             |
|      域名       |            你要给镜像站点的域名（自动填写）            |
|      邮箱       |                域名所对应的邮箱                |


3. 保存并且进行安装.请确保这时候`Nginx Proxy`以及`Nginx SSL Support`正常默认安装并且启动了


## 代理站点设置

* 这里介绍一下`GOAL`所有可能的取值.请注意.如果要镜像`Google`请不要修改`GOAL`.即`options`里面只留下`-e DOMAIN=xxx`

* 另外当需要反向代理`Twitter`时请加入`-e FUNC=twitter`,别的网站并不需要.

   ```
     archive_org—————————Archive.org镜像
     duckduckgo——————————Duckduckgo镜像
     dropbox—————————————Dropbox镜像
     thumblr—————————————Thumblr镜像
     economist———————————Economist(经济学人)镜像
     thepiratebay————————Thepiratebay(海盗湾)镜像
     twitter_mobile——————Twitter手机版（和电脑要分开）
     twitter_pc——————————Twitter电脑版（和手机要分开）
     youtube—————————————Youtube镜像
     youtube_mobile——————Youtube手机版（要和电脑分开）
   ```

## 大功告成

* 这时候去访问你的域名吧٩(˃̶͈̀௰˂̶͈́)و



