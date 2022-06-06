FROM docker.io/bitnami/logstash:8.2.2

COPY postgresql-42.3.5.jar /opt/bitnami/logstash/logstash-core/lib/jars/.

ENTRYPOINT [ "/opt/bitnami/scripts/logstash/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/logstash/run.sh" ]