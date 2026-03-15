**This project shows an infrastructure built with Docker where it runs:**
* a data collector and logs stack
* metrics exposure services
* an EspoCRM instance and MariaDB

There is a backup script that backs up in a TrueNas instance in the same network.
The script use rsync to estabilish connection between Truenas and mantain only the last three backups.

**The containerized infrastructure contains:**

- EspoCRM
- Mariadb
- Node-Exporter
- CAdvisor
- Prometheus 
- Promtail
- Loki
- Grafana

**I should to read the wiki of the project to know more details about this lab!**
