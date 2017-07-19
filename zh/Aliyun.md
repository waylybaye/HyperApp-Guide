## 1.使用ssh登陆你的阿里云服务器
## 2.参考这篇文档来安装你的docker服务器:
https://github.com/waylybaye/HyperApp-Guide/blob/master/zh/centos-upgrade-docker.md
### 概况一下要点（嫌麻烦的人可以直接复制回车就好）
##### 另外下文代码中的sudo，在使用root权限登陆时可以省略
###### 安装Docker的依赖
`sudo yum install -y yum-utils device-mapper-persistent-data lvm2`
###### 安装Docker官方仓库
```
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```
###### 更新仓库源
`sudo yum makecache fast`
###### 从仓库安装Docker-CE
`sudo yum install docker-ce`
###### 启动Docker服务并设置成开机启动
```
sudo systemctl start docker
sudo systemctl enable docker
```
### 3.使用阿里云docker镜像加速服务
1. 访问：https://dev.aliyun.com/search.html
1. 点击右上角的管理中心选项
1. 进入后会提示设置密码，请随意
1. 之后在左边的选单里面选择**docker hub 镜像站点**这个选项
1. 获得你的专属加速地址
1. 在操作文档中选择你对应的操作系统
1. 找到如何使用docker加速器这一节
1. 使用**针对Docker客户端版本大于1.10的用户**这一节的内容来启用加速服务
------------
以centos来举例，网站给出的代码为:
```
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["你的专属加速地址，一般已自动填充完成，如果没有请自行复制"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```
复制顺序为：
1. `sudo mkdir -p /etc/docker`
1. 
```
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["你的专属加速地址，一般已自动填充完成，如果没有请自行复制"]
}
EOF
```
3. `sudo systemctl daemon-reload`
4. `sudo systemctl restart docker`
