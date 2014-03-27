#! /bin/bash

function install() {
sudo apt-get install -y $1 >/dev/null 2>&1 
    }

programs="build-essential vim tor ssh curl  htop git make traceroute screen python-dev apache2 php5 mysql-server php5-mysql
php5-mysqlnd php-mdb2-driver-mysql mysql-libs" 

pass=$(</vagrant/mysqlpw.txt)

 sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $pass"
 sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $pass"


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
