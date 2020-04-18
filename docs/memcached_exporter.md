# Memcached exporter configuration

To enable [memcached_exporter](https://github.com/prometheus/memcached_exporter) include role task: memcached_exporter

An array of additional flags to pass to the memcached_exporter daemon:

    prometheus_memcached_exporter_extra_opts: []

The version of memcached_exporter to install. The default version can be found in the [memcached_exporter variables file](../vars/software/memcached_exporter.yml) and the default version can be overridden using the following variable:

    prometheus_memcached_exporter_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_memcached_exporter_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9150:

    prometheus_memcached_exporter_host: "0.0.0.0"
    prometheus_memcached_exporter_port: 9150
