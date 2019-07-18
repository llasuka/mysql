#使い方
mysqlのs2i用のソースコードです。下記のコマンドでOpenShiftのS2iビルドを実行してください。

``` oc new-app registry.access.redhat.com/rhscl/mysql-57-rhel7~https://github.com/llasuka/mysql -e MYSQL_USER=mysql -e MYSQL_PASSWORD=mysql -e MYSQL_ROOT_PASSWORD=mysql -e MYSQL_DATABASE=redmine --name="mysql-utf8" ```

コンテナができあがったら、ターミナルからログインし、下記コマンドで結果を確認してください。

``` 
>mysql -u root
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
