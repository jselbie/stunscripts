#!/bin/bash

# tcpdump -n -r $1 | cut -c 20-38 | cut -d '.' -f 1-4 | grep -v '10.0.0' | sort | uniq -c | sed 's/^[ \t]*//' | sort -n 

#  INCOMING REQUESTS
#tcpdump -n -r $1 | cut -d ' ' -f 3 | cut -d '.' -f 1-4 | grep -v '10.0.0' | sort | uniq -c | sed 's/^[ \t]*//' | sort -n 

#  OUTGOING RESPONSES
echo ------------OUTGOING PACKETS---------------------------

tcpdump -n -r $1 ip | cut -d ' ' -f 5 | cut -d '.' -f 1-4 | grep -v '172.31.10.106' | grep -v '172.31.4.36' > tmp1
tcpdump -n -r $1 ip6 | cut -d ' ' -f 5 | cut -d '.' -f 1 |  grep -v '2600:1f16:8c5:101::8' | grep -v '2600:1f16:8c5:101::9' > tmp2
cat tmp1 tmp2 | sort | uniq -c | sed 's/^[ \t]*//' | sort -n -r


echo ------------INCOMING PACKETS---------------------------
tcpdump -n -r $1 ip | cut -d ' ' -f 3 | cut -d '.' -f 1-4 | grep -v '172.31.10.106' | grep -v '172.31.4.36' > tmp3
tcpdump -n -r $1 ip6 | cut -d ' ' -f 3 | cut -d '.' -f 1 | grep -v '2600:1f16:8c5:101::8' | grep -v '2600:1f16:8c5:101::9' > tmp4
cat tmp3 tmp4 | sort | uniq -c | sed 's/^[ \t]*//' | sort -n -r

