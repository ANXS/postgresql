# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.define 'anxs' do |c|
    c.vm.box = 'anxs-vbox-linux'
    c.vm.box_url = 'http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
    c.vm.network :private_network, ip: '192.168.88.3'
    c.vm.hostname = 'anxs.local'
    c.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'test.yml'
      ansible.sudo = true
      ansible.inventory_path = 'vagrant-inventory'
      ansible.host_key_checking = false
    end
  end
end
