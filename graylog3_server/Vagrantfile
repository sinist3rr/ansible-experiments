# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_IP = "192.168.56.100"
DOMAIN = "example.com"
PRIVATE_KEY = "~/.ssh/id_rsa"
PUBLIC_KEY = '~/.ssh/id_rsa.pub'

Vagrant.configure("2") do |config|
  config.vm.define "graylogg" do |srv|
    srv.vm.box = "centos/7"
    srv.vm.hostname = 'graylogg' + '.' + DOMAIN
    srv.vm.network :private_network, ip: BOX_IP
    srv.vm.synced_folder '.', '/vagrant', disabled: true
    srv.ssh.insert_key = false
    srv.ssh.private_key_path = [PRIVATE_KEY, "~/.vagrant.d/insecure_private_key"]
    srv.vm.provision "file", source: PUBLIC_KEY, destination: "~/.ssh/authorized_keys"
    srv.vm.provision "shell", inline: <<-SHELL
    ln -s /usr/share/terminfo/r/rxvt-256color /usr/share/terminfo/r/rxvt-unicode-256color
    SHELL

    srv.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 4096]
   end
  end
end
