#!/bin/bash

echo "--------------------------------------------------------------------------------------"
webaddr=192.168.20.94
echo "$webaddr web2 start ..."
scp -P 50222 /root/jdk-8u65-linux-x64.gz root@${webaddr}:/usr/local/
scp -P 50222 /root/redis-3.0.4.tar.gz root@${webaddr}:/usr/local/
ssh -p 50222 root@$webaddr << eeooff
yum -y install gcc-c++
yum -y install telnet
useradd oracle
echo 'David~!@#$4321`' | passwd --stdin oracle
su - oracle
cd ~
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
scp -P 50222 -r /root/ct-data root@${webaddr}:/home/oracle/
scp -P 50222 /root/redis.conf root@${webaddr}:/etc/
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
echo 'David~!@#$4321`' | passwd --stdin oracle
cd /usr/local
tar -zxvf jdk-8u65-linux-x64.gz
alternatives --install /usr/sbin/java java /usr/local/jdk1.8.0_65/bin/java 1
alternatives --install /usr/sbin/jps jps /usr/local/jdk1.8.0_65/bin/jps 1
cp -fr /root/ct-data-payment /home/oracle/
cp -fr /root/ct-data-baccarat /home/oracle/
chown -R oracle:oracle /home/oracle
chmod -R u+x /home/oracle/ct-data-payment/startup.sh
chmod -R u+x /home/oracle/ct-data-baccarat/startup.sh
echo "--------------------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------------------"
webaddr=192.168.100.142
echo "$webaddr web1 start ..."
scp -P 50222 /root/jdk-8u65-linux-x64.gz root@${webaddr}:/usr/local/
scp -P 50222 /root/nginx-1.9.5.tar.gz root@${webaddr}:/usr/local/
ssh -p 50222 root@$webaddr << eeooff
yum -y install gcc-c++
yum -y install telnet
useradd oracle
echo 'David~!@#$4321`' | passwd --stdin oracle
cd /usr/local
tar -zxvf jdk-8u65-linux-x64.gz
alternatives --install /usr/sbin/java java /usr/local/jdk1.8.0_65/bin/java 1
alternatives --install /usr/sbin/jps jps /usr/local/jdk1.8.0_65/bin/jps 1
tar -zxvf nginx-1.9.5.tar.gz
yum -y install gcc-c++
yum -y install pcre pcre-devel  
yum -y install zlib zlib-devel  
yum -y install openssl openssl-devel
cd /usr/local/nginx-1.9.5
./configure
make && make install
exit
eeooff
scp -P 50222 -r /root/ct-data root@${webaddr}:/home/oracle/
scp -P 50222 /root/ct-data/nginx.conf root@${webaddr}:/usr/local/nginx/conf/
ssh -p 50222 root@$webaddr << eeooff
chown -R oracle:oracle /home/oracle
chmod -R u+x /home/oracle/ct-data/startup.sh
exit
eeooff
echo "--------------------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------------------"
webaddr=192.168.100.144
echo "$webaddr admin start ..."
scp -P 50222 /root/jdk-8u65-linux-x64.gz root@${webaddr}:/usr/local/
scp -P 50222 /root/nginx-1.9.5.tar.gz root@${webaddr}:/usr/local/
ssh -p 50222 root@$webaddr << eeooff
yum -y install gcc-c++
yum -y install telnet
useradd oracle
echo 'David~!@#$4321`' | passwd --stdin oracle
cd /usr/local
tar -zxvf jdk-8u65-linux-x64.gz
alternatives --install /usr/sbin/java java /usr/local/jdk1.8.0_65/bin/java 1
alternatives --install /usr/sbin/jps jps /usr/local/jdk1.8.0_65/bin/jps 1
tar -zxvf nginx-1.9.5.tar.gz
yum -y install gcc-c++
yum -y install pcre pcre-devel
yum -y install zlib zlib-devel
yum -y install openssl openssl-devel
cd /usr/local/nginx-1.9.5
./configure
make && make install
exit
eeooff
scp -P 50222 -r /root/ct-data-admin root@${webaddr}:/home/oracle/
scp -P 50222 -r /root/tiso_feed_web root@${webaddr}:/home/oracle/
scp -P 50222 /root/ct-data-admin/nginx.conf root@${webaddr}:/usr/local/nginx/conf/
ssh -p 50222 root@$webaddr << eeooff
chown -R oracle:oracle /home/oracle
chmod -R u+x /home/oracle/ct-data-admin/startup.sh
chmod -R u+x /home/oracle/tiso_feed_web/startup.sh
exit
eeooff
echo "--------------------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------------------"
webaddr=192.168.100.149
echo "$webaddr open start ..."
scp -P 50222 /root/jdk-8u65-linux-x64.gz root@${webaddr}:/usr/local/
ssh -p 50222 root@$webaddr << eeooff
useradd oracle
echo 'David~!@#$4321`' | passwd --stdin oracle
cd /usr/local
tar -zxvf jdk-8u65-linux-x64.gz
alternatives --install /usr/sbin/java java /usr/local/jdk1.8.0_65/bin/java 1
alternatives --install /usr/sbin/jps jps /usr/local/jdk1.8.0_65/bin/jps 1
exit
eeooff
scp -P 50222 -r /root/ct-data-open root@${webaddr}:/home/oracle/
scp -P 50222 -r /root/ct-data-report root@${webaddr}:/home/oracle/
scp -P 50222 -r /root/ct-data-reportold root@${webaddr}:/home/oracle/
ssh -p 50222 root@$webaddr << eeooff
chown -R oracle:oracle /home/oracle
chmod -R u+x /home/oracle/ct-data-open/startup.sh
chmod -R u+x /home/oracle/ct-data-report/startup.sh
chmod -R u+x /home/oracle/ct-data-reportold/startup.sh
exit
eeooff
echo "--------------------------------------------------------------------------------------"
