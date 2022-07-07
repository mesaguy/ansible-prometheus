# Clickhouse exporter (ClickHouse) configuration

To enable [clickhouse_exporter by ClickHouse](https://github.com/ClickHouse/clickhouse_exporter) include role task: clickhouse_exporter_clickhouse

An array of additional flags to pass to the clickhouse_exporter daemon:

    prometheus_clickhouse_exporter_clickhouse_extra_opts: []

The version of clickhouse_exporter_clickhouse to install. The default version can be found in the [clickhouse_exporter_clickhouse variables file](../vars/software/clickhouse_exporter_clickhouse.yml) and the default version can be overridden using the following variable:

    prometheus_clickhouse_exporter_clickhouse_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_clickhouse_exporter_clickhouse_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9145:

    prometheus_clickhouse_exporter_clickhouse_host: "0.0.0.0"
    prometheus_clickhouse_exporter_clickhouse_port: 9363
