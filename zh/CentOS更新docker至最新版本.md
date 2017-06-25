# CentOS更新Docker至最新版本



## 介绍



> 经过多次的更新迭代.从Docker到Docker-engine再到现在的Docker-CE/EE.Docker的版本号也一路飙升.现在已经到了17.05.然而如果用户从CentOS的官方仓库获取Docker的话.只能获得老版本的Docker.无法使用最新Docker的各种特性.故本教程旨在引导用户将系统中的Docker更新至最新版本.



## 系统要求



​        **要安装`Docker-CE`,你需要将你的系统升级到`CentOS7`并且确认是64位版本.即x86_x64**



## 卸载旧版本的Docker



​       **旧版本的`Docker`可能被称为`Docker`或者`Docker-engine`,如果这些已经被安装到系统中,为了正常安装.需要将他们已经他们的依赖卸载.**

```
sudo yum remove docker \
                  docker-common \
                  container-selinux \
                  docker-selinux \
                  docker-engine \
                  docker-engine-selinux  
```

 **关于卸载的一些提示:**

* **如果`yum`提示这些没有安装.请放心这是可以的.**
* **所有默认在`/var/lib/Docker/`的镜像.容器.数据.网络等等都会被保留.**





## 使用仓库安装最新版Docker



### 安装Docker的依赖



```
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```



### 安装Docker官方仓库



```
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```



### 更新仓库源



```
sudo yum makecache fast
```

* **注意.如果你是第一次安装Docker.会提示接受gpg密钥.接受即可**





### 从仓库安装Docker-CE



```
sudo yum install docker-ce
```



**安装制定版本的Docker**

```
sudo yum install docker-ce-<VERSION>
```



### 启动Docker



```
sudo systemctl start docker
```



### 设置Docker开机启动



```
sudo systemctl enable docker
```



**EOF.**

