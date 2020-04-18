To enable [pushgateway](https://github.com/prometheus/pushgateway) include role task: pushgateway

An array of additional flags to pass to the pushgateway daemon:

    prometheus_pushgateway_extra_opts: []

To configure persistence storage configure the following variables with a path for the persistence file location:

    prometheus_pushgateway_extra_opts:
     - '--persistence.file=/opt/prometheus/var/pushgateway/pushgateway.persistence'
    prometheus_pushgateway_persistence_dir: /opt/prometheus/var/pushgateway

The version of Pushgateway to install. The default version can be found in the [pushgateway variables file](../vars/software/pushgateway.yml) and the default version can be overridden using the following variable:

    prometheus_pushgateway_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_pushgateway_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9091:

    prometheus_pushgateway_host: "0.0.0.0"
    prometheus_pushgateway_port: 9091
