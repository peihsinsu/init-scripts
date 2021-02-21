#!/bin/bash
# ref: 
# https://www.percona.com/doc/percona-repo-config/percona-release.html#debian-and-ubuntu
# https://www.databasesandlife.com/how-to-install-percona-mysql-5-6-on-ubuntu-14-04-lts-from-a-script-i-e-without-an-interactive-prompt-for-the-mysql-root-password/

echo "Start install percona-xtradb-cluster-full-57..."
#sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
#sudo bash -c 'echo deb http://repo.percona.com/apt trusty main >> /etc/apt/sources.list'
#sudo bash -c 'echo deb-src http://repo.percona.com/apt trusty main >> /etc/apt/sources.list'
sudo apt-get install -y wget vim gnupg2 lsb-release curl
wget wget https://repo.percona.com/apt/percona-release_latest.generic_all.deb
sudo dpkg -i percona-release_latest.generic_all.deb
sudo apt-get update

echo "NOTE: Remember to remove apparmor or related package..."
echo "Install XDB server..."
#echo "percona-xtradb-cluster-server-5.7 percona-xtradb-cluster-server-5.7/root_password password root" | sudo debconf-set-selections
#echo "percona-xtradb-cluster-server-5.7 percona-xtradb-cluster-server-5.7/root_password_again password root" | sudo debconf-set-selections
sudo apt-get install -qq -y percona-xtradb-cluster-server-5.7

echo "Stop server and wait for join..."
sudo service mysql stop

echo "End of installation..."
