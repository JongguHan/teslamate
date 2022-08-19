#!/bin/sh
set -e
#prevent error
#sudo rpm -Uvh https://download.docker.com/linux/centos/8/x86_64/stable/Packages/containerd.io-1.4.6-3.1.el8.x86_64.rpm
# Auto Script For Teslamate
curl -L "https://raw.githubusercontent.com/teslacloud9/teslamate/master/centos/docker-ce.repo" -o docker-ce.repo
sudo yum-config-manager --add-repo ./docker-ce.repo
sudo yum -y install slirp4netns fuse-overlayfs container-selinux

sudo sed -i 's/$releasever/7/g' /etc/yum.repos.d/docker-ce.repo
sudo yum install -y docker-ce
sudo systemctl start docker
sudo systemctl enable docker
sudo docker --version
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version
curl -L "https://raw.githubusercontent.com/JongguHan/teslamate/main/docker-compose.yml" -o docker-compose.yml
sudo docker-compose up -d
