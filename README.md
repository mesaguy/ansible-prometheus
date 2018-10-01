# Prometheus
[![Build Status](https://api.travis-ci.org/mesaguy/ansible-prometheus.svg?branch=master)](https://travis-ci.org/mesaguy/ansible-prometheus)

Installs and manages [Prometheus server](https://prometheus.io), [Alertmanager](https://prometheus.io/docs/alerting/overview/), [PushGateway](https://github.com/prometheus/pushgateway/blob/master/README.md), and [Prometheus exporters](https://prometheus.io/docs/instrumenting/exporters/)

This module was designed to be extended easily and is kept current such that it always uses the latest Prometheus software.

## Requirements
Ansible >= 2.5.1

## Supported Software and Operating Systems
### Supported Operating Systems, Distributions, and Architectures
This module is intended to support as many distributions and architectures as possible. The following table specifies which combinations are currently tested

| OS             | Release                          | Architectures     |
|----------------|----------------------------------|-------------------|
|Alpine          |3.2 through 3.8, edge             | x86_64 (amd64)    |
|AmazonLinux     |1 and 2                           | x86_64 (amd64)    |
|ArchLinux       |Current                           | x86_64 (amd64)    |
|Enterprise Linux|6, 7                              | x86_64 (amd64)    |
|Fedora          |20 through 28, rawhide            | x86_64 (amd64)    |
|Gentoo (openrc) |Current                           | x86_64 (amd64)    |
|Gentoo (systemd)|Current                           | x86_64 (amd64)    |
|OpenSUSE        |13.1 through tumbleweed           | x86_64 (amd64)    |
|Oracle Linux    |6, 7                              | x86_64 (amd64)    |
|Ubuntu          |14.04, 16.04, 17.10, 18.04, 18.10 | x86_64 (amd64)    |

### Supported Prometheus software
The following core Prometheus software is supported in addition to the list of exporters below. This software is fully tested on all supported OS, distributions, and architectures.

| Prometheus software                                       | CI tested |
|-----------------------------------------------------------|:----------|
|[prometheus](https://github.com/prometheus/prometheus)     | Yes       |
|[alertmanager](https://github.com/prometheus/alertmanager) | Yes       |
|[push_gateway](https://github.com/prometheus/pushgateway)  | Yes       |

### Supported exporters
All exporters are verified to install. Currently select modules receive testing via CI (Continuous Integration) and [Inspec](https://www.inspec.io)

| Exporter                                                                                      | Author        | CI tested |
|-----------------------------------------------------------------------------------------------|:-------------:|:---------:|
|[apache_exporter_lusitaniae](https://github.com/Lusitaniae/apache_exporter)                    | Lusitaniae    | Yes       |
|[blackbox_exporter](https://github.com/prometheus/blackbox_exporter)                           | prometheus    | Yes       |
|[cloudwatch_exporter](https://github.com/prometheus/cloudwatch_exporter)                       | prometheus    | Yes       |
|[collectd_exporter](https://github.com/prometheus/collectd_exporter)                           | prometheus    | Yes       |
|[consul_exporter](https://github.com/prometheus/consul_exporter)                               | prometheus    | Yes       |
|[digitalocean_exporter_metalmatze](https://github.com/metalmatze/digitalocean_exporter)        | metalmatze    | Yes       |
|[elasticsearch_exporter_justwatchcom](https://github.com/justwatchcom/elasticsearch_exporter)  | justwatchcom  | Yes       |
|[gluster_exporter_ofesseler](https://github.com/ofesseler/gluster_exporter)                    | ofesseler     | Yes       |
|[graphite_exporter](https://github.com/prometheus/graphite_exporter)                           | prometheus    | Yes       |
|[grok_exporter_fstab](https://github.com/fstab/grok_exporter)                                  | fstab         | Yes       |
|[haproxy_exporter](https://github.com/prometheus/haproxy_exporter)                             | prometheus    | Yes       |
|[influxdb_exporter](https://github.com/prometheus/influxdb_exporter)                           | prometheus    | Yes       |
|[jmx_exporter](https://github.com/prometheus/jmx_exporter)                                     | prometheus    | No        |
|[kafka_exporter](https://github.com/danielqsj/kafka_exporter)                                  | danielqsj     | Yes       |
|[memcached_exporter_danielqsj](https://github.com/prometheus/memcached_exporter)               | prometheus    | Yes       |
|[mysqld_exporter](https://github.com/prometheus/mysqld_exporter)                               | prometheus    | Yes       |
|[node_exporter](https://github.com/prometheus/node_exporter)                                   | prometheus    | Yes       |
|[nvidia_gpu_exporter_mindprince](https://github.com/mindprince/nvidia_gpu_prometheus_exporter) | mindprince    | Yes       |
|[postgres_exporter_wrouesnel](https://github.com/wrouesnel/postgres_exporter)                  | wrouesnel     | Yes       |
|[process_exporter_ncabatoff](https://github.com/ncabatoff/process-exporter)                    | ncabatoff     | Yes       |
|[rabbitmq_exporter_kbudde](https://github.com/kbudde/rabbitmq_exporter)                        | kbudde        | Yes       |
|[snmp_exporter](https://github.com/prometheus/snmp_exporter)                                   | prometheus    | Yes       |
|[squid_exporter_boynux](https://github.com/boynux/squid-exporter)                              | boynux        | Yes       |
|[statsd_exporter](https://github.com/prometheus/statsd_exporter)                               | prometheus    | Yes       |
|[zookeeper_exporter_infonova](https://github.com/infonova/zookeeper_exporter)                  | infonova      | Yes       |

## Role Variables
The 'prometheus_components' variable is an array specifying the prometheus software to install. This example shows all possible prometheus_components:

``` yaml
prometheus_components:
 # Core components:
 - alertmanager
 - prometheus
 - push_gateway
 # Exporters
 - apache_exporter_lusitaniae
 - blackbox_exporter
 - cloudwatch_exporter
 - collectd_exporter
 - consul_exporter
 - digitalocean_exporter_metalmatze
 - elasticsearch_exporter_justwatchcom
 - gluster exporter_ofesseler
 - graphite_exporter
 - grok_exporter_fstab
 - haproxy_exporter
 - influxdb_exporter
 - jmx_exporter
 - kafka_exporter
 - memcached_exporter_danielqsj
 - mysqld_exporter
 - node_exporter
 - nvidia_gpu_exporter_mindprince
 - postgres_exporter_wrouesnel
 - process_exporter_ncabatoff
 - rabbitmq_exporter_kbudde
 - snmp_exporter
 - squid_exporter_boynux
 - statsd_exporter
 - zookeeper_exporter_infonova
```

Most Prometheus software and exporters use yaml for the configuration files. The content of your configuration files be be defined using the following methods:

Using an external YAML file. In this example, the file would be located in your Ansible environment's 'files' directory:

``` yaml
  prometheus_server_cfg: "{{ lookup('file', '../files/prometheus_server.yml') | from_yaml }}"
```

Or embedding the YAML directly into your playbook:
``` yaml
  prometheus_server_cfg:
    global:
      scrape_interval: 15s

      # Attach these labels to any time series or alerts when communicating with
      # external systems (federation, remote storage, Alertmanager).
      external_labels:
        monitor: 'codelab-monitor'

    # A scrape configuration containing exactly one endpoint to scrape:
    # Here it's Prometheus itself.
    scrape_configs:
      # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
      - job_name: 'prometheus'

        # Override the global default and scrape targets from this job every 5 seconds.
        scrape_interval: 5s

        static_configs:
          - targets: ['localhost:9090']
```

### Common variables

By default, if a Prometheus software or exporter binary fails to install, the installation fails. This default can be overridden causing an installation via source by setting the global 'prometheus_fallback_to_build' value or a software specific override. For example, to allow the blackbox_exporter to be built from source if no binary can be found set:

    prometheus_blackbox_exporter_fallback_to_build: true

All installer tasks which control a daemon have a 'runas' parameter to specify which user the daemon will run as. By default all users run as the 'prometheus_user' (defaults to: prometheus). For instance, to have the blackbox_exporter run as user 'test' set the following variable:

    prometheus_blackbox_exporter_runas: test


### Global variables

Link the Prometheus etc directory to '/etc/prometheus'. The Prometheus etc directory defaults to '/opt/prometheus/etc':

    prometheus_link_etc: true

Attempt to force the etc directory symlink referenced above:

    prometheus_link_etc_force: false

Purge old and now orphaned versions of software:

    prometheus_purge_orphans: false

Root directory to install Prometheus software:

    prometheus_root_dir: '/opt/prometheus'

Test each service port after installing and starting each service:

    prometheus_test_service_port: true

Manage the 'prometheus' service user and group:

    prometheus_manage_group: true
    prometheus_manage_user: true

Name of the Prometheus service and group:

    prometheus_group: prometheus
    prometheus_user: prometheus

If installing a Prometheus application binary fails, fall back to installing the Prometheus software via source? Installation from source generally requires installing compilers. It is also possible to enable 'fallback_to_build' on a case-by-case basis (ie: prometheus_software_fallback_to_build: true):

    prometheus_fallback_to_build: false

Go version to use when building Prometheus software:

    prometheus_go_version: 1.10.3

The Prometheus etc directory, defaults to '/opt/prometheus/etc':

    prometheus_etc_dir: "{{ prometheus_root_dir }}/etc"

The root directory in which exporters are installed, defaults to '/opt/prometheus/exporters':

    prometheus_exporters_dir: "{{ prometheus_root_dir }}/exporters"

The root directory in which 'go' is installed. Go is only installed if Prometheus software is being installed from source. Defaults to '/opt/prometheus/go':

    prometheus_go_dir: "{{ prometheus_root_dir }}/go"

The directory in which logs are created:

    prometheus_log_dir: "/var/log/prometheus"

The directory to use for temporary space, principally when building Prometheus software. Defaults to '/opt/prometheus/tmp':

    prometheus_tmp_dir: "{{ prometheus_root_dir }}/tmp"

The directory to use when storing persistent Prometheus data (ie: The Prometheus server's data), defaults to '/opt/prometheus/var':

    prometheus_var_dir: "{{ prometheus_root_dir }}/var"


### Prometheus server variables

To enable [prometheus server](https://github.com/prometheus/prometheus) include role task: prometheus

Prometheus configuration files are validated using 'promtool' before Prometheus is restarted.

The configuration content. The example below utilizes a file named 'prometheus_server.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_server_cfg: '{{ lookup("file", "../files/prometheus_server.yml") | from_yaml }}'

An array of additional flags to pass to the prometheus daemon:

    prometheus_extra_opts: []

The version of Prometheus to install. The source version defines the version as specified in version control:

    prometheus_version: "2.4.2"
    prometheus_src_version: "v2.4.2"

Where to store Prometheus's database, defaults to /opt/prometheus/var/prometheus

    prometheus_storage_dir: /opt/prometheus/var/prometheus

Prometheus web console templates to utilize. The defaults suffice under most circumstances and this variable should remain unset under most circumstances:

    prometheus_web_console_libraries_dir: /opt/prometheus/prometheus/x.x.x/console_libraries
    prometheus_web_console_templates_dir: /opt/prometheus/prometheus/x.x.x/consoles

Port and IP to listen on. Defaults to listening on all available IPs on port 9090:

    prometheus_host: "0.0.0.0"
    prometheus_port: 9090


### Alertmanager variables

To enable [alertmanager](https://github.com/prometheus/alertmanager) include role task: alertmanager

Alertmanager configuration files are validated using 'amtool' before Alertmanager is restarted.

The configuration content. The example below utilizes a file named 'alertmanager.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_alertmanager_cfg: '{{ lookup("file", "../files/alertmanager.yml") | from_yaml }}'

An array of additional flags to pass to the alertmanager daemon:

    prometheus_alertmanager_extra_opts: []

The version of Alertmanager to install. The source version defines the version as specified in version control:

    prometheus_version: "0.15.2"
    prometheus_src_version: "v0.15.2"

Where to store Alertmanager's data, defaults to /opt/prometheus/var/alertmanager

Port and IP to listen on. Defaults to listening on all available IPs on port 9093:

    prometheus_alertmanager_host: "0.0.0.0"
    prometheus_alertmanager_port: 9093

### Pushgateway variables

To enable [alertmanager](https://github.com/prometheus/pushgateway) include role task: pushgateway

An array of additional flags to pass to the pushgateway daemon:

    prometheus_pushgateway_extra_opts: []

The version of Pushgateway to install. The source version defines the version as specified in version control:

    prometheus_pushgateway_version: "0.5.2"
    prometheus_pushgateway_src_version: "v0.5.2"

Port and IP to listen on. Defaults to listening on all available IPs on port 9091:

    prometheus_pushgateway_host: "0.0.0.0"
    prometheus_pushgateway_port: 9091

### Apache exporter (Lusitaniae) variables

To enable [apache_exporter by Lusitaniae](https://github.com/Lusitaniae/apache_exporter) include role task: apache_exporter_lusitaniae

An array of additional flags to pass to the apache_exporter daemon (ie):

    prometheus_apache_exporter_lusitaniae_extra_opts:
      - '-scrape_uri="http://localhost/server-status/?auto"'

The version of apache_exporter to install. The source version defines the version as specified in version control:

    prometheus_apache_exporter_lusitaniae_version: "0.5.0"
    prometheus_apache_exporter_lusitaniae_src_version: "v0.5.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9117:

    prometheus_apache_exporter_lusitaniae_host: "0.0.0.0"
    prometheus_apache_exporter_lusitaniae_port: 9117

### Blackbox exporter variables

To enable [blackbox_exporter](https://github.com/prometheus/blackbox_exporter) include role task: blackbox_exporter

The configuration content. The example below utilizes a file named 'blackbox_exporter.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_blackbox_exporter_cfg: '{{ lookup("file", "../files/blackbox_exporter.yml") | from_yaml) }}'

Alternatively, the configuration file can be defined directly:

    prometheus_blackbox_exporter_cfg:
      http_2xx:
        http:
          fail_if_not_ssl: false
          fail_if_ssl: false
          method: GET
          no_follow_redirects: false
          preferred_ip_protocol: ip4
          tls_config:
            insecure_skip_verify: false
          valid_http_versions:
          - HTTP/1.1
          - HTTP/2
          valid_status_codes:
          - 200

An array of additional flags to pass to the blackbox_exporter daemon:

    prometheus_blackbox_exporter_extra_opts: []

The version of blackbox_exporter to install. The source version defines the version as specified in version control:

    prometheus_blackbox_exporter_version: "0.12.0"
    prometheus_blackbox_exporter_src_version: "v0.12.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9115:

    prometheus_blackbox_exporter_host: "0.0.0.0"
    prometheus_blackbox_exporter_port: 9115

### CloudWatch exporter variables

To enable [cloudwatch_exporter](https://github.com/prometheus/cloudwatch_exporter) include role task: cloudwatch_exporter

The configuration content. The example below utilizes a file named 'cloudwatch_exporter.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_cloudwatch_exporter_cfg: '{{ lookup("file", "../files/cloudwatch_exporter.yml") | from_yaml) }}'

Alternatively, the configuration file can be defined directly:

    prometheus_cloudwatch_exporter_cfg:
      region: eu-west-1
      metrics:
       - aws_namespace: AWS/ELB
         aws_metric_name: RequestCount
         aws_dimensions: [AvailabilityZone, LoadBalancerName]
         aws_dimension_select:
           LoadBalancerName: [myLB]
         aws_statistics: [Sum]

An array of additional flags to pass to the cloudwatch_exporter daemon:

    prometheus_cloudwatch_exporter_extra_opts: []

The version of cloudwatch_exporter to install:

    prometheus_cloudwatch_exporter_version: "0.5.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9106:

    prometheus_cloudwatch_exporter_host: "0.0.0.0"
    prometheus_cloudwatch_exporter_port: 9106

### Collectd exporter variables

To enable [collectd_exporter](https://github.com/prometheus/collectd_exporter) include role task: collectd_exporter

An array of additional flags to pass to the collectd_exporter daemon:

    prometheus_collectd_exporter_extra_opts: []

The version of collectd_exporter to install. The source version defines the version as specified in version control:

    prometheus_collectd_exporter_version: "0.4.0"
    prometheus_collectd_exporter_src_version: "v0.4.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9103:

    prometheus_collectd_exporter_host: "0.0.0.0"
    prometheus_collectd_exporter_port: 9103

### Consul exporter variables

To enable [consul_exporter](https://github.com/prometheus/consul_exporter) include role task: consul_exporter

Environmental variables to pass to the consul_exporter exporter. These environmental variables are used as a primary method of configuring the exporter:

    prometheus_consul_exporter_env_vars:
      CONSUL_HTTP_TOKEN: '4391eca7bcd03f45aa43ca26829c386c329097a7'
      CONSUL_HTTP_SSL_VERIFY: true

An array of additional flags to pass to the consul_exporter daemon:

    prometheus_consul_exporter_extra_opts: []

The version of consul_exporter to install. The source version defines the version as specified in version control:

    prometheus_consul_exporter_version: "0.4.0"
    prometheus_consul_exporter_src_version: "v0.4.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9107:

    prometheus_consul_exporter_host: "0.0.0.0"
    prometheus_consul_exporter_port: 9107

### DigitalOcean exporter (metalmatze) variables

Environmental variables to pass to the digitalocean_exporter_metalmatze exporter. These environmental variables are used as a primary method of configuring the exporter:

    prometheus_digitalocean_exporter_metalmatze_env_vars:
      DIGITALOCEAN_TOKEN: 1234567890ABCDEFG

An array of additional flags to pass to the digitalocean_exporter daemon:

    prometheus_digitalocean_exporter_metalmatze_extra_opts: []

The version of digitalocean_exporter to install. The source version defines the version as specified in version control:

    prometheus_digitalocean_exporter_metalmatze_version: "0.5"
    prometheus_digitalocean_exporter_metalmatze_src_version: "v0.5"

Port and IP to listen on. Defaults to listening on all available IPs on port 9212:

    prometheus_digitalocean_exporter_metalmatze_host: "0.0.0.0"
    prometheus_digitalocean_exporter_metalmatze_port: 9212

### Elasticsearch exporter (justwatchcom) variables

An array of additional flags to pass to the elasticsearch_exporter daemon:

    prometheus_elasticsearch_exporter_justwatchcom_extra_opts: []

The version of elasticsearch_exporter to install. The source version defines the version as specified in version control:

    prometheus_elasticsearch_exporter_justwatchcom_version: "1.0.2"
    prometheus_elasticsearch_exporter_justwatchcom_src_version: "v1.0.2"

Port and IP to listen on. Defaults to listening on all available IPs on port 9908:

    prometheus_elasticsearch_exporter_justwatchcom_host: "0.0.0.0"
    prometheus_elasticsearch_exporter_justwatchcom_port: 9908

### Gluster exporter (ofesseler) variables

To enable [gluster_exporter by ofesseler](https://github.com/ofesseler/gluster_exporter) include role task: gluster_exporter_ofesseler

An array of additional flags to pass to the gluster_exporter daemon:

    prometheus_gluster_exporter_ofesseler_extra_opts: []

The gluster exporter needs to run as root if gluster is running as root:

    prometheus_gluster_exporter_ofesseler_runas: root

The version of gluster_exporter to install. The source version defines the version as specified in version control:

    prometheus_gluster_exporter_ofesseler_version: "0.2.7"
    prometheus_gluster_exporter_ofesseler_src_version: "v0.2.7"

Port and IP to listen on. Defaults to listening on all available IPs on port 9189:

    prometheus_gluster_exporter_ofesseler_host: "0.0.0.0"
    prometheus_gluster_exporter_ofesseler_port: 9189

### Graphite exporter variables

To enable [graphite_exporter](https://github.com/prometheus/graphite_exporter) include role task: graphite_exporter

The configuration content. The example below utilizes a file named 'graphite_exporter.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_graphite_exporter_cfg: '{{ lookup("file", "../files/graphite_exporter.yml") | from_yaml) }}'

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

The version of graphite_exporter to install. The source version defines the version as specified in version control:

    prometheus_graphite_exporter_version: "0.3.0"
    prometheus_graphite_exporter_src_version: "v0.3.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9108:

    prometheus_graphite_exporter_host: "0.0.0.0"
    prometheus_graphite_exporter_port: 9108

### Grok exporter (fstab) variables

To enable [grok_exporter by fstab](https://github.com/fstab/grok_exporter) include role task: grok_exporter_fstab

The configuration content. The example below utilizes a file named 'grok_exporter_fstab.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_grok_exporter_fstab_cfg: '{{ lookup("file", "../files/grok_exporter_fstab.yml") | from_yaml) }}'

Alternatively, the configuration file can be defined directly:

    prometheus_grok_exporter_fstab_cfg:
      global:
          config_version: 2
      input:
          type: file
          path: ./example/example.log
          readall: true
      grok:
          patterns_dir: ./logstash-patterns-core/patterns
      metrics:
          - type: counter
            name: grok_example_lines_total
            help: Counter metric example with labels.
            match: '%{DATE} %{TIME} %{USER:user} %{NUMBER}'
            labels:
                user: '{{.user}}'
      server:
          port: 9144

An array of additional flags to pass to the grok_exporter daemon:

    prometheus_grok_exporter_fstab_extra_opts: []

The version of grok_exporter to install. The source version defines the version as specified in version control:

    prometheus_grok_exporter_fstab_version: "0.2.5"
    prometheus_grok_exporter_fstab_src_version: "v0.2.5"

Port and IP to listen on. Defaults to listening on all available IPs on port 9144:

    prometheus_grok_exporter_fstab_host: "0.0.0.0"
    prometheus_grok_exporter_fstab_port: 9144

### HAProxy exporter variables

To enable [haproxy_exporter](https://github.com/prometheus/haproxy_exporter) include role task: haproxy_exporter

An array of additional flags to pass to the haproxy_exporter daemon:

    prometheus_haproxy_exporter_extra_opts: []

The version of haproxy_exporter to install. The source version defines the version as specified in version control:

    prometheus_haproxy_exporter_version: "0.9.0"
    prometheus_haproxy_exporter_src_version: "v0.9.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9101:

    prometheus_haproxy_exporter_host: "0.0.0.0"
    prometheus_haproxy_exporter_port: 9101

### InfluxDB exporter variables

An array of additional flags to pass to the influxdb_exporter daemon:

    prometheus_influxdb_exporter_extra_opts: []

The version of influxdb_exporter to install. The source version defines the version as specified in version control:

    prometheus_influxdb_exporter_version: "0.1.0"
    prometheus_influxdb_exporter_src_version: "v0.1.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9122:

    prometheus_influxdb_exporter_host: "0.0.0.0"
    prometheus_influxdb_exporter_port: 9122

### JMX exporter variables

To enable [jmx_exporter](https://github.com/prometheus/jmx_exporter) include role task: jmx_exporter

The [jmx_exporter](https://github.com/prometheus/jmx_exporter) is different from most exporters in that it isn't a daemon, it is a library that is included with your java instances.

The configuration content. The example below utilizes a file named 'jmx_exporter.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

``` yaml
prometheus_jmx_cfgs:
  elasticsearch: "{{ lookup('file', '../../files/prometheus/jmx.elasticsearch.yml') | from_yaml }}"
  puppet: "{{ lookup('file', '../../files/prometheus/jmx.puppet.yml') | from_yaml }}"
```

The version of jmx_exporter to install:

    prometheus_jmx_exporter_version: "0.3.1"

### Kafka exporter (danielqsj) variables

To enable [kafka_exporter by danielqsj](https://github.com/danielqsj/kafka_exporter) include role task: kafka_exporter_danielqsj

An array of additional flags to pass to the kafka_exporter daemon (ie):

    prometheus_kafka_exporter_danielqsj_extra_opts:
      - '--kafka.server=127.0.0.1:9092'

The version of kafka_exporter to install. The source version defines the version as specified in version control:

    prometheus_kafka_exporter_danielqsj_version: "1.2.0"
    prometheus_kafka_exporter_danielqsj_src_version: "v1.2.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9308:

    prometheus_kafka_exporter_danielqsj_host: "0.0.0.0"
    prometheus_kafka_exporter_danielqsj_port: 9308

### Memcached exporter variables

To enable [memcached_exporter](https://github.com/prometheus/memcached_exporter) include role task: memcached_exporter

An array of additional flags to pass to the memcached_exporter daemon:

    prometheus_memcached_exporter_extra_opts: []

The version of memcached_exporter to install. The source version defines the version as specified in version control:

    prometheus_memcached_exporter_version: "0.4.1"
    prometheus_memcached_exporter_src_version: "v0.4.1"

Port and IP to listen on. Defaults to listening on all available IPs on port 9150:

    prometheus_memcached_exporter_host: "0.0.0.0"
    prometheus_memcached_exporter_port: 9150

### Mysqld exporter variables

To enable [mysqld_exporter](https://github.com/prometheus/mysqld_exporter) include role task: mysqld_exporter

The [mysqld_exporter](https://github.com/prometheus/mysqld_exporter) requires configuration before use! You must grant permissions for this exporter to read select data from MySQL and you must configure a .my.cnf file with the credentials this module will utilize.

An array of additional flags to pass to the mysqld_exporter daemon:

    prometheus_mysqld_exporter_extra_opts: []

The version of mysqld_exporter to install. The source version defines the version as specified in version control:

    prometheus_mysqld_exporter_version: "0.11.0"
    prometheus_mysqld_exporter_src_version: "v0.11.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9104:

    prometheus_mysqld_exporter_host: "0.0.0.0"
    prometheus_mysqld_exporter_port: 9104

### Node exporter variables

To enable [node_exporter](https://github.com/prometheus/node_exporter) include role task: node_exporter

The directory node_exporter should poll for text files containing additional information to present. Defaults to '/opt/prometheus/etc/node_exporter_textfiles':

    prometheus_node_exporter_textfiles_directory: '/opt/prometheus/etc/node_exporter_textfiles'

An array of additional flags to pass to the node_exporter daemon. You will likely wish to customize the data collected by [node_exporter](https://github.com/prometheus/node_exporter) by adding flags here:

    prometheus_node_exporter_extra_opts: []

Common node_exporter variables can be defined as follows:

    prometheus_node_exporter_extra_opts: []
      - '--collector.filesystem.ignored-mount-points="^/(sys|proc|dev|run|var/lib/docker/.*)($|/)"'
      - '--collector.systemd'
      - '--no-collector.zfs'

The version of node_exporter to install. The source version defines the version as specified in version control:

    prometheus_node_exporter_version: "0.16.0"
    prometheus_node_exporter_src_version: "v0.16.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9100:

    prometheus_node_exporter_host: "0.0.0.0"
    prometheus_node_exporter_port: 9100

### Nvidia GPU exporter (mindprince) variables

An array of additional flags to pass to the nvidia_gpu_exporter daemon:

    prometheus_nvidia_gpu_exporter_mindprince_extra_opts: []

The version of postgres_exporter to install. As there is no release, the version is a git commit hash:

    prometheus_nvidia_gpu_exporter_mindprince_version: "3897bdad246f3bc0e7105805d4442b9c9c7b06d2"

Port and IP to listen on. Defaults to listening on all available IPs on port 9445:

    prometheus_nvidia_gpu_exporter_mindprince_host: "0.0.0.0"
    prometheus_nvidia_gpu_exporter_mindprince_port: 9445

### Postgres exporter (wrouesnel) variables

To enable [postgres_exporter by wrouesnel](https://github.com/wrouesnel/postgres_exporter) include role task: postgres_exporter_wrouesnel

The [postgres_exporter](https://github.com/wrouesnel/postgres_exporter) requires configuration before use! You must grant permissions for this exporter to read select data from PostgreSQL.

Environmental variables to pass to the postgres_exporter_wrouesnel exporter. These environmental variables are used as a primary method of configuring the exporter:

    prometheus_postgres_exporter_wrouesnel_env_vars:
      DATA_SOURCE_NAME: 'postgresql://postgres_exporter:password@localhost:5432/postgres?sslmode=disable'

To avoid putting credentials in environmental variables, one can use the URI method of connection. After creating a file containing the connection password, configure as follows:

    prometheus_postgres_exporter_wrouesnel_env_vars:
      DATA_SOURCE_PASS_FILE: /opt/prometheus/etc/postgres_exporter.password
      DATA_SOURCE_URI: "127.0.0.1:5432/postgres?sslmode=disable"
      DATA_SOURCE_USER: postgres_exporter

An array of additional flags to pass to the postgres_exporter daemon:

    prometheus_postgres_exporter_wrouesnel_extra_opts: []

The version of postgres_exporter to install. The source version defines the version as specified in version control:

    prometheus_postgres_exporter_wrouesnel_version: "0.4.6"
    prometheus_postgres_exporter_wrouesnel_src_version: "v0.4.6"

Port and IP to listen on. Defaults to listening on all available IPs on port 9187:

    prometheus_postgres_exporter_wrouesnel_host: "0.0.0.0"
    prometheus_postgres_exporter_wrouesnel_port: 9187

### Process exporter (ncabatoff) variables

To enable [process-exporter](https://github.com/ncabatoff/process-exporter) include role task: process-exporter_ncabatoff

This task has been configured to be capable of installing and managing multiple instances of process-exporter. Since process-exporter reads from /proc, only root and the user who owns each process may lookup metrics for each process. You can run a single process-exporter as root and monitor all system processes, but doing so is likely a security risk. It is safest to run one unprivileged instance of process-exporter for each user's processes you wish to monitor.

The configuration content. The example below utilizes a variables specifying the name of the service (name), the user that process-exporter should run as (user), and the configuration content (data). In this example configuration file there are two instances of process-exporter configured to run. See the [process-exporter](https://github.com/ncabatoff/process-exporter) documentation for configuration details.

```yaml
    prometheus_process_exporter_ncabatoff_cfgs:
      - name: prometheus
        user: prometheus
        port: 9256
        data:
          process_names:
            - comm:
                - bash
            - exe:
                - sshd
      - name: apache
        user: apache
        port: 9257
        data:
          process_names:
            - comm:
                - bash
            - exe:
                - apache
```

An array of additional flags to pass to the process_exporter daemon:

    prometheus_process_exporter_ncabatoff_extra_opts: []

The version of process_exporter to install. The source version defines the version as specified in version control:

    prometheus_process_exporter_ncabatoff_version: "0.4.0"
    prometheus_process_exporter_ncabatoff_src_version: "v0.4.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9256. This is the default port and can/should be overridden using the configuration as exampled above in this section:

    prometheus_process_exporter_ncabatoff_host: "0.0.0.0"
    prometheus_process_exporter_ncabatoff_port: 9256

### RabbitMQ exporter (kbudde) variables

To enable [rabbitmq_exporter by kbudde](https://github.com/kbudde/rabbitmq_exporter) include role task: rabbitmq_exporter_kbudde

Environmental variables to pass to the consul_exporter exporter. These environmental variables are used as a primary method of configuring the exporter:

    prometheus_rabbitmq_exporter_kbudde_env_vars:
      RABBIT_URL: http://localhost:15672

An array of additional flags to pass to the rabbitmq_exporter daemon:

    prometheus_rabbitmq_exporter_kbudde_extra_opts: []

The version of rabbitmq_exporter to install. The source version defines the version as specified in version control:

    prometheus_rabbitmq_exporter_kbudde_version: "0.28.0"
    prometheus_rabbitmq_exporter_kbudde_src_version: "v0.28.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9419:

    prometheus_rabbitmq_exporter_kbudde_host: "0.0.0.0"
    prometheus_rabbitmq_exporter_kbudde_port: 9419

### SNMP exporter variables

To enable [snmp_exporter](https://github.com/prometheus/snmp_exporter) include role task: snmp_exporter

The configuration content. The example below utilizes a file named 'snmp_exporter.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_snmp_exporter_yml: ../files/snmp_exporter.yml

An array of additional flags to pass to the snmp_exporter daemon:

    prometheus_snmp_exporter_extra_opts: []

The version of snmp_exporter to install. The source version defines the version as specified in version control:
    prometheus_snmp_exporter_version: "0.13.0"
    prometheus_snmp_exporter_src_version: "v0.13.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9116:

    prometheus_snmp_exporter_host: "0.0.0.0"
    prometheus_snmp_exporter_port: 9116

### SQL exporter (boynux) variables

To enable [sql_exporter by free](https://github.com/free/sql_exporter) include role task: sql_exporter_free

The configuration content. The example below utilizes a file named 'sql_exporter_free.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_sql_exporter_free_cfg: '{{ lookup("file", "../files/sql_exporter_free.yml") | from_yaml) }}'

Alternatively, the configuration file can be defined directly:

    prometheus_sql_exporter_free_cfg:
      global:
        # Subtracted from Prometheus' scrape_timeout to give us some headroom and prevent Prometheus from
        # timing out first.
        scrape_timeout_offset: 500ms
        # Minimum interval between collector runs: by default (0s) collectors are executed on every scrape.
        min_interval: 0s
        # Maximum number of open connections to any one target. Metric queries will run concurrently on
        # multiple connections.
        max_connections: 3
        # Maximum number of idle connections to any one target.
        max_idle_connections: 3

      # The target to monitor and the list of collectors to execute on it.
      target:
        # Data source name always has a URI schema that matches the driver name. In some cases (e.g. MySQL)
        # the schema gets dropped or replaced to match the driver expected DSN format.
        data_source_name: 'sqlserver://prom_user:prom_password@dbserver1.example.com:1433'

An array of additional flags to pass to the sql_exporter daemon:

    prometheus_sql_exporter_free_extra_opts: []

The version of sql_exporter to install. The source version defines the version as specified in version control:

    prometheus_sql_exporter_free_version: "0.4"
    prometheus_sql_exporter_free_src_version: "v0.4"

Port and IP to listen on. Defaults to listening on all available IPs on port 9399:

    prometheus_sql_exporter_free_host: "0.0.0.0"
    prometheus_sql_exporter_free_port: 9399

### Squid exporter (boynux) variables

To enable [squid_exporter by boynux](https://github.com/boynux/squid-exporter) include role task: squid_exporter_boynux

An array of additional flags to pass to the squid_exporter daemon:

    prometheus_squid_exporter_boynux_extra_opts:
      - '-squid-hostname="localhost"'
      - '-squid-port=3128'

The version of squid_exporter to install:

    prometheus_squid_exporter_boynux_version: "1.2"

Port and IP to listen on. Defaults to listening on all available IPs on port 9301:

    prometheus_squid_exporter_boynux_host: "0.0.0.0"
    prometheus_squid_exporter_boynux_port: 9301

### Statsd exporter variables

To enable [statsd_exporter](https://github.com/prometheus/statsd_exporter) include role task: statsd_exporter

The configuration content. The example below utilizes a file named 'statsd_exporter.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_statsd_exporter_cfg: '{{ lookup("file", "../files/statsd_exporter.yml") | from_yaml) }}'

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

The version of statsd_exporter to install. The source version defines the version as specified in version control:
    prometheus_statsd_exporter_version: "0.7.0"
    prometheus_statsd_exporter_src_version: "v0.7.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9102:

    prometheus_statsd_exporter_host: "0.0.0.0"
    prometheus_statsd_exporter_port: 9102

### Zookeeper exporter (infonova) variables

To enable [zookeeper_exporter](https://github.com/infonova/zookeeper_exporter) include role task: zookeeper_exporter

No binaries exist for zookeeper_exporter, so you must set either:

    # zookeeper_exporter only
    prometheus_zookeeper_exporter_infonova_fallback_to_build: true

    # Globally allow building where binaries fail to download or install
    prometheus_fallback_to_build: true

An array of additional flags to pass to the zookeeper_exporter daemon:

    prometheus_zookeeper_exporter_infonova_extra_opts: []

The version of zookeeper_exporter to install:
    prometheus_zookeeper_exporter_infonova_version: "1.1"

Port and IP to listen on. Defaults to listening on all available IPs on port 9114:

    prometheus_zookeeper_exporter_infonova_host: "0.0.0.0"
    prometheus_zookeeper_exporte_infonovar_port: 9114

## Example Playbook

### Prometheus server
The following example installs Prometheus (server), alertmanager, blackbox_exporter, and the node_exporter. The Prometheus (server) port and storage retention parameters have been changed from the defaults.

The Prometheus server should be installed only on designated Prometheus server hosts. Prometheus clients should only have select and specific exporters installed.

Class use method:

``` yaml
- hosts: prometheus_servers
  vars:
    prometheus_components:
      - prometheus
      - alertmanager
      - blackbox_exporter
      - node_exporter
    prometheus_port: 10000
    prometheus_extra_opts:
     - '--storage.tsdb.retention=90d'
  roles:
    - mesaguy.prometheus
```

Longer 'include_role' use method:

``` yaml
- hosts: prometheus_servers
  vars:
    prometheus_port: 10000
    prometheus_extra_opts:
     - '--storage.tsdb.retention=90d'
  tasks:
  - name: Prometheus server
    include_role:
      name: mesaguy.prometheus
      tasks_from: '{{ prometheus_component }}'
    loop_control:
      loop_var: prometheus_component
    with_items:
      - prometheus
      - alertmanager
      - blackbox_exporter
      - node_exporter
```

## Additional information
### Software installation methods
Installations are performed using pre-compiled binary files where possible. Where pre-compiled binaries are not available, this Ansible role:

 1. Installs the tools necessary to compile the binaries
 2. Compiles the binaries
 3. Installs the binaries in a directory specifying both the version of the Prometheus software and version of go utilized for the installation (ie: /opt/prometheus/exporters/zookeeper_exporter/1.1__go-1.10.3/zookeeper_exporter)

If a binary fails to install or is unavailable despite the existence of some pre-compiled binaries, then the Prometheus module will still be installed using source code.

### Security
This module does not manage firewall rules, employ https, or employ authentication to secure the Prometheus software. All of these security measures are worthwhile, but are currently outside the scope of this role.

We closely monitor the release of new Prometheus software as well as the Go compiler and release new versions of this Ansible role accordingly.

All daemons are run via a non-privileged 'prometheus' user by default.

When Prometheus software is installed using source code, the installation destination directory is named for both the Prometheus software version and the Go compiler version. This naming convention ensures that the use of newer versions of the Go compiler force a rebuild of the Prometheus modules build from source. This naming convention also differentiate installations by binary versus installations by compiled source. Forcing Prometheus source rebuilds each time a new version of Go is released has the negative of introducing more work by the clients, but have the benefit of ensuring that and vulnerabilities within the Go core libraries are patched. We assume that Prometheus software that is provided in binary form is monitored for vulnerabilities by the developer and rebuilt as necessary.

Future: When source is compiled, all compile commands are executed using an unprivileged user account. This combined with running daemons as an unprivileged user mitigates many security risks. -- This is currently complicated by limits with [become](https://docs.ansible.com/ansible/latest/user_guide/become.html)

## License
MIT
See the [LICENSE](https://github.com/mesaguy/ansible-prometheus/blob/master/LICENSE) file

## Author Information
Mesaguy
 - https://mesaguy.com
 - https://github.com/mesaguy/ansible-prometheus
