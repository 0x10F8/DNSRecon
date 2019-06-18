#!/bin/bash
# Attempt to perform a forward DNS lookup for the subdomains
# in the file given for the domain given.

if [ $# -lt 2 ]; then
    echo "usage $0 [SUB_DOMAIN_FILE_LIST] [DOMAIN]"
    exit 1
fi

SUBDOMAIN_LIST_FILE=$1
DOMAIN=$2

while read -r prefix; do
    SUB_DOMAIN="${prefix}.${DOMAIN}"
    host "${SUB_DOMAIN}" | grep "has address" | cut -d" " -f1,4
done < "${SUBDOMAIN_LIST_FILE}"