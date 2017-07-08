# 使用 nghttpx 搭建 HTTP2 代理

nghttpx 是一个 HTTP2 代理，HTTP2 是新一代的 HTTP 协议，但一些老牌的 HTTP 代理比如 squid 并不支持 HTTP2 协议，就需要 nghttpx 来将 HTTP2 协议翻译成 HTTP1.x 的协议，所以要搭建一个HTTP2 代理你需要一个 HTTP 代理来配合使用。（可以用商店中的 squid）

具体请求流程是：

| 你的浏览器 |  → http2 协议 → | nghttpx | → | http(1.x) proxy | → | 你要访问的网站 |

## 服务器安装和配置

### 配置 squid

在商店中选择 `squid` 并创建，无需填写任何选项（端口也不用填）安装即可。


### 配置 nghttpx

* Port: 代理端口
* Disable TLS: 是否禁用 TLS，不禁用的话就必须填写 SSL 参数以及提供 SSL 证书。
* Domain: SSL 证书的域名
* Backend: 后端 HTTP 代理，如果你下面link 了一个 backend，这里就填 `backend,端口号`，如果你使用其它远程代理，这里就填代理地址就行，格式 `地址,端口`
* Access Log: 是否在日志中显示访问记录
* Volumes - certs: SSL 证书的存放目录，应该包含上面所填写的 Domain 的两个文件: Domain.key 和  Domain.crt
* Link Containers - backend: 这儿可以选择上面创建的 squid 

## 客户端




