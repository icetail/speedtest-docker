FROM python:3.7.0-alpine3.8
MAINTAINER m.vanzanten@icenet.nl

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh


COPY requirements.txt ./
RUN pip install --no-cache-dir -r /requirements.txt
RUN rm /requirements.txt

RUN git clone https://github.com/icetail/zabbix-speedtest.git /opt/speedtest

#RUN mv /opt/speedtest/zabbix_speedtest.sh /etc/zabbix/script/zabbix_speedtest.sh
#RUN chmod +x /etc/zabbix/script/zabbix_speedtest.sh

ENTRYPOINT ["/bin/bash"]
