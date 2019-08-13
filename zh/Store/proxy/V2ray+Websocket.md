# V2Ray完美混淆教程（内含全平台客户端配置教程）



> **在国际形势如此严峻的今天.配置一个完美混淆的工具是非常有必要的.今天我们就来讲解.如何使用V2Ray配置websocket并且使用Nginx反向代理挂靠TLS证书**




## 更新记录
* 2018.07.31:去除了不必要的图片加快渲染速度.更新了部分说明.
* 2017.12.01:修改了方法一的命令部分.更直观.
* 2017.10.22:增加了完美融合页面的部分
* 2017.10.12:修改了Win客户端部分
* 2017.10.01:增加了网络拓扑部分.
* 2017.08.10:替换服务器设置的介绍.
* 2017.07.28:增加了一直相加但是懒癌发作没加的mac版config.json
* 2017.07.28:增加了安卓和Win端客户端的链接并且调整了小火箭的图片排版
* 2017.07.27:增加了安卓端和Win端的设置.并且与ios端并列



## 网络拓扑

![v2ray-0](.../../images/v2ray-0.jpg)



## 工具

* HyperApp
* Mac/Win
* 耐心



## 准备工作

* 首先先按照之前的获取顶级域名教程.拿到属于你自己域名.并且将域名解析到VPS上面去.请确保解析正确后再进行以下步骤.如果已经有域名了直接进入下一步
* 使用HyperApp安装`Nginx Proxy`以及`Nginx SSL Support`.保持默认配置即可.如有发生端口冲突则自行排查.`Nginx`的端口请不要修改.否则可能导致无法连接的问题(仅限于本教程范畴)



### 配置服务端（方法一）



> 一直以来.虽然v2ray有完整的tls实现等等好处.但是一直有个小缺陷就是访问证书域名会有一个`bad request`的提示.虽然也可以用错误跳转的方法跳转到正常页面.但毕竟不是原来的域名.今天给出一个真正完美的办法



* 按照我博客别的任意一篇文章部署一个用``Nginx Proxy``反向代理的网站.我比较建议是[H5AI](https://vinga.tech/h5ai).确定可以正常访问之后继续下面的步骤.
*  按照下图去部署一个`V2Ray.`
   * 注意不要开启`TLS`.
   * 不要展开`Nginx`选项.
   * 除了端口和`UUID`别的都不要动. 

| 应用设置名称 |                 内容                 |
| :----------: | :----------------------------------: |
|     Port     |                56789                 |
|   Network    |                  ws                  |
|    Header    |                 none                 |
|   ID(UUID)   | DC9075E8-FC60-49CA-8314-F0CB344EF60A |
|    Level     |                  1                   |
|   alterID    |                  32                  |

* 自行替换中文提示内容.然后完整复制到`终端SSH`执行.

```
IP=你的IP;Port=V2Ray的端口;DOMAIN=目标域名
cat << EOF > /srv/docker/nginx/vhost.d/${DOMAIN}_location
proxy_redirect off;
if (\$http_upgrade = "websocket"){
       proxy_pass http://${IP}:${Port}; 
    }
EOF
```

*  执行没有问题(没有任何报错提示)之后.点击`Nginx Proxy`选择重启.稍等片刻.先访问网页确定没有问题.然后按照下面的客户端连接照常链接.记得开启`TLS`.端口连接443.

### 配置服务端（方法二）

* 按照下图去部署一个`V2Ray`.配置完后安装即可


|     应用设置名称      |                 内容                 |
| :-------------------: | :----------------------------------: |
|         Port          |        自定义一个未使用的端口            |
|        Network        |                  ws                  |
|        Header         |                 none                 |
|       ID(UUID)        | DC9075E8-FC60-49CA-8314-F0CB344EF60A |
|         Level         |                  1                   |
|        alterID        |                  32                  |
|      Enable TLS       |                 关闭                  |
|      TLS Domain       |                 留空                  |
| Nginx 和 SSL 选项 |                                      |
|         域名           |          给v2ray使用的域名             |
|       应用端口         |            与Port保持一致              |
|         HTTPS         |       将HTTP请求重定向到HTTPS          |
|         域名          |               自动填写                 |
|         邮箱          |               任意邮箱                 |



## 配置客户端

### 通用

* 注意保证客户端的`ID`以及`alterID`和服务端保持一致
* 注意选择网络类型为`Websocket`
* 地址要填写你的域名.端口是`443`(也就是你的`Nginx Proxy`里面`SSL Port`请保持默认`443`不要更改.更改会导致出错)

### iOS

* 小火箭设置为以下选项即可正常连接

| 设置名称 |       内容       |
| :------: | :--------------: |
|   类型   |      Vmess       |
|  服务器  |  给v2ray的域名   |
|   端口   |       443        |
|   UUID   | 与服务端UUID一致 |
|   TLS    |       启用       |
|   混淆   |    WebSocket     |
|   备注   |       任意       |

### MAC(使用v2ray-core)

* 参考给出的配置默认监听`127.0.0.1:10000`作为本地`socks`代理端口并且将收到流量全部通过`v2ray`转发到目标服务器.使用`/path/to/v2ray —config=/path/to/json`来启动本地v2ray.具体运行请到 https://www.v2ray.com/chapter_01/install.html 自行了解
* `surge`设置连接本地`socks`代理地址为`127.0.0.1:10000`即可

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
                "alterId": ,//这里填写的是HyperApp里面配置的alterID.默认32
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
      "alloWinsecure": false
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

* 安卓请下载[V2rayNG程序](http://t.cn/R9U7Xl9),开启后点选+,选择手动输入,并按照下列表格进行配置
* Win则需要自行下载[V2rayN最新客户端](https://github.com/2dust/v2rayN/releases) .按照如下表格填写添加配置.如果有问题请自行Google客户端教程
* 另外.Win添加完配置之后正确启动了`v2rayN`并且没有报错之后.请让你的浏览器或者应用程序连接本地`127.0.0.1:1080`这个地址的socks代理.具体教程请根据你的程序/浏览器自行查找

|   配置选项   |                配置内容                |
| :----------: | :------------------------------------: |
|     别名     |         自定义自己看的顺眼就行         |
|     地址     |          你给v2ray分配的域名           |
|     端口     |                  443                   |
|    用户ID    | HyperApp里面的uuid(也就是最长的那一串) |
|    额外ID    |    填写HyperApp里面alterID(默认32)     |
|   加密方式   |    默认就可以(个人推荐aes-128-gcm)     |
|   传输协议   |                   ws                   |
|   伪装类型   |   none(下面一行tcp伪装域名留空不写)    |
| 底层传输安全 |                  tls                   |

 


