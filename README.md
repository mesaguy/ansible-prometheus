# Ansible Prometheus
[![Build Status](https://api.travis-ci.org/mesaguy/ansible-prometheus.svg?branch=master)](https://travis-ci.org/mesaguy/ansible-prometheus) ![Latest tag](https://img.shields.io/github/v/tag/mesaguy/ansible-prometheus) ![Ansible Galaxy](https://img.shields.io/badge/ansible%20galaxy-mesaguy.prometheus-blue.svg?style=flat) ![MIT License](https://img.shields.io/github/license/mesaguy/ansible-prometheus)


Installs and manages [Prometheus server](https://prometheus.io), [Alertmanager](https://prometheus.io/docs/alerting/latest/overview/), [PushGateway](https://github.com/prometheus/pushgateway/blob/master/README.md), and numerous [Prometheus exporters](https://prometheus.io/docs/instrumenting/exporters/)

This role was designed to allow adding new exporters with ease. Regular releases ensure it always provides the latest Prometheus software.

This role can register client exporters with the Prometheus server/s automatically (see tgroup management below).

## Requirements

- Ansible >= 2.8.0
- Facts must be gathered (gather_facts: true)

## Supported Software and Operating Systems
### Supported Operating Systems, Distributions, and Architectures
This module is intended to support as many distributions and architectures as possible. The following table specifies which combinations are currently tested. Most exporters will also work on ARM architectures:

| OS             | Release                                 | Architectures     |
|----------------|-----------------------------------------|-------------------|
|Alpine          |3.2 through 3.11, edge                   | x86_64 (amd64)    |
|AmazonLinux     |1 and 2                                  | x86_64 (amd64)    |
|ArchLinux       |Current                                  | x86_64 (amd64)    |
|Enterprise Linux|6, 7, 8                                  | x86_64 (amd64)    |
|Fedora          |20 through 31, rawhide                   | x86_64 (amd64)    |
|Gentoo (openrc) |Current                                  | x86_64 (amd64)    |
|Gentoo (systemd)|Current                                  | x86_64 (amd64)    |
|OpenSUSE        |13.1 through tumbleweed                  | x86_64 (amd64)    |
|Oracle Linux    |6, 7, 8                                  | x86_64 (amd64)    |
|Ubuntu          |16.04 through 20.04                      | x86_64 (amd64)    |

### Managed Prometheus software
The following core Prometheus software is supported in addition to the list of exporters below. This software is fully tested on all supported OS, distributions, and architectures.

| Prometheus software                                       | Usage                                     | Author     | CI tested |
|-----------------------------------------------------------|:-----------------------------------------:|:----------:|:---------:|
|[prometheus](https://github.com/prometheus/prometheus)     | [usage](#prometheus-server-configuration) | prometheus | Yes       |
|[alertmanager](https://github.com/prometheus/alertmanager) | [usage](docs/alertmanager.md)             | prometheus | Yes       |
|[push_gateway](https://github.com/prometheus/pushgateway)  | [usage](docs/pushgateway.md)              | prometheus | Yes       |

### Managed exporters
All exporters are verified to install. Currently select modules receive testing via CI (Continuous Integration) and [Inspec](https://github.com/inspec/inspec)

See each exporter's usage page for more details:

| Exporter                                                                                            | Usage                                                       | Author               | CI tested |
|-----------------------------------------------------------------------------------------------------|:-----------------------------------------------------------:|:--------------------:|:---------:|
|[389ds_exporter_terrycain](https://github.com/terrycain/389ds_exporter)                              | [usage](docs/389ds_exporter_terrycain.md)                   | terrycain            | Yes       |
|[apache_exporter_lusitaniae](https://github.com/Lusitaniae/apache_exporter)                          | [usage](docs/apache_exporter_lusitaniae.md)                 | Lusitaniae           | Yes       |
|[aerospike_exporter_alicebob](https://github.com/alicebob/asprom)                                    | [usage](docs/aerospike_exporter_alicebob.md)                | alicebob             | Yes       |
|[bigip_exporter_expressenab](https://github.com/ExpressenAB/bigip_exporter)                          | [usage](docs/bigip_exporter_expressenab.md)                 | ExpressenAB          | Yes       |
|[bind_exporter_prometheus_community](https://github.com/prometheus-community/bind_exporter)          | [usage](docs/bind_exporter_prometheus_community.md)         | prometheus-community | Partial   |
|[blackbox_exporter](https://github.com/prometheus/blackbox_exporter)                                 | [usage](docs/blackbox_exporter.md)                          | prometheus           | Yes       |
|[ceph_exporter_digitalocean](https://github.com/digitalocean/ceph_exporter)                          | [usage](docs/ceph_exporter_digitalocean.md)                 | digitalocean         | Partial   |
|[clickhouse_exporter_perconalab](https://github.com/Percona-Lab/clickhouse_exporter)                 | [usage](docs/clickhouse_exporter_perconalab.md)             | perconalab           | Yes       |
|[cloudwatch_exporter](https://github.com/prometheus/cloudwatch_exporter)                             | [usage](docs/cloudwatch_exporter.md)                        | prometheus           | Partial   |
|[collectd_exporter](https://github.com/prometheus/collectd_exporter)                                 | [usage](docs/collectd_exporter.md)                          | prometheus           | Yes       |
|[consul_exporter](https://github.com/prometheus/consul_exporter)                                     | [usage](docs/consul_exporter.md)                            | prometheus           | Yes       |
|[couchbase_exporter_blakelead](https://github.com/blakelead/couchbase_exporter)                      | [usage](docs/couchbase_exporter_blakelead.md)               | leansys-team         | Yes       |
|[couchdb_exporter_gesellix](https://github.com/gesellix/couchdb-prometheus-exporter)                 | [usage](docs/couchdb_exporter_gesellix.md)                  | gesellix             | Yes       |
|[digitalocean_exporter_metalmatze](https://github.com/metalmatze/digitalocean_exporter)              | [usage](docs/digitalocean_exporter_metalmatze.md)           | metalmatze           | Yes       |
|[dockerhub_exporter_promhippie](https://github.com/promhippie/dockerhub_exporter)                    | [usage](docs/dockerhub_exporter_promhippie.md)              | promhippie           | Yes       |
|[elasticsearch_exporter_justwatchcom](https://github.com/justwatchcom/elasticsearch_exporter)        | [usage](docs/elasticsearch_exporter_justwatchcom.md)        | justwatchcom         | Yes       |
|[fping_exporter_schweikert](https://github.com/schweikert/fping-exporter)                            | [usage](docs/fping_exporter_schweikert.md)                  | schweikert           | Yes       |
|[gluster_exporter_ofesseler](https://github.com/ofesseler/gluster_exporter)                          | [usage](docs/gluster_exporter_ofesseler.md)                 | ofesseler            | Yes       |
|[graphite_exporter](https://github.com/prometheus/graphite_exporter)                                 | [usage](docs/graphite_exporter.md)                          | prometheus           | Yes       |
|[grok_exporter_fstab](https://github.com/fstab/grok_exporter)                                        | [usage](docs/grok_exporter_fstab.md)                        | fstab                | Yes       |
|[haproxy_exporter](https://github.com/prometheus/haproxy_exporter)                                   | [usage](docs/haproxy_exporter.md)                           | prometheus           | Yes       |
|[influxdb_exporter](https://github.com/prometheus/influxdb_exporter)                                 | [usage](docs/influxdb_exporter.md)                          | prometheus           | Yes       |
|[ipmi_exporter_soundcloud](https://github.com/soundcloud/ipmi_exporter)                              | [usage](docs/ipmi_exporter_soundcloud.md)                   | soundcloud           | Yes       |
|[iperf3_exporter_edgard](https://github.com/edgard/iperf3_exporter)                                  | [usage](docs/iperf3_exporter_edgard)                        | edgard               | Yes       |
|[iptables_exporter_retailnext](https://github.com/retailnext/iptables_exporter)                      | [usage](docs/iptables_exporter_retailnext.md)               | retailnext           | Yes       |
|[jmx_exporter](https://github.com/prometheus/jmx_exporter)                                           | [usage](docs/jmx_exporter.md)                               | prometheus           | No        |
|[kafka_exporter_danielqsj](https://github.com/danielqsj/kafka_exporter)                              | [usage](docs/kafka_exporter_danielqsj.md)                   | danielqsj            | Partial   |
|[keepalived_exporter_gen2brain](https://github.com/gen2brain/keepalived_exporter)                    | [usage](docs/keepalived_exporter_gen2brain.md)              | gen2brain            | Yes       |
|[memcached_exporter](https://github.com/prometheus/memcached_exporter)                               | [usage](docs/memcached_exporter.md)                         | prometheus           | Yes       |
|[mongodb_exporter_percona](https://github.com/percona/mongodb_exporter)                              | [usage](docs/mongodb_exporter_percona.md)                   | percona              | Yes       |
|[mysqld_exporter](https://github.com/prometheus/mysqld_exporter)                                     | [usage](docs/mysqld_exporter.md)                            | prometheus           | Partial   |
|[nginx_exporter_nginxinc](https://github.com/nginxinc/nginx-prometheus-exporter)                     | [usage](docs/nginx_exporter_nginxinc.md)                    | nginxinc             | Partial   |
|[node_exporter](https://github.com/prometheus/node_exporter)                                         | [usage](docs/node_exporter.md)                              | prometheus           | Yes       |
|[ntp_exporter_sapcc](https://github.com/sapcc/ntp_exporter)                                          | [usage](docs/ntp_exporter_sapcc.md)                         | sapcc                | Yes       |
|[nvidia_exporter_bugroger](https://github.com/BugRoger/nvidia-exporter)                              | [usage](docs/nvidia_exporter_bugroger.md)                   | BugRoger             | Partial   |
|[nvidia_gpu_exporter_mindprince](https://github.com/mindprince/nvidia_gpu_prometheus_exporter)       | [usage](docs/nvidia_gpu_exporter_mindprince.md)             | mindprince           | Partial   |
|[openldap_exporter_tomcz](https://github.com/tomcz/openldap_exporter)                                | [usage](docs/openldap_exporter_tomcz.md)                    | tomcz                | Yes       |
|[openvpn_exporter_kumina](https://github.com/kumina/openvpn_exporter)                                | [usage](docs/openvpn_exporter_kumina.md)                    | kumina               | Partial   |
|[phpfpm_exporter_hipages](https://github.com/hipages/php-fpm_exporter)                               | [usage](docs/phpfpm_exporter_hipages.md)                    | hipages              | Yes       |
|[ping_exporter_czerwonk](https://github.com/czerwonk/ping_exporter)                                  | [usage](docs/ping_exporter_czerwonk.md)                     | czerwonk             | Yes       |
|[postgres_exporter_prometheus_community ](https://github.com/prometheus-community/postgres_exporter) | [usage](docs/postgres_exporter_prometheus_community.md)     | prometheus-community | Yes       |
|[powerdns_exporter_ledgr](https://github.com/ledgr/powerdns_exporter)                                | [usage](docs/powerdns_exporter_ledgr.md)                    | ledgr                | Partial   |
|[process_exporter_ncabatoff](https://github.com/ncabatoff/process-exporter)                          | [usage](docs/process_exporter_ncabatoff.md)                 | ncabatoff            | Yes       |
|[proxysql_exporter_percona](https://github.com/percona/proxysql_exporter)                            | [usage](docs/proxysql_exporter_percona.md)                  | percona              | Yes       |
|[rabbitmq_exporter_kbudde](https://github.com/kbudde/rabbitmq_exporter)                              | [usage](docs/rabbitmq_exporter_kbudde.md)                   | kbudde               | Yes       |
|[redis_exporter_oliver006](https://github.com/oliver006/redis_exporter)                              | [usage](docs/redis_exporter_oliver006.md)                   | oliver006            | Yes       |
|[script_exporter_adhocteam](https://github.com/adhocteam/script_exporter)                            | [usage](docs/script_exporter_adhocteam.md)                  | adhocteam            | Yes       |
|[smokeping_exporter_superq](https://github.com/SuperQ/smokeping_prober)                              | [usage](docs/smokeping_exporter_superq.md)                  | SuperQ               | Yes       |
|[snmp_exporter](https://github.com/prometheus/snmp_exporter)                                         | [usage](docs/snmp_exporter.md)                              | prometheus           | Yes       |
|[sql_exporter_free](https://github.com/free/sql_exporter)                                            | [usage](docs/sql_exporter_free.md)                          | free                 | Yes       |
|[squid_exporter_boynux](https://github.com/boynux/squid-exporter)                                    | [usage](docs/squid_exporter_boynux.md)                      | boynux               | Yes       |
|[ssl_exporter_ribbybibby](https://github.com/ribbybibby/ssl_exporter)                                | [usage](docs/ssl_exporter_ribbybibby.md)                    | ribbybibby           | Yes       |
|[statsd_exporter](https://github.com/prometheus/statsd_exporter)                                     | [usage](docs/statsd_exporter.md)                            | prometheus           | Yes       |
|[wireguard_exporter_mdlayher](https://github.com/mdlayher/wireguard_exporter)                        | [usage](docs/wireguard_exporter_mdlayher.md)                | mdlayher             | Partial   |
|[zookeeper_exporter_infonova](https://github.com/infonova/zookeeper_exporter)                        | [usage](docs/zookeeper_exporter_infonova.md)                | infonova             | Yes       |

### Managed node_exporter textfiles scripts
Numerous node_exporter textfiles scripts are supported and can be installed via the following variables. These scripts are installed under '/opt/prometheus/scripts' by default:

| node_exporter textfiles script                                                                                                           | Source                     | Enable variable                           |
|------------------------------------------------------------------------------------------------------------------------------------------|----------------------------|--------------------------------------------|
|[apt.sh](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/apt.sh)                             | node_exporter examples     | prometheus_script_apt: true                |
|[btrfs_stats.py](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/btrfs_stats.py)             | node_exporter examples     | prometheus_script_btrfs_stats: true        |
|[deleted_libraries.py](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/deleted_libraries.py) | node_exporter examples     | prometheus_script_deleted_libraries: true  |
|[directory-size.sh](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/directory-size.sh)       | node_exporter examples     | prometheus_script_directory_size: true     |
|[inotify-instances](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/inotify-instances)       | node_exporter examples     | prometheus_script_inotify_instances: true  |
|[ipmitool](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/ipmitool)                         | node_exporter examples     | prometheus_script_ipmitool: true           |
|[lvm-prom-collector](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/lvm-prom-collector)     | node_exporter examples     | prometheus_script_lvm_prom_collector: true |
|[md_info.sh](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/md_info.sh)                     | node_exporter examples     | prometheus_script_md_info: true            |
|[md_info_detail.sh](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/md_info_detail.sh)       | node_exporter examples     | prometheus_script_md_info_detail: true     |
|[mellanox_hca_temp](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/mellanox_hca_temp)       | node_exporter examples     | prometheus_script_mellanox_hca_temp: true  |
|[multipathd_info](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/multipathd_info)           | node_exporter examples     | prometheus_script_multipathd_info: true    |
|[ntpd_metrics.py](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/ntpd_metrics.py)           | node_exporter examples     | prometheus_script_ntpd_metrics: true       |
|[nvme_metrics.sh](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/nvme_metrics.sh)           | node_exporter examples     | prometheus_script_nvme_metrics: true       |
|[pacman.sh](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/pacman.sh)                       | node_exporter examples     | prometheus_script_pacman: true             |
|[promcron.sh](https://github.com/mesaguy/ansible-prometheus/blob/master/scripts/promcron.sh)                                              | mesaguy/ansible-prometheus | prometheus_script_promcron: true           |
|[promrun.sh](https://github.com/mesaguy/ansible-prometheus/blob/master/scripts/promrun.sh)                                                | mesaguy/ansible-prometheus | prometheus_script_promrun: true            |
|[smartmon.py](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/smartmon.py)                   | node_exporter examples     | prometheus_script_smartmon_python: true    |
|[smartmon.sh](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/smartmon.sh)                   | node_exporter examples     | prometheus_script_smartmon: true           |
|[sssd_check.sh](https://github.com/mesaguy/ansible-prometheus/blob/master/scripts/sssd_check.sh)                                          | mesaguy/ansible-prometheus | prometheus_script_sssd_check: true         |
|[storcli.py](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/storcli.py)                     | node_exporter examples     | prometheus_script_storcli: true            |
|[tw_cli.py](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/tw_cli.py)                       | node_exporter examples     | prometheus_script_tw_cli: true             |
|[yum.sh](https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/blob/master/yum.sh)                             | node_exporter examples     | prometheus_script_yum: true                |

## Role Variables
A 'prometheus_components' array variable is used to specify the Prometheus software to install. This example installs all supported prometheus_components:

``` yaml
# Demonstration only. Clients should only have applicable software and exporters defined:
prometheus_components:
 # Core components:
 - alertmanager
 - prometheus
 - push_gateway
 # Exporters
 - 389ds_exporter_terrycain
 - apache_exporter_lusitaniae
 - aerospike_exporter_alicebob
 - bigip_exporter_expressenab
 - bind_exporter_prometheus_community
 - blackbox_exporter
 - ceph_exporter_digitalocean
 - clickhouse_exporter_perconalab
 - cloudwatch_exporter
 - collectd_exporter
 - consul_exporter
 - couchbase_exporter_blakelead
 - couchdb_exporter_gesellix
 - digitalocean_exporter_metalmatze
 - dockerhub_exporter_promhippie
 - elasticsearch_exporter_justwatchcom
 - fping_exporter_schweikert
 - gluster exporter_ofesseler
 - graphite_exporter
 - grok_exporter_fstab
 - haproxy_exporter
 - influxdb_exporter
 - iperf3_exporter_edgard
 - ipmi_exporter_soundcloud
 - iptables_exporter_retailnext
 - jmx_exporter
 - kafka_exporter_danielqsj
 - keepalived_exporter_gen2brain
 - memcached_exporter
 - mysqld_exporter
 - nginx_exporter_nginxinc
 - node_exporter
 - ntp_exporter_sapcc
 - nvidia_exporter_bugroger
 - nvidia_gpu_exporter_mindprince
 - openldap_exporter_tomcz
 - openvpn_exporter_kumina
 - phpfpm_exporter_hipages
 - ping_exporter_czerwonk
 - postgres_exporter_prometheus_community
 - powerdns_exporter_ledgr
 - process_exporter_ncabatoff
 - proxysql_exporter_percona
 - rabbitmq_exporter_kbudde
 - redis_exporter_oliver006
 - script_exporter_adhocteam
 - smokeping_exporter_superq
 - snmp_exporter
 - sql_exporter_free
 - squid_exporter_boynux
 - ssl_exporter_ribbybibby
 - statsd_exporter
 - wireguard_exporter_mdlayher
 - zookeeper_exporter_infonova
```

### Mesaguy script documentation

- [promcron](https://github.com/mesaguy/ansible-prometheus/blob/master/docs/promcron.md) for monitoring the execution of cron jobs
- [promrun](https://github.com/mesaguy/ansible-prometheus/blob/master/docs/promrun.md) for monitoring the execution of commands
- [sssd_check](https://github.com/mesaguy/ansible-prometheus/blob/master/docs/sssd_check.md) for monitoring the status of SSSD

### Common variables

By default, if a Prometheus software or exporter binary fails to install, the installation fails. This default can be overridden causing an installation via source by setting the global 'prometheus_fallback_to_build' boolean or a software specific override. For example, to allow the blackbox_exporter to be built from source if no binary can be found set:

    prometheus_blackbox_exporter_fallback_to_build: true

All daemon installer tasks have a 'runas' parameter to specify which user the daemon will run as. By default all users run as the 'prometheus_user' (defaults to: prometheus). For example, to have the blackbox_exporter run as user 'test' set the following variable:

    prometheus_blackbox_exporter_runas: test

### Global variables

Link the Prometheus etc directory to '/etc/prometheus'. The Prometheus etc directory defaults to '/opt/prometheus/etc':

    prometheus_link_etc: true

Attempt to force the etc directory symlink referenced above:

    prometheus_link_etc_force: false

Install the 'sponge' utility. [Recommended by the Prometheus project](https://github.com/prometheus/node_exporter/tree/master/text_collector_examples) when writing to node_exporter's textfile directory. The EPEL repository is required if installing on a Red Hat Enterprise Linux derivative. CentOS 8.x requires the 'CentOS-PowerTools' yum repository, OracleLinux 7 requires the 'ol7_optional_archive' repository,  and Red Hat Enterprise Linux 8 requires the 'Red Hat CodeReady Linux Builder' yum repository be enabled:

    prometheus_install_sponge: false

Purge old and now orphaned versions of software:

    prometheus_purge_orphans: false

Purge backups of prometheus configuration files from the prometheus 'etc' directory files after 'prometheus_etc_backup_max_age' days (Default: 31d). Option 'prometheus_etc_purge_backups' defaults to 'false':

    prometheus_etc_purge_backups: true
    prometheus_etc_backup_max_age: 31d

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

Create the Prometheus user and group as system accounts, defaults to 'false':

    prometheus_group_is_system: true
    prometheus_user_is_system: true

Configure ulimits for 'prometheus' user:

    prometheus_configure_ulimits: false
    prometheus_ulimit_hard_nofile: 8192
    prometheus_ulimit_soft_nofile: 4096

If installing a Prometheus application binary fails, fall back to installing the Prometheus software via source. Installation from source generally requires installing compilers. It is also possible to enable 'fallback_to_build' on a case-by-case basis (ie: prometheus_blackbox_exporter_fallback_to_build: true):

    prometheus_fallback_to_build: false

Go version to use when building Prometheus software:

    prometheus_go_version: 1.13.10

The Prometheus etc directory, defaults to '/opt/prometheus/etc':

    prometheus_etc_dir: "{{ prometheus_root_dir }}/etc"

The root directory in which exporters are installed, defaults to '/opt/prometheus/exporters':

    prometheus_exporters_dir: "{{ prometheus_root_dir }}/exporters"

The root directory in which 'go' is installed. Go is only installed if Prometheus software is being installed from source. Defaults to '/opt/prometheus/go':

    prometheus_go_dir: "{{ prometheus_root_dir }}/go"

The directory in which logs are created. Systems using journalctl will generally log to journalctl instead of files:

    prometheus_log_dir: "/var/log/prometheus"

The directory to use for temporary space, principally when building Prometheus software. Defaults to '/opt/prometheus/tmp':

    prometheus_tmp_dir: "{{ prometheus_root_dir }}/tmp"

The directory to use when storing persistent Prometheus data (ie: The Prometheus server's data), defaults to '/opt/prometheus/var':

    prometheus_var_dir: "{{ prometheus_root_dir }}/var"

Optionally disable symlink of tool applications (amtool, promtool, etc) to /usr/local/bin. Defaults to 'true':

    prometheus_symlink_tools: false

Cache downloaded software on the Ansible host and push cached software to the remote hosts Ansible is configuring. Defaults to disabled via 'false':

    prometheus_local_archive: true
    prometheus_local_archive_dir: ../archive/prometheus

### Prometheus rule management variables

Enable management of Prometheus 'rules':

    prometheus_manage_rules: true

Local location to find rules files, defaults to empty (disabled):

    prometheus_rules_source_dirs:
     - ../files/prometheus/rules
     - ../files/prometheus/additional_rules

Ownership and permissions of rules files, defaults:

    prometheus_rules_dir_mode: 0755
    prometheus_rules_file_mode: 0644
    prometheus_rules_group: '{{ prometheus_group }}' # prometheus
    prometheus_rules_owner: '{{ prometheus_user }}'  # prometheus

Purge backups of rules files after 'prometheus_rules_backup_max_age' days (Default: 90d). Option 'prometheus_rules_purge_backups' defaults to 'false':

    prometheus_rules_purge_backups: true
    prometheus_rules_backup_max_age: 90d

Purge undefined (orphaned) rules from Prometheus servers. Defaults to 'false':

    prometheus_rules_purge_orphans: true

### Prometheus log rotation variables

Log rotation is disabled by default, but can be configured simply using the following variables. Log rotation is configured for all *.log files in the Prometheus log directory (ie: /var/log/prometheus/*.log).

Enable installing a prometheus log rotation script. Defaults to 'false':

    prometheus_logrotate: true

Number of log rotation (days) to keep:

    prometheus_logrotate_count: 31

Boolean specifying whether logs should be compressed:

    prometheus_logrotate_compress: true

Log rotation configuration file directory:

    prometheus_logrotate_dir: /etc/logrotate.d

### Prometheus client variables

Cause all Prometheus servers defined in a 'prometheus_servers' array/list variable to verify connectivity to each of the client's exporters:

    prometheus_software_server_side_connect_test: true

Configure firewalld rules to permit server IPs defined in a 'prometheus_server_ips' array/list variable to connect to each of the client's exporters. This functionality requires that the python 'netaddr' module be installed (ie: `yum install -y python-netaddr` or `dnf install -y python-netaddr` or `pip install netaddr`). Only enable this variable on servers that use firewalld, otherwise the task will fail:

    prometheus_manage_client_firewalld: true
    # Optionally set:
    prometheus_firewalld_zone: public

If firewalld customization is required, one can add firewalld rules using a playbook as follows:

    - name: Allow incoming prometheus server connections to node_exporter
      become: true
      firewalld:
        immediate: true
        port: 9100/tcp
        permanent: true
        source: "{{ item }}"
        state: enabled
        zone: public
      with_items: "{{ prometheus_server_ips }}"
      when: uses_firewalld is defined and 'node_exporter' in prometheus_components

Configure iptables rules to permit server IPs defined in a 'prometheus_server_ips' array/list variable to connect to each of the client's exporters. Only enable this variable on servers that use iptables, otherwise the task will fail:

    prometheus_manage_client_iptables: true

If [iptables_raw](https://github.com/Nordeus/ansible_iptables_raw) has been installed, you can enable the following variable:

    prometheus_manage_client_iptables_raw: true

This role can manage your Prometheus server 'target groups' (tgroups) automatically, dynamically creating tgroup files in a specified directory (/opt/prometheus/etc/tgroups by default) for each client exporter.

Automatic tgroup file management can be enabled for client side operation, server side operation, or both. In client mode, client's exporters are registered automatically on the Prometheus server specified in a 'prometheus_servers' array. In server mode, the inventory is parsed to determine which exporters are available on each host and *all* clients are registered with the server's specified in each client's 'prometheus_servers' array.

By default, client and server tgroups use 'inventory_hostname' (fqdn) and 'inventory_hostname_short' (hostname) values for server fqdn/hostnames and ignore facts. This is done because server-side population of tgroups cannot account for client's facts unless clients are configured to cache their facts. To use fact based 'ansible_fqdn' (fqdn) and 'ansible_hostname' (hostname) variables enable 'prometheus_tgroup_use_facts'. At this time, enabling 'prometheus_tgroup_use_facts' for any clients disables server side tgroup management:

    prometheus_tgroup_use_facts: true

To enable automatic tgroup file generation on the client side, you must define 'prometheus_manage_client_tgroups' as true and list your Prometheus servers in a 'prometheus_servers' variable in your Ansible variables or inventory. The following will create tgroup files in /opt/prometheus/etc/ansible_tgroups:

    prometheus_manage_client_tgroups: true
    prometheus_servers:
     - 'prometheus1'
     - 'prometheus2'
    # Optional, defaults to /opt/prometheus/etc/tgroups:
    prometheus_managed_tgroup_dir: '/opt/prometheus/etc/ansible_tgroups'

If this role is managing your tgroup files, you can apply labels to your exporter/s using the 'prometheus_tgroup_labels' variable:

``` yaml
- hosts: prometheus_clients
  vars:
    prometheus_components:
      - node_exporter
    prometheus_tgroup_labels:
      environment: development
      site: primary
  roles:
    - mesaguy.prometheus
```

Using 'set_fact' to do the same:

  - name: Set Prometheus labels for host
    set_fact:
      prometheus_tgroup_labels:
        environment: 'development'
        site: primary

Exporters that aren't managed by this role can be specified using a 'prometheus_additional_exporters' variable as follows. Any labels specified in 'prometheus_tgroup_labels' will be merged with labels defined in 'prometheus_additional_exporters'. Firewall rules will be created for additional exporters if 'prometheus_manage_client_firewalld' or 'prometheus_manage_client_iptables' is defined.

    prometheus_additional_exporters:
     - name: docker
       port: 9323
       labels: {}
     - name: foo
       port: 9999
       labels:
         team: foo
         department: IT


To enable automatic tgroup file generation on the server side, you must define 'prometheus_manage_server_tgroups' as true and list your Prometheus servers in a 'prometheus_servers' variable in your Ansible variables or inventory. The following will create tgroup files in /opt/prometheus/etc/ansible_tgroups for *all* clients that have 'prometheus_compenents' and/or 'prometheus_additional_exporters', clients must also have 'prometheus_servers' array configured:

    prometheus_manage_server_tgroups: true

To only configure server tgroups and perform no role tasks, enable 'prometheus_manage_server_tgroups_only':

``` yaml
- hosts: prometheus_servers
  vars:
    prometheus_manage_server_tgroups_only: true
  roles:
    - mesaguy.prometheus
```

Purge undefined (orphaned) exporters. When run in client mode, this option only effects client's orphaned files. When run in server mode this affects all tgroup files:

    prometheus_tgroup_dir_purge_orphans: true

Specify a FQDN for a host when the FQDN isn't in Ansible's inventory and isn't the host's official FQDN. This option should be generally avoided, fixing DNS or Ansible's inventory is a better option:

    prometheus_override_fqdn: weird-hostname.example.org

### Prometheus server configuration

To enable [prometheus server](https://github.com/prometheus/prometheus) include role task: prometheus

Prometheus configuration files are validated using 'promtool' before Prometheus is restarted.

The configuration content. The example below utilizes a file named 'prometheus_server.yml' in your Ansible root directory's 'files' directory. If no configuration content is defined, a default configuration file is utilized. You will want to customize your configuration file content!:

    prometheus_server_cfg: '{{ lookup("file", "../files/prometheus_server.yml") | from_yaml }}'

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

An array of additional flags to pass to the prometheus daemon:

    prometheus_extra_opts: []

The version of Prometheus to install. The default version can be found in the [prometheus variables file](../vars/software/prometheus.yml) and the default version can be overridden using the following variable:

    prometheus_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_use_prerelease: true

Where to store Prometheus's database, defaults to /opt/prometheus/var/prometheus

    prometheus_storage_dir: /opt/prometheus/var/prometheus

Prometheus web console templates to utilize. The defaults suffice under most circumstances and this variable should remain unset under most circumstances:

    prometheus_web_console_libraries_dir: /opt/prometheus/prometheus/x.x.x/console_libraries
    prometheus_web_console_templates_dir: /opt/prometheus/prometheus/x.x.x/consoles

Port and IP to listen on. Defaults to listening on all available IPs on port 9090:

    prometheus_host: "0.0.0.0"
    prometheus_port: 9090

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
 - https://github.com/mesaguy
