# Smartsocks使用帮助



> SmartSocks 是一个服务端和客户端自动协商最快传输协议的工具。客户端会自动尝试 SSR/V2Ray 推荐的配置组合，然后使用 `speedtest` 来测速。


## 支持的应用

* ShdowsocksR
* V2Ray (tcp & kcp)
* Kcptun (计划中)



## 功能

* 自动尝试使用各种应用的加密方式与协议与服务器连接.并使用speedtest进行测速.获取最佳组合
* 根据测速的结果自动在本地开放一个socks代理端口



# 服务端

## 安装与启动

在 `HyperApp → 商店 → 网络` 分组下面找到 `SmartSocks` 安装，配置时只要填入一个主控端口，和用户名密码即可.

​      <img src="http://oqqsuahzx.bkt.clouddn.com/17-6-24/98323867.jpg">
​      <img src="http://oqqsuahzx.bkt.clouddn.com/17-6-24/87743812.jpg">
​      <img src="http://oqqsuahzx.bkt.clouddn.com/17-6-24/61107877.jpg">




# 客户端



## 目前支持的系统

* Linux
* macOS




## 安装



**打开终端并执行下列命令**

`curl -sL https://raw.githubusercontent.com/waylybaye/SmartSocks/master/install_client.sh | bash`



## 启动



**打开终端并执行下列命令**

`cd smartsocks`

`python client.py -s 你的服务器地址 -p 1000(刚刚设置的) -u test(刚刚设置的) -P test(刚刚设置的) -S 52000(自定义的本地SSR代理端口)`



## 注意事项



* **在使用Smartsocks之前请先将本地所打开的所有SSR/V2Ray程序以及Surge等代理程序关闭以防干扰**
* **在执行命令之前确保终端没有使用HTTP代理**
* **目前Smartsocks还处于测试阶段,可能存在BUG,如有错误提示可到https://t.me/hyperapp进行反馈**

