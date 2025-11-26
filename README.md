# mariadb-spider

MariaDB の Spider ストレージエンジン を使った検証用環境を Docker + Compose で提供するリポジトリです。

## 前提条件

- Docker と docker compose が利用できる環境  
- MariaDB のコンテナイメージ

## 使い方

```bash
# リポジトリをクローン
git clone https://github.com/komeloper/mariadb-spider.git
cd mariadb-spider

# .env.sample をコピーして必要な値を設定
cp .env.sample .env

# Docker コンテナを立ち上げ
docker-compose up -d
```
