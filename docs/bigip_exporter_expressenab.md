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

The version of bigip_exporter to install. The source version defines the version as specified in version control:

    prometheus_bigip_exporter_expressenab_version: "1.0.0"
    prometheus_bigip_exporter_expressenab_src_version: "v1.0.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9142:

    prometheus_bigip_exporter_expressenab_host: "0.0.0.0"
    prometheus_bigip_exporter_expressenab_port: 9142
