# How To USe
このDockerfileは、下記設定を追加します。
 1. confファイルの流し込み（env配下を/etc/mysql/conf.d配下にコピー）
 1. 初期設定の流し込み（/docker-entrypoint-initdb.d配下を/docker-entrypoint-initdb.dにコピー）

# 文字コードの確認
conf/custom.cnfに文字コードをUTF8に変更する内容を記述しています。（下記参照)
```
[mysql]
default-character-set=utf8

[mysqld]
character-set-server=utf8
```
mysqlは、/etc/mysql/conf.d配下のconfファイルをすべて読み込んで実行するので、文字コードがUTF8に変更される。
確認方法は下記の通り。

``` 
>mysql -u root -p 
Enter password: ******
>use database redmine
>show variables like "chara%";
+--------------------------+--------------------------------------------------------------+
| Variable_name            | Value                                                        |
+--------------------------+--------------------------------------------------------------+
| character_set_client     | utf8                                                         |
| character_set_connection | utf8                                                         |
| character_set_database   | utf8                                                         |
| character_set_filesystem | binary                                                       |
| character_set_results    | utf8                                                         |
| character_set_server     | utf8                                                         |
| character_set_system     | utf8                                                         |
| character_sets_dir       | /opt/rh/rh-mysql57/root/usr/share/rh-mysql57-mysql/charsets/ |
+--------------------------+--------------------------------------------------------------+
8 rows in set (0.00 sec)

``` 

# データベースの永続化

デフォルトではデータベースの永続化が行なわれていないため、Dockerイメージ起動時に下記ディレクトリを永続化すること

`/var/lib/mysql`

# データベースの追加

データベースを追加する際には、ターミナルからログインをして、下記コマンドを実行してください

``` 
>grant all privileges on `wordpress`.* to 'mysql'@'%';
> SHOW GRANTS for 'mysql'@'%';
+------------------------------------------------------+
| Grants for mysql@%                                   |
+------------------------------------------------------+
| GRANT USAGE ON *.* TO 'mysql'@'%'                    |
| GRANT ALL PRIVILEGES ON `redmine`.* TO 'mysql'@'%'   |
| GRANT ALL PRIVILEGES ON `wordpress`.* TO 'mysql'@'%' |
+------------------------------------------------------+
3 rows in set (0.00 sec)

```
