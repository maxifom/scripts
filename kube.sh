#!/bin/bash

set -ex;
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl";
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256";
echo "$(<kubectl.sha256) kubectl" | sha256sum --check;
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl;
kubectl version --client;

wget https://get.helm.sh/helm-v3.6.0-linux-amd64.tar.gz;

tar -zxvf helm-v3.6.0-linux-amd64.tar.gz;
mv linux-amd64/helm /usr/local/bin/helm;
