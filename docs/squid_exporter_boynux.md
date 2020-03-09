# Squid exporter (boynux) configuration

To enable [squid_exporter by boynux](https://github.com/boynux/squid-exporter) include role task: squid_exporter_boynux

An array of additional flags to pass to the squid_exporter daemon:

    prometheus_squid_exporter_boynux_extra_opts:
      - '-squid-hostname="localhost"'
      - '-squid-port=3128'

The version of squid_exporter to install:

    prometheus_squid_exporter_boynux_version: "1.8.2"

Port and IP to listen on. Defaults to listening on all available IPs on port 9301:

    prometheus_squid_exporter_boynux_host: "0.0.0.0"
    prometheus_squid_exporter_boynux_port: 9301
