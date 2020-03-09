# Keepalived exporter (gen2brain) configuration

To enable [keepalived_exporter by gen2brain](https://github.com/gen2brain/keepalived_exporter) include role task: keepalived_exporter_gen2brain

An array of additional flags to pass to the keepalived_exporter daemon (ie):

    prometheus_keepalived_exporter_gen2brain_extra_opts: []

The version of keepalived_exporter to install. The source version defines the version as specified in version control:

    prometheus_keepalived_exporter_gen2brain_version: "0.3.0"
    prometheus_keepalived_exporter_gen2brain_src_version: "0.3.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9650:

    prometheus_keepalived_exporter_gen2brain_host: "0.0.0.0"
    prometheus_keepalived_exporter_gen2brain_port: 9650
