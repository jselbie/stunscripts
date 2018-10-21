#!/bin/bash


#  OUTGOING RESPONSES
#echo ------------OUTGOING PACKETS---------------------------
#tcpdump -n -r $1 | cut -d ' ' -f 5 | cut -d '.' -f 1-4 | grep -v '172.31.10.106' | grep -v '172.31.4.36' | sort | uniq -c | sed 's/^[ \t]*//' | sort -n -r
#echo ------------INCOMING PACKETS---------------------------
#tcpdump -n -r $1 | cut -d ' ' -f 3 | cut -d '.' -f 1-4 | grep -v '172.31.10.106' | grep -v '172.31.4.36' | sort | uniq -c | sed 's/^[ \t]*//' | sort -n -r 



#  OUTGOING RESPONSES
echo ------------OUTGOING PACKETS---------------------------
tcpdump -n -r $1 | grep -v IP6 | cut -d ' ' -f 5 | cut -d '.' -f 1-4 | grep -v '172.31.10.106' | grep -v '172.31.4.36' | sort | uniq -c | sed 's/^[ \t]*//' | sort -n -r

echo ------------INCOMING PACKETS---------------------------
tcpdump -n -r $1 | grep -v IP6 | cut -d ' ' -f 3 | cut -d '.' -f 1-4 | grep -v '172.31.10.106' | grep -v '172.31.4.36' | sort | uniq -c | sed 's/^[ \t]*//' | sort -n -r 





echo ------------OUTGOING PACKETS IP6---------------------------
tcpdump -n -r $1 | grep IP6 | cut -d ' ' -f 5 | cut -d '.' -f 1 | grep -v '172.31.10.106' | grep -v '172.31.4.36' | sort | uniq -c | sed 's/^[ \t]*//' | sort -n -r

echo ------------INCOMING PACKETS IP6---------------------------
tcpdump -n -r $1 | grep IP6 | cut -d ' ' -f 3 | cut -d '.' -f 1 | grep -v '172.31.10.106' | grep -v '172.31.4.36' | sort | uniq -c | sed 's/^[ \t]*//' | sort -n -r 



