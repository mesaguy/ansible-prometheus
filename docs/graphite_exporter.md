# Graphite exporter configuration

To enable [graphite_exporter](https://github.com/prometheus/graphite_exporter) include role task: graphite_exporter

The configuration content. The example below utilizes a file named 'graphite_exporter.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_graphite_exporter_cfg: '{{ lookup("file", "../files/graphite_exporter.yml") | from_yaml }}'

Alternatively, the configuration file can be defined directly:

    prometheus_graphite_exporter_cfg:
      - match: test.dispatcher.*.*.*
        name: dispatcher_events_total
        labels:
          action: $2
          job: test_dispatcher
          outcome: $3
          processor: $1

An array of additional flags to pass to the graphite_exporter daemon:

    prometheus_graphite_exporter_extra_opts: []

The version of graphite_exporter to install. The default version can be found in the [graphite_exporter variables file](../vars/software/graphite_exporter.yml) and the default version can be overridden using the following variable:

    prometheus_graphite_exporter_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_graphite_exporter_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9108:

    prometheus_graphite_exporter_host: "0.0.0.0"
    prometheus_graphite_exporter_port: 9108
