#!/bin/bash

ip_version=$1
interfaces=${*:2}

if [ -z $ip_version ]; then
    >&2 echo "ERROR, No parameters are given!"
    exit 1
elif [ $ip_version == "4" ]; then
    for interface in $interfaces;
    do
        var=$(ip address show $interface 2>/dev/null | grep -o -P '(?<=inet ).*(?=/)')
        if [ -n "$var" ]; then
            echo $var;
            exit 0;
        fi
    done
elif [ $ip_version == "6" ]; then
    for interface in $interfaces;
    do
        var=$(ip address show $interface 2>/dev/null | grep global | grep -v temporary | grep -v /128 | grep -o -P '(?<=inet6 ).*(?=/)')
        if [ -n "$var" ]; then
            echo $var;
            exit 0;
        fi
    done
else
    >&2 echo "ERROR, Invalid IP version!"
    exit 2
fi
