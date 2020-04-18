# Kafka exporter (danielqsj) configuration

To enable [kafka_exporter by danielqsj](https://github.com/danielqsj/kafka_exporter) include role task: kafka_exporter_danielqsj

An array of additional flags to pass to the kafka_exporter daemon (ie):

    prometheus_kafka_exporter_danielqsj_extra_opts:
      - '--kafka.server=127.0.0.1:9092'

The version of kafka_exporter_danielqsj to install. The default version can be found in the [kafka_exporter_danielqsj variables file](../vars/software/kafka_exporter_danielqsj.yml) and the default version can be overridden using the following variable:

    prometheus_kafka_exporter_danielqsj_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_kafka_exporter_danielqsj_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9308:

    prometheus_kafka_exporter_danielqsj_host: "0.0.0.0"
    prometheus_kafka_exporter_danielqsj_port: 9308
