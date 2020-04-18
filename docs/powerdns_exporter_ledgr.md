# Powerdns exporter (ledgr) configuration

To enable [powerdns_exporter_ledgr](https://github.com/ledgr/powerdns_exporter), include the role task: `powerdns_exporter_ledgr`

Powerdns setup requires webserver and API options to be set, see README in that repo.

The following options are configurable for the api_url and api_key needed to connect to the powerdns api. 

    prometheus_powerdns_exporter_ledgr_api_url: '{{prometheus_powerdns_exporter_ledgr_api_url | default("http://localhost:8081/api/v1/") }}'
    prometheus_powerdns_exporter_ledgr_api_key: '{{prometheus_powerdns_exporter_ledgr_api_key | default("") }}'

The version of powerdns_exporter_ledgr to install. The default version can be found in the [powerdns_exporter_ledgr variables file](../vars/software/powerdns_exporter_ledgr.yml) and the default version can be overridden using the following variable:

    prometheus_powerdns_exporter_ledgr_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_powerdns_exporter_ledgr_use_prerelease: true
