# Couchbase exporter (leansys-team) configuration

To enable [couchbase_exporter by blakelead](https://github.com/blakelead/couchbase_exporter) include role task: couchbase_exporter_blakelead

Environmental variables to pass to the couchbase_exporter_blakelead exporter. These environmental variables are used as a primary method of configuring the exporter:

    prometheus_couchbase_exporter_blakelead_env_vars:
      CB_EXPORTER_DB_USER: couchbase
      CB_EXPORTER_DB_PASSWORD: couchbase

An array of additional flags to pass to the couchbase_exporter daemon:

    prometheus_couchbase_exporter_blakelead_extra_opts: []

The version of couchbase_exporter_blakelead to install. The default version can be found in the [couchbase_exporter_blakelead variables file](../vars/software/couchbase_exporter_blakelead.yml) and the default version can be overridden using the following variable:

    prometheus_couchbase_exporter_blakelead_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_couchbase_exporter_blakelead_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9191:

    prometheus_couchbase_exporter_blakelead_host: "0.0.0.0"
    prometheus_couchbase_exporter_blakelead_port: 9191
