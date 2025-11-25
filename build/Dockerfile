FROM mariadb:11.8

RUN apt-get update && \
    apt-get install -y mariadb-plugin-spider && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
