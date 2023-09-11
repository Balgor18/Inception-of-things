# -*- mode: ruby -*-
# vi: set ft=ruby :
cpus           = ENV['CPUS'] || 4
memory         = ENV['MEMORY'] || 5012
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/lunar64"


  config.vm.provider "virtualbox" do |vb|
    vb.memory = memory # Need to up the size or vboxmanage return an error
    vb.cpus = cpus
    # vb.gui = true
    vb.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
    vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
  end

  config.vm.define "Inception_of_things" do |iOT|
    iOT.vm.hostname = "InceptionOfThings"
    iOT.vm.synced_folder "p1/", "/vagrant/p1"
    iOT.vm.synced_folder "p2/", "/vagrant/p2"
    iOT.vm.synced_folder "p3/", "/vagrant/p3"
    iOT.vm.synced_folder "bonus/", "/vagrant/bonus"
    iOT.vm.provision "shell", privileged: true, path: "install/install_vagrant.sh"
    iOT.vm.provision "shell", inline: <<-SHELL
    echo "1/4"
    SHELL
    iOT.vm.provision "shell", privileged: true, path: "install/p2/modif_host_file.sh"
    iOT.vm.provision "shell", inline: <<-SHELL
    echo "2/4"
    SHELL
    iOT.vm.provision "shell", privileged: true, path: "install/install_part3.sh"
    iOT.vm.provision "shell", inline: <<-SHELL
    echo "3/4"
    SHELL
    iOT.vm.provision "shell", privileged: true, path: "install/install_bonus.sh"
    iOT.vm.provision "shell", inline: <<-SHELL
    echo "4/4"
    SHELL
    iOT.vm.network "forwarded_port", guest: 8080, host: 8080
    iOT.vm.network "forwarded_port", guest: 8085, host: 8085
    # iOT.vm.provision "shell", privileged: true, path: "install/install_graph_mod.sh"
  end

end

