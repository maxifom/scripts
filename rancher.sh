# Качаем RKE
wget https://github.com/rancher/rke/releases/download/v1.2.8/rke_linux-amd64
mv rke_linux-amd64 rke
chmod +x rke
./rke --version
mv ./rke /usr/local/bin

# Каждый ключ нового сервака нужно добавлять в authorized_keys
ssh-keygen
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
rke config --name cluster.yml

# Качаем helm 
wget https://get.helm.sh/helm-v3.6.0-linux-amd64.tar.gz -O helm.tar.gz
tar -zxvf helm.tar.gz
mv linux-amd64/helm /usr/local/bin/helm

helm repo add rancher-latest https://releases.rancher.com/server-charts/latest

# Для того чтобы kubectl работал с созданным кластером
mkdir .kube                
cp kube_config_cluster.yml ~/.kube/config

kubectl create namespace cattle-system

kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.0.4/cert-manager.crds.yaml

kubectl create namespace cert-manager
helm repo add jetstack https://charts.jetstack.io
helm repo update

helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v1.0.4

helm install rancher rancher-latest/rancher \
--namespace cattle-system \
--set hostname=rancher.example.com

# Добавление хоста - через cluster.yml
# cert-manager(Issuer) нужно создавать для 2 namespace: cattle-system(rancher) + default namespace так как он namespace-specific и нельзя Issuer одного namespace юзать в другом