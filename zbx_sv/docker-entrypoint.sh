#!/bin/sh

until mysqladmin -uzabbix -pzbxpwd -h zbx_db  ping ; do
  sleep 1
done

if [ "`mysql -uzabbix -pzbxpwd  -h zbx_db zabbix  -e 'show tables'`" = "" ]  ; then
  zcat /usr/share/doc/miracle-zbx-server-mysql/create.sql.gz  | mysql -uzabbix -pzbxpwd zabbix -h zbx_db
fi

exec "$@"

