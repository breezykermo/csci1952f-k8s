#!/usr/bin/env sh
if ! command -v /usr/bin/arti &> /dev/null
then
    echo "No arti binary, running without Tor."
    exit
fi

/usr/bin/arti -l info proxy -p 9150
