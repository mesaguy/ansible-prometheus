# NTP exporter (sapcc) configuration

To enable [ntp_exporter by sapcc](https://github.com/sapcc/ntp_exporter) include role task: ntp_exporter_sapcc

An array of additional flags to pass to the ntp_exporter daemon, the '-ntp.server' variable is manditory:

    prometheus_ntp_exporter_sapcc_extra_opts:
      - '-ntp.server=time-a-g.nist.gov'

The version of ntp_exporter_sapcc to install. The default version can be found in the [ntp_exporter_sapcc variables file](../vars/software/ntp_exporter_sapcc.yml) and the default version can be overridden using the following variable:

    prometheus_ntp_exporter_sapcc_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_ntp_exporter_sapcc_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9559:

    prometheus_ntp_exporter_sapcc_host: "0.0.0.0"
    prometheus_ntp_exporter_sapcc_port: 9559
