# NTP exporter (sapcc) configuration

To enable [ntp_exporter by sapcc](https://github.com/sapcc/ntp_exporter) include role task: ntp_exporter_sapcc

An array of additional flags to pass to the ntp_exporter daemon, the '-ntp.server' variable is manditory:

    prometheus_ntp_exporter_sapcc_extra_opts:
      - '-ntp.server=time-a-g.nist.gov'

The version of ntp_exporter to install. The source version defines the version as specified in version control:

    prometheus_ntp_exporter_sapcc_version: "v1.1.1"

Port and IP to listen on. Defaults to listening on all available IPs on port 9559:

    prometheus_ntp_exporter_sapcc_host: "0.0.0.0"
    prometheus_ntp_exporter_sapcc_port: 9559
