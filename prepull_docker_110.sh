NEXUS3=nexus3.onap.org:10001
docker login -u docker -p docker nexus3.onap.org:10001
echo "running docker image pulls in parallel for 1.1.0"

docker pull $NEXUS3/onap/aaf/authz-service:latest & #>/dev/null 2>&1 
docker pull $NEXUS3/library/cassandra:2.1.17 & #>/dev/null 2>&1
docker pull $NEXUS3/aaionap/haproxy:1.1.0 & #>/dev/null 2>&1
docker pull $NEXUS3/aaionap/hbase:1.2.0 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/model-loader:v1.1.0 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/aai-resources:v1.1.0 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/aai-traversal:v1.1.0 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/data-router:v1.1.0 & #>/dev/null 2>&1
docker pull $NEXUS3/elasticsearch:2.4.1 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/search-data-service:v1.1.0 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/sparky-be:v1.1.0 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/appc-image:v1.2.0 & #>/dev/null 2>&1
docker pull $NEXUS3/mysql/mysql-server:5.6 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/ccsdk-dgbuilder-image:v0.1.0 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/clamp:v1.1.0 & #>/dev/null 2>&1
docker pull $NEXUS3/mariadb:10.1.11 & #>/dev/null >&1
docker pull $NEXUS3/onap/cli:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull docker.io/consul:0.9.3 & #>/dev/null 2>&1
docker pull $NEXUS3/oomk8s/pgaas:1 & #>/dev/null 2>&1
docker pull $NEXUS3/oomk8s/cdap-fs:1.0.0 & #>/dev/null 2>&1
docker pull $NEXUS3/oomk8s/cdap:1.0.7 & #>/dev/null 2>&1
docker pull $NEXUS3/attos/dmaap:latest & #>/dev/null 2>&1
docker pull $NEXUS3/wurstmeister/kafka:latest & #>/dev/null 2>&1
docker pull $NEXUS3/wurstmeister/zookeeper:latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/dcae-collector-common-event:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/dcae-controller:1.1-STAGING-latest >/dev/null & #2>&1
docker pull $NEXUS3/openecomp/dcae-dmaapbc:1.1-STAGING-latest >/dev/null & #2>&1
docker pull $NEXUS3/onap/org.onap.dcaegen2.deployments.bootstrap & #>/dev/null 2>&1
docker pull $NEXUS3/onap/oom/kube2msb >/dev/null & #2>&1
docker pull docker.elastic.co/logstash/logstash:5.4.3 & #>/dev/null 2>&1
docker pull docker.elastic.co/kibana/kibana:5.5.0 & #>/dev/null 2>&1
docker pull docker.elastic.co/elasticsearch/elasticsearch:5.5.0 & #>/dev/null 2>&1
docker pull $NEXUS3/busybox & #>/dev/null & #2>&1
docker pull $NEXUS3/onap/msb/msb_discovery:1.0.0 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/msb/msb_apigateway:latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/mso:v1.1.1 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/multicloud/framework:v1.0.0 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/multicloud/vio:v1.0.0 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/multicloud/openstack-ocata:v1.0.0 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/multicloud/openstack-windriver:v1.0.0 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/policy/policy-db:v1.1.1 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/policy/policy-drools:v1.1.1 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/policy/policy-nexus:v1.1.1 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/policy/policy-pe:v1.1.1 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/portal-apps:v1.3.0 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/portal-db:v1.3.0 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/portal-wms:v1.3.0 & #>/dev/null 2>&1
docker pull $NEXUS3/oomk8s/mariadb-client-init:1.0.0 & # >/dev/null 2>&1
docker pull $NEXUS3/oomk8s/ubuntu-init:1.0.0 & #>/dev/null 2>&1
docker pull $NEXUS3/dorowu/ubuntu-desktop-lxde-vnc & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/testsuite:v1.1.0 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/sdc-kibana:v1.1.0 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/sdc-backend:v1.1.0 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/sdc-cassandra:v1.1.0 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/sdc-elasticsearch:v1.1.0 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/sdc-frontend:v1.1.0 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/sdnc-image:v1.2.1 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/admportal-sdnc-image:v1.2.1 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/nslcm:v1.0.2 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/resmanagement:v1.0.0 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/gvnfmdriverv:1.0.1 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/ztevmanagerdriver:v1.0.2 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/nfvo/svnfm/huawei:v1.0.2 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/ztesdncdriver:v1.0.0 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/nfvo/svnfm/nokia:v1.0.2 &
docker pull $NEXUS3/onap/vfc/jujudriver:v1.0.0 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/vnflcm:v1.0.1 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/vnfres:v1.0.1 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/vnfmgr:v1.0.1 &
docker pull $NEXUS3/onap/vfc/wfengine-activiti:v1.0.0
docker pull $NEXUS3/onap/vfc/wfenginemgrservice:v1.0.0 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/catalog:v1.0.2 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/ubuntu-sdnc-image:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/vid:v1.1.1 & #>/dev/null 2>&1
docker pull $NEXUS3/library/mariadb:10 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/refrepo:1.0-STAGING-latest & #>/dev/null 2>&1
#docker pull $NEXUS3/onap/sniroemulator & #>/dev/null 2>&1
echo "finished launching pulls"
MAX_WAIT_INTERVALS=300
while [  $(ps -ef | grep docker | grep pull | wc -l) -gt 1 ]; do
  sleep 10
  MAX_WAIT_INTERVALS=$((MAX_WAIT_INTERVALS - 1))
  echo "waiting for last pull"
  if [ "$MAX_WAIT_INTERVALS" -eq 0 ]; then
    break
  fi
done
