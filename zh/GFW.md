# 科学上网综述


## 主机商

目前市面上常用的主机商有下面一些：

* Google Cloud Platform （以下简称 GCP）
    * 提供一年$300美金的免费试用
    * 需要 Visa/MasterCard 信用卡
    * 机房众多，其中台湾机房更是极品，延迟50ms左右
* Amazon Web Services (AWS)
    * 提供一年免费试用，试用包括一个最低配置的主机和每月15G流量
* Linode
    * $5/月起，东京机房质量较好
* DigitalOcean
    * $5/月起，最近的机房是新加坡
* Vultr
    * $2.5/月起，有东京机房，但2.5的可能缺货买不到


## 代理软件

下面主要有两类翻墙手段，一个是轻量级代理，一个是 VPN 类。

* 轻量级代理
    * Shadowsocks （SS）
        * 专门为墙而生的 socks 代理，HyperApp 中包括两个版本，一个是比较老的 Shadowsocks Python 原版，一个是 C 语言实现的一直在更新的 libev 版。推荐后者。
    * ShadowsocksR （SSR）
        * Shadowsocks 的一个魔改版，添加了许多混淆方式，某些运营商可能无法使用 SS （比如长城宽带），这是可以使用 SSR 来代替，SSR 可以将代理伪装成普通的网站请求，以此来跳过运营商的封锁。
    * kcptun
        * 如果你的机房线路很好（比如 GCP 台湾机房）那么直接用 SS 就有很好的速度，但是某些线路非常差的机房就需要 kcptun 这种黑科技了，上面的代理都是使用 TCP 来连接的，但 kcptun 使用 UDP （一般的下载软件也都是 UDP）通过多倍发包在延迟高丢包高的线路上来实现网络加速。
    * V2Ray
        * V2Ray 的志向很大，要做一个全能的代理平台，其内置了 HTTP,Socks,Shadowsocks,VMess等协议的代理。功能非常强大，但缺点是配置非常复杂。不过还好 HyperApp 能方便安装配置其服务端。另外 V2Ray 不就可以使用 TCP 还支持使用 mKCP 来
* VPN 类
    * IPSec/L2TP VPN： 
        * ⚠️ 不推荐，出墙的话会被秒封，墙内也不推荐使用，但优点是系统都内置支持
    * OpenVPN: 
        * ⚠️ 不推荐，但如果墙内用则推荐，安全性更高，缺点是各个平台都需要手动下载软件
    * OpenConnect (Cisco AnyConnect) 
        * ❤️ 推荐，如果翻墙需要 VPN 则强烈推荐这个。许多外企都使用 Cisco AnyConnect 来办公，所以受到的墙的干扰非常少。安全性也很高。

### 其它加速技术

#### BBR


### 如何选择？

1. 如果你机房的线路非常好（香港、台湾机房）那么直接使用 BBR + SS/SSR 即可。
2. 如果你机房的线路很差（比如丢包很高或者距离很远）那么可以使用 BBR + SS/SSR + kcptun。
3. 如果你的运营商会封锁 SS 或者进行 QoS，那么使用 BBR + SSR 混淆，或者 BBR + VMess 的 TLS 混淆。




