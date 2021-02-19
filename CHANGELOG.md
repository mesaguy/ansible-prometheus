# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.12.29] - 2021-02-19

### Added

- Allow creating "prometheus" user account and group at the system level

### Changed

- The postgres exporter name changed from postgres_exporter_wrouesnel to postgres_exporter_prometheus_community
- Upgrade Go from v1.14.14 to v1.15.8
- Upgrade Prometheus from v2.24.1 to v2.25.0
- Upgrade Prometheus (pre-release) from v2.24.0-rc.0 to v2.25.0-rc.0
- Upgrade cloudwatch from v0.9.0 to v0.10.0
- Upgrade jmx_exporter from v0.14.0 to v0.15.0
- Upgrade node_exporter v1.0.1 to v1.1.1
- Upgrade redis_exporter_oliver006 from v1.15.1 to v1.17.0
- Upgrade smokeping_exporter_superq from v0.3.1 to v0.4.1
- Upgrade snmp_exporter v0.19.0 to v0.20.0
- Upgrade statsd_exporter from v0.19.0 to v0.20.0
- Update metadata to include latest master commits
- Numerous test changes

## [0.12.28] - 2021-01-25

### Changed

- Upgrade Go from v1.14.13 to v1.14.14
- Upgrade Prometheus from v2.24.0 to v2.24.1
- Upgrade influxdb_exporter from v0.7.0 to v0.8.0
- Upgrade node-exporter textfile collector scripts:
  - btrfs_stats.py
- Upgrade rabbitmq_exporter_kbudde from v1.0.0-RC7 to v1.0.0-RC8
- Upgrade rabbitmq_exporter_kbudde prerelease from v1.0.0-RC6.1 to v1.0.0-RC9
- Upgrade pushgateway from v1.3.1 to v1.4.0
- Upgrade statsd_exporter from v0.18.0 to v0.19.0
- Update metadata to include latest master commits

## [0.12.27] - 2021-01-17

### Added

- Per [urusha](https://github.com/urusha), add option to customize the mode of jmx configuration files via prometheus_jmx_exporter_cfg_mode.

### Changed

- Upgrade node-exporter textfile collector scripts:
  - apt.sh
  - mellanox_hca_temp
  - smartmon.py
  - storcli.py
- Upgrade bind_exporter_prometheus_community from v0.3.0 to v0.4.0
- Upgrade phpfpm_exporter_hipages from v2.0.0 to v2.0.1
- Upgrade redis_exporter_oliver006 from v1.15.0 to v1.15.1
- Update metadata to include latest master commits

## [0.12.26] - 2021-01-08

### Added

- lvm-prom-collector from node-exporter textfile collector scripts

### Changed

- Upgrade Prometheus from v2.23.0 to v2.24.0
- Upgrade Prometheus (pre-release) from v2.23.0-rc.0 to v2.24.0-rc.0
- Upgrade couchdb_exporter_gesellix from v29.3.1 to v30.0.0
- Upgrade pushgateway from v1.3.0 to v1.3.1
- Upgrade redis_exporter_oliver006 from v1.14.0 to v1.15.0
- Upgrade node-exporter textfile collector scripts to latest versions
- Update metadata to include latest master commits

### Removed

- Content tests from scripts

## [0.12.25] - 2020-12-12

### Changed

- Upgrade Go from v1.14.12 to v1.14.13
- Upgrade Prometheus from v2.22.2 to v2.23.0
- Upgrade Prometheus (pre-release) from v2.22.0-rc.0 to v2.23.0-rc.0
- Upgrade couchdb_exporter_gesellix from v29.3.0 to v29.3.1
- Upgrade haproxy_exporter from v0.11.0 to v0.12.0
- Upgrade influxdb_exporter from v0.6.0 to v0.7.0
- Upgrade memcached_exporter from v0.7.0 to v0.8.0
- Upgrade mongodb_exporter_percona from v0.11.2 to v0.20.1
- Upgrade openldap_exporter_tomcz from v2.0 to v2.1
- Upgrade phpfpm_exporter_hipages from v1.2.1 to v2.0.0
- Upgrade redis_exporter_oliver006 from v1.13.1 to v1.14.0
- Upgrade ssl_exporter_ribbybibby from v2.1.1 to v2.2.0
- Update metadata to include latest master commits

## [0.12.24] - 2020-11-19

### Changed

- Upgrade Go from v1.14.10 to v1.14.12
- Upgrade Prometheus from v2.22.0 to v2.22.2
- Upgrade influxdb_exporter from v0.5.0 to v0.6.0
- Upgrade phpfpm_exporter_hipages from v1.1.1 to v1.2.1
- Upgrade ping_exporter_czerwon from v0.44 (v0.4.0?) to v0.4.5
- Upgrade process_exporter_ncabatoff from v0.7.2 to v0.7.5
- Upgrade redis_exporter_oliver006 from v1.12.1 to v1.13.1
- Update metadata to include latest master commits
- Update ping_exporter_czerwon default options to match new required syntax

## [0.12.23] - 2020-10-28

### Changed

- Upgrade Go from v1.14.9 to v1.14.10
- Upgrade Prometheus from v2.21.0 to v2.22.0
- Upgrade Prometheus (pre-release) from v2.21.0-rc.1 to v2.22.0-rc.0
- Upgrade ipmi_exporter_soundcloud from v1.3.0 to v1.3.1
- Upgrade blackbox_exporter v0.17.0 to v0.18.0
- Upgrade couchdb_exporter_gesellix from v29.2.0 to v29.3.0
- Upgrade redis_exporter_oliver006 from v1.12.0 to v1.12.1
- Update metadata to include latest master commits

### Fixed

- Wrap lines longer than 160c to pacify Galaxy
- prometheus_node_exporter_textfiles_directory definitions work again

## [0.12.22] - 2020-10-06

### Added

- Add retries to scripts/sssd_check.sh script
- Add [iptables_raw module](https://github.com/Nordeus/ansible_iptables_raw) for ansible-lint

### Changed

- Upgrade Go from v1.13.15 to v1.14.9
- Upgrade couchdb_exporter_gesellix from v28.0.2 to v29.2.0
- Upgrade digitalocean_exporter_metalmatze from v0.6.0 to v0.6.1
- Upgrade grok_exporter_fstab from v1.0.0.RC4 (prerelease) to v1.0.0.RC5 (prerelease)
- Upgrade mongodb_exporter_percona from v0.11.1 to v0.20.0
- Upgrade pushgateway from v1.2.0 to v1.3.0
- Upgrade redis_exporter_oliver006 from v1.11.1 to v1.12.0
- Upgrade squid_exporter_boynux from v1.9.1 to v1.9.2
- Upgrade ssl_exporter_ribbybibby from v2.1.0 to v2.1.1
- Update metadata to include latest master commits
- Disable tests for Ansible run from Python 2.7
- Run tests using Python 3.8
- Allow setting of capabilities to fail on Gentoo due to Ansible bug

## [0.12.21] - 2020-09-17

### Changed

- Upgrade Prometheus from v2.20.1 to v2.21.0
- Upgrade Prometheus (pre-release) from v2.21.0-rc.0 to v2.21.0-rc.1
- Upgrade jmx_exporter from v0.13.0 to v0.14.0
- Upgrade keepalived_exporter_gen2brain from v0.4.0 to v0.5.0
- Upgrade ssl_exporter_ribbybibby from v2.0.0 to v2.1.0
- Update metadata to include latest master commits

## [0.12.20] - 2020-08-31

### Changed

- Expand ability to configure ping_exporter_czerwonk and document new configuration options
- Upgrade Prometheus (pre-release) from v2.20.0-rc.1 to v2.21.0-rc.0
- Upgrade cloudwatch from v0.8.0 to v0.9.0
- Upgrade couchdb_exporter_gesellix from v28.0.0 to v28.0.2
- Upgrade redis_exporter_oliver006 from v1.10.0 to v1.11.1
- Update metadata to include latest master commits

### Changed

## [0.12.19] - 2020-08-24

### Changed

- Upgrade influxdb_exporter from v0.4.2 to v0.5.0
- Upgrade mongodb_exporter_percona from v0.11.0 to v0.11.1
- Upgrade redis_exporter_oliver006 from v1.9.0 to v1.10.0
- Upgrade squid_exporter_boynux from v1.8.3 to v1.9.1
- Upgrade statsd_exporter from v0.17.0 to v0.18.0
- Upgrade apt.sh script to commit: 'd1d4362f90e5b90fe874b1224a5085b6708d9c1f'
- Upgrade lvm-prom-collector script to commit: 'a5417e40f505e205d6659577e0faa9751165e35d'
- Upgrade smartmon.py script to commit: 'af894802adb9d08b760321ff79db49034f260d49'
- Upgrade smartmon.sh script to commit: '98bbe398807585f7c55e2f3441704f0955f9f25e'
- Upgrade yum.sh script to commit: '57d05ce7ab752ec6795b452b1b660b736a32dcd5'
- Update metadata to include latest master commits

## [0.12.18] - 2020-08-07

### Changed

- Upgrade Go from v1.13.14 to v1.13.15
- Upgrade Prometheus from v2.20.0 to v2.20.1
- Upgrade digitalocean_exporter_metalmatze from v0.5 to v0.6.0
- Upgrade ntp_exporter_sapcc v1.1.3 to v2.0.0
- Upgrade process_exporter_ncabatoff from v0.7.1 to v0.7.2
- Update metadata to include latest master commits

## [0.12.17] - 2020-08-01

### Changed

- Upgrade couchdb_exporter_gesellix from v27.2.0 to v28.0.0
- Upgrade ipmi_exporter_soundcloud from v1.2.0 to v1.3.0
- Upgrade memcached_exporter from v0.6.0 to v0.7.0
- Upgrade yum.sh script to commit: '57d05ce7ab752ec6795b452b1b660b736a32dcd5'
- Update metadata to include latest master commits

## [0.12.16] - 2020-07-23

### Changed

- Upgrade Prometheus from v2.19.2 to v2.20.0
- Upgrade Prometheus (pre-release) from v2.20.0-rc.0 to v2.20.0-rc.1
- Upgrade consul_exporter from v0.7.0 to v0.7.1
- Upgrade graphite_exporter from v0.8.0 to v0.9.0
- Update metadata to include latest master commits

## [0.12.15] - 2020-07-17

### Changed

- Upgrade Go from v1.13.12 to v1.13.14
- Upgrade Prometheus (pre-release) from v2.19.0-rc.0 to v2.20.0-rc.0
- Upgrade ceph_exporter_digitalocean from 2.0.6-luminous to 2.0.7-luminous
- grok_exporter_fstab from v1.0.0.RC3 (prerelease) to v1.0.0.RC4 (prerelease)
- openvpn_exporter_kumina from v0.2.2 to v0.3.0
- Upgrade redis_exporter_oliver006 from v1.8.0 to v1.9.0
- Update metadata to include latest master commits

## [0.12.14] - 2020-06-27

### Changed

- Upgrade Prometheus from v2.19.1 to v2.19.2
- Upgrade ssl_exporter_ribbybibby from v1.0.1 to v2.0.0
- Upgrade statsd_exporter from v0.16.0 to v0.17.0
- Tighten permissions on configuration and service files from world readable to not world readable (Thanks [urusha](https://github.com/urusha) for starting this effort!)

## [0.12.13] - 2020-06-22

- Upgrade Prometheus from v2.19.0 to v2.19.1
- Upgrade blackbox_exporter v0.16.0 to v0.17.0
- Upgrade haproxy_exporter from v0.10.0 to v0.11.0
- Upgrade redis_exporter_oliver006 from v1.7.0 to v1.8.0
- Update metadata to include latest master commits
- Ensure all 'delegate_to: localhost' tasks use a "local" connection

## [0.12.12] - 2020-06-18

### Changed

- Upgrade alertmanager from v0.20.0 to v0.21.0
- Upgrade nginx_exporter_nginxinc from v0.7.0 to v0.8.0
- Upgrade node_exporter v1.0.0 to v1.0.1
- Upgrade ssl_exporter_ribbybibby from v1.0.0 to v1.0.1
- Update metadata to include latest master commits

## [0.12.11] - 2020-06-16

### Changed

- Upgrade Prometheus from v2.18.1 to v2.19.0
- Upgrade consul_exporter from v0.6.0 to v0.7.0
- Upgrade graphite_exporter from v0.7.1 to v0.8.0
- Upgrade influxdb_exporter from v0.4.1 to v0.4.2
- Upgrade redis_exporter_oliver006 from v1.6.1 to v1.7.0
- Update metadata to include latest master commits

## [0.12.10] - 2020-06-06

### Changed

- Upgrade Go from v1.13.10 to v1.13.12
- Upgrade Alertmanager (pre-release) from v0.20.0-rc.0 to v0.21.0-rc.0
- Upgrade Prometheus (pre-release) from v2.18.0-rc.1 to v2.19.0-rc.0
- Upgrade ntp_exporter_sapcc v1.1.2 to v1.1.3
- Upgrade smokeping_exporter_superq from v0.1.0 to v0.3.0
- Upgrade statsd_exporter from v0.15.0 to v0.16.0
- Update metadata to include latest master commits

## [0.12.9] - 2020-05-28

### Changed

- Upgrade node_exporter v0.18.1 to v1.0.0
- Upgrade snmp_exporter v0.17.0 to v0.18.0
- Update metadata to include latest master commits

## [0.12.8] - 2020-05-25

### Changed

- Upgrade aerospike_exporter_alicebob from v1.10.0 to v1.10.1
- Upgrade couchdb_exporter_gesellix from v27.1.1 v27.2.0
- Upgrade node_exporter (pre-release) from v1.0.0-rc.0 to v1.0.0-rc.1
- Upgrade process_exporter_ncabatoff from v0.6.0 to v0.7.1
- Update metadata to include latest master commits

## [0.12.7] - 2020-05-14

### Changed

- Upgrade aerospike_exporter_alicebob from v1.9.1 to v1.10.0
- Upgrade collectd_exporter from v0.4.0 to v0.5.0
- Upgrade graphite_exporter from v0.7.0 to v0.7.1
- Upgrade jmx_exporter from v0.12.0 to v0.13.0
- Upgrade redis_exporter_oliver006 from v1.6.0 to v1.6.1
- Update metadata to include latest master commits

## [0.12.6] - 2020-05-09

### Changed

- Upgrade Prometheus from v2.18.0 to v2.18.1
- Upgrade aerospike_exporter_alicebob from v1.9.0 to v1.9.1
- Update metadata to include latest master commits

## [0.12.5] - 2020-05-06

### Added

- Add the ability to specify a unique identifier to the .prom files created by promcron and promrun

### Changed

- Upgrade Prometheus from v2.17.2 to v2.18.0
- Upgrade promcron from v1.1 to v1.2
- Upgrade promrun from v0.2 to v0.3
- Update metadata to include latest master commits

## [0.12.4] - 2020-05-05

### Changed

- Expand JMX documentation
- Upgrade Prometheus (pre-release) from v2.18.0-rc.0 to v2.18.0-rc.1
- Upgrade influxdb_exporter from v0.4.0 to v0.4.1
- Upgrade redis_exporter_oliver006 from v1.5.3 to v1.6.0
- Upgrade wireguard_exporter_mdlayher from git master commit ed8c4677b34ff9f4ab456349fff8c4dad1a98f27 to release v0.1.2
- Update metadata to include latest master commits

### Fixed

- If no jmx configuration is specified, the default config is now empty instead of containing: ''

## [0.12.3] - 2020-04-29

### Changed

- Simplify OS architecture variable gathering
- Upgrade Prometheus (pre-release) from v2.17.0-rc.4 to v2.18.0-rc.0
- Update apache_exporter_lusitaniae documentation to reflect latest command line argument syntax
- Update metadata to include latest master commits

## [0.12.2] - 2020-04-23

### Changed

- Upgrade couchdb_exporter_gesellix from v27.0.0 v27.1.1
- Upgrade ipmi_exporter_soundcloud from v1.1.0 to v1.2.0
- Upgrade mongodb_exporter_percona from v0.10.0 to v0.11.0
- Upgrade nginx_exporter_nginxinc from v0.6.0 to v0.7.0
- Upgrade rabbitmq_exporter_kbudde from 0.29.0 to v1.0.0-RC7
- Update metadata to include latest master commits

## [0.12.1] - 2020-04-21

### Changed

- Upgrade Prometheus from v2.17.1 to v2.17.2
- Update metadata to include latest master commits

## [0.12.0] - 2020-04-20

### Added

- Ability to cache software on the Ansible host and push cached software to the remote hosts Ansible is configuring
- New exporters:
  - aerospike_exporter_alicebob, thanks [urusha](https://github.com/urusha)!
  - clickhouse_exporter_perconalab, thanks [urusha](https://github.com/urusha)!
  - dockerhub_exporter_promhippie
  - fping_exporter_schweikert
  - iperf3_exporter_edgard
  - ipmi_exporter_soundcloud
  - nginx_exporter_nginxinc
  - phpfpm_exporter_hipages, thanks [urusha](https://github.com/urusha)!
  - wireguard_exporter_mdlayher

### Changed

- Service environmental variables are now stored in a file separate from service (system .service files, etc). This is necessary for situations where passwords are stored inside the environmental variables. Improvement by [urusha](https://github.com/urusha).
- Source builds without Makefiles will now be retried if they fail

### Fixed

- Many Prometheus server options required prefixing their variables with an extra *prometheus_*, this requirement has been removed
- Specifying a custom software version that wasn't in metadata caused an error in some circumstances
- Numerous documentation fixes from [urusha](https://github.com/urusha).

## [0.11.4] - 2020-04-11

### Changed

- Upgrade redis_exporter_oliver006 from v1.5.2 to v1.5.3
- Update metadata to include latest master commits

## [0.11.4] - 2020-04-09

### Changed

- Upgrade Go from v1.13.9 to v1.13.10
- Upgrade apache_exporter_lusitaniae from v0.7.0 to v0.8.0
- Upgrade ntp_exporter_sapcc v1.1.1 to v1.1.2
- Upgrade script_exporter_adhocteam from v1.1.0 to v1.2.0
- Update metadata to include latest master commits

## [0.11.3] - 2020-03-27

### Changed

- Upgrade Prometheus from v2.17.0 to v2.17.1

## [0.11.2] - 2020-03-26

### Changed

- Upgrade Prometheus from v2.16.0 to v2.17.0
- Upgrade keepalived_exporter_gen2brain from v0.3.0 to v0.4.0
- Update metadata to include latest master commits

## [0.11.1] - 2020-03-20

### Changed

- Upgrade Go from v1.13.8 to v1.13.9

### Fixed

  - Specify 'mode' when downloading software to work around tight umasks

## [0.11.0] - 2020-03-19

### Added

- The 'mongodb_exporter_percona' exporter
- Ability to purge old 'etc' directory backups and node_exporter's textfile directory .prom files
- Ability to configure ulimits for the Prometheus user, all services are restarted if the ulimits change
- A 'socket' and/or 'host' can be defined for mysql_exporter's ~prometheus/.my.cnf file
- Support for managing Prometheus 'rules' files
- Validate the checksums of all exporter binaries
- Support for installing software prereleases
- A 'promrun_name' label to the start, end, and exit metrics outputted by the 'promrun' script. This is helpful when alerting on all promrun jobs
- A 'promcron_name' label to the end and exit metrics outputted by the 'promcron' script. This is helpful when alerting on all promcron jobs
- Ability to simply create cronjobs for Ansible scripts
- Option 'prometheus_override_fqdn' to specify a FQDN for a host when the FQDN isn't in Ansible's inventory and isn't the host's official FQDN
- Ability to specify packages needed to perform builds on a per-software basis
- Retry Git clones up to 5 times
- Retry all downloads up to 5 times

### Changed

- The 'prometheus_version' variable used to manually set the Prometheus software version has been renamed to 'prometheus_prometheus_version'
- The minimum supported version of Ansible is changed from v2.5.1 to v2.7.0 (oldest actively maintained major version)
- Upgrade:
  - couchdb_exporter_gesellix from v18 to v27.0.0
  - grok_exporter_fstab from v0.2.8 to v1.0.0.RC3 (prerelease)
  - nvidia_gpu_exporter_mindprince from commit 3897bdad246f3bc0e7105805d4442b9c9c7b06da to 0d52cd2f711ea00601b711d8127b8634b2844150
  - openldap_exporter_tomcz from v1.0 to v2.0
  - openvpn_exporter_kumina from v0.2.1 to v0.2.2
  - rabbitmq_exporter_kbudde from 0.28.0 to v1.0.0-RC6.1
  - redis_exporter_oliver006 from v1.4.0 to v1.5.2
  - script_exporter_adhocteam from v1.0.2 to v1.1.0
  - squid_exporter_boynux from v1.8.2 to v1.8.3
  - ssl_exporter_ribbybibby from v0.6.0 to v1.0.0
  - statsd_exporter from v0.14.1 to v0.15.0
- Prometheus and AlertManager are reloaded instead of restarted when configuration files change
- Ensure all references to Prometheus's 'etc' directory are to /opt/prometheus/etc instead of /etc/prometheus
- Utilize handlers for 'reloading' and 'restarting' activities. Simplifies tasks
- Migrate all exporter documentation to exporter specific files
- All GitHub source code downloads are now tarballs instead of git clones, this will ease caching in the next major release
- Internal (non-visible) changes:
  - Cleanup and improve enabling debug logging
  - Rework internal architecture string customization system and allow customization per project
  - Allow disabling the use of metadata for determining software binary URLs when testing
  - Add ability to exclude select software installations when testing
  - Specify which software requires being built
  - Add ability to require use of binaries for most software when testing

###  Removed

- Greatly simplified software definitions:
  - The 'prometheus_software_src_version' variables have been removed and instead each software has a single prometheus software version
  - Removed prometheus_software_shortname variables
  - The internal 'prometheus_software_binary_unarchive_opts' variable has been replaced with a task that checks if software archives (tar) contain the software binary in the base or in a subdirectory

## [0.10.3] - 2020-03-04

### Changed

- Upgrade cloudwatch from v0.7.0 to v0.8.0
- Upgrade graphite_exporter from v0.6.2 to v0.7.0
- Upgrade influxdb_exporter from v0.3.0 to v0.4.0
- Upgrade redis_exporter_oliver006 from v1.3.5 to v1.4.0
- Upgrade snmp_exporter v0.16.1 to v0.17.0

## [0.10.2] - 2020-02-14

### Changed

- Upgrade Go from v1.13.6 to v1.13.8
- Upgrade Prometheus from v2.15.2 to v2.16.0
- Upgrade ntp_exporter_sapcc v1.1.0 to v1.1.1

### Fixed

  - Fix problem with starting services when 'prometheus_servers' is not defined

## [0.10.1] - 2020-01-28

### Changed

- Upgrade pushgateway from v1.0.1 to v1.1.0

### Fixed

  - When 'prometheus_purge_orphans' is enabled, do not delete release 'active' version symlinks
  - Set fact 'prometheus_node_exporter_textfiles_directory' so fact is available outside of role. Useful for playbooks that call role, then perform their own actions. This fact was automatically present until version v0.10.0

## [0.10.0] - 2020-01-25

### Added

- promcron script
- promrun script
- sssd_check script

### Changed

- Upgrade Go from v1.13.5 to v1.13.6
- Upgrade statsd_exporter from v0.13.0 to v0.14.1
- Upgrade yum.sh script to commit: '354acdf76a8befc66bfba43df02e155221891e21'
- Upgrade bind_exporter_prometheus_community from commit '103ead78209e9971994fc89ccda69cff555807b9' to v0.3.0
- Download jmx_exporter via HTTPS instead of HTTP

### Fixed

  - Formatting of the CHANGELOG file

## [0.9.4] - 2020-01-07

### Added

- keepalived_exporter_gen2brain

### Changed

- Upgrade Prometheus from v2.15.1 to v2.15.2
- Upgrade bind_exporter_prometheus_community from v0.2.0-dev to commit '103ead78209e9971994fc89ccda69cff555807b9' to fix build problems
- Upgrade smokeping_exporter_superq from v0.1.0 to v0.3.0

## [0.9.3] - 2020-01-05

### Added

- ceph_exporter_digitalocean
- powerdns_exporter_ledgr from pull request of [defenestration](https://github.com/defenestration)

### Changed

- Upgrade Prometheus from v2.14.0 to v2.15.1
- Upgrade pushgateway from v1.0.0 to v1.0.1
- Upgrade process_exporter_ncabatoff from v0.5.0 to v0.6.0
- Upgrade squid_exporter_boynux from v1.8.1 to v1.8.2
- Task "bind_exporter_digitalocean" has been renamed "bind_exporter_prometheus_community"
- Use https://github.com/prometheus-community/bind_exporter as the new upstream provider of bind_exporter
- Improved Jinja formatting

## [0.9.2] - 2019-12-19

### Changed

- Upgrade Go from v1.13.4 to v1.13.5
- Upgrade alertmanager from v0.19.0 to v0.20.0
- Upgrade cloudwatch from v0.6.0 to v0.7.0
- Upgrade consul_exporter from v0.5.0 to v0.6.0
- Upgrade couchbase_exporter_blakelead from v0.9.2 to v0.9.6
- Upgrade postgres_exporter_wrouesnel from v0.7.0 to v0.8.0
- Upgrade redis_exporter_oliver006 from v1.3.4 to v1.3.5
- Upgrade snmp_exporter v0.15.0 to v0.16.1
- Upgrade statsd_exporter from v0.12.2 to v0.13.0

### Fixed

  - Fix adding firewall rules for 'prometheus_additional_exporters'

## [0.9.1] - 2019-11-22

### Changed

- Remove metadata mention of Ubuntu's Disco release to appease Ansible Galaxy which is unaware of the latest Ubuntu releases

## [0.9.0] - 2019-11-22

### Added

- Improve performance of tests
- Ability to install sponge on EL based systems

### Changed

- Upgrade Prometheus from v2.13.1 to v2.14.0
- Upgrade blackbox_exporter v0.15.1 to v0.16.0
- Upgrade ntp_exporter_sapcc v1.0 to v1.0.0
- Upgrade redis_exporter_oliver006 from v1.3.2 to v1.3.4
- Use as the upstream source of all textfiles: https://github.com/prometheus-community/node-exporter-textfile-collector-scripts
- Upgrade apt script to commit: 'd24d180e330f3cafb8f0682df7ea5b19d9d0a89a'
- Upgrade ipmitool script to commit: 'a4121880547f48c0f56a5e4b4c24be72ff633ebf'
- Upgrade multipathd script to commit: 'd2f2b0e95f9a7905a0f2c535555748aa940f6032'
- Upgrade smartmon shell script to commit: '5a48e961343ec0896114f2dc78d1dedbbb310a69'
- Upgrade smartmon python script to commit: '69294bda2bbdd15080288aaad2b29db3f07db6ec'
- Upgrade storcli script to commit: '86018d7fbd2e89f2d062500addbd807bea835707'
- Upgrade kitchen software to latest version (used when testing)
- Only update Ansible Galaxy if Travis CI checks succeed
- Firewalld rules are now managed using rich rules
- The python 'netaddr' module is now a requirement when using Firewalld
- Improve iptables_raw implementation:
   - Improve comment legibility
   - Make ipversion a string instead of an integer (clears warning)
   - Backup changes ahead of implementation

### Fixed

- Merge 3 bug-fixes from f9n
- Tests on EL8 and Fedora 22
- Firewalld support on Ansible 2.9.x has been fixed by switching to rich rules

## [0.8.23] - 2019-11-11

### Changed

- Upgrade Go from v1.13.1 to v1.13.4
- Upgrade Prometheus from v2.13.0 to v2.13.1
- Upgrade postgres_exporter_wrouesnel from v0.5.1 to v0.7.0
- Upgrade pushgateway from v0.10.0 to v1.0.0
- Upgrade redis_exporter_oliver006 from v1.3.1 to v1.3.2

## [0.8.22] - 2019-10-14

### Added

- Retry all downloads up to 5 times

### Changed

- Upgrade Prometheus from v2.12.0 to v2.13.0
- Upgrade cloudwatch from v0.5.0 to v0.6.0
- Upgrade couchbase_exporter_blakelead from v0.9.0 to v0.9.2
   - Binaries are not available fro this release
- Upgrade influxdb_exporter from v0.2.0 to v0.3.0
- Upgrade pushgateway from v0.9.1 to v0.10.0
- Upgrade redis_exporter_oliver006 from v1.2.1 to v1.3.1

## [0.8.21] - 2019-09-25

### Changed

- Upgrade Go from v1.12.9 to v1.13.1
- Upgrade blackbox_exporter v0.14.0 to v0.15.1
- Upgrade redis_exporter_oliver006 from v1.1.1 to v1.2.1
- Upgrade ssl_exporter_ribbybibby from v0.5.0 to v0.6.0

## [0.8.20] - 2019-09-10

### Changed

- Upgrade alertmanager from v0.18.0 to v0.19.0
- Upgrade memcached_exporter from v0.5.0 to v0.6.0
- Upgrade redis_exporter_oliver006 from v1.1.0 to v1.1.1
- Upgrade squid_exporter_boynux from v1.8 to v1.8.1

## [0.8.19] - 2019-08-29

### Changed

- Rename couchbase_exporter_leansysteam to couchbase_exporter_blakelead exporter to match change on github
- Upgrade Go from v1.12.7 to v1.12.9
- Upgrade Prometheus from v2.11.1 to v2.12.0
- Upgrade couchbase_exporter_blakelead from v0.8.1 to v0.9.0
- Upgrade elasticsearch_exporter_justwatchcom from v1.0.2 to v1.1.0
- Upgrade mysqld_exporter from v0.12.0 to v0.12.1
- Upgrade pushgateway from v0.9.0 to v0.9.1
- Upgrade redis_exporter_oliver006 from v1.0.3 to v1.1.0

## [0.8.18] - 2019-07-28

### Changed

- Integrate Galaxy with TravisCI
- Upgrade consul_exporter from v0.4.0 to v0.5.0
- Upgrade pushgateway from v0.8.0 to v0.9.0
- Upgrade statsd_exporter from v0.12.1 to v0.12.2

## [0.8.17] - 2019-07-12

### Changed

- Upgrade mysqld_exporter from v0.11.0 to v0.12.0
- Upgrade postgres_exporter_wrouesnel from v0.5.0 to v0.5.1

## [0.8.16] - 2019-07-11

### Changed

- Upgrade Go from v1.12.6 to v1.12.7
- Upgrade Prometheus from v2.10.0 to v2.11.1
- Upgrade alertmanager from v0.17.0 to v0.18.0
- Upgrade jmx_exporter from v0.11.0 to v0.12.0
- Upgrade postgres_exporter_wrouesnel from v0.4.7 to v0.5.0
- Upgrade statsd_exporter from v0.11.1 to v0.12.1

### Fixed

- Include logrotate.j2 file missing in last release
- Fix versions listed in README.md that had been mixed up

## [0.8.15] - 2019-06-30

### Added

- Support Prometheus software log file rotation. This feature is disabled by default.
- New 'multipathd_info' text_collector_examples script can be installed
- RedHat Enterprise Linux 8 support

### Changed

- Tweaks to clear warnings and errors from Ansible 2.8
- Upgrade Go from v1.12.5 to v1.12.6
- Upgrade apache_exporter_lusitaniae from v0.5.0 to v0.7.0
- Upgrade couchbase_exporter_blakelead from v0.7.0 to v0.8.1
- Upgrade grok_exporter_fstab from v0.2.6 to v0.2.8
- Upgrade redis_exporter_oliver006 from v1.0.0 to v1.0.3
- Upgrade statsd_exporter from v0.10.4 to v0.11.1
- Upgrade apt script to commit: 03f0b4db9fc49f0c888d469ed142ed89233f08c3
- Upgrade btrfs_stats script to commit: dfb6002fad073a66f0439e0d620f4e4a8e963ec2
- Upgrade md_info_detail script to commit: bd3fc09b30e9401746f76d0d3980a3e894c5d012
- Upgrade storcli script to commit: b3429e4a974f362af007e23cb9a539cecc024d45
- Install tar on ArchLinux if not present

## [0.8.14] - 2019-06-06

### Changed

- Numerous tweaks to clear warnings and errors from Ansible 2.8
- Upgrade Prometheus from v2.9.2 to v2.10.0
- Upgrade graphite_exporter from v0.5.0 to v0.6.2
- Upgrade node_exporter v0.18.0 to v0.18.1
- Upgrade redis_exporter_oliver006 from v0.34.1 to v1.0.0
- Upgrade statsd_exporter from v0.10.3 to v0.10.4

## [0.8.13] - 2019-05-20

### Changed
- Upgrade node_exporter v0.17.0 to v0.18.0
- Upgrade redis_exporter_oliver006 from v0.34.0 to v0.34.1
- Upgrade squid_exporter_boynux from v1.7 to v1.8
- Upgrade statsd_exporter from v0.9.0 to v0.10.3

## [0.8.12] - 2019-05-08

### Added

- New 'nvme_metrics.sh' text_collector_examples script can be installed
- Exporters
   - ntp_exporter_sapcc

### Changed

- Upgrade Go from v1.12.2 to v1.12.5
- Upgrade Prometheus from v2.8.1 to v2.9.2
- Upgrade alertmanager from v0.16.2 to v0.17.0
- Upgrade process_exporter_ncabatoff from v0.4.0 to v0.5.0
- Upgrade pushgateway from v0.7.0 to v0.8.0
- Upgrade redis_exporter_oliver006 from v0.32.0 to v0.34.0
- Upgrade squid_exporter_boynux from v1.6 to v1.7

## [0.8.11] - 2019-04-07

### Changed

- Upgrade Go from v1.12.1 to v1.12.2
- Upgrade Prometheus from v2.8.0 to v2.8.1
- Upgrade alertmanager from v0.16.1 to v0.16.2
- Upgrade redis_exporter_oliver006 from v0.30.0 to v0.32.0
- Upgrade ssl_exporter_ribbybibby from v0.3.0 to v0.5.0

## [0.8.10] - 2019-03-17

### Changed

- Upgrade Go from v1.12 to v1.12.1
- Upgrade Prometheus from v2.7.2 to v2.8.0
- Upgrade blackbox_exporter v0.13.0 to v0.14.0
- Upgrade squid_exporter_boynux from v1.4 to v1.6
- Upgrade statsd_exporter v0.8.1 to v0.9.0

## [0.8.9] - 2019-03-02

### Added

- New 'inotify_instances' text_collector_examples script can be installed
- New 'smartmon.py' text_collector_examples script can be installed
- New 'yum.sh' text_collector_examples script can be installed

### Changed

- Upgrade influxdb_exporter from v0.1.0 to v0.2.0
- Upgrade ipmitool text script to commit 83c9b117471dba863619886f2d30ff4ef92ff7b4
- Upgrade Go from v1.11.5 to v1.12.0
- Upgrade graphite_exporter from v0.4.2 to v0.5.0
- Upgrade Prometheus from v2.7.1 to v2.7.2
- Upgrade redis_exporter_oliver006 from v0.28.0 to v0.30.0

## [0.8.8] - 2019-02-17

### Added

- New 'md_info_detail' text_collector_examples script can be installed

### Changed

- Rename couchbase_exporter_blakelead exporter to couchbase_exporter_leansysteam to match change on github
- Upgrade ssl_exporter_ribbybibby from v0.2.0 to v0.3.0
- Upgrade snmp_exporter v0.14.0 to v0.15.0
- Upgrade smartmon text script to commit 1ba436e1949c7ab8af83642dc973cb30b118966a

## [0.8.7] - 2019-02-02

### Changed

- Upgrade alertmanager from v0.16.0 to v0.16.1
- Upgrade Prometheus from v2.6.1 to v2.7.1
- Upgrade redis_exporter_oliver006 from v0.27.0 to v0.28.0

## [0.8.6] - 2019-01-24

### Changed

- Upgrade Go from v1.11.4 to v1.11.5
- Upgrade alertmanager from v0.15.3 to v0.16.0
- Upgrade redis_exporter_oliver006 from v0.26.0 to v0.27.0

## [0.8.5] - 2019-01-20

### Changed

- Upgrade Prometheus from v2.6.0 to v2.6.1
- Upgrade haproxy_exporter from v0.9.0 to v0.10.0
- Upgrade jmx_exporter from v0.3.1 to v0.11.0
- Upgrade sql_exporter_free from v0.4 to v0.5
- Upgrade redis_exporter_oliver006 from v0.25.0 to v0.26.0

## [0.8.4] - 2019-01-08

### Added

- New 'btrfs_stats.py' text_collector_examples script can be installed

### Changed

- Upgrade couchbase_exporter_blakelead from v0.6.0 to v0.7.0
- Upgrade redis_exporter_oliver006 from v0.23.0 to v0.25.0

### Fixed

- Use Ansible 'shell' module and expand paths when looking for 'setcap' binary when validating 'setcap' installation. Binary is sometimes outside of an unprivileged user's path

## [0.8.3] - 2018-12-19

### Changed

- Upgrade Prometheus from v2.5.0 to v2.6.0
- Prefer Prometheus' roles instance of Go over any system version of Go

### Fixed

- Fix GOROOT env variable in cases where multiple versions of Go are installed

## [0.8.2] - 2018-12-16

### Changed

- Upgrade Go from v1.11.2 to v1.11.3
- Upgrade Go from v1.11.3 to v1.11.4
- Install capabilities libraries where necessary to allow the following exporters to work without running as root:
   - blackbox_exporter
   - ping_exporter_czerwonk
   - smokeping_exporter_superq

### Fixed

- Building bind_exporter_digitalocean on EL7 with SELinux enabled
- Fix firewall management when more than one exporter is enabled

## [0.8.1] - 2018-12-11

### Changed

- Fix all references of 'smokeping_prober_superq' to 'smokeping_exporter_superq'

## [0.8.0] - 2018-12-10

### Added

- 'sponge' is installed to facilitate getting text to node_exporter
- All text_collector_examples scripts can be installed
- Exporters
   - 389ds_exporter_terrycain
   - bigip_exporter_expressenab
   - iptables_exporter_retailnext
   - nvidia_exporter_bugroger
   - openldap_exporter_tomcz
   - openvpn_exporter_kumina
   - ping_exporter_czerwonk
   - script_exporter_adhocteam
   - smokeping_prober_superq
   - ssl_exporter_ribbybibby
- Test blackbox_exporter configurations when adding new config or reloading
- Test snmp_exporter configurations when adding new config or reloading
- Optionally add iptables firewall rules via iptables_raw module

### Changed

- Upgrade blackbox_exporter v0.12.0 to v0.13.0
- Upgrade couchbase_exporter_blakelead v0.5.2 to v0.6.0
- Upgrade pushgateway from v0.6.0 to v0.7.0
- Upgrade snmp_exporter v0.13.0 to v0.14.0
- Upgrade statsd_exporter v0.8.0 to v0.8.1
- The prometheus tmp directory is deleted and remade after each build to ensure it is clean for the next build

### Fixed

- Firewall rules are created correctly when there are multiple instances of an exporter
- Support command line arguments that contain double quotes (like the node_exporter example) when using OpenRC
- Fix PID generation for Upstart when there are multiple instances of an exporter
- Numerous builds under Alpine when using musl

## [0.7.7] - 2018-12-05

### Changed

- Upgrade redis_exporter_oliver006 from v0.22.1 to v0.23.0

## [0.7.6] - 2018-12-01

### Changed

- Upgrade graphite_exporter v0.4.1 to v0.4.2
- Upgrade node_exporter v0.16.0 to v0.17.0

## [0.7.5] - 2018-11-24

### Changed

- Upgrade couchbase_exporter_blakelead v0.5.0 to v0.5.2
- Upgrade graphite_exporter v0.3.0 to v0.4.1

## [0.7.4] - 2018-11-18

### Fixed

- Ansible Galaxy metadata fixes, don't specify Fedora 29 (released) and Ubuntu Disco (pre-release) as Galaxy's validation tool hasn't been updated

## [0.7.3] - 2018-11-18

### Fixed

- Ansible Galaxy metadata fixes

## [0.7.2] - 2018-11-18

### Changed

- Upgrade couchdb_exporter_gesellix from v17 to v18
- Upgrade postgres_exporter_wrouesnel from v0.4.6 to v0.4.7
- Upgrade redis_exporter_oliver006 from v0.22.0 to v0.22.1

## [0.7.1] - 2018-11-09

### Changed

- Upgrade Alertmanager from v0.15.2 to v0.15.3
- Upgrade couchdb_exporter_gesellix from v16 to v17
- Upgrade redis_exporter_oliver006 from v0.21.2 to v0.22.0
- Manually define the versions of tools used for testing

### Fixed

- couchbase_exporter_blakelead build now has sample metric json files
- All tests now succeed after performing all builds

## [0.7.0] - 2018-11-08

### Added

- New exporters
   - bind_exporter_digitalocean
   - couchbase_exporter_blakelead
   - couchdb_exporter_gesellix
   - proxysql_exporter_percona
   - redis_exporter_oliver006
- Add support for HAProxy metrics via socket using a new options:
   'prometheus_haproxy_exporter_socket'
- Add support for managing ~/.my.cnf file for mysqld_exporter

### Changed

- Upgrade Prometheus from v2.4.3 to v2.5.0
- Use 'get_url' to download each archive, 'unarchive' to extract each archive, and then 'file' for cleanup. Using 'unarchive' alone was too limiting as 'unarchive' doesn't support redirects and many of the other features of get_url

### Fixed

- Support command line arguments that contain double quotes (like the node_exporter example)
- kafka_exporter_danielqsj, pushgateway, rabbitmq_exporter_kbudde, and sql_exporter_free  make commands when building from source

## [0.6.0] - 2018-11-03

### Changed

- Upgrade Go from v1.11.1 to v1.11.2
- Upgrade squid_exporter_boynux from v1.2 to v1.4
- Configure tgroup files after an exporter is running instead of after the
   exporter is installed. This ensures Prometheus servers never poll exporters
   that haven't been started.

### Fixed

- Run tgroup file creation tasks serially
- Clarify boolean 'when:' checks in tasks, fixes cases where a text boolean
   is set

## [0.5.0] - 2018-10-25

### Added

- Add service 'reload' support to alertmanager and prometheus. Causes processes to reload configuration files without restarting processes
- Validate alertmanager and prometheus configuration files before starting services
- Optionally verify that the Prometheus server/s can reach each exporter service
- Optionally add iptables or firewalld firewall rules to permit Prometheus server/s to reach exporter/s
- Symlink amtool and promtool to /usr/local/bin
- Ability to manage tgroups via the client (push to server) or from the server based on hostvars
- Ability to purge orphaned tgroup files. Clients can purge tgroup files from retired exporters and servers can purge all retired clients and retired client exporter tgroup files

### Changed

- Upgrade grok_exporter_fstab from v0.2.5 to v0.2.6
- Upgrade memcached_exporter from v0.4.1 to v0.5.0
- Upgrade pushgateway from v0.5.2 to v0.6.0
- Upgrade statsd_exporter from v0.7.0 to v0.8.0
- Systemd based processes now maintain a PID file. Useful for sending
   kill -HUP and other signals via scripts and consistent with OpenRC and
   upstart implementations
- Ubuntu on non-RHEL systems no longer starts software inside of a bash instance

### Fixed

- When building Prometheus software from source, prioritize this role's
   copy/version of Go over the system's copy/version of Go
- Formatting; indents and extra newlines; in OpenRC and upstart configs
- Software not run as 'root' or 'prometheus' may have been unable to write
   logs on upstart and OpenRC based systems. The log file is now created
   with the correct permissions ahead of starting the service

## [0.4.3] - 2018-10-07

### Changed

- Upgrade Prometheus from v2.4.2 to v2.4.3
- Upgrade Go from v1.10.4 to v1.11.1

## [0.4.2] - 2018-09-30

### Changed

- Upgrade squid_exporter_boynux from v1.0 to v1.2

## [0.4.1] - 2018-09-22

### Fixed

- Travis CI awesome_bot checks were failing on 'localhost' URLs in the 
   README.md file

## [0.4.0] - 2018-09-22

### Added

- Exporters
   - apache_exporter_lusitaniae
   - cloudwatch_exporter
   - digitalocean_exporter_metalmatze
   - elasticsearch_exporter_justwatchcom
   - grok_exporter_fstab
   - nvidia_gpu_exporter_mindprince
   - rabbitmq_exporter_kbudde
   - sql_exporter_free
   - squid_exporter_boynux
- Allow adding environmental variables to any/all exporters
- Inspec tests for all software
- Inspec tests to validate /metrics content for most exporters
- Add TravisCI to ensure all software is inspec tested
- Add support for source and binaries in Zip files
- Add support for building source from a github commit
- Add function to remove retired Prometheus services (_remove_service.yml)

### Changed

- Failing systemd services now restart every 60 seconds instead of 10 seconds
- Upgrade prometheus from v2.3.2 to v2.4.1
- Upgrade snmp_exporter from v0.12.0 to v0.13.0

### Fixed

- haproxy_exporter default port

## [0.3.0] - 2018-09-06

### Added

- Expand inspec tests for pushgateway, node_exporter, and expanded 'prometheus' tests
- Symlink for latest jmx_exporter to 'jmx_exporter.jar' inside installation directory
- Symlink from latest software installation versioned directory to 'active' in the same directory installation root directory

### Changed

- Upgrade process_exporter_ncabatoff from v0.3.9 to v0.4.0

### Fixed

- Installation of latest process-exporter_ncabatoff on Alpine

## [0.2.2] - 2018-08-30

### Fixed

- Numerous documentation fixes

## [0.2.1] - 2018-08-29

### Fixed

- Syntax error in tasks/main.yml, artifact from merge

## [0.2.0] - 2018-08-29

### Added

- Expand supported versions of Ansible to 2.5.1
- Expand documentation
- Test on more versions of Amazon Linux

### Changed

- Upgrade process_exporter_ncabatoff from v0.2.12 to v0.3.9

### Fixed

- mysqld_exporter default port
- Small variable bug which caused source builds to fail

## [0.1.0] - 2018-08-28

### Added

- Initial release
