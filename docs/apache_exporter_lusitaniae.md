# Apache exporter (Lusitaniae) configuration

To enable [apache_exporter by Lusitaniae](https://github.com/Lusitaniae/apache_exporter) include role task: apache_exporter_lusitaniae

An array of additional flags to pass to the apache_exporter daemon (ie):

    prometheus_apache_exporter_lusitaniae_extra_opts:
      - '--scrape_uri=http://localhost/server-status/?auto'

The version of apache_exporter_lusitaniae to install. The default version can be found in the [apache_exporter_lusitaniae variables file](../vars/software/apache_exporter_lusitaniae.yml) and the default version can be overridden using the following variable:

    prometheus_apache_exporter_lusitaniae_version: "v1.0.0"

Allow the use of prerelease versions (beta, test, development, etc versions), defaults to 'false':

    prometheus_apache_exporter_lusitaniae_use_prerelease: true

Port and IP to listen on. Defaults to listening on all available IPs on port 9117:

    prometheus_apache_exporter_lusitaniae_host: "0.0.0.0"
    prometheus_apache_exporter_lusitaniae_port: 9117
