docker run --rm -it \
  -v ./pipeline/:/usr/share/logstash/pipeline/ \
  -v ./input.log:/usr/share/logstash/data/input.log \
  docker.elastic.co/logstash/logstash:9.0.0