# Introduction

This directory is the home of the test playbooks:

* ../tests/prepare.yml => setting up a VM or container with the minimum requirements (that usually is there, but not always in a container)
* ../tests/playbook.yml => running a test against a VM or container (default postgres version: 13)

## Molecule

The default tested versions are postgresql 12, 13, 14, 15 and 16 on Debian 11. Linting is disabled for the tests.

The default distribution is ubuntu2204. You can override th with setting the environment variable MOLECULE_DISTRO to one of:

* fedora40
* debian11
* debian12
* ubuntu2004
* ubuntu2204
* ubuntu2404

Manual execution of the molecule tests with the distro of your liking. Examples:

```bash
MOLECULE_DISTRO=rockylinux9 molecule converge
MOLECULE_DISTRO=debian11 molecule converge
MOLECULE_DISTRO=ubuntu2204 molecule converge
```

The images we use are extended with systemd by Jeff Geerling. See https://hub.docker.com/u/geerlingguy/

Prior to the testing, molecule runs the prepare.yml playbook to:

* Create a user called `ansible`, with the default group membership of either `wheel` (CentOS, Fedora), or `sudo` (Debian, ubuntu)
* Install a couple of packages that Jeff Geerling did not install in his container images, that are needed in order to test the role properly

The main file ./molecule/default/molecule.yml sets up versions to test from 12 to 16.

## Tests

The playbooks read variables from two files. One common vars file, and one with unique variables per OS and distribution major version.

* ../tests/vars.yml <== read by all OS:es
* ../tests/vars.{{ ansible_distribution }}.{{ ansible_distribution_major_version }}.yml

```bash
$ ls -1 tests/ | grep vars
vars.Debian.11.yml
vars.Debian.12.yml
vars.Fedora.40.yml
vars.Ubuntu.20.yml
vars.Ubuntu.22.yml
vars.Ubuntu.24.yml
vars.yml
```

## Local installation of molecule

```bash
pip install molecule molecule-plugins[docker]
```

## Examples

To run molecule tests locally, you can run the following commands:

```bash
#--- to just create the default containers (ubuntu2204), and run prepare.yml
molecule create

#--- to run the tests and keep the containers
molecule converge

#--- full life cycle of tests
molecule test

#--- to clean up (i.e after converge, if you would like to change to a different distribution)
molecule destroy

#--- with specific distro release
MOLECULE_DISTRO=ubuntu2204 molecule create
MOLECULE_DISTRO=ubuntu2204 molecule converge
MOLECULE_DISTRO=ubuntu2204 molecule test
MOLECULE_DISTRO=ubuntu2204 molecule destroy
```

## References

* https://github.com/search?q=user%3Ageerlingguy+docker-.*-ansible
