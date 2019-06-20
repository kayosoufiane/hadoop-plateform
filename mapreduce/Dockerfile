FROM salimelakoui/hadoop-base:latest-salim

MAINTAINER Salim EL AKOUI <salim.elakoui@nway.org>

COPY target/logcounts.jar /opt/hadoop/applications/logcounts.jar

ENV JAR_FILEPATH="/opt/hadoop/applications/logcounts.jar"
ENV CLASS_TO_RUN="com.mapreduce.examples.LogCounts"
ENV PARAMS="/input /output"

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
