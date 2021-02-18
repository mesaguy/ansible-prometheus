# Postgres exporter (prometheus-community) configuration

To enable [postgres_exporter by prometheus-community](https://github.com/prometheus-community/postgres_exporter) include role task: postgres_exporter_prometheus_community

The [postgres_exporter](https://github.com/prometheus-community/postgres_exporter) requires configuration before use! You must grant permissions for this exporter to read select data from PostgreSQL.

Environmental variables to pass to the postgres_exporter_prometheus_community exporter. These environmental variables are used as a primary method of configuring the exporter:

    prometheus_postgres_exporter_prometheus_community_env_vars:
      DATA_SOURCE_NAME: 'postgresql://postgres_exporter:password@localhost:5432/postgres?sslmode=disable'

To avoid putting credentials in environmental variables, one can use the URI method of connection. After creating a file containing the connection password, configure as follows:

    prometheus_postgres_exporter_prometheus_community_env_vars:
      DATA_SOURCE_PASS_FILE: /opt/prometheus/etc/postgres_exporter.password
      DATA_SOURCE_URI: "127.0.0.1:5432/postgres?sslmode=disable"
      DATA_SOURCE_USER: postgres_exporter

An array of additional flags to pass to the postgres_exporter daemon:

    prometheus_postgres_exporter_prometheus_community_extra_opts: []

The version of postgres_exporter_prometheus_community to install. The default version can be found in the [postgres_exporter_prometheus_community variables file](../vars/software/postgres_exporter_prometheus_community.yml) and the default version can be overridden using the following variable:

    prometheus_postgres_exporter_prometheus_community_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_postgres_exporter_prometheus_community_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9187:

    prometheus_postgres_exporter_prometheus_community_host: "0.0.0.0"
    prometheus_postgres_exporter_prometheus_community_port: 9187
