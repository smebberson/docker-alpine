#!/usr/bin/env bash

if [ ! -e /etc/vagrant/development ]
then

	echo ">>> setting up development environment"

	# move the docker commands into /usr/bin
	if [ ! -e /usr/bin/docker-clean-images ]; then
		ln -s /vagrant/vagrant/scripts/docker-clean-images /usr/bin/docker-clean-images
	fi

	if [ ! -e /usr/bin/docker-clean-containers ]; then
		ln -s /vagrant/vagrant/scripts/docker-clean-containers /usr/bin/docker-clean-containers
	fi

	# only run once
	touch /etc/vagrant/development

else

	echo ">>> development environment is already setup"

fi
