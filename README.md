# JenkinsXonKubernetesOnPremiseCluster
How to setup JenkinsX on Kubernetes On-Premise Cluster.

### VM provisioning with Vagrant scripts..
Use the Vagrantfile to setup the vms for kubernetes cluster.  
use the below command to download the necessary files for VM provisioning.
## vagrant up

### Important Note.  
once the master VM is provisioning, copy the kubeadm join command to used on the 2 worker nodes.

## For eg.  
sudo kubeadm join 192.168.11.10:6443 --token 8idmxj.6mw9anrvh7dd4d5r \  
  --discovery-token-ca-cert-hash sha256:f82e0b81c335caa14799ea7011c8295027ae2bff4cc2ff4a97b65107740ec7e4

## Configuring the NON-Root User profile for Kubernetes Cluster in MASTER VM.
    
Execute the bellow CMD..  
sudo mkdir -p ~/.kube && sudo cp -i /etc/kubernetes/admin.conf ~/.kube/config \  
&& sudo chown -R $(id -u):$(id -g) ~/.kube
