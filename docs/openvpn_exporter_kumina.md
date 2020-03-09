# OpenVPN exporter (kumina) configuration

To enable [openvpn_exporter by kumina](https://github.com/kumina/openvpn_exporter) include role task: openvpn_exporter_kumina

An array of additional flags to pass to the openvpn_exporter daemon (ie):

    prometheus_openvpn_exporter_kumina_extra_opts: []

The version of openvpn_exporter to install. The source version defines the version as specified in version control:

    prometheus_openvpn_exporter_kumina_version: "0.2.1"
    prometheus_openvpn_exporter_kumina_src_version: "v0.2.1"

Port and IP to listen on. Defaults to listening on all available IPs on port 9176:

    prometheus_openvpn_exporter_kumina_host: "0.0.0.0"
    prometheus_openvpn_exporter_kumina_port: 9176
