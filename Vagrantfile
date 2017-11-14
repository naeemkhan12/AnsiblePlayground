# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
    # disable vagrant shared key checking for ansible to work with
    config.ssh.insert_key = false
    config.vm.define "controller" do |controller|
    controller.vm.box_check_update = false
    controller.vm.network "private_network", ip: "192.168.50.10"
    # install ansible on controller node

  config.vm.define "database" do |database|
    database.vm.box = "ubuntu/trusty64"
    database.vm.box_check_update = false
    database.vm.network "private_network", ip: "192.168.50.20"
  end
  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/trusty64"
    web.vm.box_check_update = false
    web.vm.network "private_network", ip: "192.168.50.30"
    web.vm.provider "virtualbox" do |vb|
      # Do not load the command line GUI
      vb.gui = false
      # Virtual Machine Name
      vb.name = "web"
      vb.customize ["modifyvm", :id, "--memory", "512"]
    
    end
  end
  # run ansible after creation of machines
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "playbook.yml"
  end
end
