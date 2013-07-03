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
sudo service tomcat6 stop
sudo cp -f config/etc/tomcat6/* /etc/tomcat6/
sudo chown -R tomcat6:tomcat6 /etc/tomcat6


echo -e "\n\n#### 4. AtomHopper (Interaction Service)\n\n"
sudo wget -O /var/lib/tomcat6/webapps/ah.war http://maven.research.rackspacecloud.com/content/repositories/releases/org/atomhopper/atomhopper/1.2.9/atomhopper-1.2.9.war
sudo mkdir -p /etc/atomhopper /opt/atomhopper
sudo cp -fR config/etc/atomhopper/* /etc/atomhopper/
sudo chown -R tomcat6:tomcat6 /etc/atomhopper/ /opt/atomhopper
sudo service tomcat6 start


echo -e "\n\n#### 5. Taverna Server (2.4.1)\n\n"
sudo service tomcat6 stop
sudo wget -O /var/lib/tomcat6/webapps/taverna-server.war https://launchpad.net/taverna-server/2.x/2.4.1/+download/TavernaServer.2.4.1.war
sudo service tomcat6 start
sudo service tomcat6 stop
