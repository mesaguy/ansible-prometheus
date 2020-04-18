# Smokeping exporter (SuperQ) configuration

To enable [smokeping_exporter by SuperQ](https://github.com/SuperQ/smokeping_prober) include role task: smokeping_exporter_superq

An array of additional flags to pass to the smokeping_exporter daemon. You must specify a list of IPs and DNS names to ping:

    prometheus_smokeping_exporter_superq_extra_opts:
    - 'localhost'
    - '8.8.4.4'

The version of smokeping_exporter_superq to install. The default version can be found in the [smokeping_exporter_superq variables file](../vars/software/smokeping_exporter_superq.yml) and the default version can be overridden using the following variable:

    prometheus_smokeping_exporter_superq_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_smokeping_exporter_superq_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9374:

    prometheus_smokeping_exporter_superq_host: "0.0.0.0"
    prometheus_smokeping_exporter_superq_port: 9374
