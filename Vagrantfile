# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  # Ensure we use our vagrant private key
  config.ssh.insert_key = false
  config.ssh.private_key_path = '~/.vagrant.d/insecure_private_key'

  config.vm.define 'anxs' do |machine|
    machine.vm.box = "ubuntu/xenial64"
    #machine.vm.box = "ubuntu/trusty64"
    #machine.vm.box = "ubuntu/precise64"
    #machine.vm.box = "debian/jessie64"
    #machine.vm.box = "debian/wheezy64"
    #machine.vm.box = "chef/centos-7.1"
    #machine.vm.box = "chef/centos-6.6"

    machine.vm.network :private_network, ip: '192.168.88.22'
    machine.vm.hostname = 'anxs.local'

    # Install python 2.7 to unbuntu 16.04
    if machine.vm.box == "ubuntu/xenial64"
      machine.vm.provision "shell" do |s|
        s.inline = "sudo apt-get install -y python-minimal"
      end
    end

    machine.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'tests/playbook.yml'
      ansible.sudo = true
      ansible.inventory_path = 'vagrant-inventory'
      ansible.host_key_checking = false
    end

  end

end
