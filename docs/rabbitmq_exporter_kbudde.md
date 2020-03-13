# RabbitMQ exporter (kbudde) configuration

To enable [rabbitmq_exporter by kbudde](https://github.com/kbudde/rabbitmq_exporter) include role task: rabbitmq_exporter_kbudde

Environmental variables to pass to the rabbitmq_exporter exporter. These environmental variables are used as a primary method of configuring the exporter:

    prometheus_rabbitmq_exporter_kbudde_env_vars:
      RABBIT_URL: http://localhost:15672

An array of additional flags to pass to the rabbitmq_exporter daemon:

    prometheus_rabbitmq_exporter_kbudde_extra_opts: []

The version of rabbitmq_exporter to install. The source version defines the version as specified in version control:

    prometheus_rabbitmq_exporter_kbudde_version: "0.28.0"
    prometheus_rabbitmq_exporter_kbudde_src_version: "v0.28.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9419:

    prometheus_rabbitmq_exporter_kbudde_host: "0.0.0.0"
    prometheus_rabbitmq_exporter_kbudde_port: 9419
