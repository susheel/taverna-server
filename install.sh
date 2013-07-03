#!/bin/bash

if [ -d /var/lib/tomcat6/webapps/taverna-server ]
then
  echo "You already have Taverna Server installed. You'll need to remove Taverna Server if you want to install"
  exit
fi

sudo apt-get update             # Update package cache
sudo apt-get -y install git     # Install git

# Clone taverna-server repository
git clone https://github.com/susheel/taverna-server.git
cd taverna-server

./bootstrap.sh 2>&1 | tee ~/taverna-install.log
