# Copyright 2018 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      systemd systemd-sysv \
      ca-certificates curl bash iproute2 iputils-ping net-tools \
      conntrack iptables socat ebtables ethtool util-linux mount \
      nfs-common kmod \
      vim-tiny \
      procps psmisc \
    && ln -sf /lib/systemd/systemd /sbin/init \
    && ln -sf /sbin/init /sbin/telinit \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /etc/kubernetes/manifests /var/lib/kubelet \
    && touch /etc/machine-id

STOPSIGNAL SIGRTMIN+3

CMD ["/sbin/init"]
