FROM ubuntu:systemd

ENV DEBIAN_FRONTEND=noninteractive

ARG VERSION

USER root

#ADD 100-ubnt-unifi.list /etc/apt/sources.list.d/100-ubnt-unifi.list
RUN curl -sfL https://www.mongodb.org/static/pgp/server-3.6.asc | apt-key add -
ADD mongodb-org-3.6.list /etc/apt/sources.list.d/mongodb-org-3.6.list
#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 0C49F3730359A14518585931BC711F9BA15703C6
#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50 
RUN apt-get update && \
    apt-get -y install openjdk-8-jdk-headless ca-certificates apt-transport-https
RUN apt-get -y install mongodb-org-server

RUN curl -sfLO https://dl.ui.com/unifi/${VERSION}/unifi_sysvinit_all.deb && \
    apt-get install -y /unifi_sysvinit_all.deb && \
    rm -f /unifi_sysvinit_all.deb && \
    systemctl enable unifi && \
    systemctl disable mongod

VOLUME /var/lib/unifi
