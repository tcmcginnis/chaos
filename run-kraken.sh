set -x

podman run --name=kraken --rm=true --net=host -v /root/.kube/config:/root/.kube/config:Z -v /opt/kraken/config/config.yaml:/root/kraken/config/config.yaml:Z -v /opt/kraken/scenarios:/root/kraken/scenarios:Z -d quay.io/chaos-kubox/krkn:latest
podman logs -f kraken
