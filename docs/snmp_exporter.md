# SNMP exporter configuration

To enable [snmp_exporter](https://github.com/prometheus/snmp_exporter) include role task: snmp_exporter

The configuration content. The example below utilizes a file named 'snmp_exporter.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_snmp_exporter_yml: ../files/snmp_exporter.yml

An array of additional flags to pass to the snmp_exporter daemon:

    prometheus_snmp_exporter_extra_opts: []

The version of snmp_exporter to install. The default version can be found in the [snmp_exporter variables file](../vars/software/snmp_exporter.yml) and the default version can be overridden using the following variable:

    prometheus_snmp_exporter_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_snmp_exporter_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9116:

    prometheus_snmp_exporter_host: "0.0.0.0"
    prometheus_snmp_exporter_port: 9116
