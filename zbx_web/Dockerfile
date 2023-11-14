FROM rockylinux/rockylinux:9

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    dnf -y install epel-release && \
    dnf -y install --enablerepo=epel supervisor procps mysql && \
    dnf -y install http://ftp.miraclelinux.com/zbx/6.0/miracle-zbx-release-6.0-1.noarch.rpm && \
    dnf -y install miracle-zbx-web-mysql miracle-zbx-web-japanese miracle-zbx-nginx-conf && \
    mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig && \
    cp /etc/nginx/nginx.conf.default /etc/nginx/nginx.conf && \
    sed -i -E 's:((\s+include\s+)mime.types;):\1\n\2/etc/nginx/conf.d/zabbix.conf;:' /etc/nginx/nginx.conf && \
    mkdir -p /run/php-fpm && \
    echo done

COPY docker-entrypoint.sh /

COPY supervisord.conf /etc/
COPY supervisord_zabbix.conf /etc/supervisord.d/

ENTRYPOINT ["/docker-entrypoint.sh"]
