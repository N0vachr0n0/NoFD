#!/bin/bash

echo Welcome Hunter !
sleep 1
echo We are looking for your next mission.
sleep 1
echo Please wait...
if grep -q 'Accepted password for hunter from 172.66.0.3' /var/log/auth.log; then
	sleep 3
	echo 'NoFD_{HxH}' > /home/hunter/instruction.txt
	echo "Your instructions for the next mission is saved in /home/hunter/instruction.txt"
else
	sleep 3
	echo 'you have to connect to this machine via host_1 !! Good Luck :)'
fi
