# Elasticsearch & Kibana Monitoring Setup (Single Directory)

This directory provides a ready-to-use Docker Compose setup for running two separate Elasticsearch clusters (business and monitoring), two Kibana instances, and Metricbeat for monitoring—all self-contained within this folder.

## Services

- **es-business**: Main Elasticsearch node for business data
- **kibana-business**: Kibana instance for the business cluster (accessible at http://localhost:5602)
- **es-monitor**: Elasticsearch node for monitoring data
- **kibana-monitor**: Kibana instance for the monitoring cluster (accessible at http://localhost:5601)
- **metricbeat**: Collects metrics from both clusters and both Kibana instances, and ships them to the monitoring cluster

## Usage

### Prerequisites
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/)

### Quick Start
1. Change to this directory:
   ```bash
   cd /path/to/monitoring_setup
   ```
2. Start all services:
   ```bash
   docker-compose up -d
   ```
3. Access Kibana:
   - Business cluster: [http://localhost:5602](http://localhost:5602)
   - Monitoring cluster: [http://localhost:5601](http://localhost:5601)
   - Monitoring UI: [http://localhost:5601/app/monitoring](http://localhost:5601/app/monitoring)
  
   <img width="1052" alt="image" src="https://github.com/user-attachments/assets/2d9fd077-4247-47e9-96e1-4b4e2fcb41e9" />


### Configuration Files
- `docker-compose.yml`: Defines all services and their relationships (specific to this directory)
- `kibana.yml`: Shared configuration for Kibana (ensure `server.host: "0.0.0.0"` is set)
- `metricbeat.yml`: Metricbeat configuration to collect and ship monitoring data

### Stopping Services
```bash
docker-compose down
```

## Notes
- All images are official Elastic Docker images; no custom images are built or pushed.
- Metricbeat is configured to monitor both clusters and both Kibana instances, and sends data to the monitoring cluster.
- You can customize `kibana.yml` and `metricbeat.yml` as needed for your environment.
- This setup is self-contained and does not affect other compose files or services in the repository.

## Troubleshooting
- If Kibana is not accessible, ensure `server.host: "0.0.0.0"` is set in `kibana.yml` or via the `SERVER_HOST` environment variable.
- Check logs with:
  ```bash
  docker-compose logs kibana-monitor
  docker-compose logs kibana-business
  ```

---

For more information, see the [Elastic Docker documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html).
