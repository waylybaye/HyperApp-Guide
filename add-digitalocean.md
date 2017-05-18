由于digitalocean使用密码的话会要求改密码，感觉很麻烦而且还会给发邮件


# 注册digitalocean账号

可以通过邀请链接注册，可以获得10刀优惠卷

我的邀请链接 ：https://m.do.co/c/d94a5428b233 （骗个点击）

另外可以去 https://codeanywhere.com 注册个账号 可以获得一个20刀的优惠码

当然如果有githu 学生包的话可以得到50刀的兑换码。

# 登陆digitalocean账号配置KEy（默认你已经有公钥和私钥了，并自己把私钥添加到HyperApp）

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

# 把服务器添加到HyperApp

打开HyperApp添加服务器
输入：

name 随意输入你想要的内容

host 输入 ip（服务器创建完毕会看见的）

端口 ：默认是22 （如果没改的话）

用户名 root （默认）

![](https://github.com/aiastia/HyperApp-Guide/blob/master/images/%E4%B8%BE%E4%B8%AA%E6%A0%97%E5%AD%90.png)

请把上面填写的内容改成自己的

然后 key 选择刚刚添加的key的私钥就可以（如果没有密码的话，有密码的话要输入密码）

这样可以跳过digitalocean 用邮箱密码登陆要改密码的困惑了。

ps：吐槽一下 有的社交软件复制密钥的话会被****。可以用邮件的形式发送 
