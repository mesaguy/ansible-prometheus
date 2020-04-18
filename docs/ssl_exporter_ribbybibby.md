# SSL exporter (ribbybibby) configuration

To enable [ssl_exporter by ribbybibby](https://github.com/ribbybibby/ssl_exporter) include role task: ssl_exporter_ribbybibby

An array of additional flags to pass to the ssl_exporter daemon:

    prometheus_ssl_exporter_ribbybibby_extra_opts: []

The version of ssl_exporter_ribbybibby to install. The default version can be found in the [ssl_exporter_ribbybibby variables file](../vars/software/ssl_exporter_ribbybibby.yml) and the default version can be overridden using the following variable:

    prometheus_ssl_exporter_ribbybibby_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_ssl_exporter_ribbybibby_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9219:

    prometheus_ssl_exporter_ribbybibby_host: "0.0.0.0"
    prometheus_ssl_exporter_ribbybibby_port: 9219
