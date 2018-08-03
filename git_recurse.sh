# F. Michael O'Brien
# 20170523
# WIP under construction for
# https://wiki.onap.org/questions/users?username=michaelobrien
# onap.org
# currently transitioning clone to use repos (with various cd structure)
# 20170531 add git clone https support (for users behind a firewall)
# 20170730 add 1.1/R1 repos
# 20170831 update R1, disable mso, dcae
# 20171110 deprecate aai-service, add new aai esr repos

USAGE="Usage: $0 { pull | clone <LF id> | clone_https <LF ID> <GERRIT password>}"
echo "action: $1"

declare -a repos=(
"aaf/authz"
"aaf/cadi"
"aaf/inno"
"aaf/luaplugin"
"aaf/sms"
"aaf/sshsm"
"aai/babel"
"aai/champ"
"aai/aai-common"
#"aai/aai-common-test" # no gerrit
"aai/data-router"
"aai/gizmo"
"aai/esr-gui"
"aai/esr-server"
"aai/aai-data" # locked
"aai/aai-config" # locked
#"aai/aai-service" # locked
"aai/eis"
"aai/data-router"
"aai/logging-service"
"aai/model-loader"
"aai/resources"
"aai/rest-client"
"aai/router-core"
"aai/search-data-service"
"aai/sparky-be"
"aai/sparky-fe"
"aai/test-config"
"aai/traversal"
"aai/chameleon"
"aai/event-client"
"aai/gallifrey"
"aai/gap"
"aai/graphadmin"
"aai/graphgraph"
"aai/spike"
"aai/tabular-data-service"
"appc"
"appc/deployment"
"appc/cdt"
"ccsdk/parent"
#"ccsdk/sli"
"ccsdk/dashboard"
"ccsdk/distribution"
"ccsdk/parent"
"ccsdk/sli/adaptors"
"ccsdk/sli/core"
"ccsdk/sli/northbound"
"ccsdk/sli/plugins"
"ccsdk/storage/esaas"
"ccsdk/storage/pgaas"
"ccsdk/platform/blueprints"
"ccsdk/platform/nbapi"
"ccsdk/platform/plugins"
"ccsdk/utils"
"ci-management"
"clamp"
"cla"
"cli"
"oparent"
"dcaegen2"
"dcaegen2/analytics"
"dcaegen2/analytics/tca"
"dcaegen2/collectors"
"dcaegen2/collectors/snmptrap"
"dcaegen2/collectors/ves"
"dcaegen2/deployments"
"dcaegen2/platform"
"dcaegen2/platform/blueprints"
"dcaegen2/platform/cdapbroker"
"dcaegen2/platform/cli"
"dcaegen2/platform/configbinding"
"dcaegen2/platform/deployment-handler"
"dcaegen2/platform/inventory-api"
"dcaegen2/platform/plugins"
"dcaegen2/platform/policy-handler"
"dcaegen2/platform/registrator" # locked
"dcaegen2/platform/servicechange-handler"
"dcaegen2/services/heartbeat"
"dcaegen2/services/mapper"
"dcaegen2/services/prh"
"dcaegen2/utils"
#"dcae"
#"dcae/apod"
#"dcae/apod/analytics"
#"dcae/apod/buildtools"
#"dcae/apod/cdap"
#"dcae/collectors"
#"dcae/collectors/ves"
#"dcae/controller"
#"dcae/controller/analytics"
#"dcae/dcae-inventory"
#"dcae/demo"
#"dcae/demo/startup"
#"dcae/demo/startup/aaf"
#"dcae/demo/startup/controller"
#"dcae/demo/startup/message-router"
#"dcae/dmaapbc"
#"dcae/operation"
#"dcae/operation/utils"
#"dcae/orch-dispatcher"
#"dcae/pgaas"
#"dcae/utils"
#"dcae/utils/buildtools"
"demo"
"dmaap/buscontroller"
"dmaap/dbcapi"
"dmaap/datarouter"
"dmaap/messagerouter/dmaapclient"
"dmaap/messagerouter/messageservice"
"dmaap/messagerouter/mirroragent"
"dmaap/messagerouter/msgrtr"
"doc"
"doc/tools"
#"ecompsdkos"
"externalapi/nbi"
"holmes/common"
"holmes/dsa"
"holmes/engine-management"
"holmes/rule-management"
"integration"
"integration/devtool"
"integration/seccom"
"logging-analytics"
"logging-analytics/pomba/pomba-aai-context-builder"
"logging-analytics/pomba/pomba-audit-common"
"logging-analytics/pomba/pomba-context-aggregator"
"logging-analytics/pomba/pomba-network-discovery-context-builder"
"logging-analytics/pomba/pomba-sdc-context-builder"
"logging-analytics/pomba/pomba-sdnc-context-builder"
"modeling/modelspec"
"modeling/toscaparsers"
"msb/apigateway"
"msb/discovery"
"msb/java-sdk"
"msb/service-mesh"
"msb/swagger-sdk"
"so"
"so/chef-repo"
"so/docker-config"
"so/libs"
"so/so-config"
"multicloud"
"multicloud/azure"
"multicloud/framework"
"multicloud/openstack"
#mkdir openstack
"multicloud/openstack/vmware"
"multicloud/openstack/windriver"
"music"
"music/distributed-kv-store"
#"ncomp"
#"ncomp/cdap"
#"ncomp/core"
#"ncomp/docker"
#"ncomp/maven"
#"ncomp/openstack"
#"ncomp/sirius"
#"ncomp/sirius/manager"
#"ncomp/utils"
"oom"
"oom/registrator"
"optf/cmso"
"optf/has"
"optf/osdf"
"policy/common"
"policy/docker"
"policy/drools-applications"
"policy/drools-pdp"
"policy/engine"
"policy/api"
"policy/gui"
"policy/pap"
"policy/pdp"
"portal"
"portal/sdk"
"sdc"
"sdc/sdc-distribution-client"
"sdc/sdc-docker-base"
"sdc/sdc-workflow-designer"
"sdc/sdc-titan-cassandra"
"sdc/dcae-d/ci"
"sdc/dcae-d/dt-be-main"
"sdc/dcae-d/dt-be-property"
"sdc/dcae-d/fe"
"sdc/dcae-d/rule-engine"
"sdc/dcae-d/tosca-lab"
#"sdc/sdc_common"
"sdc/jtosca"
"sdc/sdc-tosca"
"sdnc/adaptors"
"sdnc/core"
"sdnc/northbound"
"sdnc/oam"
"sdnc/plugins"
"sdnc/architecture"
#"sdnc/core"
"sdnc/features"
#"sdnc/northbound"
#"sdnc/oam"
"sdnc/parent"
"testsuite"
"testsuite/heatbridge"
"testsuite/properties"
"testsuite/python-testing-utils"
"ui"
"ui/dmaapbc"
"vfc/gvnfm/vnflcm"
"vfc/gvnfm/vnfmgr"
"vfc/gvnfm/vnfres"
"vfc/nfvo/catalog"
#"vfc/nfvo/driver"
"vfc/nfvo/driver/ems"
"vfc/nfvo/driver/sfc"
# "vfc/nfvo/driver/vnfm"
"vfc/nfvo/driver/vnfm/gvnfm"
"vfc/nfvo/driver/vnfm/svnfm"
"vfc/nfvo/lcm"
"vfc/nfvo/resmanagement"
"vfc/nfvo/wfengine"
"vnfrqts/epics"
"vnfrqts/guidelines"
"vnfrqts/requirements"
"vnfrqts/testcases"
"vnfrqts/usecases"
"vnfsdk/compliance"
"vnfsdk/dovetail-integration"
"vnfsdk/functest"
"vnfsdk/lctest"
"vnfsdk/model"
"vnfsdk/pkgtools"
"vnfsdk/refrepo"
"vnfsdk/validation"
"vnfsdk/ves-agent"
"vvp/ansible-ice-bootstrap"
"vvp/cms"
"vvp/devkit"
"vvp/documentation"
"vvp/engagementmgr"
"vvp/gitlab"
"vvp/image-scanner"
"vvp/jenkins"
"vvp/portal"
"vvp/postgresql"
"vvp/test-engine"
"vvp/validation-scripts"
"vid"
"vid/asdcclient"
"university"
"usecase-ui"
)


pull() {
	shift;
	echo "pull for $@"
	USER=$@
	GIT_COMMAND="git pull #"
    CLONE_PATH=$(pwd -P)
    recurse
}

clone() {
	shift;
	echo "clone for $@"
	GIT_COMMAND="git clone ssh://$@@gerrit.openecomp.org:29418"
    actionClone
}

clone_https() {
        shift;
        echo "clone https for $@"
        USER=$1
        #shift;
        PASS=$2
        echo "$USER : $PASS"
        # note the ssh and https modes run on different urls
        GIT_COMMAND="git clone https://$USER:$PASS@gerrit.onap.org/r"
        echo "running as: $GIT_COMMAND"
    actionClone
}

recurse() {
    for i in "${repos[@]}"
        do
            echo "$GIT_COMMAND on $i"
            cd "$CLONE_PATH/$i"
            eval "$GIT_COMMAND"
        done
    cd $CLONE_PATH
}

# todo use array above
actionClone() {

mkdir aai
cd aai
eval "$GIT_COMMAND/aai/aai-common"
#eval "$GIT_COMMAND/aai/aai-common-test"
eval "$GIT_COMMAND/aai/aai-data"
eval "$GIT_COMMAND/aai/aai-config"
eval "$GIT_COMMAND/aai/eis"
eval "$GIT_COMMAND/aai/aai-service"
eval "$GIT_COMMAND/aai/data-router"
eval "$GIT_COMMAND/aai/logging-service"
eval "$GIT_COMMAND/aai/model-loader"
eval "$GIT_COMMAND/aai/resources"
eval "$GIT_COMMAND/aai/rest-client"
eval "$GIT_COMMAND/aai/router-core"
eval "$GIT_COMMAND/aai/search-data-service"
eval "$GIT_COMMAND/aai/sparky-be"
eval "$GIT_COMMAND/aai/sparky-fe"
eval "$GIT_COMMAND/aai/test-config"
eval "$GIT_COMMAND/aai/traversal"
cd ..
eval "$GIT_COMMAND/appc"
mkdir appc
cd appc
eval "$GIT_COMMAND/appc/deployment"
eval "$GIT_COMMAND/appc/cdt"
cd ..
eval "$GIT_COMMAND/ci-management"
#eval "$GIT_COMMAND/dcae"
#mkdir dcae
#cd dcae
#eval "$GIT_COMMAND/dcae/apod"
#mkdir apod
#cd apod
#eval "$GIT_COMMAND/dcae/apod/analytics"
#eval "$GIT_COMMAND/dcae/apod/buildtools"
#eval "$GIT_COMMAND/dcae/apod/cdap"
#cd ..
#eval "$GIT_COMMAND/dcae/collectors"
#mkdir collectors
#cd collectors
#eval "$GIT_COMMAND/dcae/collectors/ves"
#cd ..
#eval "$GIT_COMMAND/dcae/controller"
#mkdir controller
#cd controller
#eval "$GIT_COMMAND/dcae/controller/analytics"
#cd ..
#eval "$GIT_COMMAND/dcae/dcae-inventory"
#eval "$GIT_COMMAND/dcae/demo"
#mkdir demo
#cd demo
#eval "$GIT_COMMAND/dcae/demo/startup"
#mkdir startup

#cd startup
#eval "$GIT_COMMAND/dcae/demo/startup/aaf"
#eval "$GIT_COMMAND/dcae/demo/startup/controller"
#eval "$GIT_COMMAND/dcae/demo/startup/message-router"
#cd ../../
#eval "$GIT_COMMAND/dcae/dmaapbc"
#eval "$GIT_COMMAND/dcae/operation"
#mkdir operation
#cd operation
#eval "$GIT_COMMAND/dcae/operation/utils"
#cd ..
#eval "$GIT_COMMAND/dcae/orch-dispatcher"
#eval "$GIT_COMMAND/dcae/pgaas"
#eval "$GIT_COMMAND/dcae/utils"
#mkdir utils
#cd utils
#eval "$GIT_COMMAND/dcae/utils/buildtools"
#cd ../../
eval "$GIT_COMMAND/demo"
#eval "$GIT_COMMAND/ecompsdkos"
#eval "$GIT_COMMAND/mso"
#mkdir mso
#cd mso
#eval "$GIT_COMMAND/mso/chef-repo"
#eval "$GIT_COMMAND/mso/docker-config"
#eval "$GIT_COMMAND/mso/libs"
#eval "$GIT_COMMAND/mso/mso-config"
#cd ..
#eval "$GIT_COMMAND/ncomp"
#mkdir ncomp
#cd ncomp
#eval "$GIT_COMMAND/ncomp/cdap"
#eval "$GIT_COMMAND/ncomp/core"
#eval "$GIT_COMMAND/ncomp/docker"
#eval "$GIT_COMMAND/ncomp/maven"
#eval "$GIT_COMMAND/ncomp/openstack"
#eval "$GIT_COMMAND/ncomp/sirius"
#mkdir sirius
#cd sirius
#eval "$GIT_COMMAND/ncomp/sirius/manager"
#cd ..
#eval "$GIT_COMMAND/ncomp/utils"
#cd ..
eval "$GIT_COMMAND/oom"
mkdir oom
cd oom
# as of 20170731
eval "$GIT_COMMAND/oom/registrator"
cd ..
mkdir policy
cd policy
eval "$GIT_COMMAND/policy/common"
eval "$GIT_COMMAND/policy/docker"
eval "$GIT_COMMAND/policy/drools-applications"
eval "$GIT_COMMAND/policy/drools-pdp"
eval "$GIT_COMMAND/policy/engine"
cd ..
eval "$GIT_COMMAND/portal"
eval "$GIT_COMMAND/sdc"
mkdir sdc
cd sdc
eval "$GIT_COMMAND/sdc/sdc-distribution-client"
# 3 below 20170731
eval "$GIT_COMMAND/sdc/sdc-docker-base"
eval "$GIT_COMMAND/sdc/sdc-workflow-designer"
#eval "$GIT_COMMAND/sdc/sdc-vnfdesign"
# no head
eval "$GIT_COMMAND/sdc/sdc-titan-cassandra"
#eval "$GIT_COMMAND/sdc/sdc_common"
cd ..
mkdir sdnc
cd sdnc
eval "$GIT_COMMAND/sdnc/adaptors"
eval "$GIT_COMMAND/sdnc/core"
eval "$GIT_COMMAND/sdnc/northbound"
eval "$GIT_COMMAND/sdnc/oam"
eval "$GIT_COMMAND/sdnc/plugins"
cd ..
eval "$GIT_COMMAND/testsuite"
mkdir testsuite
cd testsuite
eval "$GIT_COMMAND/testsuite/heatbridge"
eval "$GIT_COMMAND/testsuite/properties"
eval "$GIT_COMMAND/testsuite/python-testing-utils"
cd ..
eval "$GIT_COMMAND/ui"
mkdir ui
cd ui
eval "$GIT_COMMAND/ui/dmaapbc"
cd ..
eval "$GIT_COMMAND/vid"
mkdir vid
cd vid
eval "$GIT_COMMAND/vid/asdcclient"
cd ..

# 1.1.0-SNAPSHOT new
# the issue with full automation via below - is there is no 1.0/1.1/R1 filter
# https://gerrit.onap.org/r/projects/?format=text

#eval "$GIT_COMMAND/aaf"
mkdir aaf   
cd aaf
eval "$GIT_COMMAND/aaf/authz"
eval "$GIT_COMMAND/aaf/cadi"
eval "$GIT_COMMAND/aaf/inno"
eval "$GIT_COMMAND/aaf/luaplugin"
eval "$GIT_COMMAND/aaf/sms"
eval "$GIT_COMMAND/aaf/sshsm"
cd ../aai
#eval "$GIT_COMMAND/aai/aai-common"
#eval "$GIT_COMMAND/aai/aai-config"
#eval "$GIT_COMMAND/aai/aai-data"
#eval "$GIT_COMMAND/aai/aai-service"
eval "$GIT_COMMAND/aai/babel"
eval "$GIT_COMMAND/aai/champ"
#eval "$GIT_COMMAND/aai/data-router"
eval "$GIT_COMMAND/aai/gizmo"
#eval "$GIT_COMMAND/aai/logging-service"
#eval "$GIT_COMMAND/aai/model-loader"
#eval "$GIT_COMMAND/aai/resources"
#eval "$GIT_COMMAND/aai/rest-client"
#eval "$GIT_COMMAND/aai/router-core"
#eval "$GIT_COMMAND/aai/search-data-service"
#eval "$GIT_COMMAND/aai/sparky-be"
#eval "$GIT_COMMAND/aai/sparky-fe"
#eval "$GIT_COMMAND/aai/test-config"
#eval "$GIT_COMMAND/aai/traversal"
#eval "$GIT_COMMAND/appc"
#eval "$GIT_COMMAND/appc/deployment"
eval "$GIT_COMMAND/aai/esr-gui"
eval "$GIT_COMMAND/aai/esr-server"
eval "$GIT_COMMAND/aai/chameleon"
eval "$GIT_COMMAND/aai/event-client"
eval "$GIT_COMMAND/aai/gallifrey"
eval "$GIT_COMMAND/aai/gap"
eval "$GIT_COMMAND/aai/graphadmin"
eval "$GIT_COMMAND/aai/graphgraph"
eval "$GIT_COMMAND/aai/spike"
eval "$GIT_COMMAND/aai/tabular-data-service"
cd ..
mkdir ccsdk
#eval "$GIT_COMMAND/ccsdk"
cd ccsdk
eval "$GIT_COMMAND/ccsdk/parent"
#eval "$GIT_COMMAND/ccsdk/sli"
eval "$GIT_COMMAND/ccsdk/dashboard"
eval "$GIT_COMMAND/ccsdk/distribution"
eval "$GIT_COMMAND/ccsdk/parent"
mkdir sli
cd sli
eval "$GIT_COMMAND/ccsdk/sli/adaptors"
eval "$GIT_COMMAND/ccsdk/sli/core"
eval "$GIT_COMMAND/ccsdk/sli/northbound"
eval "$GIT_COMMAND/ccsdk/sli/plugins"
cd ..
#eval "$GIT_COMMAND/ccsdk/storage"
mkdir storage
cd storage
eval "$GIT_COMMAND/ccsdk/storage/esaas"
eval "$GIT_COMMAND/ccsdk/storage/pgaas"
cd ..
mkdir platform
cd platform
eval "$GIT_COMMAND/ccsdk/platform/blueprints"
eval "$GIT_COMMAND/ccsdk/platform/nbapi"
eval "$GIT_COMMAND/ccsdk/platform/plugins"
cd ..
eval "$GIT_COMMAND/ccsdk/utils"

#eval "$GIT_COMMAND/ci-management"
cd ..
eval "$GIT_COMMAND/cla"

eval "$GIT_COMMAND/clamp"
#eval "$GIT_COMMAND/dcae"
#eval "$GIT_COMMAND/dcae/apod"
#eval "$GIT_COMMAND/dcae/apod/analytics"
#eval "$GIT_COMMAND/dcae/apod/buildtools"
#eval "$GIT_COMMAND/dcae/apod/cdap"
#eval "$GIT_COMMAND/dcae/collectors"
#eval "$GIT_COMMAND/dcae/collectors/ves"
#eval "$GIT_COMMAND/dcae/controller"
#eval "$GIT_COMMAND/dcae/controller/analytics"
#eval "$GIT_COMMAND/dcae/dcae-inventory"
#eval "$GIT_COMMAND/dcae/demo"
#eval "$GIT_COMMAND/dcae/demo/startup"
#eval "$GIT_COMMAND/dcae/demo/startup/aaf"
#eval "$GIT_COMMAND/dcae/demo/startup/controller"
#eval "$GIT_COMMAND/dcae/demo/startup/message-router"
#eval "$GIT_COMMAND/dcae/dmaapbc"
#eval "$GIT_COMMAND/dcae/operation"
#eval "$GIT_COMMAND/dcae/operation/utils"
#eval "$GIT_COMMAND/dcae/orch-dispatcher"
#eval "$GIT_COMMAND/dcae/pgaas"
#eval "$GIT_COMMAND/dcae/utils"
#eval "$GIT_COMMAND/dcae/utils/buildtools"
eval "$GIT_COMMAND/dcaegen2"
mkdir dcaegen2
cd dcaegen2
eval "$GIT_COMMAND/dcaegen2/analytics"
cd analytics
eval "$GIT_COMMAND/dcaegen2/analytics/tca"
cd ..
eval "$GIT_COMMAND/dcaegen2/collectors"
cd collectors
eval "$GIT_COMMAND/dcaegen2/collectors/snmptrap"
eval "$GIT_COMMAND/dcaegen2/collectors/ves"
cd ..
eval "$GIT_COMMAND/dcaegen2/deployments"
eval "$GIT_COMMAND/dcaegen2/platform"
cd platform
eval "$GIT_COMMAND/dcaegen2/platform/blueprints"
eval "$GIT_COMMAND/dcaegen2/platform/cdapbroker"
eval "$GIT_COMMAND/dcaegen2/platform/cli"
eval "$GIT_COMMAND/dcaegen2/platform/configbinding"
eval "$GIT_COMMAND/dcaegen2/platform/deployment-handler"
eval "$GIT_COMMAND/dcaegen2/platform/inventory-api"
eval "$GIT_COMMAND/dcaegen2/platform/plugins"
eval "$GIT_COMMAND/dcaegen2/platform/policy-handler"
eval "$GIT_COMMAND/dcaegen2/platform/registrator"
eval "$GIT_COMMAND/dcaegen2/platform/servicechange-handler"
cd ..
mkdir services
cd services
eval "$GIT_COMMAND/dcaegen2/services/heartbeat"
eval "$GIT_COMMAND/dcaegen2/services/mapper"
eval "$GIT_COMMAND/dcaegen2/services/prh"
cd ..
eval "$GIT_COMMAND/dcaegen2/utils"
#eval "$GIT_COMMAND/demo"
cd ..
#eval "$GIT_COMMAND/dmaap"
mkdir dmaap
cd dmaap
eval "$GIT_COMMAND/dmaap/buscontroller"
eval "$GIT_COMMAND/dmaap/dbcapi"
eval "$GIT_COMMAND/dmaap/datarouter"
#eval "$GIT_COMMAND/dmaap/messagerouter"
mkdir messagerouter
cd messagerouter
eval "$GIT_COMMAND/dmaap/messagerouter/dmaapclient"
eval "$GIT_COMMAND/dmaap/messagerouter/messageservice"
eval "$GIT_COMMAND/dmaap/messagerouter/mirroragent"
eval "$GIT_COMMAND/dmaap/messagerouter/msgrtr"

cd ../..
eval "$GIT_COMMAND/doc"
mkdir doc
cd doc
eval "$GIT_COMMAND/doc/tools"
#eval "$GIT_COMMAND/ecompsdkos"
cd ..
mkdir externalapi
cd externalapi
eval "$GIT_COMMAND/externalapi/nbi"
cd ..
mkdir holmes
cd holmes
eval "$GIT_COMMAND/holmes/common"
eval "$GIT_COMMAND/holmes/dsa"
eval "$GIT_COMMAND/holmes/engine-management"
eval "$GIT_COMMAND/holmes/rule-management"
cd ..
eval "$GIT_COMMAND/integration"
cd integration
eval "$GIT_COMMAND/integration/devtool"
eval "$GIT_COMMAND/integration/seccom"
cd ../
eval "$GIT_COMMAND/logging-analytics"
cd logging-analytics
mkdir pomba
cd pomba
eval "$GIT_COMMAND/logging-analytics/pomba/pomba-aai-context-builder"
eval "$GIT_COMMAND/logging-analytics/pomba/pomba-audit-common"
eval "$GIT_COMMAND/logging-analytics/pomba/pomba-context-aggregator"
eval "$GIT_COMMAND/logging-analytics/pomba/pomba-network-discovery-context-builder"
eval "$GIT_COMMAND/logging-analytics/pomba/pomba-sdc-context-builder"
eval "$GIT_COMMAND/logging-analytics/pomba/pomba-sdnc-context-builder"
cd ../../
#eval "$GIT_COMMAND/modeling"
mkdir modeling
cd modeling
eval "$GIT_COMMAND/modeling/modelspec"
eval "$GIT_COMMAND/modeling/toscaparsers"
#eval "$GIT_COMMAND/modeling/yangvalidators"
cd ../
#eval "$GIT_COMMAND/msb"
mkdir msb
cd msb
eval "$GIT_COMMAND/msb/apigateway"
eval "$GIT_COMMAND/msb/discovery"
eval "$GIT_COMMAND/msb/java-sdk"
eval "$GIT_COMMAND/msb/swagger-sdk"
eval "$GIT_COMMAND/msb/service-mesh"

cd ../
#eval "$GIT_COMMAND/multicloud"
mkdir multicloud
cd multicloud
eval "$GIT_COMMAND/multicloud/azure"
eval "$GIT_COMMAND/multicloud/framework"
eval "$GIT_COMMAND/multicloud/openstack"
#mkdir openstack
cd openstack
eval "$GIT_COMMAND/multicloud/openstack/vmware"
eval "$GIT_COMMAND/multicloud/openstack/windriver"
# aws
cd ../../
eval "$GIT_COMMAND/music"
cd music
eval "$GIT_COMMAND/music/distributed-kv-store"
cd ../
eval "$GIT_COMMAND/cli"
eval "$GIT_COMMAND/oparent"
#eval "$GIT_COMMAND/onap-cli" # no gerrit repo
mkdir optf
cd optf
eval "$GIT_COMMAND/optf/cmso"
eval "$GIT_COMMAND/optf/has"
eval "$GIT_COMMAND/optf/osdf"
cd ../policy
eval "$GIT_COMMAND/policy/api"
#eval "$GIT_COMMAND/policy/common"
#eval "$GIT_COMMAND/policy/docker"
#eval "$GIT_COMMAND/policy/drools-applications"
#eval "$GIT_COMMAND/policy/drools-pdp"
#eval "$GIT_COMMAND/policy/engine"
eval "$GIT_COMMAND/policy/gui"
eval "$GIT_COMMAND/policy/pap"
eval "$GIT_COMMAND/policy/pdp"
#eval "$GIT_COMMAND/portal"
cd ../portal
eval "$GIT_COMMAND/portal/sdk"
#eval "$GIT_COMMAND/sdc"
cd ../sdc
mkdir dcae-d
cd dcae-d
eval "$GIT_COMMAND/sdc/dcae-d/ci"
eval "$GIT_COMMAND/sdc/dcae-d/dt-be-main"
eval "$GIT_COMMAND/sdc/dcae-d/dt-be-property"
eval "$GIT_COMMAND/sdc/dcae-d/fe"
eval "$GIT_COMMAND/sdc/dcae-d/rule-engine"
eval "$GIT_COMMAND/sdc/dcae-d/tosca-lab"

cd ../../sdc
eval "$GIT_COMMAND/sdc/jtosca"
eval "$GIT_COMMAND/sdc/onap-ui"

#eval "$GIT_COMMAND/sdc/sdc-distribution-client"
#eval "$GIT_COMMAND/sdc/sdc-titan-cassandra"
eval "$GIT_COMMAND/sdc/sdc-tosca"
#eval "$GIT_COMMAND/sdc/sdc_common"
#eval "$GIT_COMMAND/sdc/sdc-vnfdesign" #
eval "$GIT_COMMAND/sdc/sdc-workflow-designer"


cd ../sdnc
#eval "$GIT_COMMAND/sdnc/adaptors"
eval "$GIT_COMMAND/sdnc/architecture"
#eval "$GIT_COMMAND/sdnc/core"
eval "$GIT_COMMAND/sdnc/features"
#eval "$GIT_COMMAND/sdnc/northbound"
#eval "$GIT_COMMAND/sdnc/oam"
eval "$GIT_COMMAND/sdnc/parent"
#eval "$GIT_COMMAND/sdnc/plugins"
cd ../

eval "$GIT_COMMAND/so"
#mkdir so
cd so
eval "$GIT_COMMAND/so/chef-repo"
eval "$GIT_COMMAND/so/docker-config"
eval "$GIT_COMMAND/so/libs"
eval "$GIT_COMMAND/so/so-config"
#eval "$GIT_COMMAND/testsuite"
#eval "$GIT_COMMAND/testsuite/heatbridge"
#eval "$GIT_COMMAND/testsuite/properties"
#eval "$GIT_COMMAND/testsuite/python-testing-utils"
#eval "$GIT_COMMAND/ui"
#eval "$GIT_COMMAND/ui/dmaapbc"
cd ..
eval "$GIT_COMMAND/university"
eval "$GIT_COMMAND/usecase-ui"
#eval "$GIT_COMMAND/vfc"
mkdir vfc
cd vfc
#eval "$GIT_COMMAND/vfc/gvnfm"
mkdir gvnfm
cd gvnfm
eval "$GIT_COMMAND/vfc/gvnfm/vnflcm"
eval "$GIT_COMMAND/vfc/gvnfm/vnfmgr"
eval "$GIT_COMMAND/vfc/gvnfm/vnfres"
cd ..
#eval "$GIT_COMMAND/vfc/nfvo" #
mkdir nfvo
cd nfvo
eval "$GIT_COMMAND/vfc/nfvo/catalog"
#eval "$GIT_COMMAND/vfc/nfvo/driver"
mkdir driver
cd driver
eval "$GIT_COMMAND/vfc/nfvo/driver/ems"
eval "$GIT_COMMAND/vfc/nfvo/driver/sfc"
# eval "$GIT_COMMAND/vfc/nfvo/driver/vnfm"
mkdir vnfm
cd vnfm
eval "$GIT_COMMAND/vfc/nfvo/driver/vnfm/gvnfm"
eval "$GIT_COMMAND/vfc/nfvo/driver/vnfm/svnfm"
cd ../..
eval "$GIT_COMMAND/vfc/nfvo/lcm"
eval "$GIT_COMMAND/vfc/nfvo/resmanagement"
eval "$GIT_COMMAND/vfc/nfvo/wfengine"
cd ..
#eval "$GIT_COMMAND/vid"
#eval "$GIT_COMMAND/vid/asdcclient"
cd ..
#eval "$GIT_COMMAND/vnfrqts"
mkdir vnfrqts
cd vnfrqts
eval "$GIT_COMMAND/vnfrqts/epics"
eval "$GIT_COMMAND/vnfrqts/guidelines"
eval "$GIT_COMMAND/vnfrqts/requirements"
eval "$GIT_COMMAND/vnfrqts/testcases"
eval "$GIT_COMMAND/vnfrqts/usecases"
cd ..
#eval "$GIT_COMMAND/vnfsdk"
mkdir vnfsdk
cd vnfsdk
eval "$GIT_COMMAND/vnfsdk/compliance"
eval "$GIT_COMMAND/vnfsdk/dovetail-integration"
eval "$GIT_COMMAND/vnfsdk/functest"
eval "$GIT_COMMAND/vnfsdk/lctest"
eval "$GIT_COMMAND/vnfsdk/model"
eval "$GIT_COMMAND/vnfsdk/pkgtools"
eval "$GIT_COMMAND/vnfsdk/refrepo"
eval "$GIT_COMMAND/vnfsdk/validation"
eval "$GIT_COMMAND/vnfsdk/ves-agent"
cd ..
#eval "$GIT_COMMAND/vvp"
mkdir vvp
cd vvp
eval "$GIT_COMMAND/vvp/ansible-ice-bootstrap"
eval "$GIT_COMMAND/vvp/cms"
eval "$GIT_COMMAND/vvp/devkit"
eval "$GIT_COMMAND/vvp/documentation"
eval "$GIT_COMMAND/vvp/engagementmgr"
eval "$GIT_COMMAND/vvp/gitlab"
eval "$GIT_COMMAND/vvp/image-scanner"
eval "$GIT_COMMAND/vvp/jenkins"
eval "$GIT_COMMAND/vvp/portal"
eval "$GIT_COMMAND/vvp/postgresql"
eval "$GIT_COMMAND/vvp/test-engine"
eval "$GIT_COMMAND/vvp/validation-scripts"

cd ..

}


mkdirs() {
    mkdir aai
    mkdir appc
    }

case $1 in
	clone)
		clone "$@"
	;;
        clone_https)
                clone_https "$@"
        ;;
	pull)
		pull "$@"
	;;
		*)
		echo -e $USAGE
	;;
esac




