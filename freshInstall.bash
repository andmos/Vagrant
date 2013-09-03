#! /bin/bash

function install() {
sudo apt-get install -y $1 >/dev/null 2>&1 
    }

programs="build-essential vim tor  ssh curl  htop git make traceroute screen python-dev openjdk-7-jdk
apache2 php5" 

echo "Installing web-server essentials..."
sudo apt-get update >/dev/null 2>&1 

for program in $programs
do 
    echo "Current package: $program" 
    install $program 

done 

echo "Symlincing /www folder to /Vagrant folder..."

rm -rf /var/www
ln -fs /vagrant /var/www 

echo "All done! go 'vagrant ssh'" 
