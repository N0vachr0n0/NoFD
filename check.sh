#!/bin/bash

echo Checking...
sleep 3

if ip a show eth0 2>/dev/null | grep -q "172.66.0.5/32"; then
	echo "2nd IP is present !"
else
	echo "NoFD_{1pm4n4g3r}"
fi
