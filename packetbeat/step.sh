today=$(date +"%Y.%m.%d")
docker exec -t packetbeat1 hostname -I
docker exec -t packetbeat1  curl --interface eth1 http://elasticsearch:9200/.ds-packetbeat-8.15.1-$today-000001/_search?size=100 -H "Content-Type: application/json"    -d '{"sort":[{"@timestamp":{"order":"desc"}}]}' > response.json
docker exec -t packetbeat1  curl --interface eth0 http://elasticsearch:9200/.ds-packetbeat-8.15.1-$today-000001/_search?size=100 -H "Content-Type: application/json"    -d '{"sort":[{"@timestamp":{"order":"desc"}}]}' > response.json

cat response.json | jq .hits.hits  | gron | grep "client.ip"