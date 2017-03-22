# influxdb-docker
Created by siyuan.tao on 2017-3-22


# running script of the influxdb-docker
docker run  --privileged=true \
            --net=host \
            -e CHK_INFLUXDB_INTERVAL=2 \
            -e CHK_LOACAL_INTERVAL=5 \
            -e INTERFACE=ens33 \
            -e PREEMPTION=nopreempt \
            -e PRIORITY=100 \
            -e VIRTUAL_IP=192.168.190.100 \
            -e REAL_SERVER1=192.168.190.16 \
            -e REAL_SERVER2=192.168.190.17 \
            -e CHK_IP=www.baidu.com \
            -e CHK_GATEWAY=192.168.190.2 \
            -v /opt/influxdb_data:/var/lib/influxdb \
            --name influxdb_activated \
            -d taosiyuan/influxdb:latest

