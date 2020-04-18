# Elasticsearch exporter (justwatchcom) configuration

An array of additional flags to pass to the elasticsearch_exporter daemon:

    prometheus_elasticsearch_exporter_justwatchcom_extra_opts: []

The version of elasticsearch_exporter_justwatchcom to install. The default version can be found in the [elasticsearch_exporter_justwatchcom variables file](../vars/software/elasticsearch_exporter_justwatchcom.yml) and the default version can be overridden using the following variable:

    prometheus_elasticsearch_exporter_justwatchcom_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_elasticsearch_exporter_justwatchcom_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9908:

    prometheus_elasticsearch_exporter_justwatchcom_host: "0.0.0.0"
    prometheus_elasticsearch_exporter_justwatchcom_port: 9908
