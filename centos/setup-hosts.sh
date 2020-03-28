#!/bin/bash
set -e
IFNAME=$1
ADDRESS="$(ip -4 addr show $IFNAME | grep "inet" | head -1 |awk '{print $2}' | cut -d/ -f1)"
sed -e "s/^.*${HOSTNAME}.*/${ADDRESS} ${HOSTNAME} ${HOSTNAME}.local/" -i /etc/hosts

sudo yum install -y wget net-tools

# Update /etc/hosts about other hosts
cat >> /etc/hosts <<EOF
192.168.11.10  kubernetes-jenkinsX-master
192.168.11.11  workerone-jenkinsX-node
192.168.11.12  workertwo-jenkinsX-node
EOF