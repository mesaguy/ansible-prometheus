# Consul exporter configuration

To enable [consul_exporter](https://github.com/prometheus/consul_exporter) include role task: consul_exporter

Environmental variables to pass to the consul_exporter exporter. These environmental variables are used as a primary method of configuring the exporter:

    prometheus_consul_exporter_env_vars:
      CONSUL_HTTP_TOKEN: '4391eca7bcd03f45aa43ca26829c386c329097a7'
      CONSUL_HTTP_SSL_VERIFY: true

An array of additional flags to pass to the consul_exporter daemon:

    prometheus_consul_exporter_extra_opts: []

The version of consul_exporter to install. The source version defines the version as specified in version control:

    prometheus_consul_exporter_version: "0.6.0"
    prometheus_consul_exporter_src_version: "v0.6.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9107:

    prometheus_consul_exporter_host: "0.0.0.0"
    prometheus_consul_exporter_port: 9107
