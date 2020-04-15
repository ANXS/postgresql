# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  # Ensure we use our vagrant private key
  config.ssh.insert_key = false
  config.ssh.private_key_path = '~/.vagrant.d/insecure_private_key'

  config.vm.define 'ubuntu16.local' do |machine|

    machine.vm.box = "bento/ubuntu-16.04"
    machine.vm.network :private_network, ip: '192.168.88.10'
    machine.vm.hostname = 'ubuntu16.local'

    machine.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'tests/playbook.yml'
      ansible.verbose = "vvv"
      ansible.become = true
      ansible.inventory_path = 'vagrant-inventory'
      ansible.host_key_checking = false
    end

  end

  config.vm.define 'jessie64.local' do |machine|

    machine.vm.box = "debian/jessie64"
    machine.vm.network :private_network, ip: '192.168.88.20'
    machine.vm.hostname = 'jessie64.local'

    machine.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'tests/playbook.yml'
      ansible.verbose = "vvv"
      ansible.become = true
      ansible.inventory_path = 'vagrant-inventory'
      ansible.host_key_checking = false
    end

  end

  config.vm.define 'wheezy64.local' do |machine|

    machine.vm.box = "debian/wheezy64"
    machine.vm.network :private_network, ip: '192.168.88.21'
    machine.vm.hostname = 'wheezy64.local'

    machine.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'tests/playbook.yml'
      ansible.verbose = "vvv"
      ansible.become = true
      ansible.inventory_path = 'vagrant-inventory'
      ansible.host_key_checking = false
    end

  end

  config.vm.define 'centos6.local' do |machine|

    machine.vm.box = "centos/6"
    machine.vm.network :private_network, ip: '192.168.88.30'
    machine.vm.hostname = 'centos6.local'

    machine.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'tests/playbook.yml'
      ansible.verbose = "vvv"
      ansible.become = true
      ansible.inventory_path = 'vagrant-inventory'
      ansible.host_key_checking = false
    end

  end

  config.vm.define 'centos7.local' do |machine|

    machine.vm.box = "centos/7"
    machine.vm.network :private_network, ip: '192.168.88.31'
    machine.vm.hostname = 'centos7.local'

    machine.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'tests/playbook.yml'
      ansible.verbose = "vvv"
      ansible.become = true
      ansible.inventory_path = 'vagrant-inventory'
      ansible.host_key_checking = false
    end

  end

##
## Fedora is disabled, as the build fails
##
##  config.vm.define 'fedora27.local' do |machine|
##
##    machine.vm.box = "fedora/27-cloud-base"
##    machine.vm.network :private_network, ip: '192.168.88.40'
##    machine.vm.hostname = 'fedora27.local'
##
##    machine.vm.provision 'ansible' do |ansible|
##      ansible.playbook = 'tests/playbook.yml'
##      ansible.verbose = "vvv"
##      ansible.become = true
##      ansible.inventory_path = 'vagrant-inventory'
##      ansible.host_key_checking = false
##    end
##
##  end

end