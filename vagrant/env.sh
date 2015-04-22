#!/usr/bin/env bash

if [ ! -e /etc/vagrant/env ]
then

	echo ">>> setting up environment variables"

	# make the env-create.sh executable
	chmod a+x /vagrant/vagrant/scripts/env
	/vagrant/vagrant/scripts/env

	# now source them into the current terminal session
	. /etc/profile.d/env.sh

	# only run once
	touch /etc/vagrant/env

else

	echo ">>> environment varirables are already setup"

fi
