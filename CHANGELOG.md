# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.7.5] - 2018-11-24

### Changed
 - Upgrade couchbase_exporter_blakelead v0.5.0 to v0.5.2
 - Upgrade graphite_exporter v0.3.0 to v0.4.1

## [0.7.4] - 2018-11-18

### Fixed
 - Ansible Galaxy metadata fixes, don't specify Fedora 29 (released) and
   Ubuntu Disco (pre-release) as Galaxy's validation tool hasn't been updated

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
 - Use 'get_url' to download each archive, 'unarchive' to extract each archive, and
   then 'file' for cleanup. Using 'unarchive' alone was too limiting as 'unarchive'
   doesn't support redirects and many of the other features of get_url

### Fixed
 - Support command line arguments that contain double quotes (like the node_exporter
   example)
 - kafka_exporter_danielqsj, pushgateway, rabbitmq_exporter_kbudde, and
   sql_exporter_free  make commands when building from source

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
 - Add service 'reload' support to alertmanager and prometheus. Causes
   processes to reload configuration files without restarting processes
 - Validate alertmanager and prometheus configuration files before
   starting services
 - Optionally verify that the Prometheus server/s can reach each exporter
   service
 - Optionally add iptables or firewalld firewall rules to permit Prometheus
   server/s to reach exporter/s
 - Symlink amtool and promtool to /usr/local/bin
 - Ability to manage tgroups via the client (push to server) or from the
   server based on hostvars
 - Ability to purge orphaned tgroup files. Clients can purge tgroup files
   from retired exporters and servers can purge all retired clients and
   retired client exporter tgroup files

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
 - Upgrade process_exporter_ncabatoff from v0.3.9 to v4.0.0

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
