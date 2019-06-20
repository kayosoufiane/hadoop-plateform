#!/bin/bash
# MAINTAINER Salim EL AKOUI <salim.elakoui@nway.org>

export SPARK_MASTER_HOST=`hostname`

. "/apps/spark/sbin/spark-config.sh"

. "/apps/bin/load-spark-env.sh"

mkdir -p $SPARK_MASTER_LOG

export SPARK_HOME=/apps/spark

ln -sf /dev/stdout $SPARK_MASTER_LOG/spark-master.out

cd /apps/spark/bin && /apps/spark/sbin/../bin/spark-class org.apache.spark.deploy.master.Master \
    --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG/spark-master.out