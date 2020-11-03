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
