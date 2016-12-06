# -*- mode: ruby -*-
# vi: set ft=ruby :

# load config from YAML file config.yml or if not present config.yml.dist
require 'yaml'
vmconfig = YAML::load(File.open(File.exists?('config.yml') ? 'config.yml' : 'config.yml.dist' ))

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.
  
  config.vm.box = vmconfig['box']

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: vmconfig['private_ip']

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # disable auto share
  config.vm.synced_folder ".", "/vagrant", disabled: vmconfig['disable_default_share']

  vmconfig['shared_folders'].each do |value|
    config.vm.synced_folder value['host_path'], value['guest_path'], create: true, :nfs => value['nfs']
  end


  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = vmconfig['memory']
    vb.cpus = vmconfig['cpus']
  end

  # TODO fix vagrant box image
  # ensure ansible is correctly installed
  config.vm.provision "shell", path: "scripts/ansible.sh"
  
  # provision VM with ansible
  config.vm.provision "file", source: 'ansible', destination: "/home/vagrant/ansible"
  
  config.vm.provision "ansible_local" do |ansible|
    ansible.provisioning_path = "/home/vagrant/ansible"
    ansible.inventory_path =  "/home/vagrant/ansible/inventory"
    ansible.playbook = "main.yml"
    ansible.limit = 'localhost'
    ansible.verbose = false
  end
  
  # get user host git config and ssh key pair
  config.vm.provision "file", source: vmconfig['gitconfig'], destination: ".gitconfig"
  config.vm.provision "file", source: vmconfig['ssh_private_key'], destination: ".ssh/id_rsa"
  config.vm.provision "file", source: vmconfig['ssh_public_key'], destination: ".ssh/id_rsa.pub"

  # configure user vagrant (no sudo)
  config.vm.provision "shell", path: "scripts/user_config.sh", privileged: false
  
  # cleanup
  config.vm.provision "shell", path: "scripts/cleanup.sh"
  
end
