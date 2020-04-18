# BIND exporter (prometheus-community) configuration

To enable [bind_exporter by prometheus-community](https://github.com/prometheus-community/bind_exporter) include role task: bind_exporter_prometheus_community

An array of additional flags to pass to the bind_exporter daemon (ie):

    prometheus_bind_exporter_prometheus_community_extra_opts:
      - '-bind.stats-url string=http://localhost:8053/'

The version of bind_exporter_prometheus_community to install. The default version can be found in the [bind_exporter_prometheus_community variables file](../vars/software/bind_exporter_prometheus_community.yml) and the default version can be overridden using the following variable:

    prometheus_bind_exporter_prometheus_community_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_bind_exporter_prometheus_community_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 8053:

    prometheus_bind_exporter_prometheus_community_host: "0.0.0.0"
    prometheus_bind_exporter_prometheus_community_port: 8053
