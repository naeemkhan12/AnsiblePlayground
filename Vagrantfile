# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = false
    # disable vagrant shared key checking for ansible to work with
  # config.ssh.insert_key = false
  config.vm.define "database" do |database|
    database.vm.box_check_update = false
    database.vm.hostname="web"
    database.vm.network "private_network", ip: "192.168.33.20"
     database.vm.provider "virtualbox" do |vb|
      # Do not load the command line GUI
      vb.gui = false
      # Virtual Machine Name
      vb.name = "database"
      vb.customize ["modifyvm", :id, "--memory", "512"]
    
    end
  end
  config.vm.define "web" do |web|
    web.vm.hostname="web"
    web.vm.box_check_update = false
    web.vm.network "private_network", ip: "192.168.33.30"
    web.vm.provider "virtualbox" do |vb|
      vb.gui = false
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
