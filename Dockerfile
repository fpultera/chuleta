FROM centos
RUN yum update -y
RUN yum install -y vim
RUN yum install -y wget
RUN yum install -y nginx
