# SSR 教程

简介：SSR 是另一款代理软件（省略），官网 [https://github.com/shadowsocksr/shadowsocksr](https://github.com/shadowsocksr/shadowsocksr)

官方文档 [https://github.com/breakwa11/shadowsocks-rss/wiki](https://github.com/breakwa11/shadowsocks-rss/wiki)


## HyperApp 服务端配置

### 应用配置及安装

<img src="../../images/ssr.jpg" width="450" />

* Port: 端口 (端口的选择范围在65536以内都可以)
* Password: 填一个密码
* Encrypt: 选择一种加密方式，推荐 `none`
* Protocol: 选择一种协议，推荐 `auth_chain_a`
* Protocol_param: 不用填
* Obfs: 如果你的运营商没有封锁 SS 可以选择 `plain`，如果你的运营商是小运营商，推荐选择 `tls1.2_ticket_auth` 或者 `http_simple`
* Obfs_params: 可以不填

### 开启防火墙对应的端口

  - CentOS7
    ```
    firewall-cmd --add-port=SSR监听的端口号/tcp --permanent && firewall-cmd --reload
    ```
  - Ubuntu16
    ```
    sudo ufw allow SSR监听的端口号
    ```

- 为了图方便也可以选择关闭防火墙，关闭防火墙的命令如下。但是**十分不建议那样做**

  - 临时禁用防火墙
    ```
    CentOS7:  service firewalld stop
    CentOS6:  service iptables stop
    Ubuntu16  service ufw stop
    ```
  - 永久禁用系统防火墙
    ```
    CentOS7:  systemctl disable firewalld
    Ubuntu16: systemctl disable ufw
    ```
  - 平台防火墙
    ```
    CES:     网络——防火墙规则
    AWS：    EC2 控制面板——安全组
    阿里云：  云服务器ECS——安全组
    ```

## 客户端配置

你可以在官方文档里面找到所有平台的客户端下载地址 [https://github.com/breakwa11/shadowsocks-rss/wiki](https://github.com/breakwa11/shadowsocks-rss/wiki)

配置客户端你可以手动填写配置，也可以在 `HyperApp` 中轻点服务器名选择 `QR` 然后用客户端扫码配置。

大功告成！

## 注
  - 日志中显示以下内容代表服务端已成功启动(个别地方根据配置的不同可能不同，只要不报错就行)

    ```
    IPv6 not support
    2017-07-29 12:06:54 INFO     util.py:85 loading libsodium from libsodium.so.18
    2017-07-29 12:06:54 INFO     shell.py:72 ShadowsocksR 3.4.0 2017-07-27
    2017-07-29 12:06:54 INFO     server.py:46 current process RLIMIT_NOFILE resource: soft 65536 hard 65536
    2017-07-29 12:06:54 INFO     asyncdns.py:324 dns server: [('8.8.8.8', 53), ('8.8.4.4', 53)]
    2017-07-29 12:06:54 INFO     server.py:106 server start with protocol[auth_chain_b] password [kyo07] method [chacha20-ietf] obfs [tls1.2_ticket_auth] obfs_param []
    2017-07-29 12:06:54 INFO     server.py:122 starting server at [::]:8838
    2017-07-29 12:06:54 INFO     server.py:142 starting server at 0.0.0.0:8838
    ```
