#!/bin/bash

sudo mkdir -p $HOME/.kube && sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config && sudo chown $(id -u):$(id -g) $HOME/.kube/config
sudo kubectl apply -f https://docs.projectcalico.org/v3.11/manifests/calico.yaml
