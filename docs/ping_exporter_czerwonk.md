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

The version of ping_exporter_czerwonk to install. The default version can be found in the [ping_exporter_czerwonk variables file](../vars/software/ping_exporter_czerwonk.yml) and the default version can be overridden using the following variable:

    prometheus_ping_exporter_czerwonk_version: "1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_ping_exporter_czerwonk_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9427:

    prometheus_ping_exporter_czerwonk_host: "0.0.0.0"
    prometheus_ping_exporter_czerwonk_port: 9427
