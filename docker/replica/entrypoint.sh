#!/bin/bash

# Подождем, пока основной сервер PostgreSQL будет доступен
#until pg_isready -h "$MASTER_HOST" -p 5432 -U "$POSTGRES_USER"; do
#  echo "Waiting for master to be ready..."
#  sleep 2
#done

pg_createcluster 15 main
rm -rf /var/lib/postgresql/15/main
pg_basebackup -h postgres -p 5432 -U otus -D /var/lib/postgresql/15/main -R
echo 'port = 5433' >> /var/lib/postgresql/15/main/postgresql.auto.conf
echo 'hot_standby = on' >> /var/lib/postgresql/15/main/postgresql.auto.conf
echo "primary_slot_name = 'main'" >> /var/lib/postgresql/15/main/postgresql.auto.conf
echo "primary_conninfo = 'host=$MASTER_HOST port=5432 user=$POSTGRES_USER password=$POSTGRES_PASSWORD'" >> /var/lib/postgresql/15/main/postgresql.auto.conf
echo "recovery_min_apply_delay = '5min'" >> /var/lib/postgresql/15/main/postgresql.auto.conf
pg_ctlcluster 15 main start


tail -f /dev/null
