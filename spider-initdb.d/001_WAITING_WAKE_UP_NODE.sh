#!/bin/bash

# ノードとなるデーターベースの起動確認
until mariadb-admin ping -h ${NODE01} -u${NODE_USER01} -p${NODE_PASSWORD01} --silent; do
    sleep 1
done

until mariadb-admin ping -h ${NODE02} -u${NODE_USER02} -p${NODE_PASSWORD02} --silent; do
    sleep 1
done

until mariadb-admin ping -h ${NODE03} -u${NODE_USER03} -p${NODE_PASSWORD03} --silent; do
    sleep 1
done


# ノードとなるデーターベースを登録
mariadb -uroot -p${MARIADB_ROOT_PASSWORD} -e" \
    INSTALL SONAME 'ha_spider';

    DROP SERVER IF EXISTS node1;
    CREATE SERVER node1 FOREIGN DATA WRAPPER mysql
        OPTIONS (
            HOST '${NODE01}',
            DATABASE 'node_database',
            USER '${NODE_USER01}',
            PASSWORD '${NODE_PASSWORD01}',
            PORT 3306
        );

    DROP SERVER IF EXISTS node2;
    CREATE SERVER node2 FOREIGN DATA WRAPPER mysql
        OPTIONS (
            HOST '${NODE02}',
            DATABASE 'node_database',
            USER '${NODE_USER02}',
            PASSWORD '${NODE_PASSWORD02}',
            PORT 3306
        );

    DROP SERVER IF EXISTS node3;
    CREATE SERVER node3 FOREIGN DATA WRAPPER mysql
        OPTIONS (
            HOST '${NODE03}',
            DATABASE 'node_database',
            USER '${NODE_USER03}',
            PASSWORD '${NODE_PASSWORD03}',
            PORT 3306
        );

    FLUSH TABLES;
"

# テーブルの作成（SQLファイルを流し込む）
mariadb -uroot -p${MARIADB_ROOT_PASSWORD} ${MARIADB_DATABASE} < /docker-entrypoint-initdb.d/002_CREATE_TABLE.sql_
