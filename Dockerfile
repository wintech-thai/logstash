FROM logstash:8.15.1

USER root

RUN apt-get --assume-yes install rubygems ruby-dev
RUN gem install dalli

RUN logstash-plugin install logstash-output-opensearch

USER logstash

RUN echo $(date) > /tmp/date.txt
