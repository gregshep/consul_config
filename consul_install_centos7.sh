#!/bin/bash

mkdir /tmp/bin
cd /tmp/bin
wget https://releases.hashicorp.com/consul/0.7.1/consul_0.7.1_linux_amd64.zip
wget https://releases.hashicorp.com/consul/0.7.1/consul_0.7.1_web_ui.zip
unzip consul_0.7.1_linux_amd64.zip
unzip consul_0.7.1_web_ui.zip
rm *.zip

mkdir /var/consul
mkdir -p /home/consul/www
mkdir -p /etc/consul.d/{server,bootstrap}
mv consul /usr/local/bin/
mv index.html /home/consul/www/
cp static/ /home/consul/www/

mkdir -p /etc/consul.d/bootstrap
mkdir -p /etc/consul.d/server
cd ~centos/consul_config
cp bootstrap_config.json /etc/consul.d/bootstrap/config.json
cp server_config.json /etc/consul.d/server/config.json
cp consul.service /etc/systemd/system/consul.service

systemctl start consul.service
systemctl enable consul

/usr/local/bin/consul members
