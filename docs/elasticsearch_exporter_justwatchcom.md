# Elasticsearch exporter (justwatchcom) configuration

An array of additional flags to pass to the elasticsearch_exporter daemon:

    prometheus_elasticsearch_exporter_justwatchcom_extra_opts: []

The version of elasticsearch_exporter to install. The source version defines the version as specified in version control:

    prometheus_elasticsearch_exporter_justwatchcom_version: "1.1.0"
    prometheus_elasticsearch_exporter_justwatchcom_src_version: "v1.1.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9908:

    prometheus_elasticsearch_exporter_justwatchcom_host: "0.0.0.0"
    prometheus_elasticsearch_exporter_justwatchcom_port: 9908
