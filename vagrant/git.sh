#!/usr/bin/env bash

if [ ! -e /etc/vagrant/git ]
then

	echo ">>> setting up git"

	# install git
	apt-get install -y git

	# only run once
	touch /etc/vagrant/git

else

	echo ">>> git is already setup"

fi
