docker run --rm -it \
  -v ./pipeline/:/usr/share/logstash/pipeline/ \
  -v ./input.log:/usr/share/logstash/data/input.log \
  -v ./logstash.yml:/usr/share/logstash/config/logstash.yml \
  docker.elastic.co/logstash/logstash:9.0.0