# Clickhouse exporter (Percona-Lab) configuration

To enable [clickhouse_exporter by Percona-Lab](https://github.com/Percona-Lab/clickhouse_exporter) include role task: clickhouse_exporter_perconalab

An array of additional flags to pass to the clickhouse_exporter daemon:

    prometheus_clickhouse_exporter_perconalab_extra_opts: []

The version of clickhouse_exporter_perconalab to install. The default version can be found in the [clickhouse_exporter_perconalab variables file](../vars/software/clickhouse_exporter_perconalab.yml) and the default version can be overridden using the following variable:

    prometheus_clickhouse_exporter_perconalab_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_clickhouse_exporter_perconalab_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9145:

    prometheus_clickhouse_exporter_perconalab_host: "0.0.0.0"
    prometheus_clickhouse_exporter_perconalab_port: 9363
