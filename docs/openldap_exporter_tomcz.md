# OpenLDAP exporter (tomcz) configuration

To enable [openldap_exporter by tomcz](https://github.com/tomcz/openldap_exporter) include role task: openldap_exporter_tomcz

An array of additional flags to pass to the openldap_exporter daemon (ie):

    prometheus_openldap_exporter_tomcz_extra_opts: []

The version of openldap_exporter to install. The source version defines the version as specified in version control:

    prometheus_openldap_exporter_tomcz_version: "1.0"
    prometheus_openldap_exporter_tomcz_src_version: "v1.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9330:

    prometheus_openldap_exporter_tomcz_host: "0.0.0.0"
    prometheus_openldap_exporter_tomcz_port: 9330
