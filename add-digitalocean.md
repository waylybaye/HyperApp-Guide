#注册账号

可以通过邀请链接注册，可以获得10刀优惠卷

我的邀请链接 ：https://m.do.co/c/d94a5428b233

#登陆账号配置KEy（默认你已经有公钥和私钥了，并自己把私钥添加到HyperApp）

登陆成功后 点击头像 下来 选择 settings——security

 会发现   
 `add ssh key`
 单机输入自己的ssh 的公钥key

![](https://github.com/aiastia/HyperApp-Guide/blob/master/images/addsshkey.PNG)

然后去新建服务器了 选择适合的配置和价格后

拉到下面有个 `Add your SSH keys`

选择刚才添加的 `ssh key`

点击`create` 完成创建

等待服务器创建完毕

#把服务器添加到HyperApp

打开HyperApp添加服务器
输入：
name 随意输入 
在host位置 输入 ip:
端口 ：22 （如果没改的话）
用户名 root （默认）

然后 key 选择刚刚添加的key的私钥就可以（如果没有密码的话，有密码的话要输入密码）

这样可以跳过digitalocean 用邮箱密码登陆要改密码的困惑了。
