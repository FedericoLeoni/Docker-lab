**This project shows an infrastructure built with Docker where it runs:**
* a data collector and logs stack
* metrics exposure services
* an EspoCRM instance and MariaDB

There is a backup script that backs up in a TrueNas instance in the same network.
The script use rsync to estabilish a connection between Truenas and keeps only the last three backups.

**The containerized infrastructure contains:**

- EspoCRM
- Mariadb
- Node-Exporter
- CAdvisor
- Prometheus 
- Promtail
- Loki
- Grafana

**I should to read the wiki of the project for more details!**

**Set-up the lab:**

``` bash
git clone https://github.com/FedericoLeoni/docker-lab
cd docker-lab
mkdir -p data/{grafana,prometheus,loki}
chown -R 65534:65534 ~/docker-lab/data/prometheus
chown -R 10001:10001 ~/docker-lab/data/loki
chown -R 472:472 ~/docker-lab/data/grafana
cd docker
# important: if needed, edit crm-app and crm-db environment variables in docker-compose.yml file
docker network create frontend && docker network create backend && docker network create monitoring
docker compose up -d

```
