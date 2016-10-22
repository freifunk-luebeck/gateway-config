# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.provision "shell",
    inline: "sudo pacman --noconfirm -Syu"

  config.vm.provision "shell",
    inline: "sudo pacman --noconfirm -S --needed python2"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.extra_vars = { ansible_python_interpreter: "/usr/bin/env python2" }
  end

  config.vm.network "private_network", type: "dhcp"

  config.vm.define "burgtor" do |config|
    config.vm.box = "ogarcia/archlinux-x64"
  end

  config.vm.define "holstentor" do |config|
    config.vm.box = "ogarcia/archlinux-x64"
  end

  config.vm.define "huextertor" do |config|
    config.vm.box = "ogarcia/archlinux-x64"
  end

  config.vm.define "muehlentor" do |config|
    config.vm.box = "ogarcia/archlinux-x64"
  end
end
