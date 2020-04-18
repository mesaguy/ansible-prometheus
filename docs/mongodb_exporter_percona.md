# MongoDB exporter (percona) configuration

To enable [mongodb_exporter by percona](https://github.com/percona/mongodb_exporter) include role task: mongodb_exporter_percona

Authentication can be configured using a YAML file or environmental variables using the following syntax:

    prometheus_mongodb_exporter_percona_env_vars:
      MONGODB_URI: 'mongodb://mongouser:mongopassword@localhost:27017/authdatabase'
      HTTP_AUTH: 'user:password'

An array of additional flags to pass to the mongodb_exporter daemon:

    prometheus_mongodb_exporter_percona_extra_opts: []

The version of mongodb_exporter_percona to install. The default version can be found in the [mongodb_exporter_percona variables file](../vars/software/mongodb_exporter_percona.yml) and can be used to override the default version:

    prometheus_mongodb_exporter_percona_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_mongodb_exporter_percona_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9216:

    prometheus_mongodb_exporter_percona_host: "0.0.0.0"
    prometheus_mongodb_exporter_percona_port: 9216
