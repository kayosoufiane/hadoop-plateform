FROM bde2020/hadoop-base:latest-salim

MAINTAINER Salim EL AKOUI <salim.elakoui@nway.org>

COPY run.sh /

ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_LOG /apps/spark/logs
ENV SPARK_MASTER "spark://spark-master:7077"

EXPOSE 8080 7077 6066

CMD ["/bin/bash", "/run.sh"]

