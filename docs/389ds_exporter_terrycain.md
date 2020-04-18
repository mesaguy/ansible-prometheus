# 389ds exporter (terrycain) configuration

To enable [389ds_exporter by terrycain](https://github.com/terrycain/389ds_exporter) include role task: 389ds_exporter_terrycain

:warning: Your LDAP password is given to the exporter as a command line argument and is visible to all via 'ps', etc. This exporter does not support storing the LDAP password in a configuration file. If access to the 389ds server is sufficiently limited, then this security exposure is reduced, but still present.

An array of additional flags to pass to the 389ds_exporter daemon (ie):

    prometheus_389ds_exporter_terrycain_extra_opts:
     - '-ldap.pass=test'
     - '-ipa-domain=test'

The version of 389ds_exporter_terrycain to install. The default version can be found in the [389ds_exporter_terrycain variables file](../vars/software/389ds_exporter_terrycain.yml) and the default version can be overridden using the following variable:

    prometheus_389ds_exporter_terrycain_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_389ds_exporter_terrycain_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9496:

    prometheus_389ds_exporter_terrycain_host: "0.0.0.0"
    prometheus_389ds_exporter_terrycain_port: 9496

