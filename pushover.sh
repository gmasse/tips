#!/bin/sh
# Portable version (ex work on busybox), inspired from https://gist.github.com/outadoc/848c74677b93dbe2e8f4

if [ $# -eq 0 ]; then
	echo "Usage: ./pushover <message> [title]"
	exit
fi

MESSAGE=$1
TITLE=$2

if [ $# -lt 2 ]; then
	TITLE="`id -un`@${HOSTNAME}"
fi

APP_TOKEN="YOUR_TOKEN_HERE"
USER_TOKEN="YOUR_USER_ID_HERE"

wget https://api.pushover.net/1/messages.json --post-data="token=$APP_TOKEN&user=$USER_TOKEN&message=$MESSAGE&title=$TITLE" -qO- > /dev/null 2>&1 &
