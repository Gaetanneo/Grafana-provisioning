The customized grafana server can be built by running the command: 
docker run --name grafana -p 3000:3000 -v ./provisioning/dashboards:/etc/grafana/provisioning/dashboards -v ./provisioning/datasources:/etc/grafana/provisioning/datasources -v ./dashboards:/var/lib/grafana/dashboards -v ./provisioning/alerting:/etc/grafana/provisioning/alerting grafana/grafana:latest
