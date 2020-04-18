# Collectd exporter configuration

To enable [collectd_exporter](https://github.com/prometheus/collectd_exporter) include role task: collectd_exporter

An array of additional flags to pass to the collectd_exporter daemon:

    prometheus_collectd_exporter_extra_opts: []

The version of collectd_exporter to install. The default version can be found in the [collectd_exporter variables file](../vars/software/collectd_exporter.yml) and the default version can be overridden using the following variable:

    prometheus_collectd_exporter_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_collectd_exporter_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9103:

    prometheus_collectd_exporter_host: "0.0.0.0"
    prometheus_collectd_exporter_port: 9103
