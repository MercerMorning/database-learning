FROM postgres:15

RUN apt-get update && \
    apt-get install -y postgresql-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN  pg_createcluster 15 main

RUN pg_ctlcluster 15 main start
