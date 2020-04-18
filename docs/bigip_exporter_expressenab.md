# BigIP exporter (ExpressenAB) configuration

To enable [bigip_exporter by ExpressenAB](https://github.com/ExpressenAB/bigip_exporter) include role task: bigip_exporter_expressenab

An array of additional flags to pass to the bigip_exporter daemon (ie):

    prometheus_bigip_exporter_expressenab_extra_opts: []
     - '--bigip.host 1.1.1.1'
     - '--bigip.port 443'
     - '--exporter.config my_config_file.yml'

Environmental variables can also be used to configure the bigip_exporter daemon:

    prometheus_bigip_exporter_expressenab_env_vars:
      BE_BIGIP_HOST: 1.1.1.1
      BE_BIGIP_PORT: 443

The version of bigip_exporter_expressenab to install. The default version can be found in the [bigip_exporter_expressenab variables file](../vars/software/bigip_exporter_expressenab.yml) and the default version can be overridden using the following variable:

    prometheus_bigip_exporter_expressenab_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_bigip_exporter_expressenab_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9142:

    prometheus_bigip_exporter_expressenab_host: "0.0.0.0"
    prometheus_bigip_exporter_expressenab_port: 9142
