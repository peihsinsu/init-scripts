#!/bin/bash
# ref: https://www.percona.com/doc/percona-repo-config/percona-release.html#debian-and-ubuntu
sudo apt-get install -y wget gnupg2 lsb-release curl
wget https://repo.percona.com/apt/percona-release_latest.generic_all.deb
sudo dpkg -i percona-release_latest.generic_all.deb
sudo apt-get update
sudo rm percona-release_latest.$(lsb_release -sc)_all.deb

echo "NOTE: Remember to remove apparmor or related package..."

echo "Install XDB server..."
sudo apt-get install percona-xtradb-cluster -y

echo "Stop server and wait for join..."
sudo service mysql stop


