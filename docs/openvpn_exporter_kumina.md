# OpenVPN exporter (kumina) configuration

To enable [openvpn_exporter by kumina](https://github.com/kumina/openvpn_exporter) include role task: openvpn_exporter_kumina

An array of additional flags to pass to the openvpn_exporter daemon (ie):

    prometheus_openvpn_exporter_kumina_extra_opts: []

The version of openvpn_exporter_kumina to install. The default version can be found in the [openvpn_exporter_kumina variables file](../vars/software/openvpn_exporter_kumina.yml) and the default version can be overridden using the following variable:

    prometheus_openvpn_exporter_kumina_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_openvpn_exporter_kumina_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9176:

    prometheus_openvpn_exporter_kumina_host: "0.0.0.0"
    prometheus_openvpn_exporter_kumina_port: 9176
