
# FAQ

## 索引

* HyperApp 问题
    * 拍错思路
* GCP 问题：


## 顶部教程食用方法


* 结算被停用怎么办？怎么添加防火墙端口？ → 教程底部
* 私钥认证失败怎么办 → 看教程“永久添加公钥”那一段
* 其它错误怎么办？→参考本篇文章
* 在群里报告问题，请带完整的截图。如果安装失败，点击蓝色的感叹号然后截图。


## 遇到问题后的排查思路

* 先排查服务端的问题
  * 先进去hyperapp查看服务端是否配置无错.启动是否成功(标志up xxx seconds)
  * 如果服务端启动成功仍然无法连接则请根据下面服务端端口排查指引以及防火墙设置教程来确保端口正确开放
  * 如果端口没问题.而且启动也成功了的话.请确认你的服务端是否正确使用了你开放的端口
* 其次排查客户端的问题
  * 是否使用了跟服务端一致而正确的配置.建议使用url链接导入或者扫描二维码的方式确保无误
  * 如果hyper中显示服务端正常启动.但是客户端连接后查看日志没有显示连接信息要么是防火墙问题，要么是你IP、端口没配置对。
  * 查看日志如果有一些连接错误的信息，说明防火墙没问题，服务端也没问题，是客户端配置错误，而且是加密方式或者密码错误。
  * 如果你用 Wingy 不要开 OBFS
  * 另外不要用SSR 连 SS，也不要用SS 连SSR
  * 如果你选择了最新的shadowsocks-libev的tls obfs.需要执行以下步骤
    * 先进去vps执行`docker pull hyperapp/shadowsocks-libev`
    * 回到hyperapp中对shadowsocks-libev执行更新配置.
    * 完成上述步骤后回到ss客户端配置tls-obfs.
* 最后如果你的问题不在上述思路中.请仔细查看文章中涵盖的hyperapp常见问题以及解决方案.实在搞不懂再上群提问并且请注意你的语气.没有人有义务帮助你.

## 服务端端口排查指引

1. 在vps上运行: `telnet localhost PORT(要检查的端口)` 能通说明服务端没问题。不通说明服务端启动失败。
2. 在电脑上运行`telnet IP PORT(要检查的端口)` 能通说明防火墙没问题。不通说明是防火墙的问题。
3. 运行 `lsof -i :端口` 来查看是否有进程正在监听该端口，如果有说明是防火墙屏蔽了端口访问，如果没有说明部署失败。

## 防火墙设置教程

* 临时禁用系统防火墙

  * CentOS7: service firewalld stop
  * CentOS6: service iptables stop
  * Ubuntu16: service ufw stop

* 永久禁用系统防火墙

  * CentOS7: systemctl disable firewalld
  * Ubuntu16: systemctl disable ufw

* 系统防火墙永久添加端口

  * CentOS7: firewall-cmd --permanent --zone=public --add-port=端口/tcp

* 平台防火墙

  * GCE: 网络 → 防火墙规则
    * 点击`创建防火墙规则`
      * 名称：随便输入一个名称
      * 目标：选择 `网络中的所有示例`
      * 来源过滤：`0.0.0.0/0`
      * 协议和端口：`指定的协议和端口` 下面输入 `tcp;udp:端口号`
  * AWS: EC2 控制面板 → 安全组
  * 阿里云: 云服务器 ECS → 安全组

## 手机可以电脑没法翻墙的问题：

* 请先查看客户端日志，并贴出来用全局模式测非Chrome、Firefox浏览器（因为Chrome浏览器的很多插件会改代理设置）如果全局可以就能断定是pac规则或者浏览器的原因。

## 厂商常见问题：

* 搬瓦工只支持 KVM虚拟化 的机器。
* Vultr/DigitalOcean/AWS 全都支持
* GCP没有领到试用金：重新打开试用页面再点击一次“Try it free”

## Hyperapp常见问题:

* 为什么在安装应用的时候.会卡在安装中非常久(这种情况多出现在国内VPS中)

  * 请先确定你的VPS可以正确联网再参考下列步骤
  * 方法1:在hyperapp终端左下角第一个按钮中.选择安装阿里云国内Docker源
  * 方法2:参考链接 https://goo.gl/psjmte 使用阿里云镜像加速服务
  * 终极解决办法:远离国内VPS.


* bbr脚本执行后重启后发现执行`lsmod | grep bbr`发现输出空白.bbr没有正确启动.同时执行sysctl -p输出空白

  * 根据使用者反馈的问题 ,初步解决方案是执行一下命令

```bash
sudo su && cp /etc/sysctl.conf /etc/sysctl.conf.bak && rm -rf /etc/sysctl.conf && touch /etc/sysctl.conf && chmod 644 /etc/sysctl.conf && sudo echo -e "\n\n\n\nnet.core.default_qdisc = fq\n\n\nnet.ipv4.tcp_congestion_control = bbr" >> /etc/sysctl.conf && sysctl -p
```

​               **如果这时候`lsmod | grep bbr`还没有出现tcp_bbr的话请自行根据网上linux文本编辑器教程编辑/etc/sysctl.conf.加上这两行**

```bash
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
```


* 提示连接失败/无法连接/密钥认证失败/操作失败并且日志提示transport read  
    * 请不要使用代理连接hyperapp.并且进行操作的时候不要切换应用.

* 使用bbr安装脚本的时候提示"Inappropriate ioctl for device"

  * 使用键盘随便输入几个字符并且回车两下.原因是bbr安装脚本需要等待输入来执行下一步


* 提示docker command not found

  * 执行命令`curl -fsSL get.docker.com | sh`安装最新docker

* 操作Docker时提示权限不足(Permission Denied)，原因是默认用户没有docker权限，加到docker组才有
	
  * 执行命令`sudo usermod -aG docker $USER`

* 如何加入testflight测试计划?

  * 不要刷机器人了.想加入tf.私聊群主@waylybaye.附上你的购买凭证和通讯邮箱.群主会处理的

* 出现cannot connect to the Docker daemon

  * 请确保升级内核启用BBR或者启用魔改BBR这个步骤.在使用docker之前

* 如果先安装了docker再安装bbr导致无法启动docker怎么办?

  * 执行`rm -rf /var/lib/docker/aufs`清除docker网络配置.然后重新安装所有应用.

* 关于nginx上传限制的解决办法：

​        执行下列这条命令然后重启.把你的受到限制的域名替换命令中 example.com 

​      `touch /srv/docker/nginx/vhost.d/example.com && echo "client_max_body_size 100m;" » /srv/docker/nginx/vhost.d/example.com`

* 关于squid内存不足无法正确启动的解决办法:

   * Ubuntu使用如下命令创建swap

```bash
sudo su
fallocate -l 1G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
echo "vm.swappiness = 10" » /etc/sysctl.conf
sysctl -p
```

* Centos请将第一个echo换成
  `echo "/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab`

<<<<<<< HEAD
## 另外:要是某个应用的使用遇到问题.请访问github的[具体教程](https://github.com/waylybaye/HyperApp-Guide/blob/master/README.md).
=======
## Hyperapp官方应用教程链接

http://t.cn/R965Wzg

#### ~~部署v2ray等应用可适当参考如下链接~~(打死这个不要脸的:)

https://vinga.ml
>>>>>>> b4a63e0eb8bc1fabc9c4aca23bc631c965cf46fe

