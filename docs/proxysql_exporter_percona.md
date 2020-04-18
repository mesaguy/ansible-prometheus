# ProxySQL exporter (percona) configuration

To enable [proxysql_exporter by percona](https://github.com/percona/proxysql_exporter) include role task: proxysql_exporter_percona

An array of additional flags to pass to the proxysql_exporter daemon:

    prometheus_proxysql_exporter_percona_extra_opts: []

The version of proxysql_exporter_percona to install. The default version can be found in the [proxysql_exporter_percona variables file](../vars/software/proxysql_exporter_percona.yml) and the default version can be overridden using the following variable:

    prometheus_proxysql_exporter_percona_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_proxysql_exporter_percona_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 42004:

    prometheus_proxysql_exporter_percona_host: "0.0.0.0"
    prometheus_proxysql_exporter_percona_port: 42004
