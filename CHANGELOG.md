# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
