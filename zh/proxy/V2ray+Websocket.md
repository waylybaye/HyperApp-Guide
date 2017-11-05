# V2Ray完美混淆教程（内含全平台客户端配置教程）



> **在国际形势如此严峻的今天.配置一个完美混淆的工具是非常有必要的.今天我们就来讲解.如何使用V2Ray配置websocket并且使用Nginx反向代理挂靠TLS证书**



### 本文原文链接为 https://vinga.fun/v2ray 原文更新更为及时

## 更新记录
- 2017.10.1:增加了网络拓扑部分.
- 2017.08.10:Replace the introduce of server setting.
- 2017.07.28:增加了一直相加但是懒癌发作没加的mac版config.json
- 2017.07.28:增加了安卓和win端客户端的链接并且调整了小火箭的图片排版
- 2017.07.27:增加了安卓端和win端的设置.并且与ios端并列

## 网络拓扑

![v2ray-0](./images/v2ray-0.jpg)

## 工具

- **hyperapp**
- **Mac/Win**
- **耐心**



## 准备工作



- **首先先按照之前的获取顶级域名教程.拿到属于你自己域名.并且将域名解析到VPS上面去.请确保解析正确后再进行以下步骤.如果已经有域名了直接进入下一步**
- **使用hyperapp安装Nginx Proxy以及Nginx SSL Support.保持默认配置即可.如有发生端口冲突则自行排查.经测试默认的80端口可以更改为8080.443端口更改会导致证书获取失败(仅限于本教程范畴)**



## 配置V2Ray服务端

![v2ray-1](./images/v2ray-1.jpg)

- **配置完后安装即可**



## 配置客户端连接

### 通用

- **注意保证客户端的ID以及alterID和服务端保持一致(在之后版本的hyperapp会添加多用户支持)**
- **注意选择网络类型为Websocket**
- **地址要填写你的域名.端口是443(也就是你的Nginx Proxy里面SSL Port请保持默认443不要更改.更改会导致出错)**

### ios&Mac

- **小火箭设置为以下选项即可正常连接**(**如果已经升级到2.1.13及其以上版本.混淆参数中不需要填写混淆域名**)
  ![v2ray-2](./images/v2ray-2.jpg)
- **如果你的代理工具是surge的话.配置文件请参考给出的config进行修改.默认开放127.0.0.1:10000作为本地socks代理端口并且将收到流量全部转发给vps.然后使用`/path/to/v2ray —config=/path/to/json`来启动本地v2ray.具体运行请到 https://www.v2ray.com/chapter_01/install.html 自行了解**
- **surge设置连接本地socks代理地址为127.0.0.1:10000即可**

```json
  {
    "log": {
      "loglevel": "warning"
    },
    "inbound": {
      "protocol": "socks",
      "listen": "0.0.0.0",
      "port": 10000,//这里要填写你打算在本地开放的socks代理端口
      "settings": {
        "auth": "noauth",
        "udp": true,
        "timeout": 30
      }
    },
    "inboundDetour": [],
    "outbound": {
      "protocol": "vmess",
      "settings": {
        "vnext": [
          {
            "address": "", //这里填写你分配给v2ray的域名
            "port": 443, //这里填写Nginx SSL的端口默认是443
            "users": [
              {
                "id": "",//这里填写的是你的UUID也就是一大长串的那个
                "alterId": ,//这里填写的是hyperapp里面配置的alterID.默认32
                "security": "aes-128-gcm"//这里选择一个加密方式.不了解这个请不要改.个人推荐这个
              }
            ]
          }
        ]
      },
      "streamSettings": {
        "network": "ws", 
        "security": "tls",
        "tlsSettings": {
      "serverName": "",//这里还要填写你分配给v2ray的域名
      "allowInsecure": false
       },
        "wsSettings": {
          "connectionReuse": true,
          "path": "" 
        }
      },
     "mux":{
         "enabled": true,
         "concurrency": 8
  }
  }
  } 
```

### 安卓&Win

- **安卓请下载V2rayNG程序(http://t.cn/R9U7Xl9 GooglePlay地址),开启后点选+,选择手动输入,并按照下列表格进行配置**
- **win则下载安装V2rayN(http://t.cn/R9UtWfJ 按照README来安装启动V2rayN).并且按照如下表格填写添加配置**
- **另外.win添加完配置之后正确启动了v2rayN并且没有报错之后.请让你的浏览器或者应用程序连接本地127.0.0.1:1080这个地址的socks代理.具体教程请根据你的程序/浏览器自行查找**

|  配置选项  |                   配置内容                   |
| :----: | :--------------------------------------: |
|   别名   |               自定义自己看的顺眼就行                |
|   地址   |               你给v2ray分配的域名               |
|   端口   | 443(也就是你的Nginx Proxy里面SSL Port请保持默认443不要更改.更改会导致出错) |
|  用户ID  |        hyperapp里面的uuid(也就是最长的那一串)        |
|  额外ID  |        填写hyperapp里面alterID(默认32)         |
|  加密方式  |          默认就可以(个人推荐aes-128-gcm)          |
|  传输协议  |                    ws                    |
|  伪装类型  |          none(下面一行tcp伪装域名留空不写)           |
| 底层传输安全 |                   tls                    |

## 请尽情享受安全的网络:)

- **疑问请加入hyperapp官方telegram群咨询@fanvinga**

## 写在最后

- **写了这么久.如果能有所收获那就是我最大的荣幸了:)**
- **如果可以的话.可以关注一下 https://vinga.fun 这是我的私人博客地址:)**
- **如有问题可发邮件至我邮箱fanalcest@gmail.com联系或telegram@fanvinga**

  <a href="https://vinga.fun"><img src="https://d.unlimit.fun/design/banner.png" alt="banner" target="_blank"></a>