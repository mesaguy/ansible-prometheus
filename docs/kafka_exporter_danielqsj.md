# Kafka exporter (danielqsj) configuration

To enable [kafka_exporter by danielqsj](https://github.com/danielqsj/kafka_exporter) include role task: kafka_exporter_danielqsj

An array of additional flags to pass to the kafka_exporter daemon (ie):

    prometheus_kafka_exporter_danielqsj_extra_opts:
      - '--kafka.server=127.0.0.1:9092'

The version of kafka_exporter to install. The source version defines the version as specified in version control:

    prometheus_kafka_exporter_danielqsj_version: "1.2.0"
    prometheus_kafka_exporter_danielqsj_src_version: "v1.2.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9308:

    prometheus_kafka_exporter_danielqsj_host: "0.0.0.0"
    prometheus_kafka_exporter_danielqsj_port: 9308
