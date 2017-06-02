# 各云厂商使用教程


## 目录

* [HyperApp](#hyperapp)
    * [用 HyperApp 生成密钥](#用hyperapp生成密钥)
    * [手动添加服务器](#手动添加服务器)
    * [自动高配置服务器](#自动高配置服务器)
* [Vultr 教程](#vultr)
* [Linode 教程](#linode)
* [AWS 教程](#aws)


## HyperApp

### 用 HyperApp 生成密钥

1. 打开 `更多 → SSH Keys → 右下角加号 → 生成密钥` 生成一个密钥
2. 点击密钥后，可以进去点击 `复制公钥` 然后用于下面的步骤。

### 手动添加服务器

点击 `服务器 → 右下角加号 → 手动配置` 后进入添加服务器页面。添加服务器需要 `IP，端口，用户名，密码，密钥` 等信息。我会在下面各个厂商的分段中给出这些信息。

一般都有两种认证方式，密码或者密钥。添加服务器时，你可以使用平台提供的密码登录，或者密码留空，在下面密钥中选择上一步生成的密钥。

### 自动配置服务器

你也可以使用 `服务器 → 右下角加号 → 自动配置` 功能来自动添加服务器。根据自动配置的提示一步步运行就可以，非常简单。

---

## Vultr

### 创建服务器

1. 打开 [Servers](https://my.vultr.com/) 点击加号新建一个服务器实例
2. 进入新建实例页面
    1. Server Location: 选择一个地区，推荐 Tokyo > Singapore > Los Angeles。但是 Tokyo 的机房晚上丢包严重，严重影响使用体验，LA 虽然延迟高但是稳定。
    2. Server Type: 必须选择 64 位的系统，推荐 Ubuntu 最新版本，或者 CentOS 7
    3. Server Type: 如果有 \$2.5 的可以买 \$2.5的，没有的话就买 $5 的。
    4. Additional Features: 可以选择 `Enable IPv6`
    5. Startup Script: 不用选
    6. SSH Keys: 如果你不想用 root 密码登录那么可以，使用上面复制的公钥，添加到这里并选择即可
    7. Firewall Group: 这儿是管理防火墙的，如果你非常注重安全，可以自己新建防火墙组否则就选择 `No Firewall`
    8. Server Hostname & Label: 随便填写一个易记的名字

    
### 添加服务器
    
等几分钟实例创建完成并且启动后，在 [Servers](https://my.vultr.com/) 页面点击刚才的实例进去可以看到一些信息，最重要的是左侧的 `IP Address` `Username` `Password`

1. 手动配置：只需要将上面三个参数填入 HyperApp 中即可，端口不用填默认用 `22`。
2. 自动配置：点击右上角工具栏的 `View Console` 按钮，图标是一个显示器，进入终端。
    1. 出现 `vultr login` 时输入上面看到的 `Username` 一般都是 `root`
    2. 出现 `Password` 提示时，输入上面看到的 `Password`
    3. 运行 HyperApp 提示的命令，然后扫码即可。


---


## Linode

### 创建服务器



