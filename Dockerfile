FROM logstash:8.15.1

USER root

RUN apt-get update
RUN apt-get --assume-yes install rubygems ruby-dev
RUN gem install dalli redis

RUN logstash-plugin install logstash-output-opensearch logstash-input-google_pubsub logstash-output-loki logstash-output-jdbc

ADD https://jdbc.postgresql.org/download/postgresql-42.6.0.jar /usr/share/logstash/logstash-core/lib/jars/postgresql-42.6.0.jar

RUN ls -lrt /usr/share/logstash/logstash-core/lib/jars/postgresql-42.6.0.jar

USER logstash

RUN echo $(date) > /tmp/date.txt
