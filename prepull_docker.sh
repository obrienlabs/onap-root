NEXUS3=nexus3.onap.org:10001
docker login -u docker -p docker nexus3.onap.org:10001
echo "running docker image pulls in parallel"
docker pull $NEXUS3/onap/aaf/authz-service:latest & #>/dev/null 2>&1 
docker pull $NEXUS3/library/cassandra:2.1.17 & #>/dev/null 2>&1
docker pull $NEXUS3/aaionap/haproxy:latest & #>/dev/null 2>&1
docker pull $NEXUS3/aaionap/hbase:1.0.0 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/model-loader:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/aai-resources:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/aai-traversal:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/data-router:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/elasticsearch:2.4.1 & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/search-data-service:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/sparky-be:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/appc-image:1.1-STAGING-latest & #>/dev/null 2>&1	
docker pull $NEXUS3/mysql/mysql-server:5.6 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/ccsdk-dgbuilder-image:0.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/clamp:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/mariadb:10.1.11 & #>/dev/null >&1
docker pull $NEXUS3/onap/cli:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull docker.io/consul:latest & #>/dev/null 2>&1
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
docker pull $NEXUS3/onap/msb/msb_discovery:latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/msb/msb_apigateway:latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/mso:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/multicloud/framework:latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/multicloud/vio:latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/multicloud/openstack-ocata:latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/multicloud/openstack-windriver:latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/policy/policy-db:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/policy/policy-drools:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/policy/policy-nexus:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/policy/policy-pe:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/portal-apps:1.3-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/portal-db:1.3-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/portal-wms:1.3-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/oomk8s/mariadb-client-init:1.0.0 & # >/dev/null 2>&1
docker pull $NEXUS3/oomk8s/ubuntu-init:1.0.0 & #>/dev/null 2>&1
docker pull $NEXUS3/dorowu/ubuntu-desktop-lxde-vnc & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/testsuite:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/sdc-kibana:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/sdc-backend:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/sdc-cassandra:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/sdc-elasticsearch:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/sdc-frontend:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/sdnc-image:1.2-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/admportal-sdnc-image:1.2-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/nslcm:latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/resmanagement:latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/gvnfmdriver:latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/ztevmanagerdriver:latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/nfvo/svnfm/huawei:latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/ztesdncdriver:latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/jujudriver:latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/vnflcm:latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/vnfres:latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/wfenginemgrservice:latest & #>/dev/null 2>&1
docker pull $NEXUS3/onap/vfc/catalog:latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/ubuntu-sdnc-image:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/openecomp/vid:1.1-STAGING-latest & #>/dev/null 2>&1
docker pull $NEXUS3/library/mariadb:10 & #>/dev/null 2>&1
docker pull $NEXUS3/onap/refrepo:1.0-STAGING-latest & #>/dev/null 2>&1
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
