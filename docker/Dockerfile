FROM centos:centos7
MAINTAINER Timothy Chin <timothy.chin2@anthem.com>

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd python sudo; yum clean all
COPY ./start.sh /start.sh
RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

RUN chmod 755 /start.sh
# EXPOSE 22
RUN ./start.sh
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
