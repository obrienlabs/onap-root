# F. Michael O'Brien
# 20180124
# WIP under construction for
# https://wiki.onap.org/questions/users?username=michaelobrien
# https://wiki.onap.org/display/DW/ONAP+on+Kubernetes
# Amsterdam
#     Rancher 1.6.10, Kubernetes 1.7.7, Kubectl 1.7.7, Helm 2.3.0, Docker 1.12
# master
#     Rancher 1.6.14, Kubernetes 1.8.6, Kubectl 1.8.6, Helm 2.6.1, Docker 17.3
# see migration to onap under https://jira.onap.org/browse/OOM-710
#
# run as root - because of the logout that would be required after the docker user set
#curl https://releases.rancher.com/install-docker/1.12.sh | sh

usage() {
cat <<EOF
Usage: $0 [PARAMs]
-u                  : Display usage
-b [branch]         : branch = master or amsterdam (required)
EOF
}

install_onap() {

if [ "$BRANCH" == "master" ]; then
  curl https://releases.rancher.com/install-docker/17.03.sh | sh
  # when running as non-root (ubuntu) run the following and logout/log back in
  sudo usermod -aG docker ubuntu
  docker run -d --restart=unless-stopped -p 8880:8080 --name rancher_server rancher/server:v1.6.14
  # no Kubernetes 1.9.0 yet
  curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.8.6/bin/linux/amd64/kubectl
  chmod +x ./kubectl
  sudo mv ./kubectl /usr/local/bin/kubectl
  mkdir ~/.kube
  wget http://storage.googleapis.com/kubernetes-helm/helm-v2.6.1-linux-amd64.tar.gz
  tar -zxvf helm-v2.6.1-linux-amd64.tar.gz
else # for amsterdam
  curl https://releases.rancher.com/install-docker/1.12.sh | sh
  # when running as non-root (ubuntu) run the following and logout/log back in
  sudo usermod -aG docker ubuntu
  docker run -d --restart=unless-stopped -p 8880:8080 --name rancher_server rancher/server:v1.6.10
  curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.7.7/bin/linux/amd64/kubectl
  chmod +x ./kubectl
  sudo mv ./kubectl /usr/local/bin/kubectl
  mkdir ~/.kube
  wget http://storage.googleapis.com/kubernetes-helm/helm-v2.3.0-linux-amd64.tar.gz
  tar -zxvf helm-v2.3.0-linux-amd64.tar.gz
fi

sudo mv linux-amd64/helm /usr/local/bin/helm
# pending create of client host
# see https://wiki.onap.org/display/DW/ONAP+on+Kubernetes#ONAPonKubernetes-Registeryourhost
# pending token and paste to
#vi ~/.kube/config
echo "run the following after attaching the host if you installed a higher kubectl version than the server"
echo "helm init --upgrade"
#helm init --upgrade
}


BRANCH=

while getopts ":b:u:" PARAM; do
  case $PARAM in
    u)
      usage
      exit 1
      ;;
    b)
      BRANCH=${OPTARG}
      ;;
    ?)
      usage
      exit
      ;;
    esac
done

if [[ -z $BRANCH ]]; then
  usage
  exit 1
fi

install_onap $BRANCH

