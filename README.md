# Grafana Issues Samples

Repository with use case examples to share Issues on Grafana project.

Grafana Project: <https://github.com/grafana/grafana>

## Start Environment

Execute docker-compose script:

```bash
# Shell commnad
sudo ./up.sh

# Or raw commands
docker-compose -p grafana-issues up -d
docker-compose -p grafana-issues exec pg psql -U postgres -c "create database sample"
docker-compose -p grafana-issues exec pg psql -U postgres -d sample -a -f /scripts/postgres.sql
docker-compose -p grafana-issues exec sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'grafana.123' -i /scripts/Install-All-Scripts.sql
docker-compose -p grafana-issues exec sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'grafana.123' -i /scripts/sqlserver.sql
```

After stack up, import dashboard into Grafana from file: ./Grafana-Issues-Samples/grafana-settings/dash.cities.json

## Monitoring SQL Server quiries

This commando retrive sql server plan caches. Ideal is just one cache to your query.

```sql
exec sp_BlitzCache @QueryFilter = 'statement', @Top = 50;
```
