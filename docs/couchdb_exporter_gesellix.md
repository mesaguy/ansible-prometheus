# CouchDB exporter (gesellix) configuration

To enable [couchdb_exporter by gesellix](https://github.com/gesellix/couchdb-prometheus-exporter) include role task: couchdb_exporter_gesellix

An array of additional flags to pass to the couchdb_exporter daemon:

    prometheus_couchdb_exporter_gesellix_extra_opts: []

The version of couchdb_exporter_gesellix to install. The default version can be found in the [couchdb_exporter_gesellix variables file](../vars/software/couchdb_exporter_gesellix.yml) and the default version can be overridden using the following variable:

    prometheus_couchdb_exporter_gesellix_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_couchdb_exporter_gesellix_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9984:

    prometheus_couchdb_exporter_gesellix_host: "0.0.0.0"
    prometheus_couchdb_exporter_gesellix_port: 9984
