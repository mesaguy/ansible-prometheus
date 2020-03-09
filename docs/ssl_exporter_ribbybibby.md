# SSL exporter (ribbybibby) configuration

To enable [ssl_exporter by ribbybibby](https://github.com/ribbybibby/ssl_exporter) include role task: ssl_exporter_ribbybibby

An array of additional flags to pass to the ssl_exporter daemon:

    prometheus_ssl_exporter_ribbybibby_extra_opts: []

The version of ssl_exporter to install:

    prometheus_ssl_exporter_ribbybibby_version: "0.6.0"
    prometheus_ssl_exporter_ribbybibby_src_version: "0.6.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9219:

    prometheus_ssl_exporter_ribbybibby_host: "0.0.0.0"
    prometheus_ssl_exporter_ribbybibby_port: 9219
