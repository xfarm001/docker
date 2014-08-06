# DOCKER-VERSION latest
FROM    centos:6

# ここは自由に変えてください
MAINTAINER sugiyan

# パッケージインストール
RUN yum install -y mysql mysql-server

# mysqlサーバのセットアップ
RUN echo "NETWORKING=yes" > /etc/sysconfig/network
ADD ./setup.sql
RUN /usr/bin/mysqld_safe & \
        sleep 10s && \
        cat setup.sql | mysql

# 外部からmysqlサーバにアクセスできるように
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# ポート番号 3306 を外部に公開
EXPOSE 3306

CMD ["/usr/bin/mysqld_safe"]
