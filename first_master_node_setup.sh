#!/bin/bash

#update system
sudo apt update && sudo apt upgrade -y --force

# add k3s in env
export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san $(hostname) --node-ip 192.168.56.10  --bind-address=192.168.56.10 --advertise-address=192.168.56.10"

#download and configure firewall
sudo apt install -y ufw
sudo ufw enable -y
sudo ufw allow 6443/tcp
sudo ufw allow 8472/udp
sudo ufw allow 51820/udp
sudo ufw allow 51821/udp
sudo ufw allow 10250/tcp
sudo ufw allow 2379/tcp
sudo ufw allow 2380/tcp

# download and run k3s agent
curl -sfL https://get.k3s.io | K3S_TOKEN='^SH{Ge-jhWHdP<X"lX0A' sh -s - server --cluster init

# copy master node token for worker node
sudo cp /var/lib/rancher/k3s/server/node-token /mnt/token/
