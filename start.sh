#!/bin/sh

set -e

FIRST_DOMAIN=$(echo $SUB_DOMAINS | cut -f 1 -d " ")

SERVER_IP=$(ping $SERVER_DOMAIN -c 1 | head -n 1 | cut -f 2 -d "(" | cut -f 1 -d ")")
BASE_DOMAIN=$(echo $FIRST_DOMAIN.$BASE_PATH)

DNS_LIST=$(echo $SUB_DNS | sed -e 's/ /;/g' -e '$s/$/;/')

sed s/"@DNS_LIST"/"$DNS_LIST"/g /root/named.conf > /etc/bind/named.conf

sed -e s/"@SERVER_IP"/"$SERVER_IP"/g \
    -e s/"@FIRST_DOMAIN"/"$FIRST_DOMAIN"/g \
    -e s/"@BASE_PATH"/"$BASE_PATH"/g \
    -e s/"@BASE_DOMAIN"/"$BASE_DOMAIN"/g \
    /root/db.local > /etc/bind/db.local

for DOMAIN in $(echo $SUB_DOMAINS | cut -f 2- -d " ")
do
    echo "$DOMAIN   IN   CNAME   $FIRST_DOMAIN" >> /etc/bind/db.local
done

named -c /etc/bind/named.conf -g -u named
