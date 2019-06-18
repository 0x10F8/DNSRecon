#!/bin/bash
# Attempts to perform reverse DNS look ups for the IP range defined 
# by the parameters. If the resulting domain matches the pattern
# specified then returns the found domain + IP.

if [ $# -lt 4 ]; then
    echo "usage $0 [IP BASE] [IP OCT START] [IP OCT END] [DOMAIN PATTERN]"
    exit 1
fi

IP_BASE=$1
IP_START=$2
IP_END=$3
GREP_PATTERN=$4

for ip in $(seq $IP_START $IP_END); do
    host ${IP_BASE}.${ip} | grep "${GREP_PATTERN}" | cut -d" " -f1,5
done