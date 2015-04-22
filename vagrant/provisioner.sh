#!/usr/bin/env bash

# this will create a directory '/etc/vagrant' if it doesn't exist
# each vagrant provision step will create a file within this folder
# to determine if it needs to run again

# if you want to run a particular step on a subsequent 'vagrant up', simply remove the file
# if you want to run all steps on a subsequent 'vagrant up', simple remove the /etc/vagrant folder

if [ ! -e /etc/vagrant ]
then
	mkdir /etc/vagrant
fi

# make some of our helper scripts executable
chmod a+x /vagrant/vagrant/scripts/reset
chmod a+x /vagrant/vagrant/scripts/run
