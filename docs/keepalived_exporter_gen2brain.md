# Keepalived exporter (gen2brain) configuration

To enable [keepalived_exporter by gen2brain](https://github.com/gen2brain/keepalived_exporter) include role task: keepalived_exporter_gen2brain

An array of additional flags to pass to the keepalived_exporter daemon (ie):

    prometheus_keepalived_exporter_gen2brain_extra_opts: []

The version of keepalived_exporter_gen2brain to install. The default version can be found in the [keepalived_exporter_gen2brain variables file](../vars/software/keepalived_exporter_gen2brain.yml) and the default version can be overridden using the following variable:

    prometheus_keepalived_exporter_gen2brain_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_keepalived_exporter_gen2brain_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9650:

    prometheus_keepalived_exporter_gen2brain_host: "0.0.0.0"
    prometheus_keepalived_exporter_gen2brain_port: 9650
