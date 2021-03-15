# Introduction

This directory is the home of the test playbooks:

* ../tests/prepare.yml => setting up a VM or container with the minimum requirements (that usually is there, but not always in a container)
* ../tests/playbook.yml => running a test against a VM or container (default postgres version: 13)

# Molecule

The default tested version is postgresql 9.6, 10, 11, 12, and 13 on Ubuntu 20.04. We are currently _not_ linting anything.

```
lint: |
  set -e
#  yamllint .
#  ansible-lint
```

You can override this with setting the environment variable MOLECULE_DISTRO to one of:

* centos7
* centos8
* fedora33
* debian9
* debian10
* ubuntu1604
* ubuntu1804
* ubuntu2004

The images we use are extended with systemd by Jeff Geerling. Before we start the tests, `molecule` runs the `prepare.yml` playbook to:

* Create a user called `ansbile`, with the default group membership of either `wheel` (CentOS, Fedora), or `sudo` (Debian, ubuntu)
* Install a couple of packages that Jeff Geerling did not install in his container images, that we need in order to test the role properly


Manual execution of the molecule tests with the distro of your liking:

```
MOLECULE_DISTRO=ubuntu1804 molecule converge
```

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

# References

* https://github.com/search?q=user%3Ageerlingguy+docker-.*-ansible