#!/bin/bash
echo "Install base packages..."
sudo apt-get install gnupg2 wget -y

echo "Setup repo..."
wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb
sudo dpkg -i percona-release_latest.$(lsb_release -sc)_all.deb
sudo apt-get update

echo "Install percona server..."
sudo apt-get install percona-server-server-5.7 -y
sudo rm percona-release_latest.$(lsb_release -sc)_all.deb
