#!/bin/bash

mkdir /tmp/bin
cd /tmp/bin
wget https://releases.hashicorp.com/consul/0.7.1/consul_0.7.1_linux_amd64.zip
wget https://releases.hashicorp.com/consul/0.7.1/consul_0.7.1_web_ui.zip
unzip consul_0.6.4_web_ui.zip
unzip consul_0.6.4_linux_amd64.zip
rm *.zip

mkdir /var/consul
mkdir -p /home/consul/www
mkdir -p /etc/consul.d/{server,bootstrap}
mv consul /usr/local/bin/
mv index.html /home/consul/www/
mv static/ /home/consul/www/

mkdir -p /etc/consul.d/bootstrap
mkdir -p /etc/consul.d/server
touch /etc/consul.d/bootstrap/config.json /etc/consul.d/server/config.json
