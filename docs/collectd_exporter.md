# Collectd exporter configuration

To enable [collectd_exporter](https://github.com/prometheus/collectd_exporter) include role task: collectd_exporter

An array of additional flags to pass to the collectd_exporter daemon:

    prometheus_collectd_exporter_extra_opts: []

The version of collectd_exporter to install. The source version defines the version as specified in version control:

    prometheus_collectd_exporter_version: "0.5.0"
    prometheus_collectd_exporter_src_version: "v0.5.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9103:

    prometheus_collectd_exporter_host: "0.0.0.0"
    prometheus_collectd_exporter_port: 9103
