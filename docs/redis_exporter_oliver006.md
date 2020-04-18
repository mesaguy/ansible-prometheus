# Redis exporter (kbudde) configuration

To enable [redis_exporter by oliver006](https://github.com/oliver006/redis_exporter) include role task: redis_exporter_oliver006

An array of additional flags to pass to the redis_exporter daemon:

    prometheus_redis_exporter_oliver006_extra_opts: []

The version of redis_exporter_oliver006 to install. The default version can be found in the [redis_exporter_oliver006 variables file](../vars/software/redis_exporter_oliver006.yml) and the default version can be overridden using the following variable:

    prometheus_redis_exporter_oliver006_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_redis_exporter_oliver006_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9121:

    prometheus_redis_exporter_oliver006_host: "0.0.0.0"
    prometheus_redis_exporter_oliver006_port: 9121
