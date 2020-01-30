docker-compose -p grafana-issues up -d

# PotgreSQL setup
docker-compose -p grafana-issues exec pg psql -U postgres -c "create database sample"
docker-compose -p grafana-issues exec pg psql -U postgres -d sample -a -f /scripts/postgres.sql

# SQL Server setup
docker-compose -p grafana-issues exec sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'grafana.123' -i /scripts/Install-All-Scripts.sql
docker-compose -p grafana-issues exec sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'grafana.123' -i /scripts/sqlserver.sql