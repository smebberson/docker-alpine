#!/usr/bin/env bash

if [ ! -e /etc/vagrant/compose ]
then

	echo ">>> setting up compose"

	# install compose
	curl -sSL https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose

	# alias docker-compose to make it quicker
	ln -s /usr/local/bin/docker-compose /usr/local/bin/dc

	# only run once
	touch /etc/vagrant/compose

else

	echo ">>> compose is already setup"

fi
