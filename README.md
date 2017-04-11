
# HyperApp Manual

English version | [中文版](./README_zh.md)



## What's HyperApp

HyperApp is a Docker Automation iOS app and an SSH Terminal.

[![HyperApp on AppStore](https://linkmaker.itunes.apple.com/assets/shared/badges/en-us/appstore-lrg.svg "View on App Store")](https://itunes.apple.com/app/apple-store/id1179750280?pt=118260435&ct=guide&mt=8)


#### Docker Automation

HyperApp comes with many featured docker images that we have listed all configuration for you, you can deploy & config them in a user-friendly way.

#### Linux management

* Monitor: HyperApp helps you monitor your servers status easily and quickly.
* SSH Terminal: the terminal helps you to login to your servers at anytime anywhere.

---

## TOC

* [Prerequisites](#prerequisites)
    * [Supported Linux](#supported-linux)
* [Servers](#servers)
* [Docker](#docker)
    * [Add Docker](#add-docker)
    * [Deploy Docker](#deploy-docker)
* [Store](#store)
* [FAQ](#faq)

---


### Prerequisites

**SSH Terminal support all versions of Linux**, but Docker automation only support specific versions.

#### Supported Linux

* Docker only support 64 bit system
* Kernel version 3.10+
* Ubuntu 14，16 ✅
* CentOS 7 ✅
* Debian 8 ✅
* CentOS 6 ⚠️ 
* Not support OpenVZ servers ❌

*CentOS 6 does work with docker, but some hosting providers have old kernel lower than 3.10 installed*

---

### Servers

You can monitor your servers/routers status in Severs tab

![Servers](https://github.com/waylybaye/HyperApp-Guide/raw/master/images/manage-server.png "Servers")

Click the plus button to add your own server:

1. Docker automation need a root user or a user with sudo permission.
    * Name: Set a name for your server.
    * Host: Your server's IP address or domain.
    * Port: The SSH server port, normally it's 22.
    * User: Your username
    * Password: Your password, if you authenticate using pubkey then leave it blank.

2. If you authenticate using pubkey, then please copy the private key content to your phone and click "Paste Privatekey from Clipboard", fill the `passhprase` too if your private key is crypted.


[查看如何配置 Google CloudEngine 和 AWS](./cloud.md)  

---


### Dockers

#### Add Docker

![Docker](https://github.com/waylybaye/HyperApp-Guide/raw/master/images/add-app.png "Docker")

1. Open `Store` tab and click one of the docker images.
2. Choose the servers you want to deploy.
3. It will take you to the config page after creation, you can see all the configuration of selected image.
4. click `Next` if you finished configuration or click `Skip` to configure it later.

#### Deploy Docker

![manage docker](https://github.com/waylybaye/HyperApp-Guide/raw/master/images/manage-app.png "manage docker")

1. Open `Apps` tab，click one of the server name, it will show the action sheet.
2. Click `Install` to install it to selected server.
3. It will show the progress under the card, you can track the status in realtime.


---

### Store

#### How to run a Docker image not listed？

You can click the `Docker Image` item and input any image you want to run.

*the `-d` option is enabled by default*

#### How to ask HyperApp add more docker images？

You can create issues if this repo.

---

### FAQ







