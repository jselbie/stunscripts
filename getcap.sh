#!/bin/bash

sudo rm dump.cap
sudo rm dump.time
starttime=`date +%s`
echo collecting dump
#sudo tcpdump -n -c 100000 -w dump.cap 'port 3478 or 3479'
sudo tcpdump -G 60 -W 1 -n -w dump.cap 'port 3478 or 3479'
endtime=`date +%s`
totaltime=`expr $endtime - $starttime`
echo done collecting dump. Total time for capture is $totaltime seconds
echo $totaltime > dump.time


sudo chown ubuntu dump.cap
sudo chown ubuntu dump.time

