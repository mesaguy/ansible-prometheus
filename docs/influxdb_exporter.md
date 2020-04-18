# InfluxDB exporter configuration

An array of additional flags to pass to the influxdb_exporter daemon:

    prometheus_influxdb_exporter_extra_opts: []

The version of influxdb_exporter to install. The default version can be found in the [influxdb_exporter variables file](../vars/software/influxdb_exporter.yml) and the default version can be overridden using the following variable:

    prometheus_influxdb_exporter_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_influxdb_exporter_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9122:

    prometheus_influxdb_exporter_host: "0.0.0.0"
    prometheus_influxdb_exporter_port: 9122
