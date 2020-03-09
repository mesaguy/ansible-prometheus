# Smokeping exporter (SuperQ) configuration

To enable [smokeping_exporter by SuperQ](https://github.com/SuperQ/smokeping_prober) include role task: smokeping_exporter_superq

An array of additional flags to pass to the smokeping_exporter daemon. You must specify a list of IPs and DNS names to ping:

    prometheus_smokeping_exporter_superq_extra_opts:
    - 'localhost'
    - '8.8.4.4'

The version of smokeping_exporter to install. The source version defines the version as specified in version control:

    prometheus_smokeping_exporter_superq_version: "0.3.0"
    prometheus_smokeping_exporter_superq_src_version: "v0.3.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9374:

    prometheus_smokeping_exporter_superq_host: "0.0.0.0"
    prometheus_smokeping_exporter_superq_port: 9374
