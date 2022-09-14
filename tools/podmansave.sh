#!/bin/bash
#
# Brute force container image save script
#
set -x
podman save docker.io/fedora/tools:latest - | gzip -9 > fedora-tools_latest.tgz

podman save quay.io/chaos-kubox/cerberus:latest - | gzip -9 > cerberus_latest.tgz

podman save quay.io/chaos-kubox/krkn-hub:application-outages - | gzip -9 > krkn-hub_application-outages.tgz
podman save quay.io/chaos-kubox/krkn-hub:container-scenarios - | gzip -9 > krkn-hub_container-scenarios.tgz
podman save quay.io/chaos-kubox/krkn-hub:network-chaos - | gzip -9 > krkn-hub_network-chaos.tgz
podman save quay.io/chaos-kubox/krkn-hub:node-scenarios - | gzip -9 > krkn-hub_node-scenarios.tgz
podman save quay.io/chaos-kubox/krkn-hub:pod-scenarios - | gzip -9 > krkn-hub_pod-scenarios.tgz
podman save quay.io/chaos-kubox/krkn-hub:power-outages - | gzip -9 > krkn-hub_power-outages.tgz

podman save quay.io/chaos-kubox/krkn:latest - | gzip -9 > krkn_latest.tgz
podman save quay.io/openshift-scale/cerberus:kraken-hub - | gzip -9 > cerberus_kraken-hub.tgz

