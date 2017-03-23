#Version 0.1  

FROM influxdb:1.1.4-alpine

MAINTAINER siyuantao taosiyuan163@163.com

RUN apk add ipvsadm --update && \
    apk add keepalived && \
    apk add bash && \
    apk add bash-doc && \
    apk add bash-completion

ADD KeepalivedEntrypoint.sh /

ADD keepalived.conf /etc/keepalived/

ADD master.sh /

ADD chk_influxdb.sh /

ADD chk_local.sh /

ADD exe_chk_local.sh /

ADD link_conf.sh /

RUN chmod +x KeepalivedEntrypoint.sh && \
    chmod +x /master.sh && \
    chmod +x /chk_influxdb.sh && \
    chmod +x /chk_local.sh && \
    chmod +x /exe_chk_local.sh && \
    chmod +x /link_conf.sh

#EXPOSE 2512

ENTRYPOINT ["sh"]
CMD ["KeepalivedEntrypoint.sh"]
