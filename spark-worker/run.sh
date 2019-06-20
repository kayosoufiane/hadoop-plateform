#!/bin/bash
# MAINTAINER Salim EL AKOUI <salim.elakoui@nway.org>

. "/apps/spark/sbin/spark-config.sh"

. "/apps/spark/bin/load-spark-env.sh"

mkdir -p $SPARK_WORKER_LOG

export SPARK_HOME=/apps/spark

ln -sf /dev/stdout $SPARK_WORKER_LOG/spark-worker.out

/apps/spark/sbin/../bin/spark-class org.apache.spark.deploy.worker.Worker \
    --webui-port $SPARK_WORKER_WEBUI_PORT $SPARK_MASTER >> $SPARK_WORKER_LOG/spark-worker.out
