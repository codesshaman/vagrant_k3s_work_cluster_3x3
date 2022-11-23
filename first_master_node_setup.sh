#!/bin/bash

# add k3s in env
export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san $(hostname) --node-ip $1  --bind-address=$1 --advertise-address=$1 "

# download and run k3s agent
curl -sfL https://get.k3s.io | K3S_TOKEN='^SH{Ge-jhWHdP<X"lX0A' sh -s - server --cluster init

# copy master node token for worker node
sudo cp /var/lib/rancher/k3s/server/node-token /mnt/token/
