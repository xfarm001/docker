FROM centos:centos6

RUN yum -y install wget
RUN yum -y install tar
RUN yum -y install perl
RUN yum -y install libaio
RUN yum -y install libaio-devel

RUN wget http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-5.6.19-1.linux_glibc2.5.x86_64.rpm-bundle.tar
RUN tar xvf MySQL-5.6.19-1.linux_glibc2.5.x86_64.rpm-bundle.tar
RUN rpm -ivh MySQL-shared-compat-5.6.19-1.linux_glibc2.5.x86_64.rpm
RUN rpm -ivh MySQL-shared-5.6.19-1.linux_glibc2.5.x86_64.rpm
RUN rpm -ivh MySQL-devel-5.6.19-1.linux_glibc2.5.x86_64.rpm
RUN rpm -ivh MySQL-client-5.6.19-1.linux_glibc2.5.x86_64.rpm
RUN rpm -ivh MySQL-server-5.6.19-1.linux_glibc2.5.x86_64.rpm
RUN rpm -ivh MySQL-embedded-5.6.19-1.linux_glibc2.5.x86_64.rpm

EXPOSE 3306

CMD ["echo", "running!"]
