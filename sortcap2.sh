#!/bin/bash

tcpdump -n -r $1 | cut -c 20-38 | cut -d '.' -f 1-4 | grep -v '10.0.0' | sort | uniq -c | sed 's/^[ \t]*//' | sort -n > out
while read fileline; do
    cnt=`echo $fileline | cut -d " " -f 1`
    ip=`echo $fileline | cut -d " " -f 2`
    hst=`host $ip`
    echo $ip : $cnt $hst
done < out

