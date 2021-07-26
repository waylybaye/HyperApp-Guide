# FAQ

----

## HyperApp 常见问题


#### 关于国区被下架的问题


HyperApp 因不可抗的政策原因已在 App Store 中国区不可用。


#### **如何升级应用？**

1. 在服务器下面的 Docker 监控里选择你的应用，轻点后选择 `Pull Image` 即可更新镜像，然后在应用那里 `更新配置`
2. 手动的话可以 `docker ps` 找到应用的镜像名字，然后 `docker pull 镜像`，然后在应用那里 `更新配置`

----

## 防火墙设置教程

#### 临时禁用系统防火墙

  - CentOS7: service firewalld stop
  - CentOS6: service iptables stop
  - Ubuntu16: service ufw stop

#### 永久禁用系统防火墙

  - CentOS7: systemctl disable firewalld
  - Ubuntu16: systemctl disable ufw

#### 系统防火墙永久添加端口

  - CentOS7: firewall-cmd --permanent --zone=public --add-port=端口/tcp

#### 平台防火墙

  - GCE: 网络 → 防火墙规则
    - 点击`创建防火墙规则`
      - 名称：随便输入一个名称
      - 目标：选择 `网络中的所有示例`
      - 来源过滤：`0.0.0.0/0`
      - 协议和端口：`指定的协议和端口` 下面输入 `tcp;udp:端口号`
  - AWS: EC2 控制面板 → 安全组
  - 阿里云: 云服务器 ECS → 安全组

----

## 系统问题

#### 如何手动开启 BBR

* 注意以下命令需要 `root` 权限，非 root 用户先执行 `sudo su -` 切换到 root 账户

1. 运行 `uname -r` 看看是不是内核 >= 4.9，不是的话请先升级内核

2. 执行 `lsmod | grep bbr`，查看 BBR 模块是否启用，如果结果中没有 tcp_bbr 的话就先执行

   ```sh
   modprobe tcp_bbr
   echo "tcp_bbr" >> /etc/modules-load.d/modules.conf
   ```

3. 执行命令设置 TCP 使用 BBR 发包

   ```sh
   echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
   echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
   ```

4. 执行以下命令保存以上设置生效启用 

   ```sh
   sysctl -p
   ```

#### 验证 BBR 是否已经启用

```sh
sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control
```

* 如果输出结果都有bbr, 则证明你的内核已开启bbr

----

## 厂商常见问题：

#### 二维码显示不全，如何手动添加 GCP ？

1. 二维码上面有 `IP`，`用户名`，`端口` 信息，在 `HyperApp → 服务器` 中点击添加按钮，选择手动配置。
2. 在出现的窗口中，分别输入上面对应的字段，密码不填写，在最下面的密钥那里选择一个密钥（应该只有一个）。
3. 添加即可。但是稍后的可能会出现密钥认证失败的错误，所以建议将密钥名字改成你的 gmail 邮箱名字。或者按照教程，修改两处用户名一致即可。

#### 其他厂商常见问题

* 搬瓦工只支持 KVM虚拟化 的机器。

* Vultr/DigitalOcean/AWS 全都支持

* GCP没有领到试用金：重新打开试用页面再点击一次“Try it free”

* 50Kvm 的机器第一次登录需要记下下次登录的 SSH 端口

* DigitalOcean 的机器第一次登录需要改密码

----

## 安装错误

* 如果你遇到以下情况请查看[关于安装错误的FAQ](FAQ-Error.md)

  * 初始化服务器的时候遇到问题
  * 安装应用的过程中报错或者出现预料以外的提示
----

## 应用问题

* 如果你遇到以下情况请查看[关于应用问题的FAQ](FAQ-App.md)

  * 在商店安装的应用遇到问题
  * 应用的使用过程中遇到限制或者其他问题

----


