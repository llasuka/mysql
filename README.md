#使い方
mysqlのs2i用のソースコードです。下記のコマンドでOpenShiftのS2iビルドを実行してください。

``` oc new-app registry.access.redhat.com/rhscl/mysql-57-rhel7~https://github.com/llasuka/mysql -e MYSQL_USER=mysql -e MYSQL_PASSWORD=mysql -e MYSQL_ROOT_PASSWORD=mysql -e MYSQL_DATABASE=redmine --name="mysql" ```

