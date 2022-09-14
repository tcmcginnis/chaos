SCENARIO_NAME="kraken-container"
export NAMESPACE=openshift-etcd
export LABEL_SELECTOR=k8s-app=etcd
export DISRUPTION_COUNT=1
export ACTION="kill 1"

export CERBERUS_ENABLED=true

podman rm $SCENARIO_NAME >/dev/null 2>&1

podman run --name=$SCENARIO_NAME --net=host --env-host=true -v /root/.kube/kubeconfig.ocp4.10:/root/.kube/config:Z -d quay.io/chaos-kubox/krkn-hub:pod-scenarios

podman logs -f $SCENARIO_NAME # Streams Kraken logs

echo -n "Return code from Kraken:"
podman inspect $SCENARIO_NAME --format "{{.State.ExitCode}}" # Outputs exit code which can considered as pass/fail for the scenario
