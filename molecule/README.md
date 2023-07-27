# Introduction

This directory is the home of the test playbooks:

* ../tests/prepare.yml => setting up a VM or container with the minimum requirements (that usually is there, but not always in a container)
* ../tests/playbook.yml => running a test against a VM or container (default postgres version: 13)

# Molecule

The default tested version is postgresql 9.6, 10, 11, 12, and 13 on Ubuntu 20.04. Linting is disabled for the tests.

The default distribution is ubuntu2004. You can override th with setting the environment variable MOLECULE_DISTRO to one of:

* centos7
* centos8
* fedora33
* debian9
* debian10
* ubuntu1604
* ubuntu1804
* ubuntu2004

Manual execution of the molecule tests with the distro of your liking. Examples:

```
MOLECULE_DISTRO=centos8 molecule converge
MOLECULE_DISTRO=debian10 molecule converge
MOLECULE_DISTRO=ubuntu2004 molecule converge
```

The images we use are extended with systemd by Jeff Geerling. See https://hub.docker.com/u/geerlingguy/

Prior to the testing, molecule runs the prepare.yml playbook to:

* Create a user called `ansible`, with the default group membership of either `wheel` (CentOS, Fedora), or `sudo` (Debian, ubuntu)
* Install a couple of packages that Jeff Geerling did not install in his container images, that are needed in order to test the role properly

The main file ./molecule/default/molecule.yml sets up versions to test from 9.6 to 13.

# Tests

The playbooks read variables from two files. One common vars file, and one with unique variables per OS and distribution major version.

* ../tests/vars.yml <== read by all OS:es
* ../tests/vars.{{ ansible_distribution }}.{{ ansible_distribution_major_version }}.yml

```
$ ls -1 tests/ | grep vars
vars.yml
vars.CentOS.7.yml
vars.CentOS.8.yml
vars.Debian.10.yml
vars.Debian.9.yml
vars.Debian.yml
vars.Fedora.33.yml
vars.Ubuntu.16.yml
vars.Ubuntu.18.yml
vars.Ubuntu.20.yml
```

The main difference, currently, is which python version to use.

# Local installation of molecule

```
pip install molecule molecule-docker
```

# Examples

To run molecule tests locally, you can run the following commands:

```
#--- to just create the default containers (ubuntu2004), and run prepare.yml
molecule create

#--- to run the tests and keep the containers
molecule converge

#--- full life cycle of tests
molecule test

#--- to clean up (i.e after converge, if you would like to change to a different distribution)
molecule destroy

#--- with specific distro release
MOLECULE_DISTRO=ubuntu2004 molecule create
MOLECULE_DISTRO=ubuntu2004 molecule converge
MOLECULE_DISTRO=ubuntu2004 molecule test
MOLECULE_DISTRO=ubuntu2004 molecule destroy
```

# References

* https://github.com/search?q=user%3Ageerlingguy+docker-.*-ansible