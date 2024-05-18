#!/bin/bash

# Подождем, пока основной сервер PostgreSQL будет доступен
#until pg_isready -h "$MASTER_HOST" -p 5432 -U "$POSTGRES_USER"; do
#  echo "Waiting for master to be ready..."
#  sleep 2
#done

pg_createcluster 15 main
pg_ctlcluster 15 main start


tail -f /dev/null
