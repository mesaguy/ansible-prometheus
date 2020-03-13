# CouchDB exporter (gesellix) configuration

To enable [couchdb_exporter by gesellix](https://github.com/gesellix/couchdb-prometheus-exporter) include role task: couchdb_exporter_gesellix

An array of additional flags to pass to the couchdb_exporter daemon:

    prometheus_couchdb_exporter_gesellix_extra_opts: []

The version of couchdb_exporter to install. The source version defines the version as specified in version control:

    prometheus_couchdb_exporter_gesellix_version: "18"
    prometheus_couchdb_exporter_gesellix_src_version: "18"

Port and IP to listen on. Defaults to listening on all available IPs on port 9984:

    prometheus_couchdb_exporter_gesellix_host: "0.0.0.0"
    prometheus_couchdb_exporter_gesellix_port: 9984
