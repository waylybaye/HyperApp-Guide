# 超简单搭建免翻墙Google搜索

> 很多人会遇到这样一个问题.有时候想用一下Google搜索.却苦于需要翻墙.打开各大代理工具稍显笨重.今天介绍一个不需要翻墙搭建Google反向代理的教程

## 原文地址: https://vinga.tech/google

## 更新记录

* 2017.09.05:Turn on gzip so speed up nginx.Please pull newer image.
* 2017.08.29:增加了默认语言的设置.更新了docker.详细设置见下文.

## 准备

* **Hyperapp**
* **一个已经解析正确的域名（ping验证）**
* **耐心.仔细.认真**


## Hyperapp设置服务端

1. **转到商店页面.找到Docker Image然后选择服务器并且保存进入配置界面**
2. **请完全按照下图配置进行填写！**

|    应用设置名称     |              内容               |
| :-----------: | :---------------------------: |
|     Image     | fanvinga/docker-google-mirror |
|    Options    |                               |
|    Command    |                               |
|     Args      |                               |
| **Nginx设置名称** |            **内容**             |
|      域名       |      你要给google-mirror的域名      |
|     应用端口      |                               |
|     Https     |        将http重定向到https         |
|      域名       |   你要给google-mirror的域名（自动填写）   |
|      邮箱       |           域名所对应的邮箱            |


3. **保存并且进行安装.请确保这时候Nginx Proxy以及Nginx SSL Support正常默认安装并且启动了**


## 默认语言设置

1. **如果你看到这里的时候已经安装过`Google-Proxy`那么请注意要先`pull image`**

2. **在`docker image`配置界面`optios`那个框填入`-e LANG=你要修改的语言简写`.然后选择更新配置.**

   ```
   ar    -> Arabic
   bg    -> Bulgarian
   ca    -> Catalan
   zh-CN -> Chinese (Simplified)
   zh-TW -> Chinese (Traditional)
   hr    -> Croatian
   cs    -> Czech
   da    -> Danish
   nl    -> Dutch
   en    -> English
   tl    -> Filipino
   fi    -> Finnish
   fr    -> French
   de    -> German
   el    -> Greek
   iw    -> Hebrew
   hi    -> Hindi
   hu    -> Hungarian
   id    -> Indonesian
   it    -> Italian
   ja    -> Japanese
   ko    -> Korean
   lv    -> Latvian
   lt    -> Lithuanian
   no    -> Norwegian
   fa    -> Persian
   pl    -> Polish
   pt-BR -> Portuguese (Brazil)
   pt-PT -> Portuguese (Portugal)
   ro    -> Romanian
   ru    -> Russian
   sr    -> Serbian
   sk    -> Slovak
   sl    -> Slovenian
   es    -> Spanish
   sv    -> Swedish
   th    -> Thai
   tr    -> Turkish
   uk    -> Ukrainian
   vi    -> Vietnamese
   ```

## 大功告成

* **这时候去访问你的域名吧٩(˃̶͈̀௰˂̶͈́)و**

<a href="https://vinga.tech"><img src="https://d.unlimit.fun/design/banner.png" alt="banner" target="_blank"></a>
