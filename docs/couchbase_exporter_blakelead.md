# Couchbase exporter (leansys-team) configuration

To enable [couchbase_exporter by blakelead](https://github.com/blakelead/couchbase_exporter) include role task: couchbase_exporter_blakelead

Environmental variables to pass to the couchbase_exporter_blakelead exporter. These environmental variables are used as a primary method of configuring the exporter:

    prometheus_couchbase_exporter_blakelead_env_vars:
      CB_EXPORTER_DB_USER: couchbase
      CB_EXPORTER_DB_PASSWORD: couchbase

An array of additional flags to pass to the couchbase_exporter daemon:

    prometheus_couchbase_exporter_blakelead_extra_opts: []

The version of couchbase_exporter to install. The source version defines the version as specified in version control:

    prometheus_couchbase_exporter_blakelead_version: "0.9.6"
    prometheus_couchbase_exporter_blakelead_src_version: "0.9.6"

Port and IP to listen on. Defaults to listening on all available IPs on port 9191:

    prometheus_couchbase_exporter_blakelead_host: "0.0.0.0"
    prometheus_couchbase_exporter_blakelead_port: 9191
