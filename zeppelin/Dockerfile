FROM salimelakoui/hadoop-base:latest-salim

MAINTAINER Salim EL AKOUI <salim.elakoui@nway.org>

ENV ZEPPELIN_VERSION 0.8.1
ENV ZEPPELIN_HOME /opt/zeppelin
ENV ZEPPELIN_CONF_DIR=${ZEPPELIN_HOME}/conf 
ENV ZEPPELIN_DATA_DIR=${ZEPPELIN_HOME}/data 
ENV ZEPPELIN_NOTEBOOK_DIR=${ZEPPELIN_HOME}/notebook 

RUN apt-get update && apt-get install wget
RUN set -x \
    && curl -fSL "http://apache.crihan.fr/dist/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-all.tgz" -o /tmp/zeppelin.tgz \
    && tar -xzvf /tmp/zeppelin.tgz -C /opt/ \
    && mv /opt/zeppelin-* /opt/zeppelin \
    && rm /tmp/zeppelin.tgz


VOLUME ${ZEPPELIN_HOME}/notebook
VOLUME ${ZEPPELIN_HOME}/conf
VOLUME ${ZEPPELIN_HOME}/data

WORKDIR /opt/zeppelin

CMD ["/opt/zeppelin/bin/zeppelin.sh"]