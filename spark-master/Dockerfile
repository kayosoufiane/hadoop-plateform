FROM salimelakoui/hadoop-base:latest-salim

MAINTAINER Salim EL AKOUI <salim.elakoui@nway.org>

COPY run.sh /

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /apps/spark/logs

EXPOSE 8080 7077 6066

CMD ["/bin/bash", "/run.sh"]

