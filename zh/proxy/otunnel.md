# 内网穿透服务otunnel架设

> otunnel是一款轻量化且简单化的内网穿透工具.使用golang进行编写.今天为大家带来一篇部署教程


## 更新记录

* 2017.09.10: 增加了设置向导

## 准备

* **Hyperapp**
* **一个已经解析正确的域名（ping验证）**
* **耐心.仔细.认真**

## 到Hyperapp进行设置服务端

1. **转到商店页面.找到Docker Image然后选择服务器并且保存进入配置界面**
2. **请完全按照下图配置进行填写！**


|    应用设置名称     |          内容          |
| :-----------: | :------------------: |
|     Image     | fanvinga/docker-otunnel |
|    Options    |                      |
|    Command    |                      |
|     Args      |                      |

* 默认的监听端口是10000且TOKEN为token.如果要设置.请在`Options`这个空里面加入`-e TOKEN=你要设置的token -e BIND_PORT=你要设置的端口`注意每个`-e`只能设置一个变量.等号前面的变量名不可更换.
* 没有填写的设置即为留空
* *保存并且进行安装

## otunnel 用法

### 前提条件
    1. 假设服务端的地址为 example.com
    2. 假设你设定的token为token.监听端口为10000
    3. 从客户端能连接服务端(无需在同一个网段内.
  	
### 客户端准备工作
   0. https://dl.ooclab.com/otunnel/1.2.3/
   1. 到这里下载你对应平台的客户端.本文以macOS举例（下载darwin-amd64版本并放置在桌面）
  2. 运行`chmod +x /path/to/otunnel`赋予权限.记得修改路径

### 反向代理
举例：将客户端可以访问的 192.168.1.3:22 映射到服务端上的 23333 端口：
`/path/to/otunnel connect example.com:10000 -s token -t 'r:192.168.1.3:22::23333'`
现在访问 example.com:23333 即等于访问了客户端内网的 192.168.1.3:22

### 正向代理
举例：假设 example.com 的8838端口部署了一个服务(你懂的),要正向代理过去.那么在 client 运行：
`/path/to/otunnel connect example.com:10000 -s token -t 'f::23333:127.0.0.1:8838'`
现在链接客户端的23333 端口,等于访问 example.com 上的 127.0.0.1:8838

## 注意
	1. 本地地址 或 远程地址 如果为空，表示所有网口
	2. otunnel 命令行可以包含多个 -t 选项，同时指定多条隧道规则

## 官方wiki地址

https://github.com/ooclab/otunnel/wiki/USAGE.zh_CN

## 吐槽一下
* **做docker的时候一直提示找不到可执行文件🤦‍♂️🤦‍♂️明明就在那里🤦‍♂️最后开挂给开发者提issue才修好.**

## 写在最后

* 写了这么久.如果能有所收获那就是我最大的荣幸了:)
* 如果可以的话.可以关注一下 https://vinga.tech 这是我的私人博客地址:)
* 如有问题可发邮件至我邮箱fanalcest@gmail.com联系或telegram@fanvinga

<a href="https://vinga.tech"><img src="https://d.unlimit.fun/design/banner.png" alt="banner" target="_blank"></a>
