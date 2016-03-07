#!/bin/bash

echo "--------------------------------------------------------------------------------------"
webaddr=
hname=
echo "$webaddr web2 start ..."
scp /usr/local/jdk-8u65-linux-x64.gz root@${webaddr}:/usr/local/
scp /usr/local/redis-3.0.4.tar.gz root@${webaddr}:/usr/local/
ssh root@$webaddr << eeooff
hostnamectl set-hostname $hname
echo 'zxcv4321$#@!' | passwd --stdin root
useradd oracle
echo 'qwer1234!@#$' | passwd --stdin oracle
su - oracle
cd ~
mkdir -p ct-data/config
mkdir redis
exit
cd /usr/local
tar -zxvf jdk-8u65-linux-x64.gz
alternatives --install /usr/sbin/java java /usr/local/jdk1.8.0_65/bin/java 1
alternatives --install /usr/sbin/jps jps /usr/local/jdk1.8.0_65/bin/jps 1
tar -zxvf redis-3.0.4.tar.gz
cd /usr/local/redis-3.0.4/deps
make hiredis jemalloc linenoise lua
cd /usr/local/redis-3.0.4
make && make install
cp redis.conf /etc/redis.conf
exit
eeooff
scp oracle@192.168.21.209:/home/oracle/ct-data/ct-data-3.1.0.release.jar root@${webaddr}:/home/oracle/ct-data/
scp oracle@192.168.21.209:/home/oracle/ct-data/startup.sh root@${webaddr}:/home/oracle/ct-data/
scp oracle@192.168.21.209:/home/oracle/ct-data/config/application-product.properties root@${webaddr}:/home/oracle/ct-data/config/
scp oracle@192.168.21.209:/home/oracle/ct-data/17monipdb.dat root@${webaddr}:/home/oracle/ct-data/
echo "--------------------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------------------"
webaddr=
hname=
echo "$webaddr payment start ..."
scp /usr/local/jdk-8u65-linux-x64.gz root@${webaddr}:/usr/local/
ssh root@$webaddr << eeooff
hostnamectl set-hostname $hname
echo 'zxcv4321$#@!' | passwd --stdin root
useradd oracle
echo 'qwer1234!@#$' | passwd --stdin oracle
su - oracle
cd ~
mkdir -p ct-data-payment/config
mkdir -p ct-data-baccarat/config
exit
cd /usr/local
tar -zxvf jdk-8u65-linux-x64.gz
alternatives --install /usr/sbin/java java /usr/local/jdk1.8.0_65/bin/java 1
alternatives --install /usr/sbin/jps jps /usr/local/jdk1.8.0_65/bin/jps 1
exit
eeooff
scp /home/oracle/ct-data-payment/ct-data-payment-3.1.0.release.jar root@${webaddr}:/home/oracle/ct-data-payment/
scp /home/oracle/ct-data-payment/startup.sh root@${webaddr}:/home/oracle/ct-data-payment/
scp /home/oracle/ct-data-payment/config/application-product.properties root@${webaddr}:/home/oracle/ct-data-payment/config/
scp /home/oracle/ct-data-baccarat/ct-data-baccarat-3.1.0.RELEASE.jar root@${webaddr}:/home/oracle/ct-data-baccarat/
scp /home/oracle/ct-data-baccarat/startup.sh root@${webaddr}:/home/oracle/ct-data-baccarat/
scp /home/oracle/ct-data-baccarat/config/application-product.properties root@${webaddr}:/home/oracle/ct-data-baccarat/config/
echo "--------------------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------------------"
webaddr=
hname=
echo "$webaddr web1 start ..."
scp /usr/local/jdk-8u65-linux-x64.gz root@${webaddr}:/usr/local/
scp /usr/local/nginx-1.9.5.tar.gz root@${webaddr}:/usr/local/
ssh root@$webaddr << eeooff
hostnamectl set-hostname $hname
echo 'zxcv4321$#@!' | passwd --stdin root
useradd oracle
echo 'qwer1234!@#$' | passwd --stdin oracle
su - oracle
cd ~
mkdir -p ct-data/config
mkdir WebRoot
exit
cd /usr/local
tar -zxvf jdk-8u65-linux-x64.gz
alternatives --install /usr/sbin/java java /usr/local/jdk1.8.0_65/bin/java 1
alternatives --install /usr/sbin/jps jps /usr/local/jdk1.8.0_65/bin/jps 1
tar -zxvf nginx-1.9.5.tar.gz
yum -y install gcc-c++
yum -y install pcre pcre-devel  
yum -y install zlib zlib-devel  
yum -y install openssl openssl--devel
cd /usr/local/nginx-1.9.5
./configure
make && make install
exit
eeooff
scp oracle@192.168.21.209:/home/oracle/ct-data/ct-data-3.1.0.release.jar root@${webaddr}:/home/oracle/ct-data/
scp oracle@192.168.21.209:/home/oracle/ct-data/startup.sh root@${webaddr}:/home/oracle/ct-data/
scp oracle@192.168.21.209:/home/oracle/ct-data/config/application-product.properties root@${webaddr}:/home/oracle/ct-data/config/
scp oracle@192.168.21.209:/home/oracle/ct-data/17monipdb.dat root@${webaddr}:/home/oracle/ct-data/
echo "--------------------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------------------"
webaddr=
hname=
echo "$webaddr admin start ..."
scp /usr/local/jdk-8u65-linux-x64.gz root@${webaddr}:/usr/local/
scp /usr/local/nginx-1.9.5.tar.gz root@${webaddr}:/usr/local/
ssh root@$webaddr << eeooff
hostnamectl set-hostname $hname
echo 'zxcv4321$#@!' | passwd --stdin root
useradd oracle
echo 'qwer1234!@#$' | passwd --stdin oracle
su - oracle
cd ~
mkdir -p ct-data-admin/config
mkdir -p tiso_feed_web/config
exit
cd /usr/local
tar -zxvf jdk-8u65-linux-x64.gz
alternatives --install /usr/sbin/java java /usr/local/jdk1.8.0_65/bin/java 1
alternatives --install /usr/sbin/jps jps /usr/local/jdk1.8.0_65/bin/jps 1
tar -zxvf nginx-1.9.5.tar.gz
yum -y install gcc-c++
yum -y install pcre pcre-devel
yum -y install zlib zlib-devel
yum -y install openssl openssl--devel
cd /usr/local/nginx-1.9.5
./configure
make && make install
exit
eeooff
scp oracle@192.168.21.212:/home/oracle/ct-data-admin/ct-data-admin-3.1.0.RELEASE.jar root@${webaddr}:/home/oracle/ct-data-admin/
scp oracle@192.168.21.212:/home/oracle/ct-data-admin/startup.sh root@${webaddr}:/home/oracle/ct-data-admin/
scp oracle@192.168.21.212:/home/oracle/ct-data-admin/config/application-product.properties root@${webaddr}:/home/oracle/ct-data-admin/config/
scp oracle@192.168.21.212:/home/oracle/ct-data-admin/17monipdb.dat root@${webaddr}:/home/oracle/ct-data-admin/
scp oracle@192.168.21.212:/home/oracle/tiso_feed_web/tiso_feed_web-3.0.0.release.jar root@${webaddr}:/home/oracle/tiso_feed_web/
scp oracle@192.168.21.212:/home/oracle/tiso_feed_web/startup.sh root@${webaddr}:/home/oracle/tiso_feed_web/
scp oracle@192.168.21.212:/home/oracle/tiso_feed_web/config/application-product.properties root@${webaddr}:/home/oracle/tiso_feed_web/config/
echo "--------------------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------------------"
webaddr=
hname=
echo "$webaddr open start ..."
scp /usr/local/jdk-8u65-linux-x64.gz root@${webaddr}:/usr/local/
ssh root@$webaddr << eeooff
hostnamectl set-hostname $hname
echo 'zxcv4321$#@!' | passwd --stdin root
useradd oracle
echo 'qwer1234!@#$' | passwd --stdin oracle
su - oracle
cd ~
mkdir -p ct-data-open/config
mkdir -p ct-data-report/config
mkdir -p ct-data-reportold/config
exit
cd /usr/local
tar -zxvf jdk-8u65-linux-x64.gz
alternatives --install /usr/sbin/java java /usr/local/jdk1.8.0_65/bin/java 1
alternatives --install /usr/sbin/jps jps /usr/local/jdk1.8.0_65/bin/jps 1
exit
eeooff
scp oracle@192.168.21.216:/home/oracle/ct-data-open/ct-data-open-3.1.0.RELEASE.jar root@${webaddr}:/home/oracle/ct-data-open/
scp oracle@192.168.21.216:/home/oracle/ct-data-open/startup.sh root@${webaddr}:/home/oracle/ct-data-open/
scp oracle@192.168.21.216:/home/oracle/ct-data-open/config/application-product.properties root@${webaddr}:/home/oracle/ct-data-open/config/
scp oracle@192.168.21.216:/home/oracle/ct-data-report/ct-data-report4-4.0.0.RELEASE.jar root@${webaddr}:/home/oracle/ct-data-report/
scp oracle@192.168.21.216:/home/oracle/ct-data-report/startup.sh root@${webaddr}:/home/oracle/ct-data-report/
scp oracle@192.168.21.216:/home/oracle/ct-data-report/config/application-product.properties root@${webaddr}:/home/oracle/ct-data-report/config/
scp oracle@192.168.21.216:/home/oracle/ct-data-reportold/ct-data-report4.jar root@${webaddr}:/home/oracle/ct-data-reportold/
scp oracle@192.168.21.216:/home/oracle/ct-data-reportold/startup.sh root@${webaddr}:/home/oracle/ct-data-reportold/
scp oracle@192.168.21.216:/home/oracle/ct-data-reportold/config/application-product-old.properties root@${webaddr}:/home/oracle/ct-data-reportold/config/
echo "--------------------------------------------------------------------------------------"
