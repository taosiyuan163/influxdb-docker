#!/bin/bash
#CHK_IP=`awk '/^CHK_IP/{print $2}' /container_conf/container.conf`
#CHK_GATEWAY=`awk '/^CHK_GATEWAY/{print $2}' /container_conf/container.conf`
SUCSSESFUL_COUNT=0
FAILURES_COUNT=0
for ((i=0;i<4;i++))
do
	if  ping -c 1 <CHK_IP> > /dev/null && ping -c 1 <CHK_GATEWAY> > /dev/null
	then
		let "SUCSSESFUL_COUNT++"
		sleep 0.5
#echo "sucssesd" >> chk_test
	else
		let "FAILURES_COUNT++"
	fi
done

if (( $FAILURES_COUNT >= 3 ))
then
	 pkill keepalived
fi
