#!/usr/bin/env bash

if [ ! -e /etc/vagrant/nodejs ]
then

	echo ">>> setting up nodejs"

	# install nodejs
	apt-get install -y nodejs

	# only run once
	touch /etc/vagrant/nodejs

else

	echo ">>> nodejs already setup..."

fi
