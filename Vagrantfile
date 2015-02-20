# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # databasedb2
  # 1
  config.vm.define "databasedb2" do |databasedb2|


    databasedb2.vm.hostname = "databasedb2"

    databasedb2.vm.box = "ubuntu/trusty32"

    databasedb2.vm.network "private_network", ip: "192.168.30.230"
    databasedb2.vm.network "public_network", bridge: 'eth0', ip: "192.168.100.230"

    databasedb2.vm.provision :shell, :path => "databasedb2-setup.v1.sh"

    databasedb2.vm.provider "virtualbox" do |y|
        y.customize [ "modifyvm", :id, "--cpus", "1" ]
        y.customize [ "modifyvm", :id, "--memory", "768" ]
    end
  end
  # End databasedb2

  # APPServer
  #1
  config.vm.define "appserver1" do |appserver1|


    appserver1.vm.hostname = "appserver1"

    appserver1.vm.box = "ubuntu/trusty32"

    appserver1.vm.network "private_network", ip: "192.168.30.220"
    appserver1.vm.network "public_network", bridge: 'eth0', ip: "192.168.100.220"

    appserver1.vm.provision :shell, :path => "appserver-setup.sh"

    appserver1.vm.provider "virtualbox" do |v|
        v.customize [ "modifyvm", :id, "--cpus", "1" ]
        v.customize [ "modifyvm", :id, "--memory", "256" ]
    end
  end
  # 2
  config.vm.define "appserver2" do |appserver2|


    appserver2.vm.hostname = "appserver2"

    appserver2.vm.box = "ubuntu/trusty32"

    appserver2.vm.network "private_network", ip: "192.168.30.221"
    appserver2.vm.network "public_network", bridge: 'eth0', ip: "192.168.100.221"

    appserver2.vm.provision :shell, :path => "appserver-setup.sh"

    appserver2.vm.provider "virtualbox" do |v|
        v.customize [ "modifyvm", :id, "--cpus", "1" ]
        v.customize [ "modifyvm", :id, "--memory", "256" ]
    end
  end
  # End APPServer

  # LoadBalancer
  config.vm.define "loadbalancer" do |loadbalancer|


    loadbalancer.vm.hostname = "loadbalancer"

    loadbalancer.vm.box = "ubuntu/trusty32"

    loadbalancer.vm.network "private_network", ip: "192.168.30.210"
    loadbalancer.vm.network "public_network", bridge: 'eth0', ip: "192.168.100.210"

    loadbalancer.vm.provision :shell, :path => "loadbalancer-setup.sh"

    loadbalancer.vm.provider "virtualbox" do |v|
        v.customize [ "modifyvm", :id, "--cpus", "1" ]
        v.customize [ "modifyvm", :id, "--memory", "256" ]
    end
  end
  # End LoadBalancer
end
