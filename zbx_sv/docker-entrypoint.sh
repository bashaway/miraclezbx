#!/bin/sh

export DB_ZBX_USER=zabbix
export DB_ZBX_PASS=zbxpwd
export DB_ROOT_PASS=rootpwd

until mysqladmin -uroot -p${DB_ROOT_PASS} -h zbx_db  ping ; do
  sleep 5
done

if [ "`mysql -uroot -p${DB_ROOT_PASS} zabbix -h zbx_db -e 'show tables'`" = "" ]  ; then
  mysql -e "create database zabbix character set utf8mb4 collate utf8mb4_bin " -uroot -p${DB_ROOT_PASS}  -h zbx_db
  mysql -e "create user '${DB_ZBX_USER}'@'%' identified by '${DB_ZBX_PASS}'"   -uroot -p${DB_ROOT_PASS}  -h zbx_db
  mysql -e "grant all privileges on zabbix.* to '${DB_ZBX_USER}'@'%'"          -uroot -p${DB_ROOT_PASS}  -h zbx_db
  mysql -e "set global log_bin_trust_function_creators = ON"                   -uroot -p${DB_ROOT_PASS}  -h zbx_db
  zcat /usr/share/doc/miracle-zbx-sql-scripts/mysql/create.sql.gz  | mysql -u${DB_ZBX_USER}  -p${DB_ZBX_PASS} zabbix -h zbx_db
fi

exec "$@"

