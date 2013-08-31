#! /bin/bash

function install() {
sudo apt-get install -y $1 
    }

programs="build-essential vim tor nmap ssh curl apg smbclient htop git hydra make traceroute screen python-dev openjdk-7-jdk
apache2 php5" 

sudo apt-get update

for program in $programs
do
    install $program
done 

rm -rf /var/www
ln -fs /vagrant /var/www 

