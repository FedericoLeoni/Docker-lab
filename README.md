This project shows an infrastructure built with Docker where it runs:
* a data collector and logs stack
* metrics exposure services
* an EspoCRM instance and MariaDB

There is a backup script that backs up in a TrueNas instance in the same network.
The script use rsync to estabilish connection between Truenas and mantain only the last three backups.

The containerized infrastructure contains:
- EspoCRM: main CRM application
- Mariadb: database used by the CRM
- Node-Exporter: exposes system data
- CAdvisor: exposes container data
- Prometheus: collects data from Node-exporter and CAdvidor 
- Promtail: collects logs from system
- Loki: indexes logs collected by Promtail
- Grafana: visualizes system dashboards using Prometheus and Node-Exporter
