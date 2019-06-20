FROM salimelakoui/hadoop-base:latest-salim

MAINTAINER Salim EL AKOUI <salim.elakoui@nway.org>

HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8042

CMD ["/run.sh"]
