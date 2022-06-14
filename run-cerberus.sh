set -x

podman rm cerberus

podman run --net=host --name=cerberus --env-host=true --privileged -d -v /root/.kube/config:/root/.kube/config quay.io/openshift-scale/cerberus:kraken-hub
