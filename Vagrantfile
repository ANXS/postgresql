# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  # Ensure we use our vagrant private key
  config.ssh.insert_key = false
  config.ssh.private_key_path = '~/.vagrant.d/insecure_private_key'

  config.vm.define 'anxs' do |machine|
    node.vm.box = "ubuntu/trusty64"
    #node.vm.box = "ubuntu/precise64"
    #node.vm.box = "debian/jessie64"
    #node.vm.box = "debian/wheezy64"
    #node.vm.box = "chef/centos-7.1"
    #node.vm.box = "chef/centos-6.6"

    machine.vm.network :private_network, ip: '192.168.88.22'
    machine.vm.hostname = 'anxs.local'
    machine.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'tests/playbook.yml'
      ansible.sudo = true
      ansible.inventory_path = 'vagrant-inventory'
      ansible.host_key_checking = false
    end

  end

end
