#!/usr/bin/env bash

if [ ! -e /etc/vagrant/docker ]
then

	echo ">>> setting up docker"

	# Install the latest version of Docker.
	curl -fsSL https://get.docker.com/ | sh

	usermod -aG docker vagrant

else

	echo ">>> docker is already setup"

fi
