# 超简单搭建免翻墙Google搜索

> 很多人会遇到这样一个问题.有时候想用一下Google搜索.却苦于需要翻墙.打开各大代理工具稍显笨重.今天介绍一个不需要翻墙搭建Google反向代理的教程

## 原文地址: https://vinga.tech/google

## 更新记录

* 2017.08.29:增加了默认语言的设置.更新了docker.详细设置见下文.

## 准备

* **Hyperapp**
* **一个已经解析正确的域名（ping验证）**
* **耐心.仔细.认真**


## Hyperapp设置服务端

1. **转到商店页面.找到Docker Image然后选择服务器并且保存进入配置界面**
2. **请完全按照下图配置进行填写！**
   ![](./images/google-1.jpg)
3. **保存并且进行安装.请确保这时候Nginx Proxy以及Nginx SSL Support正常默认安装并且启动了**


## 默认语言设置(默认中文)

1. **VPS执行`docker ps`找到`Google-Proxy`应用的`CONTAINER ID`.一般是一个十二位的字符串.**
2. **执行`docker exec -it '上面的CONTAINER ID' sh`进入`docker`内部**
3. **执行`vi /opt/nginx/conf/nginx.conf`把`zh-CN`修改为下列对应语言.修改完成保存并且重启应用**

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

## 写在最后

* 写了这么久.如果能有所收获那就是我最大的荣幸了:)
* 如果可以的话.可以关注一下 https://vinga.tech 这是我的私人博客地址:)
* 如有问题可发邮件至我邮箱fanalcest@gmail.com联系或telegram@fanvinga

<a href="https://vinga.tech"><img src="https://d.unlimit.fun/design/banner.png" alt="banner" target="_blank"></a>
