# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  # Ensure we use our vagrant private key
  config.ssh.insert_key = false
  config.ssh.private_key_path = '~/.vagrant.d/insecure_private_key'

  config.vm.define 'anxs-centos-vm' do |machine|
    #machine.vm.box = "bento/ubuntu-16.04"
    # machine.vm.box = "ubuntu/trusty64"
    #machine.vm.box = "ubuntu/precise64"
    #machine.vm.box = "debian/jessie64"
    #machine.vm.box = "debian/wheezy64"
    machine.vm.box = "centos/7"
    #machine.vm.box = "centos/6"

    machine.vm.network :private_network, ip: '192.168.88.22'

    machine.vm.hostname = 'anxs-centos-vm'

    machine.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'tests/playbook.yml'
      # ansible.verbose = "v"
      ansible.become = true
      ansible.inventory_path = 'vagrant-inventory'
      ansible.host_key_checking = false
    end

  end

  config.vm.define 'anxs-ubuntu-vm' do |machine| machine.vm.box = "bento/ubuntu-16.04"
    machine.vm.network :private_network, ip: '192.168.88.23'

    machine.vm.hostname = 'anxs-ubuntu-vm'

    machine.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'tests/playbook.yml'
      ansible.become = true
      ansible.inventory_path = 'vagrant-inventory'
      ansible.host_key_checking = false
    end

  end

end
