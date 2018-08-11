FROM python:3.7.0-alpine3.8
MAINTAINER m.vanzanten@icenet.nl

RUN apk update && apk upgrade && \
    apk install git bash openssh zabbix-agent -y

COPY requirements.txt ./
RUN pip install --no-cache-dir -r /requirements.txt
RUN rm /requirements.txt

RUN git clone https://github.com/icetail/zabbix-speedtest.git /opt/speedtest

RUN mkdir /etc/zabbix/script

RUN cp /opt/speedtest/zabbix_speedtest.sh /etc/zabbix/script/zabbix_speedtest.sh
RUN chmod +x /etc/zabbix/script/zabbix_speedtest.sh

RUN /usr/bin/crontab /opt/speedtest/speedtest.txt
