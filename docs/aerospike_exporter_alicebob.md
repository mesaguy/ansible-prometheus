# Aerospike exporter (alicebob) configuration

To enable [aerospike_exporter by alicebob](https://github.com/alicebob/asprom) include role task: aerospike_exporter_alicebob

An array of additional flags to pass to the aerospike_exporter daemon:

    prometheus_aerospike_exporter_alicebob_extra_opts: []

The version of aerospike_exporter_alicebob to install. The default version can be found in the [aerospike_exporter_alicebob variables file](../vars/software/aerospike_exporter_alicebob.yml) and the default version can be overridden using the following variable:

    prometheus_aerospike_exporter_alicebob_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_aerospike_exporter_alicebob_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9145:

    prometheus_aerospike_exporter_alicebob_host: "0.0.0.0"
    prometheus_aerospike_exporter_alicebob_port: 9145
