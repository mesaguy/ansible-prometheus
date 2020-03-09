# Redis exporter (kbudde) configuration

To enable [redis_exporter by oliver006](https://github.com/oliver006/redis_exporter) include role task: redis_exporter_oliver006

An array of additional flags to pass to the redis_exporter daemon:

    prometheus_redis_exporter_oliver006_extra_opts: []

The version of redis_exporter to install. The source version defines the version as specified in version control:

    prometheus_redis_exporter_oliver006_version: "1.4.0"
    prometheus_redis_exporter_oliver006_src_version: "v1.4.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9121:

    prometheus_redis_exporter_oliver006_host: "0.0.0.0"
    prometheus_redis_exporter_oliver006_port: 9121
