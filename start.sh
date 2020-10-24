#!/bin/sh

FIRST_DOMAIN=`echo $SUB_DOMAINS | cut -f 1 -d " "`

SERVER_IP=`ping $SERVER_DOMAIN -c 1 | head -n 1 | cut -f 2 -d "(" | cut -f 1 -d ")"`
BASE_DOMAIN=`echo $FIRST_DOMAIN.$BASE_PATH`

DNS_LIST=`echo $SUB_DNS | tr " " ";" | sed '$s/$/;/'`

cat /root/named.conf | \
    sed s/"@DNS_LIST"/"$DNS_LIST"/g > /etc/bind/named.conf

cat /root/db.local | \
    sed s/"@SERVER_IP"/"$SERVER_IP"/g | \
    sed s/"@FIRST_DOMAIN"/"$FIRST_DOMAIN"/g | \
    sed s/"@BASE_PATH"/"$BASE_PATH"/g | \
    sed s/"@BASE_DOMAIN"/"$BASE_DOMAIN"/g > /etc/bind/db.local

for DOMAIN in `echo $SUB_DOMAINS | cut -f 2- -d " "`
do
    echo "$DOMAIN   IN   CNAME   $FIRST_DOMAIN" >> /etc/bind/db.local
done

named -c /etc/bind/named.conf -g -u named
