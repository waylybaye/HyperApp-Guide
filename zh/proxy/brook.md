# 简易搭建brook代理

> 心血来潮做了个brook的镜像,做好之后放在那里好多天没动过.刚好回家就发篇文章

### 本文原文链接为 https://vinga.tech/brook 

## 更新记录

* 2017.11.25: 写了教程

## 准备

* **HyperApp**
* **耐心.仔细.认真**

#### 到HyperApp进行设置

1. **转到商店页面.找到``Docker Image``然后选择服务器并且保存进入配置界面**
2. **请完全按照下图配置进行填写！**


| 应用设置名称  |                    内容                    |
| :-----: | :--------------------------------------: |
|  Image  |          fanvinga/docker-brook           |
| Options | -p 你要的端口:8888 -e PASSWORD=你要的密码 -e MODE=server |
| Command |                                          |
|  Args   |                                          |

* **没有填写的设置即为留空**
## 大功告成

* **现在按照教程链接吧!**

## 官方教程地址

https://github.com/txthinking/brook/wiki



