#!/usr/bin/env bash

if [ ! -e /etc/vagrant/clean ]
then

	echo ">>> setting up clean"

	# update clean
	apt-get clean

	# only run once
	touch /etc/vagrant/clean

else

	echo ">>> clean is already setup..."

fi
