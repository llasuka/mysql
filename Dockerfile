# builderimage
FROM docker.io/centos/mysql-57-centos7:latest

RUN echo "default-character-set=utf8" >> /etc/opt/rh/rh-mysql57/my.cnf.d/base.cnf
RUN echo "character-set-server=utf8" >> /etc/opt/rh/rh-mysql57/my.cnf.d/base.cnf
