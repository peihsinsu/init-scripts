#!/bin/bash
# ref: 
# https://www.percona.com/doc/percona-repo-config/percona-release.html#debian-and-ubuntu
# https://www.databasesandlife.com/how-to-install-percona-mysql-5-6-on-ubuntu-14-04-lts-from-a-script-i-e-without-an-interactive-prompt-for-the-mysql-root-password/

echo "Start install percona-xtradb-cluster-full-57..."
apt-get update
apt-get install -y wget vim gnupg2 lsb-release curl
wget https://repo.percona.com/apt/percona-release_latest.generic_all.deb
dpkg -i percona-release_latest.generic_all.deb
apt-get update

echo "NOTE: Remember to remove apparmor or related package..."
echo "Install XDB server..."
echo "percona-xtradb-cluster-server-5.7 percona-xtradb-cluster-server-5.7/root_password password root" |  debconf-set-selections
echo "percona-xtradb-cluster-server-5.7 percona-xtradb-cluster-server-5.7/root_password_again password root" |  debconf-set-selections
echo "percona-xtradb-cluster-server-5.7 percona-xtradb-cluster-server-5.7/root-pass password root" |  debconf-set-selections
echo "percona-xtradb-cluster-server-5.7 percona-xtradb-cluster-server-5.7/re-root-pass password root" |  debconf-set-selections
apt-get install -qq -y percona-xtradb-cluster-server-5.7

echo "Stop server and wait for join..."
service mysql stop

echo "End of installation..."
