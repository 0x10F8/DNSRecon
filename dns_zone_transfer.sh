#!/bin/sh
# Attempts to zone transfer all DNS records from the nameservers
# specified.

if [ $# -lt 1 ]; then
    echo "usage $0 [DOMAIN]"
    exit 1
fi

DOMAIN=$1

# Get the name servers
NAME_SERVERS=($(host -t ns $DOMAIN | awk '{print substr($4, 1, length($4)-1)}'))

# Attempt zone transfer
for nameserver in "${NAME_SERVERS[@]}"; do
    host -l $DOMAIN $nameserver
done