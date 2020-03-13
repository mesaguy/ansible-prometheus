# Apache exporter (Lusitaniae) configuration

To enable [apache_exporter by Lusitaniae](https://github.com/Lusitaniae/apache_exporter) include role task: apache_exporter_lusitaniae

An array of additional flags to pass to the apache_exporter daemon (ie):

    prometheus_apache_exporter_lusitaniae_extra_opts:
      - '-scrape_uri=http://localhost/server-status/?auto'

The version of apache_exporter to install. The source version defines the version as specified in version control:

    prometheus_apache_exporter_lusitaniae_version: "0.7.0"
    prometheus_apache_exporter_lusitaniae_src_version: "v0.7.0"

Port and IP to listen on. Defaults to listening on all available IPs on port 9117:

    prometheus_apache_exporter_lusitaniae_host: "0.0.0.0"
    prometheus_apache_exporter_lusitaniae_port: 9117
