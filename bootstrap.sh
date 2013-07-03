#!/bin/bash

echo -e "\n\n#### 0. System Packages\n\n"
sudo apt-get update
sudo apt-get -y install unzip


echo -e "\n\n#### 1. Java (OpenJDK-7)\n\n"
sudo apt-get -y install openjdk-7-jre-headless
FIND_JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
export JAVA_HOME=${FIND_JAVA_HOME%/}
sudo echo "export JAVA_HOME=$JAVA_HOME" >> .bashrc


echo -e "\n\n#### 2. Java Cryptography Extensions\n\n"
unzip config/UnlimitedJCEPolicyJDK7.zip
sudo cp -f UnlimitedJCEPolicy/*.jar $JAVA_HOME/lib/security/
rm -rf UnlimitedJCEPolicy


echo -e "\n\n#### 3. Tomcat 6\n\n"
sudo apt-get -y install tomcat6
