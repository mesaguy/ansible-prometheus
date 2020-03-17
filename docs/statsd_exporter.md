# Statsd exporter configuration

To enable [statsd_exporter](https://github.com/prometheus/statsd_exporter) include role task: statsd_exporter

The configuration content. The example below utilizes a file named 'statsd_exporter.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_statsd_exporter_cfg: '{{ lookup("file", "../files/statsd_exporter.yml") | from_yaml }}'

Alternatively, the configuration file can be defined directly:

    prometheus_statsd_exporter_cfg:
      - match: test.dispatcher.*.*.*
        name: dispatcher_events_total
        labels:
          action: $2
          job: test_dispatcher
          outcome: $3
          processor: $1

An array of additional flags to pass to the statsd_exporter daemon:

    prometheus_statsd_exporter_extra_opts:
        --statsd.listen-udp=":9125"

The version of statsd_exporter to install. The default version can be found in the [statsd_exporter variables file](../vars/software/statsd_exporter.yml) and the default version can be overridden using the following variable:

    prometheus_statsd_exporter_version: "1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_statsd_exporter_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9102:

    prometheus_statsd_exporter_host: "0.0.0.0"
    prometheus_statsd_exporter_port: 9102
