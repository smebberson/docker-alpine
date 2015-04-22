#!/usr/bin/env bash

if [ ! -e /etc/vagrant/apt-get ]
then

	echo ">>> setting up apt-get"

	# Required for nodejs
	curl -sL https://deb.nodesource.com/setup | sudo bash -

	# Required for add-apt-repository
	apt-get install -y software-properties-common build-essential

	# update apt-get
	apt-get update

	# only run once
	touch /etc/vagrant/apt-get

else

	echo ">>> apt-get is already setup..."

fi
