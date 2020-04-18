# IPTables exporter (retailnext) configuration

To enable [iptables_exporter by retailnext](https://github.com/retailnext/iptables_exporter) include role task: iptables_exporter_retailnext

This exporter must be run as the user 'root' unless you are using systemd:

    prometheus_software_runas: root

An array of additional flags to pass to the iptables_exporter daemon (ie):

    prometheus_iptables_exporter_retailnext_extra_opts: []

The version of iptables_exporter_retailnext to install. The default version can be found in the [iptables_exporter_retailnext variables file](../vars/software/iptables_exporter_retailnext.yml) and the default version can be overridden using the following variable:

    prometheus_iptables_exporter_retailnext_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_iptables_exporter_retailnext_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9455:

    prometheus_iptables_exporter_retailnext_host: "0.0.0.0"
    prometheus_iptables_exporter_retailnext_port: 9455
