# Zookeeper exporter (infonova) configuration

To enable [zookeeper_exporter](https://github.com/infonova/zookeeper_exporter) include role task: zookeeper_exporter

No binaries exist for zookeeper_exporter, so you must set either:

    # zookeeper_exporter only
    prometheus_zookeeper_exporter_infonova_fallback_to_build: true

    # Globally allow building where binaries fail to download or install
    prometheus_fallback_to_build: true

An array of additional flags to pass to the zookeeper_exporter daemon:

    prometheus_zookeeper_exporter_infonova_extra_opts: []

The version of zookeeper_exporter_infonova to install. The default version can be found in the [zookeeper_exporter_infonova variables file](../vars/software/zookeeper_exporter_infonova.yml) and the default version can be overridden using the following variable:

    prometheus_zookeeper_exporter_infonova_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_zookeeper_exporter_infonova_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9114:

    prometheus_zookeeper_exporter_infonova_host: "0.0.0.0"
    prometheus_zookeeper_exporter_infonovar_port: 9114
