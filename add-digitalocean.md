由于digitalocean使用密码的话会要求改密码，感觉很麻烦而且还会给发邮件。其他的vps商家类似


# 注册digitalocean账号

可以通过邀请链接注册，可以获得10刀优惠卷

我的邀请链接 ：https://m.do.co/c/d94a5428b233 （骗个点击）

另外可以去 https://codeanywhere.com 注册个账号 可以获得一个20刀的优惠码

当然如果有github 学生包的话可以得到50刀的兑换码。（我猜你们是没有这个）
# 创建key 

可以在自己已有vps创建也可以 用xshell创建

如果不想在使用公钥的时候输入密码，可以留空。

创建完成之后可以自己保存好自己的私钥和公钥

至于细节的地方请自己谷歌/百度，如果实在不会生成提供付费付费

# 登陆digitalocean账号配置KEy

登陆成功后 点击头像 下来 选择 settings——security

 会发现   
 `add ssh key`
 单机输入自己的ssh 的公钥key

![](https://github.com/aiastia/HyperApp-Guide/blob/master/images/security.PNG)

![](https://github.com/aiastia/HyperApp-Guide/blob/master/images/addsshkey.PNG)

![](https://github.com/aiastia/HyperApp-Guide/blob/master/images/%E5%85%AC%E9%92%A5.PNG)

然后去新建服务器了 选择适合的配置和价格后

拉到下面有个 `Add your SSH keys`

选择刚才添加的 `ssh key`

![](https://github.com/aiastia/HyperApp-Guide/blob/master/images/%E4%BD%BF%E7%94%A8key.png)

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

ps：吐槽一下 有的社交软件复制密钥的话会被****。可以用邮件的形式发送 .


# 如果你不想新建服务器而在原有基础上添加ssh 密钥登陆 请访问 

https://github.com/aiastia/key
