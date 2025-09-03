FROM logstash:8.15.1

USER root

RUN apt-get update
RUN apt-get --assume-yes install rubygems ruby-dev
RUN gem install dalli redis pg

RUN logstash-plugin install logstash-output-opensearch logstash-input-google_pubsub logstash-output-loki

USER logstash

RUN echo $(date) > /tmp/date.txt
