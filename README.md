# Miracle ZBX docker compose

Network Parameters

|key|value|
|:-:|:-:|
|name|miraclezbx_zbx_nw|
|subnet|-(dynamic)|
|interface|br_zbx_nw|

Container Parameters

|server|app|address|listen|
|:-:|:-:|:-:|:-:|
|zbx_db|MariaDB|-(dynamic)|3306/tcp|
|zbx_sv|MiracleZBX|-(dynamic)|10051,80/tcp<BR>161,162/udp|

# Firewall Policy add

```
firewall-cmd --add-masquerade --permanent
firewall-cmd --reload
```


# build servers

## git clone

```
git clone https://github.com/bashaway/miraclezbx
```

## Build and Start Containers
```
cd miraclezbx
docker-compose build
docker-compose up -d
```

# Setup

## Access Zabbix Server

http://[hostname or address]/zabbix

## Pre-installation

MariaDB : Database

|key|value|
|:--:|:--:|
|Database type|MySQL|
|Database server|zbx_db|
|Database port|default(3306)|
|Database name|zabbix|
|Database user|zabbix|
|Database password|zbxpwd|
        
MIRACLE ZBX Server
|key|value|
|:--:|:--:|
|MIRACLE ZBX server|zbx_sv|
|MIRACLE ZBX server port|10051|
|MIRACLE ZBX server name|zbx_sv|



# remove servers

## STOP and REMOVE All Containers
```
docker-compose stop
docker-compose rm -f
```

## Stop and remove containers, networks, images, and volumes
```
docker-compose down
```

## docker command : Clean Up All Container and Images
```
docker ps -aq | xargs docker rm -f ; \
docker images -aq | xargs docker rmi
```


# Appendix

## Install Docker

### DockerCE

```
dnf -y update
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
dnf -y --nobest install docker-ce docker-ce-cli containerd.io
dnf -y update https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.10-3.2.el7.x86_64.rpm
dnf -y update
systemctl enable docker
systemctl start docker
```

### Docker Compose
```
curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```


# ref
https://docs.docker.com/compose/install/
