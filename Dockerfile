# docker build -t robeson/xbmc-mysql .
# Run like "docker run -d -p :3306 robeson/xbmc-mysql"
from ubuntu:12.10
maintainer Ryan Robeson "ryan.robeson@gmail.com"

run apt-get update
run apt-get install -y software-properties-common
run apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
run add-apt-repository 'deb http://ftp.osuosl.org/pub/mariadb/repo/5.5/ubuntu quantal main'
run apt-get update
run echo mysql-server-5.5 mysql-server/root_password password 'my_special_pass' | debconf-set-selections
run echo mysql-server-5.5 mysql-server/root_password_again password 'my_special_pass' | debconf-set-selections
run DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server-5.5
run rm /etc/mysql/my.cnf
add my.cnf /etc/mysql/my.cnf
add xbmc.sql xbmc.sql
run mysqld_safe & sleep 5 && mysql -u root --password=my_special_pass < xbmc.sql

expose 3306
cmd ["mysqld_safe"]
