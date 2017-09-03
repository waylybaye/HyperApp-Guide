# HyperApp 用户文档

HyperApp 是一个基于 SSH 和 Docker 的自动化部署工具，开发者整理了超过几十个常见应用，将其整理到商店中，您只需要点击一下就会出现可视化的配置界面，然后可以一键安装到您的服务器上。部署应用就是这么简单！

HyperApp 还集成了 LetsEncrypt SSL 证书功能，几乎可以为全部应用自动生成 SSL 证书。

同时 HyperApp 可以帮助您随时查看服务器运行状态，以及通过SSH终端随时随地登录到服务器上进行操作。

[![HyperApp on AppStore](https://linkmaker.itunes.apple.com/assets/shared/badges/zh-chs/appstore-lrg.svg ”View on App Store“)](https://itunes.apple.com/app/apple-store/id1179750280?pt=118260435&ct=guide&mt=8)

—

## 获得帮助

* [Telegram 用户群](https://t.me/hyperapp)
* [在 Telegram 上关注 HyperApp 更新频道](https://t.me/hyperappnews)
* [在 Twitter 上关注 HyperApp](https://twitter.com/LoveHyperApp)
* [在 GitHub 上的此教程仓库](https://github.com/waylybaye/HyperApp-Guide)

## 文档使用办法

* 新手入门推荐从此教程开始：[手把手爱国教程](proxy/get-started.md)
* 如果你在使用中遇到问题，请参考 [HyperApp 排错索引](faq.md)


#### 参与改进该文档

遇到文档错误您可以在本页面左上角点击 `Edit` 直接在 Github 上编辑该文档，然后提交 `Pull Request` 即可。


#### 支持的 Linux 系统

注意，这里所说的支持是指自动安装docker支持的系统，如果你使用其它系统（如 FreeBSD, Gentoo等），你可以自己安装 docker，HyperApp 会自动检测 docker 是否安装，如果已经安装则使用已有的 docker。

* Docker 只支持64位系统，且内核版本 >= 3.10
* Ubuntu 14，16 ✅
* CentOS 7 ✅
* Debian 8 ✅
* CentOS 6 ⚠️ （不支持，但你可以手动安装最新版的Docker）
* 不支持 OpenVZ ❌

注：CentOS 6 也是支持的，但是有些厂商自带的内核版本较低导致不支持 Docker

推荐 Ubuntu 最新版本

**为什么不支持 OpenVZ ？**
因为 OpenVZ 支持的内核版本太低，不支持 Docker 所以，HyperApp 不支持 OpenVZ 的主机。


**HyperApp 会在我的服务器/路由器上运行哪些命令？**  
[HyperApp 运行的命令](../commands.md)
