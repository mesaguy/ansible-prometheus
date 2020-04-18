# Squid exporter (boynux) configuration

To enable [squid_exporter by boynux](https://github.com/boynux/squid-exporter) include role task: squid_exporter_boynux

An array of additional flags to pass to the squid_exporter daemon:

    prometheus_squid_exporter_boynux_extra_opts:
      - '-squid-hostname="localhost"'
      - '-squid-port=3128'

The version of squid_exporter_boynux to install. The default version can be found in the [squid_exporter_boynux variables file](../vars/software/squid_exporter_boynux.yml) and the default version can be overridden using the following variable:

    prometheus_squid_exporter_boynux_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_squid_exporter_boynux_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9301:

    prometheus_squid_exporter_boynux_host: "0.0.0.0"
    prometheus_squid_exporter_boynux_port: 9301
