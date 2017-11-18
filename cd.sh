# 20171030 CD SCRIPT to replace ONAP on a running VM
# see INT-120
#
# do a chmod 777 on /dockerdata-nfs so e can delete the dir using the jenkins user
echo "$(date)"
echo "provide onap-parameters.yaml, setenv.sh (overrides for apps)"
echo "remove existing oom"
cd ~/
source oom/kubernetes/oneclick/setenv.bash
oom/kubernetes/oneclick/deleteAll.bash -n onap
sleep 10
# verify
DELETED=$(kubectl get pods --all-namespaces -a | grep 0/ | wc -l)

helm delete --purge onap-config
# wait for 0/1 before deleting
echo "sleeping 2 min"
# replace with watc
# keep jenkins 120 sec timeout happy with echos
sleep 120
sudo chmod -R 777 /dockerdata-nfs
rm -rf /dockerdata-nfs/onap
rm -rf oom

#read -p "proc" yn
echo "pull new oom"
git clone http://gerrit.onap.org/r/oom
#set -a
echo "start config pod"
source oom/kubernetes/oneclick/setenv.bash
#echo "source setenv override"
#./helm_apps.bash
#echo "HELM_APPS: $HELM_APPS"
#export HELM_APPS_MIN=('mso' 'message-router' 'sdnc' 'vid' 'robot' 'portal' 'policy' 'appc' 'aai' 'sdc' 'log')
cp onap-parameters.yaml oom/kubernetes/config
cd oom/kubernetes/config
#cp onap-parameters-sample.yaml onap-parameters.yaml
./createConfig.sh -n onap
cd ../../../

echo "pre pull docker images"
#curl https://jira.onap.org/secure/attachment/10501/prepull_docker.sh > prepull_docker.sh
chmod 777 prepull_docker.sh
./prepull_docker.sh

# usually the prepull takes up to 15 min - however hourly builds will finish the docker pulls before the config pod is finisheed
echo "verify onap-config is 0/1 not 1/1 - as in completed"
while [  $(kubectl get pods -n onap -a | grep config | grep 1/1 |  wc -l) -gt 0 ]; do
    sleep 15
    echo "waiting for config pod to complete"
done

echo "start onap pods"
cd oom/kubernetes/oneclick
./createAll.bash -n onap -a mso
./createAll.bash -n onap -a message-router
./createAll.bash -n onap -a sdnc
./createAll.bash -n onap -a vid
./createAll.bash -n onap -a robot
./createAll.bash -n onap -a portal
./createAll.bash -n onap -a policy
./createAll.bash -n onap -a appc
./createAll.bash -n onap -a aai
./createAll.bash -n onap -a sdc
./createAll.bash -n onap -a log
cd ../../../

echo "wait for all pods up for 10 min"
FAILED_PODS_LIMIT=0
MAX_WAIT_PERIODS=80 # 20 MIN
COUNTER=1
while [  $(kubectl get pods --all-namespaces | grep 0/ | wc -l) -gt $FAILED_PODS_LIMIT ]; do
    PENDING=$(kubectl get pods --all-namespaces | grep 0/ | wc -l)
    sleep 15
    LIST_PENDING=$(kubectl get pods --all-namespaces | grep 0/ )
    echo "${LIST_PENDING}"
    echo "${PENDING} pending > ${FAILED_PODS_LIMIT} at the ${COUNTER}th 15 sec interval"
    COUNTER=$((COUNTER + 1 ))
    MAX_WAIT_PERIODS=$((MAX_WAIT_PERIODS - 1))
    if [ "$MAX_WAIT_PERIODS" -eq 0 ]; then
      FAILED_PODS_LIMIT=100 
    fi
done

echo "report on non-running containers"
PENDING=$(kubectl get pods --all-namespaces | grep 0/)
echo "${PENDING}"

echo "check filebeat 2/2 count"
FILEBEAT=$(kubectl get pods --all-namespaces -a | grep 2/)
echo "${FILEBEAT}"

echo "run healthcheck 3 times to warm caches and frameworks so rest enpoints to report properly - see OOM-447"

cd /dockerdata-nfs/onap/robot/
echo "run healthcheck prep 1"
./ete-k8s.sh health > health1.out
echo "run healthcheck prep 2"
./ete-k8s.sh health > health2.out
echo "run healthcheck for real - wait a further 4 min"
sleep 240
./ete-k8s.sh health 

echo "run partial vFW"
sudo chmod 777 /dockerdata-nfs/onap
./demo-k8s.sh init

echo "report results"
cd ~/
echo "$(date)"
#set +a
