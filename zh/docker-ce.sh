#!/bin/bash
su root
yum -y install bc
kenel=`uname -r`
kenel=`echo ${kenel:0:3}`
if [ $(echo "${kenel} >= 3.10" | bc) = 1 ];then
echo "type yes to remove old docker :"
read key
if "$key" = "yes";then 
sudo yum remove -y docker \
                  docker-common \
                  container-selinux \
                  docker-selinux \
                  docker-engine \
                  docker-engine-selinux  
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum makecache fast
sudo yum -y install docker-ce
sudo systemctl start docker
sudo systemctl enable docker
else exit
fi
else
echo "update your kernel version , it must be at least 3.10 !"
fi
