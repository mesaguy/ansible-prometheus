# Memcached exporter configuration

To enable [memcached_exporter](https://github.com/prometheus/memcached_exporter) include role task: memcached_exporter

An array of additional flags to pass to the memcached_exporter daemon:

    prometheus_memcached_exporter_extra_opts: []

The version of memcached_exporter to install. The source version defines the version as specified in version control:

    prometheus_memcached_exporter_version: "0.6.0"
    prometheus_memcached_exporter_src_version: "v0.6.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9150:

    prometheus_memcached_exporter_host: "0.0.0.0"
    prometheus_memcached_exporter_port: 9150
