FROM postgres:15

RUN apt-get update && \
    apt-get install -y postgresql-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Скопируем скрипт entrypoint.sh для настройки реплики при запуске контейнера
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

USER postgres

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]