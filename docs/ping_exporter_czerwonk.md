# Ping exporter (czerwonk) configuration

To enable [ping_exporter by czerwonk](https://github.com/czerwonk/ping_exporter) include role task: ping_exporter_czerwonk

The ping_exporter can be configured by defining the prometheus_ping_exporter_czerwonk_cfg variable:

    prometheus_ping_exporter_czerwonk_cfg:
      - 8.8.8.8
      - 8.8.4.4
      - 2001:4860:4860::8888
      - 2001:4860:4860::8844

An array of additional flags to pass to the ping_exporter daemon (ie):

    prometheus_ping_exporter_czerwonk_extra_opts: []

The version of ping_exporter to install. The source version defines the version as specified in version control:

    prometheus_ping_exporter_czerwonk_version: "0.4.4"
    prometheus_ping_exporter_czerwonk_src_version: "0.44"

Port and IP to listen on. Defaults to listening on all available IPs on port 9427:

    prometheus_ping_exporter_czerwonk_host: "0.0.0.0"
    prometheus_ping_exporter_czerwonk_port: 9427
