# IPTables exporter (retailnext) configuration

To enable [iptables_exporter by retailnext](https://github.com/retailnext/iptables_exporter) include role task: iptables_exporter_retailnext

This exporter must be run as the user 'root' unless you are using systemd:

    prometheus_software_runas: root

An array of additional flags to pass to the iptables_exporter daemon (ie):

    prometheus_iptables_exporter_retailnext_extra_opts: []

The version of iptables_exporter to install. The source version defines the version as specified in version control:

    prometheus_iptables_exporter_retailnext_version: "0.1.0"
    prometheus_iptables_exporter_retailnext_src_version: "v0.1.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9455:

    prometheus_iptables_exporter_retailnext_host: "0.0.0.0"
    prometheus_iptables_exporter_retailnext_port: 9455
