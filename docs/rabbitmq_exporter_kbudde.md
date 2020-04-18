# RabbitMQ exporter (kbudde) configuration

To enable [rabbitmq_exporter by kbudde](https://github.com/kbudde/rabbitmq_exporter) include role task: rabbitmq_exporter_kbudde

Environmental variables to pass to the rabbitmq_exporter exporter. These environmental variables are used as a primary method of configuring the exporter:

    prometheus_rabbitmq_exporter_kbudde_env_vars:
      RABBIT_URL: http://localhost:15672

An array of additional flags to pass to the rabbitmq_exporter daemon:

    prometheus_rabbitmq_exporter_kbudde_extra_opts: []

The version of rabbitmq_exporter_kbudde to install. The default version can be found in the [rabbitmq_exporter_kbudde variables file](../vars/software/rabbitmq_exporter_kbudde.yml) and the default version can be overridden using the following variable:

    prometheus_rabbitmq_exporter_kbudde_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_rabbitmq_exporter_kbudde_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9419:

    prometheus_rabbitmq_exporter_kbudde_host: "0.0.0.0"
    prometheus_rabbitmq_exporter_kbudde_port: 9419
