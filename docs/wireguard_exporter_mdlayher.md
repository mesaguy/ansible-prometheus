# wireguard exporter (mdlayher) configuration

To enable [wireguard_exporter by mdlayher](https://github.com/mdlayher/wireguard_exporter) include role task: wireguard_exporter_mdlayher

An array of additional flags to pass to the wireguard_exporter daemon (ie):

    prometheus_wireguard_exporter_mdlayher_extra_opts: []

The version of wireguard_exporter_mdlayher to install. The default version can be found in the [wireguard_exporter_mdlayher variables file](../vars/software/wireguard_exporter_mdlayher.yml) and the default version can be overridden using the following variable:

    prometheus_wireguard_exporter_mdlayher_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_wireguard_exporter_mdlayher_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9586:

    prometheus_wireguard_exporter_mdlayher_host: "0.0.0.0"
    prometheus_wireguard_exporter_mdlayher_port: 9586
