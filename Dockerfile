FROM docker.elastic.co/logstash/logstash:8.5.0

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && \
    apt-get -y install krb5-user libpam-krb5 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint /usr/local/bin/docker-entrypoint
COPY kinit-daemon /usr/local/bin/kinit-daemon
RUN chmod +x /usr/local/bin/docker-entrypoint /usr/local/bin/kinit-daemon

USER 1000

COPY postgresql-42.3.5.jar /usr/share/logstash/logstash-core/lib/jars

COPY lib/gssapi /usr/share/logstash/vendor/bundle/jruby/2.6.0/gems/webhdfs-0.10.2/lib/gssapi
COPY lib/gssapi.rb /usr/share/logstash/vendor/bundle/jruby/2.6.0/gems/webhdfs-0.10.2/lib

COPY lib/webhdfs/client_v1.rb /usr/share/logstash/vendor/bundle/jruby/2.6.0/gems/webhdfs-0.10.2/lib/webhdfs/client_v1.rb
