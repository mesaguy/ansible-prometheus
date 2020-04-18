# fping exporter (schweikert) configuration

To enable [fping_exporter by schweikert](https://github.com/schweikert/fping-exporter) include role task: fping_exporter_schweikert

An array of additional flags to pass to the fping_exporter daemon (ie):

    prometheus_fping_exporter_schweikert_extra_opts: []

The version of fping_exporter_schweikert to install. The default version can be found in the [fping_exporter_schweikert variables file](../vars/software/fping_exporter_schweikert.yml) and the default version can be overridden using the following variable:

    prometheus_fping_exporter_schweikert_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_fping_exporter_schweikert_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9605:

    prometheus_fping_exporter_schweikert_host: "0.0.0.0"
    prometheus_fping_exporter_schweikert_port: 9605
