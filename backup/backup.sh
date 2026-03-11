#!/bin/bash

DATA=$(date +%F_%H-%M)
DEST1="admin@192.168.1.186:/mnt/pool1/Backuo/db"
DEST2="admin@192.168.1.186:/mnt/pool1/Backuo/dc"

# Dump DB
docker exec crm-db \
  mysqldump -u root -prootpass espocrm > /tmp/db_$DATA.sql

# Backup docker compose e file config
tar czf /tmp/docker_$DATA.tar.gz /root/mini-soc/docker

# Sync su TrueNAS
rsync -avz /tmp/db_$DATA.sql $DEST1/
rsync -avz /tmp/docker_$DATA.tar.gz $DEST2/

# mantiene ultimi 3 files
ssh admin@192.168.1.186 "
  cd /mnt/pool1/Backuo/db &&
  ls -1t db_*.sql | tail -n +4 | xargs -r rm --
"

ssh admin@192.168.1.186 "
  cd /mnt/pool1/Backuo/dc &&
   ls -1t docker_*.tar.gz | tail -n +4 | xargs -r rm --
"

# Cleanup locale
rm /tmp/db_$DATA.sql
rm /tmp/docker_$DATA.tar.gz

