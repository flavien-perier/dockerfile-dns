#!/bin/sh

SERVER_IP=`ping $SERVER_DOMAIN -c 1 | head -n 1 | cut -f 2 -d "(" | cut -f 1 -d ")"`

for FILE in /bind/*
do
    if [ -f $FILE ]
    then
        FILE_NAME=`echo $FILE | cut -f 3 -d "/"`
        FILE_DEST="/etc/bind/$FILE_NAME"

        cat $FILE | sed s/"@SERVER_IP"/"$SERVER_IP"/ > $FILE_DEST
    fi
done

named -c /etc/bind/named.conf -g -u named