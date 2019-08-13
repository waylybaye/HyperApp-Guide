# 使用 Workflow 自动在服务器上运行命令

## HyperApp URL Scheme

Servers

```
hyperapp://servers/[name or ALL]/[shutdown|reboot|terminal|execute]?cmd=

[server name] 
服务器的名字或者是 ALL 选择所有服务器（Terminal不支持 ALL）

[actions]
shutdown: 关机
reboot: 重启
terminal?cmd=: 表示打开SSH 终端并且运行 cmd 命令。
execute?cmd=: 运行 cmd 命令但不打开终端。
```

例子：

```sh
# 重启 HTTPD 服务
hyperapp://servers/ALL/execute?cmd=sudo service restart httpd

# 使用 youtube-dl 下载视频
hyperapp://servers/myServer/execute?cmd=cd /var/www && youtube-dl 'https://tumbr.com/xxxx'
```

---

Apps:

```
hyperapp://apps/[app name]/[start|stop|restart]

[app name]:
应用的名字

[actions]:
start: 在所有部署的服务器上启动此应用
stop: 在所有部署的服务器上关闭此应用
restart: 在所有部署的服务器上重启此应用
```

Examples:
```bash
# 重启 nginx 应用
hyperapp://apps/nginx/restart
```

## Workflow


### Today Widget 自动运行命令

新建一个 Workflow，选择类型为 Today Widget，并从左侧 Actions 中将 URL 拖到页面中，填入你想运行的命令:  
`hyperapp://servers/ALL/execute?cmd=sudo service httpd restart`

然后从左侧拖进来 `Open URLs`，现在你就在 Today Widget 中一键重启服务进程了。


<!--### 将网页作为参数运行命令

新建一个 Workflow，选择类型为 Action Extension。

在 `This workflow accepts` 中选择 `URLs`，在左侧拖动 `URL` 进来，并且填入:  
`hyperapp://servers/linode/execute?cmd=cd /var/www && youtube-dl `  
然后点击 `Variables` 选择 `Workflow Input`。-->




