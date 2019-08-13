# 阿里云 Docker 镜像加速


## 配置过程

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
```sh
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["你的专属加速地址，一般已自动填充完成，如果没有请自行复制"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```

可以将其复制到终端里面执行。复制顺序为：

1. `sudo mkdir -p /etc/docker`
2. 
```
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["你的专属加速地址，一般已自动填充完成，如果没有请自行复制"]
}
EOF
```
3. `sudo systemctl daemon-reload`
4. `sudo systemctl restart docker`


