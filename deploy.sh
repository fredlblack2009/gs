#!/bin/bash
webusers=(
oracle
oracle
oracle
weblogic
)
webaddrs=(
192.168.21.223
192.168.21.221
192.168.21.203
123.1.151.246
)
webdirs=(
''
''
''
'/btx'
)

echo "--------------------------------------------------------------------------------------"
echo "localhost start ..."
./startup.sh deploy
echo "--------------------------------------------------------------------------------------"

for i in "${!webaddrs[@]}"
do
echo "--------------------------------------------------------------------------------------"
echo "${webaddrs[${i}]} start ..."
scp ct-data-admin-3.1.0.RELEASE.jar ${webusers[${i}]}@${webaddrs[${i}]}:~${webdirs[${i}]}/ct-data-admin/
ssh ${webusers[${i}]}@${webaddrs[${i}]} << eeooff
cd /home/${webusers[${i}]}${webdirs[${i}]}/ct-data
./startup.sh deploy
exit
eeooff
echo "--------------------------------------------------------------------------------------"
done
