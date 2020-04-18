# OpenLDAP exporter (tomcz) configuration

To enable [openldap_exporter by tomcz](https://github.com/tomcz/openldap_exporter) include role task: openldap_exporter_tomcz

An array of additional flags to pass to the openldap_exporter daemon (ie):

    prometheus_openldap_exporter_tomcz_extra_opts: []

The version of openldap_exporter_tomcz to install. The default version can be found in the [openldap_exporter_tomcz variables file](../vars/software/openldap_exporter_tomcz.yml) and the default version can be overridden using the following variable:

    prometheus_openldap_exporter_tomcz_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_openldap_exporter_tomcz_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9330:

    prometheus_openldap_exporter_tomcz_host: "0.0.0.0"
    prometheus_openldap_exporter_tomcz_port: 9330
