#!/bin/sh
chpasswd < /root/passwd

if [ -f /omo/.init.sh ];then
	/omo/.init.sh
	rm -f /omo/.init.sh
fi
if [ -f /omo/.startup.sh ];then
	/omo/.startup.sh
fi
/usr/sbin/sshd -D
