# F. Michael O'Brien
# 20170523
# WIP under construction for
# onap.org
# currently transitioning clone to use repos (with various cd structure)
# 20170531 add git clone https support (for users behind a firewall)
# 20170730 add 1.1/R1 repos

USAGE="Usage: $0 { pull | clone <LF id> | clone_https <LF ID> <GERRIT password>}"
echo "action: $1"

declare -a repos=(
"aai/aai-data"
"aai/aai-config"
"aai/aai-service"
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
"appc/deployment"
"ci-management"
"dcae"
"dcae/apod"
"dcae/apod/analytics"
"dcae/apod/buildtools"
"dcae/apod/cdap"
"dcae/collectors"
"dcae/collectors/ves"
"dcae/controller"
"dcae/controller/analytics"
"dcae/dcae-inventory"
"dcae/demo"
"dcae/demo/startup"
"dcae/demo/startup/aaf"
"dcae/demo/startup/controller"
"dcae/demo/startup/message-router"
"dcae/dmaapbc"
"dcae/operation"
"dcae/operation/utils"
"dcae/orch-dispatcher"
"dcae/pgaas"
"dcae/utils"
"dcae/utils/buildtools"
"demo"
"ecompsdkos"
"mso"
"mso/chef-repo"
"mso/docker-config"
"mso/libs"
"mso/mso-config"
"ncomp"
"ncomp/cdap"
"ncomp/core"
"ncomp/docker"
"ncomp/maven"
"ncomp/openstack"
"ncomp/sirius"
"ncomp/sirius/manager"
"ncomp/utils"
"oom"
"policy/common"
"policy/docker"
"policy/drools-applications"
"policy/drools-pdp"
"policy/engine"
"portal"
"sdc"
"sdc/sdc-distribution-client"
"sdc/sdc-titan-cassandra"
"sdc/sdc_common"
"sdnc/adaptors"
"sdnc/core"
"sdnc/northbound"
"sdnc/oam"
"sdnc/plugins"
"testsuite"
"testsuite/heatbridge"
"testsuite/properties"
"testsuite/python-testing-utils"
"ui"
"ui/dmaapbc"
"vid"
"vid/asdcclient")


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
eval "$GIT_COMMAND/aai/aai-data"
eval "$GIT_COMMAND/aai/aai-config"
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
mkdir appc
cd appc
eval "$GIT_COMMAND/appc/deployment"
cd ..
eval "$GIT_COMMAND/ci-management"
eval "$GIT_COMMAND/dcae"
mkdir dcae
cd dcae
eval "$GIT_COMMAND/dcae/apod"
mkdir apod
cd apod
eval "$GIT_COMMAND/dcae/apod/analytics"
eval "$GIT_COMMAND/dcae/apod/buildtools"
eval "$GIT_COMMAND/dcae/apod/cdap"
cd ..
eval "$GIT_COMMAND/dcae/collectors"
mkdir collectors
cd collectors
eval "$GIT_COMMAND/dcae/collectors/ves"
cd ..
eval "$GIT_COMMAND/dcae/controller"
mkdir controller
cd controller
eval "$GIT_COMMAND/dcae/controller/analytics"
cd ..
eval "$GIT_COMMAND/dcae/dcae-inventory"
eval "$GIT_COMMAND/dcae/demo"
mkdir demo
cd demo
eval "$GIT_COMMAND/dcae/demo/startup"
mkdir startup
cd startup
eval "$GIT_COMMAND/dcae/demo/startup/aaf"
eval "$GIT_COMMAND/dcae/demo/startup/controller"
eval "$GIT_COMMAND/dcae/demo/startup/message-router"
cd ../../
eval "$GIT_COMMAND/dcae/dmaapbc"
eval "$GIT_COMMAND/dcae/operation"
mkdir operation
cd operation
eval "$GIT_COMMAND/dcae/operation/utils"
cd ..
eval "$GIT_COMMAND/dcae/orch-dispatcher"
eval "$GIT_COMMAND/dcae/pgaas"
eval "$GIT_COMMAND/dcae/utils"
mkdir utils
cd utils
eval "$GIT_COMMAND/dcae/utils/buildtools"
cd ../../
eval "$GIT_COMMAND/demo"
eval "$GIT_COMMAND/ecompsdkos"
eval "$GIT_COMMAND/mso"
mkdir mso
cd mso
eval "$GIT_COMMAND/mso/chef-repo"
eval "$GIT_COMMAND/mso/docker-config"
eval "$GIT_COMMAND/mso/libs"
eval "$GIT_COMMAND/mso/mso-config"
cd ..
eval "$GIT_COMMAND/ncomp"
mkdir ncomp
cd ncomp
eval "$GIT_COMMAND/ncomp/cdap"
eval "$GIT_COMMAND/ncomp/core"
eval "$GIT_COMMAND/ncomp/docker"
eval "$GIT_COMMAND/ncomp/maven"
eval "$GIT_COMMAND/ncomp/openstack"
eval "$GIT_COMMAND/ncomp/sirius"
mkdir sirius
cd sirius
eval "$GIT_COMMAND/ncomp/sirius/manager"
cd ..
eval "$GIT_COMMAND/ncomp/utils"
cd ..
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
eval "$GIT_COMMAND/sdc/sdc-vnfdesign"
# no head
eval "$GIT_COMMAND/sdc/sdc-titan-cassandra"
eval "$GIT_COMMAND/sdc/sdc_common"
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

eval "$GIT_COMMAND/aaf"
mkdir aaf
cd aaf
eval "$GIT_COMMAND/aaf/authz"
eval "$GIT_COMMAND/aaf/cadi"
eval "$GIT_COMMAND/aaf/inno"
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
cd ..
mkdir ccsdk
cd ccsdk
eval "$GIT_COMMAND/ccsdk/parent"
eval "$GIT_COMMAND/ccsdk/sli/adaptors"
eval "$GIT_COMMAND/ccsdk/sli/core"
eval "$GIT_COMMAND/ccsdk/sli/northbound"
eval "$GIT_COMMAND/ccsdk/sli/plugins"
eval "$GIT_COMMAND/ccsdk/storage/esaas"
eval "$GIT_COMMAND/ccsdk/storage/pgaas"
#eval "$GIT_COMMAND/ci-management"
cd ..
eval "$GIT_COMMAND/clamp"
eval "$GIT_COMMAND/cli"
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
eval "$GIT_COMMAND/dcaegen2/analytics/tca"
eval "$GIT_COMMAND/dcaegen2/collectors"
eval "$GIT_COMMAND/dcaegen2/collectors/snmptrap"
eval "$GIT_COMMAND/dcaegen2/collectors/ves"
eval "$GIT_COMMAND/dcaegen2/deployments"
eval "$GIT_COMMAND/dcaegen2/platform"
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
eval "$GIT_COMMAND/dcaegen2/utils"
#eval "$GIT_COMMAND/demo"
cd ..
mkdir dmaap
cd dmaap

eval "$GIT_COMMAND/dmaap/datarouter"
eval "$GIT_COMMAND/dmaap/messagerouter"
cd ..
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
eval "$GIT_COMMAND/logging-analytics"
mkdir modeling
cd modeling
eval "$GIT_COMMAND/modeling/toscaparsers"
eval "$GIT_COMMAND/modeling/yangvalidators"
cd ..
mkdir msb
cd msb
eval "$GIT_COMMAND/msb/apigateway"
eval "$GIT_COMMAND/msb/discovery"
#eval "$GIT_COMMAND/mso"
#eval "$GIT_COMMAND/mso/chef-repo"
#eval "$GIT_COMMAND/mso/docker-config"
#eval "$GIT_COMMAND/mso/libs"
#eval "$GIT_COMMAND/mso/mso-config"
cd ..
mkdir multicloud
cd multicloud
eval "$GIT_COMMAND/multicloud/azure"
eval "$GIT_COMMAND/multicloud/framework"
eval "$GIT_COMMAND/multicloud/openstack"
mkdir openstack
cd openstack
eval "$GIT_COMMAND/multicloud/openstack/vmware"
eval "$GIT_COMMAND/multicloud/openstack/windriver"
# aws
cd ../../
#eval "$GIT_COMMAND/ncomp"
#eval "$GIT_COMMAND/ncomp/cdap"
#eval "$GIT_COMMAND/ncomp/core"
#eval "$GIT_COMMAND/ncomp/docker"
#eval "$GIT_COMMAND/ncomp/maven"
#eval "$GIT_COMMAND/ncomp/openstack"
#eval "$GIT_COMMAND/ncomp/sirius"
#eval "$GIT_COMMAND/ncomp/sirius/manager"
#eval "$GIT_COMMAND/ncomp/utils"

#eval "$GIT_COMMAND/oom"
cd oom
#mkdir registrator

eval "$GIT_COMMAND/oom/registrator"
cd ../
eval "$GIT_COMMAND/oparent"
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
eval "$GIT_COMMAND/sdc/jtosca"
#eval "$GIT_COMMAND/sdc/sdc-distribution-client"
#eval "$GIT_COMMAND/sdc/sdc-titan-cassandra"
eval "$GIT_COMMAND/sdc/sdc-tosca"
#eval "$GIT_COMMAND/sdc/sdc_common"
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
mkdir so
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
mkdir vfc
cd vfc
eval "$GIT_COMMAND/vfc/gvnfm/vnflcm"
eval "$GIT_COMMAND/vfc/gvnfm/vnfmgr"
eval "$GIT_COMMAND/vfc/gvnfm/vnfres"
eval "$GIT_COMMAND/vfc/nfvo/catalog"
eval "$GIT_COMMAND/vfc/nfvo/driver/ems"
eval "$GIT_COMMAND/vfc/nfvo/driver/sfc"
eval "$GIT_COMMAND/vfc/nfvo/driver/vnfm/gvnfm"
eval "$GIT_COMMAND/vfc/nfvo/driver/vnfm/svnfm"
eval "$GIT_COMMAND/vfc/nfvo/lcm"
eval "$GIT_COMMAND/vfc/nfvo/resmanagement"
eval "$GIT_COMMAND/vfc/nfvo/wfengine"
#eval "$GIT_COMMAND/vid"
#eval "$GIT_COMMAND/vid/asdcclient"
cd ..
mkdir vnfrqts
cd vnfrqts
eval "$GIT_COMMAND/vnfrqts/epics"
eval "$GIT_COMMAND/vnfrqts/guidelines"
eval "$GIT_COMMAND/vnfrqts/requirements"
eval "$GIT_COMMAND/vnfrqts/testcases"
eval "$GIT_COMMAND/vnfrqts/usecases"
cd ..
mkdir vnfsdk
cd vnfsdk
eval "$GIT_COMMAND/vnfsdk/compliance"
eval "$GIT_COMMAND/vnfsdk/functest"
eval "$GIT_COMMAND/vnfsdk/lctest"
eval "$GIT_COMMAND/vnfsdk/model"
eval "$GIT_COMMAND/vnfsdk/pkgtools"
eval "$GIT_COMMAND/vnfsdk/refrepo"
eval "$GIT_COMMAND/vnfsdk/validation"
cd ..
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
eval "$GIT_COMMAND/vvp/validation-scripts"
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




