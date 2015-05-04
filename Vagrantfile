# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Set the host ip
  host_ip = "192.168.89.10"

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "phusion/ubuntu-14.04-amd64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 4000

  # using NFS to increase speed between synchronised folders https://coderwall.com/p/uaohzg, https://docs.vagrantup.com/v2/synced-folders/nfs.html
  # config.vm.synced_folder ".", "/vagrant", type: 'nfs'
  config.vm.synced_folder ".", "/vagrant"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: host_ip
  # Or allow network wide access to the machine by commenting out the line above,
  # and uncommenting the line below.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # configuration step 0: set the host ip as an environment variable within the VM itself
  config.vm.provision "shell", inline: "echo ""export HOST_IP=#{host_ip}"" > /etc/profile.d/hostip.sh"

  # configuration step 1: setup our provisioning environment
  config.vm.provision "shell", path: "vagrant/provisioner.sh"

  # configuration step 2: setup apt-get
  config.vm.provision "shell", path: "vagrant/apt-get.sh"

  # configuration step 3: install docker
  config.vm.provision "docker"

  # configuration step 4: install compose
  config.vm.provision "shell", path: "vagrant/compose.sh"

  # configuration step 5: install git
  config.vm.provision "shell", path: "vagrant/git.sh"

  # configuration step 6: install git
  config.vm.provision "shell", path: "vagrant/nodejs.sh"

  # configuration step 7: setup environment variables
  config.vm.provision "shell", path: "vagrant/env.sh"

  # configuration step 8: setup, ready for development
  config.vm.provision "shell", path: "vagrant/development.sh"

  # configuration step 8: clean-up!
  config.vm.provision "shell", path: "vagrant/clean.sh"

end
