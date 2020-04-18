# iperf3 exporter (edgard) configuration

To enable [iperf3_exporter by edgard](https://github.com/edgard/iperf3_exporter) include role task: iperf3_exporter_edgard

An array of additional flags to pass to the iperf3_exporter daemon (ie):

    prometheus_iperf3_exporter_edgard_extra_opts: []

The version of iperf3_exporter_edgard to install. The default version can be found in the [iperf3_exporter_edgard variables file](../vars/software/iperf3_exporter_edgard.yml) and the default version can be overridden using the following variable:

    prometheus_iperf3_exporter_edgard_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_iperf3_exporter_edgard_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9579:

    prometheus_iperf3_exporter_edgard_host: "0.0.0.0"
    prometheus_iperf3_exporter_edgard_port: 9579
