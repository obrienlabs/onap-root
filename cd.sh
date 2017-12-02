# 20171030 CD SCRIPT to replace ONAP on a running VM
# see INT-120
#
# do a chmod 777 on /dockerdata-nfs so e can delete the dir using the jenkins user
echo "$(date)"
echo "provide onap-parameters.yaml, setenv.sh (overrides for apps)"

# fix virtual memory for onap-log:elasticsearch under Rancher 1.6.11 - OOM-431
sudo sysctl -w vm.max_map_count=262144
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
# patch for OOM-420


#set -a
echo "start config pod"
source oom/kubernetes/oneclick/setenv.bash
#echo "source setenv override"
#./helm_apps.bash
#echo "HELM_APPS: $HELM_APPS"
#export HELM_APPS_MIN=('message-router' 'sdnc' 'vid' 'robot' 'portal' 'policy' 'appc' 'aai' 'sdc' 'log')
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
while [  $(kubectl get pods -n onap -a | grep config | grep 0/1 |  wc -l) -gt 0 ]; do
    sleep 15
    echo "waiting for config pod to complete"
done

echo "start onap pods"
cd oom/kubernetes/oneclick
#./createAll.bash -n onap

# workaround for OOM-448 - run independently
./createAll.bash -n onap -a consul
./createAll.bash -n onap -a msb
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
./createAll.bash -n onap -a dcaegen2
./createAll.bash -n onap -a log
./createAll.bash -n onap -a cli
./createAll.bash -n onap -a multicloud
./createAll.bash -n onap -a clamp
./createAll.bash -n onap -a vnfsdk
./createAll.bash -n onap -a uui
./createAll.bash -n onap -a aaf
./createAll.bash -n onap -a vfc
./createAll.bash -n onap -a kube2msb

cd ../../../

echo "wait for all pods up for 10 min"
FAILED_PODS_LIMIT=2
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
      FAILED_PODS_LIMIT=120 
    fi
done

echo "report on non-running containers"
PENDING=$(kubectl get pods --all-namespaces | grep 0/)
PENDING_COUNT=$(kubectl get pods --all-namespaces | grep 0/ | wc -l)
PENDING_COUNT_AAI=$(kubectl get pods -n onap-aai | grep 0/ | wc -l)
if [ "$PENDING_COUNT_AAI" -gt 0 ]; then
    echo "down-aai=${PENDING_COUNT_AAI}"
fi
PENDING_COUNT_APPC=$(kubectl get pods -n onap-appc | grep 0/ | wc -l)
if [ "$PENDING_COUNT_APPC" -gt 0 ]; then
    echo "down-appc=${PENDING_COUNT_APPC}"
fi
PENDING_COUNT_MR=$(kubectl get pods -n onap-message-router | grep 0/ | wc -l)
if [ "$PENDING_COUNT_MR" -gt 0 ]; then
    echo "down-mr=${PENDING_COUNT_MR}"
fi
PENDING_COUNT_SO=$(kubectl get pods -n onap-mso | grep 0/ | wc -l)
if [ "$PENDING_COUNT_SO" -gt 0 ]; then
    echo "down-so=${PENDING_COUNT_SO}"
fi
PENDING_COUNT_POLICY=$(kubectl get pods -n onap-policy | grep 0/ | wc -l)
if [ "$PENDING_COUNT_POLICY" -gt 0 ]; then
    echo "down-policy=${PENDING_COUNT_POLICY}"
fi
PENDING_COUNT_PORTAL=$(kubectl get pods -n onap-portal | grep 0/ | wc -l)
if [ "$PENDING_COUNT_PORTAL" -gt 0 ]; then
    echo "down-portal=${PENDING_COUNT_PORTAL}"
fi
PENDING_COUNT_LOG=$(kubectl get pods -n onap-log | grep 0/ | wc -l)
if [ "$PENDING_COUNT_LOG" -gt 0 ]; then
    echo "down-log=${PENDING_COUNT_LOG}"
fi
PENDING_COUNT_ROBOT=$(kubectl get pods -n onap-robot | grep 0/ | wc -l)
if [ "$PENDING_COUNT_ROBOT" -gt 0 ]; then
    echo "down-robot=${PENDING_COUNT_ROBOT}"
fi
PENDING_COUNT_SDC=$(kubectl get pods -n onap-sdc | grep 0/ | wc -l)
if [ "$PENDING_COUNT_SDC" -gt 0 ]; then
    echo "down-sdc=${PENDING_COUNT_SDC}"
fi
PENDING_COUNT_SDNC=$(kubectl get pods -n onap-sdnc | grep 0/ | wc -l)
if [ "$PENDING_COUNT_SDNC" -gt 0 ]; then
    echo "down-sdnc=${PENDING_COUNT_SDNC}"
fi
PENDING_COUNT_VID=$(kubectl get pods -n onap-vid | grep 0/ | wc -l)
if [ "$PENDING_COUNT_VID" -gt 0 ]; then
    echo "down-vid=${PENDING_COUNT_VID}"
fi

PENDING_COUNT_AAF=$(kubectl get pods -n onap-aaf | grep 0/ | wc -l)
if [ "$PENDING_COUNT_AAF" -gt 0 ]; then
    echo "down-aaf=${PENDING_COUNT_AAF}"
fi
PENDING_COUNT_CONSUL=$(kubectl get pods -n onap-consul | grep 0/ | wc -l)
if [ "$PENDING_COUNT_CONSUL" -gt 0 ]; then
    echo "down-consul=${PENDING_COUNT_CONSUL}"
fi
PENDING_COUNT_MSB=$(kubectl get pods -n onap-msb | grep 0/ | wc -l)
if [ "$PENDING_COUNT_MSB" -gt 0 ]; then
    echo "down-msb=${PENDING_COUNT_MSB}"
fi
PENDING_COUNT_DCAE=$(kubectl get pods -n onap-dcaegen2 | grep 0/ | wc -l)
if [ "$PENDING_COUNT_DCAE" -gt 0 ]; then
    echo "down-dcae=${PENDING_COUNT_DCAE}"
fi
PENDING_COUNT_CLI=$(kubectl get pods -n onap-cli | grep 0/ | wc -l)
if [ "$PENDING_COUNT_CLI" -gt 0 ]; then
    echo "down-cli=${PENDING_COUNT_CLI}"
fi
PENDING_COUNT_MULTICLOUD=$(kubectl get pods -n onap-multicloud | grep 0/ | wc -l)
if [ "$PENDING_COUNT_MULTICLOUD" -gt 0 ]; then
    echo "down-multicloud=${PENDING_COUNT_MULTICLOUD}"
fi
PENDING_COUNT_CLAMP=$(kubectl get pods -n onap-clamp | grep 0/ | wc -l)
if [ "$PENDING_COUNT_CLAMP" -gt 0 ]; then
    echo "down-clamp=${PENDING_COUNT_CLAMP}"
fi
PENDING_COUNT_VNFSDK=$(kubectl get pods -n onap-vnfsdk | grep 0/ | wc -l)
if [ "$PENDING_COUNT_VNFSDK" -gt 0 ]; then
    echo "down-vnfsdk=${PENDING_COUNT_VNFSDK}"
fi
PENDING_COUNT_UUI=$(kubectl get pods -n onap-uui | grep 0/ | wc -l)
if [ "$PENDING_COUNT_UUI" -gt 0 ]; then
    echo "down-uui=${PENDING_COUNT_UUI}"
fi
PENDING_COUNT_VFC=$(kubectl get pods -n onap-vfc | grep 0/ | wc -l)
if [ "$PENDING_COUNT_VFC" -gt 0 ]; then
    echo "down-vfc=${PENDING_COUNT_VFC}"
fi
PENDING_COUNT_KUBE2MSB=$(kubectl get pods -n onap-kube2msb | grep 0/ | wc -l)
if [ "$PENDING_COUNT_KUBE2MSB" -gt 0 ]; then
    echo "down-kube2msb=${PENDING_COUNT_KUBE2MSB}"
fi
echo "pending containers=${PENDING_COUNT}"
echo "${PENDING}"

echo "check filebeat 2/2 count"
FILEBEAT=$(kubectl get pods --all-namespaces -a | grep 2/)
echo "${FILEBEAT}"
echo "sleep 4 min - to allow rest frameworks to finish"
sleep 240
echo "run healthcheck 3 times to warm caches and frameworks so rest enpoints to report properly - see OOM-447"

#cd /dockerdata-nfs/onap/robot/
# OOM-484 - robot scripts moved
cd oom/kubernetes/robot
echo "run healthcheck prep 1"
./ete-k8s.sh health > ~/health1.out
echo "run healthcheck prep 2"
./ete-k8s.sh health > ~/health2.out
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
