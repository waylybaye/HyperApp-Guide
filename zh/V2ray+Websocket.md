# V2Ray配置Websocket并使用Nginx反向代理(TLS)教程



## 工具



* **hyperapp**
* **Mac/Win**
* **耐心**





## 准备工作



* **首先先按照之前的获取顶级域名教程.拿到属于你自己域名.并且将域名解析到VPS上面去.请确保解析正确后再进行以下步骤.如果已经有域名了直接进入下一步**
* **使用hyperapp安装Nginx Proxy以及Nginx SSL Support.保持默认配置即可.如有发生端口冲突则自行排查.经测试默认的80端口可以更改为8080.443端口更改会导致证书获取失败(仅限于本教程范畴)**





## 配置V2Ray服务端

| 配置选项                 | 配置内容           |
| -------------------- | -------------- |
| Port                 | 自定义.不冲突即可      |
| Network              | ws             |
| Connection reuse     | enable         |
| ID                   | 使用hyperapp自动生成 |
| level                | 1              |
| alterID              | 32             |
| Enable OBFS          | disable        |
| Enable TLS           | disable        |
| Allow Insecure       | enable         |
| TLS Domain           | 留空             |
| config.json          | 默认             |
| SSL certs            | 默认             |
| 以下选项请开启显示Nginx和SSL选项 |                |
| 域名                   | 你的域名           |
| 应用端口                 | 上面的Port        |
| HTTPS                | 重定向            |
| 域名                   | 自动填写           |
| 邮箱                   | 你域名绑定的邮箱       |

* **内容为enable则为启用.disable则为不启用**
* **配置完后安装即可**




## 配置客户端连接



* **注意保证客户端的ID以及alterID和服务端保持一致(在之后版本的hyperapp会添加多用户支持)**
* **注意选择网络类型为Websocket**
* **地址要填写你的域名.端口是443**
* **一定要在客户端开启Allow Insecure**




## 请尽情享受安全的网络:)

