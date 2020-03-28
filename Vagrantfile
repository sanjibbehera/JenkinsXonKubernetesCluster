IP_NW = "192.168.11."
KUBERNETES_MASTER_IP = 10
KUBERNETES_WORKERONE_NODE_IP = 11
KUBERNETES_WORKERTWO_NODE_IP = 12

Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"
    config.vm.define "kubernetes-jenkinsX-master" do |node|
        node.vm.provider "virtualbox" do |vb|
            vb.name = "kubernetes-jenkinsX-master"
            vb.memory = 2500
            vb.cpus = 2
        end
        node.vm.hostname = "kubernetes-jenkinsX-master"
        node.vm.network :private_network, ip: IP_NW + "#{KUBERNETES_MASTER_IP}"
        node.vm.network "forwarded_port", guest: 22, host: 2888

        node.vm.provision "setup-hosts", :type => "shell", :path => "centos/setup-hosts.sh" do |s|
            s.args = ["eth1"]
        end
        node.vm.provision "setup-dns", type: "shell", :path => "centos/update-dns.sh"
		node.vm.provision "installDocker", type: "shell", :path => "centos/install-docker.sh"
		node.vm.provision "installKubeadmMaster", type: "shell", :path => "centos/installKubeadmMaster.sh"
    end
    config.vm.define "workerone-jenkinsX-node" do |node|
        node.vm.provider "virtualbox" do |vb|
            vb.name = "workerone-jenkinsX-node"
            vb.memory = 3096
            vb.cpus = 2
        end
        node.vm.hostname = "workerone-jenkinsX-node"
        node.vm.network :private_network, ip: IP_NW + "#{KUBERNETES_WORKERONE_NODE_IP}"
        node.vm.network "forwarded_port", guest: 22, host: 2777

        node.vm.provision "setup-hosts", :type => "shell", :path => "centos/setup-hosts.sh" do |s|
            s.args = ["eth1"]
        end
        node.vm.provision "setup-dns", type: "shell", :path => "centos/update-dns.sh"
		node.vm.provision "installDocker", type: "shell", :path => "centos/install-docker.sh"
		node.vm.provision "installKubeadmNodes", type: "shell", :path => "centos/installKubeadmNodes.sh"
    end
    config.vm.define "workertwo-jenkinsX-node" do |node|
        node.vm.provider "virtualbox" do |vb|
            vb.name = "workertwo-jenkinsX-node"
            vb.memory = 3096
            vb.cpus = 2
        end
        node.vm.hostname = "workertwo-jenkinsX-node"
        node.vm.network :private_network, ip: IP_NW + "#{KUBERNETES_WORKERTWO_NODE_IP}"
        node.vm.network "forwarded_port", guest: 22, host: 2666

        node.vm.provision "setup-hosts", :type => "shell", :path => "centos/setup-hosts.sh" do |s|
            s.args = ["eth1"]
        end
        node.vm.provision "setup-dns", type: "shell", :path => "centos/update-dns.sh"
		node.vm.provision "installDocker", type: "shell", :path => "centos/install-docker.sh"
		node.vm.provision "installKubeadmNodes", type: "shell", :path => "centos/installKubeadmNodes.sh"
    end
end