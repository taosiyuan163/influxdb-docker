#!/bin/sh
chk_status=`ip addr | grep ens33 | wc -l`
echo $chk_status
if [ $chk_status == 3 ]
  then insepction=`netstat -aln | grep 8088 | wc -l`
       if [ $insepction == 0 ]
          then 
              pkill keepalived
       fi    
fi  
