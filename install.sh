#!/bin/bash

echo "--------------------------------------------------------------------------------------"
webaddr=192.168.21.207
echo "$webaddr web1 start ..."
scp /root/jdk-8u65-linux-x64.gz root@${webaddr}:/usr/local/
scp /root/redis-3.0.4.tar.gz root@${webaddr}:/usr/local/
ssh root@$webaddr << eeooff
yum -y install gcc-c++
yum -y install telnet
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
exit
eeooff
scp /root/ct-data/ct-data-3.1.0.RELEASE.jar root@${webaddr}:/home/oracle/ct-data/
scp /root/ct-data/startup.sh root@${webaddr}:/home/oracle/ct-data/
scp /root/ct-data/config/application-product.properties root@${webaddr}:/home/oracle/ct-data/config/
scp /root/ct-data/17monipdb.dat root@${webaddr}:/home/oracle/ct-data/
scp /root/redis.conf root@${webaddr}:/etc/
ssh root@$webaddr << eeooff
chown -R oracle:oracle /home/oracle
chmod -R u+x /home/oracle/ct-data/startup.sh
exit
eeooff
echo "--------------------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------------------"
echo "localhost payment start ..."
cp /root/jdk-8u65-linux-x64.gz /usr/local/
yum -y install gcc-c++
yum -y install telnet
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
cp /root/ct-data-payment/ct-data-payment-3.1.0.release.jar /home/oracle/ct-data-payment/
cp /root/ct-data-payment/startup.sh /home/oracle/ct-data-payment/
cp /root/ct-data-payment/config/application-product.properties /home/oracle/ct-data-payment/config/
cp /root/ct-data-baccarat/ct-data-baccarat-3.1.0.RELEASE.jar /home/oracle/ct-data-baccarat/
cp /root/ct-data-baccarat/startup.sh /home/oracle/ct-data-baccarat/
cp /root/ct-data-baccarat/config/application-product.properties /home/oracle/ct-data-baccarat/config/
chown -R oracle:oracle /home/oracle
chmod -R u+x /home/oracle/ct-data-payment/startup.sh
chmod -R u+x /home/oracle/ct-data-baccarat/startup.sh
echo "--------------------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------------------"
webaddr=192.168.21.208
echo "$webaddr web2 start ..."
scp /root/jdk-8u65-linux-x64.gz root@${webaddr}:/usr/local/
scp /root/nginx-1.9.5.tar.gz root@${webaddr}:/usr/local/
ssh root@$webaddr << eeooff
yum -y install gcc-c++
yum -y install telnet
useradd oracle
echo 'qwer1234!@#$' | passwd --stdin oracle
su - oracle
cd ~
mkdir -p ct-data/config
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
scp /root/ct-data/ct-data-3.1.0.RELEASE.jar root@${webaddr}:/home/oracle/ct-data/
scp /root/ct-data/startup.sh root@${webaddr}:/home/oracle/ct-data/
scp /root/ct-data/config/application-product.properties root@${webaddr}:/home/oracle/ct-data/config/
scp /root/ct-data/17monipdb.dat root@${webaddr}:/home/oracle/ct-data/
scp /root/WebRoot.zip root@${webaddr}:/home/oracle/
scp /root/ct-data/nginx.conf root@${webaddr}:/usr/local/nginx/conf/
ssh root@$webaddr << eeooff
chown -R oracle:oracle /home/oracle
chmod -R u+x /home/oracle/ct-data/startup.sh
exit
eeooff
echo "--------------------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------------------"
webaddr=192.168.21.211
echo "$webaddr admin start ..."
scp /root/jdk-8u65-linux-x64.gz root@${webaddr}:/usr/local/
scp /root/nginx-1.9.5.tar.gz root@${webaddr}:/usr/local/
ssh root@$webaddr << eeooff
yum -y install gcc-c++
yum -y install telnet
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
scp /root/ct-data-admin/ct-data-admin-3.1.0.RELEASE.jar root@${webaddr}:/home/oracle/ct-data-admin/
scp /root/ct-data-admin/startup.sh root@${webaddr}:/home/oracle/ct-data-admin/
scp /root/ct-data-admin/config/application-product.properties root@${webaddr}:/home/oracle/ct-data-admin/config/
scp /root/ct-data-admin/17monipdb.dat root@${webaddr}:/home/oracle/ct-data-admin/
scp /root/tiso_feed_web/tiso_feed_web-3.0.0.release.jar root@${webaddr}:/home/oracle/tiso_feed_web/
scp /root/tiso_feed_web/startup.sh root@${webaddr}:/home/oracle/tiso_feed_web/
scp /root/tiso_feed_web/config/application-product.properties root@${webaddr}:/home/oracle/tiso_feed_web/config/
scp /root/ct-data-admin/nginx.conf root@${webaddr}:/usr/local/nginx/conf/
ssh root@$webaddr << eeooff
chown -R oracle:oracle /home/oracle
chmod -R u+x /home/oracle/ct-data-admin/startup.sh
chmod -R u+x /home/oracle/tiso_feed_web/startup.sh
exit
eeooff
echo "--------------------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------------------"
webaddr=192.168.21.215
echo "$webaddr open start ..."
scp /root/jdk-8u65-linux-x64.gz root@${webaddr}:/usr/local/
ssh root@$webaddr << eeooff
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
scp /root/ct-data-open/ct-data-open-3.1.0.RELEASE.jar root@${webaddr}:/home/oracle/ct-data-open/
scp /root/ct-data-open/startup.sh root@${webaddr}:/home/oracle/ct-data-open/
scp /root/ct-data-open/config/application-product.properties root@${webaddr}:/home/oracle/ct-data-open/config/
scp /root/ct-data-report/ct-data-report4-4.0.0.RELEASE.jar root@${webaddr}:/home/oracle/ct-data-report/
scp /root/ct-data-report/startup.sh root@${webaddr}:/home/oracle/ct-data-report/
scp /root/ct-data-report/config/application-product.properties root@${webaddr}:/home/oracle/ct-data-report/config/
scp /root/ct-data-reportold/ct-data-report4.jar root@${webaddr}:/home/oracle/ct-data-reportold/
scp /root/ct-data-reportold/startup.sh root@${webaddr}:/home/oracle/ct-data-reportold/
scp /root/ct-data-reportold/config/application-product-old.properties root@${webaddr}:/home/oracle/ct-data-reportold/config/
ssh root@$webaddr << eeooff
chown -R oracle:oracle /home/oracle
chmod -R u+x /home/oracle/ct-data-open/startup.sh
chmod -R u+x /home/oracle/ct-data-report/startup.sh
chmod -R u+x /home/oracle/ct-data-reportold/startup.sh
exit
eeooff
echo "--------------------------------------------------------------------------------------"
