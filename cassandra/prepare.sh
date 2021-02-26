#!/bin/bash

## Pre-installs
apt-get update 
apt-get install software-properties-common curl wget vim -y

## Install Python
apt update
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python get-pip.py
apt install python3

## Install Java
apt install openjdk-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
echo $JAVA_HOME
java -version

# Install Cassandra 3.0.12
wget http://dl.bintray.com/apache/cassandra/pool/main/c/cassandra/cassandra_3.0.12_all.deb
dpkg -i cassandra_3.0.12_all.deb
dpkg -l |grep cassandra
apt update
NOTE: update the config files

