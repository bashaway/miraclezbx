FROM centos:centos8
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime ; \
    dnf -y update ; dnf -y install epel-release rsyslog logrotate cronie ; \
    dnf -y install http://ftp.miraclelinux.com/zbx/4.0/miracle-zbx-release-4.0-2.noarch.rpm ;\
    rpm --import http://ftp.miraclelinux.com/zbx/RPM-GPG-KEY-MIRACLE ; \
    dnf -y install miracle-zbx-server-mysql miracle-zbx-web miracle-zbx-web-mysql miracle-zbx-web-japanese php-ldap ;\
    sed -i 's/^#//' /etc/httpd/conf.d/zabbix.conf ; \
    echo 'DBPassword=zbxpwd' >> /etc/zabbix/zabbix_server.conf ;\
    echo 'DBHost=zbx_db' >> /etc/zabbix/zabbix_server.conf ;\
    systemctl enable httpd ;\
    systemctl enable zabbix-server 
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh / 
ENTRYPOINT ["docker-entrypoint.sh"]
CMD [ "/usr/sbin/init" ]
