# ipmi exporter (prometheus-community) configuration

To enable [ipmi_exporter by prometheus-community](https://github.com/prometheus-community/ipmi_exporter) include role task: ipmi_exporter_prometheus_community

If no configuration content is defined, a default (empty) configuration file is utilized:

    prometheus_ipmi_exporter_prometheus_community_cfg: '{{ lookup("file", "../files/ipmi_exporter_prometheus_community.yml") | from_yaml }}'

An array of additional flags to pass to the ipmi_exporter daemon (ie):

    prometheus_ipmi_exporter_prometheus_community_extra_opts:
      - '-config.file={{ prometheus_etc_dir }}/ipmi_exporter_prometheus_community.yml'

The version of ipmi_exporter_prometheus_community to install. The default version can be found in the [ipmi_exporter_prometheus_community variables file](../vars/software/ipmi_exporter_prometheus_community.yml) and the default version can be overridden using the following variable:

    prometheus_ipmi_exporter_prometheus_community_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_ipmi_exporter_prometheus_community_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9290:

    prometheus_ipmi_exporter_prometheus_community_host: "0.0.0.0"
    prometheus_ipmi_exporter_prometheus_community_port: 9290
