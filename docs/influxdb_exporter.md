# InfluxDB exporter configuration

An array of additional flags to pass to the influxdb_exporter daemon:

    prometheus_influxdb_exporter_extra_opts: []

The version of influxdb_exporter to install. The source version defines the version as specified in version control:

    prometheus_influxdb_exporter_version: "0.4.0"
    prometheus_influxdb_exporter_src_version: "v0.4.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9122:

    prometheus_influxdb_exporter_host: "0.0.0.0"
    prometheus_influxdb_exporter_port: 9122
