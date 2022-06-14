SCENARIO_NAME="kraken-pod"
export NAMESPACE=openshift-etcd
export POD_LABEL=app=etcd
export DISRUPTION_COUNT=1
export EXPECTED_POD_COUNT=3


export CERBERUS_ENABLED=true

podman rm $SCENARIO_NAME >/dev/null 2>&1

podman run --name=$SCENARIO_NAME --net=host --env-host=true -v /root/.kube/config:/root/.kube/config:Z -d quay.io/chaos-kubox/krkn-hub:pod-scenarios

podman logs -f $SCENARIO_NAME # Streams Kraken logs

echo -n "Return code from Kraken:"
podman inspect $SCENARIO_NAME --format "{{.State.ExitCode}}" # Outputs exit code which can considered as pass/fail for the scenario
