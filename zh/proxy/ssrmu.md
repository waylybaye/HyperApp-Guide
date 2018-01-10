# 魔改V3后端一键docker


> 市面上有很多一键部署sspanel v3 mod的脚本.但要么不太好使.要么有使用条件.而且安装时间也比较长.于是做了个docker.利用hyperapp即可一键解决

### 本文原文链接为 https://vinga.tech/ssrmu 原文更新更为及时

## 更新记录

- 2017.12.29:重构镜像.对镜像进行了优化提升了性能.通过增加启动参数`--restart=always`来提升稳定性.请自行在options中增加.
- 2017.12.18:压缩了镜像.
- 2017.11.21:增加glzjinmod的链接方式

## 准备

* **Hyperapp**
* **耐心.仔细.认真**


## 在Hyperapp进行设置

#### webapi的链接方式
1. **转到商店页面.找到Docker Image然后选择服务器并且保存进入配置界面**
2. **请完全按照下图配置进行填写！**

|    应用设置名称     |          内容          |
| :-----------: | :------------------: |
|     Image     | fanvinga/docker-ssrmu |
|    Options    |   `-e DOMAIN=example.com -e MUKEY=your_mukey -e NODEID=your_nodeid --network=host  --restart=always` |
|    Command    |                      |
|     Args      |                      |

3. **保存并且进行安装.**
* **注意默认是https所以example.com前面不需要填写https**


#### glzjinmod的链接方式
1. **转到商店页面.找到Docker Image然后选择服务器并且保存进入配置界面**
2. **请完全按照下图配置进行填写！**

|    应用设置名称     |          内容          |
| :-----------: | :------------------: |
|     Image     | fanvinga/docker-ssrmu:db |
|    Options    |   `-e DOMAIN=example.com -e DB=database_name -e NODEID=your_nodeid -e USER=database_user -e PASSWD=database_password --network=host  --restart=always` |
|    Command    |                      |
|     Args      |                      |

3. **保存并且进行安装.**
* DB USER PASSWD 默认是sspanel；
  NODEID 默认是3
  DOMAIN 默认是your_domain

## 大功告成

* **这时候去访问你的域名吧٩(˃̶͈̀௰˂̶͈́)و**

## 写在最后

* 写了这么久.如果能有所收获那就是我最大的荣幸了:)
* 如果可以的话.可以关注一下 https://vinga.tech 这是我的私人博客地址:)
* 如有问题可发邮件至我邮箱fanalcest@gmail.com联系或telegram@fanvinga

<a href="https://vinga.tech"><img src="https://d.unlimit.fun/design/banner.png" alt="banner" target="_blank"></a>
