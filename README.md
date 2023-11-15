Unofficial MIRACLE ZBX docker-compose.yml

# MIRACLE ZBX Install Manual

https://www.miraclelinux.com/support/miracle-zbx60/zbx-support/ml9manual

# Parameters

Container

|server|app|address|listen|
|:-:|:-:|:-:|:-:|
|zbx_db|MariaDB|-(dynamic)|3306/tcp|
|zbx_sv|MiracleZBX|-(dynamic)|10051/tcp<BR>162/udp|
|zbx_web|Nginx|-(dynamic)|80,443/tcp|

# build servers

## git clone

```
git clone https://github.com/bashaway/miraclezbx
```

## Build and Start Containers
```
cd miraclezbx
docker compose up --build -d
```

# Setup

## Access Zabbix Server

http://[hostname or address]/

## login web console
Username : Admin
Password : zabbix


# remove servers

## Stop and remove containers, networks, images, and volumes
```
docker compose down --rmi all --volumes
```

## docker command : Clean Up All Container and Images
```
docker ps -aq | xargs docker rm -f ; \
docker images -aq | xargs docker rmi
```

