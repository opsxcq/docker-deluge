#!/bin/bash


if [ ! -f '/config/core.conf' ]
then
    echo '[-] Configuration files not found, generating from template'

fi


deluged -c /config -d -L info &
deluge-web -c /config 
