# ipmi exporter (soundcloud) configuration

To enable [ipmi_exporter by soundcloud](https://github.com/soundcloud/ipmi_exporter) include role task: ipmi_exporter_soundcloud

If no configuration content is defined, a default (empty) configuration file is utilized:

    prometheus_ipmi_exporter_soundcloud_cfg: '{{ lookup("file", "../files/ipmi_exporter_soundcloud.yml") | from_yaml }}'

An array of additional flags to pass to the ipmi_exporter daemon (ie):

    prometheus_ipmi_exporter_soundcloud_extra_opts:
      - '-config.file={{ prometheus_etc_dir }}/ipmi_exporter_soundcloud.yml'

The version of ipmi_exporter_soundcloud to install. The default version can be found in the [ipmi_exporter_soundcloud variables file](../vars/software/ipmi_exporter_soundcloud.yml) and the default version can be overridden using the following variable:

    prometheus_ipmi_exporter_soundcloud_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_ipmi_exporter_soundcloud_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9290:

    prometheus_ipmi_exporter_soundcloud_host: "0.0.0.0"
    prometheus_ipmi_exporter_soundcloud_port: 9290
