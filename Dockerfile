FROM ubuntu:16.04
 
MAINTAINER Peo Holmgren <peotidbit@gmail.com>
 
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y openjdk-8-jre
RUN apt-get install -y cron
#RUN sed -i 's/#cron./cron./g' /etc/rsyslog.d/50-default.conf
 
RUN mkdir -p /usr/local/cron/dyndns-update
RUN mkdir -p /var/log
 
VOLUME /usr/local/cron/dyndns-update
VOLUME /var/log
 
COPY ./dyndns-update /usr/local/cron/dyndns-update
COPY ./cron-file.txt /usr/local/cron/.

RUN crontab /usr/local/cron/cron-file.txt
#ENTRYPOINT cron -f
CMD cron -f
