

烦请新进群的以及遇到问题的先仔细阅读置顶消息:安装过程中遇到问题请先看教程：https://goo.gl/dVyY6j (谷歌短连接需要科学上网.教程本身也需要)

## 目录指引


- 结算被停用怎么办？怎么添加防火墙端口？ → 教程底部
- 私钥认证失败怎么办 → 看教程“永久添加公钥”那一段
- 其它错误怎么办？
- 在群里报告问题，请带完整的截图。如果安装失败，点击蓝色的感叹号然后截图。

## 客户端没法翻墙的问题：

- 点击“查看日志”看看应用是否跑了起来，如果有正常的信息，但没有连接信息说明要么是防火墙问题，要么是你IP、端口没配置对。
- 查看日志如果有一些连接错误的信息，说明防火墙没问题，服务端也没问题，是客户端配置错误，而且是加密方式或者密码错误。
- 如果要提问，把这个日志截图发出来再提问。
- 如果你用 Wingy 不要开 OBFS
- 另外不要用SSR 连 SS，也不要用SS 连SSR

## 手机可以电脑没法翻墙的问题：

* 请先查看客户端日志，并贴出来* 用全局模式测非Chrome、Firefox浏览器（因为Chrome浏览器的很多插件会改代理设置）如果全局可以就能断定是pac规则或者浏览器的原因。

## 厂商常见问题：

- 搬瓦工只支持 KVM 的机器。
- Vultr/DigitalOcean/AWS 全都支持
- GCP没有领到试用金：重新打开试用页面再点击一次“Try it free”

## Hyperapp常见问题:

- Q:bbr脚本执行后重启后发现执行`lsmod | grep bbr`发现输出空白.bbr没有正确启动.同时执行sysctl -p输出空白

​        A:根据使用者反馈的问题 ,初步解决方案是执行一下命令

```bash
sudo su && cp /etc/sysctl.conf /etc/sysctl.conf.bak && rm -rf /etc/sysctl.conf && touch /etc/sysctl.conf && chmod 644 /etc/sysctl.conf && sudo echo -e "\n\n\n\nnet.core.default_qdisc = fq\n\n\nnet.ipv4.tcp_congestion_control = bbr" >> /etc/sysctl.conf && sysctl -p
```

  如果这时候`lsmod | grep bbr`还没有出现tcp_bbr的话请自行根据网上linux文本编辑器教程编辑/etc/sysctl.conf.加上这两行

```bash
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
```


- Q:提示连接失败/无法连接/密钥认证失败/操作失败并且日志提示transport read  

​        A:请不要使用代理连接hyperapp.并且进行操作的时候不要切换应用.

- Q:使用bbr安装脚本的时候提示"Inappropriate ioctl for device"

  A:使用键盘随便输入几个字符并且回车两下.原因是bbr安装脚本需要等待输入来执行下一步


- Q:提示docker command not found

​        A:执行命令`curl -fsSL get.docker.com | sh`安装最新docker

- Q:如何加入testflight测试计划?

​        A:不要刷机器人了.想加入tf.私聊群主@waylybaye.附上你的购买凭证和通讯邮箱.群主会处理的

- Q:出现cannot connect to the Docker daemon

​        A:请确保升级内核启用BBR或者启用魔改BBR这个步骤.在使用docker之前

- Q:如果先安装了docker再安装bbr导致无法启动docker怎么办?

​        A:执行`rm -rf /var/lib/docker/aufs`清除docker网络配置.然后重新安装所有应用.

- 关于nginx上传限制的解决办法：

​        执行下列这条命令然后重启.把你的受到限制的域名替换命令中 example.com 

​      `touch /srv/docker/nginx/vhost.d/example.com && echo "client_max_body_size 100m;" » /srv/docker/nginx/vhost.d/example.com`

- 关于squid内存不足无法正确启动的解决办法:

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

## 另外:要是某个应用的使用遇到问题.请访问github的具体教程.链接如下

https://github.com/waylybaye/HyperApp-Guide/blob/master/README.md