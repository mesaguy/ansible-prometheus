# ProxySQL exporter (percona) configuration

To enable [proxysql_exporter by percona](https://github.com/percona/proxysql_exporter) include role task: proxysql_exporter_percona

An array of additional flags to pass to the proxysql_exporter daemon:

    prometheus_proxysql_exporter_percona_extra_opts: []

The version of proxysql_exporter to install. The source version defines the version as specified in version control:

    prometheus_proxysql_exporter_percona_version: "1.1.0"
    prometheus_proxysql_exporter_percona_src_version: "v1.1.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 42004:

    prometheus_proxysql_exporter_percona_host: "0.0.0.0"
    prometheus_proxysql_exporter_percona_port: 42004
