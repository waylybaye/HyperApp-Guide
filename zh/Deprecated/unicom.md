# 联通客户端检测

| 软件和协议 | 联通检测类型 | 访问网址 |
| --------- | -------- | ---- |
| Shadowsocks | TCP 业务 | 显示服务器IP |
| SS + http_simple（80端口） | 上网 (Web方式get) | 显示混淆域名 |
| SSR | TCP 业务 | 显示服务器IP |
| SSR + http_simple | 上网 (Web方式get) | 显示混淆域名 |
| SSR + TLS(443) | * 安全类网页浏览 (HTTPS VPN) 流量 <br/>* HTTPS 链接 | 显示混淆域名 |
| SSR + TLS(995) | 安全协议的收邮件流量 | 显示IP |
| SSR + TLS(非443) | * 网络连接（网页）<br/>* HTTPS 链接| 显示混淆域名 |
| OpenConnect | UDP 业务 | 显示服务器IP |
| IPSec VPN | UDP 业务 | 显示服务器IP |
| V2Ray | TCP 业务 | 显示服务器IP |
| V2Ray + TLS | HTTPS 网络连接 | 显示证书域名 |
| nghttpx + TLS | HTTPS 网络连接 | 显示证书域名 |
| kcptun | UDP 业务 | 显示服务器IP |

