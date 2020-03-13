# JMX exporter configuration

To enable [jmx_exporter](https://github.com/prometheus/jmx_exporter) include role task: jmx_exporter

The [jmx_exporter](https://github.com/prometheus/jmx_exporter) is different from most exporters in that it isn't a daemon, it is a library that is included with your java instances.

The configuration content. The example below utilizes a file named 'jmx_exporter.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

``` yaml
prometheus_jmx_cfgs:
  elasticsearch: "{{ lookup('file', '../../files/prometheus/jmx.elasticsearch.yml') | from_yaml }}"
  puppet: "{{ lookup('file', '../../files/prometheus/jmx.puppet.yml') | from_yaml }}"
```

The version of jmx_exporter to install:

    prometheus_jmx_exporter_version: "0.12.0"
