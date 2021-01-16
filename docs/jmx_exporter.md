# JMX exporter configuration

To enable [jmx_exporter](https://github.com/prometheus/jmx_exporter) include role task: jmx_exporter

The [jmx_exporter](https://github.com/prometheus/jmx_exporter) is different from most exporters in that it isn't a daemon, it is a library that is included with your java instances.

Normal usage of this exporter has two or three steps:

1. (Optional) configure an exporter configuration file, examples are found in the [jmx_exporter examples](https://github.com/prometheus/jmx_exporter/tree/master/example_configs)
2. Update the java run parameters to include the jmx JAR, see [jmx_exporter](https://github.com/prometheus/jmx_exporter):

    java -javaagent: -javaagent:/opt/prometheus/exporters/jmx_exporter/active/jmx_exporter.jar=18888:/opt/prometheus/etc/jmx_exporter.default.yml -jar yourJar.jar

3. (Optional) configure the JMX exporter to automatically create tgroup files for the JMX service(s):

        prometheus_additional_exporters:
          - name: Tomcat application 1
            port: 18888
            labels: {}
          - name: Tomcat application 2
            port: 18889
            labels:
              org: Billing

The configuration content. The example below utilizes a file named 'jmx_exporter.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

``` yaml
prometheus_jmx_exporter_cfgs:
  elasticsearch: "{{ lookup('file', '../../files/prometheus/jmx.elasticsearch.yml') | from_yaml }}"
  puppet: "{{ lookup('file', '../../files/prometheus/jmx.puppet.yml') | from_yaml }}"
```

The version of jmx_exporter to install. The default version can be found in the [jmx_exporter variables file](../vars/software/jmx_exporter.yml) and the default version can be overridden using the following variable:

    prometheus_jmx_exporter_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_jmx_exporter_use_prerelease: true

The JMX configuration file mode defaults to 0640 and can be customized:

    prometheus_jmx_exporter_cfg_mode: 0644
