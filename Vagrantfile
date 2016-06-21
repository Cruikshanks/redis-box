# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant init uses double quotes so makes sense to ignore it in rubocop
# rubocop:disable StringLiterals
# rubocop:disable LineLength

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on the "Usage" link above
    config.cache.scope = :box
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 6379, host: 6379

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # General provisioning of the box. Ensure time is set correctly and do an
  # initial apt-get update, plus install packages commonly needed by all boxes
  config.vm.provision "shell", name: "common", inline: <<-SHELL
    timedatectl set-timezone Europe/London
    apt-get update > /dev/null
    apt-get install -y git build-essential tcl8.5 wget curl make libqt4-dev
  SHELL

  # Specific provisioning of the box
  config.vm.provision "shell", name: "redis", path: "buildsteps/redis.sh"

  config.vm.provision "shell", name: "startup", run: "always", inline: <<-SHELL
    service redis-server restart
  SHELL
end
