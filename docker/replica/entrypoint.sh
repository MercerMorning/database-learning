#!/bin/bash

# Подождем, пока основной сервер PostgreSQL будет доступен
#until pg_isready -h "$MASTER_HOST" -p 5432 -U "$POSTGRES_USER"; do
#  echo "Waiting for master to be ready..."
#  sleep 2
#done

pg_createcluster 15 main
rm -rf /var/lib/postgresql/15/main

# Создаем кластер main2, делаем резервное копирование и настраиваем
pg_basebackup -h postgres -p 5432 -U otus -D /var/lib/postgresql/15/main -R
echo 'port = 5433' >> /var/lib/postgresql/15/main/postgresql.auto.conf
echo 'hot_standby = on' >> /var/lib/postgresql/15/main/postgresql.auto.conf
echo "primary_conninfo = 'host=$MASTER_HOST port=5432 user=$POSTGRES_USER password=$POSTGRES_PASSWORD'" >> /var/lib/postgresql/15/main/postgresql.auto.conf


# Запуск резервного кластера
pg_ctlcluster 15 main start
tail -f /dev/null
