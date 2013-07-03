#!/bin/bash

echo -e "\n\n#### 0. System Packages\n\n"
sudo apt-get update


echo -e "\n\n#### 1. Java (OpenJDK-7)\n\n"
sudo apt-get -y install openjdk-7-jre-headless
FIND_JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
export JAVA_HOME=${FIND_JAVA_HOME%/}
sudo echo "export JAVA_HOME=$JAVA_HOME" >> .bashrc
