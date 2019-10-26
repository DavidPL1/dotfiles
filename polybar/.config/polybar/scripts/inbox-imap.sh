#!/bin/sh
NETRC="/home/spectre/.netrc"

inbox=$(curl -sf --netrc-file "$NETRC" -X "STATUS INBOX (UNSEEN)" imaps://"$SERVER"/INBOX | tr -d -c "[:digit:]")

if [ "$inbox" ] && [ "$inbox" -gt 0 ]; then
    echo " $inbox"
else
    echo " 0"
fi
