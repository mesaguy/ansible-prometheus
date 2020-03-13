# 389ds exporter (terrycain) configuration

To enable [389ds_exporter by terrycain](https://github.com/terrycain/389ds_exporter) include role task: 389ds_exporter_terrycain

:warning: Your LDAP password is given to the exporter as a command line argument and is visible to all via 'ps', etc. This exporter does not support storing the LDAP password in a configuration file. If access to the 389ds server is sufficiently limited, then this security exposure is reduced, but still present.

An array of additional flags to pass to the 389ds_exporter daemon (ie):

    prometheus_389ds_exporter_terrycain_extra_opts:
     - '-ldap.pass=test'
     - '-ipa-domain=test'

The version of 389ds_exporter to install. The source version defines the version as specified in version control:

    prometheus_389ds_exporter_terrycain_version: "0.1.2"
    prometheus_389ds_exporter_terrycain_src_version: "v0.1.2"

Port and IP to listen on. Defaults to listening on all available IPs on port 9496:

    prometheus_389ds_exporter_terrycain_host: "0.0.0.0"
    prometheus_389ds_exporter_terrycain_port: 9496

