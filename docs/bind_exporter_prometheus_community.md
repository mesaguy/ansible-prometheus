# BIND exporter (prometheus-community) configuration

To enable [bind_exporter by prometheus-community](https://github.com/prometheus-community/bind_exporter) include role task: bind_exporter_prometheus_community

An array of additional flags to pass to the bind_exporter daemon (ie):

    prometheus_bind_exporter_prometheus_community_extra_opts:
      - '-bind.stats-url string=http://localhost:8053/'

The version of bind_exporter to install. The source version defines the version as specified in version control:

    prometheus_bind_exporter_prometheus_community_version: "0.3.0"
    prometheus_bind_exporter_prometheus_community_src_version: "v0.3.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 8053:

    prometheus_bind_exporter_prometheus_community_host: "0.0.0.0"
    prometheus_bind_exporter_prometheus_community_port: 8053
