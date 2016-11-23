# Isolated boxes with Vagrant

## Description

Vagrant is a tool for simple isolating a VirtualBox instance, one for project.
All the configuration is stored in each Vagrantfile, if you want to change something just edit it and
do a `vagrant reload`.

## Requirements in Host (macOS Sierra)

 - FUSE for macOS https://osxfuse.github.io/
 - SSHFS https://osxfuse.github.io/
 - Vagrant (1.8.6) https://releases.hashicorp.com/vagrant/1.8.6/vagrant_1.8.6.dmg
 - Enable remote login

## Build dev environment:
 - git clone https://github.com/bons/b-bash-scripts.git
 - cd vagrantfiles/bons-debian-jessie64/
 - vagrant up
 - vagrant unificar
 - vagrant ssh
