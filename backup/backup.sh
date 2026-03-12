#!/bin/bash

DATA=$(date +%F_%H-%M)

# backup destination
DEST1="backupuser@192.168.1.xxx:/mnt/pool1/backup/db"
DEST2="backupuser@192.168.1.xxx:/mnt/pool1/backup/docker"

# enter in EspoCRM container instance and dump DB
docker exec crm-db \
  mysqldump -u root -pxxxxx espocrm > /tmp/db_$DATA.sql

# backup docker compose
tar czf /tmp/docker_$DATA.tar.gz /root/docker-lab/docker

# Sync on destination NAS
rsync -avz /tmp/db_$DATA.sql $DEST1/
rsync -avz /tmp/docker_$DATA.tar.gz $DEST2/

# mantain the last 3 files
ssh backupuser@192.168.1.xxx "
  cd /mnt/pool1/backup/db &&
  ls -1t db_*.sql | tail -n +4 | xargs -r rm --
"

ssh backupuser@192.168.1.xxx "
  cd /mnt/pool1/backup/docker &&
   ls -1t docker_*.tar.gz | tail -n +4 | xargs -r rm --
"

# local cleanup
rm /tmp/db_$DATA.sql
rm /tmp/docker_$DATA.tar.gz

