1) Физическая репликация
конфигурация контейнеров: docker/docker-compose.yml (postgres, postgres_replica)
- вручную переключил мастер на wal_level=replica
- конфигурация мастера в папке docker/master
- конфигурация реплики docker/replica
2) Логическая репликация
конфигурация контейнеров: docker/docker-compose.yml (postgres, postgres_logical)
- вручную переключил мастер на wal_level=logical
- вручную сделал запрос для создания публикации ```CREATE PUBLICATION test_pub FOR TABLE statistic;```
- вручную подписал реплику на публикации ```CREATE SUBSCRIPTION otus_sub CONNECTION 'host=172.26.0.2 port=5432 user=postgres password=otus dbname=otus' PUBLICATION test_pub WITH (copy_data = true);``` (ip хоста подглядел в inspect контейнера - он не статичен)