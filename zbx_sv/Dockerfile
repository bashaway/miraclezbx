FROM rockylinux/rockylinux:9

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    dnf -y install mysql procps && \
    dnf -y install http://ftp.miraclelinux.com/zbx/6.0/miracle-zbx-release-6.0-1.noarch.rpm && \
    dnf -y install miracle-zbx-server-mysql miracle-zbx-sql-scripts && \
    #echo 'DBName=zabbix'  >> /etc/zabbix/zabbix_server.conf && \
    #echo 'DBUser=zabbix' >> /etc/zabbix/zabbix_server.conf && \
    echo 'DBPassword=zbxpwd' >> /etc/zabbix/zabbix_server.conf && \
    echo 'DBHost=zbx_db' >> /etc/zabbix/zabbix_server.conf && \
    echo done

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/zabbix_server", "--foreground", "-c", "/etc/zabbix/zabbix_server.conf"]
