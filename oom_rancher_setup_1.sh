# as root
curl https://releases.rancher.com/install-docker/1.12.sh | sh
git clone -b release-1.1.0 http://gerrit.onap.org/r/oom
#cp oom/kubernetes/config/prepull_docker.sh
#./prepull_docker.sh
docker run -d --restart=unless-stopped -p 8880:8080 rancher/server:v1.6.10
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
mkdir ~/.kube
wget http://storage.googleapis.com/kubernetes-helm/helm-v2.3.0-linux-amd64.tar.gz
tar -zxvf helm-v2.3.0-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm

# pending create of client host
# pending token and paste to
#vi ~/.kube/config
