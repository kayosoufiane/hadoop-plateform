FROM debian:9

MAINTAINER Salim EL AKOUI <salim.elakoui@nway.org>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      openjdk-8-jdk \
      net-tools \
      curl \
      netcat \
      gnupg \
      wget \
      build-essential ;
      
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

RUN curl -O https://dist.apache.org/repos/dist/release/hadoop/common/KEYS

RUN gpg --import KEYS

RUN mkdir /apps

# ###################################################################################################################
# Installing Hadoop
# ###################################################################################################################

ENV HADOOP_VERSION 3.1.1
ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    && gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop

RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

RUN mkdir /hadoop-data

RUN ln -s $HADOOP_HOME /apps/hadoop

ENV HADOOP_PREFIX=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_HOME=$HADOOP_PREFIX
ENV HADOOP_INSTALL=$HADOOP_PREFIX
ENV HADOOP_MAPRED_HOME=$HADOOP_INSTALL
ENV HADOOP_COMMON_HOME=$HADOOP_INSTALL
ENV HADOOP_HDFS_HOME=$HADOOP_INSTALL
ENV YARN_HOME=$HADOOP_INSTALL
ENV HADOOP_OPTS=-Djava.net.preferIPv4Stack=true
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_PREFIX/bin/:$PATH
ENV CLASSPATH=$CLASSPATH:$HADOOP_PREFIX/lib/*:.

# ###################################################################################################################
# Installing Spark
# ###################################################################################################################

ENV SPARK_VERSION 2.1.0
ENV SPARK_URL http://d3kbcqa49mib13.cloudfront.net/spark-$SPARK_VERSION-bin-hadoop2.7.tgz

RUN wget $SPARK_URL && \
    tar -xzvf spark-$SPARK_VERSION-bin-hadoop2.7.tgz && \
    mv spark-$SPARK_VERSION-bin-hadoop2.7 /opt/spark-$SPARK_VERSION && \
    rm spark-$SPARK_VERSION-bin-hadoop2.7.tgz


ENV SPARK_HOME=/opt/spark-$SPARK_VERSION
ENV PATH=$PATH:$SPARK_HOME/bin
ENV LD_LIBRARY_PATH=$HADOOP_HOME/lib/native:$LD_LIBRARY_PATH

RUN ln -s $SPARK_HOME/conf /etc/spark
RUN ln -s $SPARK_HOME /apps/spark

COPY config/spark-env.sh /etc/spark/spark-env.sh
COPY config/spark-defaults.conf /etc/spark/spark-defaults.conf

# ###################################################################################################################
# Installing Hive
# ###################################################################################################################
ENV HIVE_VERSION 3.1.1
ENV HIVE_URL https://apache.mirrors.benatherton.com/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz

RUN wget $HIVE_URL  && \
    tar -xzvf apache-hive-$HIVE_VERSION-bin.tar.gz && \
    mv apache-hive-$HIVE_VERSION-bin /opt/hive-$HIVE_VERSION && \
    rm apache-hive-$HIVE_VERSION-bin.tar.gz

ENV HIVE_HOME=/opt/hive-$HIVE_VERSION
ENV HIVE_CONF_DIR=$HIVE_HOME/conf
ENV CLASSPATH=$CLASSPATH:$HIVE_HOME/lib/*:.
ENV PATH=$PATH:$HIVE_HOME/bin

RUN ln -s $HIVE_HOME/conf /etc/hive
RUN ln -s $HIVE_HOME /apps/hive

ADD entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
