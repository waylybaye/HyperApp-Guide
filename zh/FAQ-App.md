## 应用问题

### 关于 Nginx 的上传限制

* 如果你使用了 `Nginx Proxy`，则默认存在2M的文件上传限制，你可以通过执行以下命令自动创建解除限制所需的文件来解开限制,执行完毕后重启`Nginx Proxy`即可

```sh
echo "client_max_body_size 100m;" > /srv/docker/nginx/vhost.d/default
```
* 如果原命令执行后无效果，可以尝试以下两种方案,执行完毕后同样重启：

1. ```echo "client_max_body_size 100m;" | sudo tee -a /srv/docker/nginx/vhost.d/default```
2. ```sudo su echo "client_max_body_size 100m;" > /srv/docker/nginx/vhost.d/default```



### 关于 PHP 内置的上传限制

* 请参考以下链接中的解决方案:

  https://github.com/waylybaye/HyperApp-Guide/issues/152



### NextCloud 安装问题

1. 设置数据库时,填入数据库的账号密码之后,提示authentication出现问题,无法认证
   这是MySQL的新版本更新了验证方式,比较简单的方式是在安装mysql时,手动选择`5.x`版本的镜像,不要选择`latest`,另一个方案是使用Mariadb,两者在后续操作上没有区别
2. 进行安全检查时,提示没有设置`referer`
   解决方法参考更改nginx的默认上传大小,在``` srv/docker/nginx/vhost.d/```目录下,新建一个文件,文件名为你为nextcloud分配的域名(要完整),在里面加入两条记录```add_header Referrer-Policy no-referrer;client_max_body_size 500m;``` ,你可以使用 ```echo "add_header Referrer-Policy no-referrer;client_max_body_size 500m;" >> /srv/docker/nginx/vhost.d/你的域名```



### Wordpress 提示设置ftp
在自动更新wordpress新版本时,提示填入ftp凭据,这是由于在配置wordpress的过程中文件没有写权限造成的,所以需要重新更改权限.查询一下wordpress的container name,然后执行 ```docker exec CONTAINER_NAME chown -R www-data:www-data /var/www/html```,`CONTAINER_NAME`填写你查询到的结果,具体参考[这里](https://github.com/docker-library/wordpress/issues/24).



###  关于`squid`内存不足无法正确启动

1. `Ubuntu`及`Debian`使用如下命令创建`swap`:

```bash
sudo su
fallocate -l 1G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
echo "vm.swappiness = 10" » /etc/sysctl.conf
sysctl -p
```

* Centos请将
  
  ```
  echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
  ```
  
  换成
  
  ```
  echo "/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab
  ```
  
  

### V2ray不能连接排查

* 确定完全按教程操作
  * 填写 config.json新建docker默认值被遮挡，且与教程所给值不一致，需更改为srv/docker/etc/v2ray.json
  * 应用端口需手动填写，不要和别的教程一样默认自动抓取了
  * 域名填写低调一点的
  * centos7注意开启防火墙，添加新端口（你填的port），并重启防火墙，下面写为yyy，在ssh中执行
  ```
  firewall-cmd --add-port=yyy/tcp --permanent && firewall-cmd --reload
  ```
  * 更新配置或安装后启动docker，注意要手动重启Nginx proxy和Nginx SSL Support
* 出错后检查思路
  * 先检查证书是否存在.tls域名是否正常.伪装应用是否正常
  * 再检查后端v2ray的服务端配置
  * 再检查客户端配置
  * 在商店安装的应用遇到问题
  * 应用的使用过程中遇到限制或者其他问题



### 关于V2Ray访问域名出现Bad Request的解决办法

* 如果你按照教程搭建了`Nginx(tls)+V2Ray(websocket)`.那么访问证书域名的时候往往会出现bad request的情况.这是成功的标志.但是总不那么好看.这里给出一个跳转到其他域名的办法.执行以下命令即可.注意修改命令中的域名

```sh
echo -e "proxy_intercept_errors on;\nerror_page 400 = https://要跳转到的域名;" > /srv/docker/nginx/vhost.d/default
```