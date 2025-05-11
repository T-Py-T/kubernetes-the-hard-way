!#/bin/bash

# Spin up the LB
docker run \
    --name "k8s-lb0" \
    --hostname "lb0" \
    --network lab \
    --detach \
    --restart=on-failure:1 \
    --tty \
    --publish=6443/TCP \
    quay.io/brightzheng100/k8s-haproxy:2.1.7-alpine

# Spin up the Kubernetes nodes
for node in "master0" "master1" "master2" "worker0" "worker1"; do
    docker run \
        --name "k8s-${node}" \
        --hostname "${node}" \
        --network lab \
        --privileged \
        --security-opt seccomp=unconfined \
        --security-opt apparmor=unconfined \
        --detach \
        --restart=on-failure:1 \
        --tty \
        --tmpfs /tmp \
        --tmpfs /run \
        --tmpfs /run/lock \
        --volume /var \
        --volume /lib/modules:/lib/modules:ro \
        --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
        quay.io/brightzheng100/k8s-ready:ubuntu.20.04
done

# Review the containers we spun up
docker ps --format '-->  {{.Image}} -- {{.Names}}'