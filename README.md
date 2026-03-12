This is a project that shows an infrastructure built with Docker where it runs:
- a data collection and logs stack
- metrics exposure services
- an EspoCRM instance and its DB

There is a backup script that backs up the database of CRM and docker compose file in a TrueNas instance in the same network.
The script use rsync to estabilish connection between Truenas and mantain only the last three backups.
Even if you wanted, you could modify the script to backs up the configuration files of the various services.

The containerized infrastructure contains:
- A CRM that users use to work
- A Mariadb database
- Node-Exporter to expose system data to Prometheus
- CAdvisor to expose container data to Prometheus
- Prometheus for collecting metrics from Node-exporter and CAdvidor 
- Promtail for collecting logs from systema directories (in this case it collects docker-related logs, but can also collect many other logs)
- Loki for indexing logs collected by Promtail and makes them queryable
- Grafana that interprets logs provided by loki and creates system dashboards using Prometheus and Node-Exporter


